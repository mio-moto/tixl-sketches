/* Dream Zoom by NR4
 *
 * Copyright (C) 2026 Alexander Kraus <nr4@z10.info>
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

cbuffer Resolution : register(b0) {
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

static float iLastSwitchTime = 0.;
static int iPalette = 19;
static float iFeedbackAmount = 0.;
static int iCoordinates = 2;
static float iCoordinateScale = 0.77;
static float iCMAPScale = 85.11;
static float iCMAPOffset = 5.43;
static float2 iTrapOffset = float2(0.04, -1.2);
static float iTrapParam = 10.69;
static float iTrapRadius = 10.72;
static int iTrap = 2;
static int iFormula = 0;
static float2 iOrigin = float2(34.132, -9.922); 
static float2 iConstantMapOffset = float2(3.04, -2.36);
static float iFormulalerp = 0.25;
static float2 iOffset = float2(-1252.38, -1818.59);
static int iSampleCount = 2;
static float iJacobiRepeats = 1.;
static float iPumpAmont = .2;
static const float iZoomSpeed = 0.1;
static float iRotationSpeed = 0.;
static const float iBlendTime = 1.;
static float iGlobalRotationSpeed = .1;

static float bpm = 125.;
static float spb;
static float stepTime;
static float nbeats;
static float scale;
static float hardBeats;
static float syncTime;
static float2 uv0;

static float3 c = float3(1.,0.,-1.);
static const float pi = 3.14159;

float mod(float x, float y) { return x - y * floor(x / y); }
float2 mod(float2 x, float2 y) { return x - y * floor(x / y); }
float3 mod(float3 x, float3 y) { return x - y * floor(x / y); }
float4 mod(float4 x, float4 y) { return x - y * floor(x / y); }


float3 cmap(float t) {
    return float3(0.19, 0.24, 0.40)
        +t*(float3(3.42, -1.41, 4.13)
        +t*(float3(-21.95, 22.09, -7.62)
        +t*(float3(66.28, -51.41, -6.87)
        +t*(float3(-80.01, 41.55, 23.40)
        +t*(float3(33.21, -11.33, -11.18)
        +t*(float3(-0.94, 0.52, -1.86)
    ))))));
}

// Created by David Hoskins and licensed under MIT.
// See https://www.shadertoy.com/view/4djSRW.
// float2->float hash function
float hash12(float2 p)
{
    float3 p3  = frac(float3(p.xyx) * .1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return frac((p3.x + p3.y) * p3.z);
}
// End of David Hoskins' MIT licensed code

// Written by Fabrice Neyret and CC-BY-SA-NC 4.0 unported.
// https://www.shadertoy.com/view/llsfRj
float2 Moebius(float2 p, float2 z1, float2 z2)
{
    z1 = p - z1; p -= z2;
    return mul(p, float2x2(z1,z1.y,-z1.x)) / dot(p, p);
}

float2 spiralZoom(float2 p, float2 offs, float n, float spiral, float zoom, float2 phase)
{
    p -= offs;
    float a = atan2(p.y, p.x)/6.283 + syncTime/32.;
    float d = length(p);
    return mul(float2(a, log(d)), float2x2(n,1, spiral,-zoom)) + phase;
}
// End of Fabrice's CC-BY-SA-NC 4.0 Unported code.

float2 cis(float a){
    a = mod(a, 2. * pi);
    return float2(cos(a), sin(a));
}

float2 cmul(float2 a, float2 b) {
    return float2( a.x * b.x - a.y * b.y, a.x * b.y + a.y * b.x);
}

float2 cdiv(float2 a, float2 b) {
    return float2(dot(a, b), a.y * b.x - a.x * b.y) / dot(b, b);
}

float2 clog(float2 a) {
    return float2(log(length(a)),atan2(a.y,a.x));
}

float2 cinv(float2 a) {
    return float2(a.x, -a.y) / dot(a, a);
}

float2 csine(float2 a) {
    return float2(sin(a.x) * cosh(a.y), cos(a.x) * sinh(a.y));
}

float2 cexp(float2 x) {
    return min(exp(x.x), 2.e4) * cis(x.y);
}

// By mla, https://www.shadertoy.com/view/4tlBRl, CC-NC-BY-SA 4.0 unported
// Taken from Numerical Recipes, simplified by using a fixed number
// of iterations and removing negative modulus case.
// Modulus is passed in as k^2 (not 1-k^2 as in NR).
void sncndn(float u, float k2,
            out float sn, out float cn, out float dn) {
  float emc = 1.0-k2;
  float a = 0,b = 0,c = 0;
  const int N = 4;
  float em[N],en[N];
  a = 1.0;
  dn = 1.0;
  for (int i = 0; i < N; i++) {
    em[i] = a;
    emc = sqrt(emc);
    en[i] = emc;
    c = 0.5*(a+emc);
    emc = a*emc;
    a = c;
  }
  // Nothing up to here depends on u, so
  // could be precalculated.
  u = c*u; sn = sin(u); cn = cos(u);
  if (sn != 0.0) {
    a = cn/sn; c = a*c;
    for(int i = N-1; i >= 0; i--) {
      b = em[i];
      a = c*a;
      c = dn*c;
      dn = (en[i]+a)/(b+a);
      a = c/b;
    }
    a = 1.0/sqrt(c*c + 1.0);
    if (sn < 0.0) sn = -a;
    else sn = a;
    cn = c*sn;
  }
}

// We don't use cn and dn, but just for reference:
float2 cn(float2 z, float k2) {
  float snu,cnu,dnu,snv,cnv,dnv;
  sncndn(z.x,k2,snu,cnu,dnu);
  sncndn(z.y,1.0-k2,snv,cnv,dnv);
  float a = 1.0/(1.0-dnu*dnu*snv*snv);
  return a*float2(cnu*cnv,-snu*dnu*snv*dnv);
}
// End of mla's CC-NC-BY-SA 4.0 unported code

float trap(float2 z) {
    return length(z / (z - iTrapOffset));
}

float2 formula(float2 z) {
    z -= .01 * iOrigin;
    return lerp(
        min(exp(z.x), 2.e4) * float2(
            cos(mod(abs(z.y), 2. * pi)),
            sign(z.y) * sin(mod(abs(z.y), 2. * pi))
        ),
        mul(z, float2x2(z,-z.y,z.x)), 
        iFormulalerp
    ) + .01*iConstantMapOffset + z;
}

void pixel( out float4 fragColor, float2 fragCoord )
{
    float phi = mod(iRotationSpeed * syncTime, 2. * pi);
    float2 cs = float2(cos(phi), sin(phi));
    float2 uv = (fragCoord - 0.5 * Resolution.xy) / Resolution.y;
    uv -= iOffset * 0.001;
    float2 z = exp(lerp(log(1.e-4), log(1.), iCoordinateScale)) 
        * mul(uv, float2x2(cs, cs.yx * c.zx));
    fragColor = c.yyyy;
    float tm = 1e9;
    for(int i = 0; i < 533 && dot(z,z) < 1e10; ++i) {
        z = formula(z);
        tm = min(tm, trap(z) * iCMAPScale * .01);
    }
    fragColor.rgb = cmap(frac(iCMAPOffset - log(lerp(exp(.001), exp(1.), tm))));
    fragColor.a = 1.;
}

void spiralize( out float4 fragColor, in float2 fragCoord )
{
    float2 cs = float2(cos(iGlobalRotationSpeed * Time), sin(iGlobalRotationSpeed * Time));
    uv0 = (fragCoord - 0.5 * Resolution.xy) / Resolution.y;
    float2 uv = 1.*mul(uv0, float2x2(cs.xy, cs.yx * c.zx));
    float2 z = uv;

    //*/
    /* Jacobi tiles */
    //*
    const float Speed = 4.;
    z = clog(z) * 1.1802 * .5 * float(iJacobiRepeats);
    z.x -= mod(syncTime/float(Speed),1.)*3.7; 
    z = mul(z, float2x2(1,-1,1,1));
    z = cn(z,.5);

    pixel(fragColor, z * Resolution.y + 0.5 * Resolution.xy);
}

// Low-Frequency noise (value-type)
float lfnoise(float2 t)
{
    float2 i = floor(t);
    t = frac(t);
    t = smoothstep(c.yy, c.xx, t);
    float2 v1 = float2(hash12(i), hash12(i+c.xy)), 
        v2 = float2(hash12(i+c.yx), hash12(i+c.xx));
    v1 = c.zz+2.*lerp(v1, v2, t.y);
    return lerp(v1.x, v1.y, t.x);
}

float4 psMain(float4 fragCoord : SV_Position) : SV_Target {
    spb = 60./bpm;
    stepTime = mod(Time+.5*spb, spb)-.5*spb;
    nbeats = (Time-stepTime+.5*spb)/spb + smoothstep(-.2*spb, .2*spb, stepTime);
    scale = smoothstep(-.3*spb, 0., stepTime)*smoothstep(.3*spb, 0., stepTime);
    hardBeats = round((Time-stepTime)/spb);
    syncTime = .5 * Time;
    
    // A bit of animation.
    // iOffset += .2 * float2(-152.38, 318.59) * float2(lfnoise(.1 * nbeats * c.xx), lfnoise(.1 * nbeats * c.xx + 13.37));

    // Vogel-ordered Gauss DOF.
    float2 uv = (fragCoord.xy - .5 * Resolution.xy) / Resolution.y;
    float4 col = c.yyyy;
    const float gold = 2.4;
    float sampleCount = float(iSampleCount);
    for(float i = .5; i < sampleCount; i += 1.) {
        float x = i / sampleCount;
        float p = gold * i;
        float2 z =
            // Pixel size.
            .5 / Resolution.y
            // Vogel order.
            * sqrt(x) * float2(cos(p), sin(p))
            // Adjust width for DOF effect.
            * 1.
        ;
        float4 c1;
        x *= pi * pi;
        spiralize(c1, (uv - z) * Resolution.y + .5 * Resolution.xy);

        col += 
            // Unnormalized Gauss kernel.
            //exp( -x / 2.)
            // Remap to texture coordinates.
            c1;
    }
    float4 fragColor = col / sampleCount;
    
    // Grain.
    float2 uvn = fragCoord.xy/Resolution.xy;
    fragColor += .025 * (2. * hash12(1.e4 * uvn) - 1.);
    
    // Temporal AA.
    // fragColor = lerp(fragColor, texelFetch(iChannel0, ifloat2(fragCoord), 0), .1);
    return fragColor;
}
