using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ColorectalProc")]
    [ParentTablename("Procedures")]
    [Disease("Colorectal")]
    [Exportable]
    [NoLock]
    public class ColorectalProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcIntent = "ProcIntent";

		[DataType(typeof(System.String))]
		public static readonly String ProcComplication = "ProcComplication";
        
        [DataType(typeof(System.String))]
        public static readonly String ProcTumorObstruction = "ProcTumorObstruction";

        [DataType(typeof(System.String))]
        public static readonly String ProcPerforation = "ProcPerforation";

        [DataType(typeof(System.String))]
        public static readonly String ProcCompleteResection = "ProcCompleteResection";

        [DataType(typeof(System.String))]
        public static readonly String ProcDiseaseExtent = "ProcDiseaseExtent";

        [DataType(typeof(System.String))]
        public static readonly String ProcPathType = "ProcPathType";

        [DataType(typeof(System.String))]
        public static readonly String ProcTumorAnalVerge = "ProcTumorAnalVerge";

        [DataType(typeof(System.String))]
        public static readonly String ProcRectalExamPreOp = "ProcRectalExamPreOp";

        [DataType(typeof(System.String))]
        public static readonly String ProcRectalLocation = "ProcRectalLocation";

        [DataType(typeof(System.String))]
        public static readonly String ProcAPR_PreOp = "ProcAPR_PreOp";

        [DataType(typeof(System.String))]
        public static readonly String ProcAPR_IntraOp = "ProcAPR_IntraOp";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnast = "ProcAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnatomy = "ProcAnatomy";

        [DataType(typeof(System.String))]
        public static readonly String ProcSplenicFlexure = "ProcSplenicFlexure";

        [DataType(typeof(System.String))]
        public static readonly String ProcPouchSize = "ProcPouchSize";

        [DataType(typeof(System.String))]
        public static readonly String ProcColoplastySize = "ProcColoplastySize";

        [DataType(typeof(System.String))]
        public static readonly String ProcProximalTransection = "ProcProximalTransection";

        [DataType(typeof(System.String))]
        public static readonly String ProcArteryLigation = "ProcArteryLigation";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnastAnalVergeDist = "ProcAnastAnalVergeDist";

        [DataType(typeof(System.String))]
        public static readonly String ProcMucosectomy = "ProcMucosectomy";

        [DataType(typeof(System.String))]
        public static readonly String ProcColostomyIleostomy = "ProcColostomyIleostomy";

        [DataType(typeof(System.String))]
        public static readonly String ProcIntraSphinctericDissection = "ProcIntraSphinctericDissection";

        [DataType(typeof(System.String))]
        public static readonly String ProcSynchronousResection = "ProcSynchronousResection";

        [DataType(typeof(System.String))]
        public static readonly String ProcSynchResectionLiver = "ProcSynchResectionLiver";

        [DataType(typeof(System.String))]
        public static readonly String ProcSynchResectionLung = "ProcSynchResectionLung";

        [DataType(typeof(System.String))]
        public static readonly String ProcSynchResectionRetroperitonealNodal = "ProcSynchResectionRetroperitonealNodal";

        [DataType(typeof(System.String))]
        public static readonly String ProcSynchResectionOvary = "ProcSynchResectionOvary";

        [DataType(typeof(System.String))]
        public static readonly String ProcSynchResectionPeritoneal = "ProcSynchResectionPeritoneal";

        [DataType(typeof(System.String))]
        public static readonly String ProcSynchResectionOther = "ProcSynchResectionOther";

        // more fields for v 6.0
        [DataType(typeof(System.String))]
        public static readonly String ProcAbdominalSkinClosure = "ProcAbdominalSkinClosure";

        [DataType(typeof(System.String))]
        public static readonly String ProcAdhesionBarrier = "ProcAdhesionBarrier";

        [DataType(typeof(System.String))]
        public static readonly String ProcPerinalDissectionPlane = "ProcPerinalDissectionPlane";

        [DataType(typeof(System.String))]
        public static readonly String ProcDistalIntestinalDivisionPoint = "ProcDistalIntestinalDivisionPoint";

        [DataType(typeof(System.String))]
        public static readonly String ProcProximalIntestinalDivisionPoint = "ProcProximalIntestinalDivisionPoint";

        [DataType(typeof(System.String))]
        public static readonly String ProcSewnTechnique = "ProcSewnTechnique";

        [DataType(typeof(System.String))]
        public static readonly String ProcStaplerSize = "ProcStaplerSize";

        [DataType(typeof(System.String))]
        public static readonly String ProcStaplerType = "ProcStaplerType";

        [DataType(typeof(System.String))]
        public static readonly String ProcLapComponentPerformed = "ProcLapComponentPerformed";

        [DataType(typeof(System.String))]
        public static readonly String ProcLapDescription = "ProcLapDescription";

        [DataType(typeof(System.String))]
        public static readonly String ProcDrains = "ProcDrains";

        [DataType(typeof(System.String))]
        public static readonly String ProcColoanalAnast = "ProcColoanalAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcLA_Configuration = "ProcLA_Configuration";

        [DataType(typeof(System.String))]
        public static readonly String ProcLA_Diversion = "ProcLA_Diversion";

        [DataType(typeof(System.String))]
        public static readonly String ProcLA_MesorectalExcisionExtent = "ProcLA_MesorectalExcisionExtent";

        [DataType(typeof(System.String))]
        public static readonly String ProcLA_LeftManeuverColonPelvicAnast = "ProcLA_LeftManeuverColonPelvicAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcParasympatheticNervesPreserved = "ProcParasympatheticNervesPreserved";

        [DataType(typeof(System.String))]
        public static readonly String ProcRectumDividedDistalToTumor = "ProcRectumDividedDistalToTumor";

        [DataType(typeof(System.String))]
        public static readonly String ProcAirLeakTest = "ProcAirLeakTest";

        [DataType(typeof(System.String))]
        public static readonly String ProcSympatheticNervesPreserved = "ProcSympatheticNervesPreserved";

        [DataType(typeof(System.String))]
        public static readonly String ProcFasciaClosedPort = "ProcFasciaClosedPort";

        [DataType(typeof(System.String))]
        public static readonly String ProcSpecimenExtractIncisionLocation  = "ProcSpecimenExtractIncisionLocation";

        [DataType(typeof(System.String))]
        public static readonly String ProcMethodOfEntry = "ProcMethodOfEntry";

        [DataType(typeof(System.String))]
        public static readonly String ProcHandPortIncisionOrientation = "ProcHandPortIncisionOrientation";

        [DataType(typeof(System.String))]
        public static readonly String ProcSpecimenExtractIncisionOrientation = "ProcSpecimenExtractIncisionOrientation";

        [DataType(typeof(System.String))]
        public static readonly String ProcPortSizes = "ProcPortSizes";

        [DataType(typeof(System.String))]
        public static readonly String ProcTumorLocation = "ProcTumorLocation";

        [DataType(typeof(System.String))]
        public static readonly String ProcUreterPreserved = "ProcUreterPreserved";

        [DataType(typeof(System.String))]
        public static readonly String ProcAdhesion = "ProcAdhesion";

        [DataType(typeof(System.String))]
        public static readonly String ProcNotes = "ProcNotes";
    }
}
