using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using Caisis.DataAccess;

public partial class Modules_All_Reports_ProceduresByService : System.Web.UI.Page
{
    # region sql
    private string sql = @"DECLARE @Institution varchar(50)
DECLARE @Year datetime

SET @Institution = 'BCM'
SET @Year = 2000

IF @Institution IS NULL
	BEGIN
		IF @Year IS NULL
			BEGIN
				PRINT('Institution and Year were null')

				SELECT Institution, YEAR(Patients.EnteredTime) as Year, count(Patients.PatientId) as Count
				FROM Patients
					left outer join PatientInstitutions on Patients.PatientId = PatientInstitutions.PatientId
					left outer join Institutions on PatientInstitutions.InstitutionId = Institutions.InstitutionId
				GROUP BY YEAR(Patients.EnteredTime), Institution
				ORDER BY Institution, YEAR(Patients.EnteredTime);
			END
		ELSE
			BEGIN
				PRINT('Institution was null, Year was not null')

				SELECT Institution, YEAR(Patients.EnteredTime) as Year, count(Patients.PatientId) as Count
				FROM Patients
					left outer join PatientInstitutions on Patients.PatientId = PatientInstitutions.PatientId
					left outer join Institutions on PatientInstitutions.InstitutionId = Institutions.InstitutionId
				WHERE YEAR(Patients.EnteredTime) = @Year
				GROUP BY YEAR(Patients.EnteredTime), Institution
				ORDER BY Institution, YEAR(Patients.EnteredTime);
			END
	END
ELSE
	BEGIN
		IF @Year IS NULL
			BEGIN
				PRINT('Institution was not null, Year was null')

				SELECT Institution, YEAR(Patients.EnteredTime) as Year, count(Patients.PatientId) as Count
				FROM Patients
					left outer join PatientInstitutions on Patients.PatientId = PatientInstitutions.PatientId
					left outer join Institutions on PatientInstitutions.InstitutionId = Institutions.InstitutionId
				WHERE Institution = @Institution
				GROUP BY YEAR(Patients.EnteredTime), Institution
				ORDER BY Institution, YEAR(Patients.EnteredTime);
			END
		ELSE
			BEGIN
				PRINT('Institution was not null, Year was not null')

				SELECT Institution, YEAR(Patients.EnteredTime) as Year, count(Patients.PatientId) as Count
				FROM Patients
					left outer join PatientInstitutions on Patients.PatientId = PatientInstitutions.PatientId
					left outer join Institutions on PatientInstitutions.InstitutionId = Institutions.InstitutionId
				WHERE Institution = @Institution AND YEAR(Patients.EnteredTime) = @Year
				GROUP BY YEAR(Patients.EnteredTime), Institution
				ORDER BY Institution, YEAR(Patients.EnteredTime);
			END
	END";
    
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected DataView GetProcedures(string sql)
    {
        SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
        return DataAccessHelper.GetList(cmd).Tables[0].DefaultView;
    }
}
