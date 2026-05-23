// from: https://fragcoord.xyz/s/c6v0vjg5

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
    float2 p = fragCoord.xy;
    float2 f = (p - 0.5 * Resolution).yy / 6e2;
    for (float i = 1.0; i < 16.0; i += 1.0 / i)
    {
        f *= mul(f, float2x2(0, 0.061, 1.413, 0) - 0.737);
        p = (fragCoord.xy - Resolution * 0.5 + f * i) * float3(1, -1, 1) / Resolution.y / 0.1 - Time * 0.5;
        fragColor += float4(1.0 - f, 1.0 + f) * max(cos(dot(cos(p), sin(p / 0.4 + Time).yx) / 0.2 + p.y / 0.6), 0.0);
    }
    fragColor = sqrt(tanh(fragColor / 60.0));

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
