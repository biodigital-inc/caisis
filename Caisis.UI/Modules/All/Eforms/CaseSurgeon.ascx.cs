namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core;
	using Caisis.DataAccess;
	using Caisis.Security;
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
	///	Displays drop down list populated with users who have permission to "Approve Eforms".
	/// </summary>
	public partial class CaseSurgeon : BaseEFormControl
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
     //       populateCaseSurgeonField();

			base.Page_Load(sender, e);


            string Surgeon = "";
            if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
            { 
                Surgeon = Session[SessionKey.CurrentListCrit].ToString(); 
            }
            if (Surgeon.Length > 0 && string.IsNullOrEmpty(CaseSurgeonField.Value))
            {
                if (Surgeon.IndexOf(",") > -1)
                {
                    Surgeon = Surgeon.Remove(Surgeon.IndexOf(","));
                }
                CaseSurgeonField.Value = Surgeon;
            }

		}


 /*       protected void populateCaseSurgeonField()
        {

            int datasetId = int.Parse(Session[SessionKey.DatasetId].ToString());

            UserDa da = new UserDa();
            DataSet ds = da.GetUsersWithPermission(datasetId, PermissionManager.EFormApprove);


            CaseSurgeonField.DataSource = ds;
            CaseSurgeonField.DataTextField = "UserLastFirst";
            CaseSurgeonField.DataValueField = "UserLastFirst";
            CaseSurgeonField.DataBind();
            CaseSurgeonField.Items.Insert(0, new ListItem(""));
            CaseSurgeonField.EnableViewState = false;

        }
*/
	}
}
