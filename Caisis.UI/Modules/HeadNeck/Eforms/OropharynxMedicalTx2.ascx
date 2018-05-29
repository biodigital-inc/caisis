<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxMedicalTx2" CodeFile="OropharynxMedicalTx2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
    tableArray.OropharynxMedicalTx2HtmlTable = "OropharynxMedicalTx2HtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OropharynxMedicalTx2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medical Therapies"></asp:Label><br/>

<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Medical Therapies ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="MedTxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="MedTxRecorded2">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="MedTxAbsentDiv" runat="server" style="display: none;" >
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_4"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="4" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_4"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table></div>

<div id="MedTxDiv" runat="server" style="display: none;" >
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OropharynxMedicalTx2HtmlTable">  
  
  <tr>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Agent</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Dose </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Units </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Cycles </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Stop Date </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Quality </td>
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>        
  </tr>  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxAgent,MedTxType,MedTxDose,MedTxUnits,MedTxCycle,MedTxStopDateText', 'MedicalTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxType") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDose") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxUnits") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxCycle")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxQuality")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>  

  <tr >
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxDateText_6" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden  RecordId="6" Runat="server" ID="MedTxDate_6" Table="MedicalTherapy" Field="MedTxDate" /> 
        <euc:EformTextBox RecordId="6" Runat="server" ID="MedTxDisease_6" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxAgent_6" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="6" Runat="server" ID="MedTxType_6" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="6" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_6" TabIndex="4"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_6" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="5" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="6" Runat="server" ID="MedTxCycle_6" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxStopDateText_6" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden RecordId="6" Runat="server" ID="MedTxStopDate_6" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="6" Runat="server" ID="MedTxQuality_6" Table="MedicalTherapy" Field="MedTxQuality" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
   <td style="white-space: nowrap;"style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
    <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxDateText_7" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="6"/>
        <euc:EformHidden  RecordId="7" Runat="server" ID="MedTxDate_7" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="7" Runat="server" ID="MedTxDisease_7" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxAgent_7" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="7"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="7" Runat="server" ID="MedTxType_7" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="8"/></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="7" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_7" TabIndex="9"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_7" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="10"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="7" Runat="server" ID="MedTxCycle_7" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxStopDateText_7" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden RecordId="7" Runat="server" ID="MedTxStopDate_7" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
     <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="7" Runat="server" ID="MedTxQuality_7" Table="MedicalTherapy" Field="MedTxQuality" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
   <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxDateText_8" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="11"/>
        <euc:EformHidden  RecordId="8" Runat="server" ID="MedTxDate_8" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="8" Runat="server" ID="MedTxDisease_8" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxAgent_8" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="12"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="8" Runat="server" ID="MedTxType_8" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="13"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="8" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_8" TabIndex="14"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_8" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="15"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="8" Runat="server" ID="MedTxCycle_8" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxStopDateText_8" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden  RecordId="8" Runat="server" ID="MedTxStopDate_8" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
     <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="8" Runat="server" ID="MedTxQuality_8" Table="MedicalTherapy" Field="MedTxQuality" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="9"  ID="MedTxDateText_9" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="16"/>
        <euc:EformHidden  RecordId="9" Runat="server" ID="MedTxDate_9" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="9" Runat="server" ID="MedTxDisease_9" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="9" Table="MedicalTherapy" Runat="server" id="MedTxAgent_9" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="17"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="9" Runat="server" ID="MedTxType_9" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="18"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="9" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_9" TabIndex="19"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_9" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="20"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="9" Runat="server" ID="MedTxCycle_9" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="9"  ID="MedTxStopDateText_9" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden  RecordId="9" Runat="server" ID="MedTxStopDate_9" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
     <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="9" Runat="server" ID="MedTxQuality_9" Table="MedicalTherapy" Field="MedTxQuality" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="10"  ID="MedTxDateText_10" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="21"/>
        <euc:EformHidden  RecordId="10" Runat="server" ID="MedTxDate_10" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="10" Runat="server" ID="MedTxDisease_10" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        </td> 
	<td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="10" Table="MedicalTherapy" Runat="server" id="MedTxAgent_10" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="22"/></td>
	<td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="10" Runat="server" ID="MedTxType_10" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="23"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="10" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_10" TabIndex="24"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_10" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="25"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="10" Runat="server" ID="MedTxCycle_10" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="10"  ID="MedTxStopDateText_10" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden  RecordId="10" Runat="server" ID="MedTxStopDate_10" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
     <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="10" Runat="server" ID="MedTxQuality_10" Table="MedicalTherapy" Field="MedTxQuality" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxMedicalTx2HtmlTable');" />
