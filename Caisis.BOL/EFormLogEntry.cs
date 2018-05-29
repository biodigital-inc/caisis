using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("EFormLog")]
    [ParentTablename("EForms")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class EFormLogEntry : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EFormId = "EFormId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EFormLogId = "EFormLogId";

        [DataType(typeof(System.String))]
        public static readonly String Status = "Status";

    }
}
