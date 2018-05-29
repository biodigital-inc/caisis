namespace Caisis.UI.Modules.Kidney.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroUTUrNP.
	/// </summary>
	public partial class UroUTUrNP : BasePaperFormControl
	{

        override protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
 //           LoadHomeMedicationList();
        }

		override protected void SetFormInfo()  
		{
			this._formName = "UroUTUrNP";
			this._formTitle = "Urology Upper Tract Urothelial New Patient";
		}




	}
}
