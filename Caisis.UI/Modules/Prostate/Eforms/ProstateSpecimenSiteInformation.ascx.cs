namespace Caisis.UI.Modules.Prostate.Eforms
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
    using Caisis.Security;

	/// <summary>
    ///		Summary description for ProstateSpecimenSiteInformation.
    /// </summary
    public partial class ProstateSpecimenSiteInformation : BaseEFormControl
	{
        DataTable _contactDt = new DataTable();

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            ShowCreateSitePNL.Style.Add("display", "none");
            ShowExistingSitesPNL.Style.Remove("display");

            if (SpecimenCollectionSitesDDL.Items.Count == 0 || (SpecimenCollectionSitesDDL.Items.Count == 1 && SpecimenCollectionSitesDDL.Items[0].Value == String.Empty))
            {
                ShowSitesDIV.Style.Add("display", "none");
                NoSitesDIV.Style.Remove("display");
            }
            else
            {
                ShowSitesDIV.Style.Remove("display");
                NoSitesDIV.Style.Add("display", "none");
            }


            //UserDa uDa = new UserDa();
            //SecurityController sc = new SecurityController();
            //DataSet uDs = uDa.GetByUserName(sc.GetUserName());
            //DataView uDv = new DataView(uDs.Tables[0]);
            //if (uDv.Count > 0)
            //{
            //    HiddenUserID.Text = uDv[0][User.UserId].ToString();
            //}

            //// retrieve distinct proj org names
            //ProjectManagementDa pmDa = new ProjectManagementDa();
            //DataTable dt = pmDa.GetAllOrganizations();
            //DataView dv = new DataView(dt);

            //if (dv.Count > 0)
            //{
            //    ShowCreateSitePNL.Style.Add("display", "none");
            //    ShowExistingSitesPNL.Style.Remove("display");

            //    // populate distinct ddl organizaitons
            //    ListItem li = new ListItem("", "");
            //    SpecimenCollectionSitesDDL.Items.Add(li);

            //    foreach (DataRowView drv in dv)
            //    {
            //        li = new ListItem(drv[ProjectOrganization.Name].ToString(), drv[ProjectOrganization.Name].ToString());
            //        SpecimenCollectionSitesDDL.Items.Add(li);
            //    }
            //    SpecimenCollectionSitesDDL.DataBind();
            //}
            //else
            //{
            //    ShowCreateSitePNL.Style.Remove("display");
            //    ShowExistingSitesPNL.Style.Add("display", "none");
            //}
		}
	}
}
