using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("NodeProc")]
    [ParentTablename("Procedures")]
    [Disease("All")]
    [Exportable]
    [NoLock]
    public class NodeProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcPacketType = "ProcPacketType";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumPackets = "ProcNumPackets";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumNodes = "ProcNumNodes";

        [DataType(typeof(System.String))]
        public static readonly String ProcDissectionExtent = "ProcDissectionExtent";

        [DataType(typeof(System.String))]
        public static readonly String ProcDissectionComplete = "ProcDissectionComplete";

        [DataType(typeof(System.String))]
        public static readonly String ProcResult = "ProcResult";

    }
}
