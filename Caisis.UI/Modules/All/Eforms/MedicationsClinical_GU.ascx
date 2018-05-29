<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.MedicationsClinical" CodeFile="MedicationsClinical.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
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
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="MedicationsClinical" />
<span class="controlBoxTitle">Medications</span><table width="650" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px; margin-bottom:5px;">
  
  <tr>
    <td >Last Bisphosphonate&nbsp;<euc:EformTextBox ShowCalendar="true" CalcDate="false" style="width:90px;" TABLE="NoTable"  FIELD="LastBisphosphonate" Runat="server" ID="LastBisphosphonate" /></td>
    <%--
	<td style="padding-right:20px;"><euc:EformCheckbox TABLE="NoTable" FIELD="VitaminDCal" Runat="server" ID="VitaminDCal" Value="True" />
    Vitamin D / Cal </td>
	--%>
    <td  align="right"><input type="checkbox" checked="checked" onclick="toggleTaggedMedications(this);" />
        <span id="medicationCheckboxMsg">Show Current Medications Only</span></td>
  </tr>
</table>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicationsHtmlTable">
  <tr> 
    <td width="31%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Agent</td>
    <td width="10%" class="controlBoxDataGridHeaderFirstCol">Dose</td>
    <td width="10%" class="controlBoxDataGridHeaderFirstCol">Dose Units </td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol">Schedule</td>
    <td height="9%" class="controlBoxDataGridHeaderFirstCol" nowrap>Stop Date</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="medicationsAll" runat="server"  OnItemDataBound="DecorateMedicationsAll" > 
	<ItemTemplate> 
		<tr id="_tr_" runat="server" class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDose") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedUnits") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedSchedule") %></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedStopDateText") %></td>
		    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformCheckbox TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_1" Value="Vitamin D / Cal" RecordId="1" /> Vitamin D / Cal
    <%-- <euc:EformComboBox LookupCode="Medication,PercentUsage,Top80"  RefBy="Medication" style="width:140;" Field="Medication" RecordId="1" Table="Medications" Runat="server" id="Medication_1"  />--%>   </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_1"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;"><euc:EformSelect RecordId="1" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_1"/></td>
    <td >&nbsp;<euc:EformComboBox LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="1" Table="Medications" Runat="server" id="MedSchedule_1"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
    <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="2" Table="Medications" Runat="server" id="Medication_2"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_2"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="2" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_2"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="2" Table="Medications" Runat="server" id="MedSchedule_2"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="3" Table="Medications" Runat="server" id="Medication_3"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_3"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="3" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_3"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="3" Table="Medications" Runat="server" id="MedSchedule_3"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="4" Table="Medications" Runat="server" id="Medication_4"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_4"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="4" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_4"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="4" Table="Medications" Runat="server" id="MedSchedule_4"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="5" Table="Medications" Runat="server" id="Medication_5"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_5"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="5" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_5"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="5" Table="Medications" Runat="server" id="MedSchedule_5"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="6" Table="Medications" Runat="server" id="Medication_6"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_6"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="6" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_6"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="6" Table="Medications" Runat="server" id="MedSchedule_6"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="7" Table="Medications" Runat="server" id="Medication_7"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_7"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="7" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_7"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="7" Table="Medications" Runat="server" id="MedSchedule_7"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="8" Table="Medications" Runat="server" id="Medication_8"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_8"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="8" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_8"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="8" Table="Medications" Runat="server" id="MedSchedule_8"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="9" Table="Medications" Runat="server" id="Medication_9"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_9"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="9" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_9"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="9" Table="Medications" Runat="server" id="MedSchedule_9"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="10" Table="Medications" Runat="server" id="Medication_10"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_10"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="10" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_10"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="10" Table="Medications" Runat="server" id="MedSchedule_10"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="11" Table="Medications" Runat="server" id="Medication_11"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_11"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="11" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_11"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="11" Table="Medications" Runat="server" id="MedSchedule_11"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="12" Table="Medications" Runat="server" id="Medication_12"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_12"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="12" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_12"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="12" Table="Medications" Runat="server" id="MedSchedule_12"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="13" Table="Medications" Runat="server" id="Medication_13"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_13"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="13" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_13"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="13" Table="Medications" Runat="server" id="MedSchedule_13"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="14" Table="Medications" Runat="server" id="Medication_14"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_14"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="14" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_14"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="14" Table="Medications" Runat="server" id="MedSchedule_14"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="15" Table="Medications" Runat="server" id="Medication_15"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_15"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="15" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_15"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="15" Table="Medications" Runat="server" id="MedSchedule_15"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="16" Table="Medications" Runat="server" id="Medication_16"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_16"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="16" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_16"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="16" Table="Medications" Runat="server" id="MedSchedule_16"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="17" Table="Medications" Runat="server" id="Medication_17"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_17"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="17" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_17"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="17" Table="Medications" Runat="server" id="MedSchedule_17"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="18" Table="Medications" Runat="server" id="Medication_18"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_18"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="18" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_18"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="18" Table="Medications" Runat="server" id="MedSchedule_18"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="19" Table="Medications" Runat="server" id="Medication_19"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_19"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="19" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_19"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="19" Table="Medications" Runat="server" id="MedSchedule_19"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:140;" Field="Medication" RecordId="20" Table="Medications" Runat="server" id="Medication_20"  />    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_20"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="20" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_20"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="20" Table="Medications" Runat="server" id="MedSchedule_20"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
<a href="javascript:;" onclick="return medications_showFirstAdditionalRow(this,'MedicationsHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
<br/>
<br/><br/>
