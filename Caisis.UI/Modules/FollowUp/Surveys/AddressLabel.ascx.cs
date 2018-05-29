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

using Caisis.UI.Core.Classes;
using Caisis.BOL;
using Caisis.DataAccess;

public partial class Modules_FollowUp_Surveys_AddressLabel : BaseSurveyControl
{

    public string PatientName
    {
        get
        {
            return PatientNameLabel.Text;
        }
        set
        {
            PatientNameLabel.Text = value;
        }
    }

    public string PatientAddress
    {
        get
        {
            return PatientAddressLabel.Text;
        }
        set
        {
            PatientAddressLabel.Text = value;
        }
    }

    private PatientDa da = new PatientDa();
    protected override void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //if (Request["batchPrint"] != null && Request["batchPrint"].Equals("true"))
            //{
            //    foreach (string patientId in Request.QueryString)
            //    {
            //        if (patientId.Length > 0 && patientId != "batchPrint" && patientId != "createBatchButton")
            //        {
            //            string batchModuleDirectory;
            //            string formControlFileName = Request[patientId] + ".ascx";

            //            if (formControlFileName.Contains(","))
            //            {
            //                // TODO: write output to error note because patient has multiple RP's - should not happen with production data
            //            }
            //            else
            //            {
            //                // get ascx control (survey)
            //                surveyControl = (BaseSurveyControl)this.LoadControl("../../Modules/FollowUp/Surveys/" + formControlFileName);
            //                surveyControl.PatientId = Convert.ToInt32(patientId);

            //                // load .ascx control onto page
            //                formHolder.Controls.Add(surveyControl);
            //            }
            //        }
            //    }

            //}


        }
    }

    public void BindToPatient()
    {
        //string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
        //DataTable dt = da.GetPatientById(this.PatientId, datasetSQL);
        //if (dt.Rows.Count > 0)
        //{
        //    DataRow ptRecord = dt.Rows[0];
        //    PatientName = ptRecord[Patient.PtFirstName].ToString() + " " + ptRecord[Patient.PtLastName].ToString();

        //    //string addrLine1 = ptRecord[Patient.PtAddress1].ToString() + " " + ptRecord[Patient.PtAddress2].ToString();
        //    //string addrLine2 = ptRecord[Patient.PtCity].ToString() + ", " + ptRecord[Patient.PtState].ToString() + ptRecord[Patient.PtPostalCode].ToString();
        //    //PatientAddress = addrLine1.ToUpper() + "<br/>" + addrLine2.ToUpper();
        //    PatientAddress = "my address";
        //}
        //else
        //{
        //    this.Visible = false;
        //}


        Patient pt = new Patient();
        pt.Get(this.PatientId);

        this.PatientName = pt[Patient.PtFirstName].ToString().ToUpper() + " " + pt[Patient.PtMiddleName].ToString().ToUpper() + " " + pt[Patient.PtLastName].ToString().ToUpper();

        string addrLine1 = pt[Patient.PtAddress1].ToString() + " " + pt[Patient.PtAddress2].ToString();
        string addrLine2 = pt[Patient.PtCity].ToString() + ", " + pt[Patient.PtState].ToString() + " " + pt[Patient.PtPostalCode].ToString();

        this.PatientAddress = addrLine1.ToUpper() + "<br/>" + addrLine2.ToUpper();
    }
}
