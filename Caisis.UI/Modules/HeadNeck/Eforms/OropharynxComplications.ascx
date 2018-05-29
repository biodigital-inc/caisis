<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxComplications" CodeFile="OropharynxComplications.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
    tableArray.OropharynxComplicationsHtmlTable = "OropharynxComplicationsHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OropharynxComplications" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Complications"></asp:Label><br/>
<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Previous Complications ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ComplicationRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ComplicationRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="ComplicationAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_6"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="6" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_6"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
    </table>
</div>


<div id="ComplicationDiv" runat="server" style="display: none;"> <!--  -->
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OropharynxComplicationsHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Complication</td>
    <td class="controlBoxDataGridHeaderFirstCol">Related To</td>
    <td class="controlBoxDataGridHeaderFirstCol">Intervention</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    </tr>

  <asp:Repeater ID="ComplicationsRptr" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Toxicities', <%# DataBinder.Eval(Container.DataItem, "ToxicityId") %>, 'ToxDateText,ToxDate,ToxName,ToxRelatedTo,ToxIntervention,ToxQuality','Toxicities');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ToxDateText")%></td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ToxName")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ToxRelatedTo")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ToxIntervention")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ToxNotes")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="ToxDateText_1" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="ToxDate_1" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:140px;" Field="ToxName" RecordId="1" Table="Toxicities" Runat="server" id="ToxName_1"  /></td>
    <td align="center"><euc:EformComboBox LookupCode="RelatedTo" DropDownHeight="auto" style="width:75px;" Field="ToxRelatedTo" RecordId="1" Table="Toxicities" Runat="server" id="ToxRelatedTo_1"  /></td>
    <td align="center"><euc:EformComboBox LookupCode="ToxIntervention" DropDownHeight="auto" style="width:100px;" Field="ToxIntervention" RecordId="1" Table="Toxicities" Runat="server" id="ToxIntervention_1"  /></td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:110px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="ToxDateText_2" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="ToxDate_2" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:140px;" Field="ToxName" RecordId="2" Table="Toxicities" Runat="server" id="ToxName_2"  /></td>
    <td align="center"><euc:EformComboBox LookupCode="RelatedTo" DropDownHeight="auto" style="width:75px;" Field="ToxRelatedTo" RecordId="2" Table="Toxicities" Runat="server" id="ToxRelatedTo_2"  /></td>
    <td align="center"><euc:EformComboBox LookupCode="ToxIntervention" DropDownHeight="auto" style="width:100px;" Field="ToxIntervention" RecordId="2" Table="Toxicities" Runat="server" id="ToxIntervention_2"  /></td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:110px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="ToxDateText_3" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="ToxDate_3" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:140px;" Field="ToxName" RecordId="3" Table="Toxicities" Runat="server" id="ToxName_3"  /></td>
    <td align="center"><euc:EformComboBox LookupCode="RelatedTo" DropDownHeight="auto" style="width:75px;" Field="ToxRelatedTo" RecordId="3" Table="Toxicities" Runat="server" id="ToxRelatedTo_3"  /></td>
    <td align="center"><euc:EformComboBox LookupCode="ToxIntervention" DropDownHeight="auto" style="width:100px;" Field="ToxIntervention" RecordId="3" Table="Toxicities" Runat="server" id="ToxIntervention_3"  /></td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:110px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="ToxDateText_4" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="ToxDate_4" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:140px;" Field="ToxName" RecordId="4" Table="Toxicities" Runat="server" id="ToxName_4"  /></td>
    <td align="center"><euc:EformComboBox LookupCode="RelatedTo" DropDownHeight="auto" style="width:75px;" Field="ToxRelatedTo" RecordId="4" Table="Toxicities" Runat="server" id="ToxRelatedTo_4"  /></td>
    <td align="center"><euc:EformComboBox LookupCode="ToxIntervention" DropDownHeight="auto" style="width:100px;" Field="ToxIntervention" RecordId="4" Table="Toxicities" Runat="server" id="ToxIntervention_4"  /></td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:110px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="ToxDateText_5" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="ToxDate_5" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication,Disease,HeadNeck"    style="width:140px;" Field="ToxName" RecordId="5" Table="Toxicities" Runat="server" id="ToxName_5"  /></td>
    <td align="center"><euc:EformComboBox LookupCode="RelatedTo" DropDownHeight="auto" style="width:75px;" Field="ToxRelatedTo" RecordId="5" Table="Toxicities" Runat="server" id="ToxRelatedTo_5"  /></td>
    <td align="center"><euc:EformComboBox LookupCode="ToxIntervention" DropDownHeight="auto" style="width:100px;" Field="ToxIntervention" RecordId="5" Table="Toxicities" Runat="server" id="ToxIntervention_5"  /></td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:110px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1"/></td>
    </tr>
