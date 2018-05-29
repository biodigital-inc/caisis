using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectCommunicationLogDetails : ProjectMgmtBasePage
    {
        private int projectId;
        private ProjectManagementDa da = new ProjectManagementDa();


        private DataView AllContacts;
        private DataView AllOrganizations;

        /// <summary>
        /// dirty records
        /// </summary>
        private List<int> dirtyRows = new List<int>();

        /// <summary>
        /// blank rows to add in edit mode
        /// </summary>
        private static readonly int BLANK_COM_LOG_ROWS = 15;

        public ProjectCommunicationLogDetails()
            : base()
        {
            // set project id
            this.Load += (a, b) =>
            {
                projectId = int.Parse(ProjectId);
                // fill lists
                AllContacts = da.GetAllContactsWithOrgNameByProjectId(projectId).DefaultView;
                AllOrganizations = da.GetAllOrganizationsSortedByProjectId(projectId).DefaultView;
            };
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // default to display only
                SetEditState(false);
                BindCommunicationLog();
            }
            // set button
            ExportBtn.Visible = UserType == ProjectMgmtUsers.ModuleAdmin || UserType == ProjectMgmtUsers.ProjectAdmin;
        }

        /// <summary>
        /// Builds a list of Communication Logs by current project id
        /// </summary>
        private void BindCommunicationLog()
        {
            DataView projectCommunicationLog = GetCommunicationLog();

            bool isEdit = BtnSave.Visible;
            string primaryKeyName = ProjectCommunicationLog.CommunicationLogId;
            DataColumn sort = new DataColumn("Sort", typeof(int), "ISNULL(" + primaryKeyName + ",1) - ISNULL(" + primaryKeyName + ",0) + 1");
            projectCommunicationLog.Table.Columns.Add(sort);
            // whenever there are no records in read only mode, automaticaly go to edit mode
            if (!isEdit && projectCommunicationLog.Count == 0 && BLANK_COM_LOG_ROWS > 0)
            {
                SetEditState(true);
                isEdit = BtnSave.Visible;
            }
            // in edit mode add extra rows
            if (isEdit)
            {
                // clean constraints to allow empty rows
                projectCommunicationLog.Table.Constraints.Clear();
                foreach (DataColumn col in projectCommunicationLog.Table.Columns)
                {
                    col.AllowDBNull = true;
                }
                // finall add blank rows
                for (int i = 0; i < BLANK_COM_LOG_ROWS; i++)
                {
                  DataRowView blankRow =  projectCommunicationLog.AddNew();
                }
            }

            projectCommunicationLog.Sort = "Sort ASC," +  ProjectCommunicationLog.LogCommDate + " ASC";

            ReadOnlyLogRptr.DataSource = projectCommunicationLog;
            ReadOnlyLogRptr.DataBind();
        }

        /// <summary>
        /// When control value changes, mark row as "dirty"
        /// </summary>
        /// <param name="icic"></param>
        /// <param name="e"></param>
        protected void MarkRowDirty(ICaisisInputControl icic, EventArgs e)
        {
            RepeaterItem rptrItem = (icic as Control).NamingContainer as RepeaterItem;
            if (!dirtyRows.Contains(rptrItem.ItemIndex))
            {
                dirtyRows.Add(rptrItem.ItemIndex);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteRow(object sender, CommandEventArgs e)
        {
            if (e.CommandArgument != null)
            {
                string priKeyValue = e.CommandArgument.ToString();
                if (!string.IsNullOrEmpty(priKeyValue))
                {
                    ProjectCommunicationLog biz = new ProjectCommunicationLog();
                    biz.Delete(int.Parse(priKeyValue));
                    // rebind to show new data
                    BindCommunicationLog();
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="contactId"></param>
        /// <returns></returns>
        protected string GetContactName(string searchContactId)
        {
            if (!string.IsNullOrEmpty(searchContactId))
            {
                var foundContact = from contact in AllContacts.Table.AsEnumerable()
                                   let contactId = contact[Contact.ContactId].ToString()
                                   let name = contact["Name"].ToString()
                                   where contactId == searchContactId
                                   select name;
                return foundContact.Count() > 0 ? foundContact.First() : string.Empty;
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="searchOrganizationId"></param>
        /// <returns></returns>
        protected string GetOrganizationName(string searchOrganizationId)
        {
            if (!string.IsNullOrEmpty(searchOrganizationId))
            {
                var foundOrgs = from org in AllOrganizations.Table.AsEnumerable()
                                let orgId = org[ProjectOrganization.OrganizationId].ToString()
                                let name = org["Name"].ToString()
                                where orgId == searchOrganizationId
                                select name;
                return foundOrgs.Count() > 0 ? foundOrgs.First() : string.Empty;
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetLabelState(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // determine if in edit of readonly mode
                bool isEdit = BtnSave.Visible;

                CaisisSelect orgs = e.Item.FindControl("OrgSel") as CaisisSelect;
                orgs.DataSource = AllOrganizations;
                orgs.DataBind();

                CaisisSelect contacts = e.Item.FindControl("ContactSel") as CaisisSelect;
                contacts.DataSource = AllContacts;
                contacts.DataBind();

                string priKeyValue = DataBinder.Eval(e.Item.DataItem, ProjectCommunicationLog.CommunicationLogId).ToString();
                // populate fields
                foreach (ICaisisInputControl icic in PageUtil.GetCaisisInputControlsInContainer(e.Item))
                {
                    icic.Value = DataBinder.Eval(e.Item.DataItem, icic.Field).ToString();
                    // show control in edit mode
                    icic.Visible = isEdit;
                    // if control has associated label, show/hide by mdoe
                    Label readOnlyLabel = e.Item.FindControl(icic.Field + "Label") as Label;
                    if (readOnlyLabel != null)
                    {
                        // special cases
                        if (icic.Field == ProjectCommunicationLog.OrganizationId)
                        {
                            readOnlyLabel.Text = GetOrganizationName(icic.Value);
                        }
                        else if (icic.Field == ProjectCommunicationLog.ContactId)
                        {
                            readOnlyLabel.Text = GetContactName(icic.Value);
                        }
                        else
                        {
                            readOnlyLabel.Text = icic.Value;
                        }
                        readOnlyLabel.Visible = !isEdit;
                    }
                }

                // finally set delete button
                ImageButton deleteBtn = e.Item.FindControl("DeleteBtn") as ImageButton;
                // only show edit button when pri key exists and in edit mode
                deleteBtn.Visible = isEdit && !string.IsNullOrEmpty(priKeyValue);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            // if editing last dirty row, show more
            bool rebindToEdit = dirtyRows.Contains(ReadOnlyLogRptr.Items.Count - 1);
            // update/insert "dirty" records
            foreach (int dirtyRowIndex in dirtyRows)
            {
                RepeaterItem item = ReadOnlyLogRptr.Items[dirtyRowIndex];
                // get pri key
                CaisisHidden priKeyField = item.FindControl("CommunicationLogIdField") as CaisisHidden;
                ProjectCommunicationLog biz = new ProjectCommunicationLog();
                // update
                if (!string.IsNullOrEmpty(priKeyField.Value))
                {
                    int priKey = int.Parse(priKeyField.Value);
                    biz.Get(priKey);
                }
                // fill Biz with field values
                CICHelper.SetBOValues(item.Controls, biz, projectId);
                // update/insert
                biz.Save();

            }
            dirtyRows.Clear();

            SetEditState(rebindToEdit);
            // rebind to reflect changes
            BindCommunicationLog();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void EditClick(object sender, EventArgs e)
        {
            SetEditState(true);
            BindCommunicationLog();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelClick(object sender, EventArgs e)
        {
            SetEditState(false);
            BindCommunicationLog();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ExportClick(object sender, EventArgs e)
        {
            if (!CanExport())
                return;

            // get raw table
            DataTable table = GetCommunicationLog().Table;
            // create special export table for subset of columns
            DataTable exportTable = new DataTable("ProjectCommunicationLog");
            string[] columns = new string[] 
            {  
                ProjectCommunicationLog.LogCommDate,
                ProjectCommunicationLog.LogCommDateText,
                ProjectCommunicationLog.LogCommType,
                ProjectCommunicationLog.LogCommDescription,
                ProjectCommunicationLog.LogCommNotes,
                "Contact", 
                "Organization", 
                ProjectCommunicationLog.EnteredBy,
                ProjectCommunicationLog.EnteredTime,
                ProjectCommunicationLog.UpdatedBy,
                ProjectCommunicationLog.UpdatedTime
            };
            foreach (string column in columns)
            {
                // add to export table
                exportTable.Columns.Add(column);
                // verify source
                if (!table.Columns.Contains(column))
                    table.Columns.Add(column);
            }
            foreach (DataRow sourceRow in table.Rows)
            {
                string contactId = sourceRow[ProjectCommunicationLog.ContactId].ToString();
                string organizationId = sourceRow[ProjectCommunicationLog.OrganizationId].ToString();
                string contactName = GetContactName(contactId);
                string organizationName = GetOrganizationName(organizationId);
                sourceRow["Contact"] = contactName;
                sourceRow["Organization"] = organizationName;

               // copy required data to output table
                DataRow exportRow = exportTable.NewRow();
                foreach (string column in columns)
                {                    
                    exportRow[column] = sourceRow[column];                    
                }
                exportTable.Rows.Add(exportRow);
            }
            // run export
            Project project = new Project();
            project.Get(projectId);
            string projectNum = project[Project.ProjectNum].ToString();
            string reportName = "Project Communication Log Export - " + projectNum;
            Caisis.Controller.ExcelExporter.ExportToExcel(Page, exportTable.DefaultView, reportName, reportName.Replace(" ", "") + ".xls");
        }

        /// <summary>
        /// Returns a list of communication logs for the current Project.
        /// </summary>
        /// <returns></returns>
        private DataView GetCommunicationLog()
        {
            DataView projectCommunicationLog = Caisis.BOL.BusinessObject.GetByFieldsAsDataView<ProjectCommunicationLog>(new Dictionary<string, object>() 
                { 
                    { ProjectCommunicationLog.ProjectId, projectId } 
                });
            return projectCommunicationLog;
        }

        private bool CanExport()
        {
            return true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="isEdit"></param>
        private void SetEditState(bool isEdit)
        {
            BtnSave.Visible = isEdit;
            BtnCancel.Visible = isEdit;
            BtnEdit.Visible = !isEdit;
            ExportBtn.Visible = !isEdit && CanExport();
        }
    }
}
