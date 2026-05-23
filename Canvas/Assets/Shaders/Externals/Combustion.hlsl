// from: https://fragcoord.xyz/s/ckiund5l

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
    float2 p = (fragCoord.xy * 6. / Resolution.y) * float3(1, -1, 1);
    for (float i; i++ < 1e1; i)
    {
        p += sin(p.yx * i + i * i + Time * i + Resolution) / i;
    }

    float4 fragColor = tanh(.2 / tan(p.y + float4(0, .1, .3, 1)));
    fragColor *= fragColor;

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
