using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("GroupDatasets")]
    [Disease("All")]
    [NoLock]
    public class GroupDataset : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String GroupDatasetId = "GroupDatasetId";

        [DataType(typeof(System.Int32))]
        public static readonly String GroupId = "GroupId";

        [DataType(typeof(System.Int32))]
        public static readonly String DatasetId = "DatasetId";

        [DataType(typeof(System.DateTime))]
        public static readonly String DeactivatedTime = "DeactivatedTime";

    }
}
