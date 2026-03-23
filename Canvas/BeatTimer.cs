using T3.Core.Animation;
using T3.Core.Utils;

namespace Mio.General.Canvas;

[Guid("297d8ceb-8217-4da6-a18b-aa0b2abe6a9d")]
internal sealed class BeatTimer :Instance<BeatTimer>{
    [Output(Guid = "fc4cae18-895a-461e-8dd6-9927caaf702c")]
    public readonly Slot<float> Beat = new();

    [Output(Guid = "daa79fcd-d056-4a90-a116-ff6dc10c207a")]
    public readonly Slot<float> Fraction = new();

    [Output(Guid = "427ede62-b72c-45b1-8401-927c6f091516")]
    public readonly Slot<float> Time = new();

    [Input(Guid = "92DF1464-FA61-4DA2-9481-8F17B7AD4EA0")]
    public readonly InputSlot<float> TimeDivider = new InputSlot<float>();

    [Input(Guid = "9cc3cf0b-f2c1-40a4-9673-088ec3d395e1")]
    public readonly InputSlot<float> ExponentialFalloff = new InputSlot<float>();
    
    private enum TimeModes
    {
        LocalIdleMotionFxTime,
        LocalTime,
        PlaybackTime,
        Runtime,
        Frozen,
    }

    [Input(Guid = "27b8bb0a-8052-4e6e-a2b9-875f598ec981", MappedType = typeof(TimeModes))]
    public readonly InputSlot<int> Mode = new InputSlot<int>();

    private bool _isFrozen;


    public BeatTimer()
    {
        Beat.UpdateAction += Update;
        Fraction.UpdateAction += Update;
        Time.UpdateAction += Update;
    }

    private void Update(EvaluationContext context)
    {
        var exponentialFalloff = ExponentialFalloff.GetValue(context);
        var timeDivider = TimeDivider.GetValue(context);
        
        var timeMode = Mode.GetEnumValue<TimeModes>(context);

        
        // Disable dirty flagging
        var isFrozen = timeMode != TimeModes.Frozen;
        if (isFrozen != _isFrozen)
        {
            Beat.DirtyFlag.Trigger = Fraction.DirtyFlag.Trigger = Time.DirtyFlag.Trigger = timeMode != TimeModes.Frozen 
                ? DirtyFlagTrigger.Animated 
                : DirtyFlagTrigger.None;
            _isFrozen = isFrozen;
        }
        var contextLocalTime = (float)context.LocalTime;
        var contextLocalFxTime = (float)context.LocalFxTime;
        
        var time = timeMode switch
        {
            TimeModes.LocalIdleMotionFxTime => contextLocalFxTime,
            TimeModes.LocalTime             => contextLocalTime,
            TimeModes.PlaybackTime          => (float)context.Playback.TimeInBars,
            TimeModes.Runtime               => (float)context.Playback.BarsFromSeconds(Playback.RunTimeInSecs),
            TimeModes.Frozen                => 0,
            _                               => throw new ArgumentOutOfRangeException()
        };

        time /= timeDivider;

        Beat.Value = MathF.Floor(time);
        Fraction.Value = MathF.Pow(time % 1.0f, exponentialFalloff);
        Time.Value = time;
        
        // Beat.DirtyFlag.Clear();
        // Fraction.DirtyFlag.Clear();
        // Time.DirtyFlag.Clear();
    }

}