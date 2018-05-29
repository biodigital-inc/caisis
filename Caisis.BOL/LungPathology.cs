using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("LungPath")] // v5.0
    [ParentTablename("Pathology")]
    [Disease("Thoracic")]
    [Exportable]
    [NoLock]
    public class LungPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathRxChanges = "PathRxChanges";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String  PathPerineuralInv = "PathPerineuralInv";

        [DataType(typeof(System.String))]
        public static readonly String  PathPleuraInv = "PathPleuraInv";

        [DataType(typeof(System.String))]
        public static readonly String  PathTumorMaxDim = "PathTumorMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String  PathBronchMargin = "PathBronchMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathPreNeoChanges = "PathPreNeoChanges";
    }
}
