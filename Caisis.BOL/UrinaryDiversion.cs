using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("UrinaryDiversionProc")]
    [ParentTablename("Procedures")]
    [Disease("Bladder")]
    [Exportable]
    [NoLock]
    public class UrinaryDiversion : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcTermIleumLength = "ProcTermIleumLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_ColonLength = "ProcR_ColonLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcSigmoidLength = "ProcSigmoidLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcTransColonLength = "ProcTransColonLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcIlealBasedLength = "ProcIlealBasedLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcAppendixLength = "ProcAppendixLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcOtherSegment = "ProcOtherSegment";

        [DataType(typeof(System.String))]
        public static readonly String ProcOtherSegmentLength = "ProcOtherSegmentLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcStomaType = "ProcStomaType";

        [DataType(typeof(System.String))]
        public static readonly String ProcStomaLocation = "ProcStomaLocation";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumFascialSutures = "ProcNumFascialSutures";

        [DataType(typeof(System.String))]
        public static readonly String ProcUreterStents = "ProcUreterStents";

        [DataType(typeof(System.String))]
        public static readonly String ProcUreterStentExternalized = "ProcUreterStentExternalized";

        [DataType(typeof(System.String))]
        public static readonly String ProcEvertedMucosa = "ProcEvertedMucosa";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_UreterAnast = "ProcL_UreterAnast";

		[DataType(typeof(System.String))]
		public static readonly String ProcR_UreterAnast = "ProcR_UreterAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcNB_Configuration = "ProcNB_Configuration";

        [DataType(typeof(System.String))]
        public static readonly String ProcNB_NumChimneys = "ProcNB_NumChimneys";

        [DataType(typeof(System.String))]
        public static readonly String ProcNB_ChimneyLength1 = "ProcNB_ChimneyLength1";

        [DataType(typeof(System.String))]
        public static readonly String ProcNB_ChimneyLength2 = "ProcNB_ChimneyLength2";

        [DataType(typeof(System.String))]
        public static readonly String ProcNB_AfferentLimbLength = "ProcNB_AfferentLimbLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcBladderNeckTube = "ProcBladderNeckTube";

        [DataType(typeof(System.String))]
        public static readonly String ProcBladderNeckTubeLength = "ProcBladderNeckTubeLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumSutures = "ProcNumSutures";

        [DataType(typeof(System.String))]
        public static readonly String ProcNB_NumUrethraSutures = "ProcNB_NumUrethraSutures";

        [DataType(typeof(System.String))]
        public static readonly String ProcNB_UrethraSutureType = "ProcNB_UrethraSutureType";

        [DataType(typeof(System.String))]
        public static readonly String ProcNB_UrethraSutureQuality = "ProcNB_UrethraSutureQuality";

        [DataType(typeof(System.String))]
        public static readonly String ProcContMech = "ProcContMech";

        [DataType(typeof(System.String))]
        public static readonly String ProcContMechSubtype = "ProcContMechSubtype";

        [DataType(typeof(System.String))]
        public static readonly String ProcContMechLength = "ProcContMechLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcJP_Drain = "ProcJP_Drain";

        [DataType(typeof(System.String))]
        public static readonly String ProcPelvicDrain = "ProcPelvicDrain";

        [DataType(typeof(System.String))]
        public static readonly String ProcPenroseDrain = "ProcPenroseDrain";

        [DataType(typeof(System.String))]
        public static readonly String ProcSuprapubicDrain = "ProcSuprapubicDrain";

        [DataType(typeof(System.String))]
        public static readonly String ProcStomalDrain = "ProcStomalDrain";

        [DataType(typeof(System.String))]
        public static readonly String ProcUrethraDrain = "ProcUrethraDrain";

        [DataType(typeof(System.String))]
        public static readonly String ProcPouch = "ProcPouch";

    }
}
