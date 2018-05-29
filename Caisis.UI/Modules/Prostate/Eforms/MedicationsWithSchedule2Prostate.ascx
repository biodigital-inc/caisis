<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.MedicationsWithSchedule2Prostate" CodeFile="MedicationsWithSchedule2Prostate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.MedicationsWithScheduleHtmlTable2 = "MedicationsWithScheduleHtmlTable2";

	function modTaggedMedications(mode)
	{
		var table = document.getElementById('MedicationsWithScheduleHtmlTable2');
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


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="MedicationsWithSchedule2Prostate" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medications"></asp:Label>
<img alt="" src="../../Images/shim.gif" width="50" height="1" border="0"/><input type="checkbox" checked="checked" onclick="toggleTaggedMedications(this);"  /> <span id="medicationCheckboxMsg">Show Current Medications Only</span>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicationsWithScheduleHtmlTable2">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">&nbsp;Start Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Medication</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Dose</td>
     <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Unit</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Route</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Schedule</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="medicationsAllProstate" runat="server" OnItemDataBound="DecorateMedicationsAll" > 
	<ItemTemplate> 
		<tr id="_tr_" runat="server" class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDateText")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedDose")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedUnits") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedRoute")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedSchedule")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedStopDateText")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="11" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_11"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="11" TABLE="Medications" FIELD="MedDate"         ID="MedDate_11"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:120px;" RecordId="11" TABLE="Medications" FIELD="Medication"      ID="Medication_11"      Runat="server" LookupCode="Medication,Disease,Prostate"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="11" TABLE="Medications" FIELD="MedDose"         ID="MedDose_11"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:65px;" RecordId="11" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_11"        Runat="server" LookupCode="MedUnits"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:80px;" RecordId="11" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_11"        Runat="server" LookupCode="MedRoute"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="11" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_11"     Runat="server" LookupCode="MedSchedule" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="11" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_11" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="11" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_11"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>  
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="12" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_12"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="12" TABLE="Medications" FIELD="MedDate"         ID="MedDate_12"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:120px;" RecordId="12" TABLE="Medications" FIELD="Medication"      ID="Medication_12"      Runat="server" LookupCode="Medication,Disease,Prostate"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="12" TABLE="Medications" FIELD="MedDose"         ID="MedDose_12"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:65px;" RecordId="12" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_12"        Runat="server" LookupCode="MedUnits"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:80px;" RecordId="12" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_12"        Runat="server" LookupCode="MedRoute"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="12" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_12"     Runat="server" LookupCode="MedSchedule" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="12" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_12" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="12" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_12"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>  
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="13" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_13"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="13" TABLE="Medications" FIELD="MedDate"         ID="MedDate_13"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:120px;" RecordId="13" TABLE="Medications" FIELD="Medication"      ID="Medication_13"      Runat="server" LookupCode="Medication,Disease,Prostate"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="13" TABLE="Medications" FIELD="MedDose"         ID="MedDose_13"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:65px;" RecordId="13" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_13"        Runat="server" LookupCode="MedUnits"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:80px;" RecordId="13" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_13"        Runat="server" LookupCode="MedRoute"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="13" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_13"     Runat="server" LookupCode="MedSchedule" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="13" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_13" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="13" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_13"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr> 
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="14" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_14"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="14" TABLE="Medications" FIELD="MedDate"         ID="MedDate_14"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:120px;" RecordId="14" TABLE="Medications" FIELD="Medication"      ID="Medication_14"      Runat="server" LookupCode="Medication,Disease,Prostate"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:6px;"  RecordId="14" TABLE="Medications" FIELD="MedDose"         ID="MedDose_14"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:65px;" RecordId="14" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_14"        Runat="server" LookupCode="MedUnits"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:80px;" RecordId="14" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_14"        Runat="server" LookupCode="MedRoute"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="14" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_14"     Runat="server" LookupCode="MedSchedule" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="14" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_14" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="14" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_14"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr> 
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="15" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_15"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="15" TABLE="Medications" FIELD="MedDate"         ID="MedDate_15"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:120px;" RecordId="15" TABLE="Medications" FIELD="Medication"      ID="Medication_15"      Runat="server" LookupCode="Medication,Disease,Prostate"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="15" TABLE="Medications" FIELD="MedDose"         ID="MedDose_15"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:65px;" RecordId="15" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_15"        Runat="server" LookupCode="MedUnits"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:80px;" RecordId="15" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_15"        Runat="server" LookupCode="MedRoute"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="15" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_15"     Runat="server" LookupCode="MedSchedule" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="15" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_15" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="15" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_15"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr> 
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="16" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_16"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="16" TABLE="Medications" FIELD="MedDate"         ID="MedDate_16"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:120px;" RecordId="16" TABLE="Medications" FIELD="Medication"      ID="Medication_16"      Runat="server" LookupCode="Medication,Disease,Prostate"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="16" TABLE="Medications" FIELD="MedDose"         ID="MedDose_16"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:65px;" RecordId="16" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_16"        Runat="server" LookupCode="MedUnits"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:80px;" RecordId="16" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_16"        Runat="server" LookupCode="MedRoute"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="16" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_16"     Runat="server" LookupCode="MedSchedule" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="16" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_16" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="16" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_16"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr> 
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="17" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_17"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="17" TABLE="Medications" FIELD="MedDate"         ID="MedDate_17"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:120px;" RecordId="17" TABLE="Medications" FIELD="Medication"      ID="Medication_17"      Runat="server" LookupCode="Medication,Disease,Prostate"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="17" TABLE="Medications" FIELD="MedDose"         ID="MedDose_17"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:65px;" RecordId="17" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_17"        Runat="server" LookupCode="MedUnits"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:80px;" RecordId="17" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_17"        Runat="server" LookupCode="MedRoute"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="17" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_17"     Runat="server" LookupCode="MedSchedule" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="17" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_17" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="17" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_17"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr> 
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="18" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_18"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="18" TABLE="Medications" FIELD="MedDate"         ID="MedDate_18"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:120px;" RecordId="18" TABLE="Medications" FIELD="Medication"      ID="Medication_18"      Runat="server" LookupCode="Medication,Disease,Prostate"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="18" TABLE="Medications" FIELD="MedDose"         ID="MedDose_18"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:65px;" RecordId="18" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_18"        Runat="server" LookupCode="MedUnits"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:80px;" RecordId="18" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_18"        Runat="server" LookupCode="MedRoute"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="18" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_18"     Runat="server" LookupCode="MedSchedule" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="18" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_18" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="18" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_18"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr> 
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="19" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_19"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="19" TABLE="Medications" FIELD="MedDate"         ID="MedDate_19"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:120px;" RecordId="19" TABLE="Medications" FIELD="Medication"      ID="Medication_19"      Runat="server" LookupCode="Medication,Disease,Prostate"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="19" TABLE="Medications" FIELD="MedDose"         ID="MedDose_19"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:65px;" RecordId="19" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_19"        Runat="server" LookupCode="MedUnits"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:80px;" RecordId="19" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_19"        Runat="server" LookupCode="MedRoute"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="19" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_19"     Runat="server" LookupCode="MedSchedule" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="19" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_19" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="19" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_19"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr> 
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="20" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_20"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="20" TABLE="Medications" FIELD="MedDate"         ID="MedDate_20"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:120px;" RecordId="20" TABLE="Medications" FIELD="Medication"      ID="Medication_20"      Runat="server" LookupCode="Medication,Disease,Prostate"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="20" TABLE="Medications" FIELD="MedDose"         ID="MedDose_20"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:65px;" RecordId="20" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_20"        Runat="server" LookupCode="MedUnits"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"    style="width:80px;" RecordId="20" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_20"        Runat="server" LookupCode="MedRoute"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="20" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_20"     Runat="server" LookupCode="MedSchedule" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="20" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_20" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                      RecordId="20" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_20"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>   
  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicationsWithScheduleHtmlTable2');" />
<br/><br/>
<br/>


