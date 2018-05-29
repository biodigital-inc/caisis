using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Status")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Status : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String StatusId = "StatusId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String StatusDateText = "StatusDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String StatusDate = "StatusDate";

        [DataType(typeof(System.String))]
        public static readonly String StatusDisease = "StatusDisease";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Status_Field = "Status";

        [DataType(typeof(System.String))]
        public static readonly String StatusProbability = "StatusProbability";

        [DataType(typeof(System.String))]
        public static readonly String StatusPhysician = "StatusPhysician";

        [DataType(typeof(System.String))]
        public static readonly String StatusNotes = "StatusNotes";

        [DataType(typeof(System.String))]
        public static readonly String StatusDataSource = "StatusDataSource";

        [DataType(typeof(System.String))]
        public static readonly String StatusQuality = "StatusQuality";

    }
}
