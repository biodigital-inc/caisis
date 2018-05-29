using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Narratives")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Narrative : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String NarrativeId = "NarrativeId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Narrative_Field = "Narrative";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String NarratedBy = "NarratedBy";

    }
}
