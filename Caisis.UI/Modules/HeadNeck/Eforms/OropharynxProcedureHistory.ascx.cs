namespace Caisis.UI.Modules.HeadNeck.Eforms
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
    ///		Summary description for OropharynxProcedureHistory.
	/// </summary>
    public partial class OropharynxProcedureHistory : BaseEFormControl
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            BuildSurgicalHistory(this._patientId, this._eformName, "Dynamic");
            
        }

        protected void BuildSurgicalHistory(int PatientID, string FormName, string FormType)
		{
            DataSet procDs, procpathDs;
            ProcedureDa procdedureDa = new ProcedureDa();
            procDs = procdedureDa.FormGetRecords(PatientID, FormName, FormType);
            procpathDs = procdedureDa.FormGetProcPathRecords(PatientID, FormName, FormType);
            if (procDs.Tables.Count > 0 && procDs.Tables[0].Rows.Count > 0)
            {
                NoProcedureHistoryMsgTr.Visible = false;

                procDs.Tables[0].TableName = "ProcHistory";
                procpathDs.Tables[0].TableName = "ProcPathHistory";

                DataSet procpathDs2 = new DataSet();
                procpathDs2.Tables.Add(procDs.Tables[0].Copy());
                procpathDs2.Tables.Add(procpathDs.Tables[0].Copy());

                procpathDs2.Relations.Add("myrelation", procpathDs2.Tables["ProcHistory"].Columns[Procedure.ProcedureId], procpathDs2.Tables["ProcPathHistory"].Columns[Procedure.ProcedureId]);

                rptSurgicalHistory.DataSource = procpathDs2.Tables["ProcPathHistory"].DefaultView;
                rptSurgicalHistory.DataBind();
            }

		}

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            Literal ResultField;
            ResultField = (Literal)e.Item.FindControl("ResultField");

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {
                if (((DataRowView)e.Item.DataItem)[Procedure.ProcPrimary].ToString().Length > 0)
                {
                    ResultField.Text = "Yes";

                }
                else                                        
                    ResultField.Text = "No";

            }
        }
    }
}