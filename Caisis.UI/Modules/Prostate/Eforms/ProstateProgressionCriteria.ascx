<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateProgressionCriteria" CodeFile="ProstateProgressionCriteria.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<script type="text/javascript">

function updateProstateProgressionCriteriaDate()
{
	var ProstateProgressionCriteriaDateText = document.getElementById('<% = SurveyDateText_2.ClientID %>');
	var ProstateProgressionCriteriaDate = document.getElementById('<% = SurveyDate_2.ClientID %>');
	var EncounterDateText = document.getElementById('<% = EncDateText.ClientID %>');
	var EncounterDate = document.getElementById('<% = EncDate.ClientID %>');
	
	ProstateProgressionCriteriaDateText.value = EncounterDateText.value;
	ProstateProgressionCriteriaDate.value = EncounterDate.value;
	
	activateSurveyHiddenFields();
}

function activateSurveyHiddenFields()
{
	var ProstateProgressionCriteriaDateText = document.getElementById('<% = SurveyDateText_2.ClientID %>');
	var ProstateProgressionCriteriaDate = document.getElementById('<% = SurveyDate_2.ClientID %>');
	var ProstateProgressionCriteriaSurveyType = document.getElementById('<% = SurveyType_2.ClientID %>');


	var ProstateProgressionCriteriaContainer = document.getElementById('ProstateProgressionCriteriaContainer');
	var ProstateProgressionCriteriaInputs = ProstateProgressionCriteriaContainer.getElementsByTagName("input");
	var activateHiddens = false;
	
	for (var i = 0; i < ProstateProgressionCriteriaInputs.length; i++) { 
        var Input = ProstateProgressionCriteriaInputs[i];
        if (Input.type == 'radio' && Input.checked) { activateHiddens = true; }
    }
    
    ProstateProgressionCriteriaDateText.disabled = !activateHiddens;
    ProstateProgressionCriteriaDate.disabled = !activateHiddens;
    ProstateProgressionCriteriaSurveyType.disabled = !activateHiddens;
}



</script>


<a name="ProstateProgressionCriteria" /><span class="controlBoxTitle">Progression Criteria</span><br />
		<euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" Runat="server" style="display: none;" />
		<euc:EformTextBox id="EncDate" Table="Encounters" Field="EncDate" Runat="server" style="display: none;" />


<euc:EformHidden id="SurveyType_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyType" Value="Progression Criteria"/>

<euc:EformHidden id="SurveyDate_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyDate"/>
<euc:EformHidden id="SurveyDateText_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyDateText"/>

<table id="ProstateProgressionCriteriaContainer" onclick="activateSurveyHiddenFields();" width="400" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" >
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Site</td>
    <td  class="controlBoxDataGridHeaderFirstCol" >Yes<span style="width: 56px;">&nbsp;</span>No</td>
    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >PSA</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_PSA" RecordId="1" ParentRecordId="2"  GroupName="PSA" runat="server"
			Field1="SurveyItem" Value1="PSA">
			<euc:EformRadioButton Id="PSAYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="PSANo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Bone</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_Bone" RecordId="2" ParentRecordId="2"  GroupName="Bone" runat="server"
			Field1="SurveyItem" Value1="Bone">
			<euc:EformRadioButton Id="BoneYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="BoneNo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Lymph Nodes</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_LymphNodes" RecordId="3" ParentRecordId="2"  GroupName="LymphNodes" runat="server"
			Field1="SurveyItem" Value1="Lymph Nodes">
			<euc:EformRadioButton Id="LymphNodesYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="LymphNodesNo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Lung</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_Lung" RecordId="4" ParentRecordId="2"  GroupName="Lung" runat="server"
			Field1="SurveyItem" Value1="Lung">
			<euc:EformRadioButton Id="LungYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="LungNo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Liver</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_Liver" RecordId="5" ParentRecordId="2"  GroupName="Liver" runat="server"
			Field1="SurveyItem" Value1="Liver">
			<euc:EformRadioButton Id="LiverYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="LiverNo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Local Disease</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_LocalDisease" RecordId="6" ParentRecordId="2"  GroupName="LocalDisease" runat="server"
			Field1="SurveyItem" Value1="Local Disease">
			<euc:EformRadioButton Id="LocalDiseaseYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="LocalDiseaseNo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>
</table>
<script type="text/javascript"> updateProstateProgressionCriteriaDate(); </script>
<br/>
<br/>
<br/>
