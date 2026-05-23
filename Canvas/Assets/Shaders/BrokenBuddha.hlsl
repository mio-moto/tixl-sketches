// from: https://www.shadertoy.com/view/NdBcRd
// both variants are _just_ a partially cleared version

cbuffer ShaderConstants : register(b0)
{
    float iFrame;
    float2 Resolution;
	float ExtraIters;
};

Texture2D iChannel0 : register(t0);
SamplerState sampler0 : register(s0);

#define Pi 3.14159

float4 load(float x, float y)
{
    return iChannel0.Sample(sampler0, (float2(x + 0.5, y + 0.5) / Resolution));
}

float2x2 rmat(float a)
{
    return float2x2(cos(a), sin(a),
                   -sin(a), cos(a));
}

float2 cmul(float2 a, float2 b)
{
    return float2(a.x * b.x - a.y * b.y,
                  dot(a, float2(b.y, b.x)));
}

struct vsOutput
{
    float4 position : SV_POSITION;
    float2 uv       : TEXCOORD0;
};

float4 mainImage(float2 U)
{
    float4 O = iChannel0.Sample(sampler0, U / Resolution);
    U = floor(U);

    float4 L = load(0.0, 0.0);
    float f = iFrame;
    float a = f;

    if (U.x + U.y == 0.0)
    {
        int iters = (int)floor(a) + (int)13;
        a *= Pi;

        float2 p = float2(cos(a), sin(a / 1.5));
        float2 rd = -p;
        p.x -= 0.5 * cos(a * 0.007);

        [loop(7)]
        for (int i = 0; i < 7; i++)
        {
            float dr = 1.0;
            float r = length(p);
            float2 C = p;
            float2 Z = p;

            [loop(5)]
            for (int n = 0; n < 5 && r < 2000.0; n++)
            {
                Z = cmul(Z, Z) + C;
                dr = dr * r * 2.0 + 1.0;
                r = length(Z);
            }

            p += rd * 0.5 * log(r) * r / dr;
        }

        p += rd * (1.0 + cos(a * 0.3)) * 0.1;
        O = float4(p.x, p.y, p.x, p.y);
    }
    else
    {
        float2 p0 = L.xy;
        float2 u = (2.0 * U - Resolution) / Resolution.y;

        [loop]
        for (int j = 0; j < ExtraIters; j++)
        {
            float2 p = p0 + float2(0.001, 0.001) * j;

            [loop(10)]
            for (int n = 0; n < 10 && dot(p, p) < 300000.0; n++)
            {
                p = cmul(p, p) + p0;

                float d = length(abs(u) - abs(p));
                d = smoothstep(2.0 / Resolution.y, 0.0, d) * 0.2;

                float3 col = float3(
                    mul(rmat(a * 7.0 + j * 0.3), d * p),
                    d
                );

                float2 yz = mul(rmat(a * 5.0 + (j + n) * 0.03), col.yz);
                col.y = yz.x;
                col.z = yz.y;

                O += float4(abs(float3(col.g, col.r, col.b)), 0.0);
            }
        }

        O *= 0.1;
    }

    return O;
}

float4 psMain(vsOutput input) : SV_TARGET
{
    float2 U = input.uv * Resolution;
    float4 color = mainImage(U);
	color.a = abs((color.r + color.g + color.b)) > 0.001 ? 1.0 : 0.0;
	return color;
}