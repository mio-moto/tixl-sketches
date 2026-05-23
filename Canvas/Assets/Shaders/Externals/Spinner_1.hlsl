// from: https://fragcoord.xyz/s/sxhux8cc

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
    for (float i = 0, z = 0, d = 0, s = 0; i++ < 1e2; fragColor += (cos(i * 0.4 + float4(0, 1, 2, 0)) + 1.0) / d)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1), a = normalize(
                   cos(float3(0, 1, 4) + Time - 0.4 * s - i / 1e2));
        p.z += 9.0;
        a = abs(a * dot(a, p) - cross(a, p));
        s = length(a);
        z += d = 0.1 * (abs(sin(s * 4.0 - Time)) + a.y);
    }
    fragColor = tanh(fragColor / 1e3);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
