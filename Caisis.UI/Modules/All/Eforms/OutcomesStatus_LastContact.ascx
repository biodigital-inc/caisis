<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.OutcomesStatus_LastContact" CodeFile="OutcomesStatus_LastContact.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

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


<a name="OutcomesStatus_LastContact" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Contact Status"></asp:Label><br/>
Dates for past contact states are listed below. Check a contact state to mark it as new. <br/>

<table width="600" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="LastContact" >
  <tr>
    <td width="200px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" >Check if New Today </td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Disease</td>
  </tr>
  <tr id="NED_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >No Evidence of Disease (NED)</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="NED_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="NED_Status" runat="server" RecordId="11" Table="Status" FIELD="Status"  Value="No Evidence of Disease"/>
		  <euc:EformHidden id="NED_StatusDate" runat="server" RecordId="11" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="11"  FIELD="StatusDateText" Runat="server" ID="NED_StatusDateText" EnableHiddenOnUIEvent="NED_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_NED_11" Runat="server" ID="CurrentStatus_NED_11" Value="True"  EnableHiddenOnUIEvent="NED_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="11" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_11" LookupCode="Disease" Runat="server" />&nbsp;</td>
  </tr>
  <tr id="AWD_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Alive with Disease (AWD)</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="AWD_Status" runat="server" RecordId="12" Table="Status" FIELD="Status"  Value="Alive with Disease"/>
		  <euc:EformHidden id="AWD_StatusDate" runat="server" RecordId="12" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="12"  FIELD="StatusDateText" Runat="server" ID="AWD_StatusDateText" EnableHiddenOnUIEvent="AWD_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_12" Runat="server" ID="CurrentStatus_AWD_12" Value="True"  EnableHiddenOnUIEvent="AWD_Status"/>&nbsp;</td>
     <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="12" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_12" LookupCode="Disease" Runat="server" />&nbsp;</td>
  </tr>
<tr id="AWD_Local_Recurrence_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >AWD - Local Recurrence</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_Local_Recurrence_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="AWD_Local_Recurrence_Status" runat="server" RecordId="13" Table="Status" FIELD="Status"  Value="AWD - Local Recurrence"/>
		  <euc:EformHidden id="AWD_Local_Recurrence_StatusDate" runat="server" RecordId="13" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="13"  FIELD="StatusDateText" Runat="server" ID="AWD_Local_Recurrence_StatusDateText" EnableHiddenOnUIEvent="AWD_Local_Recurrence_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_Local_Recurrence_13" Runat="server" ID="CurrentStatus_AWD_Local_Recurrence_13" Value="True"  EnableHiddenOnUIEvent="AWD_Local_Recurrence_Status" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="13" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_13" LookupCode="Disease" Runat="server" />&nbsp;</td>
  </tr>
<tr id="AWD_Distant_Metastasis_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >AWD - Distant Metastasis</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_Distant_Metastasis_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="AWD_Distant_Metastasis_Status" runat="server" RecordId="14" Table="Status" FIELD="Status"  Value="AWD - Distant Metastasis"/>
		  <euc:EformHidden id="AWD_Distant_Metastasis_StatusDate" runat="server" RecordId="14" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="14"  FIELD="StatusDateText" Runat="server" ID="AWD_Distant_Metastasis_StatusDateText" EnableHiddenOnUIEvent="AWD_Distant_Metastasis_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_Distant_Metastasis_14" Runat="server" ID="CurrentStatus_AWD_Distant_Metastasis_14" Value="True"  EnableHiddenOnUIEvent="AWD_Distant_Metastasis_Status" />&nbsp;</td>
     <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="14" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_14" LookupCode="Disease" Runat="server" />&nbsp;</td>
  </tr>
<tr id="AWD_Local_and_Metastasis_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >AWD - Local and Metastasis</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_Local_and_Metastasis_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="AWD_Local_and_Metastasis_Status" runat="server" RecordId="15" Table="Status" FIELD="Status"  Value="AWD - Local and Metastasis"/>
		  <euc:EformHidden id="AWD_Local_and_Metastasis_StatusDate" runat="server" RecordId="15" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="15"  FIELD="StatusDateText" Runat="server" ID="AWD_Local_and_Metastasis_StatusDateText" EnableHiddenOnUIEvent="AWD_Local_and_Metastasis_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_Local_and_Metastasis_15" Runat="server" ID="CurrentStatus_AWD_Local_and_Metastasis_15" Value="True"  EnableHiddenOnUIEvent="AWD_Local_and_Metastasis_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="15" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_15" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>
<tr id="DOD_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Date of Death (DoD)</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="DOD_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="DOD_Status" runat="server" RecordId="16" Table="Status" FIELD="Status"  Value="Date of Death"/>
		  <euc:EformHidden id="DOD_StatusDate" runat="server" RecordId="16" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="16"  FIELD="StatusDateText" Runat="server" ID="DOD_StatusDateText" EnableHiddenOnUIEvent="DOD_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_DOD_16" Runat="server" ID="CurrentStatus_DOD_16" Value="True"  EnableHiddenOnUIEvent="DOD_Status" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="16" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_16" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>
<tr id="DOC_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >DOC</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="DOC_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="DOC_Status" runat="server" RecordId="17" Table="Status" FIELD="Status"  Value="DOC - Date of Death"/>
		  <euc:EformHidden id="DOC_StatusDate" runat="server" RecordId="17" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="17"  FIELD="StatusDateText" Runat="server" ID="DOC_StatusDateText" EnableHiddenOnUIEvent="DOC_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_DOC_17" Runat="server" ID="CurrentStatus_DOC_17" Value="True"  EnableHiddenOnUIEvent="DOC_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="17" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_17" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>
<tr id="Other1_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Other: <euc:EFormComboBox RecordId="18" LookupCode="Status" Table="Status" FIELD="Status" Runat="server" ID="Other1_Status" style="width: 125px;"/></td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Other1_DateLabel" Runat="server" />
	
		  
		  <euc:EformHidden id="Other1_StatusDate" runat="server" RecordId="18" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="18"  FIELD="StatusDateText" Runat="server" ID="Other1_StatusDateText" EnableHiddenOnUIEvent="Other1_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other1_18" Runat="server" ID="CurrentStatus_Other1_18" Value="True" EnableHiddenOnUIEvent="Other1_Status" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="18" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_18" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>
<tr id="Other2_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Other: <euc:EFormComboBox RecordId="19" LookupCode="Status" Table="Status" FIELD="Status" Runat="server" ID="Other2_Status" style="width: 125px;"/></td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Other2_DateLabel" Runat="server" />
	
		  
		  <euc:EformHidden id="Other2_StatusDate" runat="server" RecordId="19" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="19"  FIELD="StatusDateText" Runat="server" ID="Other2_StatusDateText" EnableHiddenOnUIEvent="Other2_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other2_19" Runat="server" ID="CurrentStatus_Other2_19" Value="True"  EnableHiddenOnUIEvent="Other2_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="19" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_19" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>
<tr id="Other3_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Other: <euc:EFormComboBox RecordId="20" LookupCode="Status" Table="Status" FIELD="Status" Runat="server" ID="Other3_Status" style="width: 125px;"/></td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Other3_DateLabel" Runat="server" />
	
		  
		  <euc:EformHidden id="Other3_StatusDate" runat="server" RecordId="20" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="20"  FIELD="StatusDateText" Runat="server" ID="Other3_StatusDateText" EnableHiddenOnUIEvent="Other3_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other3_20" Runat="server" ID="CurrentStatus_Other3_20" Value="True"  EnableHiddenOnUIEvent="Other3_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="20" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_20" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>


</table>
<br/>
<br/>
<br/>
