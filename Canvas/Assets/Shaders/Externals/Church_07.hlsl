// from: https://fragcoord.xyz/s/cwnkf9j9
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

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0, 0, 0, 0);
    for (float i = 0, z = 0, d = 0; i++ < 1e2;)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1);
        for (d = 1.0; d < 64.0; d += d)
        {
            p += 0.7 * cos(p.yzx * d + Time * PI / 10.0 + d) / d;
        }
        z += d = (0.03 + 0.1 * abs(abs(p.y) - 1.1));
        fragColor += (cos(p.y / 0.2 - float4(0, 1, 2, 3) * 0.3) + 1.5) / d;
    }
    fragColor = tanh(fragColor / 5e3);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
