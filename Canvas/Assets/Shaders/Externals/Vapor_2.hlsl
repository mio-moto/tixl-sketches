// from: https://fragcoord.xyz/s/vd57zich

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
    for (float i = 0, z = 0, f = 0; i++ < 1e2; fragColor += sin(p.y - Time + float4(6, 1, 2, 3)) * f + f)
    {
        p = z * normalize(fragCoord.rgb * 2. - float3(Resolution, 1.).xyy) * float3(1, -1, 1);
        for (f = 1.; f++ < 9.; p += sin(p.zxy * f + f - Time) / f);
        z += f = .01 + .1 * abs(dot(sin(p * .7), cos(p).yzx));
    }
    fragColor = tanh(fragColor * fragColor / 1e2);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
