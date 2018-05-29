namespace Caisis.UI.Modules.Neuro.Eforms
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
    ///		Summary description for Spine Diagnosis - Primary or Metastatic
    /// </summary>
    public partial class SpineDiagnosis : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
           base.Page_Load(sender, e);

           if (!string.IsNullOrEmpty(StatusDisease_1.Value) && StatusDisease_1.Value != "Spine")
           {
               statusPrimDiagnosisLbl4.Style.Add("display", "block");
               StatusPrimDiagnosisCol4.Style.Add("display", "block");
           }

           if (!string.IsNullOrEmpty(StatusDisease_2.Value) && StatusDisease_2.Value != "Spine")
           {
               statusPrimDiagnosisLbl5.Style.Add("display", "block");
               StatusPrimDiagnosisCol5.Style.Add("display", "block");
           }

           if (!string.IsNullOrEmpty(StatusDisease_3.Value) && StatusDisease_3.Value != "Spine")
           {
               statusPrimDiagnosisLbl6.Style.Add("display", "block");
               StatusPrimDiagnosisCol6.Style.Add("display", "block");
           }

           if (!string.IsNullOrEmpty(PathHistology_2.Value) || !string.IsNullOrEmpty(Status_2.Value))
           {
               SpinePrimDiagTr2.Style.Add("display", "block");
           }
           if (!string.IsNullOrEmpty(PathHistology_3.Value) || !string.IsNullOrEmpty(Status_3.Value))
           {
               SpinePrimDiagTr3.Style.Add("display", "block");
           }
           if (!string.IsNullOrEmpty(PathHistology_5.Value) || !string.IsNullOrEmpty(Status_5.Value))
           {
               SpineMetsDiagTr2.Style.Add("display", "block");
           }
           if (!string.IsNullOrEmpty(PathHistology_6.Value) || !string.IsNullOrEmpty(Status_6.Value))
           {
               SpineMetsDiagTr3.Style.Add("display", "block");
           }

           GetPath(_patientId,_eformName,"Dynamic");
           GetStatus();
        }

        protected void GetPath(int PatientID, string FormName, string FormType)
        {
            DataSet PathDS, PathTestDS, PathGradeDS;
            PathologyDa PathDa = new PathologyDa();
            PathDS = PathDa.FormGetRecords(PatientID, FormName, FormType);
            PathTestDS = PathDa.FormGetPathTestRecords(PatientID, FormName, FormType);
            PathGradeDS = PathDa.FormGetPathGradeRecords(PatientID, FormName, FormType);

            if (PathDS.Tables.Count > 0)
            {
                PathDS.Tables[0].TableName = "Pathology";
                PathTestDS.Tables[0].TableName = "PathTest";
                PathGradeDS.Tables[0].TableName = "PathologyStageGrade";

                DataSet PathologyCoreDs = new DataSet();
                PathologyCoreDs.Tables.Add(PathDS.Tables[0].Copy());
                PathologyCoreDs.Tables.Add(PathTestDS.Tables[0].Copy());
                PathologyCoreDs.Tables.Add(PathGradeDS.Tables[0].Copy());

                PathologyCoreDs.Relations.Add("myRelation", PathologyCoreDs.Tables["Pathology"].Columns[Pathology.PathologyId], PathologyCoreDs.Tables["PathTest"].Columns[PathologyTest.PathologyId]);

                PathologyCoreDs.Relations.Add("myPathGradeRelation", PathologyCoreDs.Tables["Pathology"].Columns[Pathology.PathologyId], PathologyCoreDs.Tables["PathologyStageGrade"].Columns[Pathology.PathologyId]);

                SpinePathRpt.DataSource = PathologyCoreDs.Tables["Pathology"].DefaultView;
                SpinePathRpt.DataBind();
            }
            else
            {
                NoSpinePathMsgTr.Style.Add("display", "block");
            }
        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            DataRowView dv = e.Item.DataItem as DataRowView;
            if (dv != null)
            {
                Repeater nestedPathTestRpt = e.Item.FindControl("SpinePathTestsRpt") as Repeater;
                if (nestedPathTestRpt != null)
                {
                    nestedPathTestRpt.DataSource = dv.CreateChildView("myRelation");
                    nestedPathTestRpt.DataBind();
                }

                Repeater nestedPathGradeRpt = e.Item.FindControl("SpinePathGradeRpt") as Repeater;
                if (nestedPathGradeRpt != null)
                {
                    nestedPathGradeRpt.DataSource = dv.CreateChildView("myPathGradeRelation");
                    nestedPathGradeRpt.DataBind();
                }
            }
        }

        protected void GetStatus()
        {
            StatusDa da = new StatusDa();
            DataSet ds = da.GetStatusField(_patientId, "Diagnosis Date");
            DataView view = ds.Tables[0].DefaultView;
            if (view.Count >= 1)
            {
                SpineStatusRpt.DataSource = view;
                SpineStatusRpt.DataBind();
            }
            else
            {
                NoSpineStatusMsgTr.Style.Add("display", "block");
            }
        }
    }
}