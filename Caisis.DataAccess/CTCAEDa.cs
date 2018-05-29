using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;


namespace Caisis.DataAccess
{
    public class CTCAEDa : BaseDA
    {


        /// <summary>
        /// Returns CTC versions
        /// </summary>
        /// <param name="terminoloyId"></param>
        /// <returns></returns>
        public DataSet GetCTCAETerminlogyVersions()
        {
            string sql = "SELECT  AE_TerminologyID, AE_Terminology_ShortDesc, AE_Terminology_LongDesc, AE_Terminology_Date_Of_Issue FROM CTC_AE_Terminology ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataSet ds = DataAccessHelper.GetList(cmd);
            return ds;
        }

        /// <summary>
        /// Returns categories for a CTC version
        /// </summary>
        /// <param name="terminoloyId"></param>
        /// <returns></returns>
        public DataSet GetToxCategories(int terminologyId)
        {
            string sql = "SELECT  AE_CategoryID, AE_Category_Description FROM CTC_AE_Category " +
                         "WHERE AE_TerminologyID = @TerminologyId ORDER BY AE_CategoryID";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "TerminologyId", terminologyId);
            DataSet ds = DataAccessHelper.GetList(cmd);
            return ds;
        }

        /// <summary>
        /// Returns Adverse Events for a CTC Category
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public DataSet GetToxCategoryAdverseEvents(int categoryId)
        {
            // was GetToxicities_UVACC()
            
            string sql = "SELECT  CTC_AE_Toxicity_TermID, CTC_AE_Toxicity_Description AS ToxDesc, MedDRA_Code, AE_CategoryID, AE_Category_Description " +
                         "FROM  CTC_AE_Toxicity_Terms "+
                         "WHERE AE_CategoryID = "+
                            "CASE WHEN @CategoryId = 0 THEN 0 " +
                            "ELSE @CategoryId END " +
                            "ORDER BY AE_Category_Description";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "CategoryId", categoryId);
            DataSet ds = DataAccessHelper.GetList(cmd);
            return ds;
        }

        /// <summary>
        /// Returns Adverse Events Grades for an adverse event
        /// </summary>
        /// <param name="adverseEventId"></param>
        /// <returns></returns>
        public DataSet GetToxAdverseEventGrades(int adverseEventId)
        {
            string sql = "SELECT  AE_Grade, AE_Grade_Description "+
                         "FROM CTC_AE_Toxicity_Grades " +
                          "WHERE MedDRA_Code =(SELECT DISTINCT MedDRA_Code FROM CTC_AE_Toxicity_Terms " +
                          "WHERE CTC_AE_Toxicity_TermID = @AdverseEventId)AND AE_TerminologyID = " +
                              "(SELECT DISTINCT AE_TerminologyID FROM CTC_AE_Toxicity_Terms "+
                              "WHERE CTC_AE_Toxicity_TermID = @AdverseEventId)" +
                          "ORDER BY AE_Grade";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "AdverseEventId", adverseEventId);
            DataSet ds = DataAccessHelper.GetList(cmd);
            return ds;
        }


        public DataTable DoToxAdverseEventSearch(int terminologyId, string searchTerm)
        {
            string sql =
            @"
            SELECT DISTINCT
	            terms.CTC_AE_Toxicity_Description AS ToxDesc,
                terms.CTC_AE_Toxicity_TermID,
	            categories.AE_CategoryID
            FROM CTC_AE_Toxicity_Terms terms
            INNER JOIN CTC_AE_Category categories
	            ON terms.AE_CategoryID = categories.AE_CategoryID
            WHERE 
	            categories.AE_TerminologyID = @TerminologyId
	            AND
	            terms.CTC_AE_Toxicity_Description LIKE @Search
            ORDER BY
	            categories.AE_CategoryID ASC
            ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "TerminologyId", terminologyId);
            DataAccessHelper.AddStringInputParam(cmd, "Search", "%" + searchTerm + "%");
            DataSet ds = DataAccessHelper.GetList(cmd);
            return ds.Tables[0];
        }

        public DataTable GetCTCLookup(int terminologyId)
        {
            string sql =
                @"
                SELECT
	                grades.AE_Grade,
	                grades.AE_Grade_Description,
	                terms.CTC_AE_Toxicity_ShortDesc,
	                terms.AE_Category_Description
                FROM CTC_AE_Toxicity_Grades grades
                INNER JOIN CTC_AE_Toxicity_Terms terms
	                ON terms.MedDRA_Code = grades.MedDRA_Code
	                AND terms.AE_TerminologyID = grades.AE_TerminologyID
                WHERE
	                grades.AE_TerminologyID = @TerminologyId
	                --AND terms.CTC_AE_Toxicity_ShortDesc LIKE '%Fatigue%'
	                --AND terms.AE_Category_Description = 'CONSTITUTIONAL SYMPTOMS'
                ORDER BY grades.AE_Grade
            ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "TerminologyId", terminologyId);
            DataSet ds = DataAccessHelper.GetList(cmd);
            return ds.Tables[0];
        }

        public int? GetLatestVersion()
        {
            DataView versions = GetCTCAETerminlogyVersions().Tables[0].DefaultView;
            versions.Sort = "AE_TerminologyID DESC";
            if (versions.Count > 0)
                return (int)versions[0]["AE_TerminologyID"];
            else
                return null;
        }

        public DataTable GetLatestAdverseEvents()
        {
            int? terminologyId = GetLatestVersion() ?? int.MinValue; // TODO
            return DoToxAdverseEventSearch(terminologyId.Value, string.Empty);
        }

        public DataTable GetLatestCategories()
        {
            int? terminologyId = GetLatestVersion() ?? int.MinValue; // TODO
            return GetToxCategories(terminologyId.Value).Tables[0];
        }
      

        # region UVA data access calls for reference
        /*
        public DataSet GetToxicities_UVACC(int patientID, int protocolID)
        {
            string sql = "SELECT DISTINCT AE_Patient_ToxicityId as ToxID, Serious_AE as SAE, Cycle, DayWeek as 'Day/Wk#', " +
                "MonDateText as 'Date Reported', ToxStartDateText as 'AE Start Date', ToxCategory as 'Toxicity Group', ToxGrade, " +
               "case when (ToxNotes is not null) then 'Y' else 'N' end as Notes, " +
               "case when (Stopping_Rule_Toxicity = 1) then 'Y' else 'N' end as SRT, " +
               "case when (Event_Reported_To_IRB = 1) then 'Y' else 'N' end as 'IRB Sub', " +
               "EnteredTime " +
               "FROM CTC_AE_Patient_Toxicities " +
               "WHERE PatientId = " + patientID.ToString();

            if (protocolID > 0)
            {
                sql += " And ProtocolID = " + protocolID.ToString();
            }

            sql += " ORDER BY EnteredTime Desc";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);

            DataSet ds = DataAccessHelper.GetRecord(cmd);

            ds.Tables[0].Columns.Remove("EnteredTime");

            return ds;
        }

        public DataSet GetToxicities_UVACC()
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetCTCAdverseEventTerms_UVACC");
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataSet GetToxicities4Popup_UVACC(int AE_categoryId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetCTCAdverseEventTerms_UVACC");
            DataAccessHelper.AddIntInputParam(com, "AE_CategoryId", AE_categoryId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataSet GetToxicityGrades4Popup_UVACC(int CTC_AE_Toxicity_TermId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetCTCAdverseEventGrades_UVACC");
            DataAccessHelper.AddIntInputParam(com, "CTC_AE_Toxicity_TermId", CTC_AE_Toxicity_TermId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataSet GetToxCategories_UVACC()
        {


            SqlCommand com = DataAccessHelper.CreateCommand("spGetCTCAdverseEventCategories_UVACC");
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }
         
        public DataSet GetToxCategories_CTC3_UVACC()
        {
            int AE_TerminologyID = 3;
            SqlCommand com = DataAccessHelper.CreateCommand("spGetCTCAdverseEventCategories_UVACC");
            DataAccessHelper.AddIntInputParam(com, "AE_TerminologyID", AE_TerminologyID);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }
        public DataSet GetToxCategories_CTC4_UVACC()
        {
            int AE_TerminologyID = 4;
            SqlCommand com = DataAccessHelper.CreateCommand("spGetCTCAdverseEventCategories_UVACC");
            DataAccessHelper.AddIntInputParam(com, "AE_TerminologyID", AE_TerminologyID);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }
        */
        # endregion 
    }
}
