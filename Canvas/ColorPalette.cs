
using System.Diagnostics.CodeAnalysis;
using System.Text.Json;

namespace Mio.General.Canvas{
    [Guid("441791b9-3675-4b24-9c2d-aad316ed6615")]
    [SuppressMessage("Interoperability", "CA1416:Validate platform compatibility")]
    internal sealed class ColorPalette : Instance<ColorPalette>
    {
        private record ColorDto(float r, float g, float b, float a)
        {
            public Vector4 ToColor() => new Vector4(r, g, b, a);
        };

        private record GradientDto(string title, ColorDto[] colors)
        {
            public Vector4[] ToColors() => colors.Select(x => x.ToColor()).ToArray();
        };

        private List<GradientDto> _gradients = new ();

        
        [Output(Guid = "41aab94d-c2d4-4334-8312-8bd74d83f5df")]
        public readonly Slot<Gradient> OutGradient = new();
        
        [Output(Guid = "41afb94d-c2d4-4334-8312-8bd74d83f5df")]
        public readonly Slot<string> OutName = new();

        [Input(Guid = "41aab94d-c2d4-4334-8312-8bd74d83f5af")]
        public readonly InputSlot<int> Index = new();

        [Input(Guid = "8d125e59-83d1-44a7-8cb3-cef2964f9b5e")]
        public readonly InputSlot<string> GradientFile = new();

        [Input(Guid = "e14484d1-f3ad-4ce4-963a-d5d9e356c220")]
        public readonly InputSlot<bool> OverrideInterpolation = new();
        [Input(Guid = "9e2a0603-4441-44f9-b733-970407b00fb8", MappedType = typeof(Gradient.Interpolations))]
        public readonly InputSlot<int> Interpolation = new();
        public ColorPalette()
        {
            OutGradient.UpdateAction += Update;
            OutName.UpdateAction += Update;
        }

        private void Update(EvaluationContext context)
        {
            ReloadGradients(context);
            if (_gradients.Count <= 0)
            {
                return;
            }
            
            var number = Math.Clamp(Index.GetValue(context), 0, _gradients.Count - 1);
            var gradient = _gradients[number];
            OutName.Value = gradient.title;
            OutGradient.Value = MakeEquidistantGradient(gradient.ToColors());
            if (OverrideInterpolation.GetValue(context))
            {
                OutGradient.Value.Interpolation = (Gradient.Interpolations)Interpolation.GetValue(context);
            }
            // OutGradient.Value.Interpolation = (Gradient.Interpolations) Interpolation.GetValue(context);
        }

        private void ReloadGradients(EvaluationContext context)
        {
            if (!GradientFile.IsDirty)
            {
                return;
            }
            var path = GradientFile.GetValue(context);
            if (path == null)
            {
                return;
            }
            if (!TryGetFilePath(path, out var fullPath))
            {
                Log.Warning($"No file found at: {path}", this);
            }

            var allText = File.ReadAllText(fullPath);
            var result = JsonSerializer.Deserialize<List<GradientDto>>(allText);
            if (result != null)
            {
                Log.Info($"Loaded {result.Count} gradients");
                _gradients = result;
            }
        }

        
        
        private static Gradient MakeEquidistantGradient(params Vector4[] colors)
        {
            var gradient = new Gradient();
            var steps = colors.Length - 1;
            var reciproc = 1.0f / steps;
            for (var i = 0; i < colors.Length; i += 1)
            {
                var location = reciproc * i;
                var item = new Gradient.Step(color: colors[i], id: Guid.NewGuid())
                {
                    NormalizedPosition = location
                };
                gradient.Steps.Add(item);
            }
            return gradient;
        }
    }
}

