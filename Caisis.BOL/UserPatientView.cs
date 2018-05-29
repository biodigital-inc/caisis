using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("UserPatientViews")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class UserPatientView : BusinessObject
    {
        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String UserId = "UserId";

        [NotNull]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserPatientViewId = "UserPatientViewId";

        [NotNull]
        [DataType(typeof(System.DateTime))]
        public static readonly String ViewTime = "ViewTime";

    }
}
