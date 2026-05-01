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

    }
}

