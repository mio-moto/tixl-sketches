namespace Mio.General.Canvas.PostFX;

[Guid("59f2cbaa-8ab7-40f8-959b-a4f739f7fd57")]
internal sealed class PFX_CombTiling : Instance<PFX_CombTiling>
{

    [Input(Guid = "d97decec-af86-4d05-8ff4-70c3dd5891da")]
    public readonly InputSlot<T3.Core.DataTypes.Texture2D> Input = new InputSlot<T3.Core.DataTypes.Texture2D>();

    [Output(Guid = "ae1f39f8-bc99-4398-8476-3b8b5b8757da")]
    public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

}