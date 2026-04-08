using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("35c27f40-b42c-4efb-9955-23f2fd08c04b")]
    internal sealed class VJ_HalvorsenAttractor : Instance<VJ_HalvorsenAttractor>
    {

        [Output(Guid = "d48dc3e9-fedb-4fc0-87e3-8313fb455451")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "91f3ab99-f37b-42cd-aadb-fe554dc99628")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> OilOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "784bf348-9be1-4191-8cc5-6e17f51b1547")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirrorOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "ad883546-1151-4d20-8595-d1e10b076a65")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirrorOilOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "059d3679-664f-4bdb-9ff7-3c65782d9840")]
        public readonly InputSlot<float> Oilification = new InputSlot<float>();

        [Input(Guid = "f71770c8-3b99-419f-bb71-e8bb02e9cf8c")]
        public readonly InputSlot<T3.Core.DataTypes.Gradient> OilGradient = new InputSlot<T3.Core.DataTypes.Gradient>();

        [Input(Guid = "7f8e7dcd-dc55-4ef4-bf75-4d7f8dc4c974")]
        public readonly InputSlot<float> Speed = new InputSlot<float>();

    }
}

