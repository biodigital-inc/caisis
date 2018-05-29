<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxMedicalTx3" CodeFile="OropharynxMedicalTx3.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
    tableArray.OropharynxMedicalTx3HtmlTable = "OropharynxMedicalTx3HtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OropharynxMedicalTx3" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medical Therapies"></asp:Label><br/>

<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Medical Therapies ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="MedTxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="MedTxRecorded3">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="MedTxAbsentDiv" runat="server" style="display: none;" >
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_11"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="11" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_11"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table></div>

<div id="MedTxDiv" runat="server" style="display: none;">
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OropharynxMedicalTx3HtmlTable">  
  
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
        <euc:EformTextBox Runat="server" RecordId="11"  ID="MedTxDateText_11" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden  RecordId="11" Runat="server" ID="MedTxDate_11" Table="MedicalTherapy" Field="MedTxDate" /> 
        <euc:EformTextBox RecordId="11" Runat="server" ID="MedTxDisease_11" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="11" Table="MedicalTherapy" Runat="server" id="MedTxAgent_11" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="11" Runat="server" ID="MedTxType_11" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="11" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_11" TabIndex="4"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_11" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="5" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="11" Runat="server" ID="MedTxCycle_11" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="11"  ID="MedTxStopDateText_11" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden RecordId="11" Runat="server" ID="MedTxStopDate_11" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="11" Runat="server" ID="MedTxQuality_11" Table="MedicalTherapy" Field="MedTxQuality" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
   <td style="white-space: nowrap;"style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
    <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="12"  ID="MedTxDateText_12" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="6"/>
        <euc:EformHidden  RecordId="12" Runat="server" ID="MedTxDate_12" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="12" Runat="server" ID="MedTxDisease_12" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="12" Table="MedicalTherapy" Runat="server" id="MedTxAgent_12" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="7"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="12" Runat="server" ID="MedTxType_12" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="8"/></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="12" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_12" TabIndex="9"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_12" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="10"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="12" Runat="server" ID="MedTxCycle_12" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="12"  ID="MedTxStopDateText_12" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden RecordId="12" Runat="server" ID="MedTxStopDate_12" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
     <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="12" Runat="server" ID="MedTxQuality_12" Table="MedicalTherapy" Field="MedTxQuality" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
   <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="13"  ID="MedTxDateText_13" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="11"/>
        <euc:EformHidden  RecordId="13" Runat="server" ID="MedTxDate_13" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="13" Runat="server" ID="MedTxDisease_13" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="13" Table="MedicalTherapy" Runat="server" id="MedTxAgent_13" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="12"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="13" Runat="server" ID="MedTxType_13" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="13"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="13" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_13" TabIndex="14"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_13" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="15"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="13" Runat="server" ID="MedTxCycle_13" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="13"  ID="MedTxStopDateText_13" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden  RecordId="13" Runat="server" ID="MedTxStopDate_13" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
     <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="13" Runat="server" ID="MedTxQuality_13" Table="MedicalTherapy" Field="MedTxQuality" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="14"  ID="MedTxDateText_14" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="16"/>
        <euc:EformHidden  RecordId="14" Runat="server" ID="MedTxDate_14" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="14" Runat="server" ID="MedTxDisease_14" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="14" Table="MedicalTherapy" Runat="server" id="MedTxAgent_14" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="17"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="14" Runat="server" ID="MedTxType_14" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="18"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="14" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_14" TabIndex="19"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_14" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="20"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="14" Runat="server" ID="MedTxCycle_14" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="14"  ID="MedTxStopDateText_14" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden  RecordId="14" Runat="server" ID="MedTxStopDate_14" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
     <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="14" Runat="server" ID="MedTxQuality_14" Table="MedicalTherapy" Field="MedTxQuality" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="15"  ID="MedTxDateText_15" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="21"/>
        <euc:EformHidden  RecordId="15" Runat="server" ID="MedTxDate_15" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="15" Runat="server" ID="MedTxDisease_15" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        </td> 
	<td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="15" Table="MedicalTherapy" Runat="server" id="MedTxAgent_15" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="22"/></td>
	<td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="15" Runat="server" ID="MedTxType_15" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="23"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="15" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_15" TabIndex="24"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_15" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="25"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="15" Runat="server" ID="MedTxCycle_15" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="15"  ID="MedTxStopDateText_15" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden  RecordId="15" Runat="server" ID="MedTxStopDate_15" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
     <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="15" Runat="server" ID="MedTxQuality_15" Table="MedicalTherapy" Field="MedTxQuality" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxMedicalTx3HtmlTable');" />
