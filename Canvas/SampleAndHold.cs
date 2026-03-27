namespace Mio.General.Canvas;

[Guid("35064c05-e8c9-424c-b230-6dd66c873586")]
internal sealed class SampleAndHold :Instance<SampleAndHold>{

        [Input(Guid = "16ec062c-f56b-4fde-a8bc-6377e75f5f84")]
        public readonly InputSlot<float> Time = new InputSlot<float>();

        [Input(Guid = "eee8d062-1334-4b5f-879d-703ec0b5996b")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Image = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "3b87195f-d00e-48a5-83f5-d1980e03fea3")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();


}