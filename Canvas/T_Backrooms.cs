using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("48d91b80-cfdf-47d6-9570-93739606354e")]
    internal sealed class T_Backrooms : Instance<T_Backrooms>
    {

        [Input(Guid = "da7b2e69-a538-44e0-b14f-3091ac18a058")]
        public readonly InputSlot<bool> ToProjectionTwo = new InputSlot<bool>();

        [Input(Guid = "28cc48bf-e5a5-4578-a13e-37c1c7f04e78")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> ProjectionOne = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "87bf2ac1-cc0d-4398-905a-f948dc2f73b2")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> ProjectionTwo = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "fa1b6998-7aec-4fc2-8fa2-e4c54cad3339")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

