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
using Caisis.UI.Core;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Plugins.SurveyPlugin
{
    public partial class CannedQuestionsChoose : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                // Build SurveyList dropdown
				//MetadataSurvey metaSurvey = new MetadataSurvey();
				//metaSurvey.GetAll();
				//CannedSurveyList.DataSource = metaSurvey.DataSourceView;
				CannedSurveyList.DataSource = BusinessObject.GetAllAsDataView<MetadataSurvey>();
                CannedSurveyList.DataBind();
            }

        }

        protected void SetQuestions(object sender, EventArgs e)
        {
			//MetadataSurveyQuestion metaQuestion = new MetadataSurveyQuestion();
			//metaQuestion.GetByParent(int.Parse(CannedSurveyList.Value));
            
			//CannedQuestionsRptr.DataSource = metaQuestion.DataSourceView;
			int parentKey = int.Parse(CannedSurveyList.Value);
			CannedQuestionsRptr.DataSource = BusinessObject.GetByParentAsDataView<MetadataSurveyQuestion>(parentKey);
            CannedQuestionsRptr.DataBind();
        }
    }
}
