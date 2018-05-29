using System;

namespace Caisis.BOL
{
    [Tablename("PatientEdWorkingVersion")]

    public class PatientEdWorkingVersion : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProfileId = "WorkingVersionId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String TableName = "TableName";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String TablePrimaryKey = "TablePrimaryKey";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String WorkingVersionContent = "WorkingVersionContent";

        [DataType(typeof(System.Double))]
        public static readonly String VersionNumber = "VersionNumber";

        [DataType(typeof(System.Int32))]
        public static readonly String RevisionNumber = "RevisionNumber";

        [DataType(typeof(System.String))]
        public static readonly String InitiatedBy = "InitiatedBy";

        [DataType(typeof(System.DateTime))]
        public static readonly String InitiatedTime = "InitiatedTime";

        [DataType(typeof(System.String))]
        public static readonly String LastUpdatedBy = "LastUpdatedBy";

        [DataType(typeof(System.DateTime))]
        public static readonly String LastUpdatedTime = "LastUpdatedTime";

        [DataType(typeof(System.String))]
        public static readonly String ApprovedBy = "ApprovedBy";

        [DataType(typeof(System.DateTime))]
        public static readonly String ApprovedTime = "ApprovedTime";


    }
}
