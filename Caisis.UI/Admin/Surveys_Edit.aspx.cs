using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using Caisis.BOL;
using Caisis.DataAccess;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Surveys_Edit : AdminBasePage
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                BuildSurveys();
            }
            AddRemoveBtn.Visible = QueryDiseaseId.HasValue;
        }

        /// <summary>
        /// Builds a list of avaiable surveys (optionally filtered by disease)
        /// </summary>
        private void BuildSurveys()
        {
            DataView surveys;
            // filter by disease
            if (QueryDiseaseId.HasValue)
            {
                Caisis.Controller.DiseaseController dc = new Caisis.Controller.DiseaseController();
                surveys = dc.GetTableRecordsByDisease(QueryDiseaseId.Value, new MetadataSurvey().TableName).DefaultView;
                surveys.RowFilter = Disease.DiseaseId + " IS NOT NULL";
            }
            // otherwise normal
            else
            {
                surveys = BOL.BusinessObject.GetAllAsDataView<BOL.MetadataSurvey>();
            }
            surveys.Sort = BOL.MetadataSurvey.SurveyType + " ASC";
            SurveysRptr.DataSource = surveys;
            SurveysRptr.DataBind();

            NoTablesMessage.Visible = surveys.Count == 0;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(CurrentSurveyId.Value))
            {
                // delete survey
                MetadataSurvey biz = new MetadataSurvey();
                biz.Delete(int.Parse(CurrentSurveyId.Value));
                // reload page to ensure polling fresh data
                Response.Redirect("Surveys_Edit.aspx?diseaseId=" + QueryDiseaseId, true);
            }
        }
    }
}