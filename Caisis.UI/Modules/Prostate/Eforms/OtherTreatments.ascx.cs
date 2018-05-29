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
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
	///		Summary description for MedicationsClinical.
	/// </summary>
	public partial class OtherTreatments : BaseEFormControl
	{
		protected System.Web.UI.WebControls.PlaceHolder MedicalTherapyHolder;
		protected System.Web.UI.WebControls.PlaceHolder RadiationTherapyHolder;
		protected System.Web.UI.WebControls.PlaceHolder BrachyTherapyHolder;
		private BaseEFormControl  MedicalTherapyControl = null;
		private BaseEFormControl  RadiationTherapyControl = null;
		private BaseEFormControl  BrachyTherapyControl = null;


/*
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			if (MedicalTherapyControl == null)
			{
				LoadMedicalTherapy();
			}
			if (RadiationTherapyControl == null)
			{
				LoadRadiationTherapy();
			}
			if (BrachyTherapyControl == null)
			{
				LoadBrachyTherapy();
			}
		}
*/

		protected void LoadMedicalTherapy()
		{
			if (null != MedicalTherapyHolder)
			{
				MedicalTherapyControl = (BaseEFormControl)this.LoadControl("MedicalTherapy.ascx");
				MedicalTherapyHolder.Controls.Add(MedicalTherapyControl);
			}
		}

		protected void LoadRadiationTherapy()
		{
			if (null != RadiationTherapyHolder)
			{
				RadiationTherapyControl = (BaseEFormControl)this.LoadControl("RadiationTherapy.ascx");
				RadiationTherapyHolder.Controls.Add(RadiationTherapyControl);
			}
		}

		protected void LoadBrachyTherapy()
		{
			if (null != BrachyTherapyHolder)
			{
				BrachyTherapyControl = (BaseEFormControl)this.LoadControl("BrachyTherapy.ascx");
				BrachyTherapyHolder.Controls.Add(BrachyTherapyControl);
			}
		}


	}
}
