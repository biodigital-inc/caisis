
using System.Collections.Generic;
using System.Text;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Caisis.DataAccess
{
    // TODO: parameterize all SQL statement and cleanup
    public class FollowUpDA : BaseDA
    {
        public FollowUpDA()
        {
            // TODO: Add constructor logic here
        }

        #region methods for Surveys/Letters Batch Print

        // Get Patients in Need of Follow up based on PtContactStatus
        public DataTable GetActivePatientsForQOLFollowUp(string processDate, string ProcedureType, string ptContactType)
        {
            string sql = "SELECT a.PatientId, a.PtLastName, a.PtFirstName, a.PtMRN, b.ProcDateText, b.ProcDate, b.ProcName, b.ProcSurgeon ";
            sql += "FROM  Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId ";
            sql += "WHERE a.PtDeathDate IS NULL AND a.PtDeathType IS NULL "; // verifies the patient is not dead
            // if contact type is specified use it, otherwise return anyone with QOL Active
            if (!String.IsNullOrEmpty(ptContactType))
            {
                sql += "AND a.PtContactStatus = '" + ptContactType + "' ";
            }
            // if no procedure specified return all patients
            if (!String.IsNullOrEmpty(ProcedureType))
            {
                sql += "AND ProcName = '" + ProcedureType + "' ";
            }
            sql += "AND (" + processDate + " <= DATEADD(month, 63, ProcDate) ) ORDER BY ProcDate";

  
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

/* NO LONGER USED - 02/11/10
               /// <summary>
               /// Get list of (living) patients (with latest Status of QOL Active) that have surveys due 
               /// </summary>
               /// <param name="processDate"></param>
               /// <param name="ProcedureType"></param>
               /// <returns></returns>
               public DataTable GetPatientsForFollowUp(string processDate, string ProcedureType, string surveyShortType)
               {
                   string sql = "SELECT a.PatientId, a.PtLastName, a.PtFirstName, a.PtMRN, b.ProcDateText, b.ProcDate, b.ProcName, b.ProcSurgeon ";
                   sql += "FROM  Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId ";
            
                   // 2. check Status table for Status = "QOL Active" AND Status != "QOL Inactive"
                   sql += "INNER JOIN ";
                   sql += "(SELECT s.PatientId, s.StatusDate, [Status] AS QOLStatus   ";  
                   sql += "FROM [Status] s ";  
                   sql += "INNER JOIN (SELECT PatientId, MAX(StatusDate) LastStatusDate ";
                   sql += "FROM [Status] "; 
                   sql += "GROUP BY PatientId) s2 ";
                   sql += "ON s.PatientId = s2.PatientId ";
                   sql += "WHERE s.StatusDate = s2.LastStatusDate AND [Status] = 'QOL Active') LastStatus ON a.PatientId = LastStatus.PatientId ";

                   if (!ProcedureType.Equals(String.Empty))
                   {
                       sql += "WHERE ProcName = '" + ProcedureType + "' ";
                       sql += "AND a.PtDeathDate IS NULL AND a.PtDeathType IS NULL "; // verifies the patient is not dead
                   }
                   else
                   {
                       sql += "WHERE a.PtDeathDate IS NULL AND a.PtDeathType IS NULL "; // verifies the patient is not dead
                   }

                   //NOTE KY: any due PreOp patients will be included with the 63 months rule anyways
                   //sql += "AND (" + processDate + " <= DATEADD(month, -1, DATEADD(day,-14,ProcDate)) "; 
                   //sql += "OR  " + processDate + " <= DATEADD(month, 63, ProcDate) ) ORDER BY ProcDate";
                   sql += "AND (" + processDate + " <= DATEADD(month, 63, ProcDate) ) ORDER BY ProcDate";

                   // replace first GETDATE with processDATE
                   DataTable dt = new DataTable();
                   DataAccessHelper.ExecuteSqlSelect(sql, dt);
                   return dt;
               }
       */

        /// <summary>
        /// Checks the Actions table to see if there is a record indicating if the survey for the patient was already sent.
        ///  ActionItem is of form "NAME x Month Sent", where x is month number and NAME is EPIC or QOL
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="actionItem"></param>
        /// <returns></returns>
        public bool SurveyAlreadySent(int patientId, string actionItem)
        {
            string sql = "Select *";
            sql += "FROM  Actions ";
            sql += "WHERE PatientId = " + patientId + " ";
            sql += "AND ActionItem = '" + actionItem + "' ";

            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            if (dt.Rows.Count > 0)
                return true;
            else
                return false;
        }


        /// <summary>
        /// Get the information for the last survey sent for this patient.
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public DataTable GetLastSurveySent(int patientId)
        {
            // action Item for survey sent is of format "inst NAME [% Month] Survey Sent" 
            // where NAME is the survey name, for example "EPIC" 
            string actionItemExpr = "% Survey % Month Sent%";

            string sql = "Select TOP 1 * ";
            sql += "FROM  Actions ";
            sql += "WHERE PatientId = " + patientId + " ";
            sql += "AND ActionItem LIKE '" + actionItemExpr + "' ";
            sql += "ORDER BY ActionDate DESC ";

            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

/* NO LONGER USED, REPLACED ABOVE - 02/11/10
               /// <summary>
               /// Get the information for the last survey sent belonging to inst ("EVU" for Virginia) for this patient.
               /// </summary>
               /// <param name="patientId"></param>
               /// <param name="inst">The institution, for example, "EVU" for Virginia</param>
               /// <returns></returns>
               public DataTable GetLastSurveySent(int patientId, string inst)
               {
                   // action Item for survey sent is of format "inst NAME [% Month] Survey Sent" 
                   // where NAME is the survey name, for example "EPIC" or "QOL" for inst == Virginia
                   string actionItemExpr = inst + " % Survey Sent"; 

                   string sql = "Select TOP 1 * ";
                   sql += "FROM  Actions ";
                   sql += "WHERE PatientId = " + patientId + " ";
                   sql += "AND ActionItem LIKE '" + actionItemExpr + "' ";
                   sql += "ORDER BY ActionDate DESC ";

                   DataTable dt = new DataTable();
                   DataAccessHelper.ExecuteSqlSelect(sql, dt);
            
                   return dt;
               }
 */

        /// <summary>
        /// Get the information for the last survey sent that matches the specified ActionItem for this patient.
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="actionItem">ActionItem is of form "NAME x Month Sent", where x is month number and NAME is EPIC or QOL</param>
        /// <returns></returns>
        public DataTable GetThisLastSurveySent(int patientId, string actionItem)
        {
            string sql = "Select TOP 1 * ";
            sql += "FROM  Actions ";
            sql += "WHERE PatientId = " + patientId + " ";
            sql += "AND ActionItem = '" + actionItem + "' ";
            sql += "ORDER BY ActionDate DESC ";

            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

        // NOTE: there is a problem with this query when actionItems have the same actionDate
        /// <summary>
        /// Gets list of patients with the latest survey sent information 
        /// Uses ActionItem LIKE 'surveyShortType % Month Sent' 
        /// </summary>
        /// <param name="procedureType"></param>
        /// <param name="surveyShortType">Is either "QOL" or "EPIC"</param>
        /// <returns></returns>
        public DataTable GetPatientsLastSurveySentList(string procedureType, string surveyShortType)
        {
            string sql = "SELECT a.PatientId, a.PtLastName, a.PtFirstName, a.PtMRN, b.ProcDateText, b.ProcDate, b.ProcName, b.ProcSurgeon, LastSurveySent.ActionDate, LastSurveySent.ActionItem "; 
            sql += "FROM Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId ";

            // get latest survey sent information
            sql += "INNER JOIN (SELECT ac.PatientId, ac.ActionDate, ac.ActionItem ";
            sql += "FROM Actions ac INNER JOIN ";
            sql += "(SELECT PatientId, MAX(ActionDate) LastSurveySentDate FROM Actions GROUP BY PatientId) ac2 ON ac.PatientId = ac2.PatientId ";
            sql += "WHERE ac.ActionDate = ac2.LastSurveySentDate AND ActionItem LIKE '" + surveyShortType + " % Month Sent') LastSurveySent ON a.PatientId = LastSurveySent.PatientId ";
            
            // check procedure and that patient is not dead
            sql += "WHERE ProcName = '" + procedureType + "' AND a.PtDeathDate IS NULL AND a.PtDeathType IS NULL ";

            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }


 /* NO LONGER USED - 02/11/10
        /// <summary>
        /// Checks the Surveys table to see if there is a record indicating that the survey was received/completed
        /// SurveyType is of form "EVU NAME x Month", where x is month number and NAME is EPIC or QOL
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="surveyType"></param>
        /// <returns></returns>
        public bool SurveyWasReceived(int patientId, string surveyType)
        {
            string sql = "Select SurveyId ";
            sql += "FROM  Surveys ";
            sql += "WHERE PatientId = " + patientId + " ";
            sql += "AND SurveyType = '" + surveyType + "' ";

            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            if (dt.Rows.Count > 0)
                return true;
            else
                return false;
        }
*/

/* NO LONGER USED - 02/11/10
               /// <summary>
               /// Checks the Surveys table and gets the record indicating that the survey was received/completed (if it exists) 
               /// SurveyType is of form "EVU NAME x month", where x is month number and NAME is EPIC or QOL
               /// </summary>
               /// <param name="patientId"></param>
               /// <param name="actionItem"></param>
               /// <returns></returns>
               public DataTable GetSurveyReceived(int patientId, string surveyType)
               {
                   string sql = "Select * ";
                   sql += "FROM  Surveys ";
                   sql += "WHERE PatientId = " + patientId + " ";
                   sql += "AND SurveyType LIKE '" + surveyType + "'";

                   DataTable dt = new DataTable();
                   DataAccessHelper.ExecuteSqlSelect(sql, dt);

                   return dt;
               }
*/

        /// <summary>
        /// Takes an expression and patientId.  Returns a wildcard match from the ActionItem field in the Actions table
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="expression"></param>
        /// <returns></returns>
        public DataTable GetSurveyActionItem(int patientId, string expression)
        {
            string sql = "Select * ";
            sql += "FROM  ACTIONS ";
            sql += "WHERE PatientId = " + patientId + " ";
            sql += "AND ActionItem LIKE '" + expression + "'";
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }
         
        /// <summary>
        /// Checks the Actions table to see if there is a record indicating if the follow up letter for the patient was already sent.
        ///  ActionItem is of form "NAME x Month Letter Sent", where x is month number and NAME is EPIC or QOL
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="actionItem"></param>
        /// <returns></returns>
        public bool LetterAlreadySent(int patientId, string actionItem)
        {
            string sql = "Select *";
            sql += "FROM  Actions ";
            sql += "WHERE PatientId = " + patientId + " ";
            sql += "AND ActionItem = '" + actionItem + "' ";

            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            if (dt.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// Returns name of most recent (based on entered time in PatientPhysicians table) physician in treating role.
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public string GetMostRecentTreatingPhysician(int patientId)
        {
            string treatingDocName = "";

            string sql = "SELECT TOP 1 p.PhFirstName, p.PhMiddleName, p.PhLastName, p.PhLevel ";
            sql += "FROM  PatientPhysicians pp INNER JOIN Physicians p ON pp.PhysicianId = p.PhysicianId  ";
            sql += "WHERE PatientId = "  +  patientId   + " AND pp.PtPhRole = 'Treating' ";
            sql += "ORDER BY pp.EnteredTime DESC;";

            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            if (dt.Rows.Count > 0)
            {
                treatingDocName = dt.Rows[0]["PhFirstName"].ToString() + " " + dt.Rows[0]["PhMiddleName"].ToString() + "  " + dt.Rows[0]["PhLastName"].ToString();
            }

            return treatingDocName;
        }
        #endregion methods for Surveys/Letters Batch Print


        #region Enter Survey Data Section

/* NO LONGER USED - 02/17/10        
        /// <summary>
        /// Get the data the patient had RP procedure
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public DataTable GetProcedureDate(int pId, string procedureType)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT *" +
                         " FROM Procedures" +
                         " WHERE PatientId = " + pId + " " +
                         " AND ProcName = '" + procedureType + "'";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }
*/

        /// <summary>
        /// Get the latest procedure and procedure date for a patient based upon specified Follow up procedures
        /// </summary>
        /// <param name="pId"></param>
        /// <param name="followupProcList"></param>
        /// <returns></returns>
        public DataTable GetPatientProcedureInfo(int pId, string followupProcList)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT TOP 1 ProcName, ProcDate " +
                         " FROM Procedures " +
                         " WHERE PatientId = " + pId + " " +
                         " AND ProcName IN (" + followupProcList  + ")  " +
                         " ORDER BY ProcDate DESC ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        /// <summary>
        /// Get all Actions recording QOL EPIC or RAND Surveys 
        /// Actions can be surveys Sent: "RAND%Month Sent"
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public DataTable GetPatientSentSurveysList(int pId)
        {
            DataTable dt = new DataTable();

            // TODO: this should be made more general to handle any surveys
            string sql = "SELECT *" +
                         " FROM Actions" +
                         " WHERE PatientId = " + pId + " " +
                         " AND (ActionItem LIKE 'RAND%Month Sent' OR ActionItem LIKE 'EPIC%Month Sent')";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

/* NO LONGER USED - 02/11/10
 * 
       /// <summary>
       /// Get latest Action recording EVU QOL or EVU EPIC Surveys sent for this patient
       /// Actions can be surveys Sent: "EVU % month Survey Sent"
       /// </summary>
       /// <param name="pId"></param>
       /// <returns></returns>
       public DataTable GetPatientLastSurveySent(int pId)
       {
           DataTable dt = new DataTable();

           string sql = "SELECT TOP 1 * " +
                        " FROM Actions" +
                        " WHERE PatientId = " + pId + " " +
                        " AND ActionItem LIKE 'EVU % Month Survey Sent' " +
                        " ORDER BY ActionDate DESC ";

           DataAccessHelper.ExecuteSqlSelect(sql, dt);
           return dt;
       }
*/
 
       #endregion Enter Survey Data Section



       #region Reports
       /// <summary>
       /// Get a list of surveys or letters (given by actionItemExpr) sent with patient, proc surgeon, sent date 
       /// </summary>
       /// <param name="procedureType"></param>
       /// <param name="sentStartDate"></param>
       /// <param name="sentEndDate"></param>
       /// <param name="actionItemExpr">Expression to match in ActionItem column in Actions table</param>
       /// <returns></returns>
       public DataTable GetFollowUpReportList(string procedureType, string sentStartDate, string sentEndDate, string actionItemExpr)
       {
           string command = @"SELECT a.PatientId, a.PtLastName, a.PtMiddleName, a.PtFirstName, a.PtMRN, b.ProcDate, b.ProcName, b.ProcSurgeon, ";
           command += "SelActions.ActionDate, SelActions.ActionItem, SelActions.ActionId ";
           command += "FROM  Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId INNER JOIN ";
           command += "(SELECT ac.PatientId, ac.ActionId, ac.ActionDate, ac.ActionItem FROM Actions ac WHERE ac.ActionItem LIKE '" + actionItemExpr + "') SelActions ON  SelActions.PatientId = a.PatientId WHERE ProcName = '" + procedureType + "' ";
           command += "AND SelActions.ActionDate  >= '" + sentStartDate + "' AND SelActions.ActionDate <= '" + sentEndDate + "' ORDER BY SelActions.ActionDate DESC"; 
            
           // replace first GETDATE with processDATE
           DataTable dt = new DataTable();
           DataAccessHelper.ExecuteSqlSelect(command, dt);
           return dt;
       }


/* NO LONGER USED - 02/11/10 
         
          public DataTable GetFollowUpReportList(string procedureType, string sentStartDate, string sentEndDate, string actionItemExpr)
         {
             string sql = "SELECT a.PatientId, a.PtLastName, a.PtMiddleName, a.PtFirstName, a.PtMRN, b.ProcDate, b.ProcName, b.ProcSurgeon, SelActions.ActionDate, SelActions.ActionItem ";
             sql += "FROM  Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId ";

             // 2. check Status table for Status = "QOL Active" AND Status != "QOL Inactive"
             sql += "INNER JOIN ";
             sql += "(SELECT s.PatientId, s.StatusDate, [Status] AS QOLStatus   ";
             sql += "FROM [Status] s ";
             sql += "INNER JOIN (SELECT PatientId, MAX(StatusDate) LastStatusDate ";
             sql += "FROM [Status] ";
             sql += "GROUP BY PatientId) s2 ";
             sql += "ON s.PatientId = s2.PatientId ";
             sql += "WHERE s.StatusDate = s2.LastStatusDate AND [Status] = 'QOL Active') LastStatus ON a.PatientId = LastStatus.PatientId ";
        
             sql += "INNER JOIN ";
             sql += "(SELECT ac.PatientId, ac.ActionDate, ac.ActionItem ";
             sql += "FROM Actions ac "; 
             sql += "WHERE ac.ActionItem LIKE '" + actionItemExpr + "') SelActions ON  SelActions.PatientId = a.PatientId ";

             sql += "WHERE ProcName = '" + procedureType + "' ";
             sql += "AND a.PtDeathDate IS NULL AND a.PtDeathType IS NULL "; // verifies the patient is not dead

             sql += "AND SelActions.ActionDate  >= '" + sentStartDate + "' AND SelActions.ActionDate <= '" + sentEndDate + "' ORDER BY SelActions.ActionDate DESC ";

             // replace first GETDATE with processDATE
             DataTable dt = new DataTable();
             DataAccessHelper.ExecuteSqlSelect(sql, dt);
             return dt;
         }
 */

        /// <summary>
        /// Get a list of patients and their completed surveys
        /// </summary>
        /// <param name="procedureType"></param>
        /// <param name="receivedStartDate"></param>
        /// <param name="receivedEndDate"></param>
        /// <param name="surveyType">
        /// <returns></returns>
       public DataTable GetCompletedSurveysByType(string receivedStartDate, string receivedEndDate, string surveyType)
        {
            string sql = "SELECT p.PatientId, p.PtLastName, p.PtMiddleName, p.PtFirstName, p.PtMRN, sarr.SurveyId, sarr.SurveyType, sarr.SurveyDate, sarr.ActionDate, sarr.ActionItem ";
            sql += "FROM  Patients p ";
            sql += "INNER JOIN ( ";
            sql += "SELECT s.PatientId, s.SurveyId, s.SurveyType, s.SurveyDate, arr.ActionDate, arr.ActionItem ";
            sql += "FROM Surveys s ";
            sql += "INNER JOIN ( ";
            sql += "SELECT rr.DestPrimaryKey, a.ActionId, a.ActionDate, a.ActionItem From RelatedRecords rr   ";
            sql += "INNER JOIN (SELECT * From Actions) a ON rr.SrcPrimaryKey = a.ActionId ";
            sql += "WHERE rr.SrcTableName = 'Actions' AND rr.DestTableName = 'Surveys' ";
            sql += ") arr ON arr.DestPrimaryKey = s.SurveyId ";
            sql += "WHERE s.SurveyType LIKE @SurveyType AND s.SurveyDate  >= @ReceivedStartDate AND s.SurveyDate <= @ReceivedEndDate ";
            sql += ") sarr ON sarr.PatientId = p.PatientId ";
            sql += "ORDER BY sarr.SurveyDate DESC ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "SurveyType", surveyType);
            DataAccessHelper.AddStringInputParam(com, "ReceivedStartDate", receivedStartDate);
            DataAccessHelper.AddStringInputParam(com, "ReceivedEndDate", receivedEndDate);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }


        /// <summary>
        /// Get the data the latest status of patient: "QOL Active" or "QOL Inactive"
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public string GetPatientContactStatus(int pId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT PtContactStatus " +
                         " FROM Patients " +
                         " WHERE PatientId = " + pId;        

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt.Rows[0][0].ToString();
        }
        #endregion 

        /// <summary>
        /// Get all survey types from MetadataSurvey table with the specified category.
        /// </summary>
        /// <param name="category">value to match in SurveyCategory field.</param>
        /// <returns></returns>
        public DataTable GetMetadataSurveysByCategory(string category)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT SurveyType " +
                         " FROM MetadataSurveys " +
                         " WHERE SurveyCategory = '" + category + "' ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        // this has to be rewritten using joins: actions to related records to surveys (put it in related records and make it generic)
        public DataTable GetSurveyByActionItem(int patientId, string actionItem)
        {
            DataTable dt1 = new DataTable();
            
            string sql1 = "SELECT ActionId From Actions WHERE PatientId = @PatientId AND ActionItem = @ActionItem";
            SqlCommand com1 = DataAccessHelper.CreateSqlCommand(sql1);
            DataAccessHelper.AddIntInputParam(com1, "PatientId", patientId);
            DataAccessHelper.AddStringInputParam(com1, "ActionItem", actionItem);
            DataTable dt2 = DataAccessHelper.GetRecord(com1).Tables[0];

            if (dt2.Rows.Count > 0)
            {
                int actionId = (int)dt2.Rows[0][0];

                string sql2 = "SELECT DestPrimaryKey From RelatedRecords WHERE SrcPrimaryKey = @ActionId AND SrcTableName = 'Actions' AND DestTableName = 'Surveys' ORDER BY DestPrimaryKey DESC";
                SqlCommand com2 = DataAccessHelper.CreateSqlCommand(sql2);
                DataAccessHelper.AddIntInputParam(com2, "ActionId", actionId);
                DataTable dt3 = DataAccessHelper.GetRecord(com2).Tables[0];

                if (dt3.Rows.Count > 0)
                {
                    int surveyId = (int)dt3.Rows[0][0];
                    
                    string sql3 = "SELECT * From Surveys WHERE SurveyId = @SurveyId";
                    SqlCommand com3 = DataAccessHelper.CreateSqlCommand(sql3);
                    DataAccessHelper.AddIntInputParam(com3, "SurveyId", surveyId);
                    dt1 = DataAccessHelper.GetRecord(com3).Tables[0];
                }
            }

            return dt1;
        }

        # region SSDI Follow up calls

        /// <summary>
        /// Get patients who have not had clinical data in last 14 days or SSDI checked
        /// </summary>
        /// <param name="datasetSql"></param>
        /// <returns></returns>
        public DataTable GetPatientByLastRecordDate(string datasetSql)
        {
            // from view code FJ_CurrentDataView

            string dataset = datasetSql;
            string sql = @"
                        SELECT
                        ptSSN.Identifier AS PtSSN, c.*
                        FROM
                        (
                        SELECT DISTINCT a.PatientId AS PatientId
                        FROM 
                        (
                            SELECT ClinStageDate AS SortDate, 'ClinicalStages' AS TableName, PatientId
                            FROM ClinicalStages
                            WHERE ClinStageDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT DxDate, 'Diagnostics', PatientId
                            FROM Diagnostics
                            WHERE DxDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT LabDate, 'LabTests', PatientId
                            FROM LabTests
                            WHERE LabDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT MedTxDate, 'MedicalTherapy', PatientId
                            FROM MedicalTherapy
                            WHERE MedTxDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT ProcDate, 'Procedures', PatientId
                            FROM Procedures
                            WHERE ProcDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT OpDate, 'OperatingRoomDetails', PatientId
                            FROM OperatingRoomDetails
                            WHERE OperatingRoomDetailId > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT PathDate, 'Pathology', PatientId
                            FROM Pathology
                            WHERE PathDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT BrachyDate, 'BrachyTherapy', PatientId
                            FROM BrachyTherapy
                            WHERE BrachyDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT RadTxDate, 'RadiationTherapy', PatientId
                            FROM RadiationTherapy
                            WHERE RadTxDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT StatusDate, 'Status', PatientId
                            FROM Status
                            WHERE StatusDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT PtProtocolStatusDate, 'Protocols', PatientId
                            FROM PatientProtocols INNER JOIN PatientProtocolStatus ON PatientProtocolStatus.PatientProtocolId = PatientProtocols.PatientProtocolId
                            WHERE PtProtocolStatusDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT EncDate, 'Encounters', PatientId
                            FROM Encounters
                            WHERE EncDate > DATEADD(m,-14,GETDATE())
                            UNION
                            SELECT SurveyDate, 'Surveys', PatientId
                            FROM Surveys
                            WHERE SurveyDate > DATEADD(m,-14,GETDATE())
                            --Add in deceased patients classified as having a DeathDateText
                            UNION
                            SELECT PtDeathDate, 'Patients',PatientId
                            FROM Patients
                            WHERE (
                                    PtDeathDateText IS NOT NULL 
                                    AND PtContactStatus != 'DoNotContactPerMD'
                                    AND PTContactStatus != 'DoNotContactPerPt' 
                                    AND PtContactStatus != 'LTF')
                            ) AS a
                        ) AS a
                        INNER JOIN ({0}) p
                        ON p.PatientId = a.PatientId
                        INNER JOIN Patients c 
                        ON c.PatientId = p.PatientId 
                        LEFT OUTER JOIN Identifiers ptSSN
						ON ptSSN.PatientId = c.PatientId
						   AND ptSSN.IdentifierId = 
						   (
							 SELECT  TOP 1 IdentifierId
							 FROM Identifiers
							 WHERE PatientId = c.PatientId
							       AND IdType = 'SSN'								
						   )
                        WHERE a.PatientId NOT IN
                        (
							SELECT PatientId
							FROM Actions
							WHERE ActionItem = 'SSDI_Checked' AND ActionDate >= DATEADD(d, - 60, GETDATE())
						)
                        ORDER BY
                        c.PtDeathDateText, c.PtLastName ASC
                        ";

            string fullSQL = string.Format(sql, dataset);
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(fullSQL, dt);
            return dt;

        }

        /// <summary>
        /// Get patients who have not had Vital Status (SSDI) checked in last 60 days
        /// </summary>
        /// <param name="datasetSql"></param>
        /// <returns></returns>
        public DataTable VitalStatusCheck(string datasetSql)
        {
            // from view code FJ_VitalStatusCheckedView
            
            string dataset = datasetSql;
            string sql = @"
                          SELECT DISTINCT PatientId
                            FROM Actions
                            WHERE ActionItem = 'VitalStatusChecked' AND 
                                  ActionDate >= DATEADD(d, - 60, GETDATE())";
            
            string fullSQL = string.Format(sql, dataset);
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(fullSQL, dt);
            return dt;

        }
      
        /// <summary>
        /// Get the last letter sent action within the last 90 days 
        /// </summary>
        /// <param name="datasetSql"></param>
        /// <returns></returns>
        public DataTable LastLetterSent(string datasetSql)
        {
            // from view code [FJ_LastLetterSentView]
            
            string dataset = datasetSql;
            string sql = @"
                            SELECT Actions.PatientId AS PatientId, ActionItem AS LastLetterSent
                            FROM
                               (
                               SELECT MAX(ActionDate) AS LastLetterDate, PatientId
                               FROM Actions
                               WHERE (ActionItem LIKE 'Letter[1-3]%Sent') AND ActionDate >= DATEADD(d, - 90, GETDATE())
                               GROUP BY PatientId
                               ) AS a INNER JOIN Actions ON a.PatientId = Actions.PatientId AND 
                                                            a.LastLetterDate = Actions.ActionDate
                            WHERE (ActionItem LIKE 'Letter[1-3]%Sent')";
            
            string fullSQL = string.Format(sql, dataset);
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(fullSQL, dt);
            return dt;

        }

        /// <summary>
        /// Get patients who last letter sent is within 90 days
        /// </summary>
        /// <param name="datasetSql"></param>
        /// <returns></returns>
        public DataTable RecentLetterSent(string datasetSql)
        {
            // from view code [FJ_RecentLetterSentView]
            
            string dataset = datasetSql;
            string sql = @"
                            SELECT DISTINCT PatientId
                            FROM Actions
                            WHERE ActionItem LIKE 'Letter[1-3]%Sent' AND 
                                  ActionDate >= DATEADD(d, - 90, GETDATE())";
            
            string fullSQL = string.Format(sql, dataset);
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(fullSQL, dt);
            return dt;
        }
       
        # endregion
    }
}
