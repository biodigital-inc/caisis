<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreatitisHistoryofCancer" CodeFile="PancreatitisHistoryofCancer.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="PancreatitisHistoryofCancer" /><br/>


<table class="eformLargePopulatedTable">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Personal history of cancer"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="CancerHxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="CancerHxRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="CancerHxAbsentDiv" runat="server" style="display: none;" >
 <br /><br />  
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="80" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_80"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="80" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_80"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>
<br />
</div>
                
<div id="CancerHxDiv" runat="server" style="display: none;">
 <br /><br />  
<table cellpadding="8" cellspacing="0" class="eformLargePopulatedTableBlue" id="CancerHxHtmlTable">

    <tr > 
        <td></td>
        <td align="left" style="white-space: nowrap;" ><euc:EformCheckbox RecordId="81"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_81" Value="Colorectal Cancer" />Colorectal</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="82"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_82" Value="Small Intestine Cancer" />Small Intestine</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="83"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_83" Value="Pancreas Cancer" />Pancreas</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="84"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_84" Value="Stomach Cancer" />Stomach</td>
   </tr>
   <tr > 
        <td><strong>Notes:</strong></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="81"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_81" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="82"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_82" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="83"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_83" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="84"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_84" ShowTextEditor="true" /></td>
   </tr>
    <tr><td colspan="5" valign="top" align="center"><strong></strong><br /></td></tr>
    <tr > 
        <td></td>
        <td align="left" style="white-space: nowrap;" ><euc:EformCheckbox RecordId="85"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_85" Value="Lung Cancer" />Lung</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="86"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_86" Value="H/N Cancer" />H/N</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="87"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_87" Value="Thyroid Cancer" />Thyroid</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="88"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_88" Value="Melanoma Cancer" />Melanoma</td>
   </tr>
   <tr > 
        <td><strong>Notes:</strong></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="85"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_85" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="86"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_86" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="87"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_87" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="88"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_88" ShowTextEditor="true" /></td>
   </tr>
    <tr><td colspan="5" valign="top" align="center"><strong></strong><br /></td></tr>
    <tr > 
        <td></td>
        <td align="left" style="white-space: nowrap;" ><euc:EformCheckbox RecordId="89"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_89" Value="Non-melanoma skin Cancer" />Non-melanoma skin</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="90"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_90" Value="Uterine Cancer" />Uterine</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="91"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_91" Value="Cervix Cancer" />Cervix</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="92"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_92" Value="Ovary Cancer" />Ovary</td>
   </tr>
   <tr > 
        <td><strong>Notes:</strong></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="89"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_89" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="90"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_90" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="91"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_91" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="92"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_92" ShowTextEditor="true" /></td>
   </tr>
    <tr><td colspan="5" valign="top" align="center"><strong></strong><br /></td></tr>
    <tr > 
        <td></td>
        <td align="left" style="white-space: nowrap;" ><euc:EformCheckbox RecordId="93"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_93" Value="Breast Cancer" />Breast</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="94"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_94" Value="Prostate Cancer" />Prostate</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="95"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_95" Value="Kidney/Bladder Cancer" />Kidney/Bladder</td>
        <td align="left" style="white-space: nowrap;"><euc:EformCheckbox RecordId="96"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_96" Value="Hematologic Cancer" />Hematologic</td>
   </tr>
   <tr > 
        <td><strong>Notes:</strong></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="93"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_93" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="94"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_94" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="95"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_95" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="96"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_96" ShowTextEditor="true" /></td>
   </tr>
    <tr><td colspan="5" valign="top" align="center"><strong></strong><br /></td></tr>
    <tr > 
        <td></td>
        <td align="left" style="white-space: nowrap;"><strong>Other:</strong><br /><euc:EformTextbox Width="120px" RecordId="97"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_97" /></td>
        <td align="left" style="white-space: nowrap;"><strong>Other:</strong><br /><euc:EformTextbox Width="120px" RecordId="98"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_98" /></td>
        <td align="left" style="white-space: nowrap;"><strong>Other:</strong><br /><euc:EformTextbox Width="120px" RecordId="99"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_99" /></td>
        <td align="left" style="white-space: nowrap;"><strong>Other:</strong><br /><euc:EformTextbox Width="120px" RecordId="100"  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_100" /></td>
   </tr>
   <tr > 
        <td><strong>Notes:</strong></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="97"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_97" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="98"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_98" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="99"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_99" ShowTextEditor="true" /></td>
        <td align="left" style="white-space: nowrap;"><euc:EformTextBox Width="80px" RecordId="100"  TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_100" ShowTextEditor="true" /></td>
   </tr>


