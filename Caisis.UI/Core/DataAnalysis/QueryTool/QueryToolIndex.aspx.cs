using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.Security;
using Caisis.DataAccess;
using Caisis.QueryTool;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.DataAnalysis.QueryTool
{
	/// <summary>
	/// Summary description for QueryToolIndex.
	/// </summary>
	public partial class QueryToolIndex : BasePage
	{

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            if( !this.IsPostBack )
            {
                QueryView.SQLConnectionString = CaisisConfiguration.GetWebConfigValue("dbConnectionString");
                QueryView.UserName = GetInstanceOwner();
                QueryView.QueryTableName = "Patients";
                QueryView.SavedQueriesTableName = "savedqueries";
            }
			QueryView.DatasetSql = CacheManager.GetDatasetSQL(Page.Session[SessionKey.DatasetId]);
        }

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
            //QueryView.SelectedResultChanged += new EventHandler(QueryView_OnSelectedResultChanged);

        }
        #endregion

        private void QueryView_OnSelectedResultChanged( object sender, EventArgs e )
        {
            string[] _args = ((SelectedResultChangedEventArgs)e).Selection;
		
            Session[SessionKey.PatientId]	= Int32.Parse( _args[0] );
            Session[SessionKey.PtFirstName]	= _args[1];
            Session[SessionKey.PtLastName]	= _args[2];
            Session[SessionKey.PtMRN]		= _args[3];
//          commented out 5/5/2005 SCK - This version of Caisis does not contain a "PtFullName" session key.
//            Session[SessionKey.PtFullName]	= "";


            String url = formatUrl(Session[SessionKey.PatientId].ToString());
            String scriptString = "<script language=JavaScript>";
            scriptString += "parent.location='"+ url +"';";
            scriptString += "</script>";

            this.RegisterClientScriptBlock("Startup", scriptString);
        }
        protected string formatUrl(string patientID)
        {
            string urlVars = "epid="+CustomCryptoHelper.Encrypt(patientID)+"&patientList=yes";
            StringBuilder sb = new StringBuilder(Request.ApplicationPath);
            sb.Append("/Core/DataEntryForms/index.aspx?");
            sb.Append(urlVars);
            sb.Append("&verifyPatientId=true");
            return sb.ToString();
        }

        private string GetInstanceOwner()
        {
            SecurityController _sc = new SecurityController();
            UserDa _uda = new UserDa();
            int _userid = _uda.GetUserId( _sc.GetUserName() );

            return _userid.ToString();
        }
	}
}
