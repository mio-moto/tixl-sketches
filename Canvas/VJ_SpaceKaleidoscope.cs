using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("8c14ba6b-02ab-4698-9a4d-8c4d9722da21")]
    internal sealed class VJ_SpaceKaleidoscope : Instance<VJ_SpaceKaleidoscope>
    {
        [Output(Guid = "4da554b0-7da3-4362-99fa-b2a42673cc65")]
        public readonly Slot<Texture2D> TextureOutput = new Slot<Texture2D>();

        [Input(Guid = "a14fd3aa-58f1-44c1-ac7b-a428546f9961")]
        public readonly InputSlot<float> SamplePosBackground = new InputSlot<float>();

        [Input(Guid = "ad75c8a1-0ad8-4064-aae1-95a107132673")]
        public readonly InputSlot<float> SamplePosForeground = new InputSlot<float>();

        [Input(Guid = "2f95223c-6382-4a48-ae9f-08e60987dd29")]
        public readonly InputSlot<float> SamplePosHighlight = new InputSlot<float>();

        [Input(Guid = "54fb06ed-7764-4e16-9e15-0c8ae1bd5c37")]
        public readonly InputSlot<T3.Core.DataTypes.Gradient> Gradient = new InputSlot<T3.Core.DataTypes.Gradient>();


    }
}

