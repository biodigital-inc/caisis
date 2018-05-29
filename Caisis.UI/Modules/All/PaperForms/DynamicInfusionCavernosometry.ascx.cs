namespace Caisis.UI.Modules.All.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using Caisis.DataAccess;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroPreopNote.
	/// </summary>
    public partial class DynamicInfusionCavernosometry : BasePaperFormControl
	{


		override protected void SetFormInfo()  
		{
            this._formName = "DynamicInfusionCavernosometry";
            this._formTitle = "Dynamic Infusion Cavernosometry Report";
		}

		override protected void OnInit(System.EventArgs e)
		{
			IsOnePageForm = true;
			base.OnInit(e);
		}


	}
}
