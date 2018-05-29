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

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class EditProjectStageEvents : ProjectMgmtBasePage
    {

        protected int stageId;

        protected override void Page_Load(object sender, EventArgs e)
        {
            string stgId = Request.QueryString["stageId"];
            if (!string.IsNullOrEmpty(stgId))
            {
                stageId = int.Parse(stgId);

                if (!Page.IsPostBack)
                {
                    SetNavigationLink();
                    BindStageEventsGrid();
                }
            }
        }

        private void SetNavigationLink()
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "SetNavLink", "setActiveStageLink(" + stageId + ");", true);
        }

        protected void BindStageEventsGrid()
        {
			//ProjectStageEvent stageEvents = new ProjectStageEvent();
			//stageEvents.GetByParent(stageId);
			//ProjectStageEventsGrid.DataSource = stageEvents.DataSourceView;
            ProjectManagementDa da = new ProjectManagementDa();
            DataView dv = da.GetStageEvents(stageId).DefaultView;
            dv.Sort = "SortOrder";
            ProjectStageEventsGrid.DataSource = dv;
            ProjectStageEventsGrid.DataBind();
        }

        /// <summary>
        /// Copies end date to start date if no start date
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetBlurEvent(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get start and end date fields
                CaisisTextBox startDate = e.Row.FindControl("EventStartDate") as CaisisTextBox;
                CaisisTextBox endDate = e.Row.FindControl("EventEndDate") as CaisisTextBox;

                // Manually set date's to friendly short date string
                string sDate = DataBinder.Eval(e.Row.DataItem, ProjectStageEvent.EventStartDate).ToString();
                string eDate = DataBinder.Eval(e.Row.DataItem, ProjectStageEvent.EventEndDate).ToString();
                if (!string.IsNullOrEmpty(sDate))
                {
                    startDate.Value = DateTime.Parse(sDate).ToShortDateString();
                }
                if (!string.IsNullOrEmpty(eDate))
                {
                    endDate.Value = DateTime.Parse(eDate).ToShortDateString();
                }
                // Add blur,focus, and click event to enddate control
                string script = "handleEndDateEntered('" + startDate.ClientID + "','" + endDate.ClientID + "');";
                PageUtil.AttachClientEventToControl(endDate as WebControl, "onclick", script);
                PageUtil.AttachClientEventToControl(endDate as WebControl, "onfocus", script);
                PageUtil.AttachClientEventToControl(endDate as WebControl, "onblur", script);
            }
        }

        /// <summary>
        /// Attributes which have the word date, show date picker
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleDateAttributes(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex > -1)
            {
                string attName = DataBinder.Eval(e.Row.DataItem, ProjectEventAttribute.AttributeName).ToString();
                string attValue = DataBinder.Eval(e.Row.DataItem, ProjectEventAttribute.AttributeValue).ToString();

                string[] words = attName.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                foreach (string word in words)
                {
                    if (word.ToLower().Equals("date"))
                    {
                        CaisisTextBox attValueField = e.Row.FindControl("AttributeValue") as CaisisTextBox;
                        attValueField.ShowCalendar = true;
                        if (!string.IsNullOrEmpty(attValue))
                        {
                            DateTime properDate = new DateTime();
                            DateTime.TryParse(attValue, out properDate);
                            if (properDate != DateTime.MinValue)
                            {
                                attValueField.Value = properDate.ToShortDateString();
                            }

                        }
                    }
                }
            }
        }

        /// <summary>
        /// Hide show options row/label if no records
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ShowHideOptionsLink(object sender, EventArgs e)
        {
            ExtendedGridView attributesGrid = sender as ExtendedGridView;
            if (attributesGrid.Rows.Count == 0)
            {
                GridViewRow eventRow = attributesGrid.NamingContainer as GridViewRow;
                HtmlTableRow showAttributesRow = eventRow.FindControl("ShowOptionFieldsRow") as HtmlTableRow;
                showAttributesRow.Visible = false;
            }
        }

        /// <summary>
        /// Sets the link for loading a stage for editing in a modal window.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetModalLink(object sender, EventArgs e)
        {
            EditBtn.OnClientClick = "return showEditDetailsInModal('" + Page.ResolveUrl("EditStage.aspx?projectId=" + ProjectId + "&organizationId=" + OrganizationId + "&stageId=" + stageId + "','Edit Stage');");
        }

        /// <summary>
        /// Updates the stage with its associated events and details.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateStageAndEvents(object sender, EventArgs e)
        {
            ProjectStageEventsGrid.Save(stageId);
            RegisterPageReload();
        }

        /// <summary>
        /// Deletes a stage record and reloads Organization's summary page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteStage(object sender, EventArgs e)
        {
            // Delete assocaited events
			//ProjectStageEvent events = new ProjectStageEvent();
			//events.GetByParent(stageId);
			//int[] deleteKeys = new int[events.DataSourceView.Table.Rows.Count];

			DataTable table = BusinessObject.GetByParentAsDataView<ProjectStageEvent>(stageId).Table;
			int[] deleteKeys = new int[table.Rows.Count];
            //for (int i = 0; i < events.DataSourceView.Table.Rows.Count; i++)
			for (int i = 0; i < table.Rows.Count; i++)
            {
                //DataRow row = events.DataSourceView.Table.Rows[i];
				DataRow row = table.Rows[i];
                int eventId = int.Parse(row[ProjectStageEvent.StageEventId].ToString());
                deleteKeys[i] = eventId;
            }
            foreach (int eventId in deleteKeys)
            {
                //events.Delete(eventId);
				ProjectStageEvent ev = new ProjectStageEvent();
				ev.Delete(eventId);
            }

            // Finally delete Stage.
            ProjectStage biz = new ProjectStage();
            biz.Delete(stageId);

            // Call client script which loads summary section and hilights summary in navigation
            RegisterPageReload();
        }

        /// <summary>
        /// Registers a client script which will reload the parent page and reload 
        /// this stage with updated values (used for updating charts on parent page).
        /// </summary>
        private void RegisterPageReload()
        {
            string script = "if(parent.reloadMainGant) { parent.reloadMainGant.call(parent); } ";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ReloadParentGant", script, true);
        }
    }

}
