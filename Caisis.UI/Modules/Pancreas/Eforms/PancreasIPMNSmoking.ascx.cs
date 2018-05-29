namespace Caisis.UI.Modules.Pancreas.Eforms
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

    public partial class PancreasIPMNSmoking: BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildSocialHistory(this._patientId, this._eformName, "Dynamic");

        }


        protected void BuildSocialHistory(int PatientID, string FormName, string FormType)
        {
            DataSet socialHxDs;
            SocialHistoryDa shDa = new SocialHistoryDa();
            socialHxDs = shDa.FormGetRecords(PatientID, FormName, FormType);

            if (socialHxDs.Tables.Count > 0 && socialHxDs.Tables[0].Rows.Count > 0)
            {
                NewSocialHx.Visible = false;
                PrevSocialHx.DataSource = socialHxDs.Tables[0].DefaultView;
                PrevSocialHx.DataBind();
                ComponentTitle.Visible = true;
            }
            else
            {
                NewSocialHx.Visible = true;
                PrevSocialHx.Visible = false;
            }
        }
    }

}


