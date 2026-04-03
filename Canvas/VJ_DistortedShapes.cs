using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("5a5584a3-e682-4980-a9e0-21883732274b")]
    internal sealed class VJ_DistortedShapes : Instance<VJ_DistortedShapes>
    {

        [Output(Guid = "08a0276b-f52a-4830-bdc3-dec8510b047c")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Image = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "7860859c-1c8b-49cf-a4a2-3f5979adce74")]
        public readonly InputSlot<float> Speed = new InputSlot<float>();

    }
}

