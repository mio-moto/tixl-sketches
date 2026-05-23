// from: https://fragcoord.xyz/s/duwqou59

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
    for (float i = 0, z = 0, d = 0, s = 0; i++ < 2e1; fragColor += (cos(s - z + float4(0, 1, 8, 0)) + 1.0) / d)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1);
        float3 a = p;
        for (d = 2.0; d++ < 7.0;)
        {
            a -= sin(a * d + Time + i).yzx / d;
        }
        p = abs(p);
        s = a.z + a.y - Time;
        z += d = abs(2.0 - max(p, p.y).x) + abs(cos(s)) / 7.0;
    }
    fragColor = tanh(fragColor / 2e2);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
