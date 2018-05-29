<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.NocturnalErections" CodeFile="NocturnalErections.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">

var updateNocturnalErectionsDate = function()
{
	var survDateText = document.getElementById('<% = SurveyDateText_6.ClientID %>');
	var survDate = document.getElementById('<% = SurveyDate_6.ClientID %>');
	var encDateText = document.getElementById('<% = EncDateText.ClientID %>');
	var encDate = document.getElementById('<% = EncDate.ClientID %>');
	
	
	if (encDateText.value != '') survDateText.value = encDateText.value;
	if (encDate.value != '') survDate.value = encDateText.value;
	
    activateSurveyHiddenFields();
}


function activateSurveyHiddenFields()
{
	var survDateText = document.getElementById('<% = SurveyDateText_6.ClientID %>');
	var survDate = document.getElementById('<% = SurveyDate_6.ClientID %>');
	var survType = document.getElementById('<% = SurveyType_6.ClientID %>');


	var survContainer = document.getElementById('NocturnalErectionsContainerTable');
	var survInputs = survContainer.getElementsByTagName("input");
	var activateHiddens = false;
	
	for (var i = 0; i < survInputs.length; i++) { 
        var Input = survInputs[i];
        if (Input.type == 'radio' && Input.checked) { activateHiddens = true; }
		else if  (Input.type == 'text' && Input.value != '') { activateHiddens = true; }
    }
    
    survDateText.disabled = !activateHiddens;
    survDate.disabled = !activateHiddens;
    survType.disabled = !activateHiddens;
}




</script>
<euc:EformHidden id="EncDateText" Table="Encounters" Field="EncDateText" Runat="server" disabled="false" />
<euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate" Runat="server" disabled="false" />

<euc:EformHidden RecordId="6" TABLE="Surveys" FIELD="SurveyType" Runat="server" ID="SurveyType_6" Value="Mulhall Nocturnal Erections" />
<euc:EformHidden id="SurveyDate_6" runat="server" RecordId="6" Table="Surveys" Field="SurveyDate"/>
<euc:EformHidden id="SurveyDateText_6" runat="server" RecordId="6" Table="Surveys" Field="SurveyDateText"/>

<a name="NocturnalErections" />
<span class="controlBoxTitle">Nocturnal Erections</span><br />
<table id="NocturnalErectionsContainerTable" border="0" cellpadding="8" cellspacing="0" class="eformLargePopulatedTable"  onclick="updateNocturnalErectionsDate();">
    <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Nocturnal Erections?</td>
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformHidden id="SurveyItem_NocturnalErections" runat="server" RecordId="42" ParentRecordId="6" Table="SurveyItems" Field="SurveyItem" value="Nocturnal Erections?" />
        <euc:EformRadioButtonList Table="SurveyItems" RecordId="42" ParentRecordId="6" Field="SurveyItemResult" id="SurveyItemResult_NocturnalErections" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_NocturnalErections">
		    <asp:ListItem Text="Yes&nbsp;&nbsp;&nbsp;&nbsp;" Value="Yes" />
            <asp:ListItem Text="No" Value="No" />		</euc:EformRadioButtonList>	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
    <tr  >
      <td height="32" class="ClinicalEformPopulatedColumn" >Score</td>
      <td class="ClinicalEformPopulatedColumn" ><euc:EformHidden id="SurveyItem_NocturnalErectionScore" runat="server" RecordId="43" ParentRecordId="6" Table="SurveyItems" Field="SurveyItem" value="Nocturnal Erections Score" />
	  <euc:EformTextBox RecordId="43" ParentRecordId="6" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_NocturnalErectionScore"  EnableHiddenOnUIEvent="SurveyItem_NocturnalErectionScore" Width="20px" AppendToOnChange="activateSurveyHiddenFields();" /> / 10</td>
      <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
    </tr>
    <tr  >
      <td height="32" class="ClinicalEformPopulatedColumn" >ICI / Week </td>
      <td class="ClinicalEformPopulatedColumn" ><euc:EformHidden id="SurveyItem_ICIPerWeek" runat="server" RecordId="44" ParentRecordId="6" Table="SurveyItems" Field="SurveyItem" value="ICI / Week" />
          <euc:EformTextBox RecordId="44" ParentRecordId="6" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_ICIPerWeek"  EnableHiddenOnUIEvent="SurveyItem_ICIPerWeek" Width="50px" AppendToOnChange="activateSurveyHiddenFields();" /></td>
      <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
    </tr>
    <tr  >
      <td height="32" class="ClinicalEformPopulatedColumn" >First Noted</td>
      <td class="ClinicalEformPopulatedColumn" ><euc:EformHidden id="SurveyItem_FirstNoted" runat="server" RecordId="45" ParentRecordId="6" Table="SurveyItems" Field="SurveyItem" value="First Noted" />
          <euc:EformTextBox RecordId="45" ParentRecordId="6" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_FirstNoted"  EnableHiddenOnUIEvent="SurveyItem_FirstNoted" Width="50px" AppendToOnChange="activateSurveyHiddenFields();" /> months postop</td>
      <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
    </tr>
    <tr  >
      <td height="32" class="ClinicalEformPopulatedColumn" ># Erections/Week</td>
      <td class="ClinicalEformPopulatedColumn" ><euc:EformHidden id="SurveyItem_NumErectionsPerWeek" runat="server" RecordId="46" ParentRecordId="6" Table="SurveyItems" Field="SurveyItem" value="# Erections/Week" />
          <euc:EformTextBox RecordId="46" ParentRecordId="6" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_NumErectionsPerWeek"  EnableHiddenOnUIEvent="SurveyItem_NumErectionsPerWeek" Width="50px" AppendToOnChange="activateSurveyHiddenFields();" /></td>
      <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
    </tr>
</table>
<script type="text/javascript">updateNocturnalErectionsDate();</script>

<br/><br/>