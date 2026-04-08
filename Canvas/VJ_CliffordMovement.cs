using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("f289ddbd-0ca7-45b7-94b0-23b91609057c")]
    internal sealed class VJ_CliffordMovement : Instance<VJ_CliffordMovement>
    {

        [Output(Guid = "c6126f92-8824-41a1-b47c-e611d35f026c")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "d9fc60b9-b6ff-4d9e-8cea-04745ffe01f7")]
        public readonly InputSlot<float> Speed = new InputSlot<float>();

        [Input(Guid = "728ab618-ddc6-467b-9342-1595bddb1aa0")]
        public readonly InputSlot<float> BentOrbitSpeed = new InputSlot<float>();

        [Input(Guid = "cfe308ed-513c-489c-8c54-bfa8872a55a7")]
        public readonly InputSlot<float> Persistence = new InputSlot<float>();

        [Output(Guid = "0172ddf5-8482-479c-807c-3697fe09337b")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> BentOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "ae993afe-2f22-4c14-93a0-4d34201c1fb7")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> RawOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "f23c9667-ae5d-4d3c-9c1d-2edf2c203cea")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirrorOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "28dc4048-0c8a-45fc-9228-894e0b9095ff")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> FeedbackOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "835d4150-41d1-49a5-b2ed-ecc456e4a24e")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> FeedbackMirrorOutput = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

