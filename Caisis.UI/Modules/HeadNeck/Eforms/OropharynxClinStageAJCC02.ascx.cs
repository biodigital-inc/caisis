namespace Caisis.UI.Modules.HeadNeck.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	/// <summary>
    ///		Summary description for OropharynxClinStageAJCC02.
	/// </summary>
    public partial class OropharynxClinStageAJCC02 : BaseEFormControl
	{

		protected override void Page_Load(object sender, EventArgs e)
		{

            //ClinStageT.Attributes.Add("OnBlur", "setClinStageHiddenFields('" + ClinStageT.ClientID + "','" + ClinStageN.ClientID + "', '" + ClinStageM.ClientID +
            //                                                              "','" + ClinStageDisease.ClientID + "', '" + ClinStageSystem.ClientID + "','" + ClinStageQuality.ClientID + "');");

            //ClinStageN.Attributes.Add("OnBlur", "setClinStageHiddenFields('" + ClinStageT.ClientID + "','" + ClinStageN.ClientID + "', '" + ClinStageM.ClientID +
            //                                                              "','" + ClinStageDisease.ClientID + "', '" + ClinStageSystem.ClientID + "','" + ClinStageQuality.ClientID + "');");
            //ClinStageM.Attributes.Add("OnBlur", "setClinStageHiddenFields('" + ClinStageT.ClientID + "','" + ClinStageN.ClientID + "', '" + ClinStageM.ClientID +
            //                                                              "','" + ClinStageDisease.ClientID + "', '" + ClinStageSystem.ClientID + "','" + ClinStageQuality.ClientID + "');");			

            base.Page_Load (sender, e);
            base.SetTitle(ComponentTitle);
		}

		
	}
}
