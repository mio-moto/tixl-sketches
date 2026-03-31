namespace Mio.General.Canvas;

[Guid("32b3e99b-e2ce-4384-9d69-9645e17c202c")]
internal sealed class PartialClearTexture :Instance<PartialClearTexture>{

        [Output(Guid = "98431e94-4b45-41c4-9388-fbb4d4aa53d7")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "be8ea01e-8867-4ca2-b4b0-d5d20a8c7e22")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Image = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "a5db001b-4477-4ae0-a8b9-f219a9fbd898")]
        public readonly InputSlot<float> ClearRate = new InputSlot<float>();


}