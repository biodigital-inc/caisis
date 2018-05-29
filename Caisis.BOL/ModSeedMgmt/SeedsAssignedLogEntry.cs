using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("SeedsAssignedLog")]
    [ParentTablename("Seeds")]
    [Disease("Prostate")]
    [HasSiblings]
    [NoLock]
    public class SeedsAssignedLogEntry : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SeedId = "SeedId";

        [DataType(typeof(System.Int32))]
        public static readonly String SeedsAssignedId = "SeedsAssignedId";

        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SeedsAssignedLogId = "SeedsAssignedLogId";

        [DataType(typeof(System.String))]
        public static readonly String LoggedOperation = "LoggedOperation";

        [DataType(typeof(System.String))]
        public static readonly String LoggedBy = "LoggedBy";

        [DataType(typeof(System.DateTime))]
        public static readonly String LoggedTime = "LoggedTime";

        [DataType(typeof(System.String))]
        public static readonly String SeedNum = "SeedNum";

    }
}
