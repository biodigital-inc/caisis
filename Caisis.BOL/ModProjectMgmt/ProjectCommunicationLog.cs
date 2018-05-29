using System;

namespace Caisis.BOL
{
    [Tablename("ProjectCommunicationLog")]
    [ParentTablename("Project")]
    [HasSiblings]
    [NoLock]
    public class ProjectCommunicationLog : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectId = "ProjectId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String CommunicationLogId = "CommunicationLogId";

        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [DataType(typeof(System.Int32))]
        public static readonly String OrganizationId = "OrganizationId";

        [DataType(typeof(System.String))]
        public static readonly String LogCommDateText = "LogCommDateText";

        [DataType(typeof(System.DateTime))]
        public static readonly String LogCommDate = "LogCommDate";

        [DataType(typeof(System.String))]
        public static readonly String LogCommType = "LogCommType";

        [DataType(typeof(System.String))]
        public static readonly String LogCommDescription = "LogCommDescription";

        [DataType(typeof(System.String))]
        public static readonly String LogCommNotes = "LogCommNotes";
    }
}
