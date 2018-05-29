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
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminProtocolInfo : ProtocolMgmtBaseAdminPage
    {
        private int protocolId;

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

        protected int numProtocolId
        {
            get
            {
                if (Int32.TryParse(BaseProtocolId, out protocolId))
                {
                    return protocolId;
                }
                else
                {
                    protocolId = -1;
                    return protocolId;
                }
            }
        }

        protected bool IsEditMode
        {
            get
            {
                string editStatus = Request["edit"];
                bool isEditMode = !string.IsNullOrEmpty(editStatus) && bool.Parse(editStatus);
                return isEditMode;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            //base.Page_Load(sender, e);

            if (IsEditMode)
            {
                ProtocolInfoView.SetActiveView(EditView);
            }
            else
            {
                ProtocolInfoView.SetActiveView(ReadOnlyView);
                SetFormFieldData();
            }

            SetExportLink();

        }

        private void SetExportLink()
        {
            bool importAvailable = string.IsNullOrEmpty(BaseProtocolId);
            ImportBtn.Visible = importAvailable;
        }

        private void SetFormFieldData()
        {
            if (!IsNew)
            {
                Protocol biz = new Protocol();

                biz.Get(int.Parse(BaseProtocolId));

                foreach (string colName in biz.FieldNames)
                {
                    Label field = ReadOnlyView.FindControl(colName) as Label;
                    if (field != null)
                    {
                        if (field.ID == Protocol.ProjectId) // get Project Title and Num
                            field.Text = GetProjectInfo(biz[colName].ToString());
                        else
                            field.Text = biz[colName].ToString();
                    }
                }
            }
        }

        protected void ReadOnlyView_Load(object sender, EventArgs e)
        {
            SetFormFieldData();
        }

        protected void EditView_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetProjectDropDown();

                PopulateProtocolInfo();
            }
        }

        private void PopulateProtocolInfo()
        {
            Protocol biz = new Protocol();

            if (numProtocolId != -1)
            {
                biz.Get(numProtocolId);
                CICHelper.SetFieldValues(EditView.Controls, biz);
            }

            // set delete button
            if (IsEditMode && numProtocolId != -1)
            {
                bool hasVersions = BOL.BusinessObject.Count<ProtocolVersion>(new Dictionary<string, object> { { PatientProtocol.ProtocolId, numProtocolId } }) > 0;
                bool hasPatients = BOL.BusinessObject.Count<PatientProtocol>(new Dictionary<string, object> { { PatientProtocol.ProtocolId, numProtocolId } }) > 0;
                // validate no schemas or patients on protocol
                if (!hasVersions && !hasPatients)
                {
                    DeleteButton.Visible = true;
                }
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            int protocolId = int.Parse(BaseProtocolId);
            Protocol protocol = new Protocol();
            protocol.Delete(protocolId);
            string script = "window.parent.location = 'ProtocolList.aspx';";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "RedirectToList", script, true);
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            RefreshMainScreen();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Protocol biz = new Protocol();
            // load exisiting if updating
            if (!IsNew)
            {
                biz.Get(numProtocolId);
            }
            CICHelper.SetBOValues(EditView.Controls, biz, 0);
            // insert/update
            biz.Save();

            int updatedProtocolId = (int)biz[Protocol.ProtocolId];

            // on new records do full outer reload
            if (IsNew)
            {
                DeepRefresh(updatedProtocolId);
            }
            else
            {
                RefreshMainScreen();
            }
        }

        private void RefreshMainScreen()
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshPage", "ExitEditProtocol();", true);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="newProtocolId"></param>
        private void DeepRefresh(int newProtocolId)
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "fullRefreshPage", "fullRefreshPage('" + base.GetQueryString("AdminProtocol.aspx", newProtocolId.ToString(), string.Empty, string.Empty, false) + "');", true);
        }

        private string GetProjectInfo(string projectId)
        {
            string projectInfo = "";

            if (!string.IsNullOrEmpty(projectId) && PageUtil.IsInteger(projectId))
            {
                Project p = new Project();
                p.Get(int.Parse(projectId));


                projectInfo = p[Project.ProjectNum].ToString() + " : " + p[Project.Title].ToString();

                ProjectManagementDa pmDa = new ProjectManagementDa();
                DataTable organizations = pmDa.GetAllOrganizationsSortedByProjectId(int.Parse(projectId));
                string orgList = "";
                foreach (DataRow dr in organizations.Rows)
                {
                    orgList += dr[ProjectOrganization.Name].ToString() + "\n";
                }
                string url = Page.ResolveUrl("~/Core/Utilities/ModuleContainer.aspx?mod=/ProjectMgmt/Index.aspx");
                string projectPath = "top.window.location = '" + url + "?projectId=" + projectId + "'";
                ProjectIdLink.Attributes.Add("onclick", projectPath);
                ProjectId.ToolTip = orgList;
            }

            return projectInfo;
        }

        private void SetProjectDropDown()
        {
            //Project p = new Project();
            //p.GetAll();
            //p.DataSourceView.Table.Columns.Add(new DataColumn("ProjectDisplayName", typeof(string), "ProjectNum  + ' : ' + Title"));
            //EditProjectId.DataSource = p.DataSourceView;
            DataView v = BusinessObject.GetAllAsDataView<Project>();
            v.Table.Columns.Add(new DataColumn("ProjectDisplayName", typeof(string), "ProjectNum  + ' : ' + Title"));
            EditProjectId.DataSource = v;
            EditProjectId.DataValueField = Project.ProjectId;
            EditProjectId.DataTextField = "ProjectDisplayName";
            EditProjectId.DataBind();
        }
    }
}
