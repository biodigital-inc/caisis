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
	///		Summary description for UroILVEndo:  Form used to document Intralesional Verapamil Injections for Sexual Function.
	/// </summary>
	public partial class UroILVEndo : BasePaperFormControl
	{


		protected static int NumHpiRowsAllowed = 8;

		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

//			BuildAllergies();

		}



		override protected void SetFormInfo()  
		{
			this._formName = "UroILVEndo";
			this._formTitle = "Intralesional Verapamil Injections";
		}



		override protected void OnInit(System.EventArgs e)
		{
			IsOnePageForm = true;
			base.OnInit(e);
		}



	}
}
