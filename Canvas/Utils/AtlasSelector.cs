namespace Mio.General.Canvas.Utils;

[Guid("0440414e-1a30-4c84-8b8b-cebce01335f1")]
internal sealed class AtlasSelector :Instance<AtlasSelector>{
    [Output(Guid = "3285eb23-0369-4e53-9a88-d28291bce3cf")]
    public readonly Slot<Int2> LeftRight = new();
    [Output(Guid = "ac0d49d4-02cf-4356-8fed-9c1c97c58a89")]
    public readonly Slot<Int2> TopBottom = new();

        [Input(Guid = "c4b01474-4662-479f-84f1-4a5fbd8b7206")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Atlas = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "00fe3d18-5f3a-4b41-863c-cd8a4d7ebb69")]
        public readonly InputSlot<T3.Core.DataTypes.Vector.Int2> AtlasSize = new InputSlot<T3.Core.DataTypes.Vector.Int2>();

        [Input(Guid = "72b59651-c39a-41b9-bba4-16714fe72d2c")]
        public readonly InputSlot<int> Index = new InputSlot<int>();

    
    public AtlasSelector()
    {
        LeftRight.UpdateAction += Update;
        TopBottom.UpdateAction += Update;
    }

    private void Update(EvaluationContext obj)
    {
        var atlas = Atlas.GetValue(obj);
        if (atlas == null)
        {
            LeftRight.DirtyFlag.Clear();
            TopBottom.DirtyFlag.Clear();
            return;
        }

        var imageSizeX = atlas.Description.Width;
        var imageSizeY = atlas.Description.Height;
        
        var atlasSize = AtlasSize.GetValue(obj);
        if (imageSizeX <= 0 || imageSizeY <= 0 || atlasSize.Width <= 0 || atlasSize.Height <= 0)
        {
            LeftRight.DirtyFlag.Clear();
            TopBottom.DirtyFlag.Clear();            return;
        }
        
        var slots = atlasSize.Width * atlasSize.Height;
        var index = Index.GetValue(obj) % slots;
        var x = index % atlasSize.Width;
        var y = index / atlasSize.Width;

        
        var width = imageSizeX / atlasSize.Width;
        var height = imageSizeY / atlasSize.Height;

        var posX = x * width;
        var posY = y * height;
        LeftRight.Value = new Int2(-posX, -imageSizeX + posX + width);
        TopBottom.Value = new Int2(-posY, -imageSizeY + posY + height);
    }
}