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
using System.Configuration;
using System.Reflection;

using Caisis.UI.Core.Classes;


namespace Caisis.UI.Core.Utilities
{
	/// <summary>
	/// Summary description for About.
	/// </summary>
	public partial class About : BasePage
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
            //string version = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();
            string major = "6"; //System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.Major.ToString(); 
			string minor = "0.0";  //System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.Minor.ToString(); 

            Culture.Text = System.Threading.Thread.CurrentThread.CurrentUICulture.Name;
            DateFormat.Text = System.Reflection.Assembly.GetExecutingAssembly().GetName().CultureInfo.DateTimeFormat.ShortDatePattern;

            VersionNumber.Text = major + "." + minor; //"." + revision;
		}


	}
}
