using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("8e35f1cd-6931-4973-b1de-1eac1b90cbc5")]
    internal sealed class VJ_CamouflageTriangle : Instance<VJ_CamouflageTriangle>
    {

        [Input(Guid = "8897129f-8b0f-4d3b-8339-0e8c769b8856")]
        public readonly InputSlot<float> Sharpness = new InputSlot<float>();

        [Output(Guid = "f0c7ec5c-d144-446d-9400-53451a2ad09f")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Image = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "4be47de8-3204-4ad5-9ab9-1b1e5df19031")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> OilImage = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "cc0bac51-ae78-4398-b940-e7b3ef9a2247")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirrorOilImage = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "40b3232c-7b86-4db5-8d8c-0b14498663bd")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirrorImage = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "edaec665-ad15-46ce-be50-14d12ec8cc29")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> RotatingMirrorOilImage = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

