using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("f1be1503-72d7-487f-8e7c-35069f0c8e22")]
    internal sealed class VJ_ParticlePlane : Instance<VJ_ParticlePlane>
    {

        [Output(Guid = "66346fd2-7546-4c7d-b622-0ab2dbe774c8")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "3fa1c13e-98a9-41fb-9d14-b1c6554f320a")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> FeedbackOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "c6196e04-0cb7-48f3-8147-a55305a76fc3")]
        public readonly InputSlot<int> SwitchEveryNth = new InputSlot<int>();

    }
}

