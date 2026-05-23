/*
    from: https://fragcoord.xyz/s/hgpgzr8z
    
    "Heavenly" by @XorDev
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

    float t = Time, i = 0, z = 0, d = 0;
    float4 fragColor = float4(0, 0, 0, 0);
    for (fragColor *= i; i++ < 1e2;
         fragColor += (cos(z + t + float4(6, 1, 2, 3)) + 1.) / d)
    {
        float3 p = z * normalize(float3(I + I, 0) - Resolution.xyy) * float3(1, -1, 1);
        p.z -= t;
        for (d = 1.; d < 9.; d /= .7)
            p += cos(p.yzx * d + z * .2) / d;
        z += d = .02 + .1 * abs(3. - length(p.xy));
    }
    fragColor = tanh(fragColor / 3e3);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
