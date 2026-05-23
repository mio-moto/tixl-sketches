// from: https://fragcoord.xyz/s/myaet2bo

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

    float3 p = mul((fragCoord.xy * 2.0 - Resolution) / Resolution.y * float3(1, -1, 1), float2x3(-8, 4, 5, 0, 7, -7));
    float3 f = frac(p / 3.0 + 0.5) - 0.5;
    fragColor = tanh(0.5 / tan(p.y - Time + 5.0 * sqrt(abs(0.4 - dot(f, f))) + float4(6, 0, 0.2, 0)));
    fragColor *= fragColor;

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
