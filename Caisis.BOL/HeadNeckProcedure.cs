using System;

namespace Caisis.BOL
{
    [Tablename("HeadNeckProc")]
    [ParentTablename("Procedures")]
	[Exportable]
	[NoLock]
    public class HeadNeckProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcType = "ProcType";

        [DataType(typeof(System.String))]
        public static readonly String ProcResult = "ProcResult";

        [DataType(typeof(System.String))]
        public static readonly String ProcReconstruction = "ProcReconstruction";

        [DataType(typeof(System.String))]
        public static readonly String ProcPathType = "ProcPathType";
    }
}
