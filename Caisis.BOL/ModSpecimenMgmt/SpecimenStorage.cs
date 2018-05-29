using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenStorages")]
    [ParentTablename("SpecimenSites")]
    [HasSiblings]
    public class SpecimenStorage : BusinessObject
    {
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SiteId = "SiteId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String StorageId = "StorageId";

        [DataType(typeof(System.String))]
        public static readonly String StorageName = "StorageName";

        [DataType(typeof(System.String))]
        public static readonly String StorageType = "StorageType";

        [DataType(typeof(System.String))]
        public static readonly String StorageStatus = "StorageStatus";

        [DataType(typeof(System.Int32))]
        public static readonly String MaxContainerNo = "MaxContainerNo";

        [DataType(typeof(System.Int32))]
        public static readonly String CurContainerNo = "CurContainerNo";

        [DataType(typeof(System.String))]
        public static readonly String StorageNotes = "StorageNotes";

    }
}
