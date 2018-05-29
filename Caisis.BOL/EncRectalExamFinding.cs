using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("EncRectalExamFindings")]
    [ParentTablename("EncRectalExams")]
    [Disease("Prostate")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class EncRectalExamFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncounterId = "EncounterId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncRectalExamFindingId = "EncRectalExamFindingId";

        [DataType(typeof(System.String))]
        public static readonly String DRE_FindSide = "DRE_FindSide";

        [DataType(typeof(System.String))]
        public static readonly String DRE_FindLaterality = "DRE_FindLaterality";

        [DataType(typeof(System.String))]
        public static readonly String DRE_FindLevel = "DRE_FindLevel";

        [DataType(typeof(System.String))]
        public static readonly String DRE_FindResult = "DRE_FindResult";

        [DataType(typeof(System.String))]
        public static readonly String DRE_FindExtension = "DRE_FindExtension";

    }
}
