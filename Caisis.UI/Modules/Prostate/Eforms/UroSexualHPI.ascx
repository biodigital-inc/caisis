<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.UroSexualHPI" CodeFile="UroSexualHPI.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.MedsUroSexualHtmlTable="MedsUroSexualHtmlTable";
</script>


<a name="UroSexualHPI" /><span class="controlBoxTitle">HPI</span><br/>
<asp:Literal ID="NoHPIMsg" Runat="server" Visible="False">No history of present illness found for this patient.</asp:Literal>

<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
  
   	
  <asp:Repeater ID="hpi" OnItemDataBound="SetHpiItem" runat="server" > 
       <ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" id="HpiRow" runat="server"
		    onmouseout="this.className='ClinicalEformPopulatedRow';" >  
			<td class="ClinicalEformPopulatedColumn"><asp:Literal id="HpiRowItems" runat="server"/></td>
	    </tr> 
      </ItemTemplate>
  </asp:Repeater>
  
  <asp:Repeater ID="HpiProstatectomies" runat="server" > 
       <ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('ProstatectomyProc', '<%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>', 'ProcSurgeon,ProcSurgeonType,ProcName,ProcStageSystem,ProcStageT', 'ProstateHPI');">  
			<td class="ClinicalEformPopulatedColumn">
				<strong><%# DataBinder.Eval(Container.DataItem, "ProcName") %></strong>
				on <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  <asp:Label ID="CaseSurgeonLabel" Runat="server">by <%# DataBinder.Eval(Container.DataItem, "ProcSurgeon") %></asp:Label>
			</td>
	    </tr>   
      </ItemTemplate>
</asp:Repeater>

	<tr id="PreTxPotencyTr" runat="server" class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';">  
			<td class="ClinicalEformPopulatedColumn"><asp:Label ID="PreTxPot" Runat="server" /></td>
	</tr>      
	

  <asp:Repeater ID="hpiProtocols" runat="server" > 
       <ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('PatientProtocols', <%# DataBinder.Eval(Container.DataItem, "PatientProtocolId") %>, 'PtProtocolStatus,PtProtocolNotes,PtProtocolDataSource,PtProtocolQuality', 'ProstateHPI');">  
			<td class="ClinicalEformPopulatedColumn">
				Protocol <%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %>  <%# DataBinder.Eval(Container.DataItem, "ProtocolNotes") %> <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>			
			</td>
	    </tr>  
      </ItemTemplate>
</asp:Repeater>


 <asp:Repeater ID="hpiBiopsies" runat="server" > 
       <ItemTemplate>
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, '', 'ProstateHPI');">  <!-- PathDateText,PathDate,PathSpecimenType,PathSite,PathSubsite,PathSide,PathResult -->
			<td class="ClinicalEformPopulatedColumn">
     				Biopsy:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                  &nbsp;&nbsp;Result:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathResult") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathQuality") %>			
            </td>
	    </tr>
      </ItemTemplate>
</asp:Repeater>


<tr id="NvbLeftTr" runat="server" class="ClinicalEformPopulatedRowNonClickable">  
	<td class="ClinicalEformPopulatedColumn"><asp:Label ID="NVB_Left" Runat="server" /> </td>
</tr>

<tr id="NvbRightTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" >  
	<td class="ClinicalEformPopulatedColumn"><asp:Label ID="NVB_Right" Runat="server" /> </td>
</tr>
</table><br/><br/>

<a name="PSA" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="PSA" style="margin-right: 30px;"></asp:Label>

<euc:EformRadioButtonList RepeatLayout="Flow" CellSpacing="4" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="PSA_Change" id="PSA_Change"  runat="server" >
		    <asp:ListItem  Value="ND">ND&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem  Value="Elevated">Elevated</asp:ListItem>
</euc:EformRadioButtonList><br/>
<table cellpadding="4" cellspacing="0" class="ClinicalEformTable" id="OtherLabTestsHtmlTable">
	<tr> 
		<td class="controlBoxDataGridHeaderFirstCol" >Date&nbsp;&nbsp;</td>
		<td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result (ng/ml)</td>
		<td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	</tr>
	<asp:Repeater ID="OtherLabTests" runat="server" OnItemDataBound="EFormRepeaterOnDataBoundForOther"> 
		<ItemTemplate> 
			<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabNotes,LabQuality', 'PSA');"> 
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
				<td  style="text-align: center;" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="OtherLockImage" runat="server" title="This record has been locked.">&nbsp;</td>
			</tr>      
		</ItemTemplate>
	</asp:Repeater>
	<tr> 
		<td ><euc:EformTextBox Runat="server" RecordId="51"  ID="LabDateText_51" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="51" Runat="server" ID="LabDate_51" Table="LabTests" Field="LabDate"/></td>
		<td style="text-align: center;" ><euc:EformTextBox RecordId="51" ShowCalendar="False" CalcDate="False" style="width:70px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_51" /></td>
		<td >&nbsp;</td>
	</tr>
	<tr> 
		<td ><euc:EformTextBox Runat="server" RecordId="52"  ID="LabDateText_52" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="52" Runat="server" ID="LabDate_52" Table="LabTests" Field="LabDate"/></td>
		<td style="text-align: center;" ><euc:EformTextBox RecordId="52" ShowCalendar="False" CalcDate="False" style="width:70px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_52" /></td>
		<td >&nbsp;</td>
	</tr>
	<tr> 
		<td ><euc:EformTextBox Runat="server" RecordId="53"  ID="LabDateText_53" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="53" Runat="server" ID="LabDate_53" Table="LabTests" Field="LabDate"/></td>
		<td style="text-align: center;" ><euc:EformTextBox RecordId="53" ShowCalendar="False" CalcDate="False" style="width:70px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_53" /></td>
		<td >&nbsp;</td>
	</tr>
