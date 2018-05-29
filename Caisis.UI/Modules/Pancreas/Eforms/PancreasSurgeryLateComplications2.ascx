<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryLateComplications2" CodeFile="PancreasSurgeryLateComplications2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ComplicationsHtmlTable = "ComplicationsHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="PancreasSurgeryLateComplications2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle">Post-op Complications ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="PostOpCompRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="PostOpCompRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="PostOpCompAbsentDiv" runat="server" style="display: none;" >
<br/><br/>
    <table class="eformLargePopulatedTable">
        <tr>
            <td><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
          <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_6"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="6" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_6"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>
<br/>
</div>
         
<div id="PostOpCompDiv" runat="server" style="display: none;">
<br/><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComplicationsHtmlTable">
  <tr> 
    <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="35%" class="controlBoxDataGridHeaderFirstCol">Complication</td>
    <td width="35%" class="controlBoxDataGridHeaderFirstCol">Morbidity Grade</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="6"  ID="ToxDateText_6" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="6" Runat="server" ID="ToxDate_6" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication,Disease,@DiseaseView"    style="width:150;" Field="ToxName" RecordId="6" Table="Toxicities" Runat="server" id="ToxName_6"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:100px;" Field="ToxGrade" RecordId="6" Table="Toxicities" Runat="server" id="ToxGrade_6"  /></td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowTextEditor="True" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7"  ID="ToxDateText_7" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="7" Runat="server" ID="ToxDate_7" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication,Disease,@DiseaseView"    style="width:150;" Field="ToxName" RecordId="7" Table="Toxicities" Runat="server" id="ToxName_7"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:100px;" Field="ToxGrade" RecordId="7" Table="Toxicities" Runat="server" id="ToxGrade_7"  /></td>
    <td align="center"><euc:EformTextBox RecordId="7" ShowTextEditor="True" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8"  ID="ToxDateText_8" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="ToxDate_8" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication,Disease,@DiseaseView"    style="width:150;" Field="ToxName" RecordId="8" Table="Toxicities" Runat="server" id="ToxName_8"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:100px;" Field="ToxGrade" RecordId="8" Table="Toxicities" Runat="server" id="ToxGrade_8"  /></td>
    <td align="center"><euc:EformTextBox RecordId="8" ShowTextEditor="True" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9"  ID="ToxDateText_9" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="9" Runat="server" ID="ToxDate_9" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication,Disease,@DiseaseView"    style="width:150;" Field="ToxName" RecordId="9" Table="Toxicities" Runat="server" id="ToxName_9"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:100px;" Field="ToxGrade" RecordId="9" Table="Toxicities" Runat="server" id="ToxGrade_9"  /></td>
    <td align="center"><euc:EformTextBox RecordId="9" ShowTextEditor="True" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10"  ID="ToxDateText_10" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="10" Runat="server" ID="ToxDate_10" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication,Disease,@DiseaseView"    style="width:150;" Field="ToxName" RecordId="10" Table="Toxicities" Runat="server" id="ToxName_10"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:100px;" Field="ToxGrade" RecordId="10" Table="Toxicities" Runat="server" id="ToxGrade_10"  /></td>
    <td align="center"><euc:EformTextBox RecordId="10" ShowTextEditor="True" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_10"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1"/></td>
    <td>&nbsp;</td>
  </tr>
</table>

