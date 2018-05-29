namespace Caisis.UI.Modules.All.Eforms
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
    ///		Summary description for EncountersSurveysMobility.
	/// </summary>
    public partial class EncountersSurveysMobility : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            
            TodaysDate_OccWall.Attributes.Add("onclick", "SetDate(this, '" + SurveyDateText_OccWall.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + SurveyType_OccWall.ClientID + "');");
            TodaysDate_LEFS.Attributes.Add("onclick", "SetDate(this, '" + SurveyDateText_LEFS.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + SurveyType_LEFS.ClientID + "');");
            TodaysDate_Bartel.Attributes.Add("onclick", "SetDate(this, '" + SurveyDateText_Bartel.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + SurveyType_Bartel.ClientID + "');");
            TodaysDate_TUG.Attributes.Add("onclick", "SetDate(this, '" + SurveyDateText_TUG.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + SurveyType_TUG.ClientID + "');");

		}



		


	}
}
