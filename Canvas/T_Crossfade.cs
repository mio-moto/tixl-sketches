using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("c322a413-eca8-419c-8a36-e8a54eb1b50d")]
    internal sealed class T_Crossfade : Instance<T_Crossfade>
    {

        [Input(Guid = "4cd92447-5101-42c7-aa59-8a5496a4bb33")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> ImageOne = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "572742aa-77c0-443a-b18c-1b748ca33bc1")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> ImageTwo = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "6cdfad2f-4f38-4584-a91a-c2f6cbf6131d")]
        public readonly InputSlot<bool> ShowImageTwo = new InputSlot<bool>();

        [Input(Guid = "c8931131-fe78-4625-a7d6-92df73bf96d9")]
        public readonly InputSlot<float> EaseTime = new InputSlot<float>();

        [Output(Guid = "8cfa8c3c-1018-46e4-87cd-aec18d254339")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

