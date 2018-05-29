using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PatientDiseases")]
    [ParentTablename("Patients")]
    [MultiAssociated("Patients", "Diseases")]
    [Disease("All")]
    [Exportable]
    [NoLock]
    public class PatientDisease : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientDiseaseId = "PatientDiseaseId";

        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [LookupKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiseaseId = "DiseaseId";

    }
}