</table>
</div>
 <br /><br />  <br />
<table >
    <tr id="ComorbAbsentRow">
        <td>
            <euc:EformTextBox RecordId="80" Table="AbsentEvents" Field="TableName" ID="TableName_80"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="80" Table="AbsentEvents" Field="FieldName" ID="FieldName_80"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="80" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_80"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="80" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_80"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="80" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_80"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_81.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_82.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_83.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_84.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_85.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_86.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_87.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_88.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_89.ClientID %>'));

    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_90.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_91.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_92.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_93.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_94.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_95.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_96.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_97.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_98.ClientID %>'));
    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_99.ClientID %>'));

    addAbsentEvent($('<%= CancerHxRecorded.ClientID %>'),$('<%= CancerHxDiv.ClientID %>'),$('<%= CancerHxAbsentDiv.ClientID %>'),$('<%= Comorbidity_100.ClientID %>'));

    function addAbsentEvent(CancerHxRecordedID,CancerHxDivID,CancerHxAbsentDivID,comorbidityID)
    {
        $(CancerHxRecordedID).addEvent('click', curry(CancerYesNo, CancerHxRecordedID, CancerHxDivID, CancerHxAbsentDivID, comorbidityID));
        if (comorbidityID.type == 'checkbox')
            $(comorbidityID).addEvent('click', curry(CancerYesNo, CancerHxRecordedID, CancerHxDivID, CancerHxAbsentDivID, comorbidityID));
        else if (comorbidityID.type == 'text')
            $(comorbidityID).addEvent('blur', curry(CancerYesNo, CancerHxRecordedID, CancerHxDivID, CancerHxAbsentDivID, comorbidityID));

        // check on load as well
        CancerYesNo(CancerHxRecordedID, CancerHxDivID, CancerHxAbsentDivID, comorbidityID);
    }
   
    /* ]]> */
   
    function CancerYesNo(CancerHxRecordedID,CancerHxDivID,CancerHxAbsentDivID,comorbidityID)
    {
       var CancerHxRecordedRef = CancerHxRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < CancerHxRecordedRef.length; i++) 
        if (CancerHxRecordedRef[i].checked) {
            CancerRadioClick(CancerHxRecordedRef[i].value, CancerHxDivID, CancerHxAbsentDivID, comorbidityID);
            }
    }
    
    function CancerRadioClick(Canceroption_value,CancerhideDiv,CancerhideAbsentDiv,comorbidityID)
    {
      if (Canceroption_value == "Yes")
      { 
        CancerhideDiv.style.display='block';
        CancerhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_80.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_80.ClientID %>').value='';
        document.getElementById('<%= TableName_80.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_80.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_80.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_80.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_80.ClientID %>').value = '';
        
      }
      else if (Canceroption_value == "No" || Canceroption_value == "Unknown" || Canceroption_value == "N/A")
      {
        CancerhideAbsentDiv.style.display='block';
        CancerhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_80.ClientID %>').value = 'Canceridities';        
        document.getElementById('<%= FieldName_80.ClientID %>').value = 'Canceridity';        
        document.getElementById('<%= FieldValue_80.ClientID %>').value = 'Personal history of cancer'; 
        
        if (Canceroption_value == "No")       
            document.getElementById('<%= AbsentReason_80.ClientID %>').value = 'None Recorded';        
        else if (Canceroption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_80.ClientID %>').value = 'Unknown';
        else if (Canceroption_value == "N/A")
            document.getElementById('<%= AbsentReason_80.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= AbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_80.ClientID %>').value + ' as of ';

        document.getElementById('<%= AbsentQuality_80.ClientID %>').value = 'OUT';

        comorbidityID.value = '';
     }
    }

</script>