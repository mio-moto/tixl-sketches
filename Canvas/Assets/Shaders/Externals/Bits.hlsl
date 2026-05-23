/*
    from: https://fragcoord.xyz/s/b758et8z
    
    "Bits" by @XorDev
    
    Tweet:
    https://x.com/XorDev/status/1925548343054496239
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

    //Raymarch iterator, step distance and z-depth
    float i = 0, d = 0, z = 0;
    float4 fragColor = float4(0, 0, 0, 0);
    //Clear fragColor and raymarch 100 steps
    for (fragColor *= i; i++ < 1e2;
         //Pick color and glow
         fragColor += (cos(z + float4(6, 1, 2, 3)) + 1.) / d)
    {
        //Raymarch sample point
        float3 p = z * normalize(float3(I + I, 0) - Resolution.xyy) * float3(1, -1, 1);
        //Scroll forward
        p.z -= Time;
        //Turbulence
        //https://mini.gmshaders.com/p/turbulence
        //Rounded for blocky effect
        for (d = .4; d < 3e1; d += d)
            p += cos(round(p * d) - z * .1).yzx / d;
        //Distance to depth columns
        z += d = length(sin(p.xy)) * .1;
    }
    //Tanh tonemapping
    //https://www.shadertoy.com/view/ms3BD7
    fragColor = tanh(fragColor / 5e3);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
