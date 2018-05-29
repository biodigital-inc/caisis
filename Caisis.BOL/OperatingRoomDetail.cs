using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("OperatingRoomDetails")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class OperatingRoomDetail : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String OperatingRoomDetailId = "OperatingRoomDetailId";

        [DataType(typeof(System.Byte))]
        public static readonly String OpPending = "OpPending";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String OpDateText = "OpDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String OpDate = "OpDate";

        [DataType(typeof(System.String))]
        public static readonly String OpInstitution = "OpInstitution";

        [DataType(typeof(System.String))]
        public static readonly String OpService = "OpService";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String OpAdmitDateText = "OpAdmitDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String OpAdmitDate = "OpAdmitDate";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String OpDischargeDateText = "OpDischargeDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String OpDischargeDate = "OpDischargeDate";

        [DataType(typeof(System.String))]
        public static readonly String OpCaseSurgeon = "OpCaseSurgeon";

        [DataType(typeof(System.String))]
        public static readonly String OpDuration = "OpDuration";

        [DataType(typeof(System.String))]
        public static readonly String OpAnesthesiaDuration = "OpAnesthesiaDuration";

        [DataType(typeof(System.String))]
        public static readonly String OpAnesthesiaType = "OpAnesthesiaType";

        [DataType(typeof(System.String))]
        public static readonly String OpEstBloodLoss = "OpEstBloodLoss";

        [DataType(typeof(System.String))]
        public static readonly String OpAutoAvailable = "OpAutoAvailable";

        [DataType(typeof(System.String))]
        public static readonly String OpAutoTransfused = "OpAutoTransfused";

        [DataType(typeof(System.String))]
        public static readonly String OpRBC_Available = "OpRBC_Available";

        [DataType(typeof(System.String))]
        public static readonly String OpRBC_Transfused = "OpRBC_Transfused";

        [DataType(typeof(System.String))]
        public static readonly String OpRBC_IntraOp = "OpRBC_IntraOp";

        [DataType(typeof(System.String))]
        public static readonly String OpRBC_PostOp = "OpRBC_PostOp";

        [DataType(typeof(System.String))]
        public static readonly String OpHD_Available = "OpHD_Available";

        [DataType(typeof(System.String))]
        public static readonly String OpHD_Transfused = "OpHD_Transfused";

        [DataType(typeof(System.String))]
        public static readonly String OpHGB_Admit = "OpHGB_Admit";

        [DataType(typeof(System.String))]
        public static readonly String OpHCT_Admit = "OpHCT_Admit";

        [DataType(typeof(System.String))]
        public static readonly String OpHGB_IntraOp = "OpHGB_IntraOp";

        [DataType(typeof(System.String))]
        public static readonly String OpHCT_IntraOp = "OpHCT_IntraOp";

        [DataType(typeof(System.String))]
        public static readonly String OpFFP_Transfused = "OpFFP_Transfused";

        [DataType(typeof(System.String))]
        public static readonly String OpPlateletsTransfused = "OpPlateletsTransfused";

        [DataType(typeof(System.String))]
        public static readonly String OpCryoTransfused = "OpCryoTransfused";

        [DataType(typeof(System.String))]
        public static readonly String OpPreOpAntibiotics = "OpPreOpAntibiotics";

        [DataType(typeof(System.String))]
        public static readonly String OpIntraOpAntibiotics = "OpIntraOpAntibiotics";

        [DataType(typeof(System.String))]
        public static readonly String OpPostOpAntibiotics = "OpPostOpAntibiotics";

        [DataType(typeof(System.String))]
        public static readonly String OpNG_Tube = "OpNG_Tube";

        [DataType(typeof(System.String))]
        public static readonly String OpAnticoagulation = "OpAnticoagulation";

        [DataType(typeof(System.String))]
        public static readonly String OpPneumatics = "OpPneumatics";

        [DataType(typeof(System.String))]
        public static readonly String OpICU_PostOp = "OpICU_PostOp";

        [DataType(typeof(System.String))]
        public static readonly String OpPostOpDayFed = "OpPostOpDayFed";

        [DataType(typeof(System.String))]
        public static readonly String OpASA = "OpASA";

        [DataType(typeof(System.String))]
        public static readonly String OpFluids = "OpFluids";

        [DataType(typeof(System.String))]
        public static readonly String OpFluidNormosol = "OpFluidNormosol";

        [DataType(typeof(System.String))]
        public static readonly String OpFluidAlbumin = "OpFluidAlbumin";

        [DataType(typeof(System.String))]
        public static readonly String OpFluidManitol = "OpFluidManitol";

        [DataType(typeof(System.String))]
        public static readonly String OpFluidHespan = "OpFluidHespan";

        [DataType(typeof(System.String))]
        public static readonly String OpDifficulty = "OpDifficulty";

        [DataType(typeof(System.String))]
        public static readonly String OpNS_ProbeType = "OpNS_ProbeType";

        [DataType(typeof(System.String))]
        public static readonly String OpNS_Notes = "OpNS_Notes";

        [DataType(typeof(System.String))]
        public static readonly String OpPresenceStatement = "OpPresenceStatement";

        [DataType(typeof(System.String))]
        public static readonly String OpPresenceKeyPortions = "OpPresenceKeyPortions";

        [DataType(typeof(System.String))]
        public static readonly String OpNotes = "OpNotes";

        [DataType(typeof(System.String))]
        public static readonly String OpDataSource = "OpDataSource";

        [DataType(typeof(System.String))]
        public static readonly String OpQuality = "OpQuality";

        // below added in v4.1
        [DataType(typeof(System.String))]
        public static readonly String OpAutoIntraOp = "OpAutoIntraOp";

        [DataType(typeof(System.String))]
        public static readonly String OpAutoPostOp = "OpAutoPostOp";

        [DataType(typeof(System.String))]
        public static readonly String OpFFP_Available = "OpFFP_Available";

        [DataType(typeof(System.String))]
        public static readonly String OpFFP_IntraOp = "OpFFP_IntraOp";

        [DataType(typeof(System.String))]
        public static readonly String OpFFP_PostOp = "OpFFP_PostOp";

        [DataType(typeof(System.String))]
        public static readonly String OpPlateletsAvailable = "OpPlateletsAvailable";

        [DataType(typeof(System.String))]
        public static readonly String OpPlateletsIntraOp = "OpPlateletsIntraOp";

        [DataType(typeof(System.String))]
        public static readonly String OpPlateletsPostOp = "OpPlateletsPostOp";

        [DataType(typeof(System.String))]
        public static readonly String OpCryoAvailable = "OpCryoAvailable";

        [DataType(typeof(System.String))]
        public static readonly String OpCryoIntraOp = "OpCryoIntraOp";

        [DataType(typeof(System.String))]
        public static readonly String OpCryoPostOp = "OpCryoPostOp";

        [DataType(typeof(System.String))]
        public static readonly String OpHD_IntraOp = "OpHD_IntraOp";

        [DataType(typeof(System.String))]
        public static readonly String OpColloid = "OpColloid";

        [DataType(typeof(System.String))]
        public static readonly String OpCrystalloid = "OpCrystalloid";

        [DataType(typeof(System.String))]
        public static readonly String OpUrineOutput = "OpUrineOutput"; // v5.1

        [DataType(typeof(System.String))]
        public static readonly String OpLogNum = "OpLogNum";  // v4.2

        [DataType(typeof(System.String))]
        public static readonly String OpInTime = "OpInTime"; // v 5.0

        [DataType(typeof(System.String))]
        public static readonly String OpOutTime = "OpOutTime"; // v 5.0

        [DataType(typeof(System.String))]
        public static readonly String OpAdmitStatus = "OpAdmitStatus"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String OpLocation = "OpLocation"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String OpIntraopMonitoring = "OpIntraopMonitoring"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String OpPreOpSummary = "OpPreOpSummary";

        [DataType(typeof(System.String))]
        public static readonly String OpPostOpSummary = "OpPostOpSummary";
                
        [DataType(typeof(System.String))]
        public static readonly String OpPatientDisposition = "OpPatientDisposition"; // v5.0

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String OpFoleyCatheter = "OpFoleyCatheter";

        [DataType(typeof(System.String))]
        public static readonly String OpStraightCatheter = "OpStraightCatheter";
    }
}
