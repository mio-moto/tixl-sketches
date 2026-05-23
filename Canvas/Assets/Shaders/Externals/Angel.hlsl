/*
    from: https://fragcoord.xyz/s/axkjzs99
    
    "Angel" by @XorDev
    
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

    //Time for animation
    float t = Time,
          //Raymarch depth
          z = 0,
          //Raymarch step size
          d = 0;
    float4 fragColor = float4(0, 0, 0, 0);
    //Raymarch loop (100 iterations)
    for (float i = 0; i++ < 1e2;
         //Sample coloring and glow attenuation
         fragColor += (sin(z + float4(2, 3, 4, 0)) + 1.1) / d)
    {
        //Raymarch sample position
        float3 p = z * normalize(float3(I + I, 0) - Resolution.xyy) * float3(1, -1, 1);
        // FIX_ROTATION
        //Shift camera back
        p.z += 6.;
        //Twist shape
        p.xz = mul(p.xz, float2x2(cos(p.y * .5 + float4(0, 33, 11, 0))));
        //Distortion (turbulence) loop
        for (d = 1.; d < 9.; d /= .8)
            //Add distortion waves
            p += cos((p.yzx - t * float3(3, 1, 0)) * d) / d;
        //Compute distorted distance field of cylinder
        z += d = (.1 + abs(length(p.xz) - .5)) / 2e1;
    }
    //Tanh tonemapping
    //https://www.shadertoy.com/view/ms3BD7
    fragColor = tanh(fragColor / 4e3);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
