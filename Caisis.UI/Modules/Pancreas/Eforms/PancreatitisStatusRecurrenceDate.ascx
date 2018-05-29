<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreatitisStatusRecurrenceDate" CodeFile="PancreatitisStatusRecurrenceDate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" language="javascript">
	tableArray.RecurrenceDateHtmlTable = "RecurrenceDateHtmlTable";
</script>

<a name="PancreatitisStatusRecurrenceDate" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Recurrence Date"></asp:Label><br/>

<table width="400" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="RecurrenceDateHtmlTable">
  <tr>
    <td width="200px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" >Check if New Today </td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" >Notes</td>
  </tr>
<tr id="Recurrence_Date_StatusRow_24" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" style="white-space: nowrap; " >Recurrence Date</td>
    <td class="ClinicalEformPopulatedColumn" >	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Recurrence_Date_Status_24" runat="server" RecordId="24" Table="Status" FIELD="Status"  />
		  <euc:EformHidden id="Recurrence_Date_StatusDate_24" runat="server" RecordId="24" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="24"  FIELD="StatusDateText" Runat="server" ID="Recurrence_Date_StatusDateText_24"  />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Recurrence_Date_24" Runat="server" ID="CurrentStatus_Recurrence_Date_24" Value="True"  />&nbsp;
          <euc:EformTextBox Width="1px" style="display: none;" RecordId="24" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_24" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
         <euc:EformTextBox Width="100px" RecordId="24" TABLE="Status"  FIELD="StatusNotes" ID="StatusNotes_24" Runat="server" ShowTextEditor="true" /></td>

</tr>
<tr id="Recurrence_Date_StatusRow_25" runat="server" style="display: none; "  >
    <td height="32" class="ClinicalEformPopulatedColumn" style="white-space: nowrap; " >Recurrence Date</td>
    <td class="ClinicalEformPopulatedColumn" >	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Recurrence_Date_Status_25" runat="server" RecordId="25" Table="Status" FIELD="Status"  />
		  <euc:EformHidden id="Recurrence_Date_StatusDate_25" runat="server" RecordId="25" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="25"  FIELD="StatusDateText" Runat="server" ID="Recurrence_Date_StatusDateText_25"  />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Recurrence_Date_25" Runat="server" ID="CurrentStatus_Recurrence_Date_25" Value="True"  />&nbsp;
          <euc:EformTextBox Width="1px" style="display: none;" RecordId="25" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_25" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
         <euc:EformTextBox Width="100px" RecordId="25" TABLE="Status"  FIELD="StatusNotes" ID="StatusNotes_25" Runat="server" ShowTextEditor="true" /></td>
</tr>
<tr id="Recurrence_Date_StatusRow_26" runat="server" style="display: none; "  >
    <td height="32" class="ClinicalEformPopulatedColumn" style="white-space: nowrap; " >Recurrence Date</td>
    <td class="ClinicalEformPopulatedColumn" >	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Recurrence_Date_Status_26" runat="server" RecordId="26" Table="Status" FIELD="Status"  />
		  <euc:EformHidden id="Recurrence_Date_StatusDate_26" runat="server" RecordId="26" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="26"  FIELD="StatusDateText" Runat="server" ID="Recurrence_Date_StatusDateText_26"  />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Recurrence_Date_26" Runat="server" ID="CurrentStatus_Recurrence_Date_26" Value="True"  />&nbsp;
          <euc:EformTextBox Width="1px" style="display: none;" RecordId="26" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_26" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
         <euc:EformTextBox Width="100px" RecordId="26" TABLE="Status"  FIELD="StatusNotes" ID="StatusNotes_26" Runat="server" ShowTextEditor="true" /></td>

