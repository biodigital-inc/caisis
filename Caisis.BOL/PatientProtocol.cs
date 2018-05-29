using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PatientProtocols")]
    [ParentTablename("Patients")]
    [MultiAssociated("Patients", "Protocols")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class PatientProtocol : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [NotNull]
        [LookupKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolId = "ProtocolId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientProtocolId = "PatientProtocolId";

        [DataType(typeof(System.Int32))]
        public static readonly String PtProtocolScreeningId = "PtProtocolScreeningId";

        [DataType(typeof(System.String))]
        public static readonly String PtProtocolStudyId = "PtProtocolStudyId";

        [DataType(typeof(System.String))]
        public static readonly String PtProtocolStatus = "PtProtocolStatus";

        [DataType(typeof(System.String))]
        public static readonly String PtProtocolNotes = "PtProtocolNotes";

        [DataType(typeof(System.String))]
        public static readonly String PtProtocolDataSource = "PtProtocolDataSource";

        [DataType(typeof(System.String))]
        public static readonly String PtProtocolQuality = "PtProtocolQuality";

    }
}
