using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("694e1edc-1531-4a2f-b861-107a47b3f642")]
    internal sealed class PFX_PIPOverlay : Instance<PFX_PIPOverlay>
    {

        [Input(Guid = "c72a49cd-b49d-4b94-93ac-454109309e32")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Image = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "69d9b5ff-2c25-40a7-8176-6c17da821ba4")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

