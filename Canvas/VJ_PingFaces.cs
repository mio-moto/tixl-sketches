using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("c5d7adaf-a9ed-4880-9466-92772a78b9d6")]
    internal sealed class VJ_PingFaces : Instance<VJ_PingFaces>
    {

        [Output(Guid = "5cbbba3f-5b57-4a1e-a260-cefaab4867ea")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "d574cf21-1e0d-47b1-b5d1-70fb05e7996b")]
        public readonly InputSlot<bool> Reset = new InputSlot<bool>();

    }
}

