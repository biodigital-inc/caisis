namespace Caisis.UI.Modules.Bone.Eforms
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
    ///		Summary description for DiagnosticsBMD.
	/// </summary>
    public partial class DiagnosticsBMD : BaseEFormControl
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            ListItem defaultIns = new ListItem();
            defaultIns.Value = CaisisConfiguration.GetWebConfigValue("institutionShortName");
            defaultIns.Text = CaisisConfiguration.GetWebConfigValue("institutionShortName");
            DxInstitutionDefaultBtn.Items.Add(defaultIns);
            
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            string[] searchFilter = new string[] { "BMD", "Bone Mineral Density" };
            BuildBMDDiagnostics(this._patientId, this._eformName, "Dynamic", Diagnostic.DxType, " IN ", searchFilter);

        }

        protected void BuildBMDDiagnostics(int PatientID, string FormName, string FormType, string searchField, string searchClause, string[] searchFilter)
        {
            DiagnosticDa bmdDa = new DiagnosticDa();
            DataTable bmdDt = bmdDa.GetDxImagesByType(PatientID, searchFilter);

            if (bmdDt.Rows.Count > 0)
            {
                NoDiagnostiMsgTr.Visible = false;
                DataTable parentDs = bmdDt.DefaultView.ToTable(true, Diagnostic.DiagnosticId, Diagnostic.DxDateText, Diagnostic.DxType, Diagnostic.DxResult, Diagnostic.DxInstitution);
                DataTable childDs = bmdDt;

                parentDs.TableName = "Diagnostic";
                childDs.TableName = "DiagnosticImageFindings";

                DataSet parentAndChildDs = new DataSet();
                parentAndChildDs.Tables.Add(parentDs.Copy());
                parentAndChildDs.Tables.Add(childDs.Copy());

                parentAndChildDs.Relations.Add("myrelation", parentAndChildDs.Tables["Diagnostic"].Columns[Diagnostic.DiagnosticId], parentAndChildDs.Tables["DiagnosticImageFindings"].Columns[Diagnostic.DiagnosticId]);


                BmdRptr.DataSource = parentAndChildDs.Tables["Diagnostic"].DefaultView;
                BmdRptr.DataBind();




            }
            else
                NoDiagnostiMsgTr.Visible = true;
        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            DataRowView dv = e.Item.DataItem as DataRowView;
            if (dv != null)
            {
                Repeater nestedRepeater = e.Item.FindControl("BmdChildRptr") as Repeater;
                if (nestedRepeater != null)
                {
                    nestedRepeater.DataSource = dv.CreateChildView("myrelation");
                    nestedRepeater.DataBind();
                }
            }
        }


}
}