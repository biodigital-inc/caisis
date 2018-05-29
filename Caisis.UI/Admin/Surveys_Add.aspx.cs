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
    public partial class Surveys_Add : AdminBasePage
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            Save();
        }

        /// <summary>
        /// Creates a new MetadataSurvey
        /// </summary>
        private void Save()
        {
            BOL.MetadataSurvey survey = new MetadataSurvey();
            CICHelper.SetBOValues(this.Controls, survey, -1);
            survey.Save();
            int metaSurveyId = (int)survey[survey.PrimaryKeyName];
            // register update client script
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "reloadSurveys", "closeAndReloadSurveys('" + metaSurveyId + "');", true);
        }
    }
}
