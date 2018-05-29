using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MIS_Proc")]
    [ParentTablename("Procedures")]
    [Disease("All")]
    [Exportable]
    [NoLock]
    public class MIS_Proc : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcIntent = "ProcIntent";

        [DataType(typeof(System.String))]
        public static readonly String ProcInstrumentUsed = "ProcInstrumentUsed";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumPorts = "ProcNumPorts";

        [DataType(typeof(System.String))]
        public static readonly String ProcConversionReason = "ProcConversionReason";

        [DataType(typeof(System.String))]
        public static readonly String ProcOpenConversion = "ProcOpenConversion";        

    }
}

