<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.Exam_Survivorship" CodeFile="Exam_Survivorship.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<script type="text/javascript">
function processExamSystemLabels()
{
	var systemLabels = jQuery('span[id*="Exam_System_"]');
	var num = systemLabels.size();
	
	systemLabels.each(function(index) {
		var next = systemLabels.eq(index+1);
		if (index < (num-1) && (jQuery(this).text() == jQuery(next).text())) {
			jQuery(next).css('display','none');
			jQuery(next).parent().css({'border-top': 'none'});
			jQuery(this).parent().css({'border-bottom': 'none'});
		}
	});
	
	
	systemLabels.each(function(index) {
	jQuery(this).text(function(index, text) {
		    var systemDisplayName = '';
			switch(text)
			{
			case 'Constitution':
			  systemDisplayName = 'Gen';
			  break;
			case 'Neurology':
			  systemDisplayName = 'Neuro';
			  break;
			case 'Ears / Nose / Throat':
			  systemDisplayName = 'ENT';
			  break;
			case 'Respiratory':
			  systemDisplayName = 'Resp';
			  break;
			case 'Cardiovascular':
			  systemDisplayName = 'C/V';
			  break;
			case 'Genitourinary':
			  systemDisplayName = 'GU Male';
			  break;
			case 'Musculoskeletal':
			  systemDisplayName = 'M/S';
			  break;
			case 'Neurological':
			  systemDisplayName = 'Neuro';
			  break;
			default:
			  systemDisplayName = text;
			}
			
			return systemDisplayName;
		});
	});
	
}


</script>

<style type="text/css">
tr.Exam_DefaultDataEntryRow td
{
	empty-cells:show;
}
</style>


<a name="Exam_Survivorship" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Exam" ></asp:Label>
Clinician(s) Performing Initial Exam:

<euc:EformCheckBox  Text="PA/NP" TABLE="NoTable" FIELD="Exam_Clinician_PANP" Runat="server" ID="Exam_Clinician_PANP" Value="True" />
<euc:EformCheckBox  Text="Fellow" TABLE="NoTable" FIELD="Exam_Clinician_Fellow" Runat="server" ID="Exam_Clinician_Fellow" Value="True" />
<euc:EformCheckBox  Text="Attending" TABLE="NoTable" FIELD="Exam_Clinician_Attending" Runat="server" ID="Exam_Clinician_Attending" Value="True" onclick="CheckAllWidgetsInColBasedOnCheckboxAndRadios(this, 'ExamsHtmlTable', 5, 8)" />

