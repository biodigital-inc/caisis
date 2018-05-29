using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("BiopsyPath")]
    [ParentTablename("Pathology")]
    [Disease("All")]
    [Exportable]
    [NoLock]
    public class BiopsyPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathPerineuralInv = "PathPerineuralInv";

    }
}
