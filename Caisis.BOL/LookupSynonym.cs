using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("LookupSynonyms")]
    [ParentTablename("LookupCodes")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class LookupSynonym : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String LookupCodeId = "LookupCodeId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String LookupSynonymId = "LookupSynonymId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Synonym = "Synonym";

        [DataType(typeof(System.String))]
        public static readonly String SynType = "SynType";

        [NotNull]
        [DataType(typeof(System.Byte))]
        public static readonly String SynSuppress = "SynSuppress";

    }
}
