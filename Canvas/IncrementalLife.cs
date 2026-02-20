using T3.Core.DataTypes.Vector;
using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("075ef106-4d94-4d65-a5e0-8d310a9d1ff5")]
    internal sealed class IncrementalLife : Instance<IncrementalLife>
    {
        [Output(Guid = "f3733dbd-523b-4878-bade-f96b8beb2a0d")]
        public readonly Slot<Texture2D> TextureOutput = new Slot<Texture2D>();


        [Input(Guid = "628eef0f-ebc8-46f6-a41e-dfdddf4b21f9")]
        public readonly InputSlot<Int2> InputSize = new InputSlot<Int2>();

    }
}

