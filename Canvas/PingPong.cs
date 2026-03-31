using System;
using System;
using System;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("2b72e8c5-d36a-4fbf-82c1-dca65c8587ff")]
    internal sealed class PingPong : Instance<PingPong>
    {
        [Output(Guid = "c0151384-b058-40d9-a1b3-aeebdd3b3010")]
        public readonly Slot<float> Result = new Slot<float>();

        [Input(Guid = "80421e6a-3cc2-45d8-b1a8-dd2f7fc02c40")]
        public readonly InputSlot<float> Value = new InputSlot<float>();

        [Input(Guid = "eecba7d7-0d08-461f-b5f5-8d3b37968974")]
        public readonly InputSlot<float> Scale = new InputSlot<float>();

    }
}

