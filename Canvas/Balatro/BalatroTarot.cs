namespace Mio.General.Canvas.Balatro;

[Guid("965450b7-dfbb-4308-a30d-9ca29711e5c5")]
internal sealed class BalatroTarot : Instance<BalatroTarot>
{

    [Input(Guid = "fcfa006f-350b-4472-8405-1d4eb2272c58")]
    public readonly InputSlot<int> Index = new InputSlot<int>();

    [Output(Guid = "4b8e547d-d020-4b8f-87e2-23d6326a4d20")]
    public readonly Slot<T3.Core.DataTypes.Texture2D> Card = new Slot<T3.Core.DataTypes.Texture2D>();

}