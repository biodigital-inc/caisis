using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Caisis.DataAccess
{
    public class ProjectManagementDa : BaseDA
    {
        /// <summary>
        /// A list of searchable Project columns
        /// </summary>
        public static readonly string[] SEARCH_COLUMNS = new string[] { "Description", "Title", "ShortName", "Notes" };
        
        public ProjectManagementDa()
        {
        }

        /// <summary>
        /// Returns a list of all organizations, except those associated with a particular Project.
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public DataTable GetAllProjectOrganizationsExcludingProject(int projectId)
        {
            return GetAllRecordsExcludingByProjectIdHelper("ProjectOrganization", "Project_ProjectOrganization", "OrganizationId", projectId);
        }

        /// <summary>
        /// Returns a list of all organizations associated with a particular Project.
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public DataTable GetProjectOrganizationsByProjectId(int projectId)
        {
            return GetAllRecordsByProjectIdHelper("Project_ProjectOrganization", "ProjectOrganizationId", "ProjectOrganization", "OrganizationId", "ProjectId", projectId, null);
        }

        /// <summary>
        /// Returns a list of all contacts, except those associated with a particular Project.
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public DataTable GetAllProjectContactsExcludingProject(int projectId)
        {
            return GetAllRecordsExcludingByProjectIdHelper("Contact", "Project_Contact", "ContactId", projectId);
        }

        /// <summary>
        /// Returns a list of all contacts associated with a particular Project.
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public DataTable GetProjectContactsByProjectId(int projectId)
        {
            return GetAllRecordsByProjectIdHelper("Project_Contact", "ProjectContactId", "Contact", "ContactId", "ProjectId", projectId, "LastName + ',' + FirstName");
        }

        /// <summary>
        /// Returns a list of all contacts and organizations by projectId
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllContactsWithOrgNameByProjectId(int projectId)
        {
            return GetAllContactsWithOrgNameByProjectIdHelper(projectId);
        }

        /// <summary>
        /// Returns a list of all orgazanizations by projectId
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllOrganizationsByProjectId(int projectId)
        {
            return GetAllOrganizationsByProjectIdHelper(projectId);
        }

        /// <summary>
        /// Returns a sorted list of all orgazanizations by projectId
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllOrganizationsSortedByProjectId(int projectId)
        {
            return GetAllOrganizationsByProjectIdSortedHelper(projectId);
        }

        /// <summary>
        /// Returns a list of all Protocols by projectId
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllProtocolsByProjectId(int projectId)
        {
            return GetAllProtocolsByProjectIdHelper(projectId);
        }

        /// <summary>
        /// Returns a list of all Contact by projectId and orgId
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllContactsByOrgId(int orgId)
        {
            return GetAllContactsByOrgIdHelper(orgId);
        }

        /// <summary>
        /// Returns a list of all Contact by projectId and orgId
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllOrgsByContactId(int contactId)
        {
            return GetAllOrgsByContactIdHelper(contactId);
        }

        /// <summary>
        /// Returns a list of all Contact by protocolId
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllContactsByProtocol(int protocolId)
        {
            return GetAllContactsByProtocolHelper(protocolId);
        }

        /// <summary>
        /// Returns a list of all Orgs unassociated to a contact
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllUnassociatedOrgsByContact(int contactId)
        {
            return GetAllUnassociatedOrgsByContactHelper(contactId);
        }

        /// <summary>
        /// Returns a list of contacts that are currently assigned to the project with their Organization (if applicable).
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public DataTable GetProjectContactsWithOrganizations(int projectId)
        {
            string sql =
            @"
            SELECT
	            c.*,
	            po.OrganizationId,
	            po.Name,
	            po.ShortName,
	            pc.*
            FROM Project_Contact pc
            LEFT OUTER JOIN Contact c
	            ON c.ContactId = pc.ContactId
            LEFT OUTER JOIN ProjectOrganization_ProjectContact popc
	            ON popc.ContactId = pc.ContactId
            LEFT OUTER JOIN ProjectOrganization po
	            ON po.OrganizationId = popc.OrganizationId
            WHERE pc.ProjectId = @ProjectId 
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private string GetAssociatedContactsSQL()
        {
            string sql =
            @"
            SELECT
                c.*,
                po.OrganizationId,
                po.Name,
                po.ShortName,
                pc.*
            FROM Project_Contact pc
            LEFT OUTER JOIN Contact c
                ON c.ContactId = pc.ContactId
            LEFT OUTER JOIN ProjectOrganization_ProjectContact popc
                ON popc.ContactId = pc.ContactId
            LEFT OUTER JOIN ProjectOrganization po
                ON po.OrganizationId = popc.OrganizationId
            WHERE pc.ProjectId = @ProjectId
            ";

            return sql;
        }

        /// <summary>
        /// Returns a list of all Projects
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllProjects()
        {
            return GetAllProjectsHelper();
        }

        /// <summary>
        /// Returns a list of all Projects for an Organization
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllProjectsForOrg(int orgId)
        {
            return GetAllProjectsForOrgHelper(orgId);
        }

        /// <summary>
        /// Gets a list of Projects where a User (specified by UserId) is a Contact.
        /// </summary>
        /// <param name="userId"></param>
        /// <returns>The list of projects for which a User belongs.</returns>
        public DataTable GetAllProjectsByUserId(int userId)
        {
            string sql = "SELECT * FROM Project WHERE ProjectId IN (SELECT Project_Contact.ProjectId FROM Project_Contact INNER JOIN Contact ON Project_Contact.ContactId=Contact.ContactId WHERE Contact.UserId IS NOT NULL AND Contact.UserId = @UserId)";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of Manuscripts by ProjectId
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetManuscriptsByProject(int projectId)
        {
            return GetManuscriptsByProjectHelper(projectId);
        }

        /// <summary>
        /// Returns a list of Manuscripts by ProjectId
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetManuscriptInfo(int manuscriptId)
        {
            return GetManuscriptInfoHelper(manuscriptId);
        }

        /// <summary>
        /// Returns a list of All Contacts
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable GetAllContacts()
        {
            return GetAllContactsHelper();
        }

        public DataTable GetAllUnassignedContacts(int projectId)
        {
            return GetAllUnassignedContactsHelper(projectId);
        }

        /// <summary>
        /// Returns a User by Email
        /// </summary>
        /// <returns>DataTable</returns>
        public int GetUserByEmail(string strEmail)
        {
            return GetUserByEmailHelper(strEmail);
        }

        /// <summary>
        /// Returns a list of all Authors for a particular Manuscript
        /// </summary>
        /// <param name="manuscriptId"></param>
        /// <returns></returns>
        public DataTable GetAuthorsByManuscriptId(int manuscriptId)
        {
            return GetAuthorInfoByManuscriptHelper(manuscriptId);
        }

        /// <summary>
        /// Returns a list of all Editors
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public DataTable GetAllEditorContacts()
        {
            return GetAllEditorContactsHelper();
        }

        /// <summary>
        /// Returns a list of all Organizations Assigned to a project
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="OrgId"></param>
        /// <returns></returns>
        public DataTable GetOrgByProjectAndOrgId(int projectId, int OrgId)
        {
            return GetOrgByProjectAndOrgIdHelper(projectId, OrgId);
        }

        /// <summary>
        /// Returns a list of all Disease State Lookup Codes for LOI
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public DataTable GetAllDiseaseStateCodeLOI()
        {
            return GetAllDiseaseStateCodeHelper("ProjectTrackerDiseaseStateLOI");
        }

        /// <summary>
        /// Returns a list of all Disease State Lookup Codes for Project Approval
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public DataTable GetAllDiseaseStateCodeProjApproval()
        {
            return GetAllDiseaseStateCodeHelper("ProjectTrackerDiseaseStatePA");
        }

        /// <summary>
        /// Returns a list of all LOI Responses
        /// </summary>
        /// <param name="projectLetterOfIntentId"></param>
        /// <returns></returns>
        public DataTable GetLOIResponse(int projectLetterOfIntentId)
        {
            return GetLOIResponseHelper(projectLetterOfIntentId);
        }

        /// <summary>
        /// Returns a list of all Publications by projectId
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public DataTable GetPublicationsByProject(int projectId)
        {
            return GetPublicationsByProjectHelper(projectId);
        }

        /// <summary>
        /// Returns an ID for a new Project
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public string GetIDForProject()
        {
            return GetIDForProjectHelper();
        }

        /// <summary>
        /// Returns an ID for a new LOI
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public string GetIDForLOI()
        {
            return GetIDForLOIHelper();
        }

        /// <summary>
        /// Returns an ID for a new Project
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public void ResetLeadOrg(int projectId)
        {
            ResetLeadOrgHelper(projectId);
        }

        /// <summary>
        /// Sets Lead Organization for a Project
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="OrgId"></param>
        /// <returns></returns>
        public void SetLeadOrg(int projectId, int OrgId)
        {
            SetLeadOrgHelper(projectId, OrgId);
        }

        /// <summary>
        /// Returns Lead Organization for a Project
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public int GetLeadCenterByProjectId(int projectId)
        {
            return GetLeadCenterByProjectIdHelper(projectId);
        }

        /// <summary>
        /// Returns a list of all All Authors by publicationId
        /// </summary>
        /// <param name="manuscriptId"></param>
        /// <returns></returns>
        public DataTable GetAuthorInfoByPublication(int publicationId)
        {
            return GetAuthorInfoByPublicationHelper(publicationId);
        }

        #region Helper Functions (SQL)
        private DataTable GetAllRecordsByProjectIdHelper(string selectTable, string keyField, string joinTable, string joinField, string compareField, int compareValue, string orderByField)
        {
            string compareClause = "=";
            string selectFields = joinTable + ".*," + selectTable + ".*";
            string selectTableJoin = selectTable + "." + joinField;
            string joinTableJoin = joinTable + "." + joinField;
            string sql = "select " + selectFields + " from " + selectTable;
            sql += " INNER JOIN " + joinTable + " ON " + selectTableJoin + " = " + joinTableJoin;
            sql += " WHERE " + selectTable + "." + compareField + " " + compareClause + " @" + compareField;
            if (!String.IsNullOrEmpty(orderByField))
                sql += " ORDER BY " + orderByField;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, compareField, compareValue);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private string GetIDForLOIHelper()
        {
            string sql = "SELECT MAX(CAST(SUBSTRING(LOINumber, 5, LEN(LOINumber) - 4) AS Int) ) AS IDNum, LOINumber ";
            sql += "FROM ProjectLetterOfIntent ";
            sql += "GROUP BY LOINumber ";
            sql += "HAVING (LOINumber IS NOT NULL AND LOINumber <> '')";
            sql += "ORDER BY IDNum DESC ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];

            string strProjNum = "0";
            string currYear = DateTime.Today.Year.ToString();
            currYear = "c" + currYear.Substring(2) + "-";

            if (dt.Rows.Count > 0)
            {
                strProjNum = dt.Rows[0]["LOINumber"].ToString();
                if (strProjNum.IndexOf('-') >= 0)
                    strProjNum = strProjNum.Substring(strProjNum.IndexOf('-') + 1);
            }

            int nProjNum = 0;
            Int32.TryParse(strProjNum, out nProjNum);

            string strConvertedNumber = String.Format("{0:000}", (nProjNum + 1));

            return (currYear + strConvertedNumber);
        }

        private string GetIDForProjectHelper()
        {
            // auto-increment ProjectNum
            string sql =
            @"
                SELECT ISNULL(MAX(CAST(ProjectNum AS int)),0) + 1
                FROM Project
                WHERE ISNUMERIC(ProjectNum) = 1
            ";
            //string sql = "SELECT ProjectNum, ProjectId ";
            //sql += "FROM Project ";
            //sql += "GROUP BY ProjectNum, ProjectId ";
            //sql += "HAVING (ProjectNum IS NOT NULL AND ProjectNum <> '')";
            //sql += "ORDER BY ProjectId DESC ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];

            //string strProjNum = "0";

            //if (dt.Rows.Count > 0)
            //{
            //    strProjNum = dt.Rows[0]["ProjectNum"].ToString();
            //}

            int nProjNum = (int)dt.Rows[0][0];

            //Int32.TryParse(strProjNum, out nProjNum);

            //nProjNum++;

            return (nProjNum.ToString());
        }

        private void ResetLeadOrgHelper(int projectId)
        {
            if (projectId == -1)
                return;

            string sql = "UPDATE Project_ProjectOrganization ";
            sql += "SET OrganizationType=0 ";
            sql += "WHERE (ProjectId = @ProjectId) ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataAccessHelper.ExecuteScalar(com);

            return;
        }

        private int GetLeadCenterByProjectIdHelper(int projectId)
        {
            if (projectId == -1)
                return -1;

            string sql = "SELECT OrganizationId ";
            sql += "FROM Project_ProjectOrganization ";
            sql += "WHERE (ProjectId = @ProjectId AND OrganizationType=1) ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];

            if (dt.Rows.Count > 0
                && !String.IsNullOrEmpty(dt.Rows[0]["OrganizationId"].ToString()))
            {
                return Int32.Parse(dt.Rows[0]["OrganizationId"].ToString());
            }

            return -1;
        }

        private void SetLeadOrgHelper(int projectId, int OrgId)
        {
            if (projectId == -1 || OrgId == -1)
                return;

            string sql = "UPDATE Project_ProjectOrganization ";
            sql += "SET OrganizationType=1 ";
            sql += "WHERE (ProjectId = @ProjectId) AND (OrganizationId = @OrganizationId) ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataAccessHelper.AddIntInputParam(com, "OrganizationId", OrgId);
            DataAccessHelper.ExecuteScalar(com);

            return;
        }

        private DataTable GetAllRecordsExcludingByProjectIdHelper(string selectTable, string joinTable, string keyField, int projectId)
        {
            string sql = "SELECT * FROM " + selectTable + " ";
            sql += "WHERE " + keyField + " NOT IN ";
            sql += "( SELECT " + joinTable + "." + keyField + " ";
            sql += "FROM " + selectTable + " INNER JOIN  " + joinTable + " ON ";
            sql += selectTable + "." + keyField + "=" + joinTable + "." + keyField + " ";
            sql += "WHERE ProjectId=@ProjectId)";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetOrgByProjectAndOrgIdHelper(int projectId, int OrgId)
        {
            string sql = "SELECT Project_ProjectOrganization.* ";
            sql += "FROM Project_ProjectOrganization ";
            sql += "WHERE (ProjectId = @ProjectId) AND (OrganizationId = @OrganizationId) ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataAccessHelper.AddIntInputParam(com, "OrganizationId", OrgId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllContactsWithOrgNameByProjectIdHelper(int projectId)
        {
            string sql = "SELECT ProjectOrganization.OrganizationId, ProjectOrganization.Name AS Organization, ";
            sql += "Contact.LastName + ', ' + Contact.FirstName AS Name, Contact.ContactId ";
            sql += "FROM ProjectOrganization_ProjectContact INNER JOIN ";
            sql += "ProjectOrganization ON ProjectOrganization_ProjectContact.OrganizationId = ProjectOrganization.OrganizationId ";
            sql += "RIGHT OUTER JOIN Contact ";



            if (projectId != -1)
            {
                sql += "INNER JOIN Project INNER JOIN ";
                sql += "Project_Contact ON Project.ProjectId = Project_Contact.ProjectId ON Contact.ContactId = Project_Contact.ContactId ";
            }

            sql += "ON ProjectOrganization_ProjectContact.ContactId = Contact.ContactId ";

            if (projectId != -1)
                sql += "WHERE (Project.ProjectId = @ProjectId) AND Contact.ContactType = 'Project' ";
            sql += "GROUP BY ProjectOrganization.OrganizationId, ProjectOrganization.Name, Contact.LastName + ', ' + Contact.FirstName, ";
            sql += "Contact.ContactId ";
            sql += "ORDER BY Name, Contact.ContactId ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            if (projectId != -1)
                DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllDiseaseStateCodeHelper(string LkpFieldName)
        {
            string sql = "SELECT LkpFieldName, LkpCode, LkpDescription, LkpOrder ";
            sql += "FROM LookupCodes WHERE (LkpFieldName = '" + LkpFieldName;
            sql += "')ORDER BY LkpOrder";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllContactsByOrgIdHelper(int orgId)
        {
            string sql = "SELECT ProjectOrganization.OrganizationId, ProjectOrganization.Name AS Organization, ";
            sql += "Contact.LastName, Contact.FirstName,";
            sql += "Contact.LastName + ', ' + Contact.FirstName AS Name, ";
            sql += "Contact.ContactId ";
            sql += "FROM ProjectOrganization INNER JOIN ";
            sql += "Contact INNER JOIN ";
            sql += "ProjectOrganization_ProjectContact ON Contact.ContactId = ProjectOrganization_ProjectContact.ContactId ON ";
            sql += "ProjectOrganization.OrganizationId = ProjectOrganization_ProjectContact.OrganizationId ";
            sql += "WHERE Contact.ContactType = 'Project' GROUP BY ProjectOrganization.OrganizationId, ProjectOrganization.Name, Contact.LastName, Contact.FirstName, ";
            sql += "Contact.ContactId HAVING (ProjectOrganization.OrganizationId = @OrgId) ";
            sql += "ORDER BY Contact.LastName, Contact.FirstName, Contact.ContactId ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "OrgId", orgId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllOrganizationsByProjectIdSortedHelper(int projectId)
        {
            string sql = "SELECT proj_orgs.ProjectId, proj_orgs.OrganizationId, proj_orgs.OrganizationType, ProjectOrganization.Name, ";
            sql += "ProjectOrganization.ShortName, ProjectOrganization.ColorCode ";
            sql += "FROM Project_ProjectOrganization AS proj_orgs INNER JOIN ";
            sql += "ProjectOrganization ON proj_orgs.OrganizationId = ProjectOrganization.OrganizationId LEFT OUTER JOIN ";
            sql += "(SELECT LkpCode, LkpOrder FROM LookupCodes ";
            sql += "WHERE (LkpFieldName = 'ProjectOrganizationRole')) AS lkps ON proj_orgs.OrganizationType = lkps.LkpCode ";

            if (projectId != -1)
                sql += "WHERE (proj_orgs.ProjectId = @ProjectId) ";
            sql += "ORDER BY lkps.LkpOrder ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            if (projectId != -1)
                DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllOrganizationsByProjectIdHelper(int projectId)
        {
            string sql = "SELECT ProjectOrganization.OrganizationId, ProjectOrganization.Name,ProjectOrganization.ShortName,ProjectOrganization.ColorCode ";
            sql += "FROM Project INNER JOIN ";
            sql += "Project_ProjectOrganization ON Project.ProjectId = Project_ProjectOrganization.ProjectId RIGHT OUTER JOIN ";
            sql += "ProjectOrganization ON Project_ProjectOrganization.OrganizationId = ProjectOrganization.OrganizationId ";

            if (projectId != -1)
                sql += "WHERE (Project.ProjectId = @ProjectId) ";

            sql += "GROUP BY ProjectOrganization.OrganizationId, ProjectOrganization.Name, ProjectOrganization.ShortName,ProjectOrganization.ColorCode";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            if (projectId != -1)
                DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllProtocolsByProjectIdHelper(int projectId)
        {
            string sql = "SELECT Protocols.ProtocolId, Project.ProjectId, ";
            sql += "Protocols.ProtocolNum + ' ' + Protocols.ProtocolTitle AS Title ";
            sql += "FROM Project INNER JOIN ";
            sql += "Protocols ON Project.ProjectId = Protocols.ProjectId ";

            if (projectId != -1)
                sql += "WHERE (Project.ProjectId = @ProjectId) ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            if (projectId != -1)
                DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllOrgsByContactIdHelper(int contactId)
        {
            string sql = "SELECT ProjectOrganization.Name, ProjectOrganization.OrgNum, ProjectOrganization_ProjectContact.OrganizationId, ";
            sql += "ProjectOrganization_ProjectContact.OrganizationRole, ProjectOrganization_ProjectContact.OrganizationContactId,ProjectOrganization_ProjectContact.ContactId, ProjectOrganization_ProjectContact.ContactType ";
            sql += "FROM ProjectOrganization INNER JOIN ";
            sql += "ProjectOrganization_ProjectContact ON ProjectOrganization.OrganizationId = ";
            sql += "ProjectOrganization_ProjectContact.OrganizationId ";
            sql += "WHERE (ProjectOrganization_ProjectContact.ContactId = @ContactId)";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ContactId", contactId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }
        private DataTable GetAllContactsByProtocolHelper(int protocolId)
        {
            string sql = "SELECT Protocols.ProtocolId, ProjectOrganization.Name AS Organization, ";
            sql += "Contact.LastName + ', ' + Contact.FirstName AS Name, ";
            sql += "Contact.ContactId ";
            sql += "FROM ProjectOrganization INNER JOIN ";
            sql += "Project_ProjectOrganization ON ProjectOrganization.OrganizationId = ";
            sql += "Project_ProjectOrganization.OrganizationId INNER JOIN ";
            sql += "Project INNER JOIN ";
            sql += "Project_Contact ON Project.ProjectId = Project_Contact.ProjectId INNER JOIN ";
            sql += "Contact ON Project_Contact.ContactId = Contact.ContactId ON ";
            sql += "Project_ProjectOrganization.ProjectId = Project.ProjectId INNER JOIN ";
            sql += "ProjectOrganization_ProjectContact ON ProjectOrganization.OrganizationId = ";
            sql += "ProjectOrganization_ProjectContact.OrganizationId AND ";
            sql += "Contact.ContactId = ProjectOrganization_ProjectContact.ContactId INNER JOIN ";
            sql += "Protocols ON Project.ProjectId = Protocols.ProjectId ";
            sql += "WHERE (Protocols.ProtocolId = @ProtocolId AND Contact.ContactType = 'Project') ";
            sql += "ORDER BY Contact.LastName + ', ' + Contact.FirstName, Contact.ContactId ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllUnassociatedOrgsByContactHelper(int contactId)
        {
            string sql = "SELECT OrganizationId, Name ";
            sql += "FROM ProjectOrganization ";
            sql += "WHERE (OrganizationId NOT IN ";
            sql += "(SELECT ProjectOrganization_ProjectContact.OrganizationId ";
            sql += "FROM Contact INNER JOIN ";
            sql += "ProjectOrganization_ProjectContact ON Contact.ContactId = ProjectOrganization_ProjectContact.ContactId ";
            sql += "WHERE (ProjectOrganization_ProjectContact.ContactId = @ContactId))) ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ContactId", contactId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllProjectsHelper()
        {
            string sql = "SELECT Project.ProjectId, Project.Title ";
            sql += "FROM ProjectOrganization INNER JOIN ";
            sql += "Project_ProjectOrganization ON ProjectOrganization.OrganizationId = ";
            sql += "Project_ProjectOrganization.OrganizationId INNER JOIN ";
            sql += "Project ON Project_ProjectOrganization.ProjectId = Project.ProjectId ";
            sql += "GROUP BY Project.ProjectId, Project.Title ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllProjectsForOrgHelper(int orgId)
        {
            string sql = "SELECT Project_ProjectOrganization.OrganizationId, Project.ProjectId, Project.ProjectNum, ";
            sql += "Project.Status, Project.Priority, Project.Description, Project.Title, Project.Notes ";
            sql += "FROM Project_ProjectOrganization INNER JOIN ";
            sql += "ProjectOrganization ON Project_ProjectOrganization.OrganizationId = ";
            sql += "ProjectOrganization.OrganizationId INNER JOIN ";
            sql += "Project ON Project_ProjectOrganization.ProjectId = Project.ProjectId ";
            sql += "WHERE(Project_ProjectOrganization.OrganizationId = @OrganizationId) ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            if (orgId != -1)
                DataAccessHelper.AddIntInputParam(com, "OrganizationId", orgId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        #region Manuscript funcitons
        private DataTable GetManuscriptsByProjectHelper(int projectId)
        {
            string sql = "SELECT ProjectManuscript.ProjectId, ProjectManuscript.Title, Contact.LastName + ', ' + ";
            sql += "Contact.FirstName AS Name, 'Blank' AS Year, ProjectManuscriptAuthor.AuthorOrder, ";
            sql += "ProjectManuscript.ManuscriptId ";
            sql += "FROM Contact INNER JOIN ";
            sql += "ProjectManuscriptAuthor ON Contact.ContactId = ProjectManuscriptAuthor.ContactId RIGHT OUTER JOIN ";
            sql += "ProjectManuscript ON ProjectManuscriptAuthor.ManuscriptId = ProjectManuscript.ManuscriptId ";
            if (projectId != -1)
                sql += "WHERE (ProjectManuscript.ProjectId = @ProjectId) ";
            sql += "GROUP BY ProjectManuscript.ProjectId, ProjectManuscript.Title, Contact.LastName + ', ' + Contact.FirstName, ProjectManuscriptAuthor.AuthorOrder, ProjectManuscript.ManuscriptId ";

            sql += "ORDER BY ProjectManuscript.ManuscriptId, CASE WHEN ProjectManuscriptAuthor.AuthorOrder IS NULL THEN 1 ELSE 0 END, ProjectManuscriptAuthor.AuthorOrder ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            if (projectId != -1)
                DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetManuscriptInfoHelper(int manuscriptId)
        {
            string sql = "SELECT ProjectManuscriptEvent.ManuscriptId, ProjectManuscriptEvent.ManuscriptEventId, ProjectManuscriptEvent.EventName, ";
            sql += "CONVERT(varchar(10), ProjectManuscriptEvent.EventDate, 101) AS EventDate, ProjectManuscriptEvent.ContactId, ProjectManuscriptEvent.EventDate AS SortField, ";
            sql += "ProjectManuscriptEvent.DocumentName, ProjectManuscriptEvent.Notes, Contact.LastName + ', ' + Contact.FirstName AS Name ";
            sql += "FROM ProjectManuscriptEvent INNER JOIN ";
            sql += "Contact ON ProjectManuscriptEvent.ContactId = Contact.ContactId ";

            sql += "WHERE (ProjectManuscriptEvent.ManuscriptId = @ManuscriptId) ";

            sql += "GROUP BY ProjectManuscriptEvent.ManuscriptId, ProjectManuscriptEvent.ManuscriptEventId, ProjectManuscriptEvent.EventName, ProjectManuscriptEvent.EventDate, ProjectManuscriptEvent.ContactId, ";
            sql += "ProjectManuscriptEvent.DocumentName, ProjectManuscriptEvent.Notes, Contact.LastName + ', ' + Contact.FirstName ";
            sql += "ORDER BY ProjectManuscriptEvent.EventDate ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            DataAccessHelper.AddIntInputParam(com, "ManuscriptId", manuscriptId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAuthorInfoByManuscriptHelper(int manuscriptId)
        {
            string sql = "SELECT Contact.ContactId, Contact.LastName + ', ' + Contact.FirstName AS Name, ";
            sql += "ProjectManuscriptAuthor.ManuscriptId, ProjectManuscriptAuthor.PrimaryAuthor, ";
            sql += "ProjectManuscriptAuthor.AuthorId, ProjectManuscriptAuthor.AuthorRole, ProjectManuscriptAuthor.AuthorOrder ";
            sql += "FROM Contact INNER JOIN ProjectManuscriptAuthor ON Contact.ContactId = ProjectManuscriptAuthor.ContactId ";
            sql += "WHERE (ProjectManuscriptAuthor.ManuscriptId = @ManuscriptId) ";

            sql += "ORDER BY ProjectManuscriptAuthor.AuthorOrder ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            DataAccessHelper.AddIntInputParam(com, "ManuscriptId", manuscriptId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }


        private DataTable GetAllContactsHelper()
        {
            string sql = "SELECT ContactId, LastName + ', ' + FirstName AS Name FROM Contact";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllEditorContactsHelper()
        {
            string sql = "SELECT ContactId, LastName + ', ' + FirstName AS Name FROM Contact ";
            sql += "WHERE Title='Editor' ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }
        #endregion

        private DataTable GetPublicationsByProjectHelper(int projectId)
        {
            String sql = "SELECT ProjectPublication.PublicationId, Contact.FirstName + ',' + Contact.LastName AS Name, ";
            sql += "ProjectPublication.PublicationYear, ProjectPublicationAuthor.AuthorOrder, ProjectPublication.PublicationTitle ";
            sql += "FROM Contact INNER JOIN ";
            sql += "ProjectPublicationAuthor ON Contact.ContactId = ProjectPublicationAuthor.ContactId RIGHT OUTER JOIN ";
            sql += "ProjectPublication LEFT OUTER JOIN ";
            sql += "ProjectPublicationCitation ON ProjectPublication.PublicationId = ProjectPublicationCitation.PublicationId ON ";
            sql += "ProjectPublicationAuthor.PublicationId = ProjectPublication.PublicationId ";
            if (projectId != -1)
                sql += "WHERE (ProjectPublication.ProjectId = @ProjectId) ";
            sql += "GROUP BY ProjectPublication.PublicationId, Contact.FirstName + ',' + Contact.LastName, ";
            sql += "ProjectPublication.PublicationYear, ProjectPublicationAuthor.AuthorOrder, ProjectPublication.PublicationTitle ";

            sql += "ORDER BY ProjectPublication.PublicationId, CASE WHEN ProjectPublicationAuthor.AuthorOrder IS NULL THEN 1 ELSE 0 END, ProjectPublicationAuthor.AuthorOrder ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            if (projectId != -1)
                DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;

        }

        private DataTable GetLOIResponseHelper(int projectLetterOfIntentId)
        {
            string sql = "SELECT ProjectLetterOfIntent.ProjectId, ProjectLetterOfIntent.ProjectLetterOfIntentId, Contact.LastName + ',' + Contact.FirstName AS Name, ";
            sql += "ProjectLOIResponse.ProjectLOIResponseId, ProjectLOIResponse.ResponseDate, ProjectLOIResponse.Participation, ";
            sql += "ProjectLOIResponse.Reason, ProjectLOIResponse.Notes, ProjectOrganization.Name AS OrgName ";
            sql += "FROM ProjectLetterOfIntent INNER JOIN ";
            sql += "ProjectLOIResponse ON ProjectLetterOfIntent.ProjectLetterOfIntentId = ProjectLOIResponse.ProjectLetterOfIntentId INNER JOIN ";
            sql += "ProjectOrganization ON ProjectLOIResponse.OrganizationId = ProjectOrganization.OrganizationId LEFT OUTER JOIN ";
            sql += "Contact ON ProjectLOIResponse.ContactId = Contact.ContactId ";
            sql += "GROUP BY ProjectLetterOfIntent.ProjectId, ProjectLetterOfIntent.ProjectLetterOfIntentId, Contact.LastName + ',' + Contact.FirstName, ";
            sql += "ProjectLOIResponse.ProjectLOIResponseId, ProjectLOIResponse.ResponseDate, ProjectLOIResponse.Participation, ";
            sql += "ProjectLOIResponse.Reason, ProjectLOIResponse.Notes, ProjectOrganization.Name ";
            sql += "HAVING (ProjectLetterOfIntent.ProjectLetterOfIntentId = @ProjectLetterOfIntentId) ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            DataAccessHelper.AddIntInputParam(com, "ProjectLetterOfIntentId", projectLetterOfIntentId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAuthorInfoByPublicationHelper(int publicationId)
        {
            string sql = "SELECT Contact.ContactId, Contact.LastName + ', ' + Contact.FirstName AS Name, ";
            sql += "ProjectPublicationAuthor.PublicationId, ProjectPublicationAuthor.AuthorOrder AS SortField, ";
            sql += "ProjectPublicationAuthor.AuthorId, ProjectPublicationAuthor.AuthorRole, ProjectPublicationAuthor.AuthorOrder, ";
            sql += "ProjectPublicationAuthor.EnteredBy, ProjectPublicationAuthor.EnteredTime ";
            sql += "FROM Contact INNER JOIN ProjectPublicationAuthor ON Contact.ContactId = ProjectPublicationAuthor.ContactId ";
            sql += "WHERE (ProjectPublicationAuthor.PublicationId = @PublicationId) ";

            sql += "ORDER BY ProjectPublicationAuthor.AuthorOrder ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            DataAccessHelper.AddIntInputParam(com, "PublicationId", publicationId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private DataTable GetAllUnassignedContactsHelper(int projectId)
        {
            string sql = "SELECT DISTINCT Contact.ContactId, Contact.FirstName, Contact.LastName, Contact.LastName + ', ' + Contact.FirstName AS Name, ProjectOrganization.OrganizationId ,ProjectOrganization.Name AS OrganizationName ";
            sql += "FROM Project_ProjectOrganization INNER JOIN ";
            sql += "Project ON Project_ProjectOrganization.ProjectId = Project.ProjectId INNER JOIN ";
            sql += "ProjectOrganization_ProjectContact INNER JOIN ";
            sql += "ProjectOrganization ON ProjectOrganization_ProjectContact.OrganizationId = ProjectOrganization.OrganizationId ON ";
            sql += "Project_ProjectOrganization.OrganizationId = ProjectOrganization.OrganizationId INNER JOIN ";
            sql += "Contact ON ProjectOrganization_ProjectContact.ContactId = Contact.ContactId ";
            if (projectId != -1)
            {
                sql += "WHERE (Project.ProjectId = @ProjectId)";
                sql += "AND Contact.ContactId NOT IN (";
                sql += GetAllContactsForProject(projectId) + ")";
            }

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private int GetUserByEmailHelper(string strEmail)
        {
            if (string.IsNullOrEmpty(strEmail))
                return -1;

            string sql = "SELECT UserId, UserFirstName, UserLastName, UserEmail FROM Users WHERE (UserEmail = @UserEmail)";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            DataAccessHelper.AddStringInputParam(com, "UserEmail", strEmail);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];

            if (dt.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["UserId"].ToString()))
                    return Int32.Parse(dt.Rows[0]["UserId"].ToString());
            }

            return -1;
        }

        private string GetAllContactsForProject(int projectId)
        {
            string sql = "SELECT Contact.ContactId ";
            sql += "FROM Contact INNER JOIN ";
            sql += "Project_Contact ON Contact.ContactId = Project_Contact.ContactId INNER JOIN ";
            sql += "Project ON Project_Contact.ProjectId = Project.ProjectId ";

            if (projectId != -1)
                sql += "WHERE (Project.ProjectId = " + projectId + ")";

            return sql;
        }

        /// <summary>
        /// Returns a list of Stages belonging to an Organization in a particular Project.
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="organizationId"></param>
        /// <returns></returns>
        public DataTable GetStagesByProjectAndOrganization(int projectId, int organizationId)
        {
            string sql = "SELECT * FROM ProjectStage WHERE ProjectId = @projectId AND OrganizationId = @organizationId";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataAccessHelper.AddIntInputParam(com, "OrganizationId", organizationId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns all events which belong to a Project.
        /// Includes events at the Project level (no org for parent stage) and individual org's events.
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public DataTable GetStageEventsByProject(int projectId)
        {
            string sql = "SELECT ProjectStageEvent.*,ProjectStage.OrganizationId FROM ProjectStageEvent INNER JOIN ProjectStage ON ProjectStageEvent.StageId = ProjectStage.StageId WHERE ProjectStage.ProjectId = @ProjectId";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets a list of Events for a Stage
        /// </summary>
        /// <param name="stageId"></param>
        /// <returns></returns>
        public DataTable GetStageEvents(int stageId)
        {
            string sql =
      @"
SELECT
	a.*,
	ROW_NUMBER() OVER (PARTITION by a.StageId ORDER BY CASE WHEN b.LkpOrder IS NULL THEN 0 ELSE 1 END, b.LkpOrder) AS SortOrder
FROM ProjectStageEvent a
LEFT JOIN LookupCodes b
	ON b.LkpFieldName = 'ProjectStageEvents' AND a.Name = b.LkpCode
WHERE
	a.StageId = @StageId
ORDER BY SortOrder
        ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "StageId", stageId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        #endregion

        #region Associated Organizations And Contacts By Project

        /// <summary>
        /// Adds an association between a Project and a list of Organizations.
        /// </summary>
        /// <param name="projectId">The Project Id</param>
        /// <param name="organizationIds">A List of OrganizationIds to associate with a Project.</param>
        public void AddAssociatedOrganizations(int projectId, int[] organizationIds)
        {
            AddProjectAssociations(projectId, organizationIds, "Project_ProjectOrganization", "OrganizationId");
        }

        /// <summary>
        /// Adds an association between a Project and a list of Contacts.
        /// </summary>
        /// <param name="projectId">The Project Id</param>
        /// <param name="contactIds">A List of ContactIds to associate with a Project</param>
        public void AddAssociatedContacts(int projectId, int[] contactIds)
        {
            AddProjectAssociations(projectId, contactIds, "Project_Contact", "ContactId");

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="projectId">The Project Id</param>
        /// <param name="organizationIds">A List of OrganizationIds which will remove the association with a Project.</param>
        public void RemoveAssociatedOrganizations(int projectId, int[] organizationIds)
        {
            RemoveProjectAssociations(projectId, organizationIds, "Project_ProjectOrganization", "OrganizationId");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="projectId">The Project Id</param>
        /// <param name="contactIds">A List of ContactIds which will remove the association with a Project.</param>
        public void RemoveAssociatedContacts(int projectId, int[] contactIds)
        {
            RemoveProjectAssociations(projectId, contactIds, "Project_Contact", "ContactId");
        }

        private void AddProjectAssociations(int projectId, int[] keys, string tableName, string foreignKeyName)
        {
            string sql = "";
            foreach (int key in keys)
            {
                sql += "INSERT INTO " + tableName + " (ProjectId," + foreignKeyName + ",EnteredBy,EnteredTime) VALUES (@ProjectId," + key + ",@UserName,GETDATE()); ";
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            Security.SecurityController sc = new Security.SecurityController();
            string userName = sc.GetUserName();

            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);
            DataAccessHelper.ExecuteScalar(com);
        }

        private void RemoveProjectAssociations(int projectId, int[] keys, string tableName, string keyName)
        {
            string keysList = string.Join(",", GetKeysAsString(keys));
            string sql = "DELETE from " + tableName + " WHERE ProjectId = @ProjectId and " + keyName + " in (" + keysList + ")";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataAccessHelper.ExecuteScalar(com);
        }

        #endregion

        #region SQL UTILITY HELPERS

        private string[] GetKeysAsString(int[] keyList)
        {
            return Array.ConvertAll<int, string>(keyList, new Converter<int, string>(IntToString));
        }

        private string IntToString(int i)
        {
            return i.ToString();
        }

        #endregion


        #region Stages and Events v6

        public DataTable CompareProjectStages(int projectId, IEnumerable<int> organizationIds)
        {
            string sql =
@"
SELECT
	b.OrganizationName,
	a.StageName AS StageName1,
	a.EventName AS EventName1,
	b.StageName AS StageName2,
	b.EventName AS EventName2,
	a.EventStartDate AS EventStartDate1,
	a.EventEndDate AS EventEndDate1,
	b.EventStartDate AS EventStartDate2,
	b.EventEndDate AS EventEndDate2,
	DATEDIFF(dd, a.EventStartDate, b.EventStartDate) AS StartToStart,
	DATEDIFF(dd, a.EventStartDate, b.EventEndDate) AS StartToEnd,
	DATEDIFF(dd, a.EventEndDate, b.EventStartDate) AS EndToStart,
	DATEDIFF(dd, a.EventEndDate, b.EventEndDate) AS EndToEnd
FROM
(
	SELECT
		c.Title AS ProjectTitle,
		c.ProjectId,
		d.Name AS OrganizationName,
		d.OrganizationId,
		a.Name AS StageName,
		b.Name AS EventName,
		b.EventStartDate,
		b.EventEndDate,
		b.StageId,
		b.StageEventId
	FROM ProjectStage a
	INNER JOIN ProjectStageEvent b
		ON a.StageId = b.StageId
	INNER JOIN Project c
		ON a.ProjectId = c.ProjectId
	INNER JOIN ProjectOrganization d
		ON a.OrganizationId = d.OrganizationId
) a
INNER JOIN
(
	SELECT
		c.Title AS ProjectTitle,
		c.ProjectId,
		d.Name AS OrganizationName,
		d.OrganizationId,
		a.Name AS StageName,
		b.Name AS EventName,
		b.EventStartDate,
		b.EventEndDate,
		b.StageId,
		b.StageEventId
	FROM ProjectStage a
	INNER JOIN ProjectStageEvent b
		ON a.StageId = b.StageId
	INNER JOIN Project c
		ON a.ProjectId = c.ProjectId
	INNER JOIN ProjectOrganization d
		ON a.OrganizationId = d.OrganizationId
) b
ON
	a.ProjectId = b.ProjectId AND a.OrganizationId = b.OrganizationId
WHERE
	a.ProjectID = @ProjectId
	AND a.EventStartDate IS NOT NULL
	AND b.EventEndDate IS NOT NULL
	AND a.StageId <> b.StageId
	AND a.StageEventId <> b.StageEventId
	AND a.EventStartDate < b.EventStartDate
    {0}
ORDER BY
	a.StageId,
	a.StageEventId,
	a.OrganizationName
";
            // restrict by organization
            if (organizationIds.Count() > 0)
            {
                string orgInStatement = "AND b.OrganizationId IN(" + string.Join(",", ToStringArray(organizationIds)) + ")";
                sql = string.Format(sql, orgInStatement);
            }
            else
            {
                sql = string.Format(sql, "");
            }

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProjectId", projectId);
            DataSet ds = DataAccessHelper.GetList(com);
            return ds.Tables[0];
        }

        /// <summary>
        /// Gets a DataSet containing Projects with their associated stages and events.
        /// Optionally filtered by Project and/or Organization.
        ///     Table 0: Projects 
        ///     Table 1: Stages
        ///     Table 2: Events
        /// NOTE: Projects with no stages will not be returned.
        /// </summary>
        /// <param name="projectIds"></param>
        /// <param name="organizationIds"></param>
        /// <returns></returns>
        public DataSet GetProjectsStagesAndEvents(IEnumerable<int> projectIds, IEnumerable<int> organizationIds)
        {
            string sql =
            @"
            SELECT DISTINCT
	            a.ProjectId,
	            a.Title,
                a.Type,
	            a.ShortName,
	            a.ProjectNum
            FROM Project a
            INNER JOIN ProjectStage b
	            ON a.ProjectId = b.ProjectId
            INNER JOIN ProjectStageEvent c
	            ON b.StageId = c.StageId
            INNER JOIN ProjectOrganization d
	            ON b.OrganizationId = d.OrganizationId
            {0}
             
            SELECT DISTINCT
	            b.ProjectId,
	            b.StageId,
	            b.OrganizationId,
	            b.Name,
                d.Name AS OrganizationName
            FROM Project a
            INNER JOIN ProjectStage b
	            ON a.ProjectId = b.ProjectId
            INNER JOIN ProjectStageEvent c
	            ON b.StageId = c.StageId
            INNER JOIN ProjectOrganization d
	            ON b.OrganizationId = d.OrganizationId
            {1}

            SELECT DISTINCT
	            c.StageId,
	            c.StageEventId,
	            c.Name,
	            c.EventStartDate,
	            c.EventEndDate
            FROM Project a
            INNER JOIN ProjectStage b
	            ON a.ProjectId = b.ProjectId
            INNER JOIN ProjectStageEvent c
	            ON b.StageId = c.StageId
            INNER JOIN ProjectOrganization d
	            ON b.OrganizationId = d.OrganizationId
            {1}

            SELECT
	            StageName,
	            EventName
            FROM
            (
	            SELECT
		            b.StageId,
		            c.StageEventId,
		            b.Name AS StageName,
		            c.Name AS EventName,
		            ROW_NUMBER() OVER(PARTITION BY b.Name,c.Name ORDER BY b.StageId ASC, c.StageEventId ASC) AS RowNum
	            FROM Project a
	            INNER JOIN ProjectStage b
		            ON a.ProjectId = b.ProjectId
	            INNER JOIN ProjectStageEvent c
		            ON b.StageId = c.StageId
	            INNER JOIN ProjectOrganization d
		            ON b.OrganizationId = d.OrganizationId
                {1}
            ) a
            WHERE
	            a.RowNum = 1
            ORDER BY
	            a.StageId ASC,
	            a.StageEventId ASC
            ";
            // build filters
            string filterByProtocol = "";
            string filterByOrganization = "";
            if (projectIds.Count() > 0)
            {
                filterByProtocol = "WHERE a.ProjectId IN(" + string.Join(",", ToStringArray(projectIds)) + ")";
                filterByOrganization = filterByProtocol;
            }
            if (organizationIds.Count() > 0)
            {
                string orgInStatement = "b.OrganizationId IN(" + string.Join(",", ToStringArray(organizationIds)) + ")";
                // set where clause
                if (string.IsNullOrEmpty(filterByOrganization))
                {
                    filterByOrganization = "WHERE " + orgInStatement;
                }
                else
                {
                    filterByOrganization += " AND " + orgInStatement;
                }
            }
            string fullSQL = string.Format(sql, filterByProtocol, filterByOrganization);
            SqlCommand com = DataAccessHelper.CreateSqlCommand(fullSQL);
            DataSet ds = DataAccessHelper.GetList(com);
            return ds;
        }

        /// <summary>
        /// Gets a list of
        ///     DISTINCT StageName, EventName
        /// from all projects and organizations
        /// order by pri keys
        /// </summary>
        /// <returns></returns>
        public DataTable GetDistinctStagesAndEvents()
        {
            return GetDistinctStagesAndEvents(new int[0], new int[0]);
        }

        /// <summary>
        /// Gets a list of
        ///     DISTINCT StageName, EventName
        /// from a list of projects by organizations
        /// order by pri keys
        /// </summary>
        /// <param name="projectIds"></param>
        /// <param name="organizationIds"></param>
        /// <returns></returns>
        public DataTable GetDistinctStagesAndEvents(IEnumerable<int> projectIds, IEnumerable<int> organizationIds)
        {
            string sql = GetDistinctStagesAndEventsSQL(projectIds, organizationIds);
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            return DataAccessHelper.GetRecord(com).Tables[0];
        }

        #endregion

        public DataTable ProjectMgmtSearch(string colVal)
        {
            return ProjectMgmtSearch(colVal, null);
        }

        public DataTable ProjectMgmtSearch(string colVal, int userId)
        {
            return ProjectMgmtSearch(colVal, userId);
        }

        private DataTable ProjectMgmtSearch(string colVal, int? userId)
        {
            string matchExpr = "LIKE '%' + @SearchValue + '%'";
            string userIdFilter = "ProjectId IN (SELECT Project_Contact.ProjectId FROM Project_Contact INNER JOIN Contact ON Project_Contact.ContactId=Contact.ContactId WHERE Contact.UserId IS NOT NULL AND Contact.UserId = @UserId) AND (";
            string sql = @"SELECT * FROM Project WHERE ";
            if (userId.HasValue)
            {
                sql += userIdFilter;
            }
            else
            {
                sql += "(";
            }
            for (int i = 0; i < SEARCH_COLUMNS.Length; i++)
            {
                string col = SEARCH_COLUMNS[i];
                // Append like expression + OR clause, except for last searchCol
                sql += col + " " + matchExpr + (i != SEARCH_COLUMNS.Length - 1 ? " OR " : ")");
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            if (userId.HasValue)
                DataAccessHelper.AddIntInputParam(com, "UserId", userId);
            DataAccessHelper.AddStringInputParam(com, "SearchValue", colVal);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        private static string GetDistinctStagesAndEventsSQL(IEnumerable<int> projectIds, IEnumerable<int> organizationIds)
        {
            string baseSQL =
            @"
            SELECT  
                StageName,
                EventName
            FROM
            (
                SELECT
                    c.ProjectId,
                    b.Name AS StageName,
                    a.Name AS EventName,
                    a.StageId,
                    a.StageEventId,
                    ROW_NUMBER()
                    OVER(
                        PARTITION BY
	                        b.Name,
	                        a.Name
                        ORDER BY
	                        c.ProjectId ASC,
	                        b.StageId ASC,
	                        a.StageEventId ASC
                    ) AS Row_Num
                FROM ProjectStageEvent a
                INNER JOIN ProjectStage b
                    ON a.StageId = b.StageId
                INNER JOIN Project c
                    ON b.ProjectId = c.ProjectId
                INNER JOIN ProjectOrganization d
                    ON b.OrganizationId = d.OrganizationId
                {0}
            ) a
            WHERE
	            Row_Num = 1
            ORDER BY 
	            StageId,
	            StageEventId
            ";
            // BUILD WHERE CLAUSE
            List<string> where = new List<string>();
            // filter by projects
            if (projectIds.Count() > 0)
            {
                where.Add("c.ProjectId IN (" + string.Join(",", ToStringArray(projectIds)) + ")");
            }
            // filter by organizations
            if (organizationIds.Count() > 0)
            {
                where.Add("d.OrganizationId IN (" + string.Join(",", ToStringArray(organizationIds)) + ")");
            }
            string executeSQL = "";
            if (where.Count() > 0)
            {
                string and = "WHERE " + string.Join(" AND ", where.ToArray());
                executeSQL = string.Format(baseSQL, and);
            }
            else
            {
                executeSQL = string.Format(baseSQL, string.Empty);
            }
            return executeSQL;
        }

        private static string[] ToStringArray(IEnumerable<int> source)
        {
            return source.Select(a => a.ToString()).ToArray();
        }

        public DataTable GetOrganizationsByProjectIds(IEnumerable<int> projectIds)
        {
            string sql =
            @"
            SELECT DISTINCT
	            a.*
            FROM  ProjectOrganization a
            INNER JOIN Project_ProjectOrganization b
	            ON a.OrganizationId = b.OrganizationId
            INNER JOIN Project c
	            ON b.ProjectId = c.ProjectId
            ";
            // filter by projects
            if (projectIds.Count() > 0)
            {
                sql += " WHERE c.ProjectId IN (" + string.Join(",", ToStringArray(projectIds)) + ")";
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }
    }
}