<br/>
<table width="700" border="0" cellspacing="0" cellpadding="1" style="border: solid 1px #cccccc; border-collapse: collapse;" id="ExamsHtmlTable">
  
  <tr>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol">System</td>
    <td colspan="2" align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol" ><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="checkAllWidgetsInColumn('ExamsHtmlTable', 2, 8);setAllAttendingPerformed();" style="margin-bottom:3px;" /><br/>Normal Findings</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">    <img src="../../Images/EFormCheckAll.gif" width="28" height="11" hspace="16" class="ClickableImage"  style="margin-bottom:3px;" onclick="checkAllWidgetsInColumn('ExamsHtmlTable', 3, 8);setAllAttendingPerformed();" /><br />Abnormal</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;" nowrap><img src="../../Images/EFormCheckAll.gif" width="28" height="11" hspace="16" class="ClickableImage"  style="margin-bottom:3px;" onclick="checkAllWidgetsInColumn('ExamsHtmlTable', 4, 8);setAllAttendingPerformed();" /><br />
    Not Done </td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Attending Performed </td>
    <td width="40%" valign="bottom" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_1" runat="server" DefaultField="EncExams.ExamSystem,1" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_1" runat="server" DefaultField="EncExams.Exam,1" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_1" RecordId="1" GroupName="ExamResultGroup_1" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_1" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_1" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_1" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_1" Value="1" RecordId="1" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_1"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_1"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_2" runat="server" DefaultField="EncExams.ExamSystem,2" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_2" runat="server" DefaultField="EncExams.Exam,2" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_2" RecordId="2" GroupName="ExamResultGroup_2" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_2" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_2" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_2" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_2" Value="1" RecordId="2" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_2"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_2"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_3" runat="server" DefaultField="EncExams.ExamSystem,3" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_3" runat="server" DefaultField="EncExams.Exam,3" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_3" RecordId="3" GroupName="ExamResultGroup_3" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_3" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_3" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_3" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_3" Value="1" RecordId="3" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_3"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_3"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_4" runat="server" DefaultField="EncExams.ExamSystem,4" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_4" runat="server" DefaultField="EncExams.Exam,4" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_4" RecordId="4" GroupName="ExamResultGroup_4" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_4" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_4" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_4" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_4" Value="1" RecordId="4" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_4"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_4"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_5" runat="server" DefaultField="EncExams.ExamSystem,5" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_5" runat="server" DefaultField="EncExams.Exam,5" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_5" RecordId="5" GroupName="ExamResultGroup_5" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_5" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_5" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_5" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_5" Value="1" RecordId="5" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_5"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_5"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_6" runat="server" DefaultField="EncExams.ExamSystem,6" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_6" runat="server" DefaultField="EncExams.Exam,6" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_6" RecordId="6" GroupName="ExamResultGroup_6" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_6" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_6" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_6" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_6" Value="1" RecordId="6" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_6"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_6"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_7" runat="server" DefaultField="EncExams.ExamSystem,7" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_7" runat="server" DefaultField="EncExams.Exam,7" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_7" RecordId="7" GroupName="ExamResultGroup_7" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_7" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_7" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_7" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_7" Value="1" RecordId="7" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_7"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_7"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_8" runat="server" DefaultField="EncExams.ExamSystem,8" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_8" runat="server" DefaultField="EncExams.Exam,8" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_8" RecordId="8" GroupName="ExamResultGroup_8" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_8" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_8" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_8" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_8" Value="1" RecordId="8" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_8"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_8"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_9" runat="server" DefaultField="EncExams.ExamSystem,9" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_9" runat="server" DefaultField="EncExams.Exam,9" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_9" RecordId="9" GroupName="ExamResultGroup_9" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_9" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_9" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_9" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_9" Value="1" RecordId="9" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_9"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_9"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_10" runat="server" DefaultField="EncExams.ExamSystem,10" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_10" runat="server" DefaultField="EncExams.Exam,10" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_10" RecordId="10" GroupName="ExamResultGroup_10" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_10" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_10" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_10" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_10" Value="1" RecordId="10" /></td>
