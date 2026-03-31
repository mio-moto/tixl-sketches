namespace Mio.General.Canvas;

[Guid("b7a20146-633c-41d6-8f53-2e1d9629c58c")]
internal sealed class PartialClearCommand :Instance<PartialClearCommand>{

        [Output(Guid = "70450d76-305b-4fe0-9da2-3b8c193a1819")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "867beb6c-0c57-4738-be22-63401330c6d6")]
        public readonly InputSlot<T3.Core.DataTypes.Command> Command = new InputSlot<T3.Core.DataTypes.Command>();

        [Input(Guid = "8a595db0-2317-4e85-9939-217e4b363fab")]
        public readonly InputSlot<float> ClearRate = new InputSlot<float>();


}