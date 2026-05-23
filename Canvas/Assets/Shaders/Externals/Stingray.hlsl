// from: https://fragcoord.xyz/s/svs6rbgo

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
    for (float z = 0, d = 0, i = 0; i++ < 5e1;)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyx) * float3(1, -1, 1);
        p = float3(p.y + 5.0 - 0.6 * z, Time - atan2(p.x, p.z += 9.0) * 4.0, length(p));
        for (d = 1.0; d < 7.0; d++)
        {
            p += sin(p.zxy * d + Time + i * 0.2) / d;
        }
        z += d = 0.1 * length(float4(cos(p) - 1.0, p.x));
        fragColor += (cos(sin(i) + p.y + float4(2, 4, 5, 0)) + 1.0) / d;
    }
    fragColor = tanh(fragColor * fragColor / 2e5);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
