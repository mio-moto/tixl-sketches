namespace Mio.General.Canvas.Balatro;

[Guid("620aa2e9-a249-4472-8dc8-0d41dba87710")]
internal sealed class BalatroBack : Instance<BalatroBack>
{
    [Output(Guid = "e077372f-815d-4f30-97f0-12e679ced5ac")]
    public readonly Slot<Texture2D> Output = new Slot<Texture2D>();

    [Input(Guid = "48b794e5-2a4f-4ca8-9d60-a51bd0c5d58e")]
    public readonly InputSlot<int> Index = new InputSlot<int>();


}