using System;

namespace Caisis.BOL
{
    [Tablename("ProjectLOIResponse")]
    [ParentTablename("ProjectLetterOfIntent")]
    [HasSiblings]
    [NoLock]
    public class ProjectLOIResponse : BusinessObject
    {
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String OrganizationId = "OrganizationId";

        [ForeignKey]
        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectLetterOfIntentId = "ProjectLetterOfIntentId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectLOIResponseId = "ProjectLOIResponseId";

        [DataType(typeof(System.DateTime))]
        public static readonly String ResponseDate = "ResponseDate";

        [DataType(typeof(System.String))]
        public static readonly String ResponseDateText = "ResponseDateText";

        [DataType(typeof(System.String))]
        public static readonly String Participation = "Participation";

        [DataType(typeof(System.String))]
        public static readonly String Reason = "Reason";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";
    }
}
