using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Procedures")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Procedure : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.Int32))]
        public static readonly String OperatingRoomDetailId = "OperatingRoomDetailId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcCPT_Code = "ProcCPT_Code";

        [DataType(typeof(System.String))]
        public static readonly String ProcCPT_Modifier = "ProcCPT_Modifier";

        [DataType(typeof(System.String))]
        public static readonly String ProcCPT_Description = "ProcCPT_Description";

        [DataType(typeof(System.Byte))]
        public static readonly String ProcPending = "ProcPending";

        [DataType(typeof(System.Byte))]
        public static readonly String ProcPrimary = "ProcPrimary";

        [DataType(typeof(System.Int32))]
        public static readonly String ProcOrder = "ProcOrder";

        [DataType(typeof(System.Int32))]
        public static readonly String ProcPanelNum = "ProcPanelNum";

        [DataType(typeof(System.String))]
        public static readonly String ProcedureSourceId = "ProcedureSourceId";

        [DataType(typeof(System.String))]
        public static readonly String ProcLogNum = "ProcLogNum";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String ProcDateText = "ProcDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ProcDate = "ProcDate";

        [DataType(typeof(System.String))]
        public static readonly String ProcStartTime = "ProcStartTime";

        [DataType(typeof(System.String))]
        public static readonly String ProcEndTime = "ProcEndTime";
        
        [DataType(typeof(System.String))]
        public static readonly String ProcInstitution = "ProcInstitution";

        [DataType(typeof(System.String))]
        public static readonly String ProcService = "ProcService";

        [DataType(typeof(System.String))]
        public static readonly String ProcSurgeon = "ProcSurgeon";

        [DataType(typeof(System.String))]
        public static readonly String ProcSurgeonType = "ProcSurgeonType";

        [DataType(typeof(System.String))]
        public static readonly String ProcAssistant = "ProcAssistant";

        [DataType(typeof(System.String))]
        public static readonly String ProcAssistantType = "ProcAssistantType";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String ProcName = "ProcName";

        [DataType(typeof(System.String))]
        public static readonly String ProcApproach = "ProcApproach";

        [DataType(typeof(System.String))]
        public static readonly String ProcSite = "ProcSite";

        [DataType(typeof(System.String))]
        public static readonly String ProcSubsite = "ProcSubsite";

        [DataType(typeof(System.String))]
        public static readonly String ProcSide = "ProcSide";

        [DataType(typeof(System.String))]
        public static readonly String ProcIndication = "ProcIndication";

        [DataType(typeof(System.String))]
        public static readonly String ProcIncisionSite = "ProcIncisionSite"; //v5.1

        [DataType(typeof(System.String))]
        public static readonly String ProcNotes = "ProcNotes";

        [DataType(typeof(System.String))]
        public static readonly String ProcDataSource = "ProcDataSource";

        [DataType(typeof(System.String))]
        public static readonly String ProcQuality = "ProcQuality";

        // v6.0
        [DataType(typeof(System.String))]
        public static readonly String ProcPrepPosition = "ProcPrepPosition";


    }
}
