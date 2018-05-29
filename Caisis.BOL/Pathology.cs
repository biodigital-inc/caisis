using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Pathology")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Pathology : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.Int32))]
        public static readonly String OperatingRoomDetailId = "OperatingRoomDetailId";

        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String PathDateText = "PathDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String PathDate = "PathDate";

        [DataType(typeof(System.String))]
        public static readonly String PathInstitution = "PathInstitution";

        [DataType(typeof(System.String))]
        public static readonly String PathLaboratory = "PathLaboratory";

        [DataType(typeof(System.String))]
        public static readonly String PathSpecimenType = "PathSpecimenType";

        [DataType(typeof(System.String))]
        public static readonly String PathSpecimenCollection = "PathSpecimenCollection";

        [DataType(typeof(System.String))]
        public static readonly String PathSite = "PathSite";

        [DataType(typeof(System.String))]
        public static readonly String PathSubsite = "PathSubsite";

        [DataType(typeof(System.String))]
        public static readonly String PathSide = "PathSide";

        [DataType(typeof(System.String))]
        public static readonly String PathNum = "PathNum";

        [DataType(typeof(System.String))]
        public static readonly String PathHistology = "PathHistology";

        [DataType(typeof(System.String))]
        public static readonly String PathHistology2 = "PathHistology2";

        [DataType(typeof(System.String))]
        public static readonly String PathResult = "PathResult";

        [DataType(typeof(System.String))]
        public static readonly String Pathologist = "Pathologist";

        [DataType(typeof(System.String))]
        public static readonly String PathNotes = "PathNotes";

        [DataType(typeof(System.String))]
        public static readonly String PathDataSource = "PathDataSource";

        [DataType(typeof(System.String))]
        public static readonly String PathQuality = "PathQuality";

        // v6.0
        [DataType(typeof(System.String))]
        public static readonly String PathLymphaticInv = "PathLymphaticInv";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathPerineuralInv = "PathPerineuralInv";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String PathDisease = "PathDisease";

    }
}
