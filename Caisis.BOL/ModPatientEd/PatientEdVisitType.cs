using System;

namespace Caisis.BOL
{
    [Tablename("PatientEdVisitType")]
	[NoBaseColumns]

    public class PatientEdVisitType : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String VisitTypeId = "VisitTypeId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String VisitTypeName = "VisitTypeName";

        [DataType(typeof(System.String))]
        public static readonly String PacketName = "PacketName";

        [DataType(typeof(System.Int32))]
        public static readonly String OrderNumber = "OrderNumber";
    }
}
