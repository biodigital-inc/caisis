namespace Caisis.UI.Modules.HeadNeck.EForms
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

    public partial class ThyroidRadiationTherapy : BaseEFormControl
    {
        override protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.BuildXRT(this._patientId, "", "Dynamic");
            SetSocHx();

            SetRadtxTarget();
        }

        protected void SetRadtxTarget()
        {
            GetRadtxTarget(RadTxType_1, RadTxTarget_1, RadTxQuality_1);
            GetRadtxTarget(RadTxType_2, RadTxTarget_2, RadTxQuality_2);
            GetRadtxTarget(RadTxType_3, RadTxTarget_3, RadTxQuality_3);
            GetRadtxTarget(RadTxType_4, RadTxTarget_4, RadTxQuality_4);
            GetRadtxTarget(RadTxType_5, RadTxTarget_5, RadTxQuality_5);
            GetRadtxTarget(RadTxType_6, RadTxTarget_6, RadTxQuality_6);
            GetRadtxTarget(RadTxType_7, RadTxTarget_7, RadTxQuality_7);
            GetRadtxTarget(RadTxType_8, RadTxTarget_8, RadTxQuality_8);
            GetRadtxTarget(RadTxType_9, RadTxTarget_9, RadTxQuality_9);
            GetRadtxTarget(RadTxType_10, RadTxTarget_10, RadTxQuality_10);
        }

        protected void GetRadtxTarget(EformDropDownList RadType, EformTextBox RadTargetTxt, EformTextBox RadQltyTxt)
        {
            RadType.Attributes.Add("onblur", "updateRadTxTarget('" + RadTargetTxt.ClientID + "','" + RadQltyTxt.ClientID + "');");
        }

        protected void SetSocHx()
        {
			//SocialHistory socHxObj = new SocialHistory();
			//socHxObj.GetByParent(this._patientId);

			DataView view = BusinessObject.GetByParentAsDataView<SocialHistory>(_patientId);

            //if (socHxObj.DataSourceView.Table.Rows.Count >= 1)
			if (view.Count >= 1)
            {
                //SocialHx.DataSource = socHxObj.DataSourceView;
				SocialHx.DataSource = view;
                SocialHx.DataBind();
            }
            else
            {
                emptyCarcinogenRow.Visible = true;
            }
        }
    }
}
