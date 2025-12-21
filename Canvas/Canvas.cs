using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using System.Runtime.InteropServices;
using T3.Core.DataTypes;
using T3.Core.Operator.Interfaces;
using T3.Core.Operator.Slots;
using T3.Core.Resource;

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
