namespace Caisis.UI.Modules.Bladder.Eforms
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
    public partial class AxillaProcedure : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);


            foreach (ListItem AxillaProcli in ProcName_Axilla.Items)
            {
                string AxillaProcstr = "showHideAxillaProc('" + AxillaProcli.Value + "','" + AbsentDateText_2.ClientID + "','" + AbsentDate_2.ClientID + "','" + TableName_2.ClientID + "', 'Procedures','" + FieldName_2.ClientID + "', 'ProcName','" + FieldValue_2.ClientID + "', 'Axilla Procedure','" + AbsentReason_2.ClientID + "', 'Not Performed','" + AbsentQuality_2.ClientID + "', 'STD');";

                AxillaProcli.Attributes.Add("onclick", AxillaProcstr);

                if (AxillaProcli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AxillaProcjScript", AxillaProcstr, true);
                }
            }
            
        }
	

	}
}
