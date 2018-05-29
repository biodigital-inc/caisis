<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.GTDDiseaseState" CodeFile="GTDDiseaseState.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<script type="text/javascript">

function SetDiseaseStateDate(cbox, dateTextFieldId, date)
{
	if (cbox.checked == true)
	{
		document.getElementById(dateTextFieldId).value = date;
	}
	else
	{
		document.getElementById(dateTextFieldId).value = '';
	}
	
	document.getElementById(dateTextFieldId).focus();
	document.getElementById(dateTextFieldId).blur();
	
}


</script>


<a name="GTDDiseaseState" /><span class="controlBoxTitle">Diagnosis Date &amp; Disease State</span>
<span style="font-size: 12px; color: #666666; margin-left: 80px;">Check "New Today" to set the date to today.</span><br/>

<table id="DiseaseStatusHtmlTable" width="600" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" >
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td class="controlBoxDataGridHeaderFirstCol" >New Today</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Disease</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;</td>
  </tr>
  <tr id="Diagnosis_StatusRow" onclick="setDiagnosisDateStatus();" onmouseout="setDiagnosisDateStatus();">
    <td class="ClinicalEformPopulatedColumn" >Diagnosis Date</td>
    <td height="32" align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Diagnosis" Runat="server" ID="CurrentStatus_Diagnosis" Value="True"  />
      <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="1"  FIELD="StatusQuality" Runat="server" ID="Diagnosis_StatusQuality" /></td>
    <td class="ClinicalEformPopulatedColumn" >  
        <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="1"  FIELD="Status" Runat="server" ID="Diagnosis_Status" />
        <euc:EformHidden id="Diagnosis_StatusDate" runat="server" RecordId="1" Table="Status" Field="StatusDate"/>
        <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="1"  FIELD="StatusDateText" Runat="server" ID="Diagnosis_StatusDateText"  />
        <%--  AppendToOnChange="setTimeout('setDiagnosisDateVars()',500);" --%>    </td>
    <td class="ClinicalEformPopulatedColumn" ><euc:EformComboBox LookupCode="Disease" id="Diagnosis_StatusDisease" Table="Status" RecordId="1" Field="StatusDisease" runat="server" Width="210" /></td>
    <td class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr  style="display: none;"  id="_2_StatusRow" runat="server" >
    <td class="ClinicalEformPopulatedColumn" ><euc:EformSelect ID="_2_Status" TABLE="Status"  RecordId="2"  FIELD="Status" Runat="server" LookupCode="Status" Width="310" DropDownWidth="450" DropDownHeight="120" />
    </td>
    <td height="32" align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_2" Runat="server" ID="CurrentStatus_2" Value="True"  />
      <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="2"  FIELD="StatusQuality" Runat="server" ID="_2_StatusQuality" /></td>
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformHidden id="_2_StatusDate" runat="server" RecordId="2" Table="Status" Field="StatusDate"/>
        <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="2"  FIELD="StatusDateText" Runat="server" id="_2_StatusDateText" />    </td>
    <td class="ClinicalEformPopulatedColumn" ><euc:EformComboBox LookupCode="Disease" id="_2_StatusDisease" Table="Status" RecordId="2" Field="StatusDisease" runat="server" Width="210" /></td>
    <td class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr  style="display: none;" ID="_3_StatusRow" runat="server">
    <td class="ClinicalEformPopulatedColumn"  ><euc:EformSelect ID="_3_Status" TABLE="Status"  RecordId="3"  FIELD="Status" Runat="server" LookupCode="Status" Width="310" DropDownWidth="450" DropDownHeight="120" /></td>
    <td height="32" align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_3" Runat="server" ID="CurrentStatus_3" Value="True"  />
  <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="3"  FIELD="StatusQuality" Runat="server" ID="_3_StatusQuality" /></td>
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformHidden ID="_3_StatusDate" runat="server" RecordId="3" Table="Status" Field="StatusDate"/>
        <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="3"  FIELD="StatusDateText" Runat="server" ID="_3_StatusDateText"  />    </td>
    <td class="ClinicalEformPopulatedColumn"  ><euc:EformComboBox LookupCode="Disease" id="_3_StatusDisease" Table="Status" RecordId="3" Field="StatusDisease" runat="server" Width="210" /></td>
    <td class="ClinicalEformPopulatedColumn"  ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr  style="display: none;"  id="_4_StatusRow" runat="server">
    <td class="ClinicalEformPopulatedColumn"  ><euc:EformSelect ID="_4_Status" TABLE="Status"  RecordId="4"  FIELD="Status" Runat="server" LookupCode="Status" Width="310" DropDownWidth="450" DropDownHeight="120" /></td>
    <td height="32" align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_4" Runat="server" ID="CurrentStatus_4" Value="True"  />
  <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="4"  FIELD="StatusQuality" Runat="server" ID="_4_StatusQuality" /></td>
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformHidden id="_4_StatusDate" runat="server" RecordId="4" Table="Status" Field="StatusDate"/>
        <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="4"  FIELD="StatusDateText" Runat="server" id="_4_StatusDateText"  />    </td>
    <td class="ClinicalEformPopulatedColumn"  ><euc:EformComboBox LookupCode="Disease" id="_4_StatusDisease" Table="Status" RecordId="4" Field="StatusDisease" runat="server" Width="210" /></td>
    <td class="ClinicalEformPopulatedColumn"  ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr  style="display: none;"  id="_5_StatusRow" runat="server">
    <td class="ClinicalEformPopulatedColumn"  ><euc:EformSelect ID="_5_Status" TABLE="Status"  RecordId="5"  FIELD="Status" Runat="server" LookupCode="Status" Width="310" DropDownWidth="450" DropDownHeight="120" /></td>
    <td height="32" align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_5" Runat="server" ID="CurrentStatus_5" Value="True"  />
  <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="5"  FIELD="StatusQuality" Runat="server" ID="_5_StatusQuality" /></td>
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformHidden id="_5_StatusDate" runat="server" RecordId="5" Table="Status" Field="StatusDate"/>
        <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="5"  FIELD="StatusDateText" Runat="server" id="_5_StatusDateText"  />    </td>
    <td class="ClinicalEformPopulatedColumn"  ><euc:EformComboBox LookupCode="Disease" id="_5_StatusDisease" Table="Status" RecordId="5" Field="StatusDisease" runat="server" Width="210" /></td>
    <td class="ClinicalEformPopulatedColumn"  ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiseaseStatusHtmlTable');" />
