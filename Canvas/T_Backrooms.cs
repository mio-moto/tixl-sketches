using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("48d91b80-cfdf-47d6-9570-93739606354e")]
    internal sealed class T_Backrooms : Instance<T_Backrooms>
    {

        [Input(Guid = "077c5aa0-04bd-46fa-8692-5ce1d2337cec")]
        public readonly InputSlot<bool> Transition = new InputSlot<bool>();

        [Input(Guid = "55b89bff-9acf-4c6f-a406-8ac52de52a4c")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckA = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "6707ecec-f75b-44ae-b53a-cfb09c19dfc4")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> DeckB = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "7c91677b-e00e-464d-be16-9e28c7821372")]
        public readonly InputSlot<float> EaseTime = new InputSlot<float>();

        [Output(Guid = "fa1b6998-7aec-4fc2-8fa2-e4c54cad3339")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "d2d90387-8625-4295-a3cd-9a0ebbf51809")]
        public readonly Slot<int> BackroomsCounter = new Slot<int>();

    }
}

