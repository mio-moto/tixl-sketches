namespace Mio.General.Canvas.Utils;

[Guid("f91ac01d-ab37-48bf-af75-5327f260aeb3")]
internal sealed class FlexibleCustomPixelShader : Instance<FlexibleCustomPixelShader>
{
    [Input(Guid = "06067ade-09e4-4814-9e42-b1c1313e4029")]
    public readonly InputSlot<T3.Core.DataTypes.PixelShader> PixelShader =
        new InputSlot<T3.Core.DataTypes.PixelShader>();
    [Input(Guid = "6b6b85f0-c51c-4a59-a9d7-011fc9186028")]
    public readonly InputSlot<SharpDX.DXGI.Format> TextureFormat = new InputSlot<SharpDX.DXGI.Format>();

    [Input(Guid = "ab08c854-5382-477f-b2ee-70b962d01941")]
    public readonly InputSlot<bool> GenerateMips = new InputSlot<bool>();

    [Input(Guid = "46e857d6-efc0-490e-b384-0677ddf1e720")]
    public readonly InputSlot<bool> Clear = new InputSlot<bool>();

    [Input(Guid = "d541657f-e18b-49d0-8d88-04a26df4cefe")]
    public readonly MultiInputSlot<SharpDX.Direct3D11.ShaderResourceView> ShaderResources =
        new MultiInputSlot<SharpDX.Direct3D11.ShaderResourceView>();

    [Input(Guid = "c4465520-0746-4819-9a16-65a9c54d27c0")]
    public readonly MultiInputSlot<SharpDX.Direct3D11.Buffer> ConstantBuffers =
        new MultiInputSlot<SharpDX.Direct3D11.Buffer>();

    [Input(Guid = "5b5d06a3-a4cf-47e4-831b-3ec7b979351c")]
    public readonly MultiInputSlot<SharpDX.Direct3D11.SamplerState> CustomSampler =
        new MultiInputSlot<SharpDX.Direct3D11.SamplerState>();

        [Input(Guid = "510014f1-4bea-44e3-bb03-adf0f2fefc9e")]
        public readonly InputSlot<float> OverrideTime = new InputSlot<float>();

    [Output(Guid = "d9219c67-de11-47df-adde-e5c02e1db0c7")]
    public readonly Slot<T3.Core.DataTypes.Command> Command = new Slot<T3.Core.DataTypes.Command>();

    [Output(Guid = "7707586f-58d7-4d56-87eb-25e5b27fcf55")]
    public readonly Slot<Texture2D> TextureOutput = new();


    [Output(Guid = "610709ac-c01a-464a-9352-85da6d280361")]
    public readonly Slot<RenderTargetReference> Reference = new();
}