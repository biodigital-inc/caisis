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
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;


	/// <summary>
    ///		Summary description for Disposition_NP.
	/// </summary>
    public partial class Disposition_NP : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildDispositionProtocols(this._patientId, this._eformName, "Dynamic");
		}


		protected void BuildDispositionProtocols(int PatientID, string FormName, string FormType)
		{
				
			PatientProtocolDa protocolsDa = new PatientProtocolDa();
			DataSet protcolsDs = protocolsDa.FormGetRecords(PatientID, FormName, FormType);
			if (protcolsDs.Tables.Count > 0 && protcolsDs.Tables[0].Rows.Count > 0)
			{
				hpiProtocols.DataSource = protcolsDs.Tables[0].DefaultView;
				hpiProtocols.DataBind();
				NoProtocolsMsgRow.Visible = false;
			}

		}


	}
}
