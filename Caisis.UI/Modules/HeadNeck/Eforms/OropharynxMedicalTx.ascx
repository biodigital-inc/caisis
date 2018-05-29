<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxMedicalTx" CodeFile="OropharynxMedicalTx.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
    tableArray.OropharynxMedicalTxHtmlTable = "OropharynxMedicalTxHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OropharynxMedicalTx" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medical Therapies"></asp:Label><br/>

<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Previous Medical Therapies ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="MedTxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="MedTxRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="MedTxAbsentDiv" runat="server" style="display: none;" >
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table></div>
            
<div id="MedTxDiv" runat="server" style="display: none;">
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OropharynxMedicalTxHtmlTable">  
  
  <tr>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Start Date</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Agent</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Dose </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Units </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Cycles </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Stop Date </td>
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
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>  

  <tr >
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxDateText_1" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="1" Runat="server" ID="MedTxDate_1" Table="MedicalTherapy" Field="MedTxDate" /> 
        <euc:EformTextBox RecordId="1" Runat="server" ID="MedTxDisease_1" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox RecordId="1" Runat="server" ID="MedTxQuality_1" Table="MedicalTherapy" Field="MedTxQuality" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxAgent_1" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="1" Runat="server" ID="MedTxType_1" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="1" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_1" TabIndex="4"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_1" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="5" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="1" Runat="server" ID="MedTxCycle_1" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxStopDateText_1" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="1" Runat="server" ID="MedTxStopDate_1" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
    <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxDateText_2" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="6"/>
        <euc:EformHidden Enabled="false" RecordId="2" Runat="server" ID="MedTxDate_2" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="2" Runat="server" ID="MedTxDisease_2" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox RecordId="2" Runat="server" ID="MedTxQuality_2" Table="MedicalTherapy" Field="MedTxQuality" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxAgent_2" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="7"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="2" Runat="server" ID="MedTxType_2" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="8"/></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="2" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_2" TabIndex="9"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_2" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="10"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="2" Runat="server" ID="MedTxCycle_2" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxStopDateText_2" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="2" Runat="server" ID="MedTxStopDate_2" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxDateText_3" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="11"/>
        <euc:EformHidden Enabled="false" RecordId="3" Runat="server" ID="MedTxDate_3" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="3" Runat="server" ID="MedTxDisease_3" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox RecordId="3" Runat="server" ID="MedTxQuality_3" Table="MedicalTherapy" Field="MedTxQuality" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxAgent_3" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="12"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="3" Runat="server" ID="MedTxType_3" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="13"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="3" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_3" TabIndex="14"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_3" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="15"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="3" Runat="server" ID="MedTxCycle_3" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxStopDateText_3" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="3" Runat="server" ID="MedTxStopDate_3" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxDateText_4" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="16"/>
        <euc:EformHidden Enabled="false" RecordId="4" Runat="server" ID="MedTxDate_4" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="4" Runat="server" ID="MedTxDisease_4" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox RecordId="4" Runat="server" ID="MedTxQuality_4" Table="MedicalTherapy" Field="MedTxQuality" Width="1px" style="display:none;" />
        </td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxAgent_4" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="17"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="4" Runat="server" ID="MedTxType_4" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="18"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="4" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_4" TabIndex="19"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_4" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="20"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="4" Runat="server" ID="MedTxCycle_4" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxStopDateText_4" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="4" Runat="server" ID="MedTxStopDate_4" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;"height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxDateText_5" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="21"/>
        <euc:EformHidden Enabled="false" RecordId="5" Runat="server" ID="MedTxDate_5" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="5" Runat="server" ID="MedTxDisease_5" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox RecordId="5" Runat="server" ID="MedTxQuality_5" Table="MedicalTherapy" Field="MedTxQuality" Width="1px" style="display:none;" />
        </td> 
	<td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxAgent_5" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="22"/></td>
	<td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="5" Runat="server" ID="MedTxType_5" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="23"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="5" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_5" TabIndex="24"/></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_5" LookupCode="MedUnits" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="25"/></td>
    <td style="white-space: nowrap;"align="center"><euc:EformTextBox RecordId="5" Runat="server" ID="MedTxCycle_5" Table="MedicalTherapy" Field="MedTxCycle" Width="100px" TabIndex="3" /></td>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxStopDateText_5" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="5" Runat="server" ID="MedTxStopDate_5" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxMedicalTxHtmlTable');" />
