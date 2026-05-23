// https://fragcoord.xyz/s/i4ag88wm

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
    for (float i = 0, z = 0, d = 0, s = 0; i++ < 1e2;)
    {
        float3 v, p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1);
        p.z += 9.0;
        v = p;
        for (d = 1.0; d < 9.0; d += d)
        {
            p += 0.5 * sin(p.yzx * d + Time) / d;
        }
        z += d = 0.2 * (0.01 + abs(s = dot(cos(p), sin(p / 0.7).yzx)) - min(d = 6.0 - length(v), -d * 0.1));
        fragColor += (cos(s / 0.1 + z + Time + float4(2, 4, 5, 0)) + 1.2) / d / z;
    }
    fragColor = tanh(fragColor / 2e3);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
