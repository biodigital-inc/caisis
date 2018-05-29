<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.LateComplicationsWithAbsentEvent" CodeFile="LateComplicationsWithAbsentEvent.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ComplicationsHtmlTable = "ComplicationsHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="LateComplicationsWithAbsentEvent" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle">Intra-Operative Complications ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="IntraOpCompRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="IntraOpCompRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="IntraOpCompAbsentDiv" runat="server" style="display: none;" >
<br /><br /> 
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_5"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="5" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_5"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table>

</div>
                 
<div id="IntraOpCompDiv" runat="server" style="display: none;">
<br /><br /> 
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComplicationsHtmlTable">
  <tr> 
    <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="35%" class="controlBoxDataGridHeaderFirstCol">Complication</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="ToxDateText_1" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="ToxDate_1" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="1" Table="Toxicities" Runat="server" id="ToxName_1"  /></td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="ToxDateText_2" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="ToxDate_2" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="2" Table="Toxicities" Runat="server" id="ToxName_2"  /></td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="ToxDateText_3" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="ToxDate_3" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="3" Table="Toxicities" Runat="server" id="ToxName_3"  /></td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="ToxDateText_4" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="ToxDate_4" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="4" Table="Toxicities" Runat="server" id="ToxName_4"  /></td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="ToxDateText_5" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="ToxDate_5" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="5" Table="Toxicities" Runat="server" id="ToxName_5"  /></td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1"/></td>
    <td>&nbsp;</td>
  </tr>
</table>

<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ComplicationsHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>

</div>
<br/><br/><br/>
<table>
    <tr id="IntraOpCompAbsentRow">
        <td>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="TableName" ID="TableName_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldName" ID="FieldName_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_5"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= IntraOpCompRecorded.ClientID %>'),$('<%= IntraOpCompDiv.ClientID %>'),$('<%= IntraOpCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_1.ClientID %>'),$('<%= ToxDate_1.ClientID %>'),$('<%= ToxName_1.ClientID %>'),$('<%= ToxNotes_1.ClientID %>'));
    addAbsentEvent($('<%= IntraOpCompRecorded.ClientID %>'),$('<%= IntraOpCompDiv.ClientID %>'),$('<%= IntraOpCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_2.ClientID %>'),$('<%= ToxDate_2.ClientID %>'),$('<%= ToxName_2.ClientID %>'),$('<%= ToxNotes_2.ClientID %>'));
    addAbsentEvent($('<%= IntraOpCompRecorded.ClientID %>'),$('<%= IntraOpCompDiv.ClientID %>'),$('<%= IntraOpCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_3.ClientID %>'),$('<%= ToxDate_3.ClientID %>'),$('<%= ToxName_3.ClientID %>'),$('<%= ToxNotes_3.ClientID %>'));
    addAbsentEvent($('<%= IntraOpCompRecorded.ClientID %>'),$('<%= IntraOpCompDiv.ClientID %>'),$('<%= IntraOpCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_4.ClientID %>'),$('<%= ToxDate_4.ClientID %>'),$('<%= ToxName_4.ClientID %>'),$('<%= ToxNotes_4.ClientID %>'));
    addAbsentEvent($('<%= IntraOpCompRecorded.ClientID %>'),$('<%= IntraOpCompDiv.ClientID %>'),$('<%= IntraOpCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_5.ClientID %>'),$('<%= ToxDate_5.ClientID %>'),$('<%= ToxName_5.ClientID %>'),$('<%= ToxNotes_5.ClientID %>'));

    function addAbsentEvent(intraOpCompRecordedID,intraOpCompDivID,intraOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxNotesID)
    {  
        $(intraOpCompRecordedID).addEvent('click',curry(IntraOpCompYesNo,intraOpCompRecordedID,intraOpCompDivID,intraOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxNotesID));
        $(toxDateTextID).addEvent('blur',curry(IntraOpCompYesNo,intraOpCompRecordedID,intraOpCompDivID,intraOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxNotesID));
        $(toxNameID).addEvent('blur',curry(IntraOpCompYesNo,intraOpCompRecordedID,intraOpCompDivID,intraOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxNotesID));
        $(toxNotesID).addEvent('blur',curry(IntraOpCompYesNo,intraOpCompRecordedID,intraOpCompDivID,intraOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxNotesID));

        // check on load as well
        IntraOpCompYesNo(intraOpCompRecordedID,intraOpCompDivID,intraOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxNotesID);
    }
   
    /* ]]> */
   
    function IntraOpCompYesNo(intraOpCompRecordedID,intraOpCompDivID,intraOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxNotesID)
    {
       var intraOpCompRecordedRef = intraOpCompRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < intraOpCompRecordedRef.length; i++) 
        if (intraOpCompRecordedRef[i].checked) {  
            IntraOpCompRadioClick(intraOpCompRecordedRef[i].value,intraOpCompDivID,intraOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxNotesID);
            }
    }
    
    function IntraOpCompRadioClick(IntraOpCompoption_value,IntraOpComphideDiv,IntraOpComphideAbsentDiv,toxDateTextID,toxDateID,toxNameID,toxNotesID)
    {
      if (IntraOpCompoption_value == "Yes")
      { 
        IntraOpComphideDiv.style.display='block';
        IntraOpComphideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_5.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_5.ClientID %>').value='';
        document.getElementById('<%= TableName_5.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_5.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_5.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_5.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_5.ClientID %>').value = '';
        
      } 
      else if (IntraOpCompoption_value == "No" || IntraOpCompoption_value == "Unknown")
      {
        IntraOpComphideAbsentDiv.style.display='block';
        IntraOpComphideDiv.style.display='none';
      
        document.getElementById('<%= TableName_5.ClientID %>').value = 'Toxicities';        
        document.getElementById('<%= FieldName_5.ClientID %>').value = 'ToxName';        
        document.getElementById('<%= FieldValue_5.ClientID %>').value = 'Intra-Operative Complications'; 
        
        if (IntraOpCompoption_value == "No")       
            document.getElementById('<%= AbsentReason_5.ClientID %>').value = 'None Recorded';        
        if (IntraOpCompoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_5.ClientID %>').value = 'Unknown';        

        document.getElementById('<%= AbsentQuality_5.ClientID %>').value = 'OUT';        

        toxDateTextID.value = '';
        toxDateID.value = '';
        toxNameID.value = '';
        toxNotesID.value = '';   
     }
    }

</script>