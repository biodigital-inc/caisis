using System;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_PatientItemFields")]
	[ParentTablename("ProtocolMgr_SchemaItemFields")]
    [HasSiblings]
	[NoLock]
    public class PatientItemField : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientItemFieldId = "PatientItemFieldId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientItemId = "PatientItemId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SchemaItemFieldId = "SchemaItemFieldId";

        [DataType(typeof(System.Int32))]
        public static readonly String DestTablePrimKey = "DestTablePrimKey";

    }
}
