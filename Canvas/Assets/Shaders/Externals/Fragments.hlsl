// from: https://fragcoord.xyz/s/fziqf4l1

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

    //Iterator, raymarch depth, turbulence frequency and time
    float i = 0, z = 0, f = 0, t = Time;
    //Raymarch sample point
    float3 p;
    float4 fragColor = float4(0, 0, 0, 0);
    //Clear fragColor and raymarch 30 steps
    for (fragColor *= i; i++ < 3e1;
             //Distance field to cylinder + gyroid
         z += f = .003 + abs(length(p.xy) - 5. + dot(cos(p), sin(p).yzx)) / 8.,
         //Color in waves and attenuate light
         fragColor += (1. + sin(i * .3 + z + t + float4(6, 1, 2, 0))) / f)
        //Compute sample point and iterate through turbulence waves
        //https://mini.gmshaders.com/p/turbulence
        for (p = z * normalize(float3(I + I, 0) - Resolution.xyy) * float3(1, -1, 1), p.z -= t, f = 1.; f++ < 6.;
                 //Blocky, stretched waves
             p += sin(round(p.yxz * 6.) / 3. * f) / f);
    //Tanh tonemapping
    //https://mini.gmshaders.com/p/func-tanh
    fragColor = tanh(fragColor / 1e3);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
