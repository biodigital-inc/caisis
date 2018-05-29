<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.OutcomesStatus_DiagnosisDate" CodeFile="OutcomesStatus_DiagnosisDate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

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


<a name="OutcomesStatus_DiagnosisDate" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Diagnosis Date"></asp:Label><br/>
The date for the initial diagnosis date is listed below. Check to mark it as new. <br/>

<table width="600" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="DiagnosisDateHtmlTable" >
  <tr>
    <td width="200px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" >Check if New Today </td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Disease</td>
  </tr>
<tr id="Diagnosis_Date_StatusRow_21" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Diagnosis Date</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Diagnosis_Date_DateLabel_21" Runat="server" />
	
		  <euc:EformHidden id="Diagnosis_Date_Status_21" runat="server" RecordId="21" Table="Status" FIELD="Status"  Value="Diagnosis Date" Enabled="false"/>
		  <euc:EformHidden id="Diagnosis_Date_StatusDate_21" runat="server" RecordId="21" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="21"  FIELD="StatusDateText" Runat="server" ID="Diagnosis_Date_StatusDateText_21" EnableHiddenOnUIEvent="Diagnosis_Date_Status_21" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Diagnosis_Date_21" Runat="server" ID="CurrentStatus_Diagnosis_Date_21" Value="True"  EnableHiddenOnUIEvent="Diagnosis_Date_Status_21" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="21" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_21" LookupCode="Disease" Runat="server" />&nbsp;</td>

</tr>

</table>
<br/><br/><br />
