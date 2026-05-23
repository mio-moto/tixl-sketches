// from: https://fragcoord.xyz/s/agydvlm1

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
    float3 p = float3(0, 0, 0);
    for (float d = 0, i = 0, z = 0; i++ < 1e2; fragColor += (cos(z * 0.3 + float4(0, 1, 2, 0)) + 2.0) / d / z)
    {
        p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1);
        p.z -= Time - z * 0.6, d = abs(0.03 * z - 0.3), z += d = max(d, length(max(p = cos(p), p.yzx)) - d);
    }
    fragColor = tanh(fragColor * fragColor / 9e2);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
