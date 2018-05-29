using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Encounters")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Encounter : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncounterId = "EncounterId";

        [DataType(typeof(System.Byte))]
        public static readonly String EncPending = "EncPending";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String EncDateText = "EncDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String EncDate = "EncDate";

        [DataType(typeof(System.String))]
        public static readonly String EncType = "EncType";

        [DataType(typeof(System.String))]
        public static readonly String EncChiefComplaint = "EncChiefComplaint";

        [DataType(typeof(System.String))]
        public static readonly String EncPhysician = "EncPhysician";

        [DataType(typeof(System.String))]
        public static readonly String EncFellow = "EncFellow";

        [DataType(typeof(System.String))]
        public static readonly String EncNurse = "EncNurse";

        [DataType(typeof(System.String))]
        public static readonly String EncPresentation = "EncPresentation";

        [DataType(typeof(System.String))]
        public static readonly String EncStatus = "EncStatus";

        [DataType(typeof(System.String))]
        public static readonly String EncSystolic = "EncSystolic";

		[DataType(typeof(System.String))]
		public static readonly String EncDiastolic = "EncDiastolic";

        [DataType(typeof(System.String))]
        public static readonly String EncPulse = "EncPulse";

        [DataType(typeof(System.String))]
        public static readonly String EncTemp = "EncTemp";

        [DataType(typeof(System.String))]
        public static readonly String EncRespiration = "EncRespiration";

        [DataType(typeof(System.String))]
        public static readonly String EncHeight = "EncHeight";

        [DataType(typeof(System.String))]
        public static readonly String EncWeight = "EncWeight";

        [DataType(typeof(System.String))]
        public static readonly String EncBSA = "EncBSA";

        [DataType(typeof(System.String))]
        public static readonly String EncBMI = "EncBMI";

        [DataType(typeof(System.String))]
        public static readonly String EncKPS = "EncKPS";

        [DataType(typeof(System.String))]
        public static readonly String EncECOG_Score = "EncECOG_Score"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String EncZubrod_Score = "EncZubrod_Score"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String EncOxygenSaturation = "EncOxygenSaturation"; // v6.0

        [DataType(typeof(System.String))]
        public static readonly String EncInstitution = "EncInstitution";

        [DataType(typeof(System.String))]
        public static readonly String EncNotes = "EncNotes";

        [DataType(typeof(System.String))]
        public static readonly String EncDataSource = "EncDataSource";

        [DataType(typeof(System.String))]
        public static readonly String EncQuality = "EncQuality";

    }
}
