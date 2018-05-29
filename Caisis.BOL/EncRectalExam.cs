using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("EncRectalExams")]
    [ParentTablename("Encounters")]
    [Disease("Prostate")]
    [Exportable]
    [NoLock]
    public class EncRectalExam : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncounterId = "EncounterId";

        [DataType(typeof(System.String))]
        public static readonly String DRE_Result = "DRE_Result";

        [DataType(typeof(System.String))]
        public static readonly String DRE_IndWidth = "DRE_IndWidth";

        [DataType(typeof(System.String))]
        public static readonly String DRE_IndLength = "DRE_IndLength";

        [DataType(typeof(System.String))]
        public static readonly String DRE_ProstateWeight = "DRE_ProstateWeight";

    }
}
