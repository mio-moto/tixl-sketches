namespace Mio.General.Canvas.Balatro;

[Guid("98f40b53-eb7e-459f-ae18-75d2b00749e2")]
internal sealed class BalatroCard : Instance<BalatroCard>
{

    [Output(Guid = "e9319dcc-7a6e-4ec0-a0cb-33af81fdec1f")]
    public readonly Slot<T3.Core.DataTypes.Command> Command = new Slot<T3.Core.DataTypes.Command>();

    [Input(Guid = "e532bbda-b623-4615-b4ec-5ab5d0a3adde")]
    public readonly InputSlot<int> CardIndex = new InputSlot<int>();

    [Input(Guid = "739fa52d-fa64-423c-b7c6-f923f047e6b2")]
    public readonly InputSlot<int> ValueIndex = new InputSlot<int>();

    [Input(Guid = "97a03c5a-e1b8-418c-9a44-36de9bfeb0d8")]
    public readonly InputSlot<bool> EnableOverlay = new InputSlot<bool>();

    [Input(Guid = "6e5083d1-54f6-4a09-9947-460a73aed4c3")]
    public readonly InputSlot<int> OverlayIndex = new InputSlot<int>();

    [Output(Guid = "71041fa0-2dcc-4b66-a419-637908333150")]
    public readonly Slot<T3.Core.DataTypes.Texture2D> Card = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "38c1b129-57d8-4887-addf-a061026bf988")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Background = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "a138412d-68e7-4081-a284-3f987973ca4f")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Foreground = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "8e22457b-e98c-4d18-8801-8fc102252684")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Overlay = new Slot<T3.Core.DataTypes.Texture2D>();

}