using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("077610fb-1d24-4d0a-98eb-932e9421c746")]
    internal sealed class Helper_GradientMixer : Instance<Helper_GradientMixer>
    {
        [Output(Guid = "63824ab2-70cc-461c-a9f0-55c2e8c8fc3e")]
        public readonly Slot<Gradient> Result = new Slot<Gradient>();

        [Input(Guid = "2ba54b2f-cf4b-49cf-98f6-93d2aa137782")]
        public readonly InputSlot<bool> UseBaseGradient = new InputSlot<bool>();

        [Input(Guid = "3577126f-97a5-48c2-ade2-ecc276615661")]
        public readonly InputSlot<int> OffGradientNumber = new InputSlot<int>();


    }
}

