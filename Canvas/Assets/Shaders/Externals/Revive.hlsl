/*
    from: https://fragcoord.xyz/s/rg5fmlsn
    
    "Revive" by @XorDev
    
    Still playing with turbulence
    https://x.com/XorDev/status/1930594981963505793

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
          //Animation time
          t = Time;
    float4 fragColor = float4(0, 0, 0, 0);
    //Clear fragColor and raymarch 100 steps
    for (float i = 0; i++ < 1e2;
         //Coloring and brightness
         fragColor += (1.2 - sin(t + z / float4(8, 7, 6, 0))) / d)
    {
        //Sample point (from ray direction)
        float3 p = z * normalize(float3(I + I, 0) - Resolution.xyx) * float3(1, -1, 1);
        //Polar coordinates
        p = float3(atan2(p.y -= 7., p.x) * 3., p.z * .3, length(p.xy) - 11.);
        //Apply turbulence
        //https://mini.gmshaders.com/p/turbulence
        for (d = 1.; d < 9.; d++)
            p += sin(p.yzx * d + .1 * z - t) / d;
        //Distance to cylinder and waves
        z += d = length(float4(p.z * 5., cos(p) - 1.)) / 2e1;
    }
    //Tanh tonemap
    fragColor = tanh(fragColor / 1e3);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
