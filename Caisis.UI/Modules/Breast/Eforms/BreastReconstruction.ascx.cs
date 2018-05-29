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
    public partial class BreastReconstruction : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);



            foreach (ListItem BreastReconProcli in ProcName_BreastRecon.Items)
            {
                string BreastReconProcstr = "showHideBreastReconProc('" + BreastReconProcli.Value + "','" + AbsentDateText_3.ClientID + "','" + AbsentDate_3.ClientID + "','" + TableName_3.ClientID + "', 'Procedures','" + FieldName_3.ClientID + "', 'ProcName','" + FieldValue_3.ClientID + "', 'Breast Reconstruction','" + AbsentReason_3.ClientID + "', 'Not Performed','" + AbsentQuality_3.ClientID + "', 'STD');";

                BreastReconProcli.Attributes.Add("onclick", BreastReconProcstr);

                if (BreastReconProcli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BreastReconProcjScript", BreastReconProcstr, true);
                }
            }
            
        }
	

	}
}
