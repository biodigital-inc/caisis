using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("LabTests")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class LabTest : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String LabTestId = "LabTestId";

        [DataType(typeof(System.Byte))]
        public static readonly String LabPending = "LabPending";

        [DataType(typeof(System.String))]
        public static readonly String LabAccessionNum = "LabAccessionNum";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String LabDateText = "LabDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String LabDate = "LabDate";

        [DataType(typeof(System.String))]
        public static readonly String LabTime = "LabTime";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String LabTest_Field = "LabTest";

        [DataType(typeof(System.String))]
        public static readonly String LabResult = "LabResult";

        [DataType(typeof(System.String))]
        public static readonly String LabUnits = "LabUnits";

        [DataType(typeof(System.String))]
        public static readonly String LabNormalRange = "LabNormalRange";

        [DataType(typeof(System.String))]
        public static readonly String LabNotes = "LabNotes";

        [DataType(typeof(System.String))]
        public static readonly String LabDataSource = "LabDataSource";

        [DataType(typeof(System.String))]
        public static readonly String LabQuality = "LabQuality";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String LabClinicalSignificance = "LabClinicalSignificance";
    }
}
