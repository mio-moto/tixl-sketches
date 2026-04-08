using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("441fa8bc-995a-4026-a803-8112feec9c6c")]
    internal sealed class VJ_DadrasAttractor : Instance<VJ_DadrasAttractor>
    {

        [Output(Guid = "09461101-f1a9-429e-8f15-f05c5edb285b")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "040261bb-6613-4901-8260-19f8320f1b36")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> FeedbackOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "5c2d45fe-d76d-4715-9f95-7c6b59241c70")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> SampleHoldOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "b3948c1b-9aef-4931-b210-dc0b59538d14")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirrorOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "7e282d6e-72bd-4868-8e12-b6dfe9f7845b")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirrorFeedbackOutput = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "1163b006-66fd-4636-b82b-73d22ca6e9dc")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> SampleHoldFeedbackOutput = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

