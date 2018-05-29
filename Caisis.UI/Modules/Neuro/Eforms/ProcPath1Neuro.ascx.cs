namespace Caisis.UI.Modules.Neuro.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for Neuro Procedure & pathology record 1
    /// </summary>
    public partial class ProcPath1Neuro : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            GetProcedures();

            BuildDependentValues();
            
            PathDateText_1.Attributes.Add("onblur", "showPathTests(this,'" + PathHistology_1.ClientID + "','" + PathTestTable1.ClientID + "')");
            PathHistology_1.Attributes.Add("onblur", "showPathTests('" + PathDateText_1.ClientID + "',this,'" + PathTestTable1.ClientID + "')");

            PathDateText_2.Attributes.Add("onblur", "showPathTests(this,'" + PathHistology_2.ClientID + "','" + PathTestTable2.ClientID + "')");
            PathHistology_2.Attributes.Add("onblur", "showPathTests('" + PathDateText_2.ClientID + "',this,'" + PathTestTable2.ClientID + "')");

            PathDateText_3.Attributes.Add("onblur", "showPathTests(this,'" + PathHistology_3.ClientID + "','" + PathTestTable3.ClientID + "')");
            PathHistology_3.Attributes.Add("onblur", "showPathTests('" + PathDateText_3.ClientID + "',this,'" + PathTestTable3.ClientID + "')");

            //show pathtest tables
            if (!string.IsNullOrEmpty(PathDateText_1.Value.ToString()) || !string.IsNullOrEmpty(PathHistology_1.Value.ToString()))
            {
                PathTestTable1.Style.Add("display", "block");
            }

            if (!string.IsNullOrEmpty(PathDateText_2.Value.ToString()) || !string.IsNullOrEmpty(PathHistology_2.Value.ToString()))
            {
                PathTestTable2.Style.Add("display", "block");
            }
            if (!string.IsNullOrEmpty(PathDateText_3.Value.ToString()) || !string.IsNullOrEmpty(PathHistology_3.Value.ToString()))
            {
                PathTestTable3.Style.Add("display", "block");
            }

            DataView view = BusinessObject.GetByParentAsDataView<Status>(_patientId);
            if (view.Count >= 1)
            {
                for (int i = 0; i < view.Table.Rows.Count;i++)
                {
                    if (view.Table.Rows[i]["Status"].ToString() == "Alive" && view.Table.Rows[i]["StatusDisease"].ToString() == "Brain")
                    {
                        ProcAbsEvntDt.Value = view.Table.Rows[i]["StatusDateText"].ToString();
                        break;
                    }
                    else
                    {
                        ProcAbsEvntDt.Value = System.DateTime.Now.ToShortDateString();
                    }
                }
            }
            else
            {
                ProcAbsEvntDt.Value = System.DateTime.Now.ToShortDateString();
            }

        }

        protected void BuildDependentValues()
        {
            DataTable dt = CacheManager.GetLookupCodeList("PathHistologyNeuro");
            for (int i = 1; i <= 3; i++)
            {
                Control pathhistology = this.FindControl("PathHistology_" + i) as Control;
                Control pathgrade = this.FindControl("PathGrade_" + i) as Control;
                if (pathhistology != null && pathgrade != null)
                {
                    PageUtil.RegisterDependentFieldScript(Page, pathhistology, pathgrade, dt, LookupCode.LkpCode, LookupCode.LkpDescription, "HistologyToGrade");
                }
            }
        }

        protected void GetProcedures()
        {
            DataView view = BusinessObject.GetByParentAsDataView<Procedure>(_patientId);
            if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

                SpineProcRpt.DataSource = view;
                SpineProcRpt.DataBind();
            }
            else
            {
                NoSpineProcMsgTr.Style.Add("display", "block");
            }
        }
    }
}