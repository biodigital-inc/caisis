using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("RadiationTherapy")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class RadiationTherapy : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String RadiationTherapyId = "RadiationTherapyId";

        [DataType(typeof(System.Byte))]
        public static readonly String RadTxPending = "RadTxPending";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String RadTxDateText = "RadTxDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String RadTxDate = "RadTxDate";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String RadTxType = "RadTxType";

        [DataType(typeof(System.String))]
        public static readonly String RadTxIndication = "RadTxIndication";

        [DataType(typeof(System.String))]
        public static readonly String RadTxIntent = "RadTxIntent";

        [DataType(typeof(System.String))]
        public static readonly String RadTxTarget = "RadTxTarget";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String RadTxStopDateText = "RadTxStopDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String RadTxStopDate = "RadTxStopDate";

        [DataType(typeof(System.String))]
        public static readonly String RadTxIsotope = "RadTxIsotope";

        [DataType(typeof(System.String))]
        public static readonly String RadTxDosePerFraction = "RadTxDosePerFraction";

        [DataType(typeof(System.String))]
        public static readonly String RadTxTotalDose = "RadTxTotalDose";

        [DataType(typeof(System.String))]
        public static readonly String RadTxUnits = "RadTxUnits";

        [DataType(typeof(System.String))]
        public static readonly String RadTxNumFractions = "RadTxNumFractions";

        [DataType(typeof(System.String))]
        public static readonly String RadTxNumFields = "RadTxNumFields";

        [DataType(typeof(System.String))]
        public static readonly String RadTxSchedule = "RadTxSchedule";

        [DataType(typeof(System.String))]
        public static readonly String RadTxDisease = "RadTxDisease"; // v 4.2

        [DataType(typeof(System.String))]
        public static readonly String RadTxPhysician = "RadTxPhysician";

        [DataType(typeof(System.String))]
        public static readonly String RadTxInstitution = "RadTxInstitution";

        // v.6.x
        [DataType(typeof(System.String))]
        public static readonly String RadTxSide = "RadTxSide";
        // v.6.x
        [DataType(typeof(System.String))]
        public static readonly String RadTxPosition = "RadTxPosition";
        // v.6.x 
        [DataType(typeof(System.String))]
        public static readonly String RadTxSite = "RadTxSite";

        [DataType(typeof(System.String))]
        public static readonly String RadTxNotes = "RadTxNotes";

        [DataType(typeof(System.String))]
        public static readonly String RadTxDataSource = "RadTxDataSource";

        [DataType(typeof(System.String))]
        public static readonly String RadTxQuality = "RadTxQuality";

    }
}
