// from: https://fragcoord.xyz/s/cwvwp5o2

cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

float2x2 rotate2d(float r)
{
    return float2x2(cos(r), sin(r), -sin(r), cos(r));
}

#define PI 3.14159265
#define PI2 6.28318531

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0, 0, 0, 0);
    for (float i = 0, z = 0, d = 0, s = 0; i++ < 1e2;)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1);
        p.yz = mul(p.yz, rotate2d(0.2));
        for (d = 5.0; d < 2e2; d += d)
        {
            p += 0.5 * sin(p.yzx * d - Time * PI / 10.0) / d;
        }
        z += d = 0.5 * (0.01 + 0.5 * max(s = 0.3 - abs(p.y), -s * 0.1));
        fragColor += (cos(s / 0.07 + p.x + Time * PI / 10.0 - float4(0, 1, 2, 3) - 3.0) + 1.5) * exp(s * 9.0) / d;
    }
    fragColor = tanh(fragColor * fragColor / 4e8);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
