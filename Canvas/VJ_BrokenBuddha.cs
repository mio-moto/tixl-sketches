using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("8c80d778-e847-4299-a0b9-4782c0a39f01")]
    internal sealed class VJ_BrokenBuddha : Instance<VJ_BrokenBuddha>
    {
        [Output(Guid = "d37f7811-e612-4851-9d10-9bbfffc45d20")]
        public readonly Slot<Texture2D> Output = new Slot<Texture2D>();


    }
}

