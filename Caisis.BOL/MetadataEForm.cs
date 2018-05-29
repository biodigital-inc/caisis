using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataEForms")]
    [NoBaseColumns]
    public class MetadataEForm : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MetadataEFormId = "MetadataEFormId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String EFormName = "EFormName";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String EFormType = "EFormType";

        [DataType(typeof(System.String))]
        public static readonly String EFormDisease = "EFormDisease";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String EFormVersionNum = "EFormVersionNum";

        [DataType(typeof(System.String))]
        public static readonly String EFormTransformFileName = "EFormTransformFileName";

    }
}