</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'OropharynxComplicationsHtmlTable');"><img alt="" src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
</div>
<table>
    <tr id="ComplicationsAbsentRow">
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
       
        document.getElementById('<%= AbsentDateText_6.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_6.ClientID %>').value='';
        document.getElementById('<%= TableName_6.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_6.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_6.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_6.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_6.ClientID %>').value = '';
      } 
      else if (Complicationoption_value == "No")
      {
       ComplicationhideDiv.style.display='none';
       ComplicationhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_6.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_6.ClientID %>').value='';
        document.getElementById('<%= TableName_6.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_6.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_6.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_6.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_6.ClientID %>').value = '';
        
        document.getElementById('<%= ToxDateText_1.ClientID %>').value='';
        document.getElementById('<%= ToxDate_1.ClientID %>').value='';
        document.getElementById('<%= ToxName_1.ClientID %>').value='';
        document.getElementById('<%= ToxNotes_1.ClientID %>').value='';
        document.getElementById('<%= ToxRelatedTo_1.ClientID %>').value='';
        document.getElementById('<%= ToxIntervention_1.ClientID %>').value='';
        
        document.getElementById('<%= ToxDateText_2.ClientID %>').value='';
        document.getElementById('<%= ToxDate_2.ClientID %>').value='';
        document.getElementById('<%= ToxName_2.ClientID %>').value='';
        document.getElementById('<%= ToxNotes_2.ClientID %>').value='';
        document.getElementById('<%= ToxRelatedTo_2.ClientID %>').value='';
        document.getElementById('<%= ToxIntervention_2.ClientID %>').value='';

        document.getElementById('<%= ToxDateText_3.ClientID %>').value='';
        document.getElementById('<%= ToxDate_3.ClientID %>').value='';
        document.getElementById('<%= ToxName_3.ClientID %>').value='';
        document.getElementById('<%= ToxNotes_3.ClientID %>').value='';
        document.getElementById('<%= ToxRelatedTo_3.ClientID %>').value='';
        document.getElementById('<%= ToxIntervention_3.ClientID %>').value='';

        document.getElementById('<%= ToxDateText_4.ClientID %>').value='';
        document.getElementById('<%= ToxDate_4.ClientID %>').value='';
        document.getElementById('<%= ToxName_4.ClientID %>').value='';
        document.getElementById('<%= ToxNotes_4.ClientID %>').value='';
        document.getElementById('<%= ToxRelatedTo_4.ClientID %>').value='';
        document.getElementById('<%= ToxIntervention_4.ClientID %>').value='';

        document.getElementById('<%= ToxDateText_5.ClientID %>').value='';
        document.getElementById('<%= ToxDate_5.ClientID %>').value='';
        document.getElementById('<%= ToxName_5.ClientID %>').value='';
        document.getElementById('<%= ToxNotes_5.ClientID %>').value='';
        document.getElementById('<%= ToxRelatedTo_5.ClientID %>').value='';
        document.getElementById('<%= ToxIntervention_5.ClientID %>').value='';
      }
    }
</script>

