using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("114e0ac5-dc96-4b12-975a-7f6d1e4265fc")]
    internal sealed class VJ_Rapture : Instance<VJ_Rapture>
    {

        [Output(Guid = "8928becf-eb5e-4747-8e70-e8cd874a8ff9")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "65e4e828-8df2-4238-9eb3-593fb872071e")]
        public readonly MultiInputSlot<float> Zoom = new MultiInputSlot<float>();

        [Input(Guid = "1b2198d7-f355-4b77-9c13-97987490366f")]
        public readonly MultiInputSlot<float> PulseBehavior = new MultiInputSlot<float>();

        [Input(Guid = "00b68d6d-1204-4352-b9c5-4689e737ad5b")]
        public readonly InputSlot<float> PulseRate = new InputSlot<float>();

        [Input(Guid = "85701bfa-e898-47ec-a9b7-f6ad8a6bb98b")]
        public readonly InputSlot<float> Lettering = new InputSlot<float>();

        [Input(Guid = "3d8db148-1a07-4fcf-bea0-c2e113bd2bcc")]
        public readonly InputSlot<float> Flow = new InputSlot<float>();

        [Input(Guid = "532820e3-5da4-432a-8ee0-612bd8652031")]
        public readonly InputSlot<float> Rotation = new InputSlot<float>();

    }
}

