// from: https://fragcoord.xyz/s/a42bwd3c

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
    for (float i = 0, z = 0, d = 0, s = 0; i++ < 1e2; fragColor += (cos(0.1 * i + float4(0, 1, 2, 0)) + 2.0) / d * z)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy), a = normalize(
                   cos(float3(0, 2, 4) + Time - s * 0.3));
        p.z += 9.0;
        a = a * dot(a, p) - cross(a, p);
        s = log(length(a)) * 5.0;
        z += d = 0.01 + 0.1 * abs(a.x + sin(s / 0.2 - Time / 0.2) * 0.2);
    }
    fragColor = tanh(fragColor / 5e4);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
