/*
    from: https://fragcoord.xyz/s/fuuo52jb
    
    "Facility" by @XorDev
    
    More fun with fractals
    
    Dust:
    https://www.shadertoy.com/view/cdG3Wd
    Radioactive:
    https://www.shadertoy.com/view/mdG3Wy
    Sector:
    https://www.shadertoy.com/view/mdXfDS
    Runner:
    https://www.shadertoy.com/view/wfGXDh
    
    Tweet version:
    https://x.com/XorDev/status/1933624066776445381
    <512 Char playlist:
    https://www.shadertoy.com/playlist/N3SyzR
*/

float glsl_mod(float x, float y) { return x - y * floor(x / y); }
float2 glsl_mod(float2 x, float2 y) { return x - y * floor(x / y); }
float3 glsl_mod(float3 x, float3 y) { return x - y * floor(x / y); }
float4 glsl_mod(float4 x, float4 y) { return x - y * floor(x / y); }

float3x3 rotation3dZ(float angle)
{
    float s = sin(angle);
    float c = cos(angle);

    return float3x3(
        c, s, 0.0,
        -s, c, 0.0,
        0.0, 0.0, 1.0
    );
}

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
    float FractalOffset;
    float2 Offset;
    float RotationSpeed;
}

// the fractal has a periodicity of 8.0

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float2 I = fragCoord.xy;

    //Raymarch sample position and fractal vector
    float3 p, v;
    //Raymarch depth, step distance, raymarch and fractal iterators
    float z = 0, d = 0, i = 0, j = 0;
    //Clear fragColor and raymarch 30 steps
    float4 fragColor = float4(0, 0, 0, 0);
    for (fragColor *= i; i++ < 3e1;
         //Step forward
         z += d,
         //Coloring and fog (try +2. for more ground fog)
         fragColor += .1 * pow(d * d * exp(p.yyyy), float4(.7, .6, .5, 1))
    )
    {
        //Raymarch sample point with camera offset
        p = z * normalize(float3(I + I, 0) - Resolution.xyy) * float3(1, -1, 1);
        //Camera rotation
        p = mul(p, rotation3dZ(Time * 3.14159265 * (RotationSpeed)));
        //Scroll forward and right
        p.z -= Time;
        p.xy += Offset;
        //Fractal loop
        for (v = ++p, j = 4., d = -j; j > .01; j *= .3)
            //Subtract cubes
            d = max(d, min(min(v = j * .7 - abs(glsl_mod(v + j + FractalOffset, j + j) - j), v.y).x, v.z)) / (1. + z /
                    3e1),
                //Rotate 9 radians
                v.zy = mul(v.zy, float2x2(cos(float4(2, 13, 35, 2))));
    }
    //Tonemap
    fragColor = tanh(fragColor * fragColor);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
