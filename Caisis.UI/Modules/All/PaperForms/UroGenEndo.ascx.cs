namespace Caisis.UI.Modules.All.PaperForms
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
	///		Summary description for UroBladFU.
	/// </summary>
	public partial class UroGenEndo : BasePaperFormControl
	{


		protected static int NumHpiRowsAllowed = 8;

		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

            BuildAllergies();
//            LoadHomeMedicationList();

		}



		override protected void SetFormInfo()  
		{
			this._formName = "UroGenEndo";
			this._formTitle = "General Urology Endoscopy";
		}




	}
}
