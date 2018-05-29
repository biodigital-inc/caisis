using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("UserExportPatients")]
    [ParentTablename("UserExports")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class UserExportPatient : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserExportId = "UserExportId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserExportPatientId = "UserExportPatientId";

        [DataType(typeof(System.Int32))]
        public static readonly String AnonymousId = "AnonymousId";

        [NotNull]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.String))]
        public static readonly String PtMRN = "PtMRN";

    }
}
