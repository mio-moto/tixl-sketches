/*
    from: https://fragcoord.xyz/s/pj57whk5
    
    "Phosphor 3" by @XorDev

    https://x.com/XorDev/status/1949897576435581439
    
    <512 playlist:
    https://www.shadertoy.com/playlist/N3SyzR
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

    //Animation time
    float t = Time,
          //Raymarch depth
          z = 0,
          //Step distance
          d = 0,
          //Signed distance
          s = 0,
          //Raymarch iterator
          i = 0;

    float4 fragColor = float4(0, 0, 0, 0);

    //Clear fragColor and raymarch 80 steps
    for (fragColor *= i; i++ < 8e1;
         //Coloring and brightness
         fragColor += (cos(s + float4(0, 1, 8, 0)) + 1.) / d)
    {
        //Sample point (from ray direction)
        float4 p = float4(z * normalize(float4(I + I, 0, 0) - Resolution.xyy) * float3(1, -1, 1), 0);
        //Rotation axis
        float3 a = normalize(cos(float3(5, 0, 1) + t * 0.5 - d * 4.));
        //Move camera back 5 units
        p.z += 5.,
            //Rotated coordinates
            a = a * dot(a, p) - cross(a, p);

        //Turbulence loop
        for (d = 1.; d++ < 9.;)
            a -= sin(a * d + t).zxy / d;

        //Distance to ring
        z += d = .05 * abs(length(p) - 3.) + .07 * abs(cos(s = a.y));
    }
    //Tanh tonemap
    fragColor = tanh(fragColor / 5e3);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
