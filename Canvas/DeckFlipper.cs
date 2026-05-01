namespace Mio.General.Canvas;

[Guid("558c97a9-8a4c-4f3a-889c-da7d1eff35de")]
internal sealed class DeckFlipper :Instance<DeckFlipper>{

        [Input(Guid = "06a01f7e-a11a-4945-a564-9c62b63cbef0")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckA = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "cc0fc0af-3ce3-4321-9efb-406a939f0bee")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckB = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "9c4c84fa-ed65-4b60-a560-6dcb411b6f25")]
        public readonly InputSlot<bool> Flip = new InputSlot<bool>();

        [Output(Guid = "3dccf09a-bbb2-4341-9cf1-926006a17da7")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> CurrentOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "2bf58276-fb6b-455b-9f4e-efffaa72b227")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> NextOutput = new Slot<T3.Core.DataTypes.Texture2D>();


}