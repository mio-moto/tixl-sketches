/*
    from: https://fragcoord.xyz/s/p5bl5xug
    
    "Plasma" by @XorDev
    
    X Post:
    x.com/XorDev/status/1894123951401378051
    
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

    //Resolution for scaling
    float2 r = Resolution.xy,
           //Centered, ratio corrected, coordinates
           p = (I + I - r) / r.y * float3(1, -1, 1),
           //Z depth
           z = float2(0, 0),
           //Iterator (x=0)
           i = float2(0, 0),
           //Fluid coordinates
           f = p * (z += 4. - 4. * abs(.7 - dot(p, p)));
    float4 fragColor = float4(0, 0, 0, 0);
    //Clear frag color and loop 8 times
    for (fragColor *= 0.; i.y++ < 8.;
         //Set color waves and line brightness
         fragColor += (sin(f) + 1.).xyyx * abs(f.x - f.y))
    {
        //Add fluid waves
        f += cos(f.yx * i.y + i + Time) / i.y + .7;
    }

    //Tonemap, fade edges and color gradient
    fragColor = tanh(7. * exp(z.x - 4. - p.y * float4(-1, 1, 2, 0)) / fragColor);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
