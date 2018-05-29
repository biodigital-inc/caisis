namespace Caisis.UI.Modules.Gynecology.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for GYN OR details
    /// </summary>
    public partial class ORGynEdit : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            GetGynOR();

            GetProcedures(this._patientId, this._eformName, "Dynamic");

            GetGynPathology(this._patientId, this._eformName, "Dynamic");
        }

        protected void GetGynOR()
        {
            DataView view = BusinessObject.GetByParentAsDataView<OperatingRoomDetail>(_patientId);
            if (view.Count >= 1)
            {
                GynORRpt.DataSource = view;
                GynORRpt.DataBind();
                AssoProcYesNoTR.Style.Add("display", "block");
            }
            else
            {
                NoGynORMsgTr.Style.Add("display", "block");
                PrevGynORRptHdr.Visible = false;
                AssoProcYesNoTR.Style.Add("display", "none");

            }
        }

        protected void GetProcedures(int PatientID, string FormName, string FormType)
        {
            DataSet ProcDs, ProcAsstDs;
            ProcedureDa ProcDa = new ProcedureDa();
            ProcDs = ProcDa.FormGetRecords(PatientID, FormName, FormType);
            ProcAsstDs = ProcDa.FormGetProcAssistantRecords(PatientID, FormName, FormType);

            if (ProcDs.Tables.Count > 0 && ProcDs.Tables[0].Rows.Count > 0)
            {
                NoGynProcMsgTr2.Visible = false;

                ProcDs.Tables[0].TableName = "Procedures";
                ProcAsstDs.Tables[0].TableName = "ProcedureAssistants";

                DataSet ProcAsstCoreDs = new DataSet();
                ProcAsstCoreDs.Tables.Add(ProcDs.Tables[0].Copy());
                ProcAsstCoreDs.Tables.Add(ProcAsstDs.Tables[0].Copy());

                ProcAsstCoreDs.Relations.Add("myrelation", ProcAsstCoreDs.Tables["Procedures"].Columns[Procedure.ProcedureId], ProcAsstCoreDs.Tables["ProcedureAssistants"].Columns[Procedure.ProcedureId]);

                
                GynProcRpt2.DataSource = ProcAsstCoreDs.Tables["Procedures"].DefaultView;
                GynProcRpt2.DataBind();
            }
            else
            {
                NoGynProcMsgTr2.Visible = true;
            }

        }

        protected void GetGynPathology(int PatientID, string FormName, string FormType)
        {
            DataSet PathDs, PathFindDs;
            PathologyDa PathDa = new PathologyDa();
            PathDs = PathDa.FormGetPathAndORDetails(PatientID, FormName, FormType);
            PathFindDs = PathDa.FormGetPathFindingRecords(PatientID, FormName, FormType);

            if (PathDs.Tables.Count > 0 && PathDs.Tables[0].Rows.Count > 0)
            {
                NoGynPathologyMsgTr2.Visible=false;

                PathDs.Tables[0].TableName = "Pathology";
                PathFindDs.Tables[0].TableName = "PathologyFinding";

                DataSet PathFindCoreDs = new DataSet();
                PathFindCoreDs.Tables.Add(PathDs.Tables[0].Copy());
                PathFindCoreDs.Tables.Add(PathFindDs.Tables[0].Copy());

                PathFindCoreDs.Relations.Add("myPathFindRelation", PathFindCoreDs.Tables["Pathology"].Columns[Pathology.PathologyId], PathFindCoreDs.Tables["PathologyFinding"].Columns[Pathology.PathologyId]);

                GynPathologyRpt2.DataSource = PathFindCoreDs.Tables["Pathology"].DefaultView;
                GynPathologyRpt2.DataBind();
            }
            else
            {
                NoGynPathologyMsgTr2.Style.Add("display", "block");
                PrevGynPathologyRptHdr2.Visible = false;
            }
        }



        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            DataRowView dv = e.Item.DataItem as DataRowView;
            if (dv != null)
            {
                Repeater nestedRepeater2 = e.Item.FindControl("GynProcAsstRpt2") as Repeater;
                if (nestedRepeater2 != null)
                {
                    nestedRepeater2.DataSource = dv.CreateChildView("myrelation");
                    nestedRepeater2.DataBind();
                }


                Repeater pathfindNestedRpt2 = e.Item.FindControl("GynPathFindingsRpt2") as Repeater;
                if (pathfindNestedRpt2 != null)
                {
                    pathfindNestedRpt2.DataSource = dv.CreateChildView("myPathFindRelation");
                    pathfindNestedRpt2.DataBind();
                }
            }
        }
    }
}