<br/>
<br/>

<%-- 
var DiagnosisDateTextVal = '<% =PresetDiagnosisDateText %>';
var DiagnosisDateVal = '<% =PresetDiagnosisDate %>';

function setDiagnosisDateVars()
{
    DiagnosisDateTextVal = $('<% =Diagnosis_StatusDateText.ClientID %>').value;
    DiagnosisDateVal = $('<% =Diagnosis_StatusDate.ClientID %>').value;
}
--%>

<script type="text/javascript">



function addStatusTrigger(DateTextId,StatusId,StatusDiseaseId,StatusQualityId)
{
    if (($(DateTextId).value.length > 0 || $(StatusId).value.length > 0) && $(StatusDiseaseId).value.length < 1)
    {
        $(StatusDiseaseId).value = 'Gestational Trophoblastic Disease';
        $(StatusQualityId).value = 'STD';
    }

}
if ($('<%= Diagnosis_StatusDateText.ClientID %>')) {
    $('<%= Diagnosis_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= Diagnosis_StatusDateText.ClientID %>','<%= Diagnosis_Status.ClientID %>','<%= Diagnosis_StatusDisease.ClientID %>','<%= Diagnosis_StatusQuality.ClientID %>'));}
if ($('<%= _2_StatusDateText.ClientID %>')) {
    $('<%= _2_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= _2_StatusDateText.ClientID %>','<%= _2_Status.ClientID %>','<%= _2_StatusDisease.ClientID %>','<%= _2_StatusQuality.ClientID %>'));
    $('<%= _2_Status.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= _2_StatusDateText.ClientID %>','<%= _2_Status.ClientID %>','<%= _2_StatusDisease.ClientID %>','<%= _2_StatusQuality.ClientID %>'));}
if ($('<%= _3_StatusDateText.ClientID %>')) {
    $('<%= _3_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= _3_StatusDateText.ClientID %>','<%= _3_Status.ClientID %>','<%= _3_StatusDisease.ClientID %>','<%= _3_StatusQuality.ClientID %>'));
    $('<%= _3_Status.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= _3_StatusDateText.ClientID %>','<%= _3_Status.ClientID %>','<%= _3_StatusDisease.ClientID %>','<%= _3_StatusQuality.ClientID %>'));}
if ($('<%= _4_StatusDateText.ClientID %>')) {
    $('<%= _4_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= _4_StatusDateText.ClientID %>','<%= _4_Status.ClientID %>','<%= _4_StatusDisease.ClientID %>','<%= _4_StatusQuality.ClientID %>'));
    $('<%= _4_Status.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= _4_StatusDateText.ClientID %>','<%= _4_Status.ClientID %>','<%= _4_StatusDisease.ClientID %>','<%= _4_StatusQuality.ClientID %>'));}
if ($('<%= _5_StatusDateText.ClientID %>')) {
    $('<%= _5_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= _5_StatusDateText.ClientID %>','<%= _5_Status.ClientID %>','<%= _5_StatusDisease.ClientID %>','<%= _5_StatusQuality.ClientID %>'));
    $('<%= _5_Status.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= _5_StatusDateText.ClientID %>','<%= _5_Status.ClientID %>','<%= _5_StatusDisease.ClientID %>','<%= _5_StatusQuality.ClientID %>'));}

function setDiagnosisDateStatus()
{
    if ($('<%= Diagnosis_StatusDateText.ClientID %>').value.length > 0 || $('<%= Diagnosis_StatusDisease.ClientID %>').value.length > 0)
    {
        $('<%= Diagnosis_Status.ClientID %>').value = 'Diagnosis Date';
    }
    else
    {
        $('<%= Diagnosis_Status.ClientID %>').value = '';
    }
}



</script>