using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Utilities;

namespace Caisis.UI.Modules.Breast.Reports
{
    public partial class BreastQDefinitions : BaseReportPage
    {
        private CaisisBreastQEngine engine = new CaisisBreastQEngine();

        protected override void Page_Load(object sender, EventArgs e)
        {
            string suurveyType = Request.QueryString["surveyType"] + "";
            IEnumerable<string> surveyTypes = suurveyType.Split(',');
            ViewBreastQDefinitions(surveyTypes);
        }

        protected void ViewBreastQDefinitions(IEnumerable<string> surveyTypes)
        {
            bool doFilter = surveyTypes.Count() > 0;
            CaisisBreastQEngine engine = new CaisisBreastQEngine();
            var surveys = from survey in engine.GetAllDefinitions()
                          from scale in survey.Definitions
                          // optional filter by survey
                          where !doFilter || surveyTypes.Contains(survey.SurveyType, StringComparer.OrdinalIgnoreCase)
                          let def = new
                          {
                              Survey = survey.SurveyType,
                              ScaleName = scale.Scale,
                              ScaleTitle = scale.Title,
                              ScaleAlias = scale.Alias,
                              ScaleQuestions = string.Join(",", scale.Questions),
                              ManualScoring = engine.manualScaleLookup.ContainsKey(scale.Scale).ToString().ToUpper()
                          }
                          group def by survey.SurveyType into g
                          orderby g.Key
                          select new
                            {
                                Survey = g.Key,
                                Definitions = g
                            };

            SurveysRptr.DataSource = surveys;
            SurveysRptr.DataBind();
            SurveysRptr.Visible = true;
        }

        protected void OnBuildDefinitions(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater defRptr = e.Item.FindControl("DefinitionsRptr") as Repeater;
                object definitions = DataBinder.Eval(e.Item.DataItem, "Definitions");
                defRptr.DataSource = definitions;
                defRptr.DataBind();
            }
        }
    }
}