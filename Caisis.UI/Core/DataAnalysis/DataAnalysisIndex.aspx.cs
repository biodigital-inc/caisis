using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.DataAnalysis
{
	/// <summary>
	/// Summary description for DataAnalysisIndex.
	/// </summary>
	public partial class DataAnalysisIndex : FramePage
	{
              
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			if (Request.QueryString["page"] == null || Request.QueryString["page"].Equals(""))
			{
				//set default 
				DataAnalysisContainer.Attributes.Add("src", "DataAnalysisSplash.aspx");
				
			}
			else
			{
				string loadPage = Request.QueryString["page"] + ".aspx";
				DataAnalysisContainer.Attributes.Add("src", loadPage);
			}
            // logs patient view
			base.Page_Load(sender, e);
		}
	}
}
