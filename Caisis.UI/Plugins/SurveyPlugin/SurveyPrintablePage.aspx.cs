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

namespace Caisis.UI.Plugins.SurveyPlugin
{
    public partial class SurveyPrintablePage : System.Web.UI.Page
    {
        private SurveyDa _surveyData = new SurveyDa();

        private string surveyType;

        protected string SurveyType
        {
            get
            {
                return surveyType;
            }
        }

        protected string QuerySurveyId
        {
            get
            {
                return Request.QueryString["surveyId"];
            }
        }

        protected string QueryView
        {
            get
            {
                return Request.QueryString["view"];
            }
        }

        private int pageCount = 1;
        protected int PageCount
        {
            get
            {
                return pageCount;
            }
        }

        private int surveyId;
        private int? metaSurveyId;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QuerySurveyId))
            {
                surveyId = int.Parse(QuerySurveyId);

                // populate form
                PopulateSurvey(surveyId);

                // handle scoring if needed
                bool doScoring = true;
                string scoring = Request.QueryString["scoring"];
                if (!string.IsNullOrEmpty(scoring))
                {
                    doScoring = bool.Parse(scoring);
                }
                if (doScoring)
                {
                    BindScoringResults(surveyId);
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="surveyId"></param>
        private void PopulateSurvey(int surveyId)
        {
            Survey surveyRecord = new Survey();
            surveyRecord.Get(surveyId);
            // get current type
            surveyType = surveyRecord[Survey.SurveyType].ToString();
            // build edit link
            BuildEditSurveyLink(surveyId, surveyType);

            // Set Survey Values based on Label's with Survey FieldNames as ID
            foreach (string colName in surveyRecord.FieldNames)
            {
                Label fieldLabel = SurveyPanel.FindControl(colName) as Label;
                if (fieldLabel != null)
                {
                    object colVal = surveyRecord[colName];
                    if (colVal != null && colVal is DateTime)
                    {
                        DateTime colDate = (DateTime)colVal;
                        fieldLabel.Text = colDate.ToShortDateString();
                    }
                    else
                    {
                        fieldLabel.Text = colVal.ToString();
                    }
                }
            }
            // set title
            SurveyTypeLabel.InnerText = surveyType;

            // determine which type of view to build
            if (!string.IsNullOrEmpty(QueryView) && QueryView.Equals("advanced", StringComparison.CurrentCultureIgnoreCase))
            {
                // attempt to build complex page, section, question view
                BuildPages(surveyId, surveyType);
            }
            else
            {
                // build normal list of all survey items
                BindSurveyItems(surveyId);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="surveyId"></param>
        private void BindSurveyItems(int surveyId)
        {
            SurveyItemsRptr.DataSource = BusinessObject.GetByParentAsDataView<SurveyItem>(surveyId);
            SurveyItemsRptr.DataBind();

            SimpleView.Visible = true;
            ComplexView.Visible = false;
        }

        /// <summary>
        /// Builds a list of Patient Survey Items (including pages, sections, questions if applicable).
        /// </summary>
        /// <param name="surveyId">The Patient's SurveyId</param>
        /// <param name="surveyType">The type of the Patient's Survey</param>
        private void BuildPages(int surveyId, string surveyType)
        {
            // get a list of meta surveys which match patient survey type
            var metaSurveys = BusinessObject.GetByFields<MetadataSurvey>(
                new Dictionary<string, object>()
                {
                    { MetadataSurvey.SurveyType , surveyType } 
                });

            // use advanced layout
            if (metaSurveys.Count() > 0)
            {
                // use first meta survey to generate advanced survey
                metaSurveyId = (int)metaSurveys.First()[MetadataSurvey.MetadataSurveyId];
                DataView pagesView = _surveyData.GetPatientMetaSurveyPages(metaSurveyId.Value, surveyId).DefaultView;
                // set page count
                pageCount = pagesView.Count;

                // build pages
                PagesRptr.DataSource = pagesView;
                PagesRptr.DataBind();

                //var visibleQuestions = from page in PagesRptr.Items.Cast<RepeaterItem>()
                //                       let sectionRptr = page.FindControl("SectionsRptr") as Repeater
                //                       where sectionRptr.Items.Count > 0 && sectionRptr.Visible
                //                       select page;
                //sectionsRptr.Visible = visibleQuestions.Count() > 0;


                SimpleView.Visible = false;
                ComplexView.Visible = true;
            }
            // use simple layout
            else
            {
                BindSurveyItems(surveyId);
            }
        }

        /// <summary>
        /// Build a list of Sections in a Page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildPageSections(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string page = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.Page).ToString();

                RepeaterItem pageRow = e.Item;
                Repeater sectionsRptr = pageRow.FindControl("SectionsRptr") as Repeater;

                DataView sectionsView = _surveyData.GetPatientMetaSurveySections(metaSurveyId.Value, surveyId).DefaultView;
                sectionsView.RowFilter = MetadataSurveyQuestion.Page + " = '" + page.Replace("'", "''") + "'";
                sectionsRptr.DataSource = sectionsView;
                sectionsRptr.DataBind();

                sectionsRptr.DataSource = sectionsView;
                sectionsRptr.DataBind();
            }
        }

        /// <summary>
        /// Build a list of Questions in a Section
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildPageSectionQuestions(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string page = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.Page).ToString();
                string section = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.Section).ToString();
                RepeaterItem sectionRow = e.Item as RepeaterItem;
                Repeater questionsRptr = sectionRow.FindControl("QuestionsRptr") as Repeater;

                DataView sectionQuestionsView = _surveyData.GetPatientMetaSurveySectionQuestions(metaSurveyId.Value, surveyId, page, section).DefaultView;
                sectionQuestionsView.RowFilter = SurveyItem.SurveyItemId + " IS NOT NULL";

                questionsRptr.DataSource = sectionQuestionsView;
                questionsRptr.DataBind();
            }
        }

        /// <summary>
        /// Hide empty sections, and empty pages
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetContentVisibility(object sender, EventArgs e)
        {
            List<Label> pageLabels = new List<Label>();
            foreach (RepeaterItem page in PagesRptr.Items)
            {
                bool showPage = false;
                Repeater sectionsRptr = page.FindControl("SectionsRptr") as Repeater;
                Label pageNumbering = page.FindControl("PageNumberNav") as Label;
                foreach (RepeaterItem section in sectionsRptr.Items)
                {
                    Repeater questionsRptr = section.FindControl("QuestionsRptr") as Repeater;
                    section.Visible = questionsRptr.Items.Count > 0;
                    // if there are questions in section, show seciton, and in turn, page
                    if (questionsRptr.Items.Count > 0)
                    {
                        section.Visible = true;
                        showPage = true;
                    }
                    else
                    {
                        section.Visible = false;
                    }
                }
                page.Visible = showPage;
                if (page.Visible)
                {
                    pageLabels.Add(pageNumbering);
                }
            }
            // set page labels
            int totalPages = pageLabels.Count();
            for (int i = 0; i < totalPages; i++)
            {
                Label pageLabel = pageLabels.ElementAt(i);
                int pageNumber = i + 1;
                pageLabel.Text = string.Format("{0}/{1}", pageNumber, totalPages);
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        protected string GetToggleViewQueryString(string type)
        {
            var pairs = Caisis.UI.Core.Classes.PageUtil.GetUrlPairs(Request.QueryString.ToString());
            if (pairs.ContainsKey("view"))
            {
                pairs["view"] = type;
            }
            else
            {
                pairs.Add("view", type);
            }
            return Caisis.UI.Core.Classes.PageUtil.CreateUrlPairs(pairs);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="surveyId"></param>
        private void BindScoringResults(int surveyId)
        {
            DataTable scoresDt = SurveyScoringUtil.FillScores(surveyId);
            if (scoresDt.Rows.Count > 0)
            {
                ScoresPanel.Visible = true;
                SurveyScoresRptr.DataSource = scoresDt.DefaultView;
                SurveyScoresRptr.DataBind();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="surveyId"></param>
        /// <param name="surveyType"></param>
        private void BuildEditSurveyLink(int surveyId, string surveyType)
        {
            string url = string.Format("SurveyWizardPage.aspx?surveyId={0}&surveyType={1}", surveyId, surveyType);
            EditBtn.NavigateUrl = url;
            EditBtn.Visible = true;
            ViewBtnContainer.Visible = true;
        }
    }
}
