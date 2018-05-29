namespace Caisis.UI.Modules.Breast.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for BiopsiesSurveyBreast.
	/// </summary>
    public partial class BiopsiesSurveyBreast : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            string searchFilter = "'Breast Biopsies'";
            BuildBreastSurveys(this._patientId, this._eformName, "Dynamic", Survey.SurveyType, " IN ", searchFilter);

		}

        protected void BuildBreastSurveys(int PatientID, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        {
            SurveyDa surveyDa = new SurveyDa();

            DataSet surveyDs = surveyDa.FormGetSpecialRecords(PatientID, FormName, FormType, searchField, searchClause, searchFilter);
            if (surveyDs.Tables.Count > 0 && surveyDs.Tables[0].Rows.Count > 0)
            {
                SurveysHistory.DataSource = surveyDs.Tables[0].DefaultView;
                SurveysHistory.DataBind();
            }

        }


		


	}
}
