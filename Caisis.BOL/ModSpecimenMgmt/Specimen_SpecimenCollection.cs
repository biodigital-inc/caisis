using System;

namespace Caisis.BOL
{
    [Tablename("Specimen_SpecimenCollections")]
    [ParentTablename("Specimens")]
    [HasSiblings]
    [Exportable]
    public class Specimen_SpecimenCollections : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SpecimenCollectionId = "SpecimenCollectionId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SpecimenId = "SpecimenId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String CollectionId = "CollectionId";
    }
}
