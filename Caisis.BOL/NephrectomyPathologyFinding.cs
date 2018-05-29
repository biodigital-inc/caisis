using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("NephrectomyPathFinding")]
    [ParentTablename("Pathology")]
    [Disease("Kidney")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class NephrectomyPathologyFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String NephrectomyPathFindingId = "NephrectomyPathFindingId";

        [DataType(typeof(System.String))]
        public static readonly String PathFindMaxDim = "PathFindMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathFindHistology = "PathFindHistology";

        [DataType(typeof(System.String))]
        public static readonly String PathFindPole = "PathFindPole";

        [DataType(typeof(System.String))]
        public static readonly String PathFindAP = "PathFindAP";

        [DataType(typeof(System.String))]
        public static readonly String PathFindLaterality = "PathFindLaterality";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSite = "PathFindSite";

        [DataType(typeof(System.String))]
        public static readonly String PathFindGrade = "PathFindGrade";

        [DataType(typeof(System.String))]
        public static readonly String PathFindPattern = "PathFindPattern";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSarcomatoid = "PathFindSarcomatoid";

        [DataType(typeof(System.String))]
        public static readonly String PathFindNecrosis = "PathFindNecrosis";

        [DataType(typeof(System.String))]
        public static readonly String PathFindVascularInv = "PathFindVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathFindRV_Inv = "PathFindRV_Inv";

        [DataType(typeof(System.String))]
        public static readonly String PathFindIVC_Inv = "PathFindIVC_Inv";

        [DataType(typeof(System.String))]
        public static readonly String PathFindIVC_WallInv = "PathFindIVC_WallInv";

        [DataType(typeof(System.String))]
        public static readonly String PathFindExtension = "PathFindExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathNotes = "PathNotes";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String PathFindRV_InvOtherFindings = "PathFindRV_InvOtherFindings";

    }
}
