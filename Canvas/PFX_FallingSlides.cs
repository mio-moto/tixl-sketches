using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("7ca9c5eb-4b17-4ae5-9435-72e9173b59f5")]
    internal sealed class PFX_FallingSlides : Instance<PFX_FallingSlides>
    {

        [Input(Guid = "6c5564a8-7f8f-4bc7-bc52-60c7ea0d558c")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Image = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "6d97de88-8441-46e2-b06c-1c9abf8f9510")]
        public readonly InputSlot<float> Rate = new InputSlot<float>();

        [Output(Guid = "660f0637-4fc9-409c-8ff8-5bcfac3ca44f")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

