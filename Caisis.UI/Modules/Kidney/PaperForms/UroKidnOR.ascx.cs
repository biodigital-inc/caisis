namespace Caisis.UI.Modules.Kidney.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroKidnOR.
	/// </summary>
	public partial class UroKidnOR : BasePaperFormControl
	{

		private BasePaperFormControl  PreOpFormControl = null;
		
		override protected void SetFormInfo()  
		{
			this._formName = "UroKidnOR";
			this._formTitle = "Urology Nephrectomy Details";
		}

		override protected void Page_Load(object sender, EventArgs e)
		{
			base.Page_Load(sender, e);
			LoadPreOpForm();
 //           InsertPageBreak();
		}

		override protected void OnInit(System.EventArgs e)
		{
			IsOnePageForm = true;
			base.OnInit(e);
		}

		protected void LoadPreOpForm()
		{
			if (null != PreOpFormHolder)
			{
				PreOpFormControl = (BasePaperFormControl)this.LoadControl("../../All/PaperForms/UroPreopNote.ascx");

				PreOpFormControl.BatchPatientId = this._batchPatientId;
				PreOpFormControl.FormInPatientId = this._formInPatientId;
				PreOpFormControl.FormAppointmentId = this._formAppointmentId;

				PreOpFormHolder.Controls.Add(PreOpFormControl);
			}
		}

        //protected void InsertPageBreak()
        //{
        //    if (Request["batchPrint"] != null && Request["batchPrint"] == "true") BatchPageBreak.Visible = true;
        //}


	}
}
