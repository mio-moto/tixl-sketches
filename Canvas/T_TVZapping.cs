using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("349f4746-a2c6-4732-b850-c66f10c8e35c")]
    internal sealed class T_TVZapping : Instance<T_TVZapping>
    {

        [Input(Guid = "0a0bba8d-0511-4ef8-9971-7599b230fc56")]
        public readonly InputSlot<bool> Transition = new InputSlot<bool>();

        [Input(Guid = "216e8d88-ebcc-4ca2-9906-c5ed74f9bf5f")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckA = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "5be731c8-d7b1-4130-9fb4-0caddafebadc")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckB = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "959965d2-de90-48eb-b4b6-311540b40bb7")]
        public readonly InputSlot<float> EaseTime = new InputSlot<float>();

        [Output(Guid = "304d46e8-66cf-4078-97bb-4c14801067e3")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "28f2ca26-7f26-41d2-85f6-8ac6e323d18b")]
        public readonly Slot<int> ZappingCounter = new Slot<int>();

    }
}

