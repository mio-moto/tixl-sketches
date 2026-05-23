namespace Mio.General.Canvas.Utils;

[Guid("e331ecb6-5b40-4b63-93c0-5a0fac0b4ab9")]
internal sealed class Helper_MainBrightness : Instance<Helper_MainBrightness>
{
    [Output(Guid = "e20b88d0-adb2-4f20-aad2-aa4e4388805d")]
    public readonly Slot<Vector4> Result = new Slot<Vector4>();

    [Input(Guid = "67e2bcdc-6624-4595-88f3-5438887b0b29")]
    public readonly InputSlot<bool> Show = new InputSlot<bool>();


}