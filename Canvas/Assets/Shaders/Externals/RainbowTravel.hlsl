// Rainbow Travel
// HLSL translation from GLSL
// Original by Noztol
// based on: https://fragcoord.xyz/s/fx196wc1 
// port with: https://www.shadertoy.com/view/f3XGWS


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
    float3 Fluidity;
}

// Calculates the base winding 3D path of the tunnel
float3 getPathPosition(float z)
{
    return float3(
        12.0 * cos(z * 0.1) + sin(z * 0.1),
        12.0 * cos(z * 0.12) + atan(z * 0.1),
        z
    );
}

float4 mainImage(float2 fragCoord)
{
    // Normalize screen coordinates
    float2 uv = (fragCoord - Resolution.xy * 0.5) / Resolution.y * float2(1, -1);

    // Time variables for animation
    float animTime = Time * 4.0 + 5.0 + 5.0 * sin(Time * 0.3);

    // Setup Camera
    float3 rayOrigin = getPathPosition(animTime);
    float3 lookTarget = getPathPosition(animTime + 4.0);

    float3 forward = normalize(lookTarget - rayOrigin);
    float3 right = normalize(float3(-forward.z, 0.0, forward.x));
    float3 up = cross(forward, right);

    float3 rayDir = normalize(
        uv.x * right +
        uv.y * up +
        forward
    );

    // Initializations
    float stepDist = 1.0;
    float totalDist = 0.0;
    float orbDist = 1.0;

    float3 accumulatedColor = float3(0.0, 0.0, 0.0);
    float3 rayPos = rayOrigin;

    // Raymarching Loop
    [loop]
    for (float i = 1.0; i <= 28.0; i++)
    {
        if (totalDist >= 30.0)
            break;

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

        // 4. Base Tunnel Structure
        float baseRadius = cos(rayPos.z * 0.6) * 2.0 + 4.0;

        float tunnelStructure = min(
            length(rayPos.xy - pathCenter.x - 6.0),
            length((rayPos - pathCenter).xy)
        );

        // Crisp architectural scoops
        float largeScoops =
            abs(dot(sin(0.4 * rayPos), float3(0.25, 0.25, 0.25))) / 0.1;

        float detailTexture =
            abs(dot(sin(animTime + 16.0 * rayPos), float3(0.22, 0.22, 0.22))) / 2.0;

        float carvedDist =
            baseRadius -
            tunnelStructure +
            largeScoops +
            detailTexture;

        // 5. FIREWALL FLUIDITY
        float3 fluidPos = rayPos;

        [unroll]
        for (float j = 1.0; j <= 7.0; j++)
        {
            fluidPos +=
                sin(fluidPos.yzx * j + Time + 0.5 * i) / j;
        }

        float4 fluidVec = float4(
            Fluidity.x * cos(fluidPos) - Fluidity.y,
            carvedDist
        );

        float fluidTunnelDist =
            Fluidity.z * length(fluidVec);

        // 6. Update Distances
        stepDist = min(orbDist + 0.009, fluidTunnelDist);
        totalDist += stepDist;

        // 7. Accumulate Color
        float3 palette =
            1.0 + cos(
                fluidPos.y +
                i * 0.4 +
                float3(6.0, 1.0, 2.0)
            );

        accumulatedColor +=
        (
            2.5 * palette / max(stepDist, 0.001) +
            10.0 * palette / max(orbDist, 0.6)
        ) / i;
    }

    // Tonemapping
    float3 finalColor =
        tanh(accumulatedColor * accumulatedColor / 1500.0);

    return float4(finalColor, 1.0);
}


struct vsOutput
{
    float4 position : SV_POSITION;
    float2 uv : TEXCOORD0;
};

float4 psMain(vsOutput input) : SV_TARGET
{
    float2 U = input.uv * Resolution;
    float4 color = mainImage(U);

    color = max(float4(0, 0, 0, 0), min(color, float4(1, 1, 1, 1)));
    return float4(color.rgb, 1.0);
}
