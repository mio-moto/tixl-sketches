// from: https://fragcoord.xyz/s/mxj56kt5

cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

float glsl_mod(float x, float y) { return x - y * floor(x / y); }
float2 glsl_mod(float2 x, float2 y) { return x - y * floor(x / y); }
float3 glsl_mod(float3 x, float3 y) { return x - y * floor(x / y); }
float4 glsl_mod(float4 x, float4 y) { return x - y * floor(x / y); }

float fsnoise(float2 c)
{
    return frac(sin(dot(c, float2(12.9898, 78.233))) * 43758.5453);
}

#define PI 3.14159265
#define PI2 6.28318531

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0, 0, 0, 0);
    for (float2 p = float2(0, 0), z = float2(0, 0), i = float2(0, 0); i.y++ < 1e2;)
    {
        // fragColor += float4(abs(frac(p.x + p.y * sign(fsnoise(glsl_mod(ceil(p), 10.0)) - 0.5)) - 0.5) > 0.3 && 1e2 - i.y > length(ddy(p)) * Resolution.y * 0.2, 0, 0, 0) * (i.y * i.y / 1e4 - fragColor);
        z = p = (fragCoord.xy - i - Resolution * 0.5) / Resolution.y * float3(1, -1, 1) * float2(1, 2), z.x++, p.x -=
            0.5;
        p = mul(p, float2x2(z, z.y, -z.x) / dot(p, p));
        p = log(length(p += 0.5)) * float2(5, -5) + atan2(p.y, p.x) / PI / 0.1 + Time;
        float term = abs(frac(p.x + p.y * sign(fsnoise(glsl_mod(ceil(p), 10.0)) - 0.5)) - 0.5) > 0.3 && 1e2 - i.y >
            length(ddy(p)) * Resolution.y * 0.2;
        float term2 = (i.y * i.y / 1e4 - fragColor * 3);
        float val = term * term2;
        fragColor += float4(val * 0.3, val * 0.2, val * 0.9, 0);
    }
    fragColor = tanh(fragColor / 0.5);


    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
