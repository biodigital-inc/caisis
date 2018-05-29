<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.EndoTNMStage" CodeFile="EndoTNMStage.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="EndoTNMStage" id="EndoTNMStage" />
<!--<a name="ClinicDate" id="ClinicDate" />--><span class="controlBoxTitle">2002 Clinical TNM Stage</span><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable">
    
    <euc:EformHidden id="ClinStageDate" runat="server" Table="ClinicalStages" Field="ClinStageDate" />
		<euc:EformHidden id="ClinStageDateText" runat="server" Table="ClinicalStages" Field="ClinStageDateText" />
		<euc:EformHidden id="ClinStageDisease" runat="server" Table="ClinicalStages" Field="ClinStageDisease"  Value="Bladder"/>
		<euc:EformHidden id="ClinStageSystem" runat="server" Table="ClinicalStages" Field="ClinStageSystem"  Value="UICC_02"/>
		<euc:EformHidden id="ClinStageQuality" runat="server" Table="ClinicalStages" Field="ClinStageQuality" Value="STD"/>
		
		<euc:EformSelect LookupCode="StageClin_Prostate_02_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" style="width:50px;"  ID="ClinStageT" EnableHiddenOnUIEvent="ClinStageDate,ClinStageDateText,ClinStageDisease,ClinStageSystem,ClinStageQuality"/>
    
    </td>
  </tr>
 
</table>

<br/><br/><br/>