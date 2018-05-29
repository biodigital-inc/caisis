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
<link href="../../../ClientScripts/utilities.js" type="text/javascript" />
<script language="javascript">
	var stopMedURL = '<%= Caisis.UI.Core.Classes.PageUtil.GetBasePath(this.Request) + "/Modules/All/Eforms/StopMedication.aspx" %>';
	
	function generateStopMedCallback(cbox)
	{
		return function(txt, xml)
		{
			if (txt.length > 0)
			{
				var dte = document.createTextNode(txt);
				var span = cbox.parentNode;
				var cell = span.parentNode;
				
				cell.replaceChild(dte, span);
			}
		}
	}
	
	function stopMedication(cbox, medId, evt)
	{
		if (cbox.checked)
		{
			stopBubble(evt);
			
			var p = new Param();
			p.add("medicationId", medId);
			
			AjaxManager.MakeRequest("POST", stopMedURL, p, generateStopMedCallback(cbox), true);
		}
	}
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="MedicationsClinical" /><span class="controlBoxTitle">Medications</span><img src="../../Images/shim.gif" width="350" height="1" border="0"><input type="checkbox" checked onclick="toggleTaggedMedications(this);"  /> <span id="medicationCheckboxMsg">Show Current Medications Only</span>



<br/>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicationsHtmlTable">
  <tr> 
    <td width="31%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Agent</td>
    <td width="10%" class="controlBoxDataGridHeaderFirstCol">Dose</td>
    <td width="10%" class="controlBoxDataGridHeaderFirstCol">Dose Units </td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol">Schedule</td>
    <td height="9%" class="controlBoxDataGridHeaderFirstCol" nowrap>Stop Date</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="medicationsAll" runat="server" OnItemDataBound="DecorateMedicationsAll" > 
	<ItemTemplate> 
		<tr id="_tr_" runat="server" class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDose") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedUnits") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedSchedule") %></td>
			<td class="ClinicalEformPopulatedColumn" style="white-space: nowrap;"><%# DataBinder.Eval(Container.DataItem, "MedStopDateText") %><asp:CheckBox runat="server" ID="StopDateCheckbox" Visible="false" Font-Size="9px" Text="Stop Now"/></td>
		    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_1" Table="Medications" Field="MedDateText" RecordId="1" runat="server"/>
	<euc:EformHidden id="MedDate_1" Table="Medications" Field="MedDate"  RecordId="1" runat="server"/>
	
    
    <euc:EformComboBox LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"   style="width:140;" Field="Medication" RecordId="1" Table="Medications" Runat="server" id="Medication_1" EnableHiddenOnUIEvent="MedDateText_1,MedDate_1" />    </td>
    <td style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_1"/></td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="1" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_1"/></td>
    <td >&nbsp;<euc:EformComboBox LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="1" Table="Medications" Runat="server" id="MedSchedule_1"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
    <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_2" Table="Medications" Field="MedDateText" RecordId="2" runat="server"/>
	<euc:EformHidden id="MedDate_2" Table="Medications" Field="MedDate"  RecordId="2" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="2" Table="Medications" Runat="server" id="Medication_2" EnableHiddenOnUIEvent="MedDateText_2,MedDate_2"  />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_2"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="2" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_2"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="2" Table="Medications" Runat="server" id="MedSchedule_2"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_3" Table="Medications" Field="MedDateText" RecordId="3" runat="server"/>
	<euc:EformHidden id="MedDate_3" Table="Medications" Field="MedDate"  RecordId="3" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="3" Table="Medications" Runat="server" id="Medication_3" EnableHiddenOnUIEvent="MedDateText_3,MedDate_3"  />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_3"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="3" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_3"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="3" Table="Medications" Runat="server" id="MedSchedule_3"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_4" Table="Medications" Field="MedDateText" RecordId="4" runat="server"/>
	<euc:EformHidden id="MedDate_4" Table="Medications" Field="MedDate"  RecordId="4" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="4" Table="Medications" Runat="server" id="Medication_4" EnableHiddenOnUIEvent="MedDateText_4,MedDate_4"  />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_4"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="4" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_4"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="4" Table="Medications" Runat="server" id="MedSchedule_4"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_5" Table="Medications" Field="MedDateText" RecordId="5" runat="server"/>
	<euc:EformHidden id="MedDate_5" Table="Medications" Field="MedDate"  RecordId="5" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="5" Table="Medications" Runat="server" id="Medication_5"  EnableHiddenOnUIEvent="MedDateText_5,MedDate_5" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_5"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="5" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_5"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="5" Table="Medications" Runat="server" id="MedSchedule_5"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_6" Table="Medications" Field="MedDateText" RecordId="6" runat="server"/>
	<euc:EformHidden id="MedDate_6" Table="Medications" Field="MedDate"  RecordId="6" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="6" Table="Medications" Runat="server" id="Medication_6"  EnableHiddenOnUIEvent="MedDateText_6,MedDate_6" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_6"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="6" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_6"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="6" Table="Medications" Runat="server" id="MedSchedule_6"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_7" Table="Medications" Field="MedDateText" RecordId="7" runat="server"/>
	<euc:EformHidden id="MedDate_7" Table="Medications" Field="MedDate"  RecordId="7" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="7" Table="Medications" Runat="server" id="Medication_7"  EnableHiddenOnUIEvent="MedDateText_7,MedDate_7" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_7"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="7" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_7"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="7" Table="Medications" Runat="server" id="MedSchedule_7"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_8" Table="Medications" Field="MedDateText" RecordId="8" runat="server"/>
	<euc:EformHidden id="MedDate_8" Table="Medications" Field="MedDate"  RecordId="8" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="8" Table="Medications" Runat="server" id="Medication_8"  EnableHiddenOnUIEvent="MedDateText_8,MedDate_8" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_8"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="8" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_8"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="8" Table="Medications" Runat="server" id="MedSchedule_8"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_9" Table="Medications" Field="MedDateText" RecordId="9" runat="server"/>
	<euc:EformHidden id="MedDate_9" Table="Medications" Field="MedDate"  RecordId="9" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="9" Table="Medications" Runat="server" id="Medication_9"  EnableHiddenOnUIEvent="MedDateText_9,MedDate_9" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_9"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="9" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_9"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="9" Table="Medications" Runat="server" id="MedSchedule_9"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_10" Table="Medications" Field="MedDateText" RecordId="10" runat="server"/>
	<euc:EformHidden id="MedDate_10" Table="Medications" Field="MedDate"  RecordId="10" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="10" Table="Medications" Runat="server" id="Medication_10"  EnableHiddenOnUIEvent="MedDateText_10,MedDate_10" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_10"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="10" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_10"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="10" Table="Medications" Runat="server" id="MedSchedule_10"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_11" Table="Medications" Field="MedDateText" RecordId="11" runat="server"/>
	<euc:EformHidden id="MedDate_11" Table="Medications" Field="MedDate"  RecordId="11" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="11" Table="Medications" Runat="server" id="Medication_11"  EnableHiddenOnUIEvent="MedDateText_11,MedDate_11" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_11"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="11" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_11"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="11" Table="Medications" Runat="server" id="MedSchedule_11"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_12" Table="Medications" Field="MedDateText" RecordId="12" runat="server"/>
	<euc:EformHidden id="MedDate_12" Table="Medications" Field="MedDate"  RecordId="12" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="12" Table="Medications" Runat="server" id="Medication_12"  EnableHiddenOnUIEvent="MedDateText_12,MedDate_12" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_12"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="12" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_12"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="12" Table="Medications" Runat="server" id="MedSchedule_12"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_13" Table="Medications" Field="MedDateText" RecordId="13" runat="server"/>
	<euc:EformHidden id="MedDate_13" Table="Medications" Field="MedDate"  RecordId="13" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="13" Table="Medications" Runat="server" id="Medication_13"  EnableHiddenOnUIEvent="MedDateText_13,MedDate_13" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_13"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="13" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_13"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="13" Table="Medications" Runat="server" id="MedSchedule_13"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_14" Table="Medications" Field="MedDateText" RecordId="14" runat="server"/>
	<euc:EformHidden id="MedDate_14" Table="Medications" Field="MedDate"  RecordId="14" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="14" Table="Medications" Runat="server" id="Medication_14"  EnableHiddenOnUIEvent="MedDateText_14,MedDate_14" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_14"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="14" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_14"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="14" Table="Medications" Runat="server" id="MedSchedule_14"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_15" Table="Medications" Field="MedDateText" RecordId="15" runat="server"/>
	<euc:EformHidden id="MedDate_15" Table="Medications" Field="MedDate"  RecordId="15" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="15" Table="Medications" Runat="server" id="Medication_15"  EnableHiddenOnUIEvent="MedDateText_15,MedDate_15" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_15"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="15" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_15"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="15" Table="Medications" Runat="server" id="MedSchedule_15"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_16" Table="Medications" Field="MedDateText" RecordId="16" runat="server"/>
	<euc:EformHidden id="MedDate_16" Table="Medications" Field="MedDate"  RecordId="16" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="16" Table="Medications" Runat="server" id="Medication_16"  EnableHiddenOnUIEvent="MedDateText_16,MedDate_16" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_16"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="16" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_16"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="16" Table="Medications" Runat="server" id="MedSchedule_16"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_17" Table="Medications" Field="MedDateText" RecordId="17" runat="server"/>
	<euc:EformHidden id="MedDate_17" Table="Medications" Field="MedDate"  RecordId="17" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="17" Table="Medications" Runat="server" id="Medication_17"  EnableHiddenOnUIEvent="MedDateText_17,MedDate_17" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_17"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="17" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_17"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="17" Table="Medications" Runat="server" id="MedSchedule_17"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_18" Table="Medications" Field="MedDateText" RecordId="18" runat="server"/>
	<euc:EformHidden id="MedDate_18" Table="Medications" Field="MedDate"  RecordId="18" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="18" Table="Medications" Runat="server" id="Medication_18"  EnableHiddenOnUIEvent="MedDateText_18,MedDate_18" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_18"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="18" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_18"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="18" Table="Medications" Runat="server" id="MedSchedule_18"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_19" Table="Medications" Field="MedDateText" RecordId="19" runat="server"/>
	<euc:EformHidden id="MedDate_19" Table="Medications" Field="MedDate"  RecordId="19" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="19" Table="Medications" Runat="server" id="Medication_19"  EnableHiddenOnUIEvent="MedDateText_19,MedDate_19" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_19"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="19" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_19"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="19" Table="Medications" Runat="server" id="MedSchedule_19"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformHidden id="MedDateText_20" Table="Medications" Field="MedDateText" RecordId="20" runat="server"/>
	<euc:EformHidden id="MedDate_20" Table="Medications" Field="MedDate"  RecordId="20" runat="server"/>
    
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80"  DropDownWidth="220"  style="width:140;" Field="Medication" RecordId="20" Table="Medications" Runat="server" id="Medication_20"  EnableHiddenOnUIEvent="MedDateText_20,MedDate_20" />    </td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_20"/>&nbsp;&nbsp;</td>
    <td  style="white-space:nowrap; text-align: center;">&nbsp;<euc:EformSelect RecordId="20" LookupCode="MedUnits"  DropDownWidth="220"  TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_20"/></td>
    <td style="white-space:nowrap;">&nbsp;<euc:EformComboBox  LookupCode="MedSchedule"  DropDownWidth="285"  RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="20" Table="Medications" Runat="server" id="MedSchedule_20"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
<a href="javascript:;" onclick="return medications_showFirstAdditionalRow(this,'MedicationsHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
<br/>
<br/><br/>