<td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_10"/></td>    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_10"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_11" runat="server" DefaultField="EncExams.ExamSystem,11" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_11" runat="server" DefaultField="EncExams.Exam,11" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_11" RecordId="11" GroupName="ExamResultGroup_11" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_11" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_11" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_11" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_11" Value="1" RecordId="11" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_11"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_11"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_12" runat="server" DefaultField="EncExams.ExamSystem,12" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_12" runat="server" DefaultField="EncExams.Exam,12" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_12" RecordId="12" GroupName="ExamResultGroup_12" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_12" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_12" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_12" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_12" Value="1" RecordId="12" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_12"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_12"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_13" runat="server" DefaultField="EncExams.ExamSystem,13" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_13" runat="server" DefaultField="EncExams.Exam,13" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_13" RecordId="13" GroupName="ExamResultGroup_13" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_13" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_13" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_13" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_13" Value="1" RecordId="13" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_13"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_13"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_14" runat="server" DefaultField="EncExams.ExamSystem,14" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_14" runat="server" DefaultField="EncExams.Exam,14" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_14" RecordId="14" GroupName="ExamResultGroup_14" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_14" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_14" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_14" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_14" Value="1" RecordId="14" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_14"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_14"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_15" runat="server" DefaultField="EncExams.ExamSystem,15" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_15" runat="server" DefaultField="EncExams.Exam,15" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_15" RecordId="15" GroupName="ExamResultGroup_15" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_15" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_15" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_15" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_15" Value="1" RecordId="15" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_15"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_15"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_16" runat="server" DefaultField="EncExams.ExamSystem,16" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_16" runat="server" DefaultField="EncExams.Exam,16" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_16" RecordId="16" GroupName="ExamResultGroup_16" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_16" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_16" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_16" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_16" Value="1" RecordId="16" /></td>
    <td class="ControlBoxLinedRows" align="center">
	Circumcised: <euc:EformRadioButtonList id="ExamNotes_16" Runat="server" TABLE="EncExams" FIELD="ExamNotes" RecordId="16" Uncheckable="true" RepeatDirection="Horizontal" RepeatLayout="Flow" >
		    <asp:ListItem Text="Yes" Value="Circumcised: Yes"></asp:ListItem>
		    <asp:ListItem Text="No" Value="Circumcised: No"></asp:ListItem>
		</euc:EformRadioButtonList></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_16"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_17" runat="server" DefaultField="EncExams.ExamSystem,17" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_17" runat="server" DefaultField="EncExams.Exam,17" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_17" RecordId="17" GroupName="ExamResultGroup_17" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_17" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_17" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_17" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_17" Value="1" RecordId="17" /></td>
    <td class="ControlBoxLinedRows" align="center">
	Stool Sent for Guiac: <euc:EformRadioButtonList id="ExamNotes_17" Runat="server" TABLE="EncExams" FIELD="ExamNotes" RecordId="17" Uncheckable="true" RepeatDirection="Horizontal" RepeatLayout="Flow" >
		    <asp:ListItem Text="Yes" Value="Stool Sent for Guiac: Yes"></asp:ListItem>
		    <asp:ListItem Text="No" Value="Stool Sent for Guiac: No"></asp:ListItem>
		</euc:EformRadioButtonList></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_17"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_18" runat="server" DefaultField="EncExams.ExamSystem,18" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_18" runat="server" DefaultField="EncExams.Exam,18" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_18" RecordId="18" GroupName="ExamResultGroup_18" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_18" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_18" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_18" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_18" Value="1" RecordId="18" /></td>
    <td class="ControlBoxLinedRows" align="center">PVR: <euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_18"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_18"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_19" runat="server" DefaultField="EncExams.ExamSystem,19" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_19" runat="server" DefaultField="EncExams.Exam,19" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_19" RecordId="19" GroupName="ExamResultGroup_19" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_19" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_19" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_19" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_19" Value="1" RecordId="19" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_19"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_19"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_20" runat="server" DefaultField="EncExams.ExamSystem,20" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_20" runat="server" DefaultField="EncExams.Exam,20" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_20" RecordId="20" GroupName="ExamResultGroup_20" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_20" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_20" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_20" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_20" Value="1" RecordId="20" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_20"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_20"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_21" runat="server" DefaultField="EncExams.ExamSystem,21" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_21" runat="server" DefaultField="EncExams.Exam,21" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_21" RecordId="21" GroupName="ExamResultGroup_21" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_21" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_21" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_21" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_21" Value="1" RecordId="21" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_21"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_21"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_22" runat="server" DefaultField="EncExams.ExamSystem,22" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_22" runat="server" DefaultField="EncExams.Exam,22" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_22" RecordId="22" GroupName="ExamResultGroup_22" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_22" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_22" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_22" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_22" Value="1" RecordId="22" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_22"/>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_22"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_23" runat="server" DefaultField="EncExams.ExamSystem,23" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_23" runat="server" DefaultField="EncExams.Exam,23" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_23" RecordId="23" GroupName="ExamResultGroup_23" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_23" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_23" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_23" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_23" Value="1" RecordId="23" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_23"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_23"/></td>
  </tr>
  
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_24" runat="server" DefaultField="EncExams.ExamSystem,24" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_24" runat="server" DefaultField="EncExams.Exam,24" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_24" RecordId="24" GroupName="ExamResultGroup_24" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_24" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_24" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_24" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_24" Value="1" RecordId="24" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="24" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_24"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_24"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_25" runat="server" DefaultField="EncExams.ExamSystem,25" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_25" runat="server" DefaultField="EncExams.Exam,25" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_25" RecordId="25" GroupName="ExamResultGroup_25" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_25" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_25" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_25" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_25" Value="1" RecordId="25" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="25" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_25"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_25"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_26" runat="server" DefaultField="EncExams.ExamSystem,26" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_26" runat="server" DefaultField="EncExams.Exam,26" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_26" RecordId="26" GroupName="ExamResultGroup_26" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_26" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_26" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_26" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_26" Value="1" RecordId="26" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="26" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_26"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_26"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="Exam_System_27" runat="server" DefaultField="EncExams.ExamSystem,27" /></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformDefaultLabel ID="Exam_27" runat="server" DefaultField="EncExams.Exam,27" /></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_27" RecordId="27" GroupName="ExamResultGroup_27" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButton Id="ExamResultNormal_27" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultAbnormal_27" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ExamResultNotDone_27" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_27" Value="1" RecordId="27" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="27" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_27"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_27"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Other</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">&nbsp;</td>
    <td class="ControlBoxLinedRowsShaded" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformSelect RecordId="28" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_28" style="width: 50px;"/></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformSelect RecordId="28" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_28" style="width: 130px;"/></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_28" RecordId="28" GroupName="ExamResultGroup_28" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><span><span><euc:EformRadioButton Id="ExamResultNormal_28" Value="Normal" runat="server"/></span></span></td>
		<td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="ExamResultAbnormal_28" Value="Abnormal" runat="server"/></span></span></td>
		<td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="ExamResultNotDone_28" Value="Not Done" runat="server"/></span></span></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_28" Value="1" RecordId="28" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="28" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_28"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_28"/></td>
  </tr>
  <tr class="Exam_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformSelect RecordId="29" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_29" style="width: 50px;"/></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformSelect RecordId="29" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_29" style="width: 130px;"/></td>
	<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_29" RecordId="29" GroupName="ExamResultGroup_29" runat="server">
		<td class="ControlBoxLinedRowsShaded" align="center"><span><span><euc:EformRadioButton Id="ExamResultNormal_29" Value="Normal" runat="server"/></span></span></td>
		<td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="ExamResultAbnormal_29" Value="Abnormal" runat="server"/></span></span></td>
		<td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="ExamResultNotDone_29" Value="Not Done" runat="server"/></span></span></td>
	</euc:EformRadioButtonGroup>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_29" Value="1" RecordId="29" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="29" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_29"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="ExamDeleteIcon_29"/></td>
  </tr>

