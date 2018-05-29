using System;

namespace Caisis.BOL
{
    [Tablename("ProjectLetterOfIntent")]
    [ParentTablename("Project")]
    [HasSiblings]
    [NoLock]
    public class ProjectLetterOfIntent : BusinessObject
    {
        [ForeignKey]
        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectId = "ProjectId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectLetterOfIntentId = "ProjectLetterOfIntentId";

        [DataType(typeof(System.DateTime))]
        public static readonly String CreationDate = "CreationDate";

        [DataType(typeof(System.String))]
        public static readonly String LOINumber = "LOINumber";

        [DataType(typeof(System.String))]
        public static readonly String StudyPhase = "StudyPhase";

        [DataType(typeof(System.Int32))]
        public static readonly String SampleSize = "SampleSize";

        [DataType(typeof(System.String))]
        public static readonly String PopulationDescription = "PopulationDescription";

        [DataType(typeof(System.String))]
        public static readonly String PopulationDiseaseState = "PopulationDiseaseState";

        [DataType(typeof(System.String))]
        public static readonly String Objectives = "Objectives";

        [DataType(typeof(System.String))]
        public static readonly String Background = "Background";

        [DataType(typeof(System.String))]
        public static readonly String Eligibility = "Eligibility";

        [DataType(typeof(System.String))]
        public static readonly String ResearchMethods = "ResearchMethods";

        [DataType(typeof(System.String))]
        public static readonly String EvaluationMetrics = "EvaluationMetrics";

        [DataType(typeof(System.String))]
        public static readonly String ContractNotes = "ContractNotes";

        [DataType(typeof(System.String))]
        public static readonly String INDHolder = "INDHolder";

        [DataType(typeof(System.String))]
        public static readonly String INDNumber = "INDNumber";

        [DataType(typeof(System.String))]
        public static readonly String DataCollection = "DataCollection";

        [DataType(typeof(System.String))]
        public static readonly String ProtocolAuthor = "ProtocolAuthor";

        [DataType(typeof(System.String))]
        public static readonly String ParticipatingCenters = "ParticipatingCenters";

        [DataType(typeof(System.String))]
        public static readonly String MoreCentersNeeded = "MoreCentersNeeded";

        [DataType(typeof(System.String))]
        public static readonly String PCCTCBudgetUsed = "PCCTCBudgetUsed";

        [DataType(typeof(System.String))]
        public static readonly String RelativeStudiesProposed = "RelativeStudiesProposed";

        [DataType(typeof(System.String))]
        public static readonly String RelativeStudiesFunded = "RelativeStudiesFunded";

        [DataType(typeof(System.String))]
        public static readonly String MCTAUsed = "MCTAUsed";

        [DataType(typeof(System.String))]
        public static readonly String AgentsToBeStudied = "AgentsToBeStudied";

        [DataType(typeof(System.String))]
	    public static readonly String AgentSource = "AgentSource";

        [DataType(typeof(System.String))]
	    public static readonly String ProtocolWritten = "ProtocolWritten";

        [DataType(typeof(System.String))]
	    public static readonly String ProtocolProvided = "ProtocolProvided";

        [DataType(typeof(System.String))]
	    public static readonly String ProtocolIRBApproved = "ProtocolIRBApproved";

        [DataType(typeof(System.String))]
	    public static readonly String OpeningAtOtherCenters = "OpeningAtOtherCenters";

        [DataType(typeof(System.String))]
	    public static readonly String IsBudgetPerPatient = "IsBudgetPerPatient";

        [DataType(typeof(System.String))]
	    public static readonly String BudgetNotes = "BudgetNotes";

        [DataType(typeof(System.String))]
	    public static readonly String ContractExecuted = "ContractExecuted";

        [DataType(typeof(System.String))]
	    public static readonly String SponsorAgreed = "SponsorAgreed";

        [DataType(typeof(System.String))]
	    public static readonly String PerformanceStatus = "PerformanceStatus";

        [DataType(typeof(System.String))]
	    public static readonly String PriorTherapy = "PriorTherapy";

        [DataType(typeof(System.String))]
	    public static readonly String CompletedByFirstName = "CompletedByFirstName";

        [DataType(typeof(System.String))]
	    public static readonly String CompletedByLastName = "CompletedByLastName";

        [DataType(typeof(System.String))]
	    public static readonly String CompletedByEmail = "CompletedByEmail";

        [DataType(typeof(System.String))]
        public static readonly String CompletedByPhone = "CompletedByPhone";

        [DataType(typeof(System.String))]
        public static readonly String AbnormalOrganFunction = "AbnormalOrganFunction";

        [DataType(typeof(System.String))]
        public static readonly String StatisticsAnalyticsPlans = "StatisticsAnalyticsPlans";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";

 

    }
}
