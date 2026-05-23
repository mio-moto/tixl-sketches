// from: https://fragcoord.xyz/s/ffg6ez4l

cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

cbuffer S : register(b2) {
float Z;
    float I;
    float S;
}

float2x2 rotate2d(float r)
{
    return float2x2(cos(r), sin(r), -sin(r), cos(r));
}

#define PI 3.14159265

/* 
float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0, 0, 0, 0);
    for (float i = 0, d = 0, z = 0, s = 0; i++ < 6e1;)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyx) * float3(1, -1, 1);
        p.yz = mul(p.yz, 0.1 * transpose(float2x2(8, -6, 6, 8)));
        p.z += 1.2;
        s = length(p), z += d = 0.1 + 0.1 * abs(s - 1.2);
        fragColor += (cos(tanh(s - 6.0) * 6.0 - float4(22, 55, 1, 0)) + 1.0) * pow(
            dot(cos(p / ++s / 0.1 - Time), sin(p / s / 0.04 + Time).yzx), 4.0) / z;
    }
    fragColor = tanh(fragColor / 5e2);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
*/

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float4 fragColor = float4(0, 0, 0, 0);
    for (float i = I, z = Z;i < 6e1; i += 1)
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyx) * float3(1, -1, 1);
        p.yz = mul(p.yz, 0.1 * transpose(float2x2(8, -6, 6, 8)));
        p.z += 8.0;
        float s = length(p);
        float d = 0.1 + 0.1 * abs(s - 1.2);
        z += d;
        fragColor += (cos(tanh(s - 6.0) * 6.0 - float4(2, 3, 4, 0)) + 1.0) * pow(dot(cos(p / (s + S) / 0.1 - Time), sin(p / s / 0.04 + Time).yzx), 4.0) / z;
    }
    fragColor = tanh(fragColor / 2e1);
    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}