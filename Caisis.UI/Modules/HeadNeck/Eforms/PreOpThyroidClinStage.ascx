<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.PreOpThyroidClinStage" CodeFile="PreOpThyroidClinStage.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="PreOpThyroidClinStage" id="PreOpThyroidClinStage" />
<span class="controlBoxTitle">Pre-Op Clinical TNM Stage (AJCC 2002)</span><br/>

<euc:EformHidden Table="ClinicalStages" Field="ClinStageDisease" id="ClinStageDisease" runat="server" Value="Thyroid" />
<euc:EformHidden Table="ClinicalStages" Field="ClinStageQuality" id="ClinStageQuality" runat="server" Value="STD" />
<euc:EformHidden id="ClinStageSystem" runat="server" Table="ClinicalStages" Field="ClinStageSystem"  Value="UICC_02"/>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>T Stage </strong>
		
		<euc:EformRadioButtonList LookupCode="StageClin_Thyroid_02_T" Table="ClinicalStages" Field="ClinStageT" id="ClinStageT" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="7" runat="server" EnableHiddenOnUIEvent="ClinStageDisease,ClinStageQuality,ClinStageSystem" />		

	</td>
</tr>
<tr>
	
	<td style="padding-top: 18px;">
		
		<strong>N Stage </strong>
		
		<euc:EformRadioButtonList LookupCode="StageClin_Thyroid_02_N" Table="ClinicalStages" Field="ClinStageN" id="ClinStageN" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="7" runat="server" EnableHiddenOnUIEvent="ClinStageDisease,ClinStageQuality,ClinStageSystem" />		

	</td>	
  </tr>
 <tr >
	<td style="padding-top:18px;">
		<strong>M Stage </strong>
		
		<euc:EformRadioButtonList LookupCode="StageClin_Thyroid_02_M" Table="ClinicalStages" Field="ClinStageM" id="ClinStageM" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="7" runat="server" EnableHiddenOnUIEvent="ClinStageDisease,ClinStageQuality,ClinStageSystem" />		
	</td>
</tr>  


</table>
<br/><br/><br/>
