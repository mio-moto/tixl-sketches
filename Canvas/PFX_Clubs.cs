using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("b11e57ef-2b9b-43bf-9e99-732890ad7402")]
    internal sealed class PFX_Clubs : Instance<PFX_Clubs>
    {

        [Output(Guid = "5d39a08a-c482-4c32-88f1-4c096340bec0")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Image = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "901a8cb1-b08d-4a6a-80c4-3b38f744050f")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Input = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "8622bc30-7daa-4a2e-ba78-2b6a831bdc17")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> SampleAndHold = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "357e66bb-5544-4608-93ea-51af296c15ef")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> PartialClearTexture = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

