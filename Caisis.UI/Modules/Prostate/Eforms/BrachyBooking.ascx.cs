namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.DataAccess;
	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	/// <summary>
	///		Summary description for BrachyBooking.
	/// </summary>
	public partial class BrachyBooking : BaseEFormControl
	{
		

		protected override void Page_Load(object sender, EventArgs e)
		{
			// check if patient already had Brachy- if so disable fields
            Caisis.BOL.BrachyTherapy brachy = new Caisis.BOL.BrachyTherapy();
            brachy.Get(int.Parse(Session[SessionKey.PatientId].ToString()));

            //if (brachy.DataSourceView.Count > 0) // patient already had brachy
			if (!brachy.IsEmpty)
			{
				// select boxes now inherit from combo which inherits from text! so use "disable" again
				//ActionItem.Disabled = true;
				//ActionDateText.Enabled = true;
				//BrachyPrescribedDose.Disabled = true;
				//BrachyIsotope.Disabled = true;
				

				// brandon: EformControls are now (mostly) WebControls
				ActionItem.Enabled = false;
				ActionDateText.Enabled = false;
				BrachyPrescribedDose.Enabled = false;
				BrachyIsotope.Enabled = false;
				
				brachyMsg.Text = "You may not enter brachy data because patient has prior brachy information entered.";
			}
			
			base.Page_Load (sender, e);
		}

		
	}
}
