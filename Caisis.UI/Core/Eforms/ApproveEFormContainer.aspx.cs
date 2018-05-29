using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Text;

using Caisis.DataAccess;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Summary description for temp.
	/// </summary>
	public partial class ApproveEFormContainer : EFormBasePage
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



        // Should never be on this page unless the form is approved
		protected override void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			//this.SetEFormNavigationSteps();

			EFormTitle.Text = base.EFormTitle;

			// form should be approved when reaching this page
			EFormController ct = new EFormController();
			string status = ct.GetEFormStatus(base.EFormId);

			if(status.Equals(EformStatusManager.Status_Approved))
			{
                //this.DisablePreviousSteps();
                this.LoadPrintPage();
                SetPageTitles(true);
                if (this.PromptForPrint() && !(this.ViewFromReferral())) // Make page autoPrint if defined in EForm Registry
                {
                    PrintPageOnLoadScript.Visible = true;
                }
                PrintBtn.Visible = true;





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
		}

        private void LoadPrintPage()
        {
            NarrativeFrame.Attributes.Add("src", "EFormPrintableText.aspx?eformId=" + base.EFormId + "");
        }

        // Checks EForm Registry to see if form should autoprint when approved
        protected bool PromptForPrint()
        {
            XmlNode node = CaisisConfiguration.GetEFormNode(this.EFormName);
            if (node != null)
            {
                XmlAttribute nodeAtt = node.Attributes["promptForPrint"];
                if (nodeAtt != null)
                {
                    return (nodeAtt.Value.Length > 0 && nodeAtt.Value.ToLower() == "true");
                }
            }
            return false;
        }


        // Checks whether the user has arrived as a result of a referral
        protected bool ViewFromReferral()
        {
            bool isReferral = false;
            if (Request.QueryString["referral"] != null && Request.QueryString["referral"] == "true") { isReferral = true; }
            return isReferral;
        }


        private void SetPageTitles(bool IsEFormApproved)
        {
            if (IsEFormApproved)
            {
                NavTitle.Text = "Print Narrative";

                string approvedBy = "";
                string approvedTime = "";
                string userRealName = "";

                // get the user who approved form and date
                EFormsDa da = new EFormsDa();

                DataSet ds = da.GetEformsRecord(base.EFormId);

                if (ds.Tables[0].Rows.Count == 1)
                {
                    approvedBy = ds.Tables[0].Rows[0][EForm.UpdatedBy].ToString();
                    approvedTime = ds.Tables[0].Rows[0][EForm.UpdatedTime].ToString();

                    UserDa userda = new UserDa();
                    DataSet userds = userda.GetByUserName(approvedBy);

                    userRealName = userds.Tables[0].Rows[0]["UserFirstName"].ToString() + " " + userds.Tables[0].Rows[0]["UserLastName"].ToString();
                }

                if (Session[SessionKey.PtFirstName] != null && Session[SessionKey.PtFirstName].ToString().Length > 0)
                {
                    NavTitle.Text += " for " + Session[SessionKey.PtFirstName].ToString();
                }

                if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtLastName].ToString().Length > 0)
                {
                    NavTitle.Text += " " + Session[SessionKey.PtLastName].ToString();
                }

                UserMsg.Text = "<span class=\"EFormAlertMsg\">This eform has been APPROVED by " + userRealName + " on " + approvedTime + " and is no longer available for update.</span><br/><br/><br/><br/>To print the narrative use the button located on the bottom right of this page.";
            }
            else
            {
                NavTitle.Text = "Approve Narrative";

                if (Session[SessionKey.PtFirstName] != null && Session[SessionKey.PtFirstName].ToString().Length > 0)
                {
                    NavTitle.Text += " for " + Session[SessionKey.PtFirstName].ToString();
                }

                if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtLastName].ToString().Length > 0)
                {
                    NavTitle.Text += " " + Session[SessionKey.PtLastName].ToString();
                }

                UserMsg.Text = "If all data is accurate approve the eform using the button on the lower right. Once approved you will no longer be able to update the eform.<br><br>After approval, the narrative will remain available for printing.";
            }
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



        /*
        private void DisablePreviousSteps()
        {
            EditStep.Visible = false;
            // VerifyStep.Visible = false;
            NarrativeStep.Visible = false;
            ApproveStep.Visible = false;
            EFormSectionNavTable.Visible = false;
            EformCompleteStatusImg.Visible = true;
        }
         */


       
        /*
		protected void SetEFormNavigationSteps()
		{
			EditStep.HRef		= "EditEFormContainer.aspx?eformId=" + this.EFormId;
			NarrativeStep.HRef	= "ReviewEFormContainer.aspx?eformId=" + this.EFormId;
			ApproveStep.HRef	= "ApproveEFormContainer.aspx?eformId=" + this.EFormId;
		}
        */

		
        /*
		protected void ApproveOnBtnClick(object sender, CommandEventArgs e)
		{	
			// Response.Redirect("EFormApproval.aspx?eform=" + base.EFormName + "");
            
                this.ApproveEForm();
                
          
		}
        */

        /*
		protected void DisableApprovalBtn()
		{
			ApproveButton.Visible = false;

			this.DisablePreviousSteps();
		}
        */

        /*
		private void ApproveEForm()
		{
		    if (EFormController.CanApproveEForm())
            {
                string _userName = base.EFormUserName;
			    int _patientId = base.EFormPatientId;
			    int _eformId = base.EFormId;
			    string _eformName = base.EFormName;// should pull from url


                // get eform record	
                XmlDocument xmlDoc = new XmlDocument();
                EFormController ctr = new EFormController();

                //DataSet ds = ctr.GetOpenRecordByName(_patientId, _eformName);

                DataSet ds = ctr.GetRecord(_eformId);

                if (ds.Tables[0].Rows.Count == 1)
                {
                    // CONFIRM EFORM HAS NOT ALREADY BEEN APPROVED
                    if (!ds.Tables[0].Rows[0][EForm.CurrentStatus].ToString().Equals(EformStatusManager.Status_Approved))
                    {
                        string s = ds.Tables[0].Rows[0][EForm.EFormXML].ToString();

                        string migrationErrorLog;

                        bool migrationSuccess = XmlServices.MigrateEformXml(_patientId, s, out migrationErrorLog);

                        // update eform status to 'approved' and updated by person
                        // even if there was a failure migrating data, update status to approved and notify sys admin, because some of the data may have migrated and we don't want user to re-approve/migrate!
                        ctr.UpdateEFormXml(_eformId, s, EformStatusManager.Status_Approved, _userName);

                        if (migrationSuccess)
                        {
                            // only allow printing of form if migration was totally successful
                            if (this.PromptForPrint()) // Make page autoPrint if defined in EForm Registry
                            {
                                PrintPageOnLoadScript.Visible = true;
                            }
                            PrintBtn.Visible = true;
                            SetPageTitles(true);
                        }
                        else
                        {
                           
                            UserMsg.Text = "There has been a problem approving this eform. The system administrator has been notified.";

                            //string errorOutput = "<table width=200 style=\"border: 1px solid gray\"><tr><td>EFORM APPPROVAL ERROR LOG (records below were not stored in database)<br><br>EFormId: " + _eformId + " Approved By: " + base.EFormUserName + " at " + DateTime.Now + "<br><br>" + efm.migrationErrorLog.ToString() + "</td></tr></table>";
                            string errorOutput = "\n\nEFORM APPPROVAL ERROR LOG (records below were not stored in database)\n\nEFormId: " + _eformId + " Approved By: " + base.EFormUserName + " at " + DateTime.Now + "\n\n" + migrationErrorLog;
                            //ExceptionHandler.SendEmail(errorOutput); // WHAT if email doesn't work? we won't know about this? 
                            Exception migrationException = new Exception(errorOutput);
                            ExceptionHandler.Publish(migrationException);
                        }
                    }
                }
                DisableApprovalBtn();
            }
            else
            {
                UserMsg.Text = "You do not have the necessary priviliges to approve an eform.<br><br>If you feel this is in error, please contact the system administrator";
            }

		}
        */



		#region IN BASEPAGE: Web Form Designer generated code
		/*override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);
		}*/
		#endregion
	}
}
