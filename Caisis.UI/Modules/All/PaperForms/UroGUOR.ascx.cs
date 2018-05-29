namespace Caisis.UI.Modules.All.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroGUOR.
	/// </summary>
	public partial class UroGUOR : BasePaperFormControl
	{

		override protected void SetFormInfo()  
		{
			this._formName = "UroGUOR";
			this._formTitle = "General Urology OR Details";
		}

		override protected void OnInit(System.EventArgs e)
		{
			IsOnePageForm = true;
			base.OnInit(e);
		}

	}
}
