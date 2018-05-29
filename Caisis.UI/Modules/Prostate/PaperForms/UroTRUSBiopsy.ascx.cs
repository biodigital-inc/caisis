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
    ///		Summary description for UroTRUSBiopsy.
	/// </summary>
    public partial class UroTRUSBiopsy : BasePaperFormControl
	{



		override protected void SetFormInfo()  
		{
            this._formName = "UroTRUSBiopsy";
            this._formTitle = "Transrectal Ultrasound Biopsy Of Prostate";

		}


		override protected void OnInit(System.EventArgs e)
		{
			base.OnInit(e);
		}

	}
}