<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ComplicationsHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
<br/><br/><br/>
</div>
<table>
    <tr id="PostOpCompAbsentRow">
        <td>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="TableName" ID="TableName_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="FieldName" ID="FieldName_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_6"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br/><br/><br/>

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'),$('<%= PostOpCompDiv.ClientID %>'),$('<%= PostOpCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_6.ClientID %>'),$('<%= ToxDate_6.ClientID %>'),$('<%= ToxName_6.ClientID %>'),$('<%= ToxGrade_6.ClientID %>'),$('<%= ToxNotes_6.ClientID %>'));
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'),$('<%= PostOpCompDiv.ClientID %>'),$('<%= PostOpCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_7.ClientID %>'),$('<%= ToxDate_7.ClientID %>'),$('<%= ToxName_7.ClientID %>'),$('<%= ToxGrade_7.ClientID %>'),$('<%= ToxNotes_7.ClientID %>'));
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'),$('<%= PostOpCompDiv.ClientID %>'),$('<%= PostOpCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_8.ClientID %>'),$('<%= ToxDate_8.ClientID %>'),$('<%= ToxName_8.ClientID %>'),$('<%= ToxGrade_8.ClientID %>'),$('<%= ToxNotes_8.ClientID %>'));
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'),$('<%= PostOpCompDiv.ClientID %>'),$('<%= PostOpCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_9.ClientID %>'),$('<%= ToxDate_9.ClientID %>'),$('<%= ToxName_9.ClientID %>'),$('<%= ToxGrade_9.ClientID %>'),$('<%= ToxNotes_9.ClientID %>'));
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'),$('<%= PostOpCompDiv.ClientID %>'),$('<%= PostOpCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_10.ClientID %>'),$('<%= ToxDate_10.ClientID %>'),$('<%= ToxName_10.ClientID %>'),$('<%= ToxGrade_10.ClientID %>'),$('<%= ToxNotes_10.ClientID %>'));

    function addAbsentEvent(postOpCompRecordedID,postOpCompDivID,postOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID)
    {  
        $(postOpCompRecordedID).addEvent('click',curry(postOpCompYesNo,postOpCompRecordedID,postOpCompDivID,postOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID));
        $(toxDateTextID).addEvent('blur',curry(postOpCompYesNo,postOpCompRecordedID,postOpCompDivID,postOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID));
        $(toxNameID).addEvent('blur',curry(postOpCompYesNo,postOpCompRecordedID,postOpCompDivID,postOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID));
        $(toxNotesID).addEvent('blur',curry(postOpCompYesNo,postOpCompRecordedID,postOpCompDivID,postOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID));

        // check on load as well
        postOpCompYesNo(postOpCompRecordedID,postOpCompDivID,postOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID);
    }
   
    /* ]]> */
   
    function postOpCompYesNo(postOpCompRecordedID,postOpCompDivID,postOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID)
    {
       var postOpCompRecordedRef = postOpCompRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < postOpCompRecordedRef.length; i++) 
        if (postOpCompRecordedRef[i].checked) {  
            postOpCompRadioClick(postOpCompRecordedRef[i].value,postOpCompDivID,postOpCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID);
            }
    }
    
    function postOpCompRadioClick(postOpCompoption_value,postOpComphideDiv,postOpComphideAbsentDiv,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID)
    {
      if (postOpCompoption_value == "Yes")
      { 
        postOpComphideDiv.style.display='block';
        postOpComphideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_6.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_6.ClientID %>').value='';
        document.getElementById('<%= TableName_6.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_6.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_6.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_6.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_6.ClientID %>').value = '';
        
      }
      else if (postOpCompoption_value == "No" || postOpCompoption_value == "Unknown" || postOpCompoption_value == "N/A")
      {
        postOpComphideAbsentDiv.style.display='block';
        postOpComphideDiv.style.display='none';
      
        document.getElementById('<%= TableName_6.ClientID %>').value = 'Toxicities';        
        document.getElementById('<%= FieldName_6.ClientID %>').value = 'ToxName';        
        document.getElementById('<%= FieldValue_6.ClientID %>').value = 'Post-op Complications'; 
        
        if (postOpCompoption_value == "No")       
            document.getElementById('<%= AbsentReason_6.ClientID %>').value = 'None Recorded';        
        else if (postOpCompoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_6.ClientID %>').value = 'Unknown';
        else if (postOpCompoption_value == "N/A")
            document.getElementById('<%= AbsentReason_6.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= AbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_6.ClientID %>').value + ' as of ';

        document.getElementById('<%= AbsentQuality_6.ClientID %>').value = 'OUT';        

        toxDateTextID.value = '';
        toxDateID.value = '';
        toxNameID.value = '';
        toxGradeID.value = '';
        toxNotesID.value = '';   
     }
    }

</script>
