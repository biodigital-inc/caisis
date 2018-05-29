using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DietaryIntake")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class DietaryIntake : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DietaryIntakeId = "DietaryIntakeId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String IntakeDateText = "IntakeDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String IntakeDate = "IntakeDate";

        [DataType(typeof(System.String))]
        public static readonly String IntakeTotalFluidAmount = "IntakeTotalFluidAmount";

        [DataType(typeof(System.String))]
        public static readonly String IntakeTotalFluidUnits = "IntakeTotalFluidUnits";

        [DataType(typeof(System.String))]
        public static readonly String IntakeTotalSolidAmount = "IntakeTotalSolidAmount";

        [DataType(typeof(System.String))]
        public static readonly String IntakeTotalSolidUnits = "IntakeTotalSolidUnits";

        [DataType(typeof(System.String))]
        public static readonly String IntakeNotes = "IntakeNotes";

        [DataType(typeof(System.String))]
        public static readonly String IntakeDataSource = "IntakeDataSource";

        [DataType(typeof(System.String))]
        public static readonly String IntakeQuality = "IntakeQuality";

    }
}
