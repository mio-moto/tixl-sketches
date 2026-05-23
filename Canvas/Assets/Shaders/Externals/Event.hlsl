// from: https://fragcoord.xyz/s/etxkngmx

cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

Texture2D Image : register(t0);
sampler texSampler : register(s0);

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0, 0, 0, 0);
    float2 p = ((fragCoord.xy * 2.0 - Resolution) / Resolution.y / 0.3) * float3(1, -1, 1);
    float2 v;
    for (float i = 0, l = 0, f = 0; i++ < 9.0; fragColor += 0.03 / max(l = length(p) - 2.0 - 1.0 / (v.y - v.x),
                                                                       -l * 9.0) * (cos(
             i / 3.0 + 0.1 / l + float4(0, 1, 2, 3)) + 1.0))
    {
        for (v = p, f = 0.0; f++ < 9.0; v += sin(ceil(v.yx * f + i * 0.7) + Resolution - Time / 2.0) / f);
    }

    float2 uv = (fragCoord.xy + Resolution.y * 0.03 * sin(fragCoord.xy + fragCoord.yx / 0.6)) / Resolution;
    float4 pr = Image.Sample(texSampler, uv);
    fragColor = max(tanh(fragColor + pr * pr), 0.0);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
