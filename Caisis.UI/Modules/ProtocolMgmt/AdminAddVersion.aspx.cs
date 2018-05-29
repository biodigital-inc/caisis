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
    public partial class AdminAddVersion : ProtocolMgmtBaseAdminPage
    {
        private DataView allVersions;
        private DataView allVersionArms;        

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BuildLists();
                BuildProtocolVersions();
            }
        }

        /// <summary>
        /// Init data sources
        /// </summary>
        private void BuildLists()
        {
            int protocolId = int.Parse(BaseProtocolId);
            allVersions = BusinessObject.GetByParentAsDataView<ProtocolVersion>(protocolId);
            allVersionArms = ProtocolMgmtDa.GetSchemasByProtocol(protocolId).DefaultView;
        }

        /// <summary>
        /// Build a list of verions
        /// </summary>
        private void BuildProtocolVersions()
        {
            ArmsListRptr.DataSource = allVersions;
            ArmsListRptr.DataBind();
        }

        /// <summary>
        /// For each version, build list of schemas
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PopulateTreatmentArms(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater treatmentRepeater = e.Item.FindControl("ArmsListRptrInner") as Repeater;
                Label noSchemaText = e.Item.FindControl("NoSchemasText") as Label;
                if (treatmentRepeater != null)
                {
                    // filter out schemas which belong to current version
                    string versionId = DataBinder.Eval(e.Item.DataItem, ProtocolVersion.ProtocolVersionId).ToString();
                    allVersionArms.RowFilter = ProtocolVersion.ProtocolVersionId + " = " + versionId;

                    treatmentRepeater.DataSource = allVersionArms;
                    treatmentRepeater.DataBind();

                    // show no arms text if needed
                    noSchemaText.Visible = allVersionArms.Count == 0;
                }
            }
        }

    }
}