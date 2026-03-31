namespace Mio.General.Canvas;

[Guid("b07b87a0-3ac7-4cbe-9006-5dd1dbbd35da")]
internal sealed class PFX_ImagePump :Instance<PFX_ImagePump>{

        [Input(Guid = "7c722c61-27fb-41d5-858f-f5c0493414eb")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Image = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "71b3fe18-2e04-49dc-8488-31da3e1f7840")]
        public readonly InputSlot<float> BeatDivider = new InputSlot<float>();

        [Input(Guid = "f9699b5e-3faa-4e39-8dd2-8c3f1f414856")]
        public readonly InputSlot<float> Intensity = new InputSlot<float>();

        [Output(Guid = "cd3923ac-fc77-48b3-ae28-8df0c9715255")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();


}