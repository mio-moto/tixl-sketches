// CC0: Starry planes
//  Revisited ye olde "plane-marcher".
//  A simple result that I think turned out pretty nice
cbuffer Resolution : register(b0) {
  int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
  float Time;
}
#define TIME        Time
#define RESOLUTION  Resolution

#define ROT(a)      float2x2(cos(a), sin(a), -sin(a), cos(a))

static float
  pi        = acos(-1.)
, tau       = 2.*pi
, planeDist = .5
, furthest  = 16.
, fadeFrom  = 8.
;

static float2 
  pathA = float2(.31, .41)
, pathB = float2(1.0,sqrt(0.5))
;

static float4 
  U = float4(0, 1, 2, 3)
  ;
  
// License: Unknown, author: Matt Taylor (https://github.com/64), found: https://64.github.io/tonemapping/
float3 aces_approx(float3 v) {
  v = max(v, 0.0);
  v *= 0.6;
  float a = 2.51;
  float b = 0.03;
  float c = 2.43;
  float d = 0.59;
  float e = 0.14;
  return clamp((v*(a*v+b))/(v*(c*v+d)+e), 0.0, 1.0);
}

float3 offset(float z) {
  return float3(pathB*sin(pathA*z), z);
}

float3 doffset(float z) {
  return float3(pathA*pathB*cos(pathA*z), 1.0);
}

float3 ddoffset(float z) {
  return float3(-pathA*pathA*pathB*sin(pathA*z), 0.0);
}

float4 alphaBlend(float4 back, float4 front) {
  // Based on: https://en.wikipedia.org/wiki/Alpha_compositing
  float w = front.w + back.w*(1.0-front.w);
  float3 xyz = (front.xyz*front.w + back.xyz*back.w*(1.0-front.w))/w;
  return w > 0.0 ? float4(xyz, w) : float4(0, 0, 0, 0);
}

// License: MIT, author: Inigo Quilez, found: https://www.iquilezles.org/www/articles/smin/smin.htm
float pmin(float a, float b, float k) {
  float h = clamp(0.5+0.5*(b-a)/k, 0.0, 1.0);
  return lerp(b, a, h) - k*h*(1.0-h);
}

float pmax(float a, float b, float k) {
  return -pmin(-a, -b, k);
}

float pabs(float a, float k) {
  return -pmin(a, -a, k);
}

// License: MIT, author: Inigo Quilez, found: https://iquilezles.org/articles/distfunctions2d/
//   Slightly tweaked to round the inner corners
float star5(float2 p, float r, float rf, float sm) {
  p = -p;
  const float2 k1 = float2(0.809016994375, -0.587785252292);
  const float2 k2 = float2(-k1.x,k1.y);
  p.x = abs(p.x);
  p -= 2.0*max(dot(k1,p),0.0)*k1;
  p -= 2.0*max(dot(k2,p),0.0)*k2;
  p.x = pabs(p.x, sm);
  p.y -= r;
  float2 ba = rf*float2(-k1.y,k1.x) - float2(0,1);
  float h = clamp( dot(p,ba)/dot(ba,ba), 0.0, r );
  return length(p-ba*h) * sign(p.y*ba.x-p.x*ba.y);
}

float3 palette(float n) {
  return 0.5+0.5*sin(float3(0.,1.,2.)+n);
}

float4 plane(float3 ro, float3 rd, float3 pp, float3 npp, float pd, float3 cp, float3 off, float n) {

  float aa = 3.*pd*distance(pp.xy, npp.xy);
  float4 col = float4(0, 0, 0, 0);
  float2 p2 = pp.xy;
  p2 -= offset(pp.z).xy;
  float2 doff   = ddoffset(pp.z).xz;
  float2 ddoff  = doffset(pp.z).xz;
  float dd = dot(doff, ddoff);
  p2 = mul(p2, ROT(dd*pi*5.));

  float d0 = star5(p2, 0.45, 1.6,0.2)-0.02;
  float d1 = d0-0.01;
  float d2 = length(p2);
  const float colp = pi*100.;
  float colaa = aa*200.;
  
  col.xyz = palette(0.5*n+2.*d2)*lerp(0.5/(d2*d2), 1., smoothstep(-0.5+colaa, 0.5+colaa, sin(d2*colp)))/max(3.*d2*d2, 1E-1);
  col.xyz = lerp(col.xyz, float3(2., 2., 2.), smoothstep(aa, -aa, d1)); 
  col.w = smoothstep(aa, -aa, -d0);
  return col;

}

float3 color(float3 ww, float3 uu, float3 vv, float3 ro, float2 p) {
  float lp = length(p);
  float2 np = p + 1./RESOLUTION.xy;
  float rdd = 2.0-0.25;
  
  float3 rd = normalize(p.x*uu + p.y*vv + rdd*ww);
  float3 nrd = normalize(np.x*uu + np.y*vv + rdd*ww);

  float nz = floor(ro.z / planeDist);

  float4 acol = float4(0, 0, 0, 0);

  float3 aro = ro;
  float apd = 0.0;

  for (float i = 1.; i <= furthest; ++i) {
    if ( acol.w > 0.95) {
      // Debug col to see when exiting
      // acol.xyz = palette(i); 
      break;
    }
    float pz = planeDist*nz + planeDist*i;

    float lpd = (pz - aro.z)/rd.z;
    float npd = (pz - aro.z)/nrd.z;
    float cpd = (pz - aro.z)/ww.z;

    {
      float3 pp = aro + rd*lpd;
      float3 npp= aro + nrd*npd;
      float3 cp = aro+ww*cpd;

      apd += lpd;

      float3 off = offset(pp.z);

      float dz = pp.z-ro.z;
      float fadeIn = smoothstep(planeDist*furthest, planeDist*fadeFrom, dz);
      float fadeOut = smoothstep(0., planeDist*.1, dz);
      float fadeOutRI = smoothstep(0., planeDist*1.0, dz);

      float ri = lerp(1.0, 0.9, fadeOutRI*fadeIn);

      float4 pcol = plane(ro, rd, pp, npp, apd, cp, off, nz+i);

      pcol.w *= fadeOut*fadeIn;
      acol = alphaBlend(pcol, acol);
      aro = pp;
    }
    
  }

  return acol.xyz*acol.w;

}

float4 psMain( float4 fragCoord : SV_Position ) : SV_Target {
  float2 r = RESOLUTION.xy, q = fragCoord.xy/r, pp = -1.0+2.0*q, p = pp;
  p.x *= r.x/r.y;

  float tm  = planeDist*TIME;

  float3 ro   = offset(tm);
  float3 dro  = doffset(tm);
  float3 ddro = ddoffset(tm);

  float3 ww = normalize(dro);
  float3 uu = normalize(cross(U.xyx+ddro, ww));
  float3 vv = cross(ww, uu);
  
  float3 col = color(ww, uu, vv, ro, p);
  col = aces_approx(col);
  col = sqrt(col);
  return float4(col, 1);
}


