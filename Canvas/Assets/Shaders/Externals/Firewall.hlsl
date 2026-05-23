cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

cbuffer ShaderConstants : register(b2)
{
    float ExtraIters;
    float Distance; // default: 9
    float CenterBend; // default: 2
    float Stretch; // default: 0.6
    float FoV; // default: 3
    float Lunacrity; // default: 7
    float PaintThinner; // default: 0.3
    float Uwu; // default: 0.4
    float4 Color; // default: (6, 2, 1, 0.4)
};

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0.0, 0.0, 0.0, 0.0);


    float z = 0.0;
    float d = 0.0;
    [loop(40)]
    for (float i = 0.0; i++ < 40.0;)
    {
        float3 p = z * normalize(fragCoord.rgb * 2. - float3(Resolution, 1.).xyx) * float3(1, -1, 1);

        p = float3(
            atan2(p.z += Distance, p.x + 1.0) * CenterBend,
            Stretch * p.y + Time + Time,
            length(p.xz) - FoV
        );
        [loop]
        for (d = 1.0; d < Lunacrity; d++)
        {
            p += sin(p.yzx * d + Time + .5 * i) / d;
        }
        z += d = Uwu * length(float4(PaintThinner * cos(p) - PaintThinner, p.z));

        fragColor +=
            (cos(p.y + i * Color.w + Color) + 1.0) / d;
    }

    fragColor = tanh(fragColor * fragColor / 6000.0);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
