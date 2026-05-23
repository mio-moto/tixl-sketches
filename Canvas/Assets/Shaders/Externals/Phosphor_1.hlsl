// from: https://fragcoord.xyz/s/p2jobbec

cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0, 0, 0, 0);
    for (float i = 0, z = 0, d = 0; i++ < 8e1; fragColor += (cos(d / 0.1 + float4(0, 2, 4, 0)) + 1.0) / d * z)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1), a = normalize(
                   cos(float3(4, 2, 0) + Time - d * 8.0));
        p.z += 5.0, a = a * dot(a, p) - cross(a, p);
        for (d = 1.0; d++ < 9.0;)
        {
            a += sin(a * d + Time).yzx / d;
        }
        z += d = 0.05 * abs(length(p) - 3.0) + 0.04 * abs(a.y);
    }
    fragColor = tanh(fragColor / 1e4);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
