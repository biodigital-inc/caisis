<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.OutcomesStatus_Restaging" CodeFile="OutcomesStatus_Restaging.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

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


<a name="OutcomesStatus_Restaging" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Disease State"></asp:Label><br/>
Dates for past disease states are listed below. Check a disease state to mark it as new. <br/>

<table width="600" border="0" cellspacing="0" cellpadding="3" class="ClinicalEformTable" id="StatusDiseaseState" style="background-color:#FFFFFF" >
  <tr>
    <td width="200px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" >Check if New Today </td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Disease</td>
  </tr>
  <tr id="Completeresponse_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Restaging - Complete response</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Completeresponse_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="Completeresponse_Status" runat="server" RecordId="1" Table="Status" FIELD="Status"  Value="Restaging - Complete response"/>
		  <euc:EformHidden id="Completeresponse_StatusDate" runat="server" RecordId="1" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="1"  FIELD="StatusDateText" Runat="server" ID="Completeresponse_StatusDateText" EnableHiddenOnUIEvent="Completeresponse_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Completeresponse" Runat="server" ID="CurrentStatus_Completeresponse" Value="True"  EnableHiddenOnUIEvent="Completeresponse_Status" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="1" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_1" LookupCode="Disease" Runat="server" />&nbsp;</td>
  
  </tr>
  <tr id="Regression_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Restaging - Regression</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Regression_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="Regression_Status" runat="server" RecordId="2" Table="Status" FIELD="Status"  Value="Restaging - Regression"/>
		  <euc:EformHidden id="Regression_StatusDate" runat="server" RecordId="2" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="2"  FIELD="StatusDateText" Runat="server" ID="Regression_StatusDateText" EnableHiddenOnUIEvent="Regression_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Regression" Runat="server" ID="CurrentStatus_Regression" Value="True" EnableHiddenOnUIEvent="Regression_Status" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="2" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_2" LookupCode="Disease" Runat="server" />&nbsp;</td>
  </tr>
<tr id="Restaging_No_Changes_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Restaging - No changes</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Restaging_No_Changes_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="Restaging_No_Changes_Status" runat="server" RecordId="3" Table="Status" FIELD="Status"  Value="Restaging - No changes"/>
		  <euc:EformHidden id="Restaging_No_Changes_StatusDate" runat="server" RecordId="3" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="3"  FIELD="StatusDateText" Runat="server" ID="Restaging_No_Changes_StatusDateText" EnableHiddenOnUIEvent="Restaging_No_Changes_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Restaging_No_Changes" Runat="server" ID="CurrentStatus_Restaging_No_Changes" Value="True"  EnableHiddenOnUIEvent="Restaging_No_Changes_Status" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="3" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_3" LookupCode="Disease" Runat="server" />&nbsp;</td>
  </tr>
<tr id="Restaging_Local_Progression_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Restaging - Local Progression</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Restaging_Local_Progression_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="Restaging_Local_Progression_Status" runat="server" RecordId="4" Table="Status" FIELD="Status"  Value="Restaging - Local Progression"/>
		  <euc:EformHidden id="Restaging_Local_Progression_StatusDate" runat="server" RecordId="4" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="4"  FIELD="StatusDateText" Runat="server" ID="Restaging_Local_Progression_StatusDateText" EnableHiddenOnUIEvent="Restaging_Local_Progression_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Restaging_Local_Progression" Runat="server" ID="CurrentStatus_Restaging_Local_Progression" Value="True" EnableHiddenOnUIEvent="Restaging_Local_Progression_Status" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="4" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_4" LookupCode="Disease" Runat="server" />&nbsp;</td>
  </tr>
<tr id="Restaging_Distant_Progression_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Restaging - Distant Progression</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Restaging_Distant_Progression_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="Restaging_Distant_Progression_Status" runat="server" RecordId="5" Table="Status" FIELD="Status"  Value="Restaging - Distant Progression"/>
		  <euc:EformHidden id="Restaging_Distant_Progression_StatusDate" runat="server" RecordId="5" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="5"  FIELD="StatusDateText" Runat="server" ID="Restaging_Distant_Progression_StatusDateText" EnableHiddenOnUIEvent="Restaging_Distant_Progression_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Restaging_Distant_Progression" Runat="server" ID="CurrentStatus_Restaging_Distant_Progression" Value="True"  EnableHiddenOnUIEvent="Restaging_Distant_Progression_Status"/>&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="5" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_5" LookupCode="Disease" Runat="server" />&nbsp;</td>
</tr>
<tr id="Restaging_Local_and_Distant_Progression_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Restaging - Local and Distant Progression</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Restaging_Local_and_Distant_Progression_DateLabel" Runat="server" />
	
		  <euc:EformHidden id="Restaging_Local_and_Distant_Progression_Status" runat="server" RecordId="6" Table="Status" FIELD="Status"  Value="Restaging - Local and Distant Progression"/>
		  <euc:EformHidden id="Restaging_Local_and_Distant_Progression_StatusDate" runat="server" RecordId="6" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="6"  FIELD="StatusDateText" Runat="server" ID="Restaging_Local_and_Distant_Progression_StatusDateText" EnableHiddenOnUIEvent="Restaging_Local_and_Distant_Progression_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Restaging_Local_and_Distant_Progression" Runat="server" ID="CurrentStatus_Restaging_Local_and_Distant_Progression" Value="True"  EnableHiddenOnUIEvent="Restaging_Local_and_Distant_Progression_Status" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="6" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_6" LookupCode="Disease" Runat="server" />&nbsp;</td>
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
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other2" Runat="server" ID="CurrentStatus_Other2" Value="True" EnableHiddenOnUIEvent="Other2_Status" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="9" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_Other2" LookupCode="Disease" Runat="server" />&nbsp;</td>

</tr>
<tr id="Other3_StatusRow" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Other: <euc:EFormComboBox RecordId="10" LookupCode="Status" Table="Status" FIELD="Status" Runat="server" ID="Other3_Status" style="width: 125px;"/></td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Other3_DateLabel" Runat="server" />
	
		  
		  <euc:EformHidden id="Other3_StatusDate" runat="server" RecordId="10" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="10"  FIELD="StatusDateText" Runat="server" ID="Other3_StatusDateText" EnableHiddenOnUIEvent="Other3_Status" />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Other3" Runat="server" ID="CurrentStatus_Other3" Value="True"  EnableHiddenOnUIEvent="Other3_Status" />&nbsp;</td>
     <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformSelect style="width:80px;" RecordId="10" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_Other3" LookupCode="Disease" Runat="server" />&nbsp;</td>

</tr>


</table>
<br/>
<br/>
<br/>
