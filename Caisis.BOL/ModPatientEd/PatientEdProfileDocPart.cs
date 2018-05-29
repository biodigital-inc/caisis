using System;

namespace Caisis.BOL
{
    [Tablename("PatientEdProfileDocPart")]
	[NoBaseColumns]

    public class PatientEdProfileDocPart : BusinessObject
    {
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProfileId = "ProfileId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProfileDocPartId = "ProfileDocPartId";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String SubTopicId = "SubTopicId";

        [NotNull]
        [DataType(typeof(System.Double))]
        public static readonly String ProfileDocPartVersionNumber = "SubTopicVersionNumber";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String ProfileDocPartOrderNumber = "OrderNumber";
    }
}
