using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("EncHeadNeckFinding")]
    [ParentTablename("Encounters")]
    [Disease("Head & Neck")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class EncHeadNeckFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncounterId = "EncounterId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncHeadNeckFindingId = "EncHeadNeckFindingId";

        [DataType(typeof(System.String))]
        public static readonly String EncFindSide = "EncFindSide";

        [DataType(typeof(System.String))]
        public static readonly String EncFindSite = "EncFindSite";

        [DataType(typeof(System.String))]
        public static readonly String EncFindSubsite = "EncFindSubsite";

        [DataType(typeof(System.String))]
        public static readonly String EncFindInv = "EncFindInv";

        [DataType(typeof(System.String))]
        public static readonly String EncFindInvSite = "EncFindInvSite";

        [DataType(typeof(System.String))]
        public static readonly String EncFindPrimaryDim = "EncFindPrimaryDim";

        [DataType(typeof(System.String))]
        public static readonly String EncFindSecondaryDim = "EncFindSecondaryDim";

        [DataType(typeof(System.String))]
        public static readonly String EncFindTertiaryDim = "EncFindTertiaryDim";

        [DataType(typeof(System.String))]
        public static readonly String EncFindMorphology = "EncFindMorphology";

        [DataType(typeof(System.String))]
        public static readonly String EncFindNotes = "EncFindNotes";
    }
}