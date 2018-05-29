using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Xml;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.Security;
using Caisis.BOL;


using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Summary description for EFormListPatientsForms.
	/// </summary>
	public partial class PatientEFormList : EFormBasePage
	{
//		protected HtmlContainerControl theNarrative;
		protected HtmlImage  StatusImg;
		protected HtmlContainerControl NarrativeFrame; 

		protected override void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			EFormTitle.Text = base.EFormTitle;

//			PatientName.Text = "";
			
			if (Session[SessionKey.PtFirstName] != null && Session[SessionKey.PtFirstName].ToString().Length > 0)
			{
				PatientName.Text = "";
				PatientName.Text += Session[SessionKey.PtFirstName].ToString();
			}
			if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtLastName].ToString().Length > 0)
			{
				PatientName.Text += " " + Session[SessionKey.PtLastName].ToString();
			}

			// centralize setting of new eform drop down this with eform list 
			ListItemCollection lic = new ListItemCollection();
			lic.Add(new ListItem("", ""));
            XmlNodeList list = CaisisConfiguration.GetEFormsList();
            foreach (XmlNode node in list)
            {
                string name = node.Attributes["displayname"].Value;
                string value = node.Attributes["name"].Value;
                ListItem item = new ListItem(name, value);
                lic.Add(item);
            }
            // Old Code to populate dropdown list
            //lic.Add(new ListItem("Prostate Surgery EForm", "Prostate Surgery EForm"));
            ////lic.Add(new ListItem("Prostate New Patient EForm", "Prostate New Patient EForm"));
            //lic.Add(new ListItem("Urology Prostate Follow Up", "Uro Pros FU"));
            //lic.Add(new ListItem("GU Prostate Follow Up", "GU Pros FU"));	
			EFormDropDown.DataSource = lic;
			EFormDropDown.DataTextField = "Text";
			EFormDropDown.DataValueField = "Value";
			EFormDropDown.DataBind();

			string epid = CustomCryptoHelper.Encrypt(Session[SessionKey.PatientId].ToString());
			StartNewEFormImg.Attributes.Add("onClick","if (checkEformTypeChosen('" + EFormDropDown.ClientID + "')) { startBtnClick(this.id, '" + epid + "' ) } else { alert('Please select an EForm type.') }");

			// set repeater
			this.SetPatientEFormList();

//			this.ShowEFormNarrative();

			
		}

		private void SetPatientEFormList()
		{
			if(Session[SessionKey.PatientId] != null && Session[SessionKey.PatientId].ToString() != "")
			{
				EFormsDa da = new EFormsDa();
				DataSet ds = da.GetPatientEForms(int.Parse(Session[SessionKey.PatientId].ToString()));
				
				if (ds.Tables[0].Rows.Count > 0)
				{
					NoEFormsTableRow.Visible = false;
					PatientEForms.DataSource = ds.Tables[0].DefaultView;
					PatientEForms.DataBind();
				}
			}
		}

/*		old functionality - remove after testing - jf
		private void ShowEFormNarrative()
		{
			EFormController ctr = new EFormController();
			
			int eformId = Convert.ToInt32(Request.QueryString["eformId"]);

			// get record using eform id because both approved and reviewed eforms may be displayed
			DataSet eds = ctr.GetRecord(eformId);
	
			if(eds.Tables[0].Rows.Count > 0)
			{
				// display html from database,status must be "Previewed"
				if(eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormReport].ToString().Length > 0)
				{
					theNarrative.InnerHtml = eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormReport].ToString();	
				}
			}
		}
*/
		protected void OnItemCreate(Object Sender, RepeaterItemEventArgs e)
		{
			HtmlContainerControl EFormCell;
			EFormCell = (HtmlContainerControl) e.Item.FindControl("EFormCell");

			HtmlContainerControl EFormRow;
			EFormRow = (HtmlContainerControl) e.Item.FindControl("EFormRow");

			HtmlImage EFormStatusImg;
			EFormStatusImg = (HtmlImage) e.Item.FindControl("EFormStatusImg");
			
			
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				string eformId = ((DataRowView) e.Item.DataItem )[EForm.EFormId].ToString();
				
				string eformStatus = ((DataRowView) e.Item.DataItem )[EForm.CurrentStatus].ToString();

				string patientId = ((DataRowView) e.Item.DataItem )["PatientId"].ToString();

				string epid = CustomCryptoHelper.Encrypt(patientId);

				if(eformStatus == EformStatusManager.Status_Deleted)
				{
					// hide it
					EFormRow.Visible = false;
				}
				else if( eformStatus == EformStatusManager.Status_Approved)
				{
					// link to this page

					EFormCell.Attributes.Add("onClick","loadApprovedEForm('" + eformId + "');");

// this is old functionality, remove after testing - jf
//					EFormCell.Attributes.Add("onClick","document.location='PatientEFormList.aspx?eformId=" + eformId + "';");
										
					EFormStatusImg.Src = "../../Images/EFormStatus_Approved.gif";

					string ImgTitleString = "Approved " + ((DataRowView) e.Item.DataItem )["UpdatedTime"].ToString() + "\nby " + ((DataRowView) e.Item.DataItem )["UpdatedBy"].ToString();

					EFormStatusImg.Attributes.Add("title", ImgTitleString);



				}
				else
				{


					string ImgTitleString = "Last Updated " + ((DataRowView) e.Item.DataItem )["UpdatedTime"].ToString() + "\nby " + ((DataRowView) e.Item.DataItem )["UpdatedBy"].ToString();
					EFormStatusImg.Attributes.Add("title", ImgTitleString);


					if ( eformStatus == EformStatusManager.Status_Narrated)
					{
						EFormStatusImg.Src = "../../Images/EFormStatus_DataReviewed.gif";
					}
					else if ( eformStatus == EformStatusManager.Status_DataEntryComplete)
					{
						EFormStatusImg.Src = "../../Images/EFormStatus_DataComplete.gif";
					}

					// link back to workflow so user can finish the eform
					
					EFormCell.Attributes.Add("OnClick", "document.location.href='PatientEFormList.aspx?eformId=" + eformId + "';");
				
					string urlVars = "epid="+ epid +"&eformId=" + eformId + "&status=" + eformStatus;
					
					EFormCell.Attributes.Add("onClick","parent.location='Index.aspx?" + urlVars + "';");
				
				}




				

			}
			
		}


		private void LoadPrintPage()
		{
			NarrativeFrame.Attributes.Add("src", "EFormPrintableText.aspx?eformId=" + base.EFormId + "");
		}

	}
}
