// from: https://fragcoord.xyz/s/pw9zi8di

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
    for (float i = 0, z = 0, d = 0, s = 0; i++ < 2e2; fragColor += (cos(s / 0.6 + float4(0, 1, 2, 0)) + 1.1) / d)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1), a = normalize(
                   cos(float3(0, 1, 0) + Time - 0.4 * s));
        p.z += 9.0, a = a * dot(a, p) - cross(a, p);
        for (d = 1.0; d++ < 6.0;)
        {
            s = length(a += cos(a * d + Time).yzx / d);
        }
        z += d = 0.1 * (abs(sin(s - Time)) + abs(a.y) / 6.0);
    }
    fragColor = tanh(fragColor * fragColor / 2e7);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
