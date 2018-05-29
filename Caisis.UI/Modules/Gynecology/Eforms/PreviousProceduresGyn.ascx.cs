namespace Caisis.UI.Modules.Gynecology.Eforms
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
    using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for PreviousProceduresGyn.
	/// </summary>
    public partial class PreviousProceduresGyn : BaseEFormControl
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            BuildSurgicalHistory(this._patientId, this._eformName, "Dynamic");
        }

        protected void BuildSurgicalHistory(int PatientID, string FormName, string FormType)
		{
            ProcedureDa procdedureDa = new ProcedureDa();
			DataSet ds;
            ds = procdedureDa.FormGetRecords(PatientID, FormName, FormType);

			if (ds.Tables[0].Rows.Count > 0)
			{
				rptSurgicalHistory.DataSource = ds.Tables[0].DefaultView;
				rptSurgicalHistory.DataBind();
			}

		}

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

        //    Literal ResultField;
        //    ResultField = (Literal)e.Item.FindControl("ResultField");

        //    if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
        //    {
        //        if (((DataRowView)e.Item.DataItem)[Procedure.ProcPrimary].ToString().Length > 0)
        //        {
        //            ResultField.Text = "Yes";

        //        }
        //        else                                        
        //            ResultField.Text = "No";

        //    }
        }

    }
}