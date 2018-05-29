namespace Caisis.UI.Modules.Testis.PaperForms
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
	public partial class UroTestOrchOR : BasePaperFormControl
	{


		
		override protected void SetFormInfo()  
		{
			this._formName = "UroTestOrchOR";
			this._formTitle = "Urology Orchiectomy Details";
		}

		override protected void OnInit(System.EventArgs e)
		{
			IsOnePageForm = true;
			base.OnInit(e);
		}

	}
}
