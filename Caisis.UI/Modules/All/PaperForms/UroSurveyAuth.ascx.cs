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
	///		Summary description for UroProsORPathDiagram.
	/// </summary>
	public partial class UroSurveyAuth : BasePaperFormControl
	{


		override protected void SetFormInfo()  
		{
			this._formName = "UroSurveyAuth";
			this._formTitle = "HIPAA Survey Authorization";
		}

		override protected void OnInit(System.EventArgs e)
		{
			IsOnePageForm = true;
			base.OnInit(e);
		}

	}
}
