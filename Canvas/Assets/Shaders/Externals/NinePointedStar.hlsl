// from: https://fragcoord.xyz/s/9zbzj2ui
// Inspiration: https://fragcoord.xyz/s/duwqou59
// 9-pointed Star
// By Noztol

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

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    float2 uv = (fragCoord.xy * 2.0 - Resolution.xy) / Resolution.y * float3(1, -1, 1);
    float3 rayDirection = normalize(float3(uv, -1.0));
    rayDirection.xy = mul(rayDirection.xy, rotate2d(Time * 0.1));
    float4 accumulatedColor = float4(0, 0, 0, 0);
    float angle = atan2(rayDirection.y, rayDirection.x);

    // Calculate the star radius multiplier. 
    // - 9.0 creates the 9 points.
    float starRadiusMultiplier = .5 - 0.1 * cos(5.0 * angle);

    // Raymarching state variables
    float totalDistanceTraveled = 0.0;
    float stepDistance = 0.0;
    float phase = 0.0;

    for (float iteration = 0.0; iteration < 20.0; iteration++)
    {
        float3 currentPos = rayDirection * totalDistanceTraveled;
        float3 warpedPos = currentPos;
        // Domain Warping (Dispersion Effect)
        for (float warpScale = 3.0; warpScale <= 7.0; warpScale += 1.0)
        {
            float3 noise = sin(warpedPos * warpScale + Time + iteration);
            warpedPos -= (noise.yzx) / warpScale;
            // warpedPos.xy = mul(warpedPos.xy, rotate2d(iteration * 10));
        }

        // Calculate a "phase" value 
        phase = warpedPos.z + warpedPos.y - Time;

        // Distance Field Calculation
        float distanceToStar = abs(2.0 - length(currentPos.xy) * starRadiusMultiplier);

        // Calculate a surface displacement/bumpiness using the phase
        float surfaceDisplacement = abs(cos(phase)) / 4.0;

        // The distance we need to march forward is the shape distance + the displacement
        stepDistance = distanceToStar + surfaceDisplacement;

        // Move the ray forward by the step distance
        totalDistanceTraveled += stepDistance;

        // Color Accumulation
        float4 colorPalette = cos(phase - totalDistanceTraveled + float4(0.0, 1.0, 8.0, 0.0)) + 1.0;
        accumulatedColor += colorPalette / stepDistance;
    }

    float4 fragColor = float4(tanh(accumulatedColor / 200.0).rgb, 1.0);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
