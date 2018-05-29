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

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminTreatmentInfo : ProtocolMgmtBaseAdminPage
    {

        private bool formDirty = false;

        protected int ProtocolVersionId
        {
            get
            {
                string protocolVersionId = Request["prvr"];

                if (!String.IsNullOrEmpty(protocolVersionId))
                {
                    int prvr = -1;

                    if (Int32.TryParse(protocolVersionId, out prvr))
                    {
                        return prvr;
                    }
                }

                return -1;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private bool IsNew
        {
            get
            {
                return String.IsNullOrEmpty(BaseSchemaId) || BaseSchemaId == "-1";
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsNew)
                {
                    ProtocolSchema biz = new ProtocolSchema();
                    biz.Get(Int32.Parse(BaseSchemaId));

                    ArmName.Text = biz[ProtocolSchema.ProtocolArmDescription].ToString();
                    ArmMaxAccrual.Text = biz[ProtocolSchema.ProtocolArmMaxAccrual].ToString();

                    // check active state
                    string active = biz[ProtocolSchema.ProtocolArmActive].ToString();
                    bool isArmActive = !string.IsNullOrEmpty(active) && Caisis.UI.Core.Classes.PageUtil.IsTrueString(active);
                    ArmActive.Checked = isArmActive;
                }
                else
                {
                    NextBtn.Visible = false;
                }
            }
        }

        /// <summary>
        /// Show/hide next save buttons based on new treatment
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetBtnVisibility(object sender, EventArgs e)
        {
            ImageButton btn = sender as ImageButton;
            if (btn == NextBtn)
            {
                btn.Visible = !IsNew;
            }
            else if (btn == SaveTreatment)
            {
                btn.Visible = IsNew;
            }
        }

        /// <summary>
        /// Marks the form as "dirty", i.e. field values change during postback
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MarkFormDirty(object sender, EventArgs e)
        {
            formDirty = true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveTreatment_Click(object sender, ImageClickEventArgs e)
        {
            int priKey = SaveSchema();

            // if Schema is just being added, the wizard needs to be refreshed
            bool bNeedReload = string.IsNullOrEmpty(BaseSchemaId) || BaseSchemaId == "-1";
            RegisterUpdatePageScript(priKey.ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void NextClick(object sender, EventArgs e)
        {
            if (formDirty)
            {
                SaveSchema();
            }
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "GoToNext", "goToNext();", true);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private int SaveSchema()
        {
            ProtocolSchema biz = new ProtocolSchema();
            if (!String.IsNullOrEmpty(BaseSchemaId)
                && BaseSchemaId != "-1")
                biz.Get(Int32.Parse(BaseSchemaId));
            else
                biz[ProtocolSchema.ProtocolVersionId] = ProtocolVersionId.ToString();

            biz[ProtocolSchema.ProtocolArmDescription] = ArmName.Text;
            biz[ProtocolSchema.ProtocolArmMaxAccrual] = ArmMaxAccrual.Text;
            biz[ProtocolSchema.ProtocolArmActive] = ArmActive.Checked ? 1 : 0;
            biz.Save();

            return int.Parse(biz[ProtocolSchema.ProtocolSchemaId].ToString());
        }

        /// <summary>
        /// Registers script to load next page
        /// </summary>
        /// <param name="schemaId"></param>
        public void RegisterUpdatePageScript(string schemaId)
        {
            // get new url to load in parent page
            string newUrl = GetQueryString("AdminSchema.aspx", BaseProtocolId, schemaId, string.Empty, false) + "&tab=SchemaItems";
            string reloadAndGoToNext = string.Format("reloadAndGoToNext('{0}')", newUrl);
            Page.ClientScript.RegisterStartupScript(typeof(Page), "UpdateWizardScript", reloadAndGoToNext, true);

        }
    }
}