</tr>
<tr id="Recurrence_Date_StatusRow_27" runat="server" style="display: none; "  >
    <td height="32" class="ClinicalEformPopulatedColumn" style="white-space: nowrap; " >Recurrence Date</td>
    <td class="ClinicalEformPopulatedColumn" >	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Recurrence_Date_Status_27" runat="server" RecordId="27" Table="Status" FIELD="Status"  />
		  <euc:EformHidden id="Recurrence_Date_StatusDate_27" runat="server" RecordId="27" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="27"  FIELD="StatusDateText" Runat="server" ID="Recurrence_Date_StatusDateText_27"  />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Recurrence_Date_27" Runat="server" ID="CurrentStatus_Recurrence_Date_27" Value="True"  />&nbsp;
          <euc:EformTextBox Width="1px" style="display: none;" RecordId="27" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_27" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
         <euc:EformTextBox Width="100px" RecordId="27" TABLE="Status"  FIELD="StatusNotes" ID="StatusNotes_27" Runat="server" ShowTextEditor="true" /></td>

</tr>
<tr id="Recurrence_Date_StatusRow_28" runat="server" style="display: none; "  >
    <td height="32" class="ClinicalEformPopulatedColumn" style="white-space: nowrap; " >Recurrence Date</td>
    <td class="ClinicalEformPopulatedColumn" >	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Recurrence_Date_Status_28" runat="server" RecordId="28" Table="Status" FIELD="Status"  />
		  <euc:EformHidden id="Recurrence_Date_StatusDate_28" runat="server" RecordId="28" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="28"  FIELD="StatusDateText" Runat="server" ID="Recurrence_Date_StatusDateText_28"  />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Recurrence_Date_28" Runat="server" ID="CurrentStatus_Recurrence_Date_28" Value="True"  />&nbsp;
          <euc:EformTextBox Width="1px" style="display: none;" RecordId="28" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_28" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
         <euc:EformTextBox Width="100px" RecordId="28" TABLE="Status"  FIELD="StatusNotes" ID="StatusNotes_28" Runat="server" ShowTextEditor="true" /></td>

</tr>
<tr id="Recurrence_Date_StatusRow_29" runat="server" style="display: none; "  >
    <td height="32" class="ClinicalEformPopulatedColumn" style="white-space: nowrap; " >Recurrence Date</td>
    <td class="ClinicalEformPopulatedColumn" >	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Recurrence_Date_Status_29" runat="server" RecordId="29" Table="Status" FIELD="Status"  />
		  <euc:EformHidden id="Recurrence_Date_StatusDate_29" runat="server" RecordId="29" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="29"  FIELD="StatusDateText" Runat="server" ID="Recurrence_Date_StatusDateText_29"  />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Recurrence_Date_29" Runat="server" ID="CurrentStatus_Recurrence_Date_29" Value="True"  />&nbsp;
          <euc:EformTextBox Width="1px" style="display: none;" RecordId="29" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_29" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
         <euc:EformTextBox Width="100px" RecordId="29" TABLE="Status"  FIELD="StatusNotes" ID="StatusNotes_29" Runat="server" ShowTextEditor="true" /></td>

</tr>
<tr id="Recurrence_Date_StatusRow_30" runat="server" style="display: none; " >
    <td height="32" class="ClinicalEformPopulatedColumn" style="white-space: nowrap; " >Recurrence Date</td>
    <td class="ClinicalEformPopulatedColumn" >	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Recurrence_Date_Status_30" runat="server" RecordId="30" Table="Status" FIELD="Status"  />
		  <euc:EformHidden id="Recurrence_Date_StatusDate_30" runat="server" RecordId="30" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="30"  FIELD="StatusDateText" Runat="server" ID="Recurrence_Date_StatusDateText_30"  />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
          <euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Recurrence_Date_30" Runat="server" ID="CurrentStatus_Recurrence_Date_30" Value="True"  />&nbsp;
          <euc:EformTextBox Width="1px" style="display: none;" RecordId="30" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_30" Runat="server" />&nbsp;</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
         <euc:EformTextBox Width="100px" RecordId="30" TABLE="Status"  FIELD="StatusNotes" ID="StatusNotes_30" Runat="server" ShowTextEditor="true" /></td>

</tr>


</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RecurrenceDateHtmlTable');" />

<br/><br/><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= Recurrence_Date_Status_24.ClientID %>'),$('<%= StatusDisease_24.ClientID %>'),$('<%= CurrentStatus_Recurrence_Date_24.ClientID %>'),$('<%= Recurrence_Date_StatusDateText_24.ClientID %>'),$('<%= Recurrence_Date_StatusDate_24.ClientID %>'),$('<%= StatusNotes_24.ClientID %>'));
    addAbsentEvent($('<%= Recurrence_Date_Status_25.ClientID %>'),$('<%= StatusDisease_25.ClientID %>'),$('<%= CurrentStatus_Recurrence_Date_25.ClientID %>'),$('<%= Recurrence_Date_StatusDateText_25.ClientID %>'),$('<%= Recurrence_Date_StatusDate_25.ClientID %>'),$('<%= StatusNotes_25.ClientID %>'));
    addAbsentEvent($('<%= Recurrence_Date_Status_26.ClientID %>'),$('<%= StatusDisease_26.ClientID %>'),$('<%= CurrentStatus_Recurrence_Date_26.ClientID %>'),$('<%= Recurrence_Date_StatusDateText_26.ClientID %>'),$('<%= Recurrence_Date_StatusDate_26.ClientID %>'),$('<%= StatusNotes_26.ClientID %>'));
    addAbsentEvent($('<%= Recurrence_Date_Status_27.ClientID %>'),$('<%= StatusDisease_27.ClientID %>'),$('<%= CurrentStatus_Recurrence_Date_27.ClientID %>'),$('<%= Recurrence_Date_StatusDateText_27.ClientID %>'),$('<%= Recurrence_Date_StatusDate_27.ClientID %>'),$('<%= StatusNotes_27.ClientID %>'));
    addAbsentEvent($('<%= Recurrence_Date_Status_28.ClientID %>'),$('<%= StatusDisease_28.ClientID %>'),$('<%= CurrentStatus_Recurrence_Date_28.ClientID %>'),$('<%= Recurrence_Date_StatusDateText_28.ClientID %>'),$('<%= Recurrence_Date_StatusDate_28.ClientID %>'),$('<%= StatusNotes_28.ClientID %>'));
    addAbsentEvent($('<%= Recurrence_Date_Status_29.ClientID %>'),$('<%= StatusDisease_29.ClientID %>'),$('<%= CurrentStatus_Recurrence_Date_29.ClientID %>'),$('<%= Recurrence_Date_StatusDateText_29.ClientID %>'),$('<%= Recurrence_Date_StatusDate_29.ClientID %>'),$('<%= StatusNotes_29.ClientID %>'));
    addAbsentEvent($('<%= Recurrence_Date_Status_30.ClientID %>'),$('<%= StatusDisease_30.ClientID %>'),$('<%= CurrentStatus_Recurrence_Date_30.ClientID %>'),$('<%= Recurrence_Date_StatusDateText_30.ClientID %>'),$('<%= Recurrence_Date_StatusDate_30.ClientID %>'),$('<%= StatusNotes_30.ClientID %>'));

    function addAbsentEvent(status,disease,todaysDateCB,statusDateText,statusDate,statusNotes)
    {  
        $(statusDateText).addEvent('blur',curry(SetHiddenFields,status,disease,todaysDateCB,statusDateText,statusDate,statusNotes));
        $(todaysDateCB).addEvent('click',curry(SetHiddenFields,status,disease,todaysDateCB,statusDateText,statusDate,statusNotes));
        $(statusNotes).addEvent('blur',curry(SetHiddenFields,status,disease,todaysDateCB,statusDateText,statusDate,statusNotes));
    }
   
    /* ]]> */
   
    function SetHiddenFields(status,disease,todaysDateCB,statusDateText,statusDate,statusNotes)
    {        
        if (todaysDateCB.checked || statusDateText.value != '' || statusNotes.value != '')
        {
            status.value = 'Recurrence Date';
            disease.value = 'Pancreatitis';
            
        	if (todaysDateCB.checked)
            {
	            var dateToday = new Date();
	            
	            var month = dateToday.getMonth() + 1;
                var day = dateToday.getDate();
                var year = dateToday.getFullYear();
                
                var dateString = month + "/" + day + "/" + year;
	            
	            statusDateText.value = dateString;
	            statusDate.value = dateString;
        		
            }
        }
        else
        {
            status.value = '';
            disease.value = '';
            statusDateText.value = '';
            statusDate.value = '';
        }
    }
    
</script>