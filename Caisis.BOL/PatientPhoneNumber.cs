using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PatientPhoneNumbers")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class PatientPhoneNumber : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientPhoneNumberId = "PatientPhoneNumberId";

        [DataType(typeof(System.String))]
        public static readonly String PtPhoneType = "PtPhoneType";

        [DataType(typeof(System.String))]
        public static readonly String PtPhoneNumber = "PtPhoneNumber";

        [DataType(typeof(System.String))]
        public static readonly String PtPhoneExtension = "PtPhoneExtension";

        [DataType(typeof(System.String))]
        public static readonly String PtPhoneNotes = "PtPhoneNotes";

    }
}
