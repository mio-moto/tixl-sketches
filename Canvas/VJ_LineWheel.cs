using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("1684c291-10c2-4ea5-8ebc-7569e296e06b")]
    internal sealed class VJ_LineWheel : Instance<VJ_LineWheel>
    {

        [Output(Guid = "e6aa7caf-f4be-442a-af0f-d9e8cf56424d")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "b4eee53c-432a-4db3-b9bf-de194b3a3cf0")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> FeedbackOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "0f583bdb-f192-42a1-9efb-248685f4a98c")]
        public readonly InputSlot<float> Speed = new InputSlot<float>();

        [Input(Guid = "6fd5a7af-0473-4fae-a81c-f4654c26912e")]
        public readonly InputSlot<float> Persistence = new InputSlot<float>();

        [Input(Guid = "fee1e173-d11e-4fa7-a6af-0c9d91e8ddc7")]
        public readonly InputSlot<float> OverrideTime = new InputSlot<float>();

        [Input(Guid = "f6d509b4-b4f6-4f8c-8ec2-b7f654d0059b")]
        public readonly InputSlot<float> CameraSpeed = new InputSlot<float>();

        [Input(Guid = "9d0c63bf-d7da-4866-806a-4931bee33d50")]
        public readonly InputSlot<float> CameraDistance = new InputSlot<float>();

        [Input(Guid = "edd8dd7a-a38d-42eb-a201-2b05167fbb62")]
        public readonly InputSlot<float> CameraEaseTime = new InputSlot<float>();

        [Input(Guid = "117875ed-e59d-4b29-8e60-de8daf5ca9a8")]
        public readonly InputSlot<int> ChangeEveryNth = new InputSlot<int>();

    }
}

