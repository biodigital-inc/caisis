namespace Caisis.UI.Modules.Prostate.Eforms
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
	///		Summary description for ClinStage_ProstateUICC02.
	/// </summary>
	public partial class ClinStage_ProstateUICC02 : BaseEFormControl
	{

		protected override void Page_Load(object sender, EventArgs e)
		{
			string disease = "Prostate";
			string stageSystem = "UICC_02";
			string quality = "EformRev";
			
			string strJScript	 = "<SCRIPT LANGUAGE=javascript>\n";
			strJScript			+= "<!-- \n";
			strJScript			+= "function setClinStageHiddenFields(){";
			strJScript			+= "	if(document.forms[0]." + ClinStageT.ClientID + ".value != ''){";
			strJScript			+= "		document.forms[0]." + ClinStageDisease.ClientID + ".value = '" + disease + "';";
			strJScript			+= "		document.forms[0]." + ClinStageSystem.ClientID + ".value = '" + stageSystem + "';";
			strJScript			+= "		document.forms[0]." + ClinStageQuality.ClientID + ".value = '" + quality + "';";
			strJScript			+= "	}else{";
			strJScript			+= "		document.forms[0]." + ClinStageDisease.ClientID + ".value = '';";
			strJScript			+= "		document.forms[0]." + ClinStageSystem.ClientID + ".value = '';";
			strJScript			+= "		document.forms[0]." + ClinStageQuality.ClientID + ".value = '';";
			strJScript			+= "	}";
			strJScript			+= "}";
			strJScript			+= "\n//--></SCRIPT>";

			Page.RegisterClientScriptBlock("jsScript1", strJScript);
	
			
			
			ClinStageT.Attributes.Add("OnChange", "setClinStageHiddenFields();");
			
			base.Page_Load (sender, e);
		}

		
	}
}
