/*
    from: https://fragcoord.xyz/s/s25rfkwc

    "Surf" by @XorDev
    
    Still playing with turbulence.
    I discovered an interesting refraction effect
    by adding the raymarch iterator to the turbulence!
    https://x.com/XorDev/status/1936158948630974583

    An experiment based on my "3D Fire":
    https://www.shadertoy.com/view/3XXSWS
*/

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
    float2 I = float2(fragCoord.x, fragCoord.y);

    //Raymarch depth
    float z = 0,
          //Step distance
          d = 0,
          //Animation time
          t = Time;
    float4 fragColor = float4(0, 0, 0, 0);
    //Clear fragColor and raymarch 100 steps
    for (float i = 0; i++ < 1e2;
         //Coloring and brightness
         fragColor += (1.0 - sin((z + i) / 2e1 + float4(6, 1, 2, 0))) / d)
    {
        //Sample point (from ray direction)
        float3 p = z * normalize(float3(I + I, 0) - Resolution.xyx) * float3(1, -1, 1);

        //Polar coordinates
        p = float3(atan2(p.y += 3.0 - i * 0.2, p.x) * 3.0 + i * 0.1, p.z * 0.3, length(p.xy) - i * 0.1 - 6.0);

        //Apply turbulence
        //https://mini.gmshaders.com/p/turbulence
        for (d = 1.0; d < 9.0; d++)
        {
            p += sin(p.yzx * d - t + 0.2 * i) / d;
        }

        //Distance to cylinder and waves
        z += d = 0.1 * length(float4(p.z * 5.0, cos(p) - 1.0));
    }
    //Tanh tonemap
    fragColor = tanh(fragColor / 2e2);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
