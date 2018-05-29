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
    ///		Summary description for Thyroid Pathology Node Findings
    /// </summary>
    public partial class ThyroidNodeFindings : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            foreach (ListItem Nodeli in NodeFindings.Items)
            {
                string Nodestr = "NodeFindingsRadioClick('" + Nodeli.Value + "','" + NodeFindingsDiv.ClientID + "','" + AbsentDateText_4.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_4.ClientID + "', '" + System.DateTime.Now.ToString() + "','" + TableName_4.ClientID + "', 'NodePathFinding','" + FieldName_4.ClientID + "', 'PathNodeFindings','" + FieldValue_4.ClientID + "', 'Absent','" + AbsentReason_4.ClientID + "', 'Not Performed','" + AbsentQuality_4.ClientID + "', 'STD');";

                Nodeli.Attributes.Add("onclick", Nodestr);

                if (Nodeli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "NodejScript", Nodestr, true);
                }
            }
        }
    }
}
