using System;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_PatientItems")]
	[ParentTablename("ProtocolMgr_PatientSchemas")]
    [HasSiblings]
    [NoLock]
    public class PatientItem : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientItemId = "PatientItemId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ItemTimelineId = "ItemTimelineId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientSchemaId = "PatientSchemaId";

        [DataType(typeof(System.DateTime))]
        public static readonly String ScheduledDate = "ScheduledDate";

        [DataType(typeof(System.DateTime))]
        public static readonly String FirstAnticipatedDate = "FirstAnticipatedDate";

        [DataType(typeof(System.DateTime))]
        public static readonly String LastAnticipatedDate = "LastAnticipatedDate";

        [DataType(typeof(System.String))]
        public static readonly String Status = "Status";

    }
}
