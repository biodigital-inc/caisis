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
	///		Summary description for UroBladCystFU.
	/// </summary>
	public partial class UroSurveyUrinSexFunc : BasePaperFormControl
	{



		override protected void SetFormInfo()  
		{
			this._formName = "UroSurveyUrinSexFunc";
			this._formTitle = "Urology Urinary and Sexual Function Questionnaire";

		}


		override protected void OnInit(System.EventArgs e)
		{
			IsOnePageForm = true;

			if (this.Parent.Parent.GetType().ToString().IndexOf("HtmlGenericControl") < 0)
			{
				IsEmbeddedForm = true;
			}

			base.OnInit(e);
		}

	}
}
