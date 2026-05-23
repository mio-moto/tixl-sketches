namespace Mio.General.Canvas.Balatro;

[Guid("d2695f3b-d674-4485-9560-e8c0d1414a9d")]
internal sealed class BalatroSpectral : Instance<BalatroSpectral>
{
    [Output(Guid = "dd8bad5a-ddb3-4bfa-b12c-c9cef423b7a2")]
    public readonly Slot<Texture2D> Output = new Slot<Texture2D>();


    [Input(Guid = "29ca8cfd-5771-4cf8-94a8-9cf8d4f3321a")]
    public readonly InputSlot<int> Index = new InputSlot<int>();

}