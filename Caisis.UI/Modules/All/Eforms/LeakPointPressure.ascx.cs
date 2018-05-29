namespace Caisis.UI.Modules.All.Eforms
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
    ///		Summary description for LeakPointPressure.
	/// </summary>
    public partial class LeakPointPressure : BaseEFormControl
	{

		protected override void Page_Load(object sender, EventArgs e)
		{
			base.Page_Load (sender, e);

            foreach (ListItem Result in SurveyItemResult_54.Items)
            {
                string jsStr = "showHideLeakPointPressure(this.value);";

                Result.Attributes.Add("onclick", jsStr);

                if (Result.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "LPPscript", "showHideLeakPointPressure('" + Result.Value + "');", true);
                }
            }
			
		}


	}
}