</table>
<br/>
<br/>
<br/>
<script type="text/javascript">


processExamSystemLabels();

function addAttendingPerformedTriggers()
{
    var container = $('ExamsHtmlTable');
    var inputs = container.getElementsByTagName('input');
    for (var i=0;i<inputs.length;i++)
    {
	    var inputType = inputs[i].getAttribute('type');
	    
	    if (inputType == 'radio')
	    {
             inputs[i].onclick = function() {setAttendingPerformed(this)};
	    } 
    }
    
}
addAttendingPerformedTriggers();

function setAttendingPerformed(ExamRadio)
{
    var masterAttendPerf = $('<% = Exam_Clinician_Attending.ClientID %>');
    var ExamTr = ExamRadio.parentNode.parentNode.parentNode;
    var attendPerf = AttendingPerformedRowItem(ExamTr);
    
    if (attendPerf != null)
    {
        if (ExamRadio.value.indexOf('NotDone') < 0)
        {
            if (masterAttendPerf.checked == true && ExamRadio.checked == true) {attendPerf.checked = true;}
	    }
	    else {attendPerf.checked = false;}
	}
}

function AttendingPerformedRowItem(row)
{
    var inputs = row.getElementsByTagName('input');
    var targetCb = null;
    
    for (var i=0;i<inputs.length;i++)
    {
	    var inputType = inputs[i].getAttribute('type');
	    
	    if (inputType == 'checkbox')
	    {
             targetCb = inputs[i];
             break;
	    } 
    }
    
    return targetCb;
}
function setAllAttendingPerformed()
{
    var container = $('ExamsHtmlTable');
    var inputs = container.getElementsByTagName('input');
    for (var i=0;i<inputs.length;i++)
    {
	    var inputType = inputs[i].getAttribute('type');
	    
	    if (inputType == 'radio' && inputs[i].checked == true)
	    {
            setAttendingPerformed(inputs[i]);
	    } 
    }
}

</script>