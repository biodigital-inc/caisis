namespace Caisis.UI.Modules.Bladder.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroBladOR.
	/// </summary>
	public partial class UroBladOR : BasePaperFormControl
	{

		private BasePaperFormControl  PreOpFormControl = null;

		override protected void SetFormInfo()  
		{
			this._formName = "UroBladOR";
			this._formTitle = "Urology Cystectomy Details";
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
				PreOpFormControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("../../All/PaperForms/UroPreopNote.ascx");

				PreOpFormControl.BatchPatientId = this._batchPatientId;
				PreOpFormControl.FormInPatientId = this._formInPatientId;
				PreOpFormControl.FormAppointmentId = this._formAppointmentId;

				PreOpFormHolder.Controls.Add(PreOpFormControl);
			}
		}


	}
}
