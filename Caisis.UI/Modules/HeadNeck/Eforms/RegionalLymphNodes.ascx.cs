namespace Caisis.UI.Modules.HeadNeck.Eforms
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
    public partial class RegionalLymphNodes : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            CentralCompartmentNodeClientIds.Text = "'" + ProcFindSubsite_RLN_1.ClientID + "','" + ProcFindSubsite_RLN_2.ClientID + "','" + ProcFindSubsite_RLN_3.ClientID + "','" + ProcFindSubsite_RLN_4.ClientID + "','" + ProcFindSubsite_RLN_5.ClientID + "','" + ProcFindSubsite_RLN_6.ClientID + "','" + ProcFindSubsite_RLN_7.ClientID + "','" + ProcFindSubsite_RLN_8.ClientID + "'";

            LateralNeckNodeClientIds.Text = "'" + ProcFindSite_NN_1.ClientID + "','" + ProcFindSite_NN_2.ClientID + "','" + ProcFindSite_NN_3.ClientID + "','" + ProcFindSite_NN_4.ClientID + "','" + ProcFindSite_NN_5.ClientID + "','" + ProcFindSite_NN_6.ClientID + "','" + ProcFindSite_NN_7.ClientID + "','" + ProcFindSite_NN_8.ClientID + "','" + ProcFindSite_NN_9.ClientID + "','" + ProcFindSite_NN_10.ClientID + "'";


            CentralCompartmentNoneId.Text = PalpableCentralCompartmentNodesNone.ClientID;
            LateralNeckNoneId.Text = PalpableLateralNeckNodesNone.ClientID;






        }
	
        
	}
}
