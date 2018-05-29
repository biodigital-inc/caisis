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
    using Caisis.UI.Core.Classes.CustomControls;

    /// <summary>
    ///		Summary description for Surgery FU biopsies
    /// </summary>
    public partial class BiopsiesBreastFU : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);


            foreach (ListItem BxDoneli in BxDone.Items)
            {
                string BxDonestr = "ShowHideBxTR('" + BxDoneli.Value + "');";

                BxDoneli.Attributes.Add("onclick", BxDonestr);

                if (BxDoneli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BxDonejScript", BxDonestr, true);
                }
            }
        }
    }
}