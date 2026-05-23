// from: https://fragcoord.xyz/s/c6v0vjg5

cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

float2x2 rotate2d(float r)
{
    return float2x2(cos(r), sin(r), -sin(r), cos(r));
}

#define PI 3.14159265
#define PI2 6.28318531

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0, 0, 0, 0);
    for (float i = 0, z = 0, d = 0; i++ < 1e2;)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1);
        p.z -= Time * PI / 10.0;
        p.xy = mul(p.xy, rotate2d(z * 0.2));
        for (d = 1.0; d < 64.0; d += d)
        {
            p += 0.7 * cos(p.yzx * d - Time * 0.3) / d;
        }
        d = dot(cos(p), sin(p.yzx)) + 5.0 - z * 0.2 - length(p.xy); // [fixed] extracted from function argument
        z += d = (0.03 + 0.1 * max(d, -d * 0.2));
        fragColor += (cos(z - float4(6, 1, 2, 3)) + 1.4) / d / z;
    }
    fragColor = tanh(fragColor * fragColor / 3e5);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
