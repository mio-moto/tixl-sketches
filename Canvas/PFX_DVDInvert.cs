using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("bc12e426-1216-47da-b678-610c40885d60")]
    internal sealed class PFX_DVDInvert : Instance<PFX_DVDInvert>
    {

        [Input(Guid = "f8ba18d9-e1d2-4be1-9eaa-2471c0627780")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Image = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "55d3d2ac-fcd4-41a5-a3d1-da5111cc7101")]
        public readonly InputSlot<float> Speed = new InputSlot<float>();

        [Output(Guid = "7d28eac5-b953-47de-bccf-ecce90d8ca55")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

