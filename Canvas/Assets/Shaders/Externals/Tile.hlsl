// from: https://fragcoord.xyz/s/tib7mdqe

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
    float2 p = (fragCoord.xy * 2.0 - Resolution) / Resolution.y * 5.0 * float2(1, -1);
    fragColor = cos(length(tan(p) + p) - Time + float4(0, 0.7, 1, 3));

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
