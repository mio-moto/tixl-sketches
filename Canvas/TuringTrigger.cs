
using T3.Core.Utils;

namespace Mio.General.Canvas;

[Guid("a9a75f64-6ad8-49b3-86ff-46c5a9fd349e")]
public sealed class TuringTrigger :Instance<TuringTrigger>{

    [Output(Guid = "320be7e0-1e6a-4725-9574-799eb5c30ac7", DirtyFlagTrigger = DirtyFlagTrigger.Animated)]
    public readonly Slot<float> Result = new();
    [Output(Guid = "10dfbb7b-4a3f-45b4-838b-abe16120de2c", DirtyFlagTrigger = DirtyFlagTrigger.Animated)]
    public readonly Slot<bool> WasHit = new();
    

    [Input(Guid = "0f2fd449-50aa-4764-bc4f-60fab918210b")]
    public readonly InputSlot<int> Steps = new();

    [Input(Guid = "5ceb69c5-5add-4905-bf94-daf2ca3021be")]
    public readonly InputSlot<float> Rate = new();

    [Input(Guid = "8317e688-e941-4746-9f7b-9deb89ed5698")]
    public readonly InputSlot<float> Quantization = new();
    
    [Input(Guid = "47de4767-18a5-4ea7-87da-04de76730cad")]
    public readonly InputSlot<float> MinValue = new();

    [Input(Guid = "a806d70c-45ee-4c12-b3d4-1ecc75ce5c0d")]
    public readonly InputSlot<float> MaxValue = new();

    [Input(Guid = "94588995-ec30-4072-a75a-1a1f1205578d")]
    public readonly InputSlot<float> Chance = new();


    private List<float> _currentSequence = new();
    
    private double _lastUpdateTime = -1;
    private bool _isSet;

    public TuringTrigger()
    {
        Result.UpdateAction += Update;
        WasHit.UpdateAction += Update;
    }

    private static float QuantizeFloat(float min, float max, float quantization)
    {
        var value = Random.Shared.NextFloat(min, max);
        if (quantization != 0)
        {
            var reminder = value % quantization;
            value -= reminder;
        }
        return value;
    }

    private void SeedList(int steps, float min, float max, float quantization)
    {
        if (steps != _currentSequence.Count)
        {

            if (steps > _currentSequence.Count)
            {
                for (var i = _currentSequence.Count; i < steps; i += 1)
                {
                    _currentSequence.Add(Random.Shared.NextFloat(0, 1));
                }
            }
            else
            {
                _currentSequence.RemoveRange(steps - 1, _currentSequence.Count - steps);
            }
        }

        // ensure all values are within range
        for (var i = 0; i < _currentSequence.Count; i += 1)
        {
            var value = _currentSequence[i];
            if (value < min || value > max)
            {
                _currentSequence[i] =  QuantizeFloat(min, max, quantization);
            }
        }
    }

    private int _lastStepIndex = -1;

    private void Update(EvaluationContext context)
    {
        var steps = Steps.GetValue(context);
        if (steps <= 0)
        {
            return;
        }

        if (Math.Abs(context.LocalFxTime - _lastUpdateTime) < 0.0001f)
        {
            return;
        }

        _lastUpdateTime = context.LocalFxTime;
        
        var minValue = MinValue.GetValue(context);
        var maxValue = MaxValue.GetValue(context);
        var rate = Rate.GetValue(context);
        var quantization = Quantization.GetValue(context);
        var chance = Chance.GetValue(context);
        
        // ensure sequence steps are in desired length and range
        SeedList(steps, minValue, maxValue, quantization);
        
        
        var time = context.LocalFxTime * rate;
        var normalizedBarTime = (float)MathUtils.Fmod(time, 1).Clamp(0, 0.999999);
        var stepIndex = (int)Math.Floor(normalizedBarTime * steps);
        if (stepIndex < 0)
        {
            stepIndex = 0;
        }

        var wasHit = stepIndex != _lastStepIndex && _currentSequence[stepIndex] > 0;
        WasHit.Value = wasHit;
        if (wasHit && Random.Shared.NextFloat(0, 1) < chance)
        {
            _currentSequence[stepIndex] = Random.Shared.NextFloat(0, 1);
        }
        _lastStepIndex = stepIndex;
        var stepValue = MathUtils.Remap(_currentSequence[stepIndex], 0, 1, minValue, maxValue);
        if (Math.Abs(quantization) > 0.00001f)
        {
            stepValue = MathF.Round(stepValue / quantization) * quantization;
        }
        Result.Value = stepValue;
        Result.DirtyFlag.Clear();
        WasHit.DirtyFlag.Clear();
        
        foreach(var entry in _currentSequence)
        {
            Console.Write($"{entry} ");
        }

        Console.WriteLine();


    }
}