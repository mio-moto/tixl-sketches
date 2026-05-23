// from: https://www.shadertoy.com/view/7XsGWs

#define PI 3.14159

cbuffer Resolution : register(b0) {
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}

cbuffer ShaderConstants : register(b2)
{
    float Scale;
};


float4 mainImage(in float2 fragCoord)
{
    float2 uv = (fragCoord.yx - .5*Resolution.yx) / min(Resolution.x, Resolution.y);
    // if (abs(uv.x) > .5 || abs(uv.y) > .5) return float4(0, 0, 0, 1);
    float time = 2.*PI*(Time/2.5);
    float totalr = 0.0;
    float totalg = 0.0;
    float totalb = 0.0;
    float symmetry = 9.81212545;
    for (int i = 0; i < int(symmetry); i++)
    {
        float angle = PI*float(i)/symmetry;
        float len = dot(uv, float2( cos(angle), sin(angle)));
        totalr += (cos(2.0*Scale*len + time)+1.0)/1.9;
        totalg += (cos(2.0*Scale*len + time)+1.0)/2.0;
        totalb += (cos(2.0*Scale*len + time)+1.0)/2.1;
    }
    float finalr = 1.0-abs(2.*frac(.5*totalr)-1.0);
    float finalg = 1.0-abs(2.*frac(.5*totalg)-1.0);
    float finalb = 1.0-abs(2.*frac(.5*totalb)-1.0);
    float3 color = float3(finalr, finalg, finalb);
    return float4(color, 1.0);
}

float4 psMain(float4 fragCoord : SV_Position) : SV_TARGET
{
    float4 color = mainImage(fragCoord.xy);
    // color.a = abs((color.r + color.g + color.b)) > 0.001 ? 1.0 : 0.0;
	return color;
}