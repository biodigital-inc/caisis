using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("EForms")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class EForm : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserId = "UserId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EFormId = "EFormId";

        [DataType(typeof(System.String))]
        public static readonly String EFormName = "EFormName";

        [DataType(typeof(System.String))]
        public static readonly String EFormXML = "EFormXML";

        [DataType(typeof(System.String))]
        public static readonly String EFormReport = "EFormReport";

        [DataType(typeof(System.String))]
        public static readonly String CurrentStatus = "CurrentStatus";

        [DataType(typeof(System.DateTime))]
        public static readonly String EformApptTime = "EformApptTime";

        [DataType(typeof(System.String))]
        public static readonly String EformApptPhysician = "EformApptPhysician";

    }
}
