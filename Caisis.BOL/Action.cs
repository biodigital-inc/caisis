using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Actions")]
    [ParentTablename("Patients")]
    [Disease("Identified")]
    [Exportable]
    [HasSiblings]
    public class Action : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ActionId = "ActionId";

        [DataType(typeof(System.Byte))]
        public static readonly String ActionPending = "ActionPending";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String ActionDateText = "ActionDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ActionDate = "ActionDate";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String ActionItem = "ActionItem";

        [DataType(typeof(System.String))]
        public static readonly String ActionNotes = "ActionNotes";

    }
}
