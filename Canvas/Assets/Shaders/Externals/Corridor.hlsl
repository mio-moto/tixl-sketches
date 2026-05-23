/*
    https://fragcoord.xyz/s/c6r6vjmn
    
    "Corridor" by @XorDev
    
    https://x.com/XorDev/status/1923882930834751520
*/

cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

#define PI 3.14159265
#define PI2 6.28318531

float glsl_mod(float x, float y) { return x - y * floor(x / y); }
float2 glsl_mod(float2 x, float2 y) { return x - y * floor(x / y); }
float3 glsl_mod(float3 x, float3 y) { return x - y * floor(x / y); }
float4 glsl_mod(float4 x, float4 y) { return x - y * floor(x / y); }

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0, 0, 0, 0);
    for (float i = 0, d = 0, z = 0; i++ < 3e1;)
    {
        float3 s = normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1);
        float3 p = z * s, c = abs(s);
        c /= max(c.x, c.y);
        c.z += Time;
        p.z -= Time;
        s = ++p;
        z += d = 0.01 + length((p.xy = abs(glsl_mod(p.xy - 2.0, 4.0) - 2.0)) - 1.0 + cos(p.z / float2(PI, 2))) + 0.1 *
            exp(dot(cos(ceil(c /= 0.3)), sin(c / 0.6).yzx)) * length(p - s);
        fragColor.rgb += (cos(p) + 1.4) / d / z;
    }
    fragColor = tanh(fragColor / 7e1);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
