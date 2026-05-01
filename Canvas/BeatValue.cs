namespace Mio.General.Canvas;

[Guid("a009fefb-fef2-4e7a-8ed1-706e83a10df3")]
internal sealed class BeatValue :Instance<BeatValue>{

        [Output(Guid = "94c33621-2616-4d01-b05d-ae7e32fb4738")]
        public readonly Slot<float> Beat = new Slot<float>();

        [Input(Guid = "0678ef73-55f8-4f9d-ba44-27e03501b208")]
        public readonly InputSlot<System.Numerics.Vector2> BarCurve = new InputSlot<System.Numerics.Vector2>();

        [Input(Guid = "ba44c9dc-c161-4672-8707-687cae599317")]
        public readonly InputSlot<System.Numerics.Vector2> HalfBarCurve = new InputSlot<System.Numerics.Vector2>();

        [Input(Guid = "8736339d-480a-49f4-aa51-fd06c52c876e")]
        public readonly InputSlot<System.Numerics.Vector2> BeatCurve = new InputSlot<System.Numerics.Vector2>();

        [Input(Guid = "7f56a7a8-2bb5-4077-abe1-c076691acd37")]
        public readonly InputSlot<System.Numerics.Vector2> TapCurve = new InputSlot<System.Numerics.Vector2>();

        [Input(Guid = "2fdb1687-a5aa-4903-9caa-ac51f258533e")]
        public readonly InputSlot<System.Numerics.Vector2> DoubleTabCurve = new InputSlot<System.Numerics.Vector2>();

        [Output(Guid = "6f38a3b6-2e06-4c47-8ebc-6d4138c1610a")]
        public readonly Slot<float> Bar = new Slot<float>();

        [Output(Guid = "e4035bb9-8a07-4237-b5af-4696a31d60cf")]
        public readonly Slot<float> HalfBar = new Slot<float>();

        [Output(Guid = "80ed9180-3a38-41fd-9e8f-022226f36e45")]
        public readonly Slot<float> Tap = new Slot<float>();

        [Output(Guid = "73743be0-e338-450c-870a-118a221e0f56")]
        public readonly Slot<float> DoubleTap = new Slot<float>();


}