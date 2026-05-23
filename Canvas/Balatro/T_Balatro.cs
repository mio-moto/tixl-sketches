using T3.Core.DataTypes;
using T3.Core.DataTypes;
using System;
using System;
using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas.Balatro{
    [Guid("79a379ff-7f4e-473e-8210-812170ef2ad9")]
    internal sealed class T_Balatro : Instance<T_Balatro>
    {
        [Output(Guid = "08fc5dbf-c9ce-4f39-b7df-0d19c7be623b")]
        public readonly Slot<Texture2D> Output = new Slot<Texture2D>();
        
        [Output(Guid = "d2b7d9f1-8224-446c-b465-b89f35a0d840")]
        public readonly Slot<int> Result = new Slot<int>();

        [Input(Guid = "a8a4f5bb-b4d3-47d1-9ba8-3cc158bbe90f")]
        public readonly InputSlot<bool> Trigger = new InputSlot<bool>();

        [Input(Guid = "dd25eddb-145d-4fae-a3c1-f0abee209216")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckA = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "9ea25b49-b529-4994-9c2c-eebd4b6e84e7")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckB = new InputSlot<T3.Core.DataTypes.Texture2D>();

    }
}

 