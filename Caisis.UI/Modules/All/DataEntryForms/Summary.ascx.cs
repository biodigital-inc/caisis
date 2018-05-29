using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.Sql;

using System.Data.SqlClient;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core;
using Caisis.UI.Core.Classes;


public partial class Modules_All_DataEntryForms_Summary : BasePatientDataControl
{
    private int patientID;
    private int RowsAllowed;

    override protected void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);

        patientID = int.Parse(Session[SessionKey.PatientId].ToString());

        //From GU Form
        // BuildHPI();

        //Allergies
		//Allergy allergy = new Allergy();
		//allergy.GetByParent(patientID);
		//rptAllergies.DataSource = allergy.DataSourceView;
		rptAllergies.DataSource = BusinessObject.GetByParentAsDataView<Allergy>(patientID);
        rptAllergies.DataBind();

        //Medications
		//Medication med = new Medication();
		//med.GetByParent(patientID);
		//rptMedications.DataSource = med.DataSourceView;
		rptMedications.DataSource = BusinessObject.GetByParentAsDataView<Medication>(patientID);
        rptMedications.DataBind();

        //Comorbidities
		//Comorbidity com = new Comorbidity();
		//com.GetByParent(patientID);
		//rptComorbidities.DataSource = com.DataSourceView;
		rptComorbidities.DataSource = BusinessObject.GetByParentAsDataView<Comorbidity>(patientID);
        rptComorbidities.DataBind();
    }

    

    
}
