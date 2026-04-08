using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("d942a611-b719-41ec-81ba-a50b71722fc1")]
    internal sealed class VJ_BoobvorsenAttractor : Instance<VJ_BoobvorsenAttractor>
    {

        [Output(Guid = "bc5d3378-8c8a-4c96-952a-7fcaeaa17c0c")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "2f28b4de-8944-40f8-bf86-e0de6049e1aa")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirrorOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "ae5684ee-cf97-4f19-86bb-0834a93416bb")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> FeedbackOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "c47b3569-c7cb-4ed7-b097-135d499c25f2")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirrorFeedbackOutput = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

