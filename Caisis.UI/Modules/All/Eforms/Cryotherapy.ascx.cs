namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;


	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	using System.Security.Permissions;



	/// <summary>
    ///		Summary description for Cryotherapy.
	/// </summary>
    public partial class Cryotherapy : BaseEFormControl
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
			BuildCryotherapy();
		}


        protected void BuildCryotherapy()
		{
            ProcedureDa da = new ProcedureDa();
            DataSet ds = da.FormGetSpecialRecords(this._patientId, this._eformName, "Dynamic", Procedure.ProcName, "LIKE", "'%CRYO%'");


			if (ds.Tables[0].Rows.Count > 0)
			{
				rptCryo.DataSource = ds.Tables[0].DefaultView;
				rptCryo.DataBind();
			}

		}




	}
}
