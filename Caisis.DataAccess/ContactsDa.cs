using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for ContactsDa.
    /// </summary>
    public class ContactsDa : BaseDA
    {

        public DataTable GetAllContacts()
        {
            return GetContacts(string.Empty);
        }

        /// <summary>
        /// Gets a list of Contacts based on ContactType
        /// </summary>
        /// <param name="contactType"></param>
        /// <returns></returns>
        public DataTable GetContactByContactType(string contactType)
        {
            return GetContacts(contactType);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="contactType"></param>
        /// <returns></returns>
        private DataTable GetContacts(string contactType)
        {
            string sql = "SELECT Contact.*,Contact.LastName + ', ' + Contact.FirstName AS Name,ProjectOrganization.Name AS Organization ";
            sql += "FROM ProjectOrganization_ProjectContact INNER JOIN ProjectOrganization ";
            sql += "ON ProjectOrganization_ProjectContact.OrganizationId = ProjectOrganization.OrganizationId ";
            sql += "RIGHT OUTER JOIN Contact ON Contact.ContactId=ProjectOrganization_ProjectContact.ContactId ";

            // Filter SQL by ContactType
            if (!string.IsNullOrEmpty(contactType))
            {
                sql += "WHERE Contact.ContactType IS NOT NULL AND Contact.ContactType = @ContactType";
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            // ADD filter parameters
            if (!string.IsNullOrEmpty(contactType))
            {
                DataAccessHelper.AddStringInputParam(com, "ContactType", contactType);
            }
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets a list of Contacts based on PatientId and ContactType
        /// **** CURRENTLY ONLY MCGILL CAISIS VERSION HAS PATIENTID IN CONTACT TABLE 4/29/2010 ****
        /// </summary>
        /// <param name="PatientId"></param>
        /// <param name="ContactType"></param>
        /// <returns></returns>
        public DataSet GetContactByPatientIDandContactType(int PatientId, string ContactType)
        {
            DataSet ds = new DataSet();

            string sql = @"
                  SELECT * 
                  FROM Contact
                  WHERE (PatientId = @PatientId ) AND (ContactType LIKE @ContactType) 
                  ORDER BY LastName ASC ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "ContactType", string.Format("%{0}%", ContactType));

            ds = DataAccessHelper.GetRecord(com);

            return ds;
        }

        #region USERS and CONTACTS

        /// <summary>
        /// Returns a list of All Contacts and Users
        /// </summary>
        /// <returns></returns>
        public DataTable GetAllContactsAndUser()
        {
            return _GetAllContactsAndUser(null);
        }

        /// <summary>
        /// Returns a list of All Contacts and Users (filtered by Organization)
        /// </summary>
        /// <param name="organizationId"></param>
        /// <returns></returns>
        public DataTable GetAllContactsAndUser(int organizationId)
        {
            return _GetAllContactsAndUser(organizationId);
        }

        private DataTable _GetAllContactsAndUser(int? organizationId)
        {
            string sql =
                @"
SELECT
	ContactId,
	FirstName,
	LastName,
	UserId,
	UserName,
	UserFirstName,
	UserLastName,
	UserEmail,
	OrganizationId,
	Name,
	OrganizationContactId
FROM
(
	SELECT
		a.ContactId,
		a.FirstName,
		a.LastName,
		d.UserId,
		d.UserName,
		d.UserFirstName,
		d.UserLastName,
		d.UserEmail,
		c.OrganizationId,
		c.Name,
		-- select on valid organization
		CASE 
			 WHEN
				@OrganizationId IS NULL OR c.OrganizationId = @OrganizationId
			THEN b.OrganizationContactId
			ELSE NULL
		  END AS OrganizationContactId,
		-- select single contact for organization filter
		ROW_NUMBER() OVER(PARTITION BY a.ContactId, d.UserId ORDER BY
		CASE  
			 WHEN c.OrganizationId = @OrganizationId THEN 0
			 ELSE 1
		  END
		 ASC) AS RowNum
	FROM Contact a
	LEFT OUTER JOIN ProjectOrganization_ProjectContact b
		ON a.ContactId = b.ContactId
	LEFT OUTER JOIN ProjectOrganization c
		ON b.OrganizationId = c.OrganizationId
	FULL OUTER JOIN Users d
		ON a.UserId = d.UserId
) a
WHERE
	@OrganizationId IS NULL
	OR
	-- restrict to valid contacts with current organization
	(a.ContactId IS NOT NULL AND a.RowNum = 1)
ORDER BY
	CASE
	WHEN @OrganizationId IS NULL
	THEN 0
	-- current organization contacts sort first
	ELSE ISNULL(OrganizationContactId - OrganizationContactId, 1)
	END ASC,
	LastName ASC
";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddInputParam(com, "OrganizationId", organizationId, true);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        #endregion

    }
}
