namespace Caisis.UI.Modules.HeadNeck.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for SocialHistory.
    /// </summary>
    public partial class ThyroidSocialHist : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            SetSocHx();
        }

        protected void SetSocHx()
        {
			//SocialHistory socHxObj = new SocialHistory();
			//socHxObj.GetByParent(this._patientId);

			DataView view = BusinessObject.GetByParentAsDataView<SocialHistory>(this._patientId);

            //if (socHxObj.DataSourceView.Table.Rows.Count >= 1)
			if (view.Count >= 1)
            {
                //SocialHx.DataSource = socHxObj.DataSourceView;
				SocialHx.DataSource = view;
                SocialHx.DataBind();
            }
            else
            {
                emptySocHxRow.Visible = true;
            }
        }
    }
}
