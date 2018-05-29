namespace Caisis.UI.Modules.Prostate.Eforms
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


    /// <summary>
    ///		Summary description for ErectileFunction
    /// </summary>
    public partial class ErectileFunction : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            BuildErectileFunction();
        }

        protected void BuildErectileFunction()
        {
                SurveyDa sDa = new SurveyDa();

                DataSet sDs = sDa.FormGetSurveyErectileFunction(this._patientId);
                if (sDs != null && sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
                {
                    // fill in blank rows for medications when they are not populated only because the prescription hasn't changed
                    for (int j = 1; j < sDs.Tables[0].Rows.Count; j++)
                    {
                        try
                        {
                            // oral meds
                            if (sDs.Tables[0].Rows[j]["Oral Agent"] != null
                             && sDs.Tables[0].Rows[j]["Oral Agent"].ToString().Length < 1
                             && sDs.Tables[0].Rows[j]["Oral Dose"].ToString().Length < 1
                             && sDs.Tables[0].Rows[j]["Date"].ToString().Length > 1
                             && sDs.Tables[0].Rows[j - 1]["Date"].ToString().Length > 1
                             && sDs.Tables[0].Rows[j - 1]["Oral Agent"].ToString().Length > 0
                             && (sDs.Tables[0].Rows[j - 1]["Oral Agent Stop Date"].ToString().Length < 1
                                     || Convert.ToDateTime(sDs.Tables[0].Rows[j - 1]["Oral Agent Stop Date"].ToString()) > DateTime.Now
                                     || Convert.ToDateTime(sDs.Tables[0].Rows[j - 1]["Oral Agent Stop Date"].ToString()) > Convert.ToDateTime(sDs.Tables[0].Rows[j]["Date"].ToString()))

                               )
                            {
                                sDs.Tables[0].Rows[j]["Oral Agent"] = sDs.Tables[0].Rows[j - 1]["Oral Agent"];
                                sDs.Tables[0].Rows[j]["Oral Dose"] = sDs.Tables[0].Rows[j - 1]["Oral Dose"];
                            }
                        }
                        catch { }

                        try
                        {
                            // ICI meds
                            if (sDs.Tables[0].Rows[j]["ICI Agent"] != null
                             && sDs.Tables[0].Rows[j]["ICI Agent"].ToString().Length < 1
                             && sDs.Tables[0].Rows[j]["ICI Dose"].ToString().Length < 1
                             && sDs.Tables[0].Rows[j]["Date"].ToString().Length > 1
                             && sDs.Tables[0].Rows[j - 1]["Date"].ToString().Length > 1
                             && sDs.Tables[0].Rows[j - 1]["ICI Agent"].ToString().Length > 0
                             && (sDs.Tables[0].Rows[j - 1]["ICI Stop Date"].ToString().Length < 1
                                     || Convert.ToDateTime(sDs.Tables[0].Rows[j - 1]["ICI Stop Date"].ToString()) > DateTime.Now
                                     || Convert.ToDateTime(sDs.Tables[0].Rows[j - 1]["ICI Stop Date"].ToString()) > Convert.ToDateTime(sDs.Tables[0].Rows[j]["Date"].ToString()))

                               )
                            {
                                sDs.Tables[0].Rows[j]["ICI Agent"] = sDs.Tables[0].Rows[j - 1]["ICI Agent"];
                                sDs.Tables[0].Rows[j]["ICI Dose"] = sDs.Tables[0].Rows[j - 1]["ICI Dose"];
                            }
                        }
                        catch { }
                    }
                    // original way                    
                    erectileFunction.DataSource = sDs.Tables[0].DefaultView;                    
                }
            erectileFunction.DataBind();
        }
    }
}