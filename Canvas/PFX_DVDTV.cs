namespace Mio.General.Canvas;

[Guid("e28151f2-6fda-4bd2-8d26-1c961f6c4991")]
internal sealed class PFX_DVDTV :Instance<PFX_DVDTV>{

        [Output(Guid = "25968ab4-d78c-4569-9625-16a8f0371523")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "d06d0d84-b967-47f7-9dc8-b3f609d7a60e")]
        public readonly InputSlot<float> DVDSpeed = new InputSlot<float>();

        [Input(Guid = "8c708842-321c-4cbf-b36b-9f04ff1fc2ab")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Image = new InputSlot<T3.Core.DataTypes.Texture2D>();


}