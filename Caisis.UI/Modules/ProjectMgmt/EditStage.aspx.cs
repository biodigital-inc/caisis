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
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class EditStage : ProjectMgmtBasePage
    {
        private bool recordIsDirty = false;
        private int projectId;

        protected override void Page_Load(object sender, EventArgs e)
        {
            projectId = int.Parse(ProjectId);
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["stageId"]))
                {
                    StageId.Value = Request.QueryString["stageId"];
                    BindStageRecord();
                }
            }
        }

        /// <summary>
        /// Binds the field to Stage record and grid to child events and attributes
        /// </summary>
        private void BindStageRecord()
        {
            int stageId = int.Parse(StageId.Value);

            ProjectStage biz = new ProjectStage();
            biz.Get(stageId);
            StageName.Value = biz[ProjectStage.Name].ToString();
            string color = biz[ProjectStage.ColorCode].ToString();
            ColorCode.Value = color;
            if (!string.IsNullOrEmpty(color))
            {
                ColorCodeBox.Style[HtmlTextWriterStyle.BackgroundColor] = color;
                ColorCodeBox.ToolTip = "Color: " + color;
            }

			//ProjectStageEvent projectEventsBiz = new ProjectStageEvent();
			//projectEventsBiz.GetByParent(stageId);

			//EventsGrid.DataSource = projectEventsBiz.DataSourceView;
			EventsGrid.DataSource = BusinessObject.GetByParentAsDataView<ProjectStageEvent>(stageId);
            EventsGrid.DataBind();
        }

        /// <summary>
        /// Signal that a value has changed in the Stage record and needs an update
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SignalStageUpdate(object sender, EventArgs e)
        {
            recordIsDirty = true;
        }

        /// <summary>
        /// Sets the event and detail name to "disabled", enabled on client side
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetComboDisable(object sender, GridViewRowEventArgs e)
        {
            CaisisComboBox nameField = e.Row.FindControl("NameComboBox") as CaisisComboBox;
            ImageButton editBtn = e.Row.FindControl("EditBtn") as ImageButton;
            if (nameField != null && editBtn != null)
            {
                nameField.Attributes["disabled"] = bool.TrueString.ToLower();
                editBtn.OnClientClick = "return editField('" + nameField.ClientID + "');";
            }
        }

        /// <summary>
        /// Updates the Stage record as well as child events and their atttibutes
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateStageRecord(object sender, EventArgs e)
        {
            // Register script must be called here, as no stage id has been assinged,i.e., new record
            RegisterUpdateScript(sender, e);

            // Determine if an insert/update
            ProjectStage stageBiz = new ProjectStage();

            // Only do update/insert on Stage record if dirty
            if (recordIsDirty)
            {
                if (recordIsDirty && !string.IsNullOrEmpty(StageId.Value))
                {
                    stageBiz.Get(int.Parse(StageId.Value));
                }
                // Set stage fields
                stageBiz[ProjectStage.ProjectId] = projectId;
                if (!string.IsNullOrEmpty(OrganizationId))
                {
                    stageBiz[ProjectStage.OrganizationId] = OrganizationId;
                }
                stageBiz[ProjectStage.Name] = StageName.Value;
                stageBiz[ProjectStage.ColorCode] = ColorCode.Value;
                stageBiz.Save();

                string bizStageId = stageBiz[ProjectStage.StageId].ToString();
                StageId.Value = bizStageId;
            }
            // Run save on Events and Details grid only if a parent stage record exits
            if (!string.IsNullOrEmpty(StageId.Value))
            {
                int stageId = int.Parse(StageId.Value);
                EventsGrid.Save(stageId);
                BindStageRecord();
            }
        }

        /// <summary>
        /// Tell underlying page to refresh
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RegisterUpdateScript(object sender, EventArgs e)
        {
            if (sender == SaveBtn && !string.IsNullOrEmpty(StageId.Value))
            {
                base.RegisterUpdatePageScript(string.Empty, true);
            }
            else
            {
                base.RegisterUpdatePageScript(string.Empty, false);
            }
        }
    }
}
