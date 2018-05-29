namespace Caisis.UI.Modules.Colorectal.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	using Caisis.DataAccess;

	/// <summary>
	///		Summary description for ChiefComplaint.
	/// </summary>
    public partial class ColorectalBiopsy : BaseEFormControl
	{

        //  this code was intended to populate the Path Date with the same value as ProcDate, but they have different meanings so leave out for now.
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            //if (PathDateText.ClientID != null) PathDateTextID.Text = PathDateText.ClientID;
            //if (PathDate.ClientID != null) PathDateID.Text = PathDate.ClientID;

            foreach (ListItem bxSite in BxSiteSelect.Items)
            {
                string siteStr = "siteSelectClick('" + bxSite.Value + "');";

                bxSite.Attributes.Add("onclick", siteStr);

                if (bxSite.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "sitejScript", siteStr, true);
                }
            }

            if (string.IsNullOrEmpty(EncChiefComplaint.Value) && string.IsNullOrEmpty(EncNotes.Value))
            {
                EncChiefComplaint.Value = DisExtent.Value + ", " + ColoPathType.Value;
                EncNotes.Value = DisSite.Value;
            }
            else
            {
                DisExtent.Value = "";
                ColoPathType.Value = "";
                DisSite.Value = "";
            }
        }
	}
}
