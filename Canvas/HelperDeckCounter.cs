namespace Mio.General.Canvas;

[Guid("ff6a9780-87c7-4382-b46e-cb1e98003630")]
internal sealed class HelperDeckCounter :Instance<HelperDeckCounter>{

        [Output(Guid = "50d95abe-37b4-45c3-9ede-d8d6065e8e9d")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> CurrentDeck = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "aa16c884-0073-4e39-9a0e-49383a529532")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> NextDeck = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "3c19ee22-2431-4d1e-8369-aa44aea892a0")]
        public readonly Slot<int> DeckCounter = new Slot<int>();

        [Input(Guid = "8a38ae50-5042-45d1-b3e4-92c4129e5ea7")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckA = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "6916518a-107f-439a-88bf-ed37133a0adb")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckB = new InputSlot<T3.Core.DataTypes.Texture2D>();


}