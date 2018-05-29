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
using Caisis.UI.Core.Classes;

public partial class Modules_PatientEducation_SubTopicCallBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

		// NOTE: this needs to be modified so it can handle profiles for "No Patient"
        string subTopicIdString = Request.Form["SubTopicId"];
        if (!string.IsNullOrEmpty(subTopicIdString))
        {
            int subTopicId = int.Parse(subTopicIdString);

            PatientEducationDa da = new PatientEducationDa();
            DataRow dr = da.GetSubTopicProfileContent(subTopicId);
            string subTopicName = PageUtil.EscapeSingleQuotes(dr[PatientEdSubTopic.SubTopicName].ToString());
			// Content is literal HTML, so any newlines must be stripped or replaces with <br />
            string subTopicContent = PageUtil.EscapeSingleQuotes(dr[PatientEdSubTopic.SubTopicContent].ToString());
			subTopicContent = subTopicContent.Replace("\r\n", " ");
			subTopicContent = subTopicContent.Replace("\n", " ");
            string topicId = PageUtil.EscapeSingleQuotes(dr[PatientEdTopic.TopicId].ToString());
            string topicName = PageUtil.EscapeSingleQuotes(dr[PatientEdTopic.TopicName].ToString());
            string topicContent = PageUtil.EscapeSingleQuotes(dr[PatientEdTopic.TopicDescription].ToString());
            string sectionId = PageUtil.EscapeSingleQuotes(dr[PatientEdSection.SectionId].ToString());
            string sectionName = PageUtil.EscapeSingleQuotes(dr[PatientEdSection.SectionName].ToString());
            string sectionContent = PageUtil.EscapeSingleQuotes(dr[PatientEdSection.SectionDescription].ToString());

            string jsString = "['" + subTopicName + "','" + subTopicContent + "','" + topicId + "','" + topicName + "','" + topicContent + "','" + sectionId + "','" + sectionName + "','" + sectionContent + "']";

            Response.Write(jsString);
        }
    }
}
