namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for PatientsSocialHistories.
	/// </summary>
    public partial class PatientsSocialHistories : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            BuildSocialHistory(this._patientId, this._eformName, "Dynamic");
		}

        protected void BuildSocialHistory(int PatientID, string FormName, string FormType)
        {
            DataSet socialHxDs;
            SocialHistoryDa shDa = new SocialHistoryDa();
            socialHxDs = shDa.FormGetRecords(PatientID, FormName, FormType);

            if (socialHxDs.Tables.Count > 0 && socialHxDs.Tables[0].Rows.Count > 0)
            {
                NoSocialHxMsgTr.Visible = false;
                SocialHxMsgTr.Visible = true;
                rowHasHx1.DataSource = socialHxDs.Tables[0].DefaultView;
                rowHasHx1.DataBind();
                rowHasHx2.DataSource = socialHxDs.Tables[0].DefaultView;
                rowHasHx2.DataBind();
                rowHasHx3.DataSource = socialHxDs.Tables[0].DefaultView;
                rowHasHx3.DataBind();

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
                rowNoHx2.Visible = false;
                rowNoHx3.Visible = false;
            }
        }

	}
}
