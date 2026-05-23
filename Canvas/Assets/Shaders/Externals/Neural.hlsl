// from: https://fragcoord.xyz/s/nkzxspac

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
    float3 p = float3(0, 0, 0), v = float3(0, 0, 0);
    for (float i = 0, z = 0, d = 0, l = 0; i++ < 1e2; fragColor += (cos(9.0 / l + float4(6, 1, 2, 3)) + 1.0) / d)
    {
        p = z * (fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1) / float3(Resolution, 1.0).y, p.z
            ++, l = length(p), z += d = (dot(cos(v = p / l / l * 5.0 + Time * 3.0), sin(v.yzx + 0.7)) + 1.8) / 4e1;
    }
    fragColor = tanh(fragColor / 1e4);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
