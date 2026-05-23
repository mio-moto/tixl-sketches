namespace Mio.General.Canvas.Balatro;

[Guid("e23a53b7-7374-41e4-aa30-a18e0f9d4316")]
internal sealed class BalatroPlanet : Instance<BalatroPlanet>
{

    [Input(Guid = "562b5e04-f2ee-4ea1-ae1a-6755642f82e7")]
    public readonly InputSlot<int> Index = new InputSlot<int>();

    [Output(Guid = "8c2a1ba6-8ffd-4d61-bcc9-91c6e6f79ffb")]
    public readonly Slot<T3.Core.DataTypes.Texture2D> Card = new Slot<T3.Core.DataTypes.Texture2D>();

}