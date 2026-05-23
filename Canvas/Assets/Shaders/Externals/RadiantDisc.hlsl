// taken from: https://fragcoord.xyz/s/dzxkjt3k

cbuffer Resolution : register(b0)
{
    int2 Resolution;
}

cbuffer ShaderConstants : register(b1)
{
    float Time;
}


cbuffer Params : register(b2)
{
    float3 u_rgb;
    float u_speed;
    float2 u_bokeh;
    float u_spin;
    float u_scatter;
    float u_colors;
    float u_lines;
}

float rand1(float2 p)
{
    float3 p3 = frac(float3(p.x, p.y, p.x) * 0.1031);

    p3 += dot(p3, p3.yzx + 33.33);

    return frac((p3.x + p3.y) * p3.z);
}

float value_noise(float2 p)
{
    float2 i = floor(p);
    float2 f = frac(p);

    f = f * f * (3.0 - 2.0 * f);

    float a = rand1(i);
    float b = rand1(i + float2(1.0, 0.0));
    float c = rand1(i + float2(0.0, 1.0));
    float d = rand1(i + float2(1.0, 1.0));

    return lerp(
        lerp(a, b, f.x),
        lerp(c, d, f.x),
        f.y
    ) * 2.0 - 1.0;
}

float2 rotate2d(float2 p, float r)
{
    float s = sin(r);
    float c = cos(r);

    return float2(
        p.x * c - p.y * s,
        p.x * s + p.y * c
    );
}

struct vsOutput
{
    float4 position : SV_POSITION;
    float2 uv : TEXCOORD0;
};

float4 psMain(vsOutput input) : SV_TARGET
{
    float2 P =
        (input.uv * Resolution - Resolution * 0.4)
        / Resolution.y
        * 600.0 * float3(1, -1, 1);

    float2 u =
        float2(dot(P, u_bokeh), dot(P, u_bokeh))
        / 600.0;

    // Blank color
    float3 col = float3(0.0, 0.0, 0.0);

    // Fibonacci disk
    [loop]
    for (float i = 1.0; i < 16.0; i += 1.0 / i)
    {
        float2 p =
            mul(
                float2x2(
                    2.0, 1.0,
                    -2.0, 4.0
                ),
                (P + u * i)
            ) / 40.0;

        float l = length(p);

        float d =
            cos(
                sin(ceil(log(l) * u_lines) * 100.0)
                * 200.0
                + u_speed * Time
            );

        float2 rotatedP =
            rotate2d(p * 5.0, u_spin * d);

        float n =
            value_noise(0.5 * float2(l, l)) *
            value_noise(rotatedP);

        u = rotate2d(u, 2.4);

        float3 hue =
            cos(
                atan2(p.y, p.x) * float(u_colors)
                + d * u_scatter
                + u_rgb
            ) + 1.1;

        col += pow(
            max(n * hue, 0.0)
            * sqrt(l)
            * 0.1,
            3.0
        );
    }

    float3 finalColor =
        sqrt(col / (1.0 + col));


    finalColor = max(float3(0, 0, 0), min(finalColor, float3(1, 1, 1)));
    return float4(finalColor.rgb, 1.0);
}
