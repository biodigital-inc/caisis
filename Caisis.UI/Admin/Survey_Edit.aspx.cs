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
using Caisis.PluginFramework;
using Caisis.UI.Core;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Survey_Edit : AdminBasePage
    {
        private int max = 1;
        private bool surveyDirty = false;

        protected string QueryMetaSurveyId
        {
            get
            {
                return Request.QueryString["metadataSurveyId"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                BuildSurveyList();
                if (!string.IsNullOrEmpty(QueryMetaSurveyId))
                {
                    SurveyList.Value = QueryMetaSurveyId;
                    BindQuestionsGrid(SurveyList, e);
                }
            }
        }

        /// <summary>
        /// Binds the SurveyList dropdown to list of Surveys in meta table
        /// </summary>
        protected void BuildSurveyList()
        {
            DataView surveys = BusinessObject.GetAllAsDataView<MetadataSurvey>();
            surveys.Sort = MetadataSurvey.SurveyType + " ASC";
            SurveyList.DataSource = surveys;
            SurveyList.DataBind();
        }

        /// <summary>
        /// Binds Questions belonging to selected Meta Survey
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindQuestionsGrid(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(SurveyList.Value))
            {
                SurveyQuestionsGrid.Visible = true;
                SaveBtn.Visible = true;
                PreviewBtn.Visible = true;

                int metaSurveyId = int.Parse(SurveyList.Value);
                string metaSurveyName = SurveyList.SelectedItem.Text;

                // Set Preview URL
                string previewURL = "~/Plugins/SurveyPlugin/SurveyWizardPage.aspx?surveyType=" + metaSurveyName + "&preview=true";
                PreviewBtn.NavigateUrl = previewURL;
                //MetadataSurveyQuestion metaQuestion = new MetadataSurveyQuestion();
                //metaQuestion.GetByParent(metaSurveyId);

                //DataView questionsView = metaQuestion.DataSourceView;
                DataView questionsView = BusinessObject.GetByParentAsDataView<MetadataSurveyQuestion>(metaSurveyId);
                questionsView.Table.Columns.Add(new DataColumn("ColSortOrder", typeof(Int32), "ISNULL(SortNumber," + int.MaxValue + ")"));
                questionsView.Sort = "ColSortOrder ASC";
                SurveyQuestionsGrid.DataSource = questionsView;
                SurveyQuestionsGrid.DataBind();

                // set survey fields, title version etc...
                MetadataSurvey biz = new MetadataSurvey();
                biz.Get(metaSurveyId);
                CICHelper.SetFieldValues(SurveyFields.Controls, biz);

                SurveyFields.Visible = true;
                PreviewBtn.Visible = true;
                DeleteBtn.Visible = true;
            }
            else
            {
                SurveyFields.Visible = false;
                SurveyQuestionsGrid.Visible = false;
                SaveBtn.Visible = false;
                PreviewBtn.Visible = false;
                DeleteBtn.Visible = false;
            }
        }

        /// <summary>
        /// Automatically assigns a SortNumber to all rows if not there.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetSortNumber(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CaisisTextBox sortNum = e.Row.FindControl("SortNumber") as CaisisTextBox;
                string num = DataBinder.Eval(e.Row.DataItem, "SortNumber").ToString();
                if (string.IsNullOrEmpty(num))
                {
                    sortNum.Value = max.ToString();
                    max++;
                }
                else
                {
                    max = int.Parse(num) + 1;
                }
            }
        }

        /// <summary>
        /// Adds client script to copy ResponseText to Response Value (if empty)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetResponseCopyEvent(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CaisisTextBox responseText = e.Row.FindControl("ResponseTextField") as CaisisTextBox;
                CaisisTextBox responseValue = e.Row.FindControl("ResponseValueField") as CaisisTextBox;
                string jsOnBlur = "if(document.getElementById('" + responseValue.ClientID + "').value=='') { document.getElementById('" + responseValue.ClientID + "').value = document.getElementById('" + responseText.ClientID + "').value; }";
                responseText.Attributes["onblur"] = jsOnBlur;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="icic"></param>
        /// <param name="e"></param>
        protected void MarkSurveyDirty(ICaisisInputControl icic, EventArgs e)
        {
            surveyDirty = true;
        }

        protected void CreateNewSurvey(object sender, EventArgs e)
        {
            // Create new Survey Record
            MetadataSurvey biz = new MetadataSurvey();
            CICHelper.SetBOValues(CreateSurveyLayer.Controls, biz, 0);
            biz.Save();

            // Rebind list of Surveys and set selcted as new Survey
            BuildSurveyList();
            SurveyList.Value = biz[MetadataSurvey.MetadataSurveyId].ToString();

            // Reset Values In New Survey Layer
            CICHelper.ClearCaisisInputControlValues(CreateSurveyLayer);

            // Bind Grid
            BindQuestionsGrid(sender, e);
        }

        /// <summary>
        /// Saves the metadata for Survey and its questions and responses
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveQuestions(object sender, EventArgs e)
        {
            int metaSurveyId = int.Parse(SurveyList.Value);
            // update survey if needed
            if (surveyDirty)
            {
                MetadataSurvey biz = new MetadataSurvey();
                biz.Get(metaSurveyId);
                CICHelper.SetBOValues(SurveyFields.Controls, biz, -1);
                biz.Save();
                // rebuild survey list to reflect updated title,etc...
                BuildSurveyList();
                // select survey
                SurveyList.Value = metaSurveyId.ToString();
            }

            SurveyQuestionsGrid.Save(metaSurveyId);

            // Rebind Grid
            BindQuestionsGrid(sender, e);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteSurvey(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(SurveyList.Value))
            {
                // delete metadata survey
                MetadataSurvey biz = new MetadataSurvey();
                biz.Delete(int.Parse(SurveyList.Value));

                // reload page to ensure polling fresh data
                Page.ClientScript.RegisterStartupScript(this.GetType(), "closeAndReloadSurveys", "closeAndReloadSurveys();", true);
                //Response.Redirect("AdminSurveyPage.aspx", true);
            }
        }
    }
}
