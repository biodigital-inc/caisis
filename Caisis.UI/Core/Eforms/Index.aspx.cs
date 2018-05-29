using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Linq;


using Caisis.Security;
using Caisis.Controller;
using Caisis.UI.Core.Classes;



namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// EForm Index puts appropriate page in sub frame based on form status, form name, and patient
	/// </summary>
	public partial class Index : FramePage
    {
        protected bool DoubleSidedPrintEnabled;
        protected bool DoubleSidedPrintPreference;


        protected override void OnInit(EventArgs e)
        {
            string NewDoubleSidedPrintingSetting = "";
            NewDoubleSidedPrintingSetting = Request.Form["NewDoubleSidedPrintingSetting"];

            if (!string.IsNullOrEmpty(NewDoubleSidedPrintingSetting))
            {
                UserController uc = new UserController();
                // user preference
                uc.UpdateUserAttribute("DoubleSidedPrinting", NewDoubleSidedPrintingSetting, "Forms Preference");
                Response.End();
            }
            else
            {
                base.OnInit(e);
            }
        }

		
		protected override void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e); //sets patient properties and logging
			
			// patient in clinic clicked: passed in url is eformId, status, and epid
			
			// patient session handled by Base Frame Page

			// default to splash page
			string pageName = "EFormSplash.aspx"; 

			// load appropriate page with eform based on status and eformId
			if( Request.QueryString["status"] != null && Request.QueryString["status"].Length > 0 )
			{
				string status = Request.QueryString["status"];
					
				pageName = GetNextPageBasedOnStatus(status);
			}
			// user searched for patient
			else if(Request.QueryString["findClicked"] != null && Request.QueryString["findClicked"].Equals("true") )
			{
                pageName = "EFormList.aspx?EFormListType=patient";
			}
            else if (Request.QueryString["EFormListType"] != null && Request.QueryString["EFormListType"].Length > 0)
            {
                string ListType = Request.QueryString["EFormListType"];

                pageName = "EFormList.aspx?EFormListType=" + ListType;
            }
			
			EFormFrame.Attributes.Add("Src", pageName);



            DoubleSidedPrintEnabled = false;

            System.Xml.XmlDocument xDoc = XmlUtil.GetModulesConfigXml();
            string DSPrintConfig = xDoc.SelectSingleNode("/modules//module[@name='EForms']/configuration/allowDoubleSided") != null ? xDoc.SelectSingleNode("/modules//module[@name='EForms']/configuration/allowDoubleSided").InnerText : string.Empty;
            if (DSPrintConfig.Length > 0 && bool.TryParse(DSPrintConfig, out DoubleSidedPrintEnabled))
            {
                if (DoubleSidedPrintEnabled)
                {
                    DoubleSidedPrintPreference = UserPrefDoubleSided();
                }
                else
                {
                    DoubleSidedPrintPreference = false;
                }
            }
		}

		private string GetNextPageNameBasedOnStatus(string currentEformStatus)
		{
			switch(currentEformStatus)
			{
				case "new":
					return "EditEFormContainer.aspx";

				case EformStatusManager.Status_DataEntryInProgress:
					return "EditEFormContainer.aspx";

				case EformStatusManager.Status_DataEntryComplete:
					return "ValidateEForm.aspx";

				case EformStatusManager.Status_Narrated:
                    return "ReviewEFormContainer.aspx";
					//return "ApproveEFormContainer.aspx";

				case EformStatusManager.Status_Approved:
					return "ApproveEFormContainer.aspx";
				
				case "ListAllEForms":
					return "EFormList.aspx";

				default:
					return "EFormList.aspx";
			}
		}

		/// <summary>
		/// Takes status of eform and returns appropriate aspx page
		/// </summary>
		/// <param name="currentEformStatus">eform status</param>
		/// <returns>aspx page</returns>
		private string GetNextPageBasedOnStatus(string currentEformStatus)
		{
			if (currentEformStatus == "new")
			{
				// check for current eform
				string eformName = Request.QueryString["eform"];
                object o_patientId = Session[SessionKey.PatientId];

                int patientId = 0;
                // if ptId in query string, use as patient in session
                if (Request.QueryString["ptId"] != null && !string.IsNullOrEmpty(Request.QueryString["ptId"].ToString()))
                {
                    patientId = Int32.Parse(Request.QueryString["ptId"].ToString());
                    // put patient in session
                    PatientController ptController = new PatientController();
                    ptController.PutPatientInSession(Page, patientId);
                }
                else if (o_patientId != null && !String.IsNullOrEmpty(o_patientId.ToString()))
                    patientId = (int)o_patientId;

                if (patientId != 0)
                {
                    //int patientId = (int) o_patientId;

                    // do not check if user is allowed to enter multiple
                    if (!EFormController.CanAllowMultiple(eformName))
                    {
                        Caisis.DataAccess.EFormsDa da = new Caisis.DataAccess.EFormsDa();
                        DataRowView rv = da.GetPatientRecentEForm(patientId, eformName);
                        if (rv != null)
                        {
                            string status = rv["CurrentStatus"].ToString();
                            string page = GetNextPageNameBasedOnStatus(status);
                            return GetNextPageQueryString(page, status, rv["EFormId"].ToString(), rv["EFormName"].ToString());
                        }
                    }
                    
                }
			}

			string pagename = GetNextPageNameBasedOnStatus(currentEformStatus);

			return GetNextPageQueryString(pagename, currentEformStatus, Request.QueryString["eformId"], Request.QueryString["eform"]);
		}

		private string GetNextPageQueryString(string pageName, string status, string eformId, string eformName)
		{
			// the default path
			string returnVal = pageName + "?status=" + status;


            // this is a temp hack, prob need to rework all this logic - jf
            if (status.ToUpper().Equals("LISTALLEFORMS")) returnVal += "&EFormListType=patient";


			if(eformId != null && eformId.Length > 0)
			{
				returnVal += "&eformId=" + eformId;
			}
			else if (eformName != null && eformName.Length > 0)
			{
				// new eform pass in name instead of id
				returnVal += "&eform=" + eformName;
			}

            // append any additional query string paramters
            if (Request.QueryString["parentEformId"] != null)
            {
                returnVal += "&parentEformId=" + Request.QueryString["parentEformId"].ToString();
            }
            // append any additional query string paramters
            if (Request.QueryString["sectionName"] != null)
            {
                returnVal += "&sectionName=" + Request.QueryString["sectionName"].ToString();
            }
            if (Request.QueryString["referral"] != null)
            {
                returnVal += "&referral=" + Request.QueryString["referral"].ToString();
            }

			return returnVal;
		}

        private bool UserPrefDoubleSided()
        {

            bool preferDoubleSided = false;

            UserController uc = new UserController();

            DataTable dt = uc.GetUserAttributesByType("Forms Preference");

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[BOL.UserAttribute.UserAttributeName].ToString().ToUpper() == "DOUBLESIDEDPRINTING")
                    {
                        bool.TryParse(dr[BOL.UserAttribute.UserAttributeValue].ToString(), out preferDoubleSided);
                    }
                }
            }


            return preferDoubleSided;
        }
	}
}
