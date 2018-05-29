using System;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_ProtocolVersions")]
    [ParentTablename("Protocols")]
    [HasSiblings]
	[NoLock]
    public class ProtocolVersion : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolVersionId = "ProtocolVersionId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolId = "ProtocolId";

        [DataType(typeof(System.String))]
        public static readonly String VersionNumber = "VersionNumber";

        [DataType(typeof(System.DateTime))]
        public static readonly String ApprovalDate = "ApprovalDate";

        [DataType(typeof(System.String))]
        public static readonly String VersionReason = "VersionReason";

        [DataType(typeof(System.Int32))]
        public static readonly String MetadataSurveyId = "MetadataSurveyId";

    }
}
