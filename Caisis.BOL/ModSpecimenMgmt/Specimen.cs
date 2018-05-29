using System;

namespace Caisis.BOL
{
    [Tablename("Specimens")]
    [ParentTablename("SpecimenAccessions")]
    [HasSiblings]
    [Exportable]
    public class Specimen : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SpecimenId = "SpecimenId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SpecimenAccessionId = "SpecimenAccessionId";

        [DataType(typeof(System.Int32))]
        public static readonly String ParentSpecimenId = "ParentSpecimenId";

        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenStatus = "SpecimenStatus";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenType = "SpecimenType";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenSubType = "SpecimenSubType";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenPreservationType = "SpecimenPreservationType";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenReferenceNumber = "SpecimenReferenceNumber";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenOriginalQty = "SpecimenOriginalQty";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenUnits = "SpecimenUnits";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenRemainingQty = "SpecimenRemainingQty";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenNumFreezeThaw = "SpecimenNumFreezeThaw";

        // v 6.1
        [DataType(typeof(System.String))]
        public static readonly String SpecimenTimeToStorage = "SpecimenTimeToStorage";


        [DataType(typeof(System.String))]
        public static readonly String BoxId = "BoxId";

        [DataType(typeof(System.String))]
        public static readonly String PositionId = "PositionId";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenNotes = "SpecimenNotes";

        // v 6.x
        [DataType(typeof(System.String))]
        public static readonly String SpecimenCollectionTime = "SpecimenCollectionTime";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenFrozenTime = "SpecimenFrozenTime";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenVialType = "SpecimenVialType";

        [DataType(typeof(System.String))]
        public static readonly String SpecimenVialNum = "SpecimenVialNum";
    }
}
