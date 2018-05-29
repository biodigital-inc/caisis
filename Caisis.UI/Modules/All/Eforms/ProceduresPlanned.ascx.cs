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
    ///		Summary description for ProceduresPlanned.
	/// </summary>
    public partial class ProceduresPlanned : BaseEFormControl
    {

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildPlannedProcedures(this._patientId, this._eformName, "Dynamic");
        }


        protected void BuildPlannedProcedures(int PatientId, string FormName, string FormType)
        {
            ProcedureDa da = new ProcedureDa();
            DataSet ds;
            ds = da.FormGetRecords(PatientId, FormName, FormType);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataView dv = ds.Tables[0].DefaultView;
                dv.RowFilter = Procedure.ProcPending + " = " + true;
                rptPlannedProcedures.DataSource = dv;
                rptPlannedProcedures.DataBind();
            }

        }
    }
}

