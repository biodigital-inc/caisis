namespace Caisis.UI.Modules.Prostate.PaperForms
{
	using System;
	using System.Data;
	using System.Collections;
	using System.Web;
	using System.Web.UI;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	
	using Caisis.DataAccess;

	using System.Data.SqlClient;

	using System.Configuration;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for GUProsNP.
	/// </summary>
    public partial class PrintingTest : BasePaperFormControl
	{







		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);


		}

	
		
		override protected void SetFormInfo()  
		{
			this._formName = "PrintingTest";
			this._formTitle = "Printing Test";
		}






	}
}
