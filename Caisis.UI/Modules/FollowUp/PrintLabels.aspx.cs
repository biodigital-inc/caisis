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

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.Security;

namespace Caisis.UI.Modules.FollowUp
{

    public partial class Modules_FollowUp_PrintLabels : FollowUpBasePage
    {
        protected int maxLabelsPerPage = 30;  //page for printing labels can hold up to 30 addresses
        private string[] patientIds; //array with ALL the patients ids whose labels we have to print

        public string batchPrintPatientId = null;

        private int MaxLabels = 30;

        protected override void Page_Load(object sender, EventArgs e)
        {
            // Verifiy items passed in url
            if (!string.IsNullOrEmpty(Request.QueryString["pIds"]))
            {
                // Get a list of patients for which to print label
                string pIds = CustomCryptoHelper.Decrypt(Request.QueryString["pIds"]);
                //string pIds = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34";

                patientIds = pIds.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                MaxLabels = GetMaxLabelsPerPage();
                //MaxLabels = 1;

                // Build List

                // Option 1. Bind to Repeater

                // Populates repeater with list of patient info
                //rptLabels.DataSource = data;
                //rptLabels.DataBind();

                // Operion 2. Insert controls dynamically
                CreateChildControls(patientIds);
            }
        }

        protected void CreateChildControls(string[] pIds)
        {
            int existingAddress = 0;
            for (int i = 0; i < pIds.Length; i++)
            {
                int ptId = int.Parse(pIds[i]);
                Modules_FollowUp_Surveys_AddressLabel addressControl = Page.LoadControl("Surveys/AddressLabel.ascx") as Modules_FollowUp_Surveys_AddressLabel;
                addressControl.PatientId = ptId;
                addressControl.BindToPatient();

                if (addressControl.Visible)
                {
                    // Determine if we neeed to add break
                    if (existingAddress >= MaxLabels && existingAddress % MaxLabels == 0)
                    {
                        // Add page break
                        Panel breakControl = new Panel();
                        breakControl.CssClass = "PageBreaker";
                        DynamicAddressHolder.Controls.Add(breakControl);

                        Panel breakControlSpacing = new Panel();
                        breakControlSpacing.CssClass = "PageBreakerTopSpacing";
                        DynamicAddressHolder.Controls.Add(breakControlSpacing);
                    }

                    // Add address to container
                    DynamicAddressHolder.Controls.Add(addressControl);

                    existingAddress++;
                }
            }
        }

        /// <summary>
        /// Set AddressLabel control's display helpers
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetPatientInfo(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                string ptName = DataBinder.Eval(e.Item.DataItem, Patient.PtFirstName).ToString();
                string ptAddress = DataBinder.Eval(e.Item.DataItem, Patient.PtAddress1).ToString();
                Modules_FollowUp_Surveys_AddressLabel addressControl = e.Item.FindControl("PtAddress") as Modules_FollowUp_Surveys_AddressLabel;
                addressControl.PatientName = ptName;
                addressControl.PatientAddress = ptAddress;
            }
        }


        private int GetMaxLabelsPerPage()
        {
            if (ConfigurationSettings.AppSettings["maxLabelsPerPage"] != null && ConfigurationSettings.AppSettings["maxLabelsPerPage"].Length > 0)
            {
                maxLabelsPerPage = Convert.ToInt32(ConfigurationSettings.AppSettings["maxLabelsPerPage"]);
            }
            if (patientIds.Length <= maxLabelsPerPage)
            {
                maxLabelsPerPage = patientIds.Length;
            }
            return maxLabelsPerPage;
        }

    }
}
