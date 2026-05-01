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

    }
}

