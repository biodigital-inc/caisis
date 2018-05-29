using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("GastricPath")]
    [ParentTablename("Pathology")]
    [Disease("Gastric")]
    [Exportable]
    [NoLock]
    public class GastricPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathMultifocal = "PathMultifocal";

        [DataType(typeof(System.String))]
        public static readonly String PathWHO_Type = "PathWHO_Type";

        [DataType(typeof(System.String))]
        public static readonly String PathWHO_Type2 = "PathWHO_Type2";

        [DataType(typeof(System.String))]
        public static readonly String PathLauren = "PathLauren";

        [DataType(typeof(System.String))]
        public static readonly String PathOtherType = "PathOtherType";

        [DataType(typeof(System.String))]
        public static readonly String PathMargin = "PathMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathInvasionDepth = "PathInvasionDepth";

        [DataType(typeof(System.String))]
        public static readonly String PathTumorMaxDim = "PathTumorMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathSiewert = "PathSiewert";

        [DataType(typeof(System.String))]
        public static readonly String PathLocation = "PathLocation";

        [DataType(typeof(System.String))]
        public static readonly String PathTreatmentEffect = "PathTreatmentEffect";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathPerineuralInv = "PathPerineuralInv";

    }
}
