namespace Mio.General.Canvas;

[Guid("34dec43b-f353-438c-addf-710ffbe7e208")]
internal sealed class PFX__MainController :Instance<PFX__MainController>{

        [Output(Guid = "ed966c0f-cdac-4383-82f9-7c941fa40e8d")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "4f73723b-8df8-47f9-87b8-4239541d58fc")]
        public readonly InputSlot<T3.Core.DataTypes.Texture2D> Input = new InputSlot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "d4b1d0f5-dbb3-47fd-a205-c83933ad8520")]
        public readonly InputSlot<bool> ImagePumping = new InputSlot<bool>();

        [Input(Guid = "78e91346-d80f-4a0d-b277-05e6de21818d")]
        public readonly InputSlot<bool> FallingSlides = new InputSlot<bool>();

        [Input(Guid = "095696db-8a09-4c82-89eb-8dd77fede2f0")]
        public readonly InputSlot<bool> DVDTV = new InputSlot<bool>();

        [Input(Guid = "2d187110-7d45-4ef2-8f47-5ebc0a851375")]
        public readonly InputSlot<bool> DVDBounce = new InputSlot<bool>();

        [Input(Guid = "ac0881c7-2263-4cbb-ad93-c4c37801acc3")]
        public readonly InputSlot<bool> DVDBounceInvert = new InputSlot<bool>();

        [Input(Guid = "5490843b-053e-406e-bb14-2efadc0af4d4")]
        public readonly InputSlot<bool> PIPOverlay = new InputSlot<bool>();

        [Input(Guid = "77b36b90-5cc0-41ee-8a54-943dab0aadd3")]
        public readonly InputSlot<bool> ClubNames = new InputSlot<bool>();


}