using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("0c10b976-bbbe-4725-a3cf-2173f334e4c8")]
    internal sealed class VJ_MoodOfFalling : Instance<VJ_MoodOfFalling>
    {

        [Output(Guid = "fea10cf6-510b-452f-9e99-8ada5713c931")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Image = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

