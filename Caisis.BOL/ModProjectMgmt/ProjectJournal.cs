using System;

namespace Caisis.BOL
{
    [Tablename("ProjectJournal")]
    [NoLock]
    public class ProjectJournal : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String JournalId = "JournalId";

        [DataType(typeof(System.String))]
        public static readonly String ISSN_Number = "ISSN_Number";

        [DataType(typeof(System.String))]
        public static readonly String JournalName = "JournalName";

        [DataType(typeof(System.String))]
        public static readonly String ShortName = "ShortName";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";
    }
}
