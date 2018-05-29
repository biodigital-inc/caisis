using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("UserExports")]
    [ParentTablename("UserLogins")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class UserExport : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserLoginId = "UserLoginId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserExportId = "UserExportId";

        [DataType(typeof(System.String))]
        public static readonly String ExportType = "ExportType";

        [DataType(typeof(System.String))]
        public static readonly String ExportName = "ExportName";

        [DataType(typeof(System.String))]
        public static readonly String DiseaseType = "DiseaseType";

        [DataType(typeof(System.String))]
        public static readonly String PrivacyLevel = "PrivacyLevel";

        [DataType(typeof(System.String))]
        public static readonly String Purpose = "Purpose";

        [DataType(typeof(System.String))]
        public static readonly String IRB_ApprovalType = "IRB_ApprovalType";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String IRB_ApprovalDate = "IRB_ApprovalDate";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ExportDate = "ExportDate";

    }
}
