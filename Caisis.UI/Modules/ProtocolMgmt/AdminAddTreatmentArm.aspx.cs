using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminAddTreatmentArm : ProtocolMgmtBaseAdminPage
    {
        private DataTable dtTreatmentArms;

        private string QueryVersionId
        {
            get
            {
                return Request.QueryString["prvr"];
            }
        }

        protected void GetTreatmentArms()
        {
            dtTreatmentArms = ProtocolMgmtDa.GetSchemasByProtocol(Int32.Parse(BaseProtocolId));
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTreatmentArms();

                DataView armList = BusinessObject.GetByParentAsDataView<ProtocolVersion>(int.Parse(BaseProtocolId));
                ArmsListRptr.DataSource = armList;
                ArmsListRptr.DataBind();
                // copy schema radio only enabled when existing schemas exist
                CopySchemaRB.Enabled = armList.Count > 0;
                
            }
        }

        protected void CopyArm(object sender, CommandEventArgs e)
        {
            int schemaId;
            int versionId;
            if (int.TryParse(e.CommandArgument.ToString(), out schemaId) && int.TryParse(QueryVersionId, out versionId))
            {
                int? copiedSchema = ProtocolMgmtController.CopyProtocolSchema(schemaId);
                if (copiedSchema.HasValue)
                {
                    // after creating copied schema, update verion id
                    ProtocolSchema biz = new ProtocolSchema();
                    biz.Get(copiedSchema.Value);
                    biz[ProtocolSchema.ProtocolVersionId] = versionId;
                    biz.Save();

                    // adter copying schema, go to edit schema page
                    string nextURL = GetQueryStringBySchema(copiedSchema);
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "GoToSchemaPage", "parent.reloadTreatmentArms(); parent.editSchema('" + nextURL + "');", true);
                }
            }
        }

        protected string GetQueryStringBySchema(object SchemaId)
        {
            string strUrl = GetQueryString("AdminSchema.aspx", BaseProtocolId, SchemaId.ToString(), BaseDecryptedPatientId, false);
            strUrl += "&prvr=" + QueryVersionId;
            return strUrl;
        }

        protected void PopulateTreatmentArms(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string versionId = DataBinder.Eval(e.Item.DataItem, ProtocolVersion.ProtocolVersionId).ToString();
                DataView dvTreatmentArms = dtTreatmentArms.DefaultView;
                dvTreatmentArms.RowFilter = ProtocolVersion.ProtocolVersionId + " = " + versionId;

                Repeater treatmentRepeater = e.Item.FindControl("ArmsListRptrInner") as Repeater;
                if (treatmentRepeater != null)
                {
                    treatmentRepeater.DataSource = dvTreatmentArms;
                    treatmentRepeater.DataBind();
                }
            }
        }
    }
}