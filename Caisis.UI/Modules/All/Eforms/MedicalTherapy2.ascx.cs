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
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for MedicalTherapy2.
	/// </summary>
    public partial class MedicalTherapy2 : BaseEFormControl
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			base.BuildMedTx(this._patientId, this._eformName, "Dynamic", "");
            base.SetTitle(ComponentTitle);
//			SetDivDisplay();
		}

		protected void SetDivDisplay()
		{
			bool ShowDiv = false;

			if (MedicalTherapies.Items.Count > 0)
			{
				ShowDiv = true;
			}
			else if (MedTxDateText_11.Text.Length > 0 || MedTxDose_11.Text.Length > 0 || MedTxNotes_11.Text.Length > 0)
			{
				ShowDiv = true;
			}
            else if (MedTxType_11.Value.Length > 0)
			{
				ShowDiv = true;
			}
			else if (MedTxAgent_11.Value.Length > 0 || MedTxInstitution_11.Value.Length > 0 )
			{
				ShowDiv = true;
			}


			if (ShowDiv == true)
			{
				DivDisplay.Text = "block";
				ShowDivScript.Text = "<script>if (document.getElementById('MedTxCheckbox')) document.getElementById('MedTxCheckbox').checked = true;</script>";
			}

		}

	}
}
