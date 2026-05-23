// https://fragcoord.xyz/s/q91w1o8q

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
    float4 fragColor = float4(0.0, 0.0, 0.0, 0.0);
    for (float i = 0, z = 0, d = 0, s = 0; i++ < 7e1; fragColor += float4(z, 2, s, 1) / s / d)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1),
               a = float3(0, 0, 0);
        p.z += 9.0;
        a = lerp(dot(a -= 0.57, p) * a, p, cos(s -= Time)) - sin(s) * cross(a, p);
        s = sqrt(length(a.xz - a.y));
        for (d = 1.0; d++ < 9.0; a += sin(a * d - Time).yzx / d);
        z += d = length(sin(a) + dot(a, float3(1, 1, 1)) * 0.2) * s / 2e1;
    }
    fragColor = tanh(fragColor / 2e3);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
