namespace Mio.General.Canvas.Scenes;

[Guid("c919b832-bb11-453b-86ca-29da5ef81b44")]
internal sealed class VJ_CenterKaleidoscope : Instance<VJ_CenterKaleidoscope>
{

    [Output(Guid = "a6a96bda-db21-40af-b228-b2a3188d2a88")]
    public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

    [Input(Guid = "1095ccd1-8e21-48c4-926f-5e045bd8d697")]
    public readonly InputSlot<float> Speed = new InputSlot<float>();

}