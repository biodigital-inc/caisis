<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.HomeMedicationList" CodeFile="HomeMedicationList.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.MedicationsHtmlTable = "MedicationsHtmlTable";
</script>
<script>
	// we need to customize showFirstAdditionalRow(...) for medications
	function medications_showFirstAdditionalRow(linkReference, tableId) {
		var rowShown = false;
		var hideWidget = true;
		var table = document.getElementById(tableId);
		for (i = 0; i < table.rows.length; i++) {
			var row = table.rows[i];
			
			// skip rows with an id containing "_tr_"
			var rowId = row.id;
			if (rowId != null && rowId.indexOf('_tr_') != -1)
				continue;
				
			if (rowShown == false && row.style['display'] == 'none') {
				row.style['display'] = '';
				rowShown = true;
			} else if (rowShown == true && row.style['display'] == 'none') {
				hideWidget = false;
			}
		}
		
		if (hideWidget) {
			linkReference.style['display'] = 'none';
		}
		return false;
	}
	
	function modTaggedMedications(mode)
	{
		var table = document.getElementById('MedicationsHtmlTable');
		for (i = 0; i < table.rows.length; i++) {
			var row = table.rows[i];
			var rowId = row.id;
			if (rowId != null && rowId.indexOf('_tr_') != -1) {
				row.style.display = mode;
			}
		}
	}
	
	function showTaggedMedications(linkRef)
	{
		modTaggedMedications('block');
		linkRef.style.display = 'none';
		return false;
	}
	
	
	function toggleTaggedMedications(cbox)
	{
		if (cbox.checked)
		{
//			modTaggedMedications('none');
			document.getElementById('medicationCheckboxMsg').innerHTML = '<strong>Loading...  Please wait.</strong>';
			document.dataForm.submit();  //need to submit to switch medication view without losing changes
		}
		else
		{
			modTaggedMedications('block');
		}
		
		return false;
	}
</script>
<link href="../../../ClientScripts/utilities.js" type="text/javascript" />

<style type="text/css">
#MedicationsHtmlTable
{
	border-right: none;
	border-bottom: none;
}
#MedicationsHtmlTable td
{
	border-right: solid 1px #dddddd;
	border-bottom: solid 1px #dddddd;
	font-size: 11px;
}
#MedicationsHtmlTable td.ClinicalEformPopulatedColumn
{
	border-bottom: none;
}
#MedicationsHtmlTable tr.ClinicalEformHighlightedRow td.ClinicalEformPopulatedColumn
{
	border-bottom: none;
	border-right:  solid 1px #E4B9C4;
}
</style>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="HomeMedicationList" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medications" /><img src="../../Images/shim.gif" width="290" height="1" border="0"><input type="checkbox" checked onclick="toggleTaggedMedications(this);"  /> <span id="medicationCheckboxMsg">Show Current Medications Only</span>



<table width="650" cellspacing="0" class="ClinicalEformTable" id="MedicationsHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="">Agent</td>
    <td class="controlBoxDataGridHeaderFirstCol">Dose</td>
    <td class="controlBoxDataGridHeaderFirstCol">Dose Units </td>
    <td class="controlBoxDataGridHeaderFirstCol">Schedule</td>
    <td class="controlBoxDataGridHeaderFirstCol">Indication</td>
    <td class="controlBoxDataGridHeaderFirstCol">Route</td>
    <td class="controlBoxDataGridHeaderFirstCol">Start Date </td>
    <td class="controlBoxDataGridHeaderFirstCol" nowrap>Stop Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="medicationsAll" runat="server" OnItemDataBound="DecorateMedicationsAll" > 
	<ItemTemplate> 
		<tr id="_tr_" runat="server" class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication") %></td>
			<td align="right" class="ClinicalEformPopulatedColumn" style="border-right: none;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDose") %></td>
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedUnits") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedSchedule") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedIndication") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedRoute") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDateText") %></td>
			<td class="ClinicalEformPopulatedColumn" style="white-space: nowrap;"><%# DataBinder.Eval(Container.DataItem, "MedStopDateText") %><euc:EformStopCheckBox runat="server" ID="StopDateCheckbox" Visible="false" Font-Size="9px" /></td>
		    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>
		<tr id="extraHeaderRow" runat="server" visible="false"> 
            <td class="controlBoxDataGridHeaderFirstCol" style="">Agent</td>
            <td class="controlBoxDataGridHeaderFirstCol">Dose</td>
            <td class="controlBoxDataGridHeaderFirstCol">Dose Units </td>
            <td class="controlBoxDataGridHeaderFirstCol">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol">Indication</td>
            <td class="controlBoxDataGridHeaderFirstCol">Route</td>
            <td class="controlBoxDataGridHeaderFirstCol">Start Date </td>
            <td class="controlBoxDataGridHeaderFirstCol" nowrap>Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr style="background-color: #f6f6f6;"> 
    <td height="28" >
    <euc:EformComboBox LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"   style="width:110;" Field="Medication" RecordId="1" Table="Medications" Runat="server" id="Medication_1"  />  </td>
    <td style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_1"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="1" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_1"/></td>
    <td ><euc:EformComboBox LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="1" Table="Medications" Runat="server" id="MedSchedule_1"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="1" Table="Medications" Runat="server" id="MedIndication_1"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="1" Table="Medications" Runat="server" id="MedRoute_1"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="1"  ID="MedDateText_1" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="1" Runat="server" ID="MedDate_1" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="1"  ID="MedStopDateText_1" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="1" Runat="server" ID="MedStopDate_1" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr > 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="2" Table="Medications" Runat="server" id="Medication_2"  />  </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_2"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="2" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_2"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="2" Table="Medications" Runat="server" id="MedSchedule_2"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="2" Table="Medications" Runat="server" id="MedIndication_2"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="2" Table="Medications" Runat="server" id="MedRoute_2"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="2"  ID="MedDateText_2" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="MedDate_2" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="2"  ID="MedStopDateText_2" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="MedStopDate_2" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>

  <tr  style="background-color: #f6f6f6;"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="3" Table="Medications" Runat="server" id="Medication_3"   />   </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_3"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="3" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_3"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="3" Table="Medications" Runat="server" id="MedSchedule_3"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="3" Table="Medications" Runat="server" id="MedIndication_3"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="3" Table="Medications" Runat="server" id="MedRoute_3"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="3"  ID="MedDateText_3" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="MedDate_3" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="3"  ID="MedStopDateText_3" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="MedStopDate_3" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="4" Table="Medications" Runat="server" id="Medication_4"   />   </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_4"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="4" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_4"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="4" Table="Medications" Runat="server" id="MedSchedule_4"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="4" Table="Medications" Runat="server" id="MedIndication_4"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="4" Table="Medications" Runat="server" id="MedRoute_4"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="4"  ID="MedDateText_4" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="MedDate_4" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="4"  ID="MedStopDateText_4" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="MedStopDate_4" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr  style="background-color: #f6f6f6;"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="5" Table="Medications" Runat="server" id="Medication_5"   />   </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_5"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="5" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_5"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="5" Table="Medications" Runat="server" id="MedSchedule_5"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="5" Table="Medications" Runat="server" id="MedIndication_5"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="5" Table="Medications" Runat="server" id="MedRoute_5"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="5"  ID="MedDateText_5" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="5" Runat="server" ID="MedDate_5" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="5"  ID="MedStopDateText_5" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="5" Runat="server" ID="MedStopDate_5" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="6" Table="Medications" Runat="server" id="Medication_6"   />  </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_6"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="6" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_6"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="6" Table="Medications" Runat="server" id="MedSchedule_6"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="6" Table="Medications" Runat="server" id="MedIndication_6"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="6" Table="Medications" Runat="server" id="MedRoute_6"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="6"  ID="MedDateText_6" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="6" Runat="server" ID="MedDate_6" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="6"  ID="MedStopDateText_6" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="6" Runat="server" ID="MedStopDate_6" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr  style="background-color: #f6f6f6;"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="7" Table="Medications" Runat="server" id="Medication_7"  />  </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_7"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="7" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_7"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="7" Table="Medications" Runat="server" id="MedSchedule_7"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="7" Table="Medications" Runat="server" id="MedIndication_7"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="7" Table="Medications" Runat="server" id="MedRoute_7"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="7"  ID="MedDateText_7" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="7" Runat="server" ID="MedDate_7" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="7"  ID="MedStopDateText_7" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="7" Runat="server" ID="MedStopDate_7" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="8" Table="Medications" Runat="server" id="Medication_8"  />  </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_8"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="8" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_8"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="8" Table="Medications" Runat="server" id="MedSchedule_8"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="8" Table="Medications" Runat="server" id="MedIndication_8"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="8" Table="Medications" Runat="server" id="MedRoute_8"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="8"  ID="MedDateText_8" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="8" Runat="server" ID="MedDate_8" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="8"  ID="MedStopDateText_8" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="8" Runat="server" ID="MedStopDate_8" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="background-color: #f6f6f6; DISPLAY: none">  
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="9" Table="Medications" Runat="server" id="Medication_9"  />  </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_9"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="9" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_9"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="9" Table="Medications" Runat="server" id="MedSchedule_9"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="9" Table="Medications" Runat="server" id="MedIndication_9"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="9" Table="Medications" Runat="server" id="MedRoute_9"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="9"  ID="MedDateText_9" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="9" Runat="server" ID="MedDate_9" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="9"  ID="MedStopDateText_9" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="9" Runat="server" ID="MedStopDate_9" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="10" Table="Medications" Runat="server" id="Medication_10"  />  </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_10"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="10" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_10"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="10" Table="Medications" Runat="server" id="MedSchedule_10"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="10" Table="Medications" Runat="server" id="MedIndication_10"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="10" Table="Medications" Runat="server" id="MedRoute_10"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="10"  ID="MedDateText_10" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="10" Runat="server" ID="MedDate_10" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="10"  ID="MedStopDateText_10" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="10" Runat="server" ID="MedStopDate_10" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="background-color: #f6f6f6; DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="11" Table="Medications" Runat="server" id="Medication_11"  />  </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_11"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="11" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_11"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="11" Table="Medications" Runat="server" id="MedSchedule_11"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="11" Table="Medications" Runat="server" id="MedIndication_11"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="11" Table="Medications" Runat="server" id="MedRoute_11"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="11"  ID="MedDateText_11" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="11" Runat="server" ID="MedDate_11" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="11"  ID="MedStopDateText_11" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="11" Runat="server" ID="MedStopDate_11" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="12" Table="Medications" Runat="server" id="Medication_12"  />  </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_12"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="12" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_12"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="12" Table="Medications" Runat="server" id="MedSchedule_12"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="12" Table="Medications" Runat="server" id="MedIndication_12"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="12" Table="Medications" Runat="server" id="MedRoute_12"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="12"  ID="MedDateText_12" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="12" Runat="server" ID="MedDate_12" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="12"  ID="MedStopDateText_12" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="12" Runat="server" ID="MedStopDate_12" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="background-color: #f6f6f6; DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="13" Table="Medications" Runat="server" id="Medication_13"  />  </td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_13"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="13" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_13"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="13" Table="Medications" Runat="server" id="MedSchedule_13"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="13" Table="Medications" Runat="server" id="MedIndication_13"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="13" Table="Medications" Runat="server" id="MedRoute_13"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="13"  ID="MedDateText_13" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="13" Runat="server" ID="MedDate_13" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="13"  ID="MedStopDateText_13" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="13" Runat="server" ID="MedStopDate_13" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="14" Table="Medications" Runat="server" id="Medication_14"  /></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_14"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="14" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_14"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="14" Table="Medications" Runat="server" id="MedSchedule_14"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="14" Table="Medications" Runat="server" id="MedIndication_14"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="14" Table="Medications" Runat="server" id="MedRoute_14"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="14"  ID="MedDateText_14" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="14" Runat="server" ID="MedDate_14" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="14"  ID="MedStopDateText_14" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="14" Runat="server" ID="MedStopDate_14" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="background-color: #f6f6f6; DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="15" Table="Medications" Runat="server" id="Medication_15"  /></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_15"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="15" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_15"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="15" Table="Medications" Runat="server" id="MedSchedule_15"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="15" Table="Medications" Runat="server" id="MedIndication_15"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="15" Table="Medications" Runat="server" id="MedRoute_15"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="15"  ID="MedDateText_15" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="15" Runat="server" ID="MedDate_15" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="15"  ID="MedStopDateText_15" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="15" Runat="server" ID="MedStopDate_15" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="16" Table="Medications" Runat="server" id="Medication_16"  /></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_16"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="16" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_16"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="16" Table="Medications" Runat="server" id="MedSchedule_16"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="16" Table="Medications" Runat="server" id="MedIndication_16"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="16" Table="Medications" Runat="server" id="MedRoute_16"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="16"  ID="MedDateText_16" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="16" Runat="server" ID="MedDate_16" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="16"  ID="MedStopDateText_16" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="16" Runat="server" ID="MedStopDate_16" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="background-color: #f6f6f6; DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="17" Table="Medications" Runat="server" id="Medication_17"  /></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_17"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="17" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_17"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="17" Table="Medications" Runat="server" id="MedSchedule_17"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="17" Table="Medications" Runat="server" id="MedIndication_17"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="17" Table="Medications" Runat="server" id="MedRoute_17"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="17"  ID="MedDateText_17" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="17" Runat="server" ID="MedDate_17" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="17"  ID="MedStopDateText_17" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="17" Runat="server" ID="MedStopDate_17" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="18" Table="Medications" Runat="server" id="Medication_18"  /></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_18"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="18" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_18"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="18" Table="Medications" Runat="server" id="MedSchedule_18"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="18" Table="Medications" Runat="server" id="MedIndication_18"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="18" Table="Medications" Runat="server" id="MedRoute_18"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="18"  ID="MedDateText_18" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="18" Runat="server" ID="MedDate_18" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="18"  ID="MedStopDateText_18" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="18" Runat="server" ID="MedStopDate_18" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="background-color: #f6f6f6; DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="19" Table="Medications" Runat="server" id="Medication_19"  /></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_19"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="19" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_19"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="19" Table="Medications" Runat="server" id="MedSchedule_19"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="19" Table="Medications" Runat="server" id="MedIndication_19"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="19" Table="Medications" Runat="server" id="MedRoute_19"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="19"  ID="MedDateText_19" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="19" Runat="server" ID="MedDate_19" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="19"  ID="MedStopDateText_19" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="19" Runat="server" ID="MedStopDate_19" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" >
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:110;" Field="Medication" RecordId="20" Table="Medications" Runat="server" id="Medication_20"  /></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:36px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_20"/></td>
    <td  style="white-space:nowrap; text-align: center;"><euc:EformSelect RecordId="20" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" style="width: 70px;" Runat="server" ID="MedUnits_20"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  style="width:40;" Field="MedSchedule" RecordId="20" Table="Medications" Runat="server" id="MedSchedule_20"  /></td>
    <td ><euc:EformComboBox LookupCode="MedIndication"  DropDownWidth="285"  style="width:70;" Field="MedIndication" RecordId="20" Table="Medications" Runat="server" id="MedIndication_20"  /></td>
    <td ><euc:EformComboBox LookupCode="MedRoute"  DropDownWidth="285"  style="width:70;" Field="MedRoute" RecordId="20" Table="Medications" Runat="server" id="MedRoute_20"  /></td>
    <td ><euc:EformTextBox Runat="server" RecordId="20"  ID="MedDateText_20" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="20" Runat="server" ID="MedDate_20" Table="Medications" Field="MedDate" /></td>
    <td><euc:EformTextBox Runat="server" RecordId="20"  ID="MedStopDateText_20" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="20" Runat="server" ID="MedStopDate_20" Table="Medications" Field="MedStopDate" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<a href="javascript:;" onclick="return medications_showFirstAdditionalRow(this,'MedicationsHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
<br/>
<br/><br/>
