using System.Diagnostics.CodeAnalysis;

namespace Mio.General.Canvas
{
    [SuppressMessage("Interoperability", "CA1416:Validate platform compatibility")]
    internal sealed class ColorMap : Instance<ColorMap>
    {
        [Output(Guid = "41aab94d-c2d4-4334-8312-8bd74d83f5df")]
        public readonly Slot<string> Overdone = new Slot<string>();

        public readonly InputSlot<string> InputText = new();

        public ColorMap()
        {
            Overdone.UpdateAction = Update;
        }

        private void Update(EvaluationContext context)
        {
            var inString = InputText.GetValue(context);
            Overdone.Value = inString.Replace("TiXL", "Tooolll");
        }
    }
}
