<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryStatusLastContact" CodeFile="LiverSurgeryStatusLastContact.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">

function SetDiseaseStateDate(cbox, dateTextFieldId, date, dateFieldId, comboBox, notes)
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
		if (notes != null)
		{
		    document.getElementById(notes).value = '';
		}
	}
	
}
</script>


<a name="LiverSurgeryStatusLastContact" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Contact Status"></asp:Label><br/>
Dates for past contact states are listed below. Check a contact state to mark it as new. <br/>

<table border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="LastContact" >
  <tr>
    <td width="200px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" >Check if New Today </td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" >Notes </td>
  </tr>
  <tr id="NED_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >No Evidence of Disease (NED)</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="NED_DateLabel" Runat="server" />
	
		  <euc:EformHidden Enabled="false" id="NED_Status" runat="server" RecordId="11" Table="Status" FIELD="Status"  Value="No Evidence of Disease"/>
		  <euc:EformHidden id="NED_StatusDate" runat="server" RecordId="11" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="11"  FIELD="StatusDateText" Runat="server" ID="NED_StatusDateText" EnableHiddenOnUIEvent="NED_Status,StatusDisease_11" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_NED_11" Runat="server" ID="CurrentStatus_NED_11" Value="True"  EnableHiddenOnUIEvent="NED_Status,StatusDisease_11"/>&nbsp;
                                                             <euc:EformHidden Enabled="false" RecordId="11" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_11" Value="Liver Cancer" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformTextBox Width="100px" RecordId="11" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_11" EnableHiddenOnUIEvent="NED_Status,StatusDisease_11" ShowTextEditor="true" /></td>
  </tr>
  <tr id="AWD_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Alive with Disease (AWD)</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_DateLabel" Runat="server" />
	
		  <euc:EformHidden Enabled="false" id="AWD_Status" runat="server" RecordId="12" Table="Status" FIELD="Status"  Value="Alive with Disease"/>
		  <euc:EformHidden id="AWD_StatusDate" runat="server" RecordId="12" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="12"  FIELD="StatusDateText" Runat="server" ID="AWD_StatusDateText" EnableHiddenOnUIEvent="AWD_Status,StatusDisease_12" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_12" Runat="server" ID="CurrentStatus_AWD_12" Value="True"  EnableHiddenOnUIEvent="AWD_Status,StatusDisease_12"/>&nbsp;
                                                             <euc:EformHidden Enabled="false"  RecordId="12" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_12" Value="Liver Cancer" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformTextBox Width="100px" RecordId="12" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_12" EnableHiddenOnUIEvent="AWD_Status,StatusDisease_12" ShowTextEditor="true" /></td>
  </tr>
<tr id="AWD_Local_Recurrence_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >AWD - Local Recurrence</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_Local_Recurrence_DateLabel" Runat="server" />
	
		  <euc:EformHidden Enabled="false" id="AWD_Local_Recurrence_Status" runat="server" RecordId="13" Table="Status" FIELD="Status"  Value="AWD - Local Recurrence"/>
		  <euc:EformHidden id="AWD_Local_Recurrence_StatusDate" runat="server" RecordId="13" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="13"  FIELD="StatusDateText" Runat="server" ID="AWD_Local_Recurrence_StatusDateText" EnableHiddenOnUIEvent="AWD_Local_Recurrence_Status,StatusDisease_13" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_Local_Recurrence_13" Runat="server" ID="CurrentStatus_AWD_Local_Recurrence_13" Value="True" EnableHiddenOnUIEvent="AWD_Local_Recurrence_Status,StatusDisease_13" />&nbsp;
                                                             <euc:EformHidden Enabled="false"  RecordId="13" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_13" Value="Liver Cancer" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformTextBox Width="100px" RecordId="13" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_13" EnableHiddenOnUIEvent="AWD_Local_Recurrence_Status,StatusDisease_13" ShowTextEditor="true" /></td>
  </tr>
<tr id="AWD_Distant_Metastasis_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >AWD - Distant Metastasis</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_Distant_Metastasis_DateLabel" Runat="server" />
	
		  <euc:EformHidden Enabled="false" id="AWD_Distant_Metastasis_Status" runat="server" RecordId="14" Table="Status" FIELD="Status"  Value="AWD - Distant Metastasis"/>
		  <euc:EformHidden id="AWD_Distant_Metastasis_StatusDate" runat="server" RecordId="14" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="14"  FIELD="StatusDateText" Runat="server" ID="AWD_Distant_Metastasis_StatusDateText" EnableHiddenOnUIEvent="AWD_Distant_Metastasis_Status,StatusDisease_14" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_Distant_Metastasis_14" Runat="server" ID="CurrentStatus_AWD_Distant_Metastasis_14" Value="True" EnableHiddenOnUIEvent="AWD_Distant_Metastasis_Status,StatusDisease_14" />&nbsp;
                                                             <euc:EformHidden Enabled="false"  RecordId="14" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_14" Value="Liver Cancer" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformTextBox Width="100px" RecordId="14" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_14" EnableHiddenOnUIEvent="AWD_Distant_Metastasis_Status,StatusDisease_14" ShowTextEditor="true" /></td>
  </tr>
<tr id="AWD_Local_and_Metastasis_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >AWD - Local and Metastasis</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="AWD_Local_and_Metastasis_DateLabel" Runat="server" />
	
		  <euc:EformHidden Enabled="false" id="AWD_Local_and_Metastasis_Status" runat="server" RecordId="15" Table="Status" FIELD="Status"  Value="AWD - Local and Metastasis"/>
		  <euc:EformHidden id="AWD_Local_and_Metastasis_StatusDate" runat="server" RecordId="15" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="15"  FIELD="StatusDateText" Runat="server" ID="AWD_Local_and_Metastasis_StatusDateText" EnableHiddenOnUIEvent="AWD_Local_and_Metastasis_Status,StatusDisease_15" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_AWD_Local_and_Metastasis_15" Runat="server" ID="CurrentStatus_AWD_Local_and_Metastasis_15" Value="True"  EnableHiddenOnUIEvent="AWD_Local_and_Metastasis_Status,StatusDisease_15"/>&nbsp;
                                                             <euc:EformHidden Enabled="false"  RecordId="15" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_15" Value="Liver Cancer" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformTextBox Width="100px" RecordId="15" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_15" EnableHiddenOnUIEvent="AWD_Local_and_Metastasis_Status,StatusDisease_15" ShowTextEditor="true" /></td>
</tr>
<tr id="Lost_to_Follow_up_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Lost To Follow up</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Lost_to_Follow_up_DateLabel" Runat="server" />
	
		  <euc:EformHidden Enabled="false" id="Lost_to_Follow_up_Status" runat="server" RecordId="16" Table="Status" FIELD="Status"  Value="Lost To Follow up"/>
		  <euc:EformHidden id="Lost_to_Follow_up_StatusDate" runat="server" RecordId="16" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="16"  FIELD="StatusDateText" Runat="server" ID="Lost_to_Follow_up_StatusDateText" EnableHiddenOnUIEvent="Lost_to_Follow_up_Status,StatusDisease_16" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Lost_to_Follow_up_16" Runat="server" ID="CurrentStatus_Lost_to_Follow_up_16" Value="True"  EnableHiddenOnUIEvent="Lost_to_Follow_up_Status,StatusDisease_16"/>&nbsp;
                                                             <euc:EformHidden Enabled="false"  RecordId="16" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_16" Value="Liver Cancer" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformTextBox Width="100px" RecordId="16" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_16" EnableHiddenOnUIEvent="Lost_to_Follow_up_Status,StatusDisease_16" ShowTextEditor="true" /></td>
</tr>
<%--<tr id="DeadofDisease_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Dead of Disease</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="DeadofDisease_DateLabel" Runat="server" />
	
		  <euc:EformHidden Enabled="false" id="DeadofDisease_Status" runat="server" RecordId="17" Table="Status" FIELD="Status"  Value="Dead of Disease"/>
		  <euc:EformHidden id="DeadofDisease_StatusDate" runat="server" RecordId="17" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="17"  FIELD="StatusDateText" Runat="server" ID="DeadofDisease_StatusDateText" EnableHiddenOnUIEvent="DeadofDisease_Status,StatusDisease_17" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_DeadofDisease_17" Runat="server" ID="CurrentStatus_DeadofDisease_17" Value="True"  EnableHiddenOnUIEvent="DeadofDisease_Status,StatusDisease_17"/>&nbsp;
                                                             <euc:EformHidden Enabled="false"  RecordId="17" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_17" Value="Liver Cancer" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformTextBox Width="100px" RecordId="17" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_17" EnableHiddenOnUIEvent="NED_Status,StatusDisease_17" ShowTextEditor="true" /></td>
</tr>--%>
<tr id="Other1_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Other: <euc:EFormComboBox DropDownWidth="400px" RecordId="18" LookupCode="Status,Disease,@DiseaseView" Table="Status" FIELD="Status" Runat="server" ID="Other1_Status" style="width: 125px;"/></td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Other1_DateLabel" Runat="server" />
	
		  
		  <euc:EformHidden Enabled="false" id="Other1_StatusDate" runat="server" RecordId="18" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="18"  FIELD="StatusDateText" Runat="server" ID="Other1_StatusDateText" EnableHiddenOnUIEvent="StatusDisease_18" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other1_18" Runat="server" ID="CurrentStatus_Other1_18" Value="True"  EnableHiddenOnUIEvent="StatusDisease_18"/>&nbsp;
                                                             <euc:EformHidden Enabled="false"  RecordId="18" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_18" Value="Liver Cancer" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformTextBox Width="100px" RecordId="18" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_18" EnableHiddenOnUIEvent="StatusDisease_18" ShowTextEditor="true" /></td>
</tr>
<tr id="Other2_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Other: <euc:EFormComboBox DropDownWidth="400px" RecordId="19" LookupCode="Status,Disease,@DiseaseView" Table="Status" FIELD="Status" Runat="server" ID="Other2_Status" style="width: 125px;"/></td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Other2_DateLabel" Runat="server" />
	
		  
		  <euc:EformHidden Enabled="false" id="Other2_StatusDate" runat="server" RecordId="19" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="19"  FIELD="StatusDateText" Runat="server" ID="Other2_StatusDateText" EnableHiddenOnUIEvent="StatusDisease_19" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other2_19" Runat="server" ID="CurrentStatus_Other2_19" Value="True"  EnableHiddenOnUIEvent="StatusDisease_19"/>&nbsp;
                                                             <euc:EformHidden Enabled="false"  RecordId="19" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_19" Value="Liver Cancer" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformTextBox Width="100px" RecordId="19" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_19" EnableHiddenOnUIEvent="StatusDisease_19" ShowTextEditor="true" /></td>
</tr>
<tr id="Other3_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Other: <euc:EFormComboBox DropDownWidth="400px" RecordId="20" LookupCode="Status,Disease,@DiseaseView" Table="Status" FIELD="Status" Runat="server" ID="Other3_Status" style="width: 125px;"/></td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Other3_DateLabel" Runat="server" />
	
		  
		  <euc:EformHidden Enabled="false" id="Other3_StatusDate" runat="server" RecordId="20" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="20"  FIELD="StatusDateText" Runat="server" ID="Other3_StatusDateText" EnableHiddenOnUIEvent="StatusDisease_20" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other3_20" Runat="server" ID="CurrentStatus_Other3_20" Value="True"  EnableHiddenOnUIEvent="StatusDisease_20"/>&nbsp;
                                                             <euc:EformHidden Enabled="false"  RecordId="20" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_20" Value="Liver Cancer" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformTextBox Width="100px" RecordId="20" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_20" EnableHiddenOnUIEvent="StatusDisease_20" ShowTextEditor="true" /></td>
</tr>


</table>
<br/>
<br/>
<br/>


