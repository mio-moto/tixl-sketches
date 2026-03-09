#include "shared/hash-functions.hlsl"
#include "shared/noise-functions.hlsl"
#include "shared/point.hlsl"
#include "shared/quat-functions.hlsl"

/*{ADDITIONAL_INCLUDES}*/

cbuffer Params : register(b0)
{
    float Amount;
    float Frequency;
    float Phase;
    float Variation;

    float SpeedFactor;
}

cbuffer Params : register(b1)
{
    /*{FLOAT_PARAMS}*/
}

RWStructuredBuffer<Particle> Particles : u0;

sampler ClampedSampler : register(s0);

//===================================================================

inline float3 CliffordAttractor(float3 pos, float a, float b, float c, float d)
{
    return float3(
        sin(a * pos.y) + c * cos(a * pos.x),
        sin(b * pos.x) + d * cos(b * pos.y),
        -cos(c * pos.y) + a * sin(b * -pos.y)
    );
}

[numthreads(64, 1, 1)] void main(uint3 i : SV_DispatchThreadID)
{
    uint maxParticleCount, _;
    Particles.GetDimensions(maxParticleCount, _);
    if (i.x >= maxParticleCount)
    {
        return;
    }

    Particles[i.x].Position = float3(CliffordAttractor(Particles[i.x].Position.xyz, -1.4, 1.6, 1.0, 0.7));
    Particles[i.x].Velocity = float3(0, 0, 0);
}
