using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DiagnosisCodes")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class DiagnosisCode : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosisCodeId = "DiagnosisCodeId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String TableName = "TableName";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String PrimaryKey = "PrimaryKey";

        [DataType(typeof(System.String))]
        public static readonly String ICD_Code = "ICD_Code";

        [DataType(typeof(System.String))]
        public static readonly String ICD_Description = "ICD_Description";

    }
}
