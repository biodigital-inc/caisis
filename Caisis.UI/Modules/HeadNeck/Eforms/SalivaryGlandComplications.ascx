<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandComplications" CodeFile="SalivaryGlandComplications.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
    tableArray.SalivaryGlandComplicationsHtmlTable = "SalivaryGlandComplicationsHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SalivaryGlandComplications" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Complications"></asp:Label><br/>
<table class="eformlargepopulatedtable" >
    <tr>
        <td>
            <span class="controlBoxTitle">Complications ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ComplicationRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ComplicationRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>
<br />
<div id="ComplicationAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" >
           </td>
        </tr>
    </table>
</div>


<div id="ComplicationDiv" runat="server" style="display: none;">
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SalivaryGlandComplicationsHtmlTable">
  <tr> 
    <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="35%" class="controlBoxDataGridHeaderFirstCol">Complication</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1" ParentRecordId="16"  ID="ToxDateText_1" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" ParentRecordId="16" Runat="server" ID="ToxDate_1" Table="Toxicities" Field="ToxDate" />    
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="16" ID="ToxQuality_1" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="1" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_1"  /></td>
    <td align="center"><euc:EformTextBox RecordId="1" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2" ParentRecordId="16"  ID="ToxDateText_2" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" ParentRecordId="16" Runat="server" ID="ToxDate_2" Table="Toxicities" Field="ToxDate" />    
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="16" ID="ToxQuality_2" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="2" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_2"  /></td>
    <td align="center"><euc:EformTextBox RecordId="2" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3" ParentRecordId="16"  ID="ToxDateText_3" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" ParentRecordId="16" Runat="server" ID="ToxDate_3" Table="Toxicities" Field="ToxDate" />       
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="16" ID="ToxQuality_3" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="3" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_3"  /></td>
    <td align="center"><euc:EformTextBox RecordId="3" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4" ParentRecordId="16"  ID="ToxDateText_4" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" ParentRecordId="16" Runat="server" ID="ToxDate_4" Table="Toxicities" Field="ToxDate" />           
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="16" ID="ToxQuality_4" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="4" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_4"  /></td>
    <td align="center"><euc:EformTextBox RecordId="4" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5" ParentRecordId="16"  ID="ToxDateText_5" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" ParentRecordId="16" Runat="server" ID="ToxDate_5" Table="Toxicities" Field="ToxDate" />             
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="16" ID="ToxQuality_5" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="5" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_5"  /></td>
    <td align="center"><euc:EformTextBox RecordId="5" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="6" ParentRecordId="16"  ID="ToxDateText_6" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="6" ParentRecordId="16" Runat="server" ID="ToxDate_6" Table="Toxicities" Field="ToxDate" />              
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ParentRecordId="16" ID="ToxQuality_6" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="6" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_6"  /></td>
    <td align="center"><euc:EformTextBox RecordId="6" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7" ParentRecordId="16"  ID="ToxDateText_7" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="7" ParentRecordId="16" Runat="server" ID="ToxDate_7" Table="Toxicities" Field="ToxDate" />                 
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ParentRecordId="16" ID="ToxQuality_7" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="7" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_7"  /></td>
    <td align="center"><euc:EformTextBox RecordId="7" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_7"/></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8" ParentRecordId="16"  ID="ToxDateText_8" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="8" ParentRecordId="16" Runat="server" ID="ToxDate_8" Table="Toxicities" Field="ToxDate" />                 
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ParentRecordId="16" ID="ToxQuality_8" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="8" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_8"  /></td>
    <td align="center"><euc:EformTextBox RecordId="8" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_8"/></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9" ParentRecordId="16"  ID="ToxDateText_9" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="9" ParentRecordId="16" Runat="server" ID="ToxDate_9" Table="Toxicities" Field="ToxDate" />                 
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ParentRecordId="16" ID="ToxQuality_9" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="9" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_9"  /></td>
    <td align="center"><euc:EformTextBox RecordId="9" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_9"/></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10" ParentRecordId="16"  ID="ToxDateText_10" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="10" ParentRecordId="16" Runat="server" ID="ToxDate_10" Table="Toxicities" Field="ToxDate" />                 
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ParentRecordId="16" ID="ToxQuality_10" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="10" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_10"  /></td>
    <td align="center"><euc:EformTextBox RecordId="10" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_10"/></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="11" ParentRecordId="16"  ID="ToxDateText_11" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="11" ParentRecordId="16" Runat="server" ID="ToxDate_11" Table="Toxicities" Field="ToxDate" />                 
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="11" ParentRecordId="16" ID="ToxQuality_11" TABLE="Toxicities" FIELD="ToxQuality" />  
        </td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:150;" Field="ToxName" RecordId="11" ParentRecordId="16" Table="Toxicities" Runat="server" id="ToxName_11"  /></td>
    <td align="center"><euc:EformTextBox RecordId="11" ParentRecordId="16" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_11"/></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
    <td>&nbsp;</td>
  </tr>
</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'SalivaryGlandComplicationsHtmlTable');"><img alt="" src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
</div>

