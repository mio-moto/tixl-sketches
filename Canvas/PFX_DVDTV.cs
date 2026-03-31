namespace Mio.General.Canvas;

[Guid("e28151f2-6fda-4bd2-8d26-1c961f6c4991")]
internal sealed class PFX_DVDTV :Instance<PFX_DVDTV>{

        [Output(Guid = "25968ab4-d78c-4569-9625-16a8f0371523")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "a1b1b86d-fdec-4079-862d-e3cd96382edb")]
        public readonly InputSlot<T3.Core.DataTypes.Command> Command = new InputSlot<T3.Core.DataTypes.Command>();

        [Input(Guid = "d06d0d84-b967-47f7-9dc8-b3f609d7a60e")]
        public readonly InputSlot<float> DVDSpeed = new InputSlot<float>();


}