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
	public partial class UroBladUrinDiv : BasePaperFormControl
	{



		override protected void SetFormInfo()  
		{
			this._formName = "UroBladOR";
			this._formTitle = "Urology Urinary Diversion";
		}



	}
}
