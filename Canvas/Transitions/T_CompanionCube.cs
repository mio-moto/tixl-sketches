using T3.Core.DataTypes;
using T3.Core.DataTypes;
using T3.Core.DataTypes;
using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas.Transitions{
    [Guid("e7c20d60-5ae8-42a2-ba6a-638f355375fe")]
    internal sealed class T_CompanionCube : Instance<T_CompanionCube>
    {

        [Input(Guid = "c7312002-87d3-41ed-b91b-448cc797c7cb")]
        public readonly InputSlot<bool> Transition = new InputSlot<bool>();

        [Input(Guid = "465fd5a5-3a62-4d1b-9271-106720dd5da0")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckA = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "3ef83355-483f-4d8d-96dc-23314f88d3c5")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckB = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "a6eccc77-f1c8-4296-8bf0-4bf10dc0b970")]
        public readonly InputSlot<float> Time = new InputSlot<float>();

        [Output(Guid = "a85bc884-d69a-4829-a409-b64417d33171")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "c687bc15-7b71-4ac2-9a98-3b4948254779")]
        public readonly Slot<int> DeckCounter = new Slot<int>();

    }
}

