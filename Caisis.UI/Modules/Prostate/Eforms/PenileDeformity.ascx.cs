namespace Caisis.UI.Modules.Prostate.Eforms
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

    using System.Collections.Generic;

    /// <summary>
    ///		Summary description for PenileDeformity
    /// </summary>
    public partial class PenileDeformity : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.BuildPastSurveys();
        }




        protected void BuildPastSurveys()
        {
                SurveyDa sDa = new SurveyDa();

                DataSet sDs = sDa.FormGetSurveysByType(this._patientId, this._eformName,"Dynamic", "Mulhall Penile Deformity Assessment");
                if (sDs != null && sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
                {
                    SurveyRpt.DataSource = sDs.Tables[0].DefaultView;
                    SurveyRpt.DataBind();
                }
        }






        protected void GetSurveyItems(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                SurveyDa sDa = new SurveyDa();
                DataTable sDt = sDa.GetSurveyItems((int)((DataRowView)e.Item.DataItem)["SurveyId"]);

                if (sDt != null && sDt.Rows.Count > 0)
                {
                    Literal Agent = (Literal)e.Item.FindControl("Agent");
                    Literal Dose = (Literal)e.Item.FindControl("Dose");
                    Literal PercErection = (Literal)e.Item.FindControl("PercErection");
                    Literal PrimaryDeformity = (Literal)e.Item.FindControl("PrimaryDeformity");
                    Literal SecondaryDeformity = (Literal)e.Item.FindControl("SecondaryDeformity");
                    Literal AssociatedDeformities = (Literal)e.Item.FindControl("AssociatedDeformities");
                    foreach (DataRow sDr in sDt.Rows)
                    {
                       if (sDr[BOL.SurveyItem.SurveyItem_Field].ToString() == "Agent" && Agent.Text.Length < 1) Agent.Text = sDr[BOL.SurveyItem.SurveyItemResult].ToString();
                       if (sDr[BOL.SurveyItem.SurveyItem_Field].ToString() == "Dose" && Dose.Text.Length < 1) Dose.Text = sDr[BOL.SurveyItem.SurveyItemResult].ToString();
                       if (sDr[BOL.SurveyItem.SurveyItem_Field].ToString() == "% Erection" && PercErection.Text.Length < 1) PercErection.Text = sDr[BOL.SurveyItem.SurveyItemResult].ToString();
                       if (sDr[BOL.SurveyItem.SurveyItem_Field].ToString() == "Primary Deformity" && PrimaryDeformity.Text.Length < 1) PrimaryDeformity.Text = sDr[BOL.SurveyItem.SurveyItemResult].ToString();
                       if (sDr[BOL.SurveyItem.SurveyItem_Field].ToString() == "Secondary Deformity" && SecondaryDeformity.Text.Length < 1) SecondaryDeformity.Text = sDr[BOL.SurveyItem.SurveyItemResult].ToString();
                       if (sDr[BOL.SurveyItem.SurveyItem_Field].ToString() == "Associated Deformities" && AssociatedDeformities.Text.Length < 1) AssociatedDeformities.Text = sDr[BOL.SurveyItem.SurveyItemResult].ToString();
                    }
                }
            }

        }

    }
}