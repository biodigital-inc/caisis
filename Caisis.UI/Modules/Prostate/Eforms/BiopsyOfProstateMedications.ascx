<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateMedications" CodeFile="BiopsyOfProstateMedications.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
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
			p["medicationId"] = medId;
			
			AjaxManager.MakeRequest("POST", stopMedURL, p, generateStopMedCallback(cbox), true);
		}
	}
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="BiopsyOfProstateMedications" id="BiopsyOfProstateMedications" />
<span class="controlBoxTitle">Medications</span>
<table width="650" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px; margin-bottom:5px;">
  
  <tr>
    <td style="padding-right:20px;"><euc:EformCheckbox TABLE="NoTable" FIELD="MedicationUnchanged" Runat="server" ID="UnchangedSinceLastVisit" Value="Medication unchanged since last visit" />&nbsp;Unchanged since last visit &nbsp;</td>
    <td  align="right"><input type="checkbox" checked="checked" onclick="toggleTaggedMedications(this);" />
        <span id="medicationCheckboxMsg">Show Current Medications Only</span></td>
  </tr>
</table>

<table border="0" width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicationsHtmlTable">
  <tr> 
    <td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Agent</td>
    <td width="10%" class="controlBoxDataGridHeaderFirstCol">Dose</td>
    <td width="10%" class="controlBoxDataGridHeaderFirstCol">Dose Units </td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol">Schedule</td>
    <td width="27%" class="controlBoxDataGridHeaderFirstCol" nowrap>Stop Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="medicationsAll" runat="server"  OnItemDataBound="DecorateMedicationsAll" > 
	<ItemTemplate> 
		<tr id="_tr_" runat="server" class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDose") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedUnits") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedSchedule") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedStopDateText") %><asp:CheckBox runat="server" ID="StopDateCheckbox" Visible="false" Font-Size="9px" Text="Stop Now"/></td>
		    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
        <euc:EformComboBox id="Medication_1" Runat="server" LookupCode="Medication,PercentUsage,Top80"  RefBy="Medication" style="width:120;" Field="Medication" RecordId="1" Table="Medications"  EnableHiddenOnUIEvent="MedDataSource_1,MedQuality_1" />
        <euc:EformHidden  id="MedDataSource_1" runat="server" RecordId="1" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false" />
        <euc:EformHidden  id="MedQuality_1" runat="server" RecordId="1" Table="Medications" Field="MedQuality"  Value="STD"  Enabled="false" />
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_1"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="1" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_1"/></td>
    <td >&nbsp;<euc:EformComboBox LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="1" Table="Medications" Runat="server" id="MedSchedule_1"/></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_1" />
                                                        <euc:EformHidden Runat="server" RecordId="1" ID="MedStopDate_1" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
     <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox LookupCode="Medication,PercentUsage,Top80"  RefBy="Medication" style="width:120;" Field="Medication" RecordId="2" Table="Medications" Runat="server" id="Medication_2" EnableHiddenOnUIEvent="MedDataSource_2,MedQuality_2"/>
    <euc:EformHidden Runat="server" RecordId="2" ID="MedDataSource_2" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="2" ID="MedQuality_2" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>   
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_2"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="2" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_2"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="2" Table="Medications" Runat="server" id="MedSchedule_2"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="2" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_2"/>
                                                        <euc:EformHidden Runat="server" RecordId="2" ID="MedStopDate_2" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="3" Table="Medications" Runat="server" id="Medication_3" EnableHiddenOnUIEvent="MedDataSource_3,MedQuality_3"/>
    <euc:EformHidden Runat="server" RecordId="3" ID="MedDataSource_3" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="3" ID="MedQuality_3" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_3"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="3" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_3"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="3" Table="Medications" Runat="server" id="MedSchedule_3"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="3" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_3"/>
                                                        <euc:EformHidden Runat="server" RecordId="3" ID="MedStopDate_3" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="4" Table="Medications" Runat="server" id="Medication_4" EnableHiddenOnUIEvent="MedDataSource_4,MedQuality_4"/>
    <euc:EformHidden Runat="server" RecordId="4" ID="MedDataSource_4" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="4" ID="MedQuality_4" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_4"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="4" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_4"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="4" Table="Medications" Runat="server" id="MedSchedule_4"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="4" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_4"/>
                                                        <euc:EformHidden Runat="server" RecordId="4" ID="MedStopDate_4" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="5" Table="Medications" Runat="server" id="Medication_5" EnableHiddenOnUIEvent="MedDataSource_5,MedQuality_5" />    
    <euc:EformHidden Runat="server" RecordId="5" ID="MedDataSource_5" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="5" ID="MedQuality_5" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_5"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="5" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_5"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="5" Table="Medications" Runat="server" id="MedSchedule_5"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="5" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_5"/>
                                                        <euc:EformHidden Runat="server" RecordId="5" ID="MedStopDate_5" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="6" Table="Medications" Runat="server" id="Medication_6" EnableHiddenOnUIEvent="MedDataSource_6,MedQuality_6" />    
    <euc:EformHidden Runat="server" RecordId="6" ID="MedDataSource_6" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="6" ID="MedQuality_6" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_6"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="6" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_6"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="6" Table="Medications" Runat="server" id="MedSchedule_6"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="6" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_6"/>
                                                        <euc:EformHidden Runat="server" RecordId="6" ID="MedStopDate_6" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="7" Table="Medications" Runat="server" id="Medication_7" EnableHiddenOnUIEvent="MedDataSource_7,MedQuality_7" />    
    <euc:EformHidden Runat="server" RecordId="7" ID="MedDataSource_7" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="7" ID="MedQuality_7" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_7"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="7" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_7"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="7" Table="Medications" Runat="server" id="MedSchedule_7"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="7" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_7"/>
                                                        <euc:EformHidden Runat="server" RecordId="7" ID="MedStopDate_7" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="8" Table="Medications" Runat="server" id="Medication_8" EnableHiddenOnUIEvent="MedDataSource_8,MedQuality_8" />    
    <euc:EformHidden Runat="server" RecordId="8" ID="MedDataSource_8" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="8" ID="MedQuality_8" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_8"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="8" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_8"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="8" Table="Medications" Runat="server" id="MedSchedule_8"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="8" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_8"/>
                                                        <euc:EformHidden Runat="server" RecordId="8" ID="MedStopDate_8" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="9" Table="Medications" Runat="server" id="Medication_9" EnableHiddenOnUIEvent="MedDataSource_9,MedQuality_9" />    
    <euc:EformHidden Runat="server" RecordId="9" ID="MedDataSource_9" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="9" ID="MedQuality_9" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_9"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="9" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_9"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="9" Table="Medications" Runat="server" id="MedSchedule_9"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="9" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_9"/>
                                                        <euc:EformHidden Runat="server" RecordId="9" ID="MedStopDate_9" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="10" Table="Medications" Runat="server" id="Medication_10" EnableHiddenOnUIEvent="MedDataSource_10,MedQuality_10" />    
    <euc:EformHidden Runat="server" RecordId="10" ID="MedDataSource_10" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="10" ID="MedQuality_10" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_10"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="10" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_10"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="10" Table="Medications" Runat="server" id="MedSchedule_10"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="10" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_10"/>
                                                        <euc:EformHidden Runat="server" RecordId="10" ID="MedStopDate_10" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="11" Table="Medications" Runat="server" id="Medication_11" EnableHiddenOnUIEvent="MedDataSource_11,MedQuality_11" />    
    <euc:EformHidden Runat="server" RecordId="11" ID="MedDataSource_11" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="11" ID="MedQuality_11" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_11"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="11" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_11"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="11" Table="Medications" Runat="server" id="MedSchedule_11"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="11" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_11"/>
                                                        <euc:EformHidden Runat="server" RecordId="11" ID="MedStopDate_11" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="12" Table="Medications" Runat="server" id="Medication_12" EnableHiddenOnUIEvent="MedDataSource_12,MedQuality_12" />    
    <euc:EformHidden Runat="server" RecordId="12" ID="MedDataSource_12" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="12" ID="MedQuality_12" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_12"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="12" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_12"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="12" Table="Medications" Runat="server" id="MedSchedule_12"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="12" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_12"/>
                                                        <euc:EformHidden Runat="server" RecordId="12" ID="MedStopDate_12" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="13" Table="Medications" Runat="server" id="Medication_13" EnableHiddenOnUIEvent="MedDataSource_13,MedQuality_13" />    
    <euc:EformHidden Runat="server" RecordId="13" ID="MedDataSource_13" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="13" ID="MedQuality_13" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_13"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="13" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_13"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="13" Table="Medications" Runat="server" id="MedSchedule_13"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="13" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_13"/>
                                                        <euc:EformHidden Runat="server" RecordId="13" ID="MedStopDate_13" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="14" Table="Medications" Runat="server" id="Medication_14" EnableHiddenOnUIEvent="MedDataSource_14,MedQuality_14" />   
    <euc:EformHidden Runat="server" RecordId="14" ID="MedDataSource_14" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="14" ID="MedQuality_14" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_14"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="14" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_14"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="14" Table="Medications" Runat="server" id="MedSchedule_14"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="14" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_14"/>
                                                        <euc:EformHidden Runat="server" RecordId="14" ID="MedStopDate_14" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="15" Table="Medications" Runat="server" id="Medication_15"  EnableHiddenOnUIEvent="MedDataSource_15,MedQuality_15"/>    
    <euc:EformHidden Runat="server" RecordId="15" ID="MedDataSource_15" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="15" ID="MedQuality_15" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_15"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="15" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_15"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="15" Table="Medications" Runat="server" id="MedSchedule_15"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="15" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_15"/>
                                                        <euc:EformHidden Runat="server" RecordId="15" ID="MedStopDate_15" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="16" Table="Medications" Runat="server" id="Medication_16" EnableHiddenOnUIEvent="MedDataSource_16,MedQuality_16" />    
    <euc:EformHidden Runat="server" RecordId="16" ID="MedDataSource_16" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="16" ID="MedQuality_16" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_16"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="16" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_16"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="16" Table="Medications" Runat="server" id="MedSchedule_16"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="16" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_16"/>
                                                        <euc:EformHidden Runat="server" RecordId="16" ID="MedStopDate_16" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="17" Table="Medications" Runat="server" id="Medication_17" EnableHiddenOnUIEvent="MedDataSource_17,MedQuality_17" />    
    <euc:EformHidden Runat="server" RecordId="17" ID="MedDataSource_17" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="17" ID="MedQuality_17" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_17"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="17" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_17"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="17" Table="Medications" Runat="server" id="MedSchedule_17"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="17" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_17"/>
                                                        <euc:EformHidden Runat="server" RecordId="17" ID="MedStopDate_17" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="18" Table="Medications" Runat="server" id="Medication_18" EnableHiddenOnUIEvent="MedDataSource_18,MedQuality_18" />    
    <euc:EformHidden Runat="server" RecordId="18" ID="MedDataSource_18" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="18" ID="MedQuality_18" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_18"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="18" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_18"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="18" Table="Medications" Runat="server" id="MedSchedule_18"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="18" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_18"/>
                                                        <euc:EformHidden Runat="server" RecordId="18" ID="MedStopDate_18" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="19" Table="Medications" Runat="server" id="Medication_19" EnableHiddenOnUIEvent="MedDataSource_19,MedQuality_19" />   
    <euc:EformHidden Runat="server" RecordId="19" ID="MedDataSource_19" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="19" ID="MedQuality_19" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_19"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="19" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_19"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="19" Table="Medications" Runat="server" id="MedSchedule_19"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="19" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_19"/>
                                                        <euc:EformHidden Runat="server" RecordId="19" ID="MedStopDate_19" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;
    <euc:EformComboBox  LookupCode="Medication,PercentUsage,Top80" RefBy="Medication" style="width:120;" Field="Medication" RecordId="20" Table="Medications" Runat="server" id="Medication_20" EnableHiddenOnUIEvent="MedDataSource_20,MedQuality_20" />    
    <euc:EformHidden Runat="server" RecordId="20" ID="MedDataSource_20" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false"/>
    <euc:EformHidden Runat="server" RecordId="20" ID="MedQuality_20" Table="Medications" Field="MedQuality"  Value="STD" Enabled="false"/>
    </td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_20"/>&nbsp;&nbsp;</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect RecordId="20" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_20"/></td>
    <td >&nbsp;<euc:EformComboBox  LookupCode="MedSchedule" RefBy="MedSchedule" style="width:70;" Field="MedSchedule" RecordId="20" Table="Medications" Runat="server" id="MedSchedule_20"  /></td>
    <td  style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="20" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_20"/>
                                                        <euc:EformHidden Runat="server" RecordId="20" ID="MedStopDate_20" Table="Medications" Field="MedStopDate" />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>

</table>
<a href="javascript:;" onclick="return medications_showFirstAdditionalRow(this,'MedicationsHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
<br/>
<br/><br/>
