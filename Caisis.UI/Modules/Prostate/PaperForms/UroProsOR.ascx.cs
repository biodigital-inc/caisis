namespace Caisis.UI.Modules.Prostate.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroProsOR.
	/// </summary>
	public partial class UroProsOR : BasePaperFormControl
	{
		private BasePaperFormControl  PreOpFormControl = null;
//

		override protected void SetFormInfo()  
		{
			this._formName = "UroProsOR";
			this._formTitle = "Urology Prostatectomy Details";
		}


		override protected void Page_Load(object sender, EventArgs e)
		{
			base.Page_Load(sender, e);
			LoadPreOpForm();
		}



		protected void LoadPreOpForm()
		{
			if (null != PreOpFormHolder)
			{
					PreOpFormControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("../../Prostate/PaperForms/UroPreopProsNote.ascx");

					PreOpFormControl.BatchPatientId = this._batchPatientId;
					PreOpFormControl.FormInPatientId = this._formInPatientId;
					PreOpFormControl.FormAppointmentId = this._formAppointmentId;


					PreOpFormHolder.Controls.Add(PreOpFormControl);
			}
		}





	}
}
