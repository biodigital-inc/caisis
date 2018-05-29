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
	///		Summary description for UroProsORPathDiagram.
	/// </summary>
	public partial class UroProsORPathDiagram : BasePaperFormControl
	{


		override protected void SetFormInfo()  
		{
			this._formName = "UroProsORPathDiagram";
			this._formTitle = "Urology OR Prostate Pathology Diagram";
		}



	}
}
