using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("RPLND_Proc")]
    [ParentTablename("Procedures")]
    [Disease("Prostate")]
    [Exportable]
    [NoLock]
    public class RPLND : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcIncisionType = "ProcIncisionType";

        [DataType(typeof(System.String))]
        public static readonly String ProcDissectionExtent = "ProcDissectionExtent";

        [DataType(typeof(System.String))]
        public static readonly String ProcNerveSparing = "ProcNerveSparing";

        [DataType(typeof(System.String))]
        public static readonly String ProcDesperation = "ProcDesperation";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumber = "ProcNumber";
    }
}
