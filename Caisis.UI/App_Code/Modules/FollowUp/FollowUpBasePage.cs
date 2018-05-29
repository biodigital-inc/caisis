using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.FollowUp
{
    /// <summary>
    /// Summary description for FollowUpBasePage
    /// </summary>
    public class FollowUpBasePage : SurveyBasePage
    {
        private Dictionary<string, string[]> parsedParameters;
        protected Dictionary<string, string[]> ParsedParameters
        {
            get
            {
                return parsedParameters;
            }
        }

        public FollowUpBasePage()
            : base()
        {
            Init += new EventHandler(InitParsing);
        }

        private void InitParsing(object sender, EventArgs e)
        {
            ParseQueryStringParameters();
        }

        /// <summary>
        /// 
        /// </summary>
        private void ParseQueryStringParameters()
        {
            parsedParameters = new Dictionary<string, string[]>();

            if (Request.QueryString["batchPrint"] != null)
            {
                int numberPatients = Request.QueryString.Count - 1; // minus the batchprint=true variable
                for (int i = 2; i <= numberPatients; i++)
                {
                    string patientId = Request.QueryString.GetKey(i);
                    string[] monthAndSurveyName = Request.QueryString[patientId].Split('_');
                    parsedParameters.Add(patientId, monthAndSurveyName);
                }
            }
        }
    }
}