</div>
<table>
    <tr id="MedTxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="TableName" ID="TableName_11"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="FieldName" ID="FieldName_11"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_11"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_11"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_11"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br/><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo    
    
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_11.ClientID %>'),$('<%= MedTxDose_11.ClientID %>'),$('<%= MedTxUnits_11.ClientID %>'),$('<%= MedTxCycle_11.ClientID %>'),$('<%= MedTxStopDateText_11.ClientID %>'),$('<%= MedTxAgent_11.ClientID %>'),$('<%= MedTxType_11.ClientID %>'),$('<%= MedTxDisease_11.ClientID %>'),$('<%= MedTxQuality_11.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_12.ClientID %>'),$('<%= MedTxDose_12.ClientID %>'),$('<%= MedTxUnits_12.ClientID %>'),$('<%= MedTxCycle_12.ClientID %>'),$('<%= MedTxStopDateText_12.ClientID %>'),$('<%= MedTxAgent_12.ClientID %>'),$('<%= MedTxType_12.ClientID %>'),$('<%= MedTxDisease_12.ClientID %>'),$('<%= MedTxQuality_12.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_13.ClientID %>'),$('<%= MedTxDose_13.ClientID %>'),$('<%= MedTxUnits_13.ClientID %>'),$('<%= MedTxCycle_13.ClientID %>'),$('<%= MedTxStopDateText_13.ClientID %>'),$('<%= MedTxAgent_13.ClientID %>'),$('<%= MedTxType_13.ClientID %>'),$('<%= MedTxDisease_13.ClientID %>'),$('<%= MedTxQuality_13.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_14.ClientID %>'),$('<%= MedTxDose_14.ClientID %>'),$('<%= MedTxUnits_14.ClientID %>'),$('<%= MedTxCycle_14.ClientID %>'),$('<%= MedTxStopDateText_14.ClientID %>'),$('<%= MedTxAgent_14.ClientID %>'),$('<%= MedTxType_14.ClientID %>'),$('<%= MedTxDisease_14.ClientID %>'),$('<%= MedTxQuality_14.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_15.ClientID %>'),$('<%= MedTxDose_15.ClientID %>'),$('<%= MedTxUnits_15.ClientID %>'),$('<%= MedTxCycle_15.ClientID %>'),$('<%= MedTxStopDateText_15.ClientID %>'),$('<%= MedTxAgent_15.ClientID %>'),$('<%= MedTxType_15.ClientID %>'),$('<%= MedTxDisease_15.ClientID %>'),$('<%= MedTxQuality_15.ClientID %>'));

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
       
        document.getElementById('<%= AbsentDateText_11.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_11.ClientID %>').value='';
        document.getElementById('<%= TableName_11.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_11.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_11.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_11.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_11.ClientID %>').value = '';
        
      } 
      else if (MedTxoption_value == "No")
      {
        MedTxhideDiv.style.display='none';
        MedTxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_11.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_11.ClientID %>').value='';
        document.getElementById('<%= TableName_11.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_11.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_11.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_11.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_11.ClientID %>').value = '';
        
        document.getElementById('<%= MedTxDateText_11.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_11.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_11.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_11.ClientID %>').value='';
        document.getElementById('<%= MedTxType_11.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_11.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_11.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_11.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_11.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_11.ClientID %>').value='';

        document.getElementById('<%= MedTxDateText_12.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_12.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_12.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_12.ClientID %>').value='';
        document.getElementById('<%= MedTxType_12.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_12.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_12.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_12.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_12.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_12.ClientID %>').value='';
        
        document.getElementById('<%= MedTxDateText_13.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_13.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_13.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_13.ClientID %>').value='';
        document.getElementById('<%= MedTxType_13.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_13.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_13.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_13.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_13.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_13.ClientID %>').value='';
       
        document.getElementById('<%= MedTxDateText_14.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_14.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_14.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_14.ClientID %>').value='';
        document.getElementById('<%= MedTxType_14.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_14.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_14.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_14.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_14.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_14.ClientID %>').value='';
        
        document.getElementById('<%= MedTxDateText_15.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_15.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_15.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_15.ClientID %>').value='';
        document.getElementById('<%= MedTxType_15.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_15.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_15.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_15.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_15.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_15.ClientID %>').value='';
        }
    }

</script>