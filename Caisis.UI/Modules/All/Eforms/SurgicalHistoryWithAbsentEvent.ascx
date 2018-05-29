<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.SurgicalHistoryWithAbsentEvent" CodeFile="SurgicalHistoryWithAbsentEvent.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.ProceduresHtmlTable = "ProceduresHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SurgicalHistoryWithAbsentEvent" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle">Surgical History ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="SurgicalHxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="SurgicalHxRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="SurgicalHxAbsentDiv" runat="server" style="display: none;" >
<br/><br />
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_2"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="2" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_2"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table>
<br/><br/>
</div>
                 
<div id="SurgicalHxDiv" runat="server" style="display: none;">
<br/><br/>
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SurgeriesHtmlTable">
  <tr> 
    <td width="18%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Surgery Type </td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="rptSurgicalHistory" Runat="server"  OnItemDataBound="ChronListItemDataBound"> 
	<ItemTemplate> 
		<tr id="SurgicalHistoryRow" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<asp:Literal ID="ChronListDateField" Runat="server" /></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "varName") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "varValue") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr id="NoSurgicalHistoryMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No prior surgical procedures have been recorded for this patient.</td>
  </tr> 
  
  
</table>
<br/>



<a name="SurgicalHistory" /><span class="controlBoxTitle" style="font-size: 11px;">Add Procedure</span><br/>
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresHtmlTable">
  <tr> 
    <td width="18%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Procedure Type </td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>

<tr> 
    <td height="18" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox  Runat="server"   RecordId="1"  ID="ProcDateText_1" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		                                                     <euc:EformHidden   Runat="server"   RecordId="1"  ID="ProcDate_1"     Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">
                                      &nbsp;<euc:EformComboBox DropDownWidth="auto" Runat="server"   RecordId="1"  ID="ProcName_1"     Table="Procedures" Field="ProcName"    LookupCode="ProcName,ProcedureType,SurgicalHistory" RefBy="ProcName" style="width:150;"  MaxLength="50"    />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  Runat="server"   RecordId="1"  ID="ProcNotes_1"    TABLE="Procedures" FIELD="ProcNotes"   ShowCalendar="False" CalcDate="False" style="width:190px;"  /></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr> 
    <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="2"  ID="ProcDateText_2" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="2" Runat="server"   ID="ProcDate_2" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName,ProcedureType,SurgicalHistory" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="2" Table="Procedures" MaxLength="50"  Runat="server"   id="ProcName_2"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="2" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_2"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="3"  ID="ProcDateText_3" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="3" Runat="server"   ID="ProcDate_3" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox  DropDownWidth="auto"  LookupCode="ProcName,ProcedureType,SurgicalHistory" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="3" Table="Procedures" MaxLength="50"  Runat="server"   id="ProcName_3"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="3" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_3"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="4"  ID="ProcDateText_4" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="4" Runat="server"   ID="ProcDate_4" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName,ProcedureType,SurgicalHistory" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="4" Table="Procedures" MaxLength="50"  Runat="server"   id="ProcName_4"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="4" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_4"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="5"  ID="ProcDateText_5" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="5" Runat="server"   ID="ProcDate_5" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName,ProcedureType,SurgicalHistory" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="5" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_5"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="5" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_5"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="6"  ID="ProcDateText_6" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="6" Runat="server"   ID="ProcDate_6" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName,ProcedureType,SurgicalHistory" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="6" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_6"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="6" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_6"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="7"  ID="ProcDateText_7" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="7" Runat="server"   ID="ProcDate_7" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox  DropDownWidth="auto"  LookupCode="ProcName,ProcedureType,SurgicalHistory" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="7" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_7"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="7" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_7"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="8"  ID="ProcDateText_8" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="8" Runat="server"   ID="ProcDate_8" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName,ProcedureType,SurgicalHistory" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="8" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_8"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="8" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_8"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="9"  ID="ProcDateText_9" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="9" Runat="server"   ID="ProcDate_9" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName,ProcedureType,SurgicalHistory" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="9" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_9"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="9" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_9"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="10"  ID="ProcDateText_10" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="10" Runat="server"   ID="ProcDate_10" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName,ProcedureType,SurgicalHistory" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="10" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_10"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="10" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_10"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProceduresHtmlTable');"><img alt="" src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"/></a>
<br/><br/><br/>
</div>
<table>
    <tr id="SurgicalHxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="TableName" ID="TableName_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldName" ID="FieldName_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_2"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= SurgicalHxRecorded.ClientID %>'),$('<%= SurgicalHxDiv.ClientID %>'),$('<%= SurgicalHxAbsentDiv.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_1.ClientID %>'),$('<%= ProcNotes_1.ClientID %>'));
    addAbsentEvent($('<%= SurgicalHxRecorded.ClientID %>'),$('<%= SurgicalHxDiv.ClientID %>'),$('<%= SurgicalHxAbsentDiv.ClientID %>'),$('<%= ProcDateText_2.ClientID %>'),$('<%= ProcDate_2.ClientID %>'),$('<%= ProcName_2.ClientID %>'),$('<%= ProcNotes_2.ClientID %>'));
    addAbsentEvent($('<%= SurgicalHxRecorded.ClientID %>'),$('<%= SurgicalHxDiv.ClientID %>'),$('<%= SurgicalHxAbsentDiv.ClientID %>'),$('<%= ProcDateText_3.ClientID %>'),$('<%= ProcDate_3.ClientID %>'),$('<%= ProcName_3.ClientID %>'),$('<%= ProcNotes_3.ClientID %>'));
    addAbsentEvent($('<%= SurgicalHxRecorded.ClientID %>'),$('<%= SurgicalHxDiv.ClientID %>'),$('<%= SurgicalHxAbsentDiv.ClientID %>'),$('<%= ProcDateText_4.ClientID %>'),$('<%= ProcDate_4.ClientID %>'),$('<%= ProcName_4.ClientID %>'),$('<%= ProcNotes_4.ClientID %>'));
    addAbsentEvent($('<%= SurgicalHxRecorded.ClientID %>'),$('<%= SurgicalHxDiv.ClientID %>'),$('<%= SurgicalHxAbsentDiv.ClientID %>'),$('<%= ProcDateText_5.ClientID %>'),$('<%= ProcDate_5.ClientID %>'),$('<%= ProcName_5.ClientID %>'),$('<%= ProcNotes_5.ClientID %>'));
    addAbsentEvent($('<%= SurgicalHxRecorded.ClientID %>'),$('<%= SurgicalHxDiv.ClientID %>'),$('<%= SurgicalHxAbsentDiv.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_6.ClientID %>'),$('<%= ProcNotes_6.ClientID %>'));
    addAbsentEvent($('<%= SurgicalHxRecorded.ClientID %>'),$('<%= SurgicalHxDiv.ClientID %>'),$('<%= SurgicalHxAbsentDiv.ClientID %>'),$('<%= ProcDateText_7.ClientID %>'),$('<%= ProcDate_7.ClientID %>'),$('<%= ProcName_7.ClientID %>'),$('<%= ProcNotes_7.ClientID %>'));
    addAbsentEvent($('<%= SurgicalHxRecorded.ClientID %>'),$('<%= SurgicalHxDiv.ClientID %>'),$('<%= SurgicalHxAbsentDiv.ClientID %>'),$('<%= ProcDateText_8.ClientID %>'),$('<%= ProcDate_8.ClientID %>'),$('<%= ProcName_8.ClientID %>'),$('<%= ProcNotes_8.ClientID %>'));
    addAbsentEvent($('<%= SurgicalHxRecorded.ClientID %>'),$('<%= SurgicalHxDiv.ClientID %>'),$('<%= SurgicalHxAbsentDiv.ClientID %>'),$('<%= ProcDateText_9.ClientID %>'),$('<%= ProcDate_9.ClientID %>'),$('<%= ProcName_9.ClientID %>'),$('<%= ProcNotes_9.ClientID %>'));
    addAbsentEvent($('<%= SurgicalHxRecorded.ClientID %>'),$('<%= SurgicalHxDiv.ClientID %>'),$('<%= SurgicalHxAbsentDiv.ClientID %>'),$('<%= ProcDateText_10.ClientID %>'),$('<%= ProcDate_10.ClientID %>'),$('<%= ProcName_10.ClientID %>'),$('<%= ProcNotes_10.ClientID %>'));

    function addAbsentEvent(surgicalHxRecordedID,surgicalHxDivID,surgicalHxAbsentDivID,procDateTextID,procDateID,procNameID,procNotesID)
    {  
        $(surgicalHxRecordedID).addEvent('click',curry(SurgicalHxYesNo,surgicalHxRecordedID,surgicalHxDivID,surgicalHxAbsentDivID,procDateTextID,procDateID,procNameID,procNotesID));
        $(procDateTextID).addEvent('blur',curry(SurgicalHxYesNo,surgicalHxRecordedID,surgicalHxDivID,surgicalHxAbsentDivID,procDateTextID,procDateID,procNameID,procNotesID));
        $(procNameID).addEvent('blur',curry(SurgicalHxYesNo,surgicalHxRecordedID,surgicalHxDivID,surgicalHxAbsentDivID,procDateTextID,procDateID,procNameID,procNotesID));
        $(procNotesID).addEvent('blur',curry(SurgicalHxYesNo,surgicalHxRecordedID,surgicalHxDivID,surgicalHxAbsentDivID,procDateTextID,procDateID,procNameID,procNotesID));

        // check on load as well
        SurgicalHxYesNo(surgicalHxRecordedID,surgicalHxDivID,surgicalHxAbsentDivID,procDateTextID,procDateID,procNameID,procNotesID);
    }
   
    /* ]]> */
   
    function SurgicalHxYesNo(surgicalHxRecordedID,surgicalHxDivID,surgicalHxAbsentDivID,procDateTextID,procDateID,procNameID,procNotesID)
    {
       var surgicalHxRecordedRef = surgicalHxRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < surgicalHxRecordedRef.length; i++) 
        if (surgicalHxRecordedRef[i].checked) {  
            SurgicalHxRadioClick(surgicalHxRecordedRef[i].value,surgicalHxDivID,surgicalHxAbsentDivID,procDateTextID,procDateID,procNameID,procNotesID);
            }
    }
    
    function SurgicalHxRadioClick(SurgicalHxoption_value,SurgicalHxhideDiv,SurgicalHxhideAbsentDiv,procDateTextID,procDateID,procNameID,procNotesID)
    {
      if (SurgicalHxoption_value == "Yes")
      { 
        SurgicalHxhideDiv.style.display='block';
        SurgicalHxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_2.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_2.ClientID %>').value='';
        document.getElementById('<%= TableName_2.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_2.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_2.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_2.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_2.ClientID %>').value = '';
        
      } 
      else if (SurgicalHxoption_value == "No" || SurgicalHxoption_value == "Unknown")
      {
        SurgicalHxhideAbsentDiv.style.display='block';
        SurgicalHxhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_2.ClientID %>').value = 'Procedures';        
        document.getElementById('<%= FieldName_2.ClientID %>').value = 'ProcName';        
        document.getElementById('<%= FieldValue_2.ClientID %>').value = 'Surgical History'; 
        
        if (SurgicalHxoption_value == "No")       
            document.getElementById('<%= AbsentReason_2.ClientID %>').value = 'None Recorded';        
        if (SurgicalHxoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_2.ClientID %>').value = 'Unknown';        

        document.getElementById('<%= AbsentQuality_2.ClientID %>').value = 'OUT';        

        procDateTextID.value = '';
        procDateID.value = '';
        procNameID.value = '';
        procNotesID.value = '';   
     }
    }

</script>
