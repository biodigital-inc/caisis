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
	///		Summary description for UroUrinFunc.
	/// </summary>
	public partial class UroUrinFuncFU : BasePaperFormControl
	{


		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);


//			this.BuildReferringMD();
			//this.BuildMedications();
			this.BuildAllergies();
			this.BuildComorbidities();
			this.BuildImages(4,1);
            this.BuildLabTests(3,0);
//			this.BuildLateComplications();
//			this.BuildLabTestsDiagram();
            //			LastStatus.Text = GetLastStatus();
//            LoadHomeMedicationList();

		}





		override protected void SetFormInfo()  
		{
			this._formName = "UroUrinFuncFU";
			this._formTitle = "Urology Urinary Function Follow-Up";
		}




	}
}
