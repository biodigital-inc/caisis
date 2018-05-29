using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PatientPhysicians")]
    [ParentTablename("Patients")]
    [MultiAssociated("Patients","Physicians")]
    [Disease("Identified")]
    [Exportable]
    [HasSiblings]
    public class PatientPhysician : BusinessObject
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
        public static readonly String PhysicianId = "PhysicianId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientPhysicianId = "PatientPhysicianId";

        [DataType(typeof(System.String))]
        public static readonly String PtPhRole = "PtPhRole";

        [DataType(typeof(System.String))]
        public static readonly String PtPhContactStatus = "PtPhContactStatus";

        [DataType(typeof(System.String))]
        public static readonly String PtPhNotes = "PtPhNotes";

    }
}
