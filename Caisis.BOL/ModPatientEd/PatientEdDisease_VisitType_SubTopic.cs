using System;

namespace Caisis.BOL
{
    [Tablename("PatientEdDisease_VisitType_SubTopic")]
	[NoBaseColumns]

    public class PatientEdDisease_VisitType_SubTopic : BusinessObject
    {
		[PrimaryKey]
		[DataType(typeof(System.Int32))]
		public static readonly String DiseaseVisitTypeSubTopicId = "DiseaseVisitTypeSubTopicId";

        [DataType(typeof(System.Int32))]
        public static readonly String DiseaseId = "DiseaseId";

        [DataType(typeof(System.Int32))]
        public static readonly String VisitTypeId = "VisitTypeId";

        [DataType(typeof(System.Int32))]
        public static readonly String PacketId = "PacketId";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String SubTopicId = "SubTopicId";

        [DataType(typeof(System.Boolean))]
        public static readonly String PrimarySection = "PrimarySection";

        [DataType(typeof(System.Boolean))]
        public static readonly String SubTopicChecked = "SubTopicChecked";
    }
}
