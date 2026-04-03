using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("ec086d84-958a-4fc0-adf7-49f9e7d67dba")]
    internal sealed class PFX_DVDBounce : Instance<PFX_DVDBounce>
    {

        [Input(Guid = "8ec55b64-78c4-4a4d-aeae-dd3d61052096")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Image = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "d48599fa-f886-4d66-a0a2-78eae40a4e08")]
        public readonly InputSlot<float> Speed = new InputSlot<float>();

        [Output(Guid = "28862d5d-8601-4009-b9f3-ef7703ff85b8")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

