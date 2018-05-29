using System;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_PatientSchemas")]
    [ParentTablename("Patients")]
    [HasSiblings]
	[NoLock]
    public class PatientSchema : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientSchemaId = "PatientSchemaId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolSchemaId = "ProtocolSchemaId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.DateTime))]
        public static readonly String StartDate = "StartDate";

        [DataType(typeof(System.DateTime))]
        public static readonly String ShiftDate = "ShiftDate";

        [DataType(typeof(System.Int32))]
        public static readonly String ShiftNumberOfDays = "ShiftNumberOfDays";

    }
}
