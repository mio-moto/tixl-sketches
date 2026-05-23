// from: https://fragcoord.xyz/s/pcnmte5h


/*
    "Pulsar" by @XorDev
    
    Pulsar explained
    https://x.com/XorDev/status/1914327398058778815
*/
//Color changing speed (radians per second)
#define COL_SPEED 1.0
//Color wave frequency
#define COL_FREQ 3.0
//Red, green and blue have wave frequencies
#define RGB_SHIFT float3(0, 1, 2)

//Camera position offset
#define Z 0.1
//Camera perspective (ratio from tan(fov_y/2) )
#define PERSPECTIVE 1.0
//Raymarch steps (higher = slower)
#define STEPS 80.0

//Cube shape (higher = sharper edges)
#define CUBE 0.8
//Distortion speed
#define DIS_VEL float3(1, 1, 1)

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
    //Centered, ratio-corrected screen uvs [-1, 1]
    float2 res = Resolution.xy;
    float2 uv = (2.0 * fragCoord - res) / res.y * float3(1, -1, 1);
    //Ray direction for raymarching
    float3 dir = normalize(float3(uv, -PERSPECTIVE));

    //Output color
    float3 col = float3(0, 0, 0);

    //Raymarch depth
    float z = 0.0;
    //Distance field step size
    float d = 0.0;
    float l = 0.0;

    //Raymarching loop
    for (float i = 0.0; i < STEPS; i++)
    {
        //Compute sample position
        float3 p = z * dir;
        //Offset camera z
        p.z += Z;
        //Use inverse coordinates
        l = dot(p, p);
        p /= l;
        //Sample cube distance field
        z += d = sqrt(l) / 80.0 * length(cos(p + cos(p / 0.27 + DIS_VEL * Time)) + CUBE);
        //Apply color waves and glow attenuation
        col += (cos(log(l) * COL_FREQ - COL_SPEED * Time + RGB_SHIFT) + 1.0) / d;
    }

    //Exponential tonemapping
    //https://www.shadertoy.com/view/ddVfzd
    col = 1.0 - exp(-col / STEPS / 25e2);
    float4 fragColor = float4(col, 1.0);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