</div>
<table>
    <tr id="MedTxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="TableName" ID="TableName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldName" ID="FieldName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_1"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br/><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_1.ClientID %>'),$('<%= MedTxDose_1.ClientID %>'),$('<%= MedTxUnits_1.ClientID %>'),$('<%= MedTxCycle_1.ClientID %>'),$('<%= MedTxStopDateText_1.ClientID %>'),$('<%= MedTxAgent_1.ClientID %>'),$('<%= MedTxType_1.ClientID %>'),$('<%= MedTxDisease_1.ClientID %>'),$('<%= MedTxQuality_1.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_2.ClientID %>'),$('<%= MedTxDose_2.ClientID %>'),$('<%= MedTxUnits_2.ClientID %>'),$('<%= MedTxCycle_2.ClientID %>'),$('<%= MedTxStopDateText_2.ClientID %>'),$('<%= MedTxAgent_2.ClientID %>'),$('<%= MedTxType_2.ClientID %>'),$('<%= MedTxDisease_2.ClientID %>'),$('<%= MedTxQuality_2.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_3.ClientID %>'),$('<%= MedTxDose_3.ClientID %>'),$('<%= MedTxUnits_3.ClientID %>'),$('<%= MedTxCycle_3.ClientID %>'),$('<%= MedTxStopDateText_3.ClientID %>'),$('<%= MedTxAgent_3.ClientID %>'),$('<%= MedTxType_3.ClientID %>'),$('<%= MedTxDisease_3.ClientID %>'),$('<%= MedTxQuality_3.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_4.ClientID %>'),$('<%= MedTxDose_4.ClientID %>'),$('<%= MedTxUnits_4.ClientID %>'),$('<%= MedTxCycle_4.ClientID %>'),$('<%= MedTxStopDateText_4.ClientID %>'),$('<%= MedTxAgent_4.ClientID %>'),$('<%= MedTxType_4.ClientID %>'),$('<%= MedTxDisease_4.ClientID %>'),$('<%= MedTxQuality_4.ClientID %>'));
    addAbsentEvent($('<%= MedTxRecorded.ClientID %>'),$('<%= MedTxDiv.ClientID %>'),$('<%= MedTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_5.ClientID %>'),$('<%= MedTxDose_5.ClientID %>'),$('<%= MedTxUnits_5.ClientID %>'),$('<%= MedTxCycle_5.ClientID %>'),$('<%= MedTxStopDateText_5.ClientID %>'),$('<%= MedTxAgent_5.ClientID %>'),$('<%= MedTxType_5.ClientID %>'),$('<%= MedTxDisease_5.ClientID %>'),$('<%= MedTxQuality_5.ClientID %>'));

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
	    qltyId.value='OUT';
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
       
        document.getElementById('<%= AbsentDateText_1.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_1.ClientID %>').value='';
        document.getElementById('<%= TableName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_1.ClientID %>').value = '';
        
      } 
      else if (MedTxoption_value == "No")
      {
        MedTxhideDiv.style.display='none';
        MedTxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_1.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_1.ClientID %>').value='';
        document.getElementById('<%= TableName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_1.ClientID %>').value = '';

        document.getElementById('<%= MedTxDateText_1.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_1.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_1.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_1.ClientID %>').value='';
        document.getElementById('<%= MedTxType_1.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_1.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_1.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_1.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_1.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_1.ClientID %>').value='';
        
        document.getElementById('<%= MedTxDateText_2.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_2.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_2.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_2.ClientID %>').value='';
        document.getElementById('<%= MedTxType_2.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_2.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_2.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_2.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_2.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_2.ClientID %>').value='';
        
        document.getElementById('<%= MedTxDateText_3.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_3.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_3.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_3.ClientID %>').value='';
        document.getElementById('<%= MedTxType_3.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_3.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_3.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_3.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_3.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_3.ClientID %>').value='';
        
        document.getElementById('<%= MedTxDateText_4.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_4.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_4.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_4.ClientID %>').value='';
        document.getElementById('<%= MedTxType_4.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_4.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_4.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_4.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_4.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_4.ClientID %>').value='';
       
        document.getElementById('<%= MedTxDateText_5.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_5.ClientID %>').value='';
        document.getElementById('<%= MedTxDisease_5.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_5.ClientID %>').value='';
        document.getElementById('<%= MedTxType_5.ClientID %>').value='';
        document.getElementById('<%= MedTxUnits_5.ClientID %>').value='';
        document.getElementById('<%= MedTxCycle_5.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDateText_5.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_5.ClientID %>').value='';
        document.getElementById('<%= MedTxQuality_5.ClientID %>').value='';

        }
    }

</script>