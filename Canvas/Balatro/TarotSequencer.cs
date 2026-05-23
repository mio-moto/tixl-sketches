using T3.Core.Utils;

namespace Mio.General.Canvas.Balatro;

[Guid("FC2B7913-611D-4AEC-928B-105C5B0B3903")]
public class TarotSequencer : Instance<TarotSequencer>
{
    [Input(Guid = "ca808626-402c-4db2-914d-c895c53302c7")]
    public readonly InputSlot<Int2> GridSize = new();

    [Input(Guid = "44903019-9f93-4c04-b488-abe48ea0023f")]
    public readonly InputSlot<Vector2> GridOffset = new();

    // the idea here is that the animation plays between 0...1 - so speed is dictated by the input 
    [Input(Guid = "74bcb796-1c66-469b-a4dc-53137e28b803")]
    public readonly InputSlot<float> Time = new();
    
    [Input(Guid = "5604d7a0-aea8-47d4-b092-cd97805641ce")]
    public readonly InputSlot<int> Seed = new();

    [Input(Guid="911d2136-39ba-42b8-aac2-05db476fd82e")]
    public readonly InputSlot<bool> PlaceUnflipped = new();

    // tixl doesn't have Slot<Vector3[]> or some such, so this is a loop operator then
    [Input(Guid = "dd1368b4-4837-4cad-a9f6-28084dec93ad")]
    public readonly InputSlot<int> ForIndex = new();
    
    [Output(Guid = "4943cf3f-555c-4ea2-840a-5813a5560237")]
    public readonly Slot<Vector3> CardPosition = new();

    [Output(Guid = "a27aa154-fddd-4940-b68c-f138bbac59d7")]
    public readonly Slot<Vector3> CardRotation = new();

    
    public TarotSequencer()
    {
        CardPosition.UpdateAction += Update;
        CardRotation.UpdateAction += Update;
    }

    
    private void Update(EvaluationContext obj)
    {
        var gridSize = GridSize.GetValue(obj);
        if (gridSize.X == 0 || gridSize.Y == 0)
        {
            SetValues(new Vector3(0, 0, 0), new Vector3(0, 0, 0));
            return;
            // populate lists with [0,0]
        }
        
        var gridOffset = GridOffset.GetValue(obj);
        // allows for better time handling
        var time = (float) (Time.GetValue(obj) % 1.0).Clamp(0, 1);
        var seed = (uint) Seed.GetValue(obj);
        var index = ForIndex.GetValue(obj);
        var placeUnflipped = PlaceUnflipped.GetValue(obj);

        var totalCards = gridSize.X * gridSize.Y;
        var dx = 1.0f / gridSize.X;
        var dy = 1.0f / gridSize.Y;
        
        // the first two time units and the last two are reserved to show initial states (deck is in, cards are placed)
        var dt = 1.0f / (totalCards + 4);
        var animatingCardIndex = (int) (time / dt) - 2;
        var animValue = (time % dt) / dt;

        
        // -index, because the cards unravel in increasing height
        var initialCardPosition = new Vector3(0, 0, -index / (float) totalCards);
        var initialCardRotation = new Vector3(0, -0.5f, GetRandomValue(seed, (uint) index));
        if (animatingCardIndex < index)
        {
           SetValues(initialCardPosition, initialCardRotation);
           return;
        }

        var gridPositionX = index % gridSize.X;
        var gridPositionY = index / gridSize.Y;

        var finalPosition = new Vector3(gridPositionX * dx + gridOffset.X, gridPositionY * dy + gridOffset.Y, 0);
        var finalRotation = new Vector3(0.0f, placeUnflipped ? -0.5f : 0.0f, GetRandomValue(seed, (uint) index));
        
        // that's an animating card now
        if (animatingCardIndex == index)
        {
            SetValues(MathUtils.Lerp(new Vector3(0, 0, 0), finalPosition, animValue), MathUtils.Lerp(initialCardRotation, finalRotation, animValue));
            return;
        }
        
        SetValues(finalPosition, finalRotation);
    }

    private void SetValues(Vector3 position, Vector3 rotation)
    {
        CardPosition.Value = position;
        CardRotation.Value = rotation;
        CardPosition.DirtyFlag.Clear();
        CardRotation.DirtyFlag.Clear();
    }

    
    private float GetRandomValue(uint seed, uint index) => MathUtils.Hash01(seed + index);
}
