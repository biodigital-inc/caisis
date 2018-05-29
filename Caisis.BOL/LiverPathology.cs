using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    //
    // CAP 2005 Liver Checklist used as reference
    //
    [Tablename("LiverPath")]
    [ParentTablename("Pathology")]
    [Disease("Liver")]
    [Exportable]
    [NoLock]
    public class LiverPathology : BusinessObject
    {
        
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        // CAP field
        [DataType(typeof(System.String))]
        public static readonly String PathMultifocal = "PathMultifocal";

        // CAP field
        [DataType(typeof(System.String))]
        public static readonly String PathTumorMaxDim = "PathTumorMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathNumTotalTumors = "PathNumTotalTumors";

        [DataType(typeof(System.String))]
        public static readonly String PathClosestTumorMarginDistance = "PathClosestMarginDistance";
        // the closest distance between tumor and resection margin

        [DataType(typeof(System.String))]
        public static readonly String PathMargin = "PathMargin";
        //CAP Options: Cannot be assessed, Uninvolved by invasive carcinoma, Involved by invasive carcinoma

        [DataType(typeof(System.String))]
        public static readonly String PathParenchymalMargin = "PathParenchymalMargin";
        // CAP Options: Cannot be assessed, Uninvolved by invasive carcinoma,Involved by invasive carcinoma

        [DataType(typeof(System.String))]
        public static readonly String PathBileDuctMargin = "PathBileDuctMargin";
        // CAP Options: Cannot be assessed, Uninvolved by invasive carcinoma,Involved by invasive carcinoma

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";
        //CAP Options: Absent, Present, Indeterminate
    }
}

