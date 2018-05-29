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
    public partial class UroSurveyProstateQOL_Regional : BasePaperFormControl
	{

        override protected void Page_Load(object sender, EventArgs e)
        {

            base.Page_Load(sender, e);

            SetRegionalLocation();

        }

		override protected void SetFormInfo()  
		{
            this._formName = "UroSurveyProstateQOL_Regional";
            this._formTitle = "Urology Prosatate QOL Survey (Basking Ridge)";

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
