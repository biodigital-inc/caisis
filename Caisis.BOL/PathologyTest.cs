using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PathTest")]
    [ParentTablename("Pathology")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class PathologyTest : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathTestId = "PathTestId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String PathDateText = "PathDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String PathDate = "PathDate";

        [DataType(typeof(System.String))]
        public static readonly String PathTime = "PathTime";

        [DataType(typeof(System.String))]
        public static readonly String PathTest = "PathTest";

        [DataType(typeof(System.String))]
        public static readonly String PathResult = "PathResult";

        [DataType(typeof(System.String))]
        public static readonly String PathUnits = "PathUnits";

        [DataType(typeof(System.String))]
        public static readonly String PathNormalRange = "PathNormalRange";

        [DataType(typeof(System.String))]
        public static readonly String PathNotes = "PathNotes";

        [DataType(typeof(System.String))]
        public static readonly String PathDataSource = "PathDataSource";

        [DataType(typeof(System.String))]
        public static readonly String PathQuality = "PathQuality";

    }
}
