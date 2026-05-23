namespace Mio.General.Canvas;

[Guid("4097ce7a-1362-4f20-bfa0-32af2cd53a06")]
internal sealed class Canvas : Instance<Canvas>
{
}

// ReSharper disable once UnusedType.Global
public sealed class ShareDefinition : IShareResources
{
    // ReSharper disable once EmptyConstructor
    public ShareDefinition(){}
    #pragma warning disable CA1822
    public bool ShouldShareResources => true;
    #pragma warning restore CA1822
}
