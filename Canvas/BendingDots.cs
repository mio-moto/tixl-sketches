using T3.Core.DataTypes;
using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("e061e55e-1799-4043-b19e-44efd8393415")]
    internal sealed class BendingDots : Instance<BendingDots>
    {
        [Output(Guid = "90398670-b911-4ab9-9ae8-9cdde34cfbc8")]
        public readonly Slot<Texture2D> TextureOutput = new Slot<Texture2D>();


        [Input(Guid = "304d79e5-8840-44d9-a4af-525fe13c0eed")]
        public readonly InputSlot<Texture2D> Image = new InputSlot<Texture2D>();

    }
}

