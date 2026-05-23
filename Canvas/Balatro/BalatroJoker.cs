namespace Mio.General.Canvas.Balatro;

[Guid("c4dccf4a-a164-4b4b-be41-5bc300d60950")]
internal sealed class BalatroJoker : Instance<BalatroJoker>
{

    [Input(Guid = "7f52fe74-5110-49bb-a2d0-616c1c806aef")]
    public readonly InputSlot<int> JokerIndex = new InputSlot<int>();

    [Output(Guid = "95ce2635-a13e-4a5f-83e4-83f66f1915b5")]
    public readonly Slot<T3.Core.DataTypes.Texture2D> Card = new Slot<T3.Core.DataTypes.Texture2D>();

}