using T3.Core.DataTypes;
using T3.Core.DataTypes;
using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas.Transitions{
    [Guid("f00bf5a5-0c55-4f20-9c79-693b26e11061")]
    internal sealed class T_OIIAII_Cat : Instance<T_OIIAII_Cat>
    {
        [Output(Guid = "c35fdc37-a37d-4b34-b2aa-495093b2c411")]
        public readonly Slot<Texture2D> Selected = new Slot<Texture2D>();

        [Output(Guid = "3d376bfb-fcea-4d8d-93d7-2288646952e4")]
        public readonly Slot<int> TransitionCounter = new Slot<int>();

        [Input(Guid = "6bb24a61-d14a-4681-a07f-ebd10c8073f3")]
        public readonly InputSlot<bool> Trigger = new InputSlot<bool>();

        [Input(Guid = "05c75006-213a-4867-8ba7-6644702d2d4c")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckA = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "a41ff6b7-6121-4ec4-8dff-03c3b8a949dd")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckB = new InputSlot<T3.Core.DataTypes.Texture2D>();

    }
}

