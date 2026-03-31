using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("529a6e6c-0b13-466a-987c-6df287449c48")]
    internal sealed class VJ_CliffordMovement_Alt : Instance<VJ_CliffordMovement_Alt>
    {

        [Output(Guid = "c2d095e6-4f1a-4cae-b140-e42777621ed9")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> RegularImage = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "02544792-2857-4372-9e36-23ede856d550")]
        public readonly InputSlot<float> Speed = new InputSlot<float>();

        [Input(Guid = "4b91426a-c794-4bf4-9b25-0ca29ee3b169")]
        public readonly InputSlot<float> Density = new InputSlot<float>();

        [Input(Guid = "c81d0e66-f2a6-4919-912d-c3065c1964b2")]
        public readonly InputSlot<float> Persistence = new InputSlot<float>();

        [Input(Guid = "5b0975cb-3ac4-49d6-be39-de04292cf13b")]
        public readonly InputSlot<float> RotateSpeed = new InputSlot<float>();

        [Input(Guid = "110f91cb-4f6e-4772-9189-e6324cb604e4")]
        public readonly InputSlot<float> RasterImagePump = new InputSlot<float>();

        [Input(Guid = "518c9ad1-729e-4026-a4cc-89429d8e4c2d")]
        public readonly InputSlot<float> FeedbackIntensity = new InputSlot<float>();

        [Input(Guid = "4f6ac33d-736e-4997-b5b0-3af65d9f294a")]
        public readonly InputSlot<System.Numerics.Vector2> KaleidoscopeZoom = new InputSlot<System.Numerics.Vector2>();

        [Output(Guid = "656ea6d6-d0bd-447d-aa5f-a126f9c0c91f")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> MirroredImage = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "1ba224ec-4f08-4c65-9088-f4f8ed02a856")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> RotatingImage = new Slot<T3.Core.DataTypes.Texture2D>();

        [Output(Guid = "f39b86f6-cb51-482c-9651-86a2d859d0b4")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> KaleidscopeImage = new Slot<T3.Core.DataTypes.Texture2D>();

    }
}

