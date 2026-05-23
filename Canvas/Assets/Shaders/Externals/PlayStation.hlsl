// https://fragcoord.xyz/s/gop7fy59
// SPDX-License-Identifier: CC-BY-NC-SA-4.0
// Copyright (c) 2026 @Frostbyte
// https://creativecommons.org/licenses/by-nc-sa/4.0/

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
    float Padding;
    float CubeDistance; // default: 0.4
    float CubeScale; // default: 0.4
    float Skew; // default: 0.5
    float2 Space;
    float4 Morph; // default: (0, 11, 33, 0)
}


float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0.0, 0.0, 0.0, 0.0);

    float i = 0.0;
    float d = 0.0;
    float z = Space.x;

    float3 q;
    [loop]
    for (int _fc = 0; _fc < 100; _fc++)
    {
        float3 p = z * normalize(fragCoord.rgb * 2. - float3(Resolution, 1.).xyx) * float3(1, -1, 1);

        float2x2 m = transpose(float2x2(
            (cos(p.z * .1 - Morph)).xy,
            (cos(p.z * .1 - Morph)).zw
        ));


        p = float3(
            mul(m, p.xy),
            p.z + Time
        );

        q = abs(frac(p) - Skew) - 0.5;

        z += d =
            abs(length(max(q, CubeScale)) +
                max(q.x, max(q.y, q.z)) - CubeDistance)
            + abs(sin(length(p.xy) + p.z - Time * 0.5) * 0.4) * 0.01
            + 0.0001;

        fragColor += 4.0 / d;
    }
    fragColor *= float4(1.0, 1.0, 3.0, 0.0) / 4e5;

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
