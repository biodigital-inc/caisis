using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PatientInstitutions")]
    [ParentTablename("Patients")]
    [MultiAssociated("Patients", "Institutions")]
    [Disease("All")]
    [Exportable]
    [NoLock]
    [NoUserFields]
    public class PatientInstitution : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientInstitutionId = "PatientInstitutionId";

        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [LookupKey]
        [DataType(typeof(System.Int32))]
        public static readonly String InstitutionId = "InstitutionId";

    }
}
