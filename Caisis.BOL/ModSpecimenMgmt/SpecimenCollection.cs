using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenCollections")]
    public class SpecimenCollection : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String CollectionId = "CollectionId";

        [DataType(typeof(System.Int32))]
        public static readonly String SpecimenRequestId = "SpecimenRequestId";

        [DataType(typeof(System.String))]
        public static readonly String CollectionName = "CollectionName";

        [DataType(typeof(System.String))]
        public static readonly String CollectionProjectCode = "CollectionProjectCode";

        [DataType(typeof(System.String))]
        public static readonly String CollectionType = "CollectionType";

        [DataType(typeof(System.String))]
        public static readonly String CollectionPurpose = "CollectionPurpose";

        [DataType(typeof(System.String))]
        public static readonly String CollectionStatus = "CollectionStatus";

        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [DataType(typeof(System.DateTime))]
        public static readonly String CollectionAssignDate = "CollectionAssignDate";

        [DataType(typeof(System.String))]
        public static readonly String CollectionAssignNotes = "CollectionAssignNotes";

    }
}
