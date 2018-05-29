using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenContainers")]
    [ParentTablename("SpecimenStorages")]
    [HasSiblings]
    public class SpecimenContainer : BusinessObject
    {
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String StorageId = "StorageId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContainerId = "ContainerId";

        [DataType(typeof(System.String))]
        public static readonly String ContainerName = "ContainerName";

        [DataType(typeof(System.String))]
        public static readonly String ContainerType = "ContainerType";

        [DataType(typeof(System.String))]
        public static readonly String ContainerStatus = "ContainerStatus";

        [DataType(typeof(System.Int32))]
        public static readonly String MaxBoxNo = "MaxBoxNo";

        [DataType(typeof(System.Int32))]
        public static readonly String CurBoxNo = "CurBoxNo";

    }
}
