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
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.FollowUp
{

    public partial class Modules_FollowUp_PrintForms : FollowUpBasePage
    {

        public string batchPrintPatientId = null;

        protected override void Page_Load(object sender, EventArgs e)
        {
            CreateChildControls();
        }

        protected void CreateChildControls()
        {
            if (null != formHolder)
            {
                if (Request["batchPrint"] != null && Request["batchPrint"].Equals("true"))
                {
                    foreach (string patientId in ParsedParameters.Keys)
                    {
                        BaseSurveyControl surveyControl = null;

                        if (patientId.Length > 0 && patientId != "batchPrint" && patientId != "proc" && patientId != "createBatchButton")
                        {
                            string monthNumber = ParsedParameters[patientId][0];
                            string surveyName = ParsedParameters[patientId][1].Replace(" ", "");

                            string batchModuleDirectory;
                            string formControlFileName = surveyName + ".ascx";

                            if (formControlFileName.Contains(","))
                            {
                                // TODO: write output to error note because patient has multiple RP's - should not happen with production data
                            }
                            else
                            {
                                // get ascx control (survey)
                                surveyControl = (BaseSurveyControl)this.LoadControl("../../Modules/FollowUp/Surveys/" + formControlFileName);
                                surveyControl.PatientId = Convert.ToInt32(patientId);
                                surveyControl.Procedure = Request.QueryString["proc"];
                                surveyControl.FuMonth = monthNumber;

                                // load .ascx control onto page
                                formHolder.Controls.Add(surveyControl);
                            }
                        }
                    }

                }

            }
        }

    }

}