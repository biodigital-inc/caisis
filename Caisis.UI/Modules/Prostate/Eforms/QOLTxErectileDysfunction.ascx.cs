namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;

	using System.Collections;


	/// <summary>
    ///		Summary description for QOLTxErectileDysfunction.
	/// </summary>
    public partial class QOLTxErectileDysfunction : BaseEFormControl
	{
		protected EformTextBox DateMildContinenceAchieved, DateTotalContinenceAchieved;

		// protected Literal Inc_Stub, Stric_Stub;




		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

            base.BuildQOL_Therapy(this._patientId, this._eformName, "Dynamic");
		}

 


	}
}
