// from: https://fragcoord.xyz/s/c6v0vjg5
// Follow your light
// Inspired by and Rewrite of shadertoy.com/view/WcdczB
// Rewritten by Noztol

cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}


// Calculates the base winding 3D path of the tunnel
float3 getPathPosition(float z)
{
    return float3(12.0 * cos(z * float2(0.1, 0.12)), z);
}

float4 psMain(float4 fragCoord : SV_Position) : SV_Target
{
    // Normalize screen coordinates
    float2 uv = (fragCoord.xy - Resolution.xy * 0.5) / Resolution.y * float2(1, -1);

    // T = animTime
    float animTime = Time * 4.0 + 5.0 + 5.0 * sin(Time * 0.3);

    // Setup Camera
    float3 rayOrigin = getPathPosition(animTime);
    float3 lookTarget = getPathPosition(animTime + 4.0);

    float3 forward = normalize(lookTarget - rayOrigin);
    float3 right = normalize(float3(-forward.z, 0.0, forward.x));
    float3 up = cross(forward, right);
    float3 rayDir = normalize(uv.x * right + uv.y * up + forward);

    float stepDist = 1.0;
    float totalDist = 0.0;
    float orbDist = 1.0;
    float3 accumulatedColor = float3(0, 0, 0);
    float3 rayPos = rayOrigin;
    float4 fragColor = float4(0, 0, 0, 0);
    // Raymarching Loop
    for (float i = 1.0; i <= 28.0; i++)
    {
        if (totalDist >= 30.0) break;

        // 1. March Ray Forward
        rayPos += rayDir * stepDist;

        // 2. Get path center and time vars
        float3 pathCenter = getPathPosition(rayPos.z);
        float sineTime = sin(Time);

        // 3. Orb Geometry
        float3 orbCenter = float3(
            pathCenter.x + sineTime,
            pathCenter.y + sineTime * 2.0,
            6.0 + animTime + sineTime * 2.0
        );
        orbDist = length(rayPos - orbCenter) - 0.01;

        // 4. Tunnel Wall Geometry
        float baseRadius = cos(rayPos.z * 0.6) * 2.0 + 4.0;

        float tunnelStructure = min(
            length(rayPos.xy - pathCenter.x - 6.0),
            length((rayPos - pathCenter).xy)
        );


        float largeScoops = abs(dot(sin(0.4 * rayPos), float3(0.25, 0.25, 0.25))) / 0.1;
        float detailTexture = abs(dot(sin(animTime + 16.0 * rayPos), float3(0.22, 0.22, 0.22))) / 2.0;

        float tunnelDist = baseRadius - tunnelStructure + largeScoops + detailTexture;

        // 5. Update Distances
        stepDist = min(orbDist, 0.01 + 0.3 * abs(tunnelDist));
        totalDist += stepDist;

        // 6. Accumulate Color
        float3 palette = 1.0 + cos(i * 0.7 + float3(6.0, 1.0, 2.0));
        accumulatedColor += (palette / stepDist + 10.0 * palette / max(orbDist, 0.6)) / i;
    }

    // Tonemapping
    fragColor = float4(tanh(accumulatedColor * accumulatedColor / 2000.0), 1.0);

    fragColor = max(float4(0, 0, 0, 0), min(fragColor, float4(1, 1, 1, 1)));
    return float4(fragColor.rgb, 1.0);
}
