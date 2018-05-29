<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.MedicationsWithSchedule" CodeFile="MedicationsWithSchedule.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">

	tableArray.MedicationsWithScheduleHtmlTable = "MedicationsWithScheduleHtmlTable";

	function modTaggedMedications(mode)
	{
		var table = document.getElementById('MedicationsWithScheduleHtmlTable');
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
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<a name="MedicationsWithSchedule" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medications"></asp:Label>
<img src="../../Images/shim.gif" width="50" height="1" border="0"><input type="checkbox" checked onclick="toggleTaggedMedications(this);"  /> <span id="medicationCheckboxMsg">Show Current Medications Only</span>
<br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicationsWithScheduleHtmlTable">
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
  
  
  <asp:Repeater ID="medicationsAll" runat="server" OnItemDataBound="DecorateMedicationsAll" > 
	<ItemTemplate> 
		<tr id="_tr_" runat="server" class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDateText")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedDose")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedUnits") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedRoute")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedSchedule")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedStopDateText")%><asp:CheckBox runat="server" ID="StopDateCheckbox" Visible="false" Font-Size="9px" Text="Stop Now"/>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="1" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_1"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="1" TABLE="Medications" FIELD="MedDate"         ID="MedDate_1"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:120px;" RecordId="1" TABLE="Medications" FIELD="Medication"      ID="Medication_1"      Runat="server" LookupCode="Medication,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="1" TABLE="Medications" FIELD="MedDose"         ID="MedDose_1"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:65px;" RecordId="1" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_1"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:80px;" RecordId="1" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_1"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="1" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_1"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="1" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_1" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="1" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_1"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="2" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_2"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="2" TABLE="Medications" FIELD="MedDate"         ID="MedDate_2"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:120px;" RecordId="2" TABLE="Medications" FIELD="Medication"      ID="Medication_2"      Runat="server" LookupCode="Medication,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="2" TABLE="Medications" FIELD="MedDose"         ID="MedDose_2"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:65px;" RecordId="2" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_2"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:80px;" RecordId="2" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_2"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="2" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_2"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="2" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_2" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="2" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_2"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr> 
   <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="3" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_3"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="3" TABLE="Medications" FIELD="MedDate"         ID="MedDate_3"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:120px;" RecordId="3" TABLE="Medications" FIELD="Medication"      ID="Medication_3"      Runat="server" LookupCode="Medication,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="3" TABLE="Medications" FIELD="MedDose"         ID="MedDose_3"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:65px;" RecordId="3" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_3"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:80px;" RecordId="3" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_3"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="3" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_3"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="3" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_3" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="3" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_3"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="4" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_4"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="4" TABLE="Medications" FIELD="MedDate"         ID="MedDate_4"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:120px;" RecordId="4" TABLE="Medications" FIELD="Medication"      ID="Medication_4"      Runat="server" LookupCode="Medication,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="4" TABLE="Medications" FIELD="MedDose"         ID="MedDose_4"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:65px;" RecordId="4" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_4"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:80px;" RecordId="4" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_4"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="4" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_4"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="4" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_4" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="4" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_4"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="5" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_5"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="5" TABLE="Medications" FIELD="MedDate"         ID="MedDate_5"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:120px;" RecordId="5" TABLE="Medications" FIELD="Medication"      ID="Medication_5"      Runat="server" LookupCode="Medication,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="5" TABLE="Medications" FIELD="MedDose"         ID="MedDose_5"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:65px;" RecordId="5" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_5"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:80px;" RecordId="5" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_5"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="5" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_5"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="5" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_5" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="5" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_5"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="6" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_6"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="6" TABLE="Medications" FIELD="MedDate"         ID="MedDate_6"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:120px;" RecordId="6" TABLE="Medications" FIELD="Medication"      ID="Medication_6"      Runat="server" LookupCode="Medication,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="6" TABLE="Medications" FIELD="MedDose"         ID="MedDose_6"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:65px;" RecordId="6" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_6"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:80px;" RecordId="6" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_6"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="6" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_6"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="6" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_6" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="6" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_6"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="7" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_7"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="7" TABLE="Medications" FIELD="MedDate"         ID="MedDate_7"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:120px;" RecordId="7" TABLE="Medications" FIELD="Medication"      ID="Medication_7"      Runat="server" LookupCode="Medication,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="7" TABLE="Medications" FIELD="MedDose"         ID="MedDose_7"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:65px;" RecordId="7" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_7"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:80px;" RecordId="7" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_7"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="7" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_7"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="7" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_7" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="7" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_7"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="8" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_8"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="8" TABLE="Medications" FIELD="MedDate"         ID="MedDate_8"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:120px;" RecordId="8" TABLE="Medications" FIELD="Medication"      ID="Medication_8"      Runat="server" LookupCode="Medication,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="8" TABLE="Medications" FIELD="MedDose"         ID="MedDose_8"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:65px;" RecordId="8" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_8"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:80px;" RecordId="8" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_8"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="8" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_8"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="8" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_8" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="8" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_8"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="9" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_9"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="9" TABLE="Medications" FIELD="MedDate"         ID="MedDate_9"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:120px;" RecordId="9" TABLE="Medications" FIELD="Medication"      ID="Medication_9"      Runat="server" LookupCode="Medication,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="9" TABLE="Medications" FIELD="MedDose"         ID="MedDose_9"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:65px;" RecordId="9" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_9"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:80px;" RecordId="9" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_9"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="9" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_9"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="9" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_9" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="9" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_9"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="10" TABLE="Medications" FIELD="MedDateText"     ID="MedDateText_10"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="10" TABLE="Medications" FIELD="MedDate"         ID="MedDate_10"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:120px;" RecordId="10" TABLE="Medications" FIELD="Medication"      ID="Medication_10"      Runat="server" LookupCode="Medication,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="10" TABLE="Medications" FIELD="MedDose"         ID="MedDose_10"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:65px;" RecordId="10" TABLE="Medications" FIELD="MedUnits"        ID="MedUnits_10"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"    style="width:80px;" RecordId="10" TABLE="Medications" FIELD="MedRoute"        ID="MedRoute_10"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="10" TABLE="Medications" FIELD="MedSchedule"     ID="MedSchedule_10"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="10" TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_10" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="10" TABLE="Medications" FIELD="MedStopDate"     ID="MedStopDate_10"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>  

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicationsWithScheduleHtmlTable');" />
<br/><br/>
<br/>


