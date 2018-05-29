using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminProtocol : ProtocolMgmtBaseAdminPage
    {

        private string defaultTreatmentArmsURL = string.Empty;

        /// <summary>
        /// Gets if working with new protocol, i.e., no protocol id
        /// </summary>
        protected bool IsNew
        {
            get
            {
                return string.IsNullOrEmpty(BaseProtocolId);
            }
        }

        protected string QueryVersionId
        {
            get
            {
                return Request.QueryString["prvr"];
            }
        }

        protected string DefaultTreatmentArmsURL
        {
            get
            {
                return defaultTreatmentArmsURL;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
          //  base.Page_Load(sender, e);

            if (base.UserType != ProtocolMgmtUsers.ProtocolAdmin)
            {
                this.Visible = false;
            }
            else
            {
                if (!IsPostBack)
                {
                    // working with new protocol
                    if (IsNew)
                    {
                        ProtocolNumberTd.Visible = false;
                        ProtocolTitleTd.Visible = false;
                        ProtocolNewProtocolTd.Visible = true;
                        ProtocolExitTd.Visible = false;
                        OtherAdminTasks.Visible = false;
                        ManageTreatmentArms.Visible = false;
                    }
                    // working with existing protocol
                    else
                    {
                        SetPageTitle();
                        LoadVersions();
                    }
                }
            }

            SetExportLink();
        }

        private void SetExportLink()
        {
            bool exportAvailable = !string.IsNullOrEmpty(BaseProtocolId);
            if (exportAvailable)
            {
                string exportUrlFormat = "AdminImportExportProtocol.aspx?mode=preview&{0}=true&protocolId={1}";
                string exportProtocolsURL = string.Format(exportUrlFormat, "export", BaseProtocolId);
                ExportProtocolBtn.HRef = exportProtocolsURL;
                ExportProtocolBtn.Visible = true;
                // validate permission
                bool canExportPatients = Caisis.Security.PermissionManager.HasPermission(Caisis.Security.PermissionManager.ExportData);
                string exportPatientTitle = "Export Protocol Patients" + (canExportPatients ? "" : " (disabled)");
                ExportPatientsBtn.InnerText = exportPatientTitle;
                ExportPatientsBtn.Attributes["title"] = exportPatientTitle;
                ExportPatientsBtn.Visible = true;
                if (canExportPatients)
                {
                    string exportPatientsURL = string.Format(exportUrlFormat, "exportPatients", BaseProtocolId);
                    ExportPatientsBtn.HRef = exportPatientsURL;
                }
                else
                {
                    ExportPatientsBtn.HRef = "#";
                    ExportPatientsBtn.Attributes["onclick"] = "alert('You do not have permission to Export Data'); return false;";
                }
            }
            else
            {
                ExportProtocolBtn.HRef = "#";
                ExportProtocolBtn.Visible = false;
                ExportPatientsBtn.HRef = "#";
                ExportPatientsBtn.Visible = false;
            }
        }


        /// <summary>
        /// 
        /// </summary>
        protected void SetPageTitle()
        {
            if (!string.IsNullOrEmpty(BaseProtocolId))
            {
                Protocol biz = new Protocol();
                biz.Get(int.Parse(BaseProtocolId));

                string protNum = biz[Protocol.ProtocolNum].ToString();
                ProtocolNumberLabel.Text = protNum;
                if (protNum.Length > 10) ProtocolNumberTd.Attributes["class"] = "ProtocolTitleBarBG_ProtNum_Smallest";
                else if (protNum.Length > 7) ProtocolNumberTd.Attributes["class"] = "ProtocolTitleBarBG_ProtNum_Smaller";
                ProtocolTitleLabel.Text = biz[Protocol.ProtocolTitle].ToString();
                ProtocolTitleLabel.CssClass = "";
            }
        }

        protected string GetQueryStringBySchema(object SchemaId)
        {
            return GetQueryString("AdminSchema.aspx", BaseProtocolId, SchemaId.ToString(), BaseDecryptedPatientId, false);
        }

        protected void LoadVersions()
        {
            int protocolId = int.Parse(BaseProtocolId);
            DataView versionsList = BusinessObject.GetByParentAsDataView<ProtocolVersion>(protocolId);
            var versions = from v in BusinessObject.GetByParent<ProtocolVersion>(protocolId)
                           let versionId = (int)v[ProtocolVersion.ProtocolVersionId]
                           select new
                           {
                               ProtocolVersionId = versionId,
                               VersionNumber = v[ProtocolVersion.VersionNumber],
                               ApprovalDate = v[ProtocolVersion.ApprovalDate],
                               VersionReason = v[ProtocolVersion.VersionReason],
                               HasSchemas = BusinessObject.Exists<ProtocolSchema>(new Dictionary<string, object> { { ProtocolSchema.ProtocolVersionId, versionId } })
                           };

            VersionListRptr.DataSource = versions;
            VersionListRptr.DataBind();

            noVerionsMsg.Visible = versions.Count() == 0;
        }

        protected string GetQueryStringWithVersion(object versionId, object versionNum)
        {
            string strUrl = GetQueryString("AdminTreatmentArms.aspx") + "&prvr=" + versionId.ToString() + "&prvrnum=" + versionNum.ToString();
            // set default on first call only or if loading query version id
            if (string.IsNullOrEmpty(defaultTreatmentArmsURL) || versionId.ToString() == QueryVersionId)
            {
                defaultTreatmentArmsURL = strUrl;
            }
            return strUrl;
        }

        protected void SetVersionBtns(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var editBtn = e.Item.FindControl("EditVersionBtn") as ImageButton;
                var deleteBtn = e.Item.FindControl("DeleteVersionBtn") as ImageButton;
                // set edit script
                int ProtocolVersionId = (int)DataBinder.Eval(e.Item.DataItem, "ProtocolVersionId");
                editBtn.OnClientClick = "editVersionInfo('" + ProtocolVersionId + "'); return false;";
                // set delete visiblity
                bool hasSchemas = (bool)DataBinder.Eval(e.Item.DataItem, "HasSchemas");
                deleteBtn.Visible = !hasSchemas;
            }
        }

        /// <summary>
        /// Delelets the clicked version
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteVersion(object sender, CommandEventArgs e)
        {
            int versionId = int.Parse(e.CommandArgument.ToString());
            ProtocolVersion version = new ProtocolVersion();
            version.Delete(versionId);

            Response.Redirect(GetQueryString("AdminProtocol.aspx"));
        }

    }
}
