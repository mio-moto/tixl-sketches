cbuffer ParamConstants : register(b0)
{
}

cbuffer Resolution : register(b1)
{
    float TargetWidth;
    float TargetHeight;
}

struct vsOutput
{
    float4 position : SV_POSITION;
    float2 texCoord : TEXCOORD;
};

Texture2D<float4> Image : register(t0);
sampler texSampler : register(s0);


#define STEPS 25.0
#define SIZE (1.0 / STEPS)
#define THRESHOLD (1.0 - SIZE * 2.0) 

float4 psMain(vsOutput input) : SV_TARGET
{
    float width, height;
    Image.GetDimensions(width, height);

    float2 dx = float2(1.0, 1.0) / float2(width, height);
    float2 uv = input.texCoord.xy;
    float2 uv_up_left      = float2(uv.x - dx.x, uv.y - dx.y);
    float2 uv_up           = float2(uv.x,        uv.y - dx.y);
    float2 uv_up_right     = float2(uv.x + dx.x, uv.y - dx.y);
    float2 uv_center_left  = float2(uv.x - dx.x, uv.y);
    float2 uv_center       = float2(uv.x,        uv.y);
    float2 uv_center_right = float2(uv.x + dx.x, uv.y);
    float2 uv_down_left    = float2(uv.x - dx.x, uv.y + dx.y);
    float2 uv_down         = float2(uv.x,        uv.y + dx.y);
    float2 uv_down_right   = float2(uv.x + dx.x, uv.y + dx.y);


    float val_up_left      = Image.Sample(texSampler, uv_up_left).r;
    float val_up           = Image.Sample(texSampler, uv_up).r;
    float val_up_right     = Image.Sample(texSampler, uv_up_right).r;
    float val_center_left  = Image.Sample(texSampler, uv_center_left).r;
    float val_center       = Image.Sample(texSampler, uv_center).r;
    float val_center_right = Image.Sample(texSampler, uv_center_right).r;
    float val_down_left    = Image.Sample(texSampler, uv_down_left).r;
    float val_down         = Image.Sample(texSampler, uv_down).r;
    float val_down_right   = Image.Sample(texSampler, uv_down_right).r;
    
    float val = val_center;

    
    // itself collapses above the threshold
    if(val_center > THRESHOLD) {
        val = 0.0;
    }

    // all other sides increment itself
    if(val_up_left > THRESHOLD) {
        val += SIZE;
    }
    if(val_up > THRESHOLD) {
        val += SIZE;
    }
    if(val_up_right > THRESHOLD) {
        val += SIZE;
    }
    if(val_center_left > THRESHOLD) {
        val += SIZE;
    }
    if(val_center_right > THRESHOLD) {
        val += SIZE;
    }
    if(val_down_left > THRESHOLD) {
        val += SIZE;
    }
    if(val_down > THRESHOLD) {
        val += SIZE;
    }
    if(val_down_right > THRESHOLD) {
        val += SIZE;
    }
   
    val = clamp(val, 0.0, 1.0);

    float4 col=float4(val, val, val, 1.0);
    return col;
}