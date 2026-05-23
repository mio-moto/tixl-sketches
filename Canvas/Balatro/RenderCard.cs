namespace Mio.General.Canvas.Balatro;

[Guid("e2b9bfa9-34a7-4da4-ab8c-0b1b5e03effc")]
internal sealed class RenderCard :Instance<RenderCard>{

        [Input(Guid = "3b66d342-37a7-43d9-acc4-64b1dc2e75b8")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Front = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "fcc9f8d2-eb85-43dc-9633-6be87686cb4e")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Back = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "104aa409-7535-4bc3-8753-77954b8ec6f4")]
        public readonly Slot<T3.Core.DataTypes.Command> Command = new Slot<T3.Core.DataTypes.Command>();


}