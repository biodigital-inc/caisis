<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.OutcomesStatus_Disease" CodeFile="OutcomesStatus_Disease.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

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


<a name="OutcomesStatus_Disease" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Disease State"></asp:Label><br/>
Dates for past disease states are listed below. Check a disease state to mark it as new. <br/>

<table width="600" border="0" cellspacing="0" cellpadding="3" class="ClinicalEformTable" id="StatusDiseaseState" style="background-color:#FFFFFF" >
  <tr>
    <td width="200px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" >Check if New Today </td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Disease</td>
  </tr>
  <tr id="NED_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >No Evidence of Disease (NED)</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="NED_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="NED_Status" runat="server" RecordId="1" Table="Status" FIELD="Status"  Value="No Evidence of Disease"/>
		  <euc:EformHidden id="NED_StatusDate" runat="server" RecordId="1" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="1"  FIELD="StatusDateText" Runat="server" ID="NED_StatusDateText" EnableHiddenOnUIEvent="NED_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_NED" Runat="server" ID="CurrentStatus_NED" Value="True" EnableHiddenOnUIEvent="NED_Status"  />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="1" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_1" LookupCode="Disease" Runat="server" />&nbsp;</td>
  
  </tr>
  <tr id="AWD_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Alive with Disease (AWD)</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="AWD_Status" runat="server" RecordId="2" Table="Status" FIELD="Status"  Value="Alive with Disease"/>
		  <euc:EformHidden id="AWD_StatusDate" runat="server" RecordId="2" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="2"  FIELD="StatusDateText" Runat="server" ID="AWD_StatusDateText" EnableHiddenOnUIEvent="AWD_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD" Runat="server" ID="CurrentStatus_AWD" Value="True"  EnableHiddenOnUIEvent="AWD_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="2" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_2" LookupCode="Disease" Runat="server" />&nbsp;</td>
  </tr>
<tr id="AWD_Local_Recurrence_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >AWD - Local Recurrence</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_Local_Recurrence_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="AWD_Local_Recurrence_Status" runat="server" RecordId="3" Table="Status" FIELD="Status"  Value="AWD - Local Recurrence"/>
		  <euc:EformHidden id="AWD_Local_Recurrence_StatusDate" runat="server" RecordId="3" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="3"  FIELD="StatusDateText" Runat="server" ID="AWD_Local_Recurrence_StatusDateText" EnableHiddenOnUIEvent="AWD_Local_Recurrence_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_Local_Recurrence" Runat="server" ID="CurrentStatus_AWD_Local_Recurrence" Value="True"  EnableHiddenOnUIEvent="AWD_Local_Recurrence_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="3" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_3" LookupCode="Disease" Runat="server" />&nbsp;</td>
  </tr>
<tr id="AWD_Distant_Metastasis_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >AWD - Distant Metastasis</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_Distant_Metastasis_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="AWD_Distant_Metastasis_Status" runat="server" RecordId="4" Table="Status" FIELD="Status"  Value="AWD - Distant Metastasis"/>
		  <euc:EformHidden id="AWD_Distant_Metastasis_StatusDate" runat="server" RecordId="4" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="4"  FIELD="StatusDateText" Runat="server" ID="AWD_Distant_Metastasis_StatusDateText" EnableHiddenOnUIEvent="AWD_Distant_Metastasis_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_Distant_Metastasis" Runat="server" ID="CurrentStatus_AWD_Distant_Metastasis" Value="True"  EnableHiddenOnUIEvent="AWD_Distant_Metastasis_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="4" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_4" LookupCode="Disease" Runat="server" />&nbsp;</td>
  </tr>
<tr id="AWD_Local_and_Metastasis_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >AWD - Local and Metastasis</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_Local_and_Metastasis_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="AWD_Local_and_Metastasis_Status" runat="server" RecordId="5" Table="Status" FIELD="Status"  Value="AWD - Local and Metastasis"/>
		  <euc:EformHidden id="AWD_Local_and_Metastasis_StatusDate" runat="server" RecordId="5" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="5"  FIELD="StatusDateText" Runat="server" ID="AWD_Local_and_Metastasis_StatusDateText" EnableHiddenOnUIEvent="AWD_Local_and_Metastasis_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_Local_and_Metastasis" Runat="server" ID="CurrentStatus_AWD_Local_and_Metastasis" Value="True" EnableHiddenOnUIEvent="AWD_Local_and_Metastasis_Status"  />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="5" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_5" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>
<tr id="DOD_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Date of Death (DOD)</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="DOD_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="DOD_Status" runat="server" RecordId="6" Table="Status" FIELD="Status"  Value="Date of Death"/>
		  <euc:EformHidden id="DOD_StatusDate" runat="server" RecordId="6" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="6"  FIELD="StatusDateText" Runat="server" ID="DOD_StatusDateText" EnableHiddenOnUIEvent="DOD_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_DOD" Runat="server" ID="CurrentStatus_DOD" Value="True"  EnableHiddenOnUIEvent="DOD_Status" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="6" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_6" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>
<tr id="DOC_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >DOC</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="DOC_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="DOC_Status" runat="server" RecordId="7" Table="Status" FIELD="Status"  Value="DOC"/>
		  <euc:EformHidden id="DOC_StatusDate" runat="server" RecordId="7" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="7"  FIELD="StatusDateText" Runat="server" ID="DOC_StatusDateText" EnableHiddenOnUIEvent="DOC_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_DOC" Runat="server" ID="CurrentStatus_DOC" Value="True"  EnableHiddenOnUIEvent="DOC_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="7" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_7" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>
<tr id="Other1_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Other: <euc:EFormComboBox RecordId="8" LookupCode="Status" Table="Status" FIELD="Status" Runat="server" ID="Other1_Status" style="width: 125px;"/></td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Other1_DateLabel" Runat="server" />
	
		  
		  <euc:EformHidden id="Other1_StatusDate" runat="server" RecordId="8" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="8"  FIELD="StatusDateText" Runat="server" ID="Other1_StatusDateText" EnableHiddenOnUIEvent="Other1_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other1" Runat="server" ID="CurrentStatus_Other1" Value="True"  EnableHiddenOnUIEvent="Other1_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="8" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_Other1" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>
<tr id="Other2_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Other: <euc:EFormComboBox RecordId="9" LookupCode="Status" Table="Status" FIELD="Status" Runat="server" ID="Other2_Status" style="width: 125px;"/></td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Other2_DateLabel" Runat="server" />
	
		  
		  <euc:EformHidden id="Other2_StatusDate" runat="server" RecordId="9" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="9"  FIELD="StatusDateText" Runat="server" ID="Other2_StatusDateText" EnableHiddenOnUIEvent="Other2_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other2" Runat="server" ID="CurrentStatus_Other2" Value="True"  EnableHiddenOnUIEvent="Other2_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="9" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_Other2" LookupCode="Disease" Runat="server" />&nbsp;</td>

</tr>
<tr id="Other3_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Other: <euc:EFormComboBox RecordId="10" LookupCode="Status" Table="Status" FIELD="Status" Runat="server" ID="Other3_Status" style="width: 125px;"/></td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Other3_DateLabel" Runat="server" />
	
		  
		  <euc:EformHidden id="Other3_StatusDate" runat="server" RecordId="10" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="10"  FIELD="StatusDateText" Runat="server" ID="Other3_StatusDateText" EnableHiddenOnUIEvent="Other3_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other3" Runat="server" ID="CurrentStatus_Other3" Value="True" EnableHiddenOnUIEvent="Other3_Status" />&nbsp;</td>
     <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="10" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_Other3" LookupCode="Disease" Runat="server" />&nbsp;</td>

</tr>


</table>
<br/>
<br/>
<br/>
