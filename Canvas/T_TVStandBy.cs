using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("ad783fb0-a662-4ebd-842c-58ddba262770")]
    internal sealed class T_TVStandBy : Instance<T_TVStandBy>
    {

        [Output(Guid = "4b211970-0233-47c9-8f71-6fcb33faff21")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Image = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "ea8639e1-5a9e-4c5e-b61b-9fd091bc3a8b")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Projection = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "997a2c70-b6ca-42dd-ac64-521026370f5c")]
        public readonly InputSlot<bool> ShowStandBy = new InputSlot<bool>();

    }
}

