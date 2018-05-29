<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandComplicationsSurgical" CodeFile="SalivaryGlandComplicationsSurgical.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SalivaryGlandComplicationsSurgical" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Complications"></asp:Label><br/>
<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTable">
    <tr>
        <td>
            <span class="controlBoxTitle">Surgical Complications ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ComplicationRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ComplicationRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>
<br /><br />
<div id="ComplicationDiv" runat="server" style="display: none;">
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SalivaryGlandComplicationsSurgicalHtmlTable">
  <tr> 
    <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="35%" class="controlBoxDataGridHeaderFirstCol" colspan="3">Surgical Complications</td>
   </tr>
  
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" >
        <euc:EformTextBox Width="80px"  Runat="server" RecordId="18" ID="OpDateText_18" TABLE="OperatingRoomDetails" FIELD="OpDateText" ShowCalendar="true" CalcDate="true" />  		    
        <euc:EformHidden Runat="server" RecordId="18" ID="OpDate_18" TABLE="OperatingRoomDetails" FIELD="OpDate" />    
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="18" ID="OpQuality_18" TABLE="OperatingRoomDetails" FIELD="OpQuality" /> 
        </td> 
    <td style="white-space:nowrap;">
        <input type="checkbox" id="ToxName_1" value="Facial Nerve Paresis"    runat="server"   /> Facial Nerve Paresis
        <euc:EformTextBox Width="1px" ID="ToxName_1_Text" runat="server" RecordId="1" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>                   
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="1" ParentRecordId="18"  ID="ToxDateText_1" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="1" ParentRecordId="18"  ID="ToxDate_1" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="1" ParentRecordId="18" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_1"/></td>
    <td style="white-space:nowrap;">
        <input type="checkbox" id="ToxName_2" value="Facial Nerve Paralysis"    runat="server"   /> Facial Nerve Paralysis
        <euc:EformTextBox Width="1px" ID="ToxName_2_Text" runat="server" RecordId="2" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" ParentRecordId="18"  ID="ToxDateText_2" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="2" ParentRecordId="18"  ID="ToxDate_2" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" ParentRecordId="18" ID="ToxQuality_2" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" /></td>
    <td style="white-space:nowrap;">
        <input type="checkbox" id="ToxName_3" value="Hematoma"    runat="server"   /> Hematoma
        <euc:EformTextBox Width="1px" ID="ToxName_3_Text" runat="server" RecordId="3" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" ParentRecordId="18"  ID="ToxDateText_3" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="3" ParentRecordId="18"  ID="ToxDate_3" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" ParentRecordId="18" ID="ToxQuality_3" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" /></td>
 </tr>
 <tr>
    <td height="28" class="ClinicalEformGridColumnOne"></td> 
    <td style="white-space:nowrap;">
        <input type="checkbox" id="ToxName_4" value="Clogging of Tube Drains"    runat="server"   /> Clogging of Tube Drains
        <euc:EformTextBox Width="1px" ID="ToxName_4_Text" runat="server" RecordId="4" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="18"  ID="ToxDateText_4" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="4" ParentRecordId="18"  ID="ToxDate_4" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="18" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_4"/></td>
    <td style="white-space:nowrap;">
        <input type="checkbox" id="ToxName_5" value="Lymphedema"    runat="server"   /> Lymphedema
        <euc:EformTextBox Width="1px" ID="ToxName_5_Text" runat="server" RecordId="5" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" ParentRecordId="18"  ID="ToxDateText_5" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="5" ParentRecordId="18"  ID="ToxDate_5" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" ParentRecordId="18" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_5"/></td>
    <td style="white-space:nowrap;">
        <input type="checkbox" id="ToxName_6" value="Cerebral Edema"    runat="server"   /> Cerebral Edema
        <euc:EformTextBox Width="1px" ID="ToxName_6_Text" runat="server" RecordId="6" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" ParentRecordId="18"  ID="ToxDateText_6" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="6" ParentRecordId="18"  ID="ToxDate_6" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" ParentRecordId="18" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_6"/></td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"></td> 
    <td style="white-space:nowrap;">
        <input type="checkbox" id="ToxName_7" value="Chyle Leak"    runat="server"   /> Chyle Leak
        <euc:EformTextBox Width="1px" ID="ToxName_7_Text" runat="server" RecordId="7" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" ParentRecordId="18"  ID="ToxDateText_7" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="7" ParentRecordId="18"  ID="ToxDate_7" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" ParentRecordId="18" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_7"/></td>
    <td style="white-space:nowrap;">
        <input type="checkbox" id="ToxName_8" value="Pharyngo-Cutaneous Fistula"    runat="server"   /> Pharyngo-Cutaneous Fistula
        <euc:EformTextBox Width="1px" ID="ToxName_8_Text" runat="server" RecordId="8" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" ParentRecordId="18"  ID="ToxDateText_8" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="8" ParentRecordId="18"  ID="ToxDate_8" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" ParentRecordId="18" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_8"/></td>
    <td style="white-space:nowrap;">
        <input type="checkbox" id="ToxName_9" value="Carotid Rupture"    runat="server"   /> Carotid Rupture
        <euc:EformTextBox Width="1px" ID="ToxName_9_Text" runat="server" RecordId="9" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="9" ParentRecordId="18"  ID="ToxDateText_9" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="9" ParentRecordId="18"  ID="ToxDate_9" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="9" ParentRecordId="18" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_9"/></td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"></td> 
    <td style="white-space:nowrap;">
        <input type="checkbox" id="ToxName_10" value="Wound Infection"    runat="server"   /> Wound Infection
        <euc:EformTextBox Width="1px" ID="ToxName_10_Text" runat="server" RecordId="10" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="10" ParentRecordId="18"  ID="ToxDateText_10" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="10" ParentRecordId="18"  ID="ToxDate_10" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="10" ParentRecordId="18" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_10"/></td>
    <td style="white-space:nowrap;" colspan="2">
        <strong>Other: </strong>
        <input type="text" id="ToxName_11" runat="server"   /> 
        <euc:EformTextBox Width="1px" ID="ToxName_11_Text" runat="server" RecordId="11" ParentRecordId="18"  TABLE="Toxicities" FIELD="ToxName"/>             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="11" ParentRecordId="18"  ID="ToxDateText_11" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" />
        <euc:EformTextBox Width="1px"  style="display: none;"  RecordId="11" ParentRecordId="18"  ID="ToxDate_11" Table="Toxicities" Field="ToxDate" Runat="server" />             
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="11" ParentRecordId="18" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_11"/></td>
  </tr>

