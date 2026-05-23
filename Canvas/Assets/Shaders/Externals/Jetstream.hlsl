// from: https://fragcoord.xyz/s/jj5ktx9o

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
    float3 c, p;
    for (float i = 0, z = 0, f = 0, l = 0; i++ < 6e1; z += f = 0.01 + min(
             max(f = 8.0 - length((c + p).xy), -f * 0.2),
             l = length(c + 4.0 * sin(Time + float3(0, 8, 4)))) / 7.0, fragColor += float4(5, 1, l, 1) / l / l / f / z)
    {
        for (c = p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1), p.z -= Time /
             0.2, c.z += 9.0, f = 0.0; f++ < 7.0; p += sin(p * f + z * 0.2 + 1.0 / l).yzx / f);
    }
    fragColor = tanh(fragColor / 3e2);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
