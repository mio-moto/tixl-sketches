using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("067b9771-7ec9-41b4-aa3c-590240bdc37d")]
    internal sealed class VJ_OilPulse :Instance<VJ_OilPulse>    {

        [Output(Guid = "dec4361f-247d-4383-8b2b-491c3b7c9b3f")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Image = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "1e6bad98-dfee-4410-bca7-d8a616c01c2b")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirrorImage = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

