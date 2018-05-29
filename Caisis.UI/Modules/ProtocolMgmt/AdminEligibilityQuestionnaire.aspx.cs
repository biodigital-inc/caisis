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

using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminEligibilityQuestionnaire : ProtocolMgmtBaseAdminPage
    {
        private bool surveyDirty = false;

        private readonly string ELIGIBILITY_SURVEY_CATEGORY = "Eligibility";

        /// <summary>
        /// Returns the protocol version id passed in the query string
        /// </summary>
        protected string QueryVersionId
        {
            get
            {
                return Request.QueryString["versionId"];
            }
        }

        private string protocolTitle = null;
        protected string ProtocolTitle
        {
            get
            {
                if (protocolTitle == null)
                {
                    Protocol biz = new Protocol();
                    biz.Get(int.Parse(BaseProtocolId));
                    protocolTitle = biz[Protocol.ProtocolTitle].ToString();
                    string protNum = biz[Protocol.ProtocolNum].ToString();
                    ProtocolNumberLabel.Text = protNum;
                    //if (protNum.Length > 10) ProtocolNumberTd.Attributes["class"] = "ProtocolTitleBarBG_ProtNum_Smallest";
                    //else if (protNum.Length > 7) ProtocolNumberTd.Attributes["class"] = "ProtocolTitleBarBG_ProtNum_Smaller";
                }
                return protocolTitle;
            }
        }
        private DataView metadataSurveys;
        private DataView MetadataSurveys
        {
            get
            {
                if (metadataSurveys == null)
                {
					//MetadataSurvey biz = new MetadataSurvey();
					//biz.GetAll();
                    DataColumn computedTitle = new DataColumn("SurveyTitle", typeof(string), "SurveyType");

                    //metadataSurveys = biz.DataSourceView;
					metadataSurveys = BusinessObject.GetAllAsDataView<MetadataSurvey>();
                    metadataSurveys.RowFilter = MetadataSurvey.SurveyCategory + " = '" + ELIGIBILITY_SURVEY_CATEGORY + "'";
                    metadataSurveys.Table.Columns.Add(computedTitle);
                }
                return metadataSurveys;
            }
        }

        private DataView versionsList;
        private DataView VersionsList
        {
            get
            {
                if (versionsList == null)
                {
					//ProtocolVersion biz = new ProtocolVersion();
					//biz.GetByParent(int.Parse(BaseProtocolId));
					//versionsList = biz.DataSourceView;
					versionsList = BusinessObject.GetByParentAsDataView<ProtocolVersion>(int.Parse(BaseProtocolId));
                }
                return versionsList;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Set titles
                ProtocolLabel.Text = ProtocolTitle;
                BindProtocolVersions();
                // Select Default
                if (VersionsList.Count > 0)
                {
                    object metaSurveyId = VersionsList[0][ProtocolVersion.MetadataSurveyId];
                    if(metaSurveyId!=null && metaSurveyId.ToString()!=string.Empty)
                    {
                        BuildEligibilityQuestionnaire((int)metaSurveyId);
                    }
                }
            }
        }

        /// <summary>
        /// When dropdown value changes, update current editing questionnarire
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PopulateExistingSurvey(object sender, EventArgs e)
        {
            DropDownList surveyList = sender as DropDownList;
            if (surveyList.SelectedItem!=null && !string.IsNullOrEmpty(surveyList.SelectedValue))
            {
                int metaSurveyId = int.Parse(surveyList.SelectedValue);
                BuildEligibilityQuestionnaire(metaSurveyId);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindQuestionsList(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string associatedSurveyId = DataBinder.Eval(e.Row.DataItem, ProtocolVersion.MetadataSurveyId).ToString();
                DropDownList associateSurveyList = e.Row.FindControl("AssociatedSurveyList") as DropDownList;
                Label assocaitedSurveyLabel = e.Row.FindControl("AssocaitedSurveyLabel") as Label;
                ImageButton editBtn = e.Row.FindControl("EditBtn") as ImageButton;
                ImageButton deleteBtn = e.Row.FindControl("DeleteBtn") as ImageButton;
                ImageButton updateBtn = e.Row.FindControl("UpdateBtn") as ImageButton;

                // build list of available surveys
                BuildSurveyDropDowns(associateSurveyList);
                // set assocaited survey
                if (!string.IsNullOrEmpty(associatedSurveyId))
                {
                    associateSurveyList.SelectedValue = associatedSurveyId;
                }
                // if survey is assocaited with version, show label and hide select
                if (!string.IsNullOrEmpty(associatedSurveyId))
                {
                    DataRow[] metaSurveys = MetadataSurveys.Table.Select(MetadataSurvey.MetadataSurveyId + " = " + associatedSurveyId);

                    if (metaSurveys.Length > 0)
                    {
                        // set label text
                        assocaitedSurveyLabel.Text = metaSurveys[0][MetadataSurvey.SurveyType].ToString();
                        // hide dropdown
                        associateSurveyList.Visible = false;
                        // buttons visible when tie exists
                        editBtn.Visible = true;
                        deleteBtn.Visible = true;

                        // hide modify assoication
                        updateBtn.Visible = false;
                    }
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dropDown"></param>
        protected void BuildSurveyDropDowns(DropDownList dropDown)
        {
            MetadataSurveys.Sort = MetadataSurvey.SurveyType + " ASC";
            dropDown.DataSource = MetadataSurveys;
            dropDown.DataBind();
        }

        /// <summary>
        /// Populates datagrid containing protocol versions
        /// </summary>
        private void BindProtocolVersions()
        {
            ProtocolVersionsGrid.DataSource = VersionsList;
            ProtocolVersionsGrid.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="metaSurveyId"></param>
        protected void BuildEligibilityQuestionnaire(int metaSurveyId)
        {
            QuestionsGrid.Visible = true;
            MetadataSurveyId.Value = metaSurveyId.ToString();

            MetadataSurvey biz = new MetadataSurvey();
            biz.Get(metaSurveyId);
            SurveyType.Value = biz[MetadataSurvey.SurveyType].ToString();

			//MetadataSurveyQuestion questionsBiz = new MetadataSurveyQuestion();
			//questionsBiz.GetByParent(metaSurveyId);
			//QuestionsGrid.DataSource = questionsBiz.DataSourceView;
			QuestionsGrid.DataSource = BusinessObject.GetByParentAsDataView<MetadataSurveyQuestion>(metaSurveyId);
            QuestionsGrid.DataBind();

            DataEntryPanel.Visible = true;

            // Detmerine if assoication exits
            DataTable versionsToSurvey = ProtocolMgmtDa.GetProtocolVersionsBySurvey(metaSurveyId);
            // can edit survey when 0 associations or 1 association exists
            bool isGridEditable = !(versionsToSurvey.Rows.Count > 1);

            // Grid is disabled, as well as text fields and buttons for data entry
            QuestionsGrid.Enabled = isGridEditable;
            SurveyType.Enabled = isGridEditable;
            SaveBtn.Visible = isGridEditable;
            AddRowBtn.Visible = isGridEditable;
            ReadOnlyMessage.Visible = !isGridEditable;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MarkSurveyDirty(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(SurveyType.Value))
            {
                surveyDirty = true;
            }
        }

        /// <summary>
        /// Rebinds assocation grid after update
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RebindAssocationOnUpdate(object sender, GridViewUpdatedEventArgs e)
        {
            BindProtocolVersions();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddNewQuestionnaire(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(NewQuestionnaireName.Text))
            {
                MetadataSurvey biz = new MetadataSurvey();
                biz[MetadataSurvey.SurveyCategory] = ELIGIBILITY_SURVEY_CATEGORY;
                biz[MetadataSurvey.SurveyType] = NewQuestionnaireName.Text;
                biz.Save();

                // reset field
                NewQuestionnaireName.Text = string.Empty;

                // build verions
                BindProtocolVersions();
                // set active survey
                BuildEligibilityQuestionnaire((int)biz[MetadataSurvey.MetadataSurveyId]);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="metadataSurveyId"></param>
        private void UpdateMetadataSurvey(int metadataSurveyId)
        {
            MetadataSurvey biz = new MetadataSurvey();
            biz.Get(metadataSurveyId);
            biz[MetadataSurvey.SurveyType] = SurveyType.Value;
            biz.Save();
        }


        #region Button Events

        /// <summary>
        /// Updates Questionnaire grid and title
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveQuestionnaireClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(MetadataSurveyId.Value))
            {
                // get survey id
                int metadataSurveyId = int.Parse(MetadataSurveyId.Value);
                // update MetadataSurvey record if needed
                if (surveyDirty)
                {
                    UpdateMetadataSurvey(metadataSurveyId);
                }
                // update Questions grid
                QuestionsGrid.Save(metadataSurveyId);

                // rebuild grid
                BuildEligibilityQuestionnaire(metadataSurveyId);
            }
        }

        /// <summary>
        /// Loads a metadata survey for editing when clicking row of exisit protocol version surveys
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void EditMetadataSurveyClick(object sender, EventArgs e)
        {
            string selectedMetaSurvey = ((sender as ImageButton).NamingContainer.FindControl("AssociatedSurveyList") as DropDownList).SelectedValue;
            if (!string.IsNullOrEmpty(selectedMetaSurvey))
            {
                int metaSurveyId = int.Parse(selectedMetaSurvey);
                BuildEligibilityQuestionnaire(metaSurveyId);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateAssociationClick(object sender, EventArgs e)
        {
            // locate selected survey
            GridViewRow row = (sender as ImageButton).NamingContainer as GridViewRow;
            string metaSurveyId = (row.FindControl("AssociatedSurveyList") as DropDownList).SelectedValue;
            if (!string.IsNullOrEmpty(metaSurveyId))
            {
                // get pri key
                int versionId = int.Parse(ProtocolVersionsGrid.DataKeys[row.RowIndex][ProtocolVersion.ProtocolVersionId].ToString());
                ProtocolVersion biz = new ProtocolVersion();
                biz.Get(versionId);
                biz[ProtocolVersion.MetadataSurveyId] = metaSurveyId;
                biz.Save();
                // rebind list of versions
                BindProtocolVersions();
                // load survey
                BuildEligibilityQuestionnaire(int.Parse(metaSurveyId));
            }
        }

        /// <summary>
        /// Deletes the association of metadatasurvey a protocol version
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteAssociationClick(object sender, EventArgs e)
        {
            // get versionid for this row and remove association
            int rowIndex = ((sender as ImageButton).NamingContainer as GridViewRow).RowIndex;
            int versionId = (int)ProtocolVersionsGrid.DataKeys[rowIndex][ProtocolVersion.ProtocolVersionId];
            ProtocolVersion version = new ProtocolVersion();
            version.Get(versionId);
            version[ProtocolVersion.MetadataSurveyId] = string.Empty;
            version.Save();
            // rebind list to show changes
            BindProtocolVersions();
        }

        #endregion
    }
}