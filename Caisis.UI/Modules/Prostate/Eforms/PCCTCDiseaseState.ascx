<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PCCTCDiseaseState" CodeFile="PCCTCDiseaseState.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
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


<a name="PCCTCDiseaseState" /><span class="controlBoxTitle">Diagnosis &amp; Disease State</span><br />
<span style="font-size: 12px; color: #666666;">Dates for past disease states are listed below. Check a disease state to mark it as new.</span><br/>

<table width="600" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" >
  <tr>
    <td width="40%" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol" >Check if New Today </td>
  </tr>
  <tr id="Diagnosis_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Diagnosis Date</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Diagnosis_DateLabel" Runat="server" />
          <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="1"  FIELD="Status" Runat="server" ID="Diagnosis_Status" />
		  <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="1"  FIELD="StatusDisease" Runat="server" ID="Diagnosis_StatusDisease" />
		  <euc:EformHidden id="Diagnosis_StatusDate" runat="server" RecordId="1" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="1"  FIELD="StatusDateText" Runat="server" ID="Diagnosis_StatusDateText"  /> <%--  AppendToOnChange="setTimeout('setDiagnosisDateVars()',500);" --%>	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Diagnosis" Runat="server" ID="CurrentStatus_Diagnosis" Value="True"  />&nbsp;</td>
  </tr>
  <tr id="Localized_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Localized</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Localized_DateLabel" Runat="server" />
          <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="2"  FIELD="Status" Runat="server" ID="Localized_Status" />
		  <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="2"  FIELD="StatusDisease" Runat="server" ID="Localized_StatusDisease" />
		  <euc:EformHidden id="Localized_StatusDate" runat="server" RecordId="2" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="2"  FIELD="StatusDateText" Runat="server" ID="Localized_StatusDateText" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Localized" Runat="server" ID="CurrentStatus_Localized" Value="True"  />&nbsp;</td>
  </tr>
  <tr id="RisingPSANonCastrate_StatusRow" runat="server">
    <td height="32" class="ClinicalEformPopulatedColumn"  >Rising PSA: Non-Castrate </td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="RisingPSANonCastrate_DateLabel" Runat="server" />
		<euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="3"  FIELD="Status" Runat="server" ID="RisingPSANonCastrate_Status" />
		  <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="3"  FIELD="StatusDisease" Runat="server" ID="RisingPSANonCastrate_StatusDisease" />
        <euc:EformHidden id="RisingPSANonCastrate_StatusDate" runat="server" RecordId="3" Table="Status" Field="StatusDate"/>
        <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="3"  FIELD="StatusDateText" Runat="server" ID="RisingPSANonCastrate_StatusDateText"  />    </td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_RisingPSANonCastrate" Runat="server" ID="CurrentStatus_RisingPSANonCastrate" Value="True"  />    &nbsp;</td>
  </tr>
  <tr id="ClinMetsNonCastrate_StatusRow" runat="server">
    <td height="32" class="ClinicalEformPopulatedColumn"  >Clin Mets : Non-Castrate </td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="ClinMetsNonCastrate_DateLabel" Runat="server" />
		<euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="4"  FIELD="Status" Runat="server" ID="ClinMetsNonCastrate_Status" /> 
		  <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="4"  FIELD="StatusDisease" Runat="server" ID="ClinMetsNonCastrate_StatusDisease" />
        <euc:EformHidden id="ClinMetsNonCastrate_StatusDate" runat="server" RecordId="4" Table="Status" Field="StatusDate"/>
        <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="4"  FIELD="StatusDateText" Runat="server" ID="ClinMetsNonCastrate_StatusDateText"  />    </td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_ClinMetsNonCastrate" Runat="server" ID="CurrentStatus_ClinMetsNonCastrate" Value="True"  />    &nbsp;</td>
  </tr>
  <tr id="RisingPSACastrate_StatusRow" runat="server">
    <td height="32" class="ClinicalEformPopulatedColumn"  >Rising PSA: Castrate </td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="RisingPSACastrate_DateLabel" Runat="server" />
		<euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="5"  FIELD="Status" Runat="server" ID="RisingPSACastrate_Status" /> 
		  <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="5"  FIELD="StatusDisease" Runat="server" ID="RisingPSACastrate_StatusDisease" />
        <euc:EformHidden id="RisingPSACastrate_StatusDate" runat="server" RecordId="5" Table="Status" Field="StatusDate"/>
        <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="5"  FIELD="StatusDateText" Runat="server" ID="RisingPSACastrate_StatusDateText"  />    </td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_RisingPSACastrate" Runat="server" ID="CurrentStatus_RisingPSACastrate" Value="True"  />
    &nbsp;</td>
  </tr>
  <tr id="ClinMetsCastrate_StatusRow" runat="server">
    <td height="32" class="ClinicalEformPopulatedColumn"  >Clin Mets : Castrate </td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="ClinMetsCastrate_DateLabel" Runat="server" />  
		<euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="6"  FIELD="Status" Runat="server" ID="ClinMetsCastrate_Status" /> 
		  <euc:EformTextBox style="display: none;" TABLE="Status"  RecordId="6"  FIELD="StatusDisease" Runat="server" ID="ClinMetsCastrate_StatusDisease" />
        <euc:EformHidden id="ClinMetsCastrate_StatusDate" runat="server" RecordId="6" Table="Status" Field="StatusDate"/>
        <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="6"  FIELD="StatusDateText" Runat="server" ID="ClinMetsCastrate_StatusDateText"  />    </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
		<euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_ClinMetsCastrate" Runat="server" ID="CurrentStatus_ClinMetsCastrate" Value="True"  />	&nbsp;</td>
  </tr>
