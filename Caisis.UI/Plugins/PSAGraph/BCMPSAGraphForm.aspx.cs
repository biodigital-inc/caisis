using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Resources;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.UI;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Plugins.PSAGraph
{
	/// <summary>
	/// Summary description for WebForm1.
	/// </summary>
	public partial class BCMPSAGraphForm : BasePage
	{
		public string patientId;

		protected override void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			patientId = "";
			if (Session[SessionKey.PatientId] != null && Session[SessionKey.PatientId].ToString().Length > 0)
			{
				patientId = Session[SessionKey.PatientId].ToString();
			}
          // if(this.Cache["psaGraphSprocsInstalled"] == null)
          //      installPsaGraphSprocs();
		}

		/*
        private void installPsaGraphSprocs()
        {
            if(!BCMPSAGraphDA.areSprocsInstalled())
            {
                ResourceManager rm = new ResourceManager( this.GetType() );
                ResourceSet rs = rm.GetResourceSet( System.Globalization.CultureInfo.CurrentCulture, true, true );
                BCMPSAGraphDA.installSprocs(rs.GetString("sprocs"));
            }
            this.Cache["psaGraphSprocsInstalled"] = true;
        }
		*/

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
		}
		#endregion
	}
}
