using System;
using T3.Core.DataTypes;
using System;
using System;
using System;
using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas.Transitions{
    [Guid("a2d672ec-bc6c-469c-a959-014b07b4c6e2")]
    internal sealed class TransitionCounter : Instance<TransitionCounter>
    {
        [Output(Guid = "b8e8cb33-5b69-4629-8c0d-e5925cb3fd39")]
        public readonly Slot<Texture2D> Output = new Slot<Texture2D>();

        [Input(Guid = "c76113bd-5156-4aba-8ee3-14f5dfdf4d52")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Image = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "1a474114-2b29-4d37-8b8e-4045d649a628")]
        public readonly InputSlot<int> BackroomsCounter = new InputSlot<int>();

        [Input(Guid = "56299ff1-3f14-4a31-976e-d4c2ff1d04eb")]
        public readonly InputSlot<int> CrossfadeCounter = new InputSlot<int>();

        [Input(Guid = "5de506d9-092f-4edb-a9c3-9807f3aac47f")]
        public readonly InputSlot<int> ZappingCounter = new InputSlot<int>();

        [Input(Guid = "5eaecebe-ca1c-40c6-81dc-fe8382a736ee")]
        public readonly InputSlot<int> CompanionCounter = new InputSlot<int>();

        [Input(Guid = "921be922-775d-4700-b12f-d9d863ba0c1c")]
        public readonly InputSlot<int> BalatroCounter = new InputSlot<int>();

        [Input(Guid = "4b49963e-1488-4a5c-b0f0-0bcb1c9735b2")]
        public readonly InputSlot<int> OIIAIICounter = new InputSlot<int>();

    }
}

