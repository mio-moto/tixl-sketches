/*
    from: https://fragcoord.xyz/s/svjq0qli

    "Surf 2" by @XorDev
    
    I discovered an interesting refraction effect
    by adding the raymarch iterator to the turbulence!
    https://x.com/XorDev/status/1936174781352517638

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
    float2 I = fragCoord.xy;

    //Raymarch depth
    float z = 0,
          //Step distance
          d = 0,
          //Raymarch iterator
          i = 0,
          //Animation time
          t = Time;
    float4 fragColor = float4(0, 0, 0, 0);
    //Clear fragColor and raymarch 100 steps
    for (fragColor *= i; i++ < 1e2;
         //Coloring and brightness
         fragColor += (1. + cos(i * .7 + float4(6, 1, 2, 0))) / d / i)
    {
        //Sample point (from ray direction)
        float3 p = z * normalize(float3(I + I, 0) - Resolution.xyx) * float3(1, -1, 1) + .1;

        //Polar coordinates
        p = float3(atan2(p.y, p.x) * 2., p.z / 3., length(p.xy) - 6.);

        //Apply turbulence
        //https://mini.gmshaders.com/p/turbulence
        for (d = 0.; d++ < 9.;)
            p += sin(p.yzx * d - t + .2 * i) / d;

        //Distance to cylinder and waves
        z += d = .2 * length(float4(p.z, .1 * cos(p * 3.) - .1));
    }
    //Tanh tonemap
    fragColor = tanh(fragColor * fragColor / 9e2);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
