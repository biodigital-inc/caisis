<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.ClinStageGastric" CodeFile="ClinStageGastric.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<br/>

<a name="ClinStageGastric" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Clinical Stage (UICC_10)"></asp:Label><br/>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" style="width: 230px;">
   
          <tr>
<%--				<td  class="controlBoxDataGridTitleColumn" align="center">Date</td>
--%>				<td  class="controlBoxDataGridTitleColumn" align="center">Stage (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Delete</td>
		  </tr>
          <tr>
			
				<td style="white-space: nowrap; padding-left: 34px;">				
<%--					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate" RecordId="1" />
					<euc:EformTextBox style="width:80px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText" RecordId="1" />
--%>  			    
				<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ID="ClinStageDateText" RecordId="1" Value="PreOp" />
<%--</td>
 				<td style="white-space: nowrap;">--%>
					<euc:EformComboBox style="width:70px;" DropDownHeight="auto" DropDownWidth="550"  LookupCode="StageClin_Gastric_10_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT" RecordId="1"  EnableHiddenOnUIEvent="ClinStageDisease,ClinStageSystem,ClinStageDateText,ClinStageQuality"/>
					
				    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease" RecordId="1" Value="Gastric"  />
				    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem" RecordId="1" Value="UICC_10"  />
				    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality" RecordId="1" Value="STD"  />
<%--                <euc:EformTextBox Width="1px" style="display: none;" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality" RecordId="1"   />
--%>			    </td>
                <td style="text-align: center;"><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td>
          </tr>  
          		  	
</table>
<br/><br />

<%--<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(clinStageDateTextID,clinStageTID,clinStageDiseaseID,clinStageSystemID,clinStageQualityID)
    { 
        $(clinStageDateTextID).addEvent('blur',curry(SetHiddenFields,clinStageDateTextID,clinStageTID,clinStageDiseaseID,clinStageSystemID,clinStageQualityID));
         $(clinStageTID).addEvent('blur',curry(SetHiddenFields,clinStageDateTextID,clinStageTID,clinStageDiseaseID,clinStageSystemID,clinStageQualityID));
  }

    addEvents($('<%= ClinStageDateText.ClientID %>'),$('<%= ClinStageT.ClientID %>'),$('<%= ClinStageDisease.ClientID %>'),$('<%= ClinStageSystem.ClientID %>'),$('<%= ClinStageQuality.ClientID %>'));
 
    /* ]]> */
    
function SetHiddenFields(clinStageDateTextID,clinStageTID,clinStageDiseaseID,clinStageSystemID,clinStageQualityID)
{
  
    if (clinStageDateTextID.value != '' || clinStageTID.value != '')
    {
        clinStageDiseaseID.value = 'Gastric';
        clinStageSystemID.value = 'UICC_97';
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
</script>--%>