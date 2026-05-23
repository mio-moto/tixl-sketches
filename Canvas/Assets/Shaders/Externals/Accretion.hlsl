// from: https://fragcoord.xyz/s/fxz51u1k

cbuffer Resolution : register(b0) {
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

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{    
    float4 fragColor = float4(0, 0, 0, 0);
    for(float z = 1.0, d = 0, i = 0; i++ < 2e1; )
    {
        float3 p = z * normalize(fragCoord.rgb * 2.0 - float3(Resolution, 1.0).xyx);
        p = float3(atan2(p.y / 0.2, p.x) * 2.0, p.z / 3.0, length(p.xy) - 5.0 - z * 0.2);
        for(d = 1.0; d < 7.0; d++)
        {
            p += sin(p.yzx * d + Time+0.3 * i) / d;
        }
        z += d = length(float4(0.4 * cos(p) - 0.4, p.z));
        fragColor += (cos(p.x + i * 0.4 + z+float4(6, 1, 2, 0)) + 1.0) / d;
    }
    fragColor = tanh(fragColor * fragColor / 4e2);
    
    
    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}