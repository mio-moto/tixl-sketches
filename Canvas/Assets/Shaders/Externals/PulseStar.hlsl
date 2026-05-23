cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

cbuffer ShaderConstants : register(b2)
{
    float2 HashConstants;
    float2 Offset;
    float Falloff;
    float Rotate;
};

#define R Resolution.xy
#define PIXEL (10.0 / min(R.x, R.y))
#define S smoothstep
#define T Time

// Distance from point p to line segment from 0 -> b
float L(float2 p, float2 b)
{
    return length(p - b * clamp(dot(p, b) / dot(b, b), 0.0, 1.0));
}

static const float a[3] = {0.0, 1.0, -1.0};

float2 rotate(float2 p, float a)
{
    float s = sin(a);
    float c = cos(a);

    return mul(float2x2(
                   c, -s,
                   s, c
               ), p);
}

float hash(float2 p)
{
    p = frac(p * HashConstants);
    p += dot(p, p + 45.32);
    return frac(p.x * p.y);
}

float cn(float2 aPos, float2 d)
{
    float n = hash(aPos);

    float2 c = normalize(aPos);
    float2 l = normalize(d);

    // Alignment
    float m = abs(dot(c, l));

    // Probability
    float p = S(0.7, 0.98, m) * 0.75;

    float t = length(aPos);

    // Central concentration
    float ce = 1.0 - S(0.0, 2.0, t);

    // The farther the branch, the lower the probability
    // p *= S(18.0, 1.0, t / 10.0);

    p = lerp(p, 0.1, ce);

    return lerp(1e2, 0.0, step(n, p));
}

float4 mainImage(float2 F)
{
    float2 uv = (F - 0.5 * R) / R.y * float3(1, -1, 1);
    uv = rotate(uv, Rotate);
    uv += Offset;


    float s = 20.0;
    float d = 1e2;

    float2 u = uv * s;
    float2 i = floor(u);
    float2 f = frac(u) - 0.5;

    // Eight directions and their axis
    // Draw line
    [loop(8)]
    for (int m = 1; m < 9; ++m)
    {
        int j = m % 3;
        int k = m / 3;

        float2 q = float2(a[j], a[k]);
        float2 p = i + q * 0.5;

        d = min(d, cn(p, q) + L(f, q * 0.5));
    }

    // Debug output

    // Color
    float t = 0.1;
    float an = atan2(i.y, i.x);
    float di = length(uv - Offset) * Falloff;

    // Border
    float l = S(t + PIXEL, t, d) - S(t, 0.0, d);

    // Core fine line
    float cl = S(t * 0.3 + PIXEL, t * 0.3, d);

    // Glow
    float g = PIXEL / (d + 1e-3);

    // Random Offset/Speed
    float ro = sin(an * 7.0) * 2.5 + cos(an * 3.0) * 1.5;
    float rs = 1.5 + sin(an * 5.0) * 0.5;

    // Phase
    float w = frac(di + ro - T * rs);

    // Pulse
    float pu = 0.08 / (1.0 - w + 0.015) * hash(uv * 20.0);
    pu = max(0.0, pu - 0.05) * S(1.0, 0.95, w);

    // Base border color
    float3 bc = float3(0.6, 0.2, 0.08) * l * 1.5;

    float3 pc = float3(1.0, 0.7, 0.2) * pu * cl * 4.0;
    pc += float3(1.0, 0.3, 0.0) * pu * g * 1.5;

    float3 c = bc + pc;
    c *= exp(-di * 0.5);

    float intensity = length(c);
    return float4(c, step(0.01, intensity));
}

struct vsOutput
{
    float4 position : SV_POSITION;
    float2 uv : TEXCOORD0;
};


float4 psMain(vsOutput input) : SV_TARGET
{
    float4 color = mainImage(input.uv * Resolution.xy);
    // color.a = abs((color.r + color.g + color.b)) > 0.001 ? 1.0 : 0.0;
    return color;
}