</table>
</div>
<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo

    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_1.ClientID %>'),$('<%= ToxDate_1.ClientID %>'),$('<%= ToxName_1.ClientID %>'),$('<%= ToxName_1_Text.ClientID %>'),$('<%= ToxQuality_1.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_2.ClientID %>'),$('<%= ToxDate_2.ClientID %>'),$('<%= ToxName_2.ClientID %>'),$('<%= ToxName_2_Text.ClientID %>'),$('<%= ToxQuality_2.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_3.ClientID %>'),$('<%= ToxDate_3.ClientID %>'),$('<%= ToxName_3.ClientID %>'),$('<%= ToxName_3_Text.ClientID %>'),$('<%= ToxQuality_3.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_4.ClientID %>'),$('<%= ToxDate_4.ClientID %>'),$('<%= ToxName_4.ClientID %>'),$('<%= ToxName_4_Text.ClientID %>'),$('<%= ToxQuality_4.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_5.ClientID %>'),$('<%= ToxDate_5.ClientID %>'),$('<%= ToxName_5.ClientID %>'),$('<%= ToxName_5_Text.ClientID %>'),$('<%= ToxQuality_5.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_6.ClientID %>'),$('<%= ToxDate_6.ClientID %>'),$('<%= ToxName_6.ClientID %>'),$('<%= ToxName_6_Text.ClientID %>'),$('<%= ToxQuality_6.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_7.ClientID %>'),$('<%= ToxDate_7.ClientID %>'),$('<%= ToxName_7.ClientID %>'),$('<%= ToxName_7_Text.ClientID %>'),$('<%= ToxQuality_7.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_8.ClientID %>'),$('<%= ToxDate_8.ClientID %>'),$('<%= ToxName_8.ClientID %>'),$('<%= ToxName_8_Text.ClientID %>'),$('<%= ToxQuality_8.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_9.ClientID %>'),$('<%= ToxDate_9.ClientID %>'),$('<%= ToxName_9.ClientID %>'),$('<%= ToxName_9_Text.ClientID %>'),$('<%= ToxQuality_9.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_10.ClientID %>'),$('<%= ToxDate_10.ClientID %>'),$('<%= ToxName_10.ClientID %>'),$('<%= ToxName_10_Text.ClientID %>'),$('<%= ToxQuality_10.ClientID %>'));
    addAbsentEvent($('<%= ComplicationRecorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= OpDateText_18.ClientID %>'),$('<%= OpDate_18.ClientID %>'),$('<%= OpQuality_18.ClientID %>'),$('<%= ToxDateText_11.ClientID %>'),$('<%= ToxDate_11.ClientID %>'),$('<%= ToxName_11.ClientID %>'),$('<%= ToxName_11_Text.ClientID %>'),$('<%= ToxQuality_11.ClientID %>'));

    function addAbsentEvent(complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden)
    {  
        $(complicationRecordedID).addEvent('click',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden));
        $(opDateText).addEvent('click',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden));
 
         if (toxNameCB.type == 'checkbox')
            $(toxNameCB).addEvent('click',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden));
        else if (toxNameCB.type = 'text')
            $(toxNameCB).addEvent('blur',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden));

       
        // check on load as well
       ShowOnLoad(complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden);

    }
   
    /* ]]> */

    function ShowOnLoad(complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden)
    {    
        if (toxNameCB.type == 'checkbox')  
        {
          // for onload, to re-check a value that what already saved
          if (toxNameCB.value == toxNameTextHidden.value && toxNameTextHidden.value != '')
            toxNameCB.checked = true;
        }
        else if (toxNameCB.type == 'text')
        {
           // for onload, to re-check a value that what already saved
          if (toxNameTextHidden.value != '' && toxNameTextHidden.value != 'Facial Nerve Paresis' && toxNameTextHidden.value != 'Facial Nerve Paralysis' && toxNameTextHidden.value != 'Hematoma/Clogging of Tube Drains' && toxNameTextHidden.value != 'Lymphedema' && toxNameTextHidden.value != 'Cerebral Edema' && toxNameTextHidden.value != 'Chyle Leak' && toxNameTextHidden.value != 'Pharyngo-Cutaneous Fistula' && toxNameTextHidden.value != 'Carotid Rupture' && toxNameTextHidden.value != 'Wound Infection' )
            toxNameCB.value = toxNameTextHidden.value;
        }
        
        ComplicationYesNo(complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden);
    }
   
    function ComplicationYesNo(complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden)
    {
       var complicationRecordedRef = complicationRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < complicationRecordedRef.length; i++) 
        if (complicationRecordedRef[i].checked) {  
            ComplicationRadioClick(complicationRecordedRef[i].value,complicationDivID,complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden);
            }
    }
    
   
    function ComplicationRadioClick(Complicationoption_value,ComplicationhideDiv,complicationRecordedID,complicationDivID,opDateText,opDate,opQualityHidden,toxDateTextHidden,toxDateHidden,toxNameCB,toxNameTextHidden,toxNameQualityHidden)
    {
      if (Complicationoption_value == "Yes")
      { 
       ComplicationhideDiv.style.display='block';
      } 
      else if (Complicationoption_value == "No")
      {
        ComplicationhideDiv.style.display='none';
        
        opDateText.value = '';
        opDate.value = '';
        
        if (toxNameCB.type == 'checkbox')
            toxNameCB.checked = false;
        else if (toxNameCB.type == 'text')
            toxNameCB.value = '';
      }
      
        
      if (toxNameCB.type == 'checkbox')  
      {           
          if (opDateText.value != '' || toxNameCB.checked)
          {
            toxDateTextHidden.value = opDate.value;
            toxDateHidden.value = opDate.value;
            toxNameTextHidden.value = toxNameCB.value;
            toxNameQualityHidden.value = 'STD';
            opQualityHidden.value = 'STD';
          }
          else
          {
            toxDateTextHidden.value = '';
            toxDateHidden.value = '';
            toxNameTextHidden.value = '';
            toxNameQualityHidden.value = '';
            opQualityHidden.value = '';          
          }
      }
      else if (toxNameCB.type == 'text')
      {
          if (opDateText.value != '' || toxNameCB.value != '')
          {
            toxDateTextHidden.value = opDate.value;
            toxDateHidden.value = opDate.value;
            toxNameTextHidden.value = toxNameCB.value;
            toxNameQualityHidden.value = 'STD';
            opQualityHidden.value = 'STD';
          }
          else
          {
            toxDateTextHidden.value = '';
            toxDateHidden.value = '';
            toxNameTextHidden.value = '';
            toxNameQualityHidden.value = '';
            opQualityHidden.value = '';          
          }
      }
      
    }
</script>

