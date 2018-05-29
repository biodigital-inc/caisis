namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	
	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
	///		Summary description for ProstatectomyDetails.
	/// </summary>
	public partial class ProstatectomyDetails : BaseEFormControl
	{
		

		//protected EformRadioButton OpAV_PreservedYes, OpAV_PreservedNo, OpSV_DissectionFirstYes, OpSV_DissectionFirstNo, OpBulldogClampsYes, OpBulldogClampsNo;
		
		protected EformSelect   OpAV_Preserved  ;

		
		protected override void Page_Load(object sender, System.EventArgs e)
		{
			
			// other fields could be a datagrid, but don't have to be
		//	OpClinStageSystem.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpClinStageSystem, null, null, false);
			
		//	OpClinStageT.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpClinStageT, null, null, false);


			//OpAV_PreservedYes.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpAV_Preserved, "1", null, false);
			//OpAV_PreservedNo.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpAV_Preserved, "1", null, false);

			//OpR_AV_Site.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpR_AV_Site, "1", null, false);
			//OpL_AV_Site.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpL_AV_Site, "1", null, false);

			//OpR_AV_Diam.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpR_AV_Diam, "1", null, false);
			//OpL_AV_Diam.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpL_AV_Diam, null, null, false);

			
			
			//OpSV_DissectionFirstYes.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpSV_DissectionFirst, "1", "1", false);
			//OpSV_DissectionFirstNo.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpSV_DissectionFirst, "1", "1", false);

			//OpBulldogClampsYes.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpBulldogClamps, "1", "1", false);
			//OpBulldogClampsNo.SetProperties(Prostatectomy.Table_ProcProstatectomiesOp, Prostatectomy.OpBulldogClamps, "1", "1", false);

			// no place in the table for these
			//OpAV_PreservedLeft.SetProperties("NoTable", "OpAV_PreservedLeft", "1", "1", false);
			//OpAV_PreservedLeft.SetProperties("NoTable", "OpAV_PreservedRight", "1", "1", false);

			//MriVeins.SetProperties("NoTable", "MriViens", null, null, false);
		//	MriUrethralLength.SetProperties("NoTable", "MriUrethralLength", null, null, false);

			//OpApproach.SetProperties("NoTable", "OpApproach", null, null, false);

			//OpPeriprostaticVeins.SetProperties("NoTable", "OpPeriprostaticVeins", null, null, false);

			base.Page_Load(sender, e);
		}
	}
}
