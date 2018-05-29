<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxComplications2" CodeFile="OropharynxComplications2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
    tableArray.OropharynxComplicationsHtmlTable2 = "OropharynxComplicationsHtmlTable2";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OropharynxComplications" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Complications"></asp:Label><br/>
<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Complications ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ComplicationRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ComplicationRecorded2">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="ComplicationAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_14"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="14" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_14"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
    </table>
</div>


<div id="ComplicationDiv" runat="server" style="display: none;">
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OropharynxComplicationsHtmlTable2">
  <tr> 
    <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="35%" class="controlBoxDataGridHeaderFirstCol">Complication</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="6"  ID="ToxDateText_6" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="6" Runat="server" ID="ToxDate_6" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="6" Table="Toxicities" Runat="server" id="ToxName_6"  /></td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7"  ID="ToxDateText_7" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="7" Runat="server" ID="ToxDate_7" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="7" Table="Toxicities" Runat="server" id="ToxName_7"  /></td>
    <td align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8"  ID="ToxDateText_8" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="ToxDate_8" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="8" Table="Toxicities" Runat="server" id="ToxName_8"  /></td>
    <td align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9"  ID="ToxDateText_9" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="9" Runat="server" ID="ToxDate_9" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="9" Table="Toxicities" Runat="server" id="ToxName_9"  /></td>
    <td align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10"  ID="ToxDateText_10" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="10" Runat="server" ID="ToxDate_10" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="10" Table="Toxicities" Runat="server" id="ToxName_10"  /></td>
    <td align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_10"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'OropharynxComplicationsHtmlTable2');"><img alt="" src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
</div>
<table>
    <tr id="ComplicationsAbsentRow">
        <td>
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="TableName" ID="TableName_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="FieldName" ID="FieldName_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_14"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo

    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'));

    function addAbsentEvent(complicationRecordedID,complicationDivID,complicationAbsentDivID,antiviralRecordedID,antiviralDivID,antiviralAbsentDivID)
    {  
        $(complicationRecordedID).addEvent('click',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,complicationAbsentDivID));
       
        // check on load as well
       ComplicationYesNo(complicationRecordedID,complicationDivID,complicationAbsentDivID);

    }
   
    /* ]]> */
    
   
    function ComplicationYesNo(complicationRecordedID,complicationDivID,complicationAbsentDivID)
    {
       var complicationRecordedRef = complicationRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < complicationRecordedRef.length; i++) 
        if (complicationRecordedRef[i].checked) {  
            ComplicationRadioClick(complicationRecordedRef[i].value,complicationDivID,complicationAbsentDivID);
            }
    }
    
   
    function ComplicationRadioClick(Complicationoption_value,ComplicationhideDiv,ComplicationhideAbsentDiv)
    {
      if (Complicationoption_value == "Yes")
      { 
       ComplicationhideDiv.style.display='block';
       ComplicationhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_14.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_14.ClientID %>').value='';
        document.getElementById('<%= TableName_14.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_14.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_14.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_14.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_14.ClientID %>').value = '';
      } 
      else if (Complicationoption_value == "No")
      {
       ComplicationhideDiv.style.display='none';
       ComplicationhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_14.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_14.ClientID %>').value='';
        document.getElementById('<%= TableName_14.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_14.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_14.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_14.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_14.ClientID %>').value = '';
        
        document.getElementById('<%= ToxDateText_6.ClientID %>').value='';
        document.getElementById('<%= ToxDate_6.ClientID %>').value='';
        document.getElementById('<%= ToxName_6.ClientID %>').value='';
        document.getElementById('<%= ToxNotes_6.ClientID %>').value='';
        
        document.getElementById('<%= ToxDateText_7.ClientID %>').value='';
        document.getElementById('<%= ToxDate_7.ClientID %>').value='';
        document.getElementById('<%= ToxName_7.ClientID %>').value='';
        document.getElementById('<%= ToxNotes_7.ClientID %>').value='';

        document.getElementById('<%= ToxDateText_8.ClientID %>').value='';
        document.getElementById('<%= ToxDate_8.ClientID %>').value='';
        document.getElementById('<%= ToxName_8.ClientID %>').value='';
        document.getElementById('<%= ToxNotes_8.ClientID %>').value='';

        document.getElementById('<%= ToxDateText_9.ClientID %>').value='';
        document.getElementById('<%= ToxDate_9.ClientID %>').value='';
        document.getElementById('<%= ToxName_9.ClientID %>').value='';
        document.getElementById('<%= ToxNotes_9.ClientID %>').value='';

        document.getElementById('<%= ToxDateText_10.ClientID %>').value='';
        document.getElementById('<%= ToxDate_10.ClientID %>').value='';
        document.getElementById('<%= ToxName_10.ClientID %>').value='';
        document.getElementById('<%= ToxNotes_10.ClientID %>').value='';
      }
    }
</script>

