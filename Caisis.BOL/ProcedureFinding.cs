using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProcedureFinding")]
    [ParentTablename("Procedures")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class ProcedureFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureFindingId = "ProcedureFindingId";

        [DataType(typeof(System.String))]
        public static readonly String ProcFinding = "ProcFinding";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindSide = "ProcFindSide";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindSite = "ProcFindSite";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindSubsite = "ProcFindSubsite";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindDissection = "ProcFindDissection";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindPrimaryDimension = "ProcFindPrimaryDimension";
        
        [DataType(typeof(System.String))]
        public static readonly String ProcFindSecondaryDimension = "ProcFindSecondaryDimension";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindTertiaryDimension = "ProcFindTertiaryDimension";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindExtension = "ProcFindExtension";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindEncapsulation = "ProcFindEncapsulation";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindDiseaseExtent = "ProcFindDiseaseExtent";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindStatus = "ProcFindStatus";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindFrozen = "ProcFindFrozen";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindMorphology = "ProcFindMorphology";

        // v6.0
        [DataType(typeof(System.String))]
        public static readonly String ProcFindNotes = "ProcFindNotes";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String ProcFindHistology = "ProcFindHistology";        

        [DataType(typeof(System.String))]
        public static readonly String ProcFindLaterality = "ProcFindLaterality"; 

        [DataType(typeof(System.String))]
        public static readonly String ProcFindScore = "ProcFindScore";

    }
}
