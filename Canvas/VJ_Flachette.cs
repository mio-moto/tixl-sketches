using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("893daaa6-79b2-41b6-aaf2-855519c9aadc")]
    internal sealed class VJ_Flachette : Instance<VJ_Flachette>
    {

        [Output(Guid = "9be240b4-7db4-4fa8-b154-6b6f69e3bb6e")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "85997ce4-b117-449a-ad39-a3a3e4aa5368")]
        public readonly InputSlot<float> Speed = new InputSlot<float>();

    }
}