using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("UserDatasetViews")]
    [ParentTablename("UserLogins")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class UserDatasetView : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserLoginId = "UserLoginId";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String DatasetId = "DatasetId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserDatasetViewId = "UserDatasetViewId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Purpose = "Purpose";

        [NotNull]
        [DataType(typeof(System.DateTime))]
        public static readonly String ViewTime = "ViewTime";

    }
}
