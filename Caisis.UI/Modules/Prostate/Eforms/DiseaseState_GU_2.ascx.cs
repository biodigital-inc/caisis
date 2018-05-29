namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;


	/// <summary>
    ///		Summary description for DiseaseState_GU_2.
	/// </summary>
    public partial class DiseaseState_GU_2 : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			ShowLastStatus();
//			SetClinicDateOnStatusClick();
		}

		/// <summary>
		/// Displays the patients last status
		/// </summary>
		protected void ShowLastStatus()
		{

            //string status = GetLastStatus(this._patientId, this._eformName, "Dynamic");
            //if (status.Length > 0)
            //{
            //    LastStatus.Text = status + "<br/><br/>";
            //}


            
			StatusDa sDa = new StatusDa();
            DataSet sDs = sDa.GetStatus(_patientId, "Prostate Cancer");

            if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
            {
                LastStatusDisplayRow.Visible = true;
                DataRow sDr = sDs.Tables[0].Rows[sDs.Tables[0].Rows.Count-1];
                LastStatus.Text = "Last Status: " + sDr[BOL.Status.Status_Field] + " on " + sDr[BOL.Status.StatusDateText];
                if (sDr[BOL.Status.StatusQuality].ToString().Length > 0) LastStatus.Text += " (Data Quality: " + sDr[BOL.Status.StatusQuality].ToString() + ")";

            }



		}

		/// <summary>
		/// Defaults status date to clinic date when user selects a status
		/// </summary>
		protected void SetClinicDateOnStatusClick()
		{
			
			string	jsscript = "<script>function setStatusDate(){";
	
			if(Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString().Length > 0)
			{
				string clinDate = Session[SessionKey.CurrentClinicDate].ToString();
				jsscript += "if(document.getElementById('" + StatusDateText.ClientID + "').value == ''){";
				jsscript += "document.getElementById('" + StatusDateText.ClientID + "').value = '" + clinDate + 
					"'; UpdateAssociatedDate(document.getElementById('" + StatusDateText.ClientID + "'))}";
			}	
			
			jsscript += "}</script>";

			Page.RegisterClientScriptBlock("xyz", jsscript);
		}
	}
}
