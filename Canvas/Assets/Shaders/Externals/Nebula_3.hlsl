// from: https://fragcoord.xyz/s/fxz51u1k

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
    for (float i = 0, z = 0, d = 0, s = 0; i++ < 1e2; fragColor += (cos(s + s - float4(5, 0, 1, 3)) + 1.4) / d / z)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1);
        p.z -= 0.4 * Time;
        for (d = 1.0; d < 64.0; d += d)
        {
            p += 0.7 * cos(p.yzx * d) / d;
        }
        p.xy = mul(p.xy, float2x2(cos(z * 0.2 + float4(0, 11, 33, 0))));
        s = 3.0 - abs(p.x);
        z += d = 0.03 + 0.1 * max(s, -s * 0.2);
    }
    fragColor = tanh(fragColor * fragColor / 4e5);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
