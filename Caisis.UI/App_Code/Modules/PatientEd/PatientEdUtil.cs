using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Modules.PatientEd
{
	/// <summary>
	/// Summary description for PatientEdUtil
	/// </summary>
	public class PatientEdUtil
	{
		public PatientEdUtil()
		{

		}

		/// <summary>
		/// Gets a javascript function to setting page titles
		/// </summary>
		/// <returns></returns>
		public static string GetFriendlyJavascriptTitle(string title, string sectionId, string sectionName, string topicId, string topicName, string subTopicId, string subTopicName, string type)
		{
			string output = "<span id=\"";
			string id = "Section" + sectionId;
			if (type == "Topic")
			{
				id = "Topic" + topicId;
			}
			else if (type == "SubTopic")
			{
				id = "SubTopic" + subTopicId;
			}
			output += id + "\" ";
			string[] argList = new string[] { sectionId, sectionName, topicId, topicName, subTopicId, subTopicName };
			for (int i = 0; i < argList.Length; i++)
			{
				string argVal = argList[i];
				// Need to escape single quotes for js string
				argVal = PageUtil.EscapeSingleQuotes(argVal);
				// HTML encode to escape unusually characters
				argVal = HttpContext.Current.Server.HtmlEncode(argVal);
				argList[i] = argVal;
			}
			string args = "'" + String.Join("','", argList) + "'";
			output += "onclick=\"setHiddenTitles(" + args + ",event);\">";
			output += title;
			output += "</span>";
			return output;
		}

		/// <summary>
		/// Pushes a list of subTopicIds onto a global SubTopicKeyList array.
		/// </summary>
		/// <param name="page"></param>
		/// <param name="sectionId"></param>
		/// <param name="subTopicIds"></param>
		public static void RegisterStartupSubTopicIds(Page page, int sectionId, List<string> subTopicIds)
		{
			if (subTopicIds.Count > 0)
			{
				string javascriptBlock = string.Join(",", subTopicIds.ToArray());
				// Global js array defined on page called SubTopicKeyList
				// Each section pushes onto this array a list of its child subtopic ids
				// Unique key is used for startup script, so values aren't overwritten
				javascriptBlock = "SubTopicKeyList.push(" + javascriptBlock + ");";
				string uniqueJSKey = "UniqueTopicSection" + sectionId;
				page.ClientScript.RegisterClientScriptBlock(page.GetType(), uniqueJSKey, javascriptBlock, true);
			}
		}
	}
}
