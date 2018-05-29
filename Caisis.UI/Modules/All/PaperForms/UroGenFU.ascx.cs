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
	///		Summary description for UroBladFU.
	/// </summary>
	public partial class UroGenFU : BasePaperFormControl
    {

        override protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
//            LoadHomeMedicationList();
        }




		override protected void SetFormInfo()  
		{
			this._formName = "UroGenFU";
			this._formTitle = "Urology General Follow Up";
		}





	}
}
