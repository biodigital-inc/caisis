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
using Caisis.Security;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectContacts : ProjectMgmtBasePage
    {
        protected int projectId = 0;
        protected int contactId = 0;
        protected string contactType = "";
        protected bool isAdmin = false;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;



            // Determine if Admin view is need (show all Contacts in List)
            if (!string.IsNullOrEmpty(Request.QueryString["admin"]) && Request.QueryString["admin"].ToLower().Equals(bool.TrueString.ToLower()))
            {
                // Verify user has admin rights
                if (PermissionManager.HasPermission(PermissionManager.EditSecurity))
                {
                    isAdmin = true;
                }
            }

            GetProjectId();

            // Set contact type if passed from query string
            if (!string.IsNullOrEmpty(Request.QueryString["contactType"]))
            {
                contactType = Request.QueryString["contactType"];
            }


            if (Request.QueryString["contactId"] != null)
                contactId = int.Parse(Request.QueryString["contactId"]);
            else
                contactId = -1;

            LoadContactsGrid();
            LoadContactsRecord();
        }

        private void SetGridViewSelectedByKey()
        {
            DataTable dt = (DataTable)ContactsGrid.DataSource;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (contactId == Int32.Parse(dt.Rows[i]["contactId"].ToString()))
                {
                    ContactsGrid.Rows[i].CssClass = "datGridItemClick";
                    break;
                }
            }
        }

        private void GetProjectId()
        {
            string filterBy = Request.QueryString["FilterBy"];
            string filterId = Request.QueryString["FilterID"];
            if (!string.IsNullOrEmpty(filterBy) && filterBy == "Projects" && !string.IsNullOrEmpty(filterId))
            {
                projectId = int.Parse(filterId);
            }
            else
            {
                projectId = -1;
            }
        }

        private void LoadContactsRecord()
        {
            string detailsURL = string.Empty;

            if (contactId > -1)
            {
                detailsURL = "ProjectContactsDetails.aspx?projectId=" + ProjectId + "&contactId=" + contactId + "&contactType=" + contactType + "&admin=" + isAdmin.ToString().ToLower();
                SetGridViewSelectedByKey();
                ContactInfoPage.Style["display"] = "";
            }
            else
            {
                ContactInfoPage.Style["display"] = "none";
            }
            ContactInfoPage.Attributes["src"] = detailsURL;

        }

        private void LoadContactsGrid()
        {
            ProjectManagementDa projDA = new ProjectManagementDa();
            DataTable contactsDataSource = new DataTable();

            string filterBy = Request.QueryString["FilterBy"];
            ContactsDa contactsDa = new ContactsDa();
            
            if (isAdmin)
            {
                contactsDataSource = contactsDa.GetAllContacts();
            }
            else if (string.IsNullOrEmpty(filterBy))
            {
                if (contactType == "Project")
                {
                    contactsDataSource = CombineRows(projDA.GetAllContactsWithOrgNameByProjectId(projectId), "Organization");
                }
                else
                {
                    if (!string.IsNullOrEmpty(contactType))
                    {
                        contactsDataSource = contactsDa.GetContactByContactType(contactType);
                    }
                }
            }
            else
            {
                switch (filterBy)
                {
                    case ("Organization"):
                        contactsDataSource = CombineRows(projDA.GetAllContactsByOrgId(Int32.Parse(Request.QueryString["FilterID"])), "Organization");
                        break;
                    case ("Protocols"):
                        contactsDataSource = CombineRows(projDA.GetAllContactsByProtocol(Int32.Parse(Request.QueryString["FilterID"])), "Organization");
                        break;
                    case ("Projects"):
                        contactsDataSource = CombineRows(projDA.GetAllContactsWithOrgNameByProjectId(Int32.Parse(Request.QueryString["FilterID"])), "Organization");
                        break;
                    default:
                        break;
                }
            }

            // Bind grid to datasource
            ContactsGrid.DataSource = contactsDataSource;
            ContactsGrid.DataBind();

            // Determine if there are any records and show message
            if (contactsDataSource.Rows.Count == 0)
            {
                EmptyMessageLabel.Visible = true;
            }
            else
            {
                EmptyMessageLabel.Visible = false;
            }
        }

        protected void menuFilter_MenuItemClick(object sender, MenuEventArgs e)
        {
            MenuItem item = (MenuItem)e.Item;

            if (item.ValuePath.StartsWith("Organization"))
            {

                ProjectManagementDa projDA = new ProjectManagementDa();
                ContactsGrid.DataSource = CombineRows(projDA.GetAllContactsByOrgId(Int32.Parse(item.Value)), "Organization");
            }
            else if (item.ValuePath.StartsWith("Protocols"))
            {
                ProjectManagementDa projDA = new ProjectManagementDa();
                ContactsGrid.DataSource = CombineRows(projDA.GetAllContactsByProtocol(Int32.Parse(item.Value)), "Organization");
            }

            ContactsGrid.DataBind();
        }
        protected void ViewAllButton_Click(object sender, ImageClickEventArgs e)
        {
            projectId = -1;

            ProjectManagementDa projDA = new ProjectManagementDa();
            ContactsGrid.DataSource = CombineRows(projDA.GetAllContactsWithOrgNameByProjectId(projectId), "organization");
            ContactsGrid.DataBind();

        }
        protected void AddClickToContactRow(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.DataItem != null)
                {
                    string cId = DataBinder.Eval(e.Row.DataItem, "ContactId").ToString();
                    e.Row.Attributes.Add("onclick", "goToContact('" + ProjectId + "','" + cId + "');");
                }
            }
        }

        protected void ContactsGrid_Sorting(object sender, GridViewSortEventArgs e)
        {
            int i = 1;
            DataTable dtSortTable = ContactsGrid.DataSource as DataTable;

            if (dtSortTable != null)
            {
                DataView dvSortedView = new DataView(dtSortTable);
                dvSortedView.Sort = getSortDirectionString(e.SortExpression, e.SortDirection);

                ContactsGrid.DataSource = dvSortedView;
                ContactsGrid.DataBind();
            }

            ViewState["SortField"] = e.SortExpression;

        }

        private string getSortDirectionString(string sortExpression, SortDirection sortDirection)
        {
            string SortString = String.Empty;

            SortDirection sortDir;

            if (ViewState["SortField"] != null && ViewState["SortDir"] != null)
            {
                if (sortExpression == ViewState["SortField"].ToString() && ViewState["SortDir"].ToString() == SortDirection.Ascending.ToString())
                {
                    SortString = sortExpression + " DESC";
                    ViewState["SortDir"] = SortDirection.Descending;
                }
                else if (sortExpression == ViewState["SortField"].ToString() && ViewState["SortDir"].ToString() == SortDirection.Descending.ToString())
                {
                    SortString = sortExpression + " ASC";
                    ViewState["SortDir"] = SortDirection.Ascending;
                }
                else
                    SortString = getDefaultSorting(sortExpression, sortDirection);
            }
            else
                SortString = getDefaultSorting(sortExpression, SortDirection.Descending);

            return SortString;
        }

        private string getDefaultSorting(string sortExpression, SortDirection sortDirection)
        {
            string SortString = String.Empty;

            if (sortDirection == SortDirection.Ascending)
            {
                SortString = sortExpression + " ASC";
                ViewState["SortDir"] = SortDirection.Ascending;
            }
            else
            {
                SortString = sortExpression + " DESC";
                ViewState["SortDir"] = SortDirection.Descending;
            }

            return SortString;
        }

        private DataTable CombineRows(DataTable OrigTable, string fieldToCombine)
        {
            DataRow[] foundRows;

            foundRows = OrigTable.Select("", "Name, ContactId");

            DataTable dtCombined = OrigTable.Clone();

            int j = 0;

            for (int i = 0; i < foundRows.GetLength(0); i++)
            {
                if (i == 0)
                {
                    dtCombined.ImportRow(foundRows[j]);
                    j++;

                    continue;
                }

                if (foundRows[i]["ContactId"].ToString() == foundRows[i - 1]["ContactId"].ToString())
                {
                    string fieldToCombineValue = dtCombined.Rows[j - 1][fieldToCombine].ToString();
                    var list = fieldToCombineValue.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries).Select(v => v.Trim()).ToList();
                    list.Add(foundRows[i][fieldToCombine].ToString());
                    list.Sort();
                    dtCombined.Rows[j - 1][fieldToCombine] = string.Join(", ", list.ToArray());
                }
                else
                {
                    dtCombined.ImportRow(foundRows[i]);
                    j++;
                }
            }

            return dtCombined;
        }


        /// <summary>
        /// Sorts Contacts based on column selected in header.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleHeaderSortClick(object sender, CommandEventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string sortExpr = e.CommandArgument.ToString();
            // Sort direction is maintained in ViewState
            ContactsGrid.Sort(sortExpr, SortDirection.Ascending);
        }
    }
}
