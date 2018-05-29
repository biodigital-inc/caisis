using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("SeriousAdverseEvents")]
    [ParentTablename("Toxicities")]
    [Disease("All")]
    [Exportable]
    [NoLock]
    public class SeriousAdverseEvent : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ToxicityId = "ToxicityId";

        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [DataType(typeof(System.String))]
        public static readonly String SAE_Age = "SAE_Age";

        [DataType(typeof(System.String))]
        public static readonly String SAE_AttributedOutcome = "SAE_AttributedOutcome";

        [DataType(typeof(System.String))]
        public static readonly String SAE_ReportDateText = "SAE_ReportDateText";

        [DataType(typeof(System.DateTime))]
        public static readonly String SAE_ReportDate = "SAE_ReportDate";

        [DataType(typeof(System.String))]
        public static readonly String SAE_EventDescription = "SAE_EventDescription";

        [DataType(typeof(System.String))]
        public static readonly String SAE_RelevantTestData = "SAE_RelevantTestData";

        [DataType(typeof(System.String))]
        public static readonly String SAE_OtherRelevantHistory = "SAE_OtherRelevantHistory";

        [DataType(typeof(System.String))]
        public static readonly String SAE_ConcommitantMeds = "SAE_ConcommitantMeds";

        [DataType(typeof(System.String))]
        public static readonly String SAE_NDC_Number = "SAE_NDC_Number";

        [DataType(typeof(System.String))]
        public static readonly String SAE_EventAbated1 = "SAE_EventAbated1";

        [DataType(typeof(System.String))]
        public static readonly String SAE_EventAbated2 = "SAE_EventAbated2";

        [DataType(typeof(System.String))]
        public static readonly String SAE_EventReappeared1 = "SAE_EventReappeared1";

        [DataType(typeof(System.String))]
        public static readonly String SAE_EventReappeared2 = "SAE_EventReappeared2";

        [DataType(typeof(System.String))]
        public static readonly String SAE_ReportingIndividual = "SAE_ReportingIndividual";

        [DataType(typeof(System.String))]
        public static readonly String SAE_ReportFDA_DateText = "SAE_ReportFDA_DateText";

        [DataType(typeof(System.DateTime))]
        public static readonly String SAE_ReportFDA_Date = "SAE_ReportFDA_Date";

        [DataType(typeof(System.String))]
        public static readonly String SAE_ReportFDA_Status = "SAE_ReportFDA_Status";

        [DataType(typeof(System.String))]
        public static readonly String SAE_Sequelae = "SAE_Sequelae";

        [DataType(typeof(System.String))]
        public static readonly String SAE_ReportedToIRB = "SAE_ReportedToIRB";

        [DataType(typeof(System.String))]
        public static readonly String SAE_Notes = "SAE_Notes";

        // v6.x
        [DataType(typeof(System.Byte))]
        public static readonly String SAE_Death = "SAE_Death";

        [DataType(typeof(System.Byte))]
        public static readonly String SAE_LifeThreatening = "SAE_LifeThreatening";

        [DataType(typeof(System.Byte))]
        public static readonly String SAE_Hospitalization = "SAE_Hospitalization";

        [DataType(typeof(System.Byte))]
        public static readonly String SAE_Disability = "SAE_Disability";

        [DataType(typeof(System.Byte))]
        public static readonly String SAE_Congenital = "SAE_Congenital";

        [DataType(typeof(System.Byte))]
        public static readonly String SAE_MIE = "SAE_MIE";

        [DataType(typeof(System.DateTime))]
        public static readonly String SAE_SignedDate = "SAE_SignedDate";

        [DataType(typeof(System.String))]
        public static readonly String SAE_Investigator = "SAE_Investigator";
    }
}