</table><br /><br />

<table id="Continence" border="0" cellspacing="0" cellpadding="16" class="eformLargePopulatedTable" >
 <tr >
	<td style="font-weight: bold;">Continence</td>
	<td style="font-weight: bold;"><euc:EformTextBox style="width:200px;" TABLE="NoTable" FIELD="Continence" Runat="server" ID="Continence" /></td>
</tr>
</table>
<br /><br />

<a name="Medications" /><asp:Label ID="Label1" runat="server" CssClass="controlBoxTitle" Text="Medications"></asp:Label>
<table cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="MedsUroSexualHtmlTable">
    <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; padding-left: 24px;">Date</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; padding-left: 24px;">Medication</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Dose</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
        <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    </tr>
    <asp:Repeater ID="medicationsRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
        <ItemTemplate>
            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Medications', <%# DataBinder.Eval(Container.DataItem, "MedicationId") %>, 'MedDateText,MedDate,Medication,MedStopDateText,MedStopDate,MedQuality', 'Medications');">
                <td style="text-align: left;" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDateText")%></td>
                <td style="text-align: left; padding-left: 24px;" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Medication")%>&nbsp;</td>
                <td style="text-align: left;" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedDose")%>&nbsp;</td>
                <td style="text-align: left;" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedUnits")%>&nbsp;</td>
                <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    
    <tr>
        <td height="28" class="ClinicalEformGridColumnOne" align="left">
            <euc:EformTextBox Style="width: 80px;" RecordId="1" Table="Medications" Field="MedDateText" ID="MedDateText_1" runat="server" 
                ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden RecordId="1" Table="Medications" Field="MedDate" ID="MedDate_1" runat="server" />
        </td>
        <td style="padding-left: 24px;">
            <euc:EformComboBox DropDownWidth="300px" style="width: 140px;" RecordId="1" Table="Medications" Field="Medication" ID="Medication_1" 
                runat="server" LookupCode="Medication" />
        </td>
        <td><euc:EformTextBox RecordId="1" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_1"/></td>
        <td><euc:EformDropDownList RecordId="1" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_1" style="width: 80px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" /></td>
    </tr>
    <tr style=" display:none;">
        <td height="28" class="ClinicalEformGridColumnOne" align="left">
            <euc:EformTextBox Style="width: 80px;" RecordId="2" Table="Medications" Field="MedDateText" ID="MedDateText_2" runat="server" 
                ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden RecordId="2" Table="Medications" Field="MedDate" ID="MedDate_2" runat="server" />
        </td>
        <td style="padding-left: 24px;">
            <euc:EformComboBox DropDownWidth="300px" style="width: 140px;" RecordId="2" Table="Medications" Field="Medication" ID="Medication_2" 
                runat="server" LookupCode="Medication" />
        </td>
        <td><euc:EformTextBox RecordId="2" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_2"/></td>
        <td><euc:EformDropDownList RecordId="2" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_2" style="width: 80px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" /></td>
    </tr>
    <tr style="display:none;">
        <td height="28" class="ClinicalEformGridColumnOne">
            <euc:EformTextBox Style="width: 80px;" RecordId="3" Table="Medications" Field="MedDateText" ID="MedDateText_3" runat="server" 
                ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden RecordId="3" Table="Medications" Field="MedDate" ID="MedDate_3" runat="server" />
        </td>
        <td  style="padding-left: 24px;">
            <euc:EformComboBox DropDownWidth="300px" style="width: 140px;" RecordId="3" Table="Medications" Field="Medication" ID="Medication_3" 
                runat="server" LookupCode="Medication" />
        </td>
        <td><euc:EformTextBox RecordId="3" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_3"/></td>
        <td><euc:EformDropDownList RecordId="3" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_3" style="width: 80px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" /></td>
    </tr>
    <tr style=" display:none;">
        <td height="28" class="ClinicalEformGridColumnOne" align="left">
            <euc:EformTextBox Style="width: 80px;" RecordId="4" Table="Medications" Field="MedDateText" ID="MedDateText_4" runat="server" 
                ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden RecordId="4" Table="Medications" Field="MedDate" ID="MedDate_4" runat="server" />
        </td>
        <td style="padding-left: 24px;">
            <euc:EformComboBox DropDownWidth="300px" style="width: 140px;" RecordId="4" Table="Medications" Field="Medication" ID="Medication_4" 
                runat="server" LookupCode="Medication" />
        </td>
        <td><euc:EformTextBox RecordId="4" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_4"/></td>
        <td><euc:EformDropDownList RecordId="4" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_4" style="width: 80px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" /></td>
    </tr>
    <tr style="display:none;">
        <td height="28" class="ClinicalEformGridColumnOne">
            <euc:EformTextBox Style="width: 80px;" RecordId="5" Table="Medications" Field="MedDateText" ID="MedDateText_5" runat="server" 
                ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden RecordId="5" Table="Medications" Field="MedDate" ID="MedDate_5" runat="server" />
        </td>
        <td style="padding-left: 24px;">
            <euc:EformComboBox DropDownWidth="300px" style="width: 140px;" RecordId="5" Table="Medications" Field="Medication" ID="Medication_5" 
                runat="server" LookupCode="Medication" />
        </td>
        <td><euc:EformTextBox RecordId="5" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_5"/></td>
        <td><euc:EformDropDownList RecordId="5" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_5" style="width: 80px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" /></td>
    </tr>
</table> <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedsUroSexualHtmlTable');" /><br /><br /><br />
