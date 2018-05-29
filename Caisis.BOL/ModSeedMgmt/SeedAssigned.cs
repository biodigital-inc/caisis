using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("SeedsAssigned")]
    [ParentTablename("Patients")]
    [MultiAssociated("Patients", "Seeds")]
    [Disease("Prostate")]
    [HasSiblings]
    [NoLock]
    public class SeedAssigned : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [NotNull]
        [LookupKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SeedId = "SeedId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SeedsAssignedId = "SeedsAssignedId";

        [DataType(typeof(System.String))]
        public static readonly String SeedImplantActivity = "SeedImplantActivity";

        [DataType(typeof(System.String))]
        public static readonly String SeedNum = "SeedNum";

    }
}
