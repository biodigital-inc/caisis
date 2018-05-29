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
    public partial class ColorectalResection : BaseEFormControl
	{

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            foreach (ListItem item in PathInstitution.Items)
            {
                if (item.Value == "STD")
                {
                    item.Text = CaisisConfiguration.GetWebConfigValue("institutionShortName");
                    item.Value = CaisisConfiguration.GetWebConfigValue("institutionShortName");
                }
            }

            foreach (ListItem item in PathQuality.Items)
            {
                if (item.Value == "STD")
                {
                    item.Text = CaisisConfiguration.GetWebConfigValue("institutionShortName");
                    item.Value = CaisisConfiguration.GetWebConfigValue("institutionShortName");

                }
            }


        }
	}
}
