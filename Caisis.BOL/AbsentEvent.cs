using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("AbsentEvents")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class AbsentEvent : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String AbsentEventId = "AbsentEventId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String TableName = "TableName";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String FieldName = "FieldName";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String FieldValue = "FieldValue";

        [DataType(typeof(System.String))]
        public static readonly String AbsentReason = "AbsentReason";

        [DataType(typeof(System.String))]
        public static readonly String AbsentDateText = "AbsentDateText";

        [DataType(typeof(System.DateTime))]
        public static readonly String AbsentDate = "AbsentDate";

        [DataType(typeof(System.String))]
        public static readonly String AbsentNotes = "AbsentNotes";

        [DataType(typeof(System.String))]
        public static readonly String AbsentQuality = "AbsentQuality";

    }
}


