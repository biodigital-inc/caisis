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
using Caisis.PluginFramework;
using Caisis.UI.Core;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Survey_EditResponses : AdminBasePage
    {

        protected string QueryAction
        {
            get
            {
                return Request.QueryString["action"];
            }
        }

        protected string MetaSurveyId
        {
            get
            {
                return Request.QueryString["metaSurveyId"];
            }
        }

        protected string MetaQuestionId
        {
            get
            {
                return Request.QueryString["metaQuestionId"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                int? surveyId = null;
                int? questionId = null;
                if (!string.IsNullOrEmpty(MetaSurveyId))
                {
                    surveyId = int.Parse(MetaSurveyId);
                }
                if (!string.IsNullOrEmpty(MetaQuestionId))
                {
                    questionId = int.Parse(MetaQuestionId);
                }
                if (QueryAction == "load")
                {
                    if (surveyId.HasValue)
                    {
                        IEnumerable<MetadataSurveyQuestion> questions = new MetadataSurveyQuestion[0];
                        // load single question
                        if (questionId.HasValue)
                        {
                            MetadataSurveyQuestion question = new MetadataSurveyQuestion();
                            question.Get(questionId.Value);
                            questions = new MetadataSurveyQuestion[] { question };
                        }
                        // load all questions
                        else
                        {
                            questions = BusinessObject.GetByParent<MetadataSurveyQuestion>(surveyId.Value);
                        }

                        // data bind
                        DataView questionsView = questions.AsDataView<MetadataSurveyQuestion>();
                        questionsView.Table.Columns.Add(new DataColumn("ColSortOrder", typeof(Int32), "ISNULL(SortNumber," + int.MaxValue + ")"));
                        questionsView.Sort = "ColSortOrder ASC";

                        ReadOnlyRptr.DataSource = questionsView;
                        ReadOnlyRptr.DataBind();
                    }
                }
                else if (QueryAction == "delete")
                {
                    if (questionId.HasValue)
                    {
                        MetadataSurveyQuestion question = new MetadataSurveyQuestion();
                        question.Delete(questionId.Value);
                    }
                }
                PopulateForm(questionId);
            }
        }

        protected void SaveClick(object sender, EventArgs e)
        {
            Save();
        }

        protected void DeleteClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(MetaQuestionId))
            {
                MetadataSurveyQuestion question = new MetadataSurveyQuestion();
                question.Delete(int.Parse(MetaQuestionId));
            }
            ReloadMainPage(MetaSurveyId);
        }

        protected void CancelClick(object sender, EventArgs e)
        {
            ReloadMainPage(MetaSurveyId);
        }

        protected void SetInputControls(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemIndex > -1)
            {
                Control container = e.Item.FindControl("QuestionResponseControl");
                Label label = e.Item.FindControl("QuestionText") as Label;
                string controlType = DataBinder.Eval(e.Item.DataItem, "ResponseControlType").ToString();
                int questionId = (int)DataBinder.Eval(e.Item.DataItem, "MetadataSurveyQuestionId");
                if (!string.IsNullOrEmpty(controlType))
                {
                    ICaisisInputControl iInputControl = CICHelper.InvokeInputControl(controlType);
                    iInputControl.ShowLabel = false;
                    Control input = iInputControl as Control;
                    container.Controls.Add(input);
                    label.AssociatedControlID = input.ID;
                    if (input is ListControl)
                    {
                        DataView listData = BOL.BusinessObject.GetByParentAsDataView<BOL.MetadataQuestionResponse>(questionId);
                        ListControl iListInput = input as ListControl;

                        iListInput.DataTextField = "ResponseText";
                        iListInput.DataValueField = "ResponseValue";
                        iListInput.DataSource = listData;
                        iListInput.DataBind();
                    }
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

        private void PopulateForm(int? questionId)
        {
            // populate question
            if (questionId.HasValue)
            {
                MetadataSurveyQuestion question = new MetadataSurveyQuestion();
                question.Get(questionId.Value);
                CICHelper.SetFieldValues(this.Controls, question);
            }
            else
            {
                CICHelper.ClearCaisisInputControlValues(this);
            }

            // populate responses
            PopulateResponses(questionId);

            QuestionId.Value = questionId.HasValue ? questionId.Value.ToString() : "";

        }

        private void PopulateResponses(int? questionId)
        {
            DataView responses = null;
            if (questionId.HasValue)
            {
                responses = BusinessObject.GetByParentAsDataView<MetadataQuestionResponse>(questionId.Value);
            }
            else
            {
                responses = new MetadataQuestionResponse[0].AsDataView<MetadataQuestionResponse>();
            }
            SurveyQuestionResponsesGrid.DataSource = responses;
            SurveyQuestionResponsesGrid.DataBind();
        }

        private void Save()
        {
            int? questionId = null;
            int surveyId = int.Parse(MetaSurveyId);
            // save question
            MetadataSurveyQuestion question = new MetadataSurveyQuestion();
            if (!string.IsNullOrEmpty(QuestionId.Value))
            {
                questionId = int.Parse(QuestionId.Value);
                question.Get(questionId.Value);
            }
            else
            {
                question[MetadataSurveyQuestion.MetadataSurveyId] = surveyId;
            }
            CICHelper.SetBOValues(this.Controls, question, surveyId);
            question.Save();
            questionId = (int)question[MetadataSurveyQuestion.MetadataSurveyQuestionId];

            // save responses
            SurveyQuestionResponsesGrid.Save(questionId.Value);

            // rebuild form
            PopulateForm(questionId);
            ReloadMainPage(surveyId.ToString());
        }

        private void ReloadMainPage(string surveyId)
        {
            // update script
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "loadSurveyQuestions", "parent.loadSurveyQuestions('" + surveyId + "', '');", true);

        }
    }
}