<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.ClinStageBreastAJCC02" CodeFile="ClinStageBreastAJCC02.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<br/>

<a name="ClinStageBreastAJCC02" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Clinical Stage (Pancreas, UICC_02)"></asp:Label><br/>
<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
   
          <tr>
				<td  class="controlBoxDataGridTitleColumn" align="center">Date</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Distant Metastasis (M)</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Side</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">&nbsp;</td>
		  </tr>
          <tr>
			
				<td style="white-space: nowrap;">				
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate" RecordId="1" />
					<euc:EformTextBox style="width:80px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText" RecordId="1" />
  			    </td>
 				<td style="white-space: nowrap;">
					<euc:EformComboBox style="width:120px"  LookupCode="StageClin_Breast_02_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT" RecordId="1" DropDownWidth="auto" EnableHiddenOnUIEvent="ClinStageDisease,ClinStageSystem"/></td>
				<td style="white-space: nowrap;">
					<euc:EformComboBox style="width:120px"  LookupCode="StageClin_Breast_02_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN" RecordId="1" DropDownWidth="auto" EnableHiddenOnUIEvent="ClinStageDisease,ClinStageSystem"/></td>
				<td style="white-space: nowrap;">
					<euc:EformComboBox style="width:120px"  LookupCode="StageClin_Breast_02_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM" RecordId="1" DropDownWidth="auto" EnableHiddenOnUIEvent="ClinStageDisease,ClinStageSystem"/>
					
				    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease" RecordId="1" Value="Breast"  />
				    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem" RecordId="1" Value="AJCC_02"  />
				  
                    <euc:EformTextBox Width="1px" style="display: none;" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality" RecordId="1"   />
			    </td>
			    <td style="white-space: nowrap;">
			        <euc:EformDropDownList RecordId="1" TABLE="ClinicalStages" FIELD="ClinStageSide" Runat="server" ID="ClinStageSide_1" 
	    LookupCode="OpSide" Width="80px" />
			    </td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td>
          </tr>  
          		  	
</table>
<br/><br />

<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(clinStageDateTextID,clinStageTID,clinStateNID,clinStageMID,clinStageDiseaseID,clinStageSystemID,clinStageQualityID)
    { 
        $(clinStageDateTextID).addEvent('blur',curry(SetHiddenFields,clinStageDateTextID,clinStageTID,clinStateNID,clinStageMID,clinStageDiseaseID,clinStageSystemID,clinStageQualityID));
         $(clinStageTID).addEvent('blur',curry(SetHiddenFields,clinStageDateTextID,clinStageTID,clinStateNID,clinStageMID,clinStageDiseaseID,clinStageSystemID,clinStageQualityID));
        $(clinStateNID).addEvent('blur',curry(SetHiddenFields,clinStageDateTextID,clinStageTID,clinStateNID,clinStageMID,clinStageDiseaseID,clinStageSystemID,clinStageQualityID));
        $(clinStageMID).addEvent('blur',curry(SetHiddenFields,clinStageDateTextID,clinStageTID,clinStateNID,clinStageMID,clinStageDiseaseID,clinStageSystemID,clinStageQualityID));
  }

    addEvents($('<%= ClinStageDateText.ClientID %>'),$('<%= ClinStageT.ClientID %>'),$('<%= ClinStageN.ClientID %>'),$('<%= ClinStageM.ClientID %>'),$('<%= ClinStageDisease.ClientID %>'),$('<%= ClinStageSystem.ClientID %>'),$('<%= ClinStageQuality.ClientID %>'));
 
    /* ]]> */
    
function SetHiddenFields(clinStageDateTextID,clinStageTID,clinStateNID,clinStageMID,clinStageDiseaseID,clinStageSystemID,clinStageQualityID)
{
  
    if (clinStageDateTextID.value != '' || clinStageTID.value != '' || clinStateNID.value != '' || clinStageMID.value != '')
    {
        clinStageDiseaseID.value = 'Breast';
        clinStageSystemID.value = 'AJCC_02';
        clinStageQualityID.value = 'STD';
        
    }
    else
    {
        clinStageDiseaseID.disabled = "true";
        clinStageDiseaseID.value = '';
        clinStageSystemID.value = '';
        clinStageSystemID.disabled = "true";
        clinStageQualityID.value = '';
    }
}
</script>