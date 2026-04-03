using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("ff6eb273-c308-4204-835a-14cdfa1f9254")]
    internal sealed class T_RaveClock : Instance<T_RaveClock>
    {

        [Output(Guid = "fe44f6b7-c173-454e-95ea-bdcd9e7398be")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Image = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "9a02bee9-cce1-4335-a48f-306bfe39c993")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Projection = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "a8eb253a-2460-4cf5-83bd-247cd42dd243")]
        public readonly InputSlot<bool> ShowClock = new InputSlot<bool>();

    }
}

