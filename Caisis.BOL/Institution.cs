using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Institutions")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    [NoUserFields]
    public class Institution : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String InstitutionId = "InstitutionId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Institution_Field = "Institution";

    }
}
