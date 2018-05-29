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
    public partial class AdminVersionInfo : ProtocolMgmtBaseAdminPage
    {
        private int versionId;

        protected string CopyVersionId
        {
            get
            {
                return Request.QueryString["copyVersionId"];
            }
        }

        protected int numVersionId
        {
            get
            {
                string strVersionId = Request["prvr"];
                if (Int32.TryParse(strVersionId, out versionId))
                {
                    return versionId;
                }
                else
                {
                    versionId = -1;
                    return versionId;
                }
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                PopulateVersionInfo();
            }
        }

        private void PopulateVersionInfo()
        {
            ProtocolVersion biz = new ProtocolVersion();
            // populate existing
            if (numVersionId != -1)
            {
                biz.Get(numVersionId);
                base.PopulateForm(biz);
                // specially format date
                ApprovalDate.Text = string.Format("{0:d}", biz[ProtocolVersion.ApprovalDate]);
            }
            // if copying exising defult from exisintg
            else if (!string.IsNullOrEmpty(CopyVersionId))
            {
                biz.Get(int.Parse(CopyVersionId));
                // set field values
                base.PopulateForm(biz);
                // specially format date
                ApprovalDate.Text = string.Format("{0:d}", biz[ProtocolVersion.ApprovalDate]);
                // update verion number
                string baseVersionNumber = biz[ProtocolVersion.VersionNumber].ToString();
                VersionNumber.Text = string.Format("Copy of {0}", baseVersionNumber);
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            CancelEdit();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            // validate approval date
            DateTime testDate = DateTime.Now;
            if (string.IsNullOrEmpty(ApprovalDate.Text) || !DateTime.TryParse(ApprovalDate.Text, out testDate))
            {
                ApprovalDateValidator.IsValid = false;
            }
            else
            {
                ProtocolVersion biz = new ProtocolVersion();
                int protocolId = int.Parse(BaseProtocolId);
                // copying
                if (!string.IsNullOrEmpty(CopyVersionId))
                {
                    biz = ProtocolMgmtController.CopyProtocolVersion(int.Parse(CopyVersionId));
                }
                else
                {
                    // updating
                    if (numVersionId != -1)
                    {
                        biz.Get(numVersionId);
                    }
                    // new record
                    else
                    {
                        biz[ProtocolVersion.ProtocolId] = protocolId;
                    }
                }
                CICHelper.SetBOValues(Form.Controls, biz, protocolId);
                biz.Save();
                RefreshMainScreen((int)biz[biz.PrimaryKeyName]);
            }
        }

        private void RefreshMainScreen(int verionId)
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshPage", "if(top.hideModal) {var modalCaller = top.getModalCallingWindow(); if(modalCaller && modalCaller.reloadAdminProtocolVersion) { modalCaller.reloadAdminProtocolVersion(" + versionId + "); } top.hideModal(); }", true);
        }

        private void CancelEdit()
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "cancelEditPage", "if(top.hideModal) { top.hideModal(); }", true);
        }
    }
}