</table>
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



function addStatusTrigger(DateTextId,StatusId,StatusValue,StatusDiseaseId)
{
    if ($(DateTextId).value.length > 0)
    {
        $(StatusId).value = StatusValue;
        $(StatusDiseaseId).value = 'Prostate Cancer';
    }
    else
    {
        $(StatusId).value = '';
        $(StatusDiseaseId).value = '';
    }
}
if ($('<%= Diagnosis_StatusDateText.ClientID %>')) {$('<%= Diagnosis_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= Diagnosis_StatusDateText.ClientID %>','<%= Diagnosis_Status.ClientID %>','Diagnosis Date','<%= Diagnosis_StatusDisease.ClientID %>'));}
if ($('<%= Localized_StatusDateText.ClientID %>')) {$('<%= Localized_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= Localized_StatusDateText.ClientID %>','<%= Localized_Status.ClientID %>','Localized','<%= Localized_StatusDisease.ClientID %>'));}
if ($('<%= RisingPSANonCastrate_StatusDateText.ClientID %>')) {$('<%= RisingPSANonCastrate_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= RisingPSANonCastrate_StatusDateText.ClientID %>','<%= RisingPSANonCastrate_Status.ClientID %>','Rising PSA Non-Castrate','<%= RisingPSANonCastrate_StatusDisease.ClientID %>'));}
if ($('<%= ClinMetsNonCastrate_StatusDateText.ClientID %>')) {$('<%= ClinMetsNonCastrate_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= ClinMetsNonCastrate_StatusDateText.ClientID %>','<%= ClinMetsNonCastrate_Status.ClientID %>','Clinical Mets Non-Castrate','<%= ClinMetsNonCastrate_StatusDisease.ClientID %>'));}
if ($('<%= RisingPSACastrate_StatusDateText.ClientID %>')) {$('<%= RisingPSACastrate_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= RisingPSACastrate_StatusDateText.ClientID %>','<%= RisingPSACastrate_Status.ClientID %>','Rising PSA Castrate','<%= RisingPSACastrate_StatusDisease.ClientID %>'));}
if ($('<%= ClinMetsCastrate_StatusDateText.ClientID %>')) {$('<%= ClinMetsCastrate_StatusDateText.ClientID %>').addEvent('blur',curry(addStatusTrigger,'<%= ClinMetsCastrate_StatusDateText.ClientID %>','<%= ClinMetsCastrate_Status.ClientID %>','Clinical Mets Castrate','<%= ClinMetsCastrate_StatusDisease.ClientID %>'));}
</script>