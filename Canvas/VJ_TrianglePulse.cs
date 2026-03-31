using T3.Core.Operator;
using T3.Core.Operator.Attributes;
using T3.Core.Operator.Slots;
using System.Runtime.InteropServices;

namespace Mio.General.Canvas{
    [Guid("45b7b3f1-cff1-41b0-9450-7d79dfd8c3d6")]
    internal sealed class VJ_TrianglePulse : Instance<VJ_TrianglePulse>
    {

        [Output(Guid = "061ef5ac-9974-4b44-a5dc-e7049af14ffb")]
        public readonly Slot<T3.Core.DataTypes.Texture2D> Output = new Slot<T3.Core.DataTypes.Texture2D>();

        [Input(Guid = "f6101e62-55cc-4734-af83-a4180cce60c6")]
        public readonly InputSlot<float> ClearRate = new InputSlot<float>();

        [Input(Guid = "1e38e0f7-5f0a-42b1-9df1-a08e0a3b9f75")]
        public readonly InputSlot<float> Rotation = new InputSlot<float>();

        [Input(Guid = "5130fc7a-9617-42fa-9024-0b81daf0a300")]
        public readonly InputSlot<float> DetailGrit = new InputSlot<float>();

        [Input(Guid = "44055c85-7bb5-4bbf-81b5-5cc1e262c039")]
        public readonly InputSlot<float> DetailThreshold = new InputSlot<float>();

        [Input(Guid = "16cfda3e-8385-4726-9d8f-ba5c823fc63e")]
        public readonly InputSlot<float> BarScale = new InputSlot<float>();

        [Input(Guid = "d3e8f550-e93d-4b70-bee9-cb59cc6d17f6")]
        public readonly InputSlot<float> BarPulse = new InputSlot<float>();

        [Input(Guid = "1279ac93-cc2c-4b9d-a8bf-5ba4c2ab2f76")]
        public readonly InputSlot<float> BeatScale = new InputSlot<float>();

        [Input(Guid = "dd20da4d-fbc9-4883-be28-8cb05f0c2a7f")]
        public readonly InputSlot<float> BeatPulse = new InputSlot<float>();

        [Input(Guid = "4b59984c-c7c1-4a53-8d3f-d6f159ad6957")]
        public readonly InputSlot<float> TapScale = new InputSlot<float>();

        [Input(Guid = "e4ee8479-b2f1-4ba7-9186-1f98cc727ac0")]
        public readonly InputSlot<float> TapPulse = new InputSlot<float>();

        [Input(Guid = "0031c24a-af6d-4f2a-afa8-984af1b45ead")]
        public readonly InputSlot<float> HiHatScale = new InputSlot<float>();

        [Input(Guid = "f891a733-dd2d-4312-bda3-a23c9c0470df")]
        public readonly InputSlot<float> HitHatPulse = new InputSlot<float>();

    }
}

