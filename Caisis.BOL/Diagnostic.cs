using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Diagnostics")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Diagnostic : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosticId = "DiagnosticId";

        [DataType(typeof(System.Byte))]
        public static readonly String DxPending = "DxPending";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String DxDateText = "DxDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String DxDate = "DxDate";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String DxType = "DxType";

        [DataType(typeof(System.String))]
        public static readonly String DxDisease = "DxDisease"; // v 4.2

        [DataType(typeof(System.String))]
        public static readonly String DxIndication = "DxIndication"; // v 5.0

        [DataType(typeof(System.String))]
        public static readonly String DxSummary = "DxSummary";

        [DataType(typeof(System.String))]
        public static readonly String DxSide = "DxSide";

        // v6.x General anatomic location/site that is being targeted; less specific than DxTarget
        [DataType(typeof(System.String))]
        public static readonly String DxSite = "DxSite";

        [DataType(typeof(System.String))]
        public static readonly String DxTarget = "DxTarget";

        [DataType(typeof(System.String))]
        public static readonly String DxResult = "DxResult";

        [DataType(typeof(System.String))]
        public static readonly String DxPhysician = "DxPhysician";

        [DataType(typeof(System.String))]
        public static readonly String DxInstitution = "DxInstitution";

        [DataType(typeof(System.String))]
        public static readonly String ImgReviewed = "ImgReviewed";

        [DataType(typeof(System.String))]
        public static readonly String ImgCompared = "ImgCompared";

        [DataType(typeof(System.String))]
        public static readonly String ImgDigitized = "ImgDigitized";

        [DataType(typeof(System.String))]
        public static readonly String ImgContrast = "ImgContrast";

        [DataType(typeof(System.String))]
        public static readonly String ImgBaseline = "ImgBaseline"; //v5.0

        [DataType(typeof(System.String))]
        public static readonly String DxConfidence = "DxConfidence";

        [DataType(typeof(System.String))]
        public static readonly String DxStatus = "DxStatus";

        [DataType(typeof(System.String))]
        public static readonly String DxTotalNumTumors = "DxTotalNumTumors"; //v5.1

        [DataType(typeof(System.String))]
        public static readonly String DxNumNewTumors = "DxNumNewTumors"; //v5.1

        [DataType(typeof(System.String))]
        public static readonly String DxNotes = "DxNotes";

        [DataType(typeof(System.String))]
        public static readonly String DxDataSource = "DxDataSource";

        [DataType(typeof(System.String))]
        public static readonly String DxQuality = "DxQuality";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String DxClinicalSignificance = "DxClinicalSignificance";

        [DataType(typeof(System.Byte))]
        public static readonly String DxTracer = "DxTracer";
    }
}
