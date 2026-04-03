using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("7b606bce-a72d-4cb5-96b3-b02bd1255260")]
    internal sealed class VJ_PingingTapes : Instance<VJ_PingingTapes>
    {

        [Output(Guid = "dfb8966e-6217-4e3a-9d68-f71d29a45ee0")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

