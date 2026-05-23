using T3.Core.DataTypes;
using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas.Balatro{
    [Guid("1b3da676-d19c-440b-9a1b-bed10e41b1e9")]
    internal sealed class Viz_Background : Instance<Viz_Background>
    {
        [Output(Guid = "c7a1b953-7a3a-42d0-9b81-02bba9062f96")]
        public readonly Slot<Texture2D> ColorBuffer = new Slot<Texture2D>();


    }
}

