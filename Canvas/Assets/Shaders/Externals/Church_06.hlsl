// from: https://fragcoord.xyz/s/co42hi1f

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

float3x3 rotate3d(float angle, float3 axis)
{
    float3 a = normalize(axis);
    float s = sin(angle);
    float c = cos(angle);
    float r = 1.0 - c;
    return float3x3(
        a.x * a.x * r + c, a.y * a.x * r + a.z * s, a.z * a.x * r - a.y * s,
        a.x * a.y * r - a.z * s, a.y * a.y * r + c, a.z * a.y * r + a.x * s,
        a.x * a.z * r + a.y * s, a.y * a.z * r - a.x * s, a.z * a.z * r + c);
}

#define PI 3.14159265
#define PI2 6.28318531

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0, 0, 0, 0);
    for (float i = 0, z = 0, d; i++ < 1e2;)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyy) * float3(1, -1, 1);
        // p.xy += float2(0.2, -1.2);
        p.yz = mul(p.yz, rotate2d(-0.6));
        p.xz = mul(p.xz, rotate2d(-.3));
        for (d = 2.0; d < 2e2; d += d)
        {
            p += 0.5 * sin(mul(p, rotate3d(d, float3(Resolution, 1.0).xyy)) * d + Time * PI / 10.0) / d;
        }
        z += d = (0.005 + 0.2 * abs(0.6 + p.y));
        fragColor += (cos(p.y / 0.05 - float4(0, 1, 2, 3) * 0.4 - 3.0) + 1.7) / d / z;
    }
    fragColor = tanh(fragColor / 1e4);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
