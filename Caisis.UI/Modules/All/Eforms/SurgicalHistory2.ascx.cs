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
	using Caisis.DataAccess;

	using System.Security.Permissions;



	/// <summary>
    ///		Summary description for SurgicalHistory2.
	/// </summary>
    public partial class SurgicalHistory2 : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildSurgicalHistory(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
        }


        protected void BuildSurgicalHistory(int PatientId, string FormName, string FormType)
        {
            ProcedureDa da = new ProcedureDa();
            DataSet ds = da.FormGetRecords(PatientId, FormName, FormType);
            DataView dv = new DataView(ds.Tables[0]);
            dv.RowFilter = Procedure.ProcPending + " IS NULL OR " + Procedure.ProcPending + " = " + false;
            DataTable dt = dv.ToTable();
            if (dt.Rows.Count > 0)
            {
                rptSurgicalHistory.DataSource = dt.DefaultView;
                rptSurgicalHistory.DataBind();

                NoSurgicalHistoryMsgTr.Visible = false;
            }

        }

	}
}
