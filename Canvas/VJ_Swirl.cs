using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("8696ac40-15c4-42e2-99a1-be8ddf71149c")]
    internal sealed class VJ_Swirl : Instance<VJ_Swirl>
    {
        [Output(Guid = "fa402da6-69b3-471b-9432-46771df0e0a2")]
        public readonly Slot<Texture2D> Output = new Slot<Texture2D>();

        [Input(Guid = "852a825c-b84f-4106-b0e4-f78d3d383343")]
        public readonly InputSlot<float> Destruction = new InputSlot<float>();


    }
}