<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo

    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_1.ClientID %>'),$('<%= ToxDate_1.ClientID %>'),$('<%= ToxQuality_1.ClientID %>'),$('<%= ToxName_1.ClientID %>'),$('<%= ToxNotes_1.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_2.ClientID %>'),$('<%= ToxDate_2.ClientID %>'),$('<%= ToxQuality_2.ClientID %>'),$('<%= ToxName_2.ClientID %>'),$('<%= ToxNotes_2.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_3.ClientID %>'),$('<%= ToxDate_3.ClientID %>'),$('<%= ToxQuality_3.ClientID %>'),$('<%= ToxName_3.ClientID %>'),$('<%= ToxNotes_3.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_4.ClientID %>'),$('<%= ToxDate_4.ClientID %>'),$('<%= ToxQuality_4.ClientID %>'),$('<%= ToxName_4.ClientID %>'),$('<%= ToxNotes_4.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_5.ClientID %>'),$('<%= ToxDate_5.ClientID %>'),$('<%= ToxQuality_5.ClientID %>'),$('<%= ToxName_5.ClientID %>'),$('<%= ToxNotes_5.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_6.ClientID %>'),$('<%= ToxDate_6.ClientID %>'),$('<%= ToxQuality_6.ClientID %>'),$('<%= ToxName_6.ClientID %>'),$('<%= ToxNotes_6.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_7.ClientID %>'),$('<%= ToxDate_7.ClientID %>'),$('<%= ToxQuality_7.ClientID %>'),$('<%= ToxName_7.ClientID %>'),$('<%= ToxNotes_7.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_8.ClientID %>'),$('<%= ToxDate_8.ClientID %>'),$('<%= ToxQuality_8.ClientID %>'),$('<%= ToxName_8.ClientID %>'),$('<%= ToxNotes_8.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_9.ClientID %>'),$('<%= ToxDate_9.ClientID %>'),$('<%= ToxQuality_9.ClientID %>'),$('<%= ToxName_9.ClientID %>'),$('<%= ToxNotes_9.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_10.ClientID %>'),$('<%= ToxDate_10.ClientID %>'),$('<%= ToxQuality_10.ClientID %>'),$('<%= ToxName_10.ClientID %>'),$('<%= ToxNotes_10.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ComplicationAbsentDiv.ClientID %>'),$('<%= ToxDateText_11.ClientID %>'),$('<%= ToxDate_11.ClientID %>'),$('<%= ToxQuality_11.ClientID %>'),$('<%= ToxName_11.ClientID %>'),$('<%= ToxNotes_11.ClientID %>'));

    function addAbsentEvent(complicationRecordedID,complicationDivID,complicationAbsentDivID,toxDateTextID,toxDateID,toxQualityID,toxNameID,toxNotesID)
    {  
        $(complicationRecordedID).addEvent('click',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,complicationAbsentDivID,toxDateTextID,toxDateID,toxQualityID,toxNameID,toxNotesID));
        $(toxDateTextID).addEvent('blur',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,complicationAbsentDivID,toxDateTextID,toxDateID,toxQualityID,toxNameID,toxNotesID));
        $(toxNameID).addEvent('blur',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,complicationAbsentDivID,toxDateTextID,toxDateID,toxQualityID,toxNameID,toxNotesID));
        $(toxNotesID).addEvent('blur',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,complicationAbsentDivID,toxDateTextID,toxDateID,toxQualityID,toxNameID,toxNotesID));
      
        // check on load as well
       ComplicationYesNo(complicationRecordedID,complicationDivID,complicationAbsentDivID,toxDateTextID,toxDateID,toxQualityID,toxNameID,toxNotesID);

    }
   
    /* ]]> */
    
   
    function ComplicationYesNo(complicationRecordedID,complicationDivID,complicationAbsentDivID,toxDateTextID,toxDateID,toxQualityID,toxNameID,toxNotesID)
    {
       var complicationRecordedRef = complicationRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < complicationRecordedRef.length; i++) 
        if (complicationRecordedRef[i].checked) {  
            ComplicationRadioClick(complicationRecordedRef[i].value,complicationDivID,complicationAbsentDivID,toxDateTextID,toxDateID,toxQualityID,toxNameID,toxNotesID);
            }
    }
    
   
    function ComplicationRadioClick(Complicationoption_value,ComplicationhideDiv,ComplicationhideAbsentDiv,toxDateTextID,toxDateID,toxQualityID,toxNameID,toxNotesID)
    {
      if (Complicationoption_value == "Yes")
      { 
       ComplicationhideDiv.style.display='block';
       ComplicationhideAbsentDiv.style.display='none';
       
       if (toxDateTextID.value != '' || toxNameID.value != '' || toxNotesID.value != '')
       {       
           toxQualityID.value = 'STD';
       }
       else
       {
            toxQualityID.value = '';
       }
       
      } 
      else if (Complicationoption_value == "No")
      {
       ComplicationhideDiv.style.display='none';
       ComplicationhideAbsentDiv.style.display='none';
       
        toxDateTextID.value = ''
        toxDateID.value = '';
        toxNameID.value = '';
        toxNotesID.value = '';
        toxQualityID.value = '';

      }
    }
</script>

