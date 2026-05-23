// from: https://fragcoord.xyz/s/dgwy55zi

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
    for (float z = 1.0, d = 0, i = 0; i < 90.0; i += 1)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyx) * float3(1, -1, 1);
        p = float3(atan2(p.y, p.x), p.z / 3.0 - Time, length(p.xy) - 9.0);
        for (d = 1.0; d < 6.0; d += 1)
        {
            p += sin(ceil(p.yzx * d - i * float3(0.2, 0, 0))) / d;
        }
        z += d = 0.2 * length(float4(0.2 * cos(6.0 * p) - 0.2, p.z));
        fragColor += (cos(p.x + float4(0, 0.5, 1, 0)) + 1.0) / d / z;
    }
    fragColor = tanh(fragColor * fragColor / 8e2);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
