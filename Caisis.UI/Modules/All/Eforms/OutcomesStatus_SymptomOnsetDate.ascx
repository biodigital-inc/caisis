<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.OutcomesStatus_SymptomOnsetDate" CodeFile="OutcomesStatus_SymptomOnsetDate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">

function SetDiseaseStateDate(cbox, dateTextFieldId, date, dateFieldId, comboBox)
{
	if (cbox.checked == true)
	{
		document.getElementById(dateTextFieldId).value = date;
		document.getElementById(dateFieldId).value = date;
		
	}
	else
	{
		document.getElementById(dateTextFieldId).value = '';
		document.getElementById(dateFieldId).value = '';
		if (comboBox != null)
		{
		    document.getElementById(comboBox).value = '';
		}
	}
	
}
</script>


<a name="OutcomesStatus_SymptomOnsetDate" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Diagnosis Date"></asp:Label><br/>
The date for the onset f symptom date is listed below. Check to mark it as new. <br/>

<table width="600" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="DiagnosisDateHtmlTable" >
  <tr>
    <td width="200px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" >Check if New Today </td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Disease</td>
  </tr>
<tr id="OnsetSymptom_Date_StatusRow_22" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Onset of Symptom Date</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="OnsetSymptom_Date_DateLabel_22" Runat="server" />
	
		  <euc:EformHidden id="OnsetSymptom_Date_Status_22" runat="server" RecordId="22" Table="Status" FIELD="Status"  Value="Onset of Symptom Date" Enabled="false"/>
		  <euc:EformHidden id="OnsetSymptom_Date_StatusDate_22" runat="server" RecordId="22" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="22"  FIELD="StatusDateText" Runat="server" ID="OnsetSymptom_Date_StatusDateText_22" EnableHiddenOnUIEvent="OnsetSymptom_Date_Status_22" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_OnsetSymptom_Date_22" Runat="server" ID="CurrentStatus_OnsetSymptom_Date_22" Value="True" EnableHiddenOnUIEvent="OnsetSymptom_Date_Status_22" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="22" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_22" LookupCode="Disease" Runat="server" />&nbsp;</td>

</tr>

</table>
<br/><br/><br />
