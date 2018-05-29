using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Datasets")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class Dataset : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DatasetId = "DatasetId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String DatasetName = "DatasetName";

        [DataType(typeof(System.String))]
        public static readonly String DatasetView = "DatasetView";

        [NotNull]
        [DataType(typeof(System.Byte))]
        public static readonly String DatasetActive = "DatasetActive";

    }
}
