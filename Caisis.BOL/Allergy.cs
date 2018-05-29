using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Allergies")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Allergy : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String AllergyId = "AllergyId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Allergen = "Allergen";

        [DataType(typeof(System.String))]
        public static readonly String AllergyResponse = "AllergyResponse";

        [DataType(typeof(System.String))]
        public static readonly String AllergyNotes = "AllergyNotes";


    }
}