</div>
<table>
    <tr id="MedTxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="TableName" ID="TableName_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldName" ID="FieldName_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_4"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br/><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo    
    
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_6.ClientID %>'),$('<%= MedTxDose_6.ClientID %>'),$('<%= MedTxUnits_6.ClientID %>'),$('<%= MedTxCycle_6.ClientID %>'),$('<%= MedTxStopDateText_6.ClientID %>'),$('<%= MedTxAgent_6.ClientID %>'),$('<%= MedTxType_6.ClientID %>'),$('<%= MedTxDisease_6.ClientID %>'),$('<%= MedTxQuality_6.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_7.ClientID %>'),$('<%= MedTxDose_7.ClientID %>'),$('<%= MedTxUnits_7.ClientID %>'),$('<%= MedTxCycle_7.ClientID %>'),$('<%= MedTxStopDateText_7.ClientID %>'),$('<%= MedTxAgent_7.ClientID %>'),$('<%= MedTxType_7.ClientID %>'),$('<%= MedTxDisease_7.ClientID %>'),$('<%= MedTxQuality_7.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_8.ClientID %>'),$('<%= MedTxDose_8.ClientID %>'),$('<%= MedTxUnits_8.ClientID %>'),$('<%= MedTxCycle_8.ClientID %>'),$('<%= MedTxStopDateText_8.ClientID %>'),$('<%= MedTxAgent_8.ClientID %>'),$('<%= MedTxType_8.ClientID %>'),$('<%= MedTxDisease_8.ClientID %>'),$('<%= MedTxQuality_8.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_9.ClientID %>'),$('<%= MedTxDose_9.ClientID %>'),$('<%= MedTxUnits_9.ClientID %>'),$('<%= MedTxCycle_9.ClientID %>'),$('<%= MedTxStopDateText_9.ClientID %>'),$('<%= MedTxAgent_9.ClientID %>'),$('<%= MedTxType_9.ClientID %>'),$('<%= MedTxDisease_9.ClientID %>'),$('<%= MedTxQuality_9.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_10.ClientID %>'),$('<%= MedTxDose_10.ClientID %>'),$('<%= MedTxUnits_10.ClientID %>'),$('<%= MedTxCycle_10.ClientID %>'),$('<%= MedTxStopDateText_10.ClientID %>'),$('<%= MedTxAgent_10.ClientID %>'),$('<%= MedTxType_10.ClientID %>'),$('<%= MedTxDisease_10.ClientID %>'),$('<%= MedTxQuality_10.ClientID %>'));

    function addAbsentEvent(medTxRecordedID,medTxDivID,medTxAbsentDivID,medTxDateTextID,medTxDoseID,medTxUnitsID,medTxCycleID,medTxStopDateTextID,medTxAgentID,medTxTypeID,medTxDiseaseID,medTxQualityID)
    {  
        $(medTxRecordedID).addEvent('click',curry(MedTxYesNo,medTxRecordedID,medTxDivID,medTxAbsentDivID));

        $(medTxAgentID).addEvent('blur',curry(updateMedTxDetails,medTxDiseaseID,medTxQualityID));
        $(medTxTypeID).addEvent('blur',curry(updateMedTxDetails,medTxDiseaseID,medTxQualityID));
        $(medTxDateTextID).addEvent('blur',curry(updateMedTxDetails,medTxDiseaseID,medTxQualityID));
        $(medTxDoseID).addEvent('blur',curry(updateMedTxDetails,medTxDiseaseID,medTxQualityID));
        $(medTxUnitsID).addEvent('blur',curry(updateMedTxDetails,medTxDiseaseID,medTxQualityID));
        $(medTxCycleID).addEvent('blur',curry(updateMedTxDetails,medTxDiseaseID,medTxQualityID));
        $(medTxStopDateTextID).addEvent('blur',curry(updateMedTxDetails,medTxDiseaseID,medTxQualityID));

        // check on load as well
        MedTxYesNo(medTxRecordedID,medTxDivID,medTxAbsentDivID);
    }
   
    /* ]]> */
 
    function  updateMedTxDetails(diseaseId, qltyId)
	{
	    diseaseId.value = 'Oropharyngeal';
//	    qltyId.value='STD';
	}
   
    function MedTxYesNo(medTxRecordedID,medTxDivID,medTxAbsentDivID)
    {
       var medTxRecordedRef = medTxRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < medTxRecordedRef.length; i++) 
        if (medTxRecordedRef[i].checked) {  
            MedTxRadioClick(medTxRecordedRef[i].value,medTxDivID,medTxAbsentDivID);
            }
    }
    
    function MedTxRadioClick(MedTxoption_value,MedTxhideDiv,MedTxhideAbsentDiv)
    {
      if (MedTxoption_value == "Yes")
      { 
        MedTxhideDiv.style.display='block';
        MedTxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_4.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_4.ClientID %>').value='';
        document.getElementById('<%= TableName_4.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_4.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_4.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_4.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_4.ClientID %>').value = '';
        
      } 
      else if (MedTxoption_value == "No")
      {
        MedTxhideDiv.style.display='none';
        MedTxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_4.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_4.ClientID %>').value='';
        document.getElementById('<%= TableName_4.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_4.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_4.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_4.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_4.ClientID %>').value = '';
        
        document.getElementById('<%= MedTxDateText_6.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_6.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_6.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_6.ClientID %>').value='';
        document.getElementById('<%= MedTxType_6.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_6.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_6.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_6.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_6.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_6.ClientID %>').value='';

        document.getElementById('<%= MedTxDateText_7.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_7.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_7.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_7.ClientID %>').value='';
        document.getElementById('<%= MedTxType_7.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_7.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_7.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_7.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_7.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_7.ClientID %>').value='';
        
        document.getElementById('<%= MedTxDateText_8.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_8.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_8.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_8.ClientID %>').value='';
        document.getElementById('<%= MedTxType_8.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_8.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_8.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_8.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_8.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_8.ClientID %>').value='';
       
        document.getElementById('<%= MedTxDateText_9.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_9.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_9.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_9.ClientID %>').value='';
        document.getElementById('<%= MedTxType_9.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_9.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_9.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_9.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_9.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_9.ClientID %>').value='';
        
        document.getElementById('<%= MedTxDateText_10.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_10.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_10.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_10.ClientID %>').value='';
        document.getElementById('<%= MedTxType_10.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_10.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_10.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_10.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_10.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_10.ClientID %>').value='';
        }
    }

</script>