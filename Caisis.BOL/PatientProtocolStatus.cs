using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PatientProtocolStatus")]
    [ParentTablename("PatientProtocols")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class PatientProtocolStatus : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientProtocolId = "PatientProtocolId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientProtocolStatusId = "PatientProtocolStatusId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String PtProtocolStatusDateText = "PtProtocolStatusDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String PtProtocolStatusDate = "PtProtocolStatusDate";

        [DataType(typeof(System.String))]
        public static readonly String PtProtocolStatus = "PtProtocolStatus";

        [DataType(typeof(System.String))]
        public static readonly String PtProtocolStatusReason = "PtProtocolStatusReason";

        [DataType(typeof(System.String))]
        public static readonly String PtProtocolStatusNotes = "PtProtocolStatusNotes";

    }
}
