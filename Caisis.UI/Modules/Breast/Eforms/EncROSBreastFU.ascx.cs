namespace Caisis.UI.Modules.Breast.Eforms
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
    ///		Summary description for Patient Complaints for Breast eform.
    /// </summary>
    public partial class EncROSBreastFU : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            foreach (ListItem ComplaintsYesNoli in ComplaintsYesNo.Items)
            {
                string ComplaintsYesNostr = "ShowHidePtComplaintsTR('" + ComplaintsYesNoli.Value + "');";

                ComplaintsYesNoli.Attributes.Add("onclick", ComplaintsYesNostr);

                if (ComplaintsYesNoli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ComplaintsYesNojScript", ComplaintsYesNostr, true);
                }
            }
        }
    }
}
