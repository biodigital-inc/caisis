namespace Caisis.UI.Modules.Bladder.Eforms
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
	///		Summary description for ChiefComplaint.
	/// </summary>
    public partial class GynSocialHistory : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            GetGynSocHx();
        }

        protected void GetGynSocHx()
        {
            DataView view = BusinessObject.GetByParentAsDataView<SocialHistory>(_patientId);
            if (view.Count >= 1)
            {
                rowHasHx1.DataSource = view;
                rowHasHx1.DataBind();
            }
            else
            {
                NoSocialHxMsgTr.Visible = true;
                SocialHxMsgTr.Visible = false;
            }
        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {
                rowNoHx1.Visible = false;
            }
        }
	}
}
