<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.Exam_UroSexualFU" CodeFile="Exam_UroSexualFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Exam_UroSexualFU" /><span class="controlBoxTitle">Exam</span><br />
Clinician(s) Performing Initial Exam:

<euc:EformCheckBox  Text="PA/NP" TABLE="NoTable" FIELD="Exam_Clinician_PANP" Runat="server" ID="Exam_Clinician_PANP" Value="True" />
<euc:EformCheckBox  Text="Fellow" TABLE="NoTable" FIELD="Exam_Clinician_Fellow" Runat="server" ID="Exam_Clinician_Fellow" Value="True" />
<euc:EformCheckBox  Text="Attending" TABLE="NoTable" FIELD="Exam_Clinician_Attending" Runat="server" ID="Exam_Clinician_Attending" Value="True" onclick="CheckAllWidgetsInColBasedOnCheckboxAndRadios(this, 'ExamsHtmlTable', 5, 8)" />

<br/><img src="../../Images/shim.gif" width="1" height="10" /><br/>
<table width="650" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ExamsHtmlTable">
  
  <tr>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol">System</td>
    <td colspan="2" align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol" >Normal Findings<br /><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ExamsHtmlTable', 2, 8);" style="margin-bottom:3px;" /></td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Abnormal<br /><img src="../../Images/EFormCheckAll.gif" width="28" height="11" hspace="16" class="ClickableImage"  style="margin-bottom:3px;" onclick="return checkAllWidgetsInColumn('ExamsHtmlTable', 3, 8);" /></td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;" nowrap>Not Done<br /><img src="../../Images/EFormCheckAll.gif" width="28" height="11" hspace="16" class="ClickableImage"  style="margin-bottom:3px;" onclick="return checkAllWidgetsInColumn('ExamsHtmlTable', 4, 8);" /></td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Attending Performed </td>
    <td width="40%" valign="bottom" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="3" valign="top" class="ControlBoxLinedRowsShaded">Gen</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">Well Developed / Well Nourished</td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_WellDevelopedNourished" RecordId="1" GroupName="WellDevelopedNourished" runat="server"
			Field1="ExamSystem" Value1="Constitution"
			Field2="Exam" Value2="Well Developed / Well Nourished">
	<euc:EformRadioButton Id="WellDevelopedNourishedNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="WellDevelopedNourishedAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="WellDevelopedNourishedNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_WellDevelopedNourished" Value="1" RecordId="1" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_WellDevelopedNourished"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Acute Distress</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoAcuteDistress" RecordId="2" GroupName="NoAcuteDistress" runat="server"
			Field1="ExamSystem" Value1="Constitution"
			Field2="Exam" Value2="No Acute Distress">
    <euc:EformRadioButton Id="NoAcuteDistressNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoAcuteDistressAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoAcuteDistressNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoAcuteDistress" Value="1" RecordId="2" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoAcuteDistress"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Alert & Oriented</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_AlertOriented" RecordId="3" GroupName="AlertOriented" runat="server"
			Field1="ExamSystem" Value1="Constitution"
			Field2="Exam" Value2="Alert & Oriented">
    <euc:EformRadioButton Id="AlertOrientedNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AlertOrientedAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AlertOrientedNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_AlertOriented" Value="1" RecordId="3" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_AlertOriented"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>
  
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">Eyes</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Scleral Icterus</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoScleralIcterus" RecordId="4" GroupName="NoScleralIcterus" runat="server"
			Field1="ExamSystem" Value1="Ocular/Visual"
			Field2="Exam" Value2="No Scleral Icterus">
    <euc:EformRadioButton Id="NoScleralIcterusNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoScleralIcterusAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoScleralIcterusNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoScleralIcterus" Value="1" RecordId="4" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoScleralIcterus"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Conjunctiva</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Conjunctiva" RecordId="5" GroupName="Conjunctiva" runat="server"
			Field1="ExamSystem" Value1="Ocular/Visual"
			Field2="Exam" Value2="Conjunctiva">
    <euc:EformRadioButton Id="ConjunctivaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ConjunctivaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ConjunctivaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Conjunctiva" Value="1" RecordId="5" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Conjunctiva"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="3" valign="top" class="ControlBoxLinedRowsShaded">Lymph Nodes</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Cervical</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Cervical" RecordId="6" GroupName="Cervical" runat="server"
			Field1="ExamSystem" Value1="Lymph Nodes"
			Field2="Exam" Value2="Cervical">
    <euc:EformRadioButton Id="CervicalNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="CervicalAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="CervicalNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Cervical" Value="1" RecordId="6" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Cervical"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Supraclavicular</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Supraclavicular" RecordId="7" GroupName="Supraclavicular" runat="server"
			Field1="ExamSystem" Value1="Lymph Nodes"
			Field2="Exam" Value2="Supraclavicular">
    <euc:EformRadioButton Id="SupraclavicularNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="SupraclavicularAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="SupraclavicularNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Supraclavicular" Value="1" RecordId="7" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Supraclavicular"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Groin</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Groin" RecordId="8" GroupName="Groin" runat="server"
			Field1="ExamSystem" Value1="Lymph Nodes"
			Field2="Exam" Value2="Groin">
    <euc:EformRadioButton Id="GroinNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="GroinAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="GroinNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Groin" Value="1" RecordId="8" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Groin"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Respiratory</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Clear to Auscultation</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_CleartoAuscultation" RecordId="9" GroupName="CleartoAuscultation" runat="server"
			Field1="ExamSystem" Value1="Respiratory"
			Field2="Exam" Value2="Clear to Auscultation">
    <euc:EformRadioButton Id="CleartoAuscultationNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="CleartoAuscultationAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="CleartoAuscultationNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_CleartoAuscultation" Value="1" RecordId="9" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_CleartoAuscultation"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">CV</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Regular Rate & Rhythm</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_RegularRateRhythm" RecordId="10" GroupName="RegularRateRhythm" runat="server"
			Field1="ExamSystem" Value1="Cardiovascular"
			Field2="Exam" Value2="Regular Rate & Rhythm">
    <euc:EformRadioButton Id="RegularRateRhythmNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="RegularRateRhythmAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="RegularRateRhythmNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_RegularRateRhythm" Value="1" RecordId="10" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_RegularRateRhythm"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Murmurs</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoMurmurs" RecordId="16" GroupName="NoMurmurs" runat="server"
			Field1="ExamSystem" Value1="Cardiovascular"
			Field2="Exam" Value2="No Murmurs">
    <euc:EformRadioButton Id="NoMurmursNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoMurmursAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoMurmursNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoMurmurs" Value="1" RecordId="16" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoMurmurs"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="5" valign="top" class="ControlBoxLinedRowsShaded">Abdomen</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Soft Non-tender</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_SoftNontender" RecordId="17" GroupName="SoftNontender" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="Soft Non-tender">
    <euc:EformRadioButton Id="SoftNontenderNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="SoftNontenderAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="SoftNontenderNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_SoftNontender" Value="1" RecordId="17" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_SoftNontender"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Normal Bowel Sounds</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NormalBowelSounds" RecordId="18" GroupName="NormalBowelSounds" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="Normal Bowel Sounds">
    <euc:EformRadioButton Id="NormalBowelSoundsNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NormalBowelSoundsAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NormalBowelSoundsNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NormalBowelSounds" Value="1" RecordId="18" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NormalBowelSounds"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Hepatosplenomegaly</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoHepatosplenomegaly" RecordId="19" GroupName="NoHepatosplenomegaly" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="No Hepatosplenomegaly">
    <euc:EformRadioButton Id="NoHepatosplenomegalyNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoHepatosplenomegalyAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoHepatosplenomegalyNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoHepatosplenomegaly" Value="1" RecordId="19" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoHepatosplenomegaly"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Ascites</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoAscites" RecordId="20" GroupName="NoAscites" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="No Ascites">
    <euc:EformRadioButton Id="NoAscitesNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoAscitesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoAscitesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoAscites" Value="1" RecordId="20" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoAscites"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Hernia</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoHernia" RecordId="21" GroupName="NoHernia" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="No Hernia">
    <euc:EformRadioButton Id="NoHerniaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoHerniaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoHerniaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoHernia" Value="1" RecordId="21" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoHernia"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="8" valign="top" class="ControlBoxLinedRowsShaded">GU Male</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Scrotum</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Scrotum" RecordId="22" GroupName="Scrotum" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Scrotum">
    <euc:EformRadioButton Id="ScrotumNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ScrotumAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ScrotumNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Scrotum" Value="1" RecordId="22" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Scrotum"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Testis</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Testis" RecordId="23" GroupName="Testis" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Testis">
    <euc:EformRadioButton Id="TestisNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="TestisAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="TestisNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Testis" Value="1" RecordId="23" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Testis"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Epididymis</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Epididymis" RecordId="24" GroupName="Epididymis" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Epididymis">
    <euc:EformRadioButton Id="EpididymisNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="EpididymisAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="EpididymisNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Epididymis" Value="1" RecordId="24" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="24" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Epididymis"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Varicocele</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Varicocele" RecordId="25" GroupName="Varicocele" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Varicocele">
    <euc:EformRadioButton Id="VaricoceleNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="VaricoceleAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="VaricoceleNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Varicocele" Value="1" RecordId="25" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="25" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Varicocele"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon25" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Penis</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Penis" RecordId="26" GroupName="Penis" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Penis">
    <euc:EformRadioButton Id="PenisNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PenisAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PenisNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Penis" Value="1" RecordId="26" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="26" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Penis"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon26" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Penile Stretch</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_PenileStretch" RecordId="27" GroupName="PenileStretch" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Penile Stretch">
    <euc:EformRadioButton Id="PenileStretchNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PenileStretchAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PenileStretchNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_PenileStretch" Value="1" RecordId="27" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="27" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_PenileStretch"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon27" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Penile Plaque</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_PenilePlaque" RecordId="28" GroupName="PenilePlaque" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Penile Plaque">
    <euc:EformRadioButton Id="PenilePlaqueNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PenilePlaqueAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PenilePlaqueNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_PenilePlaque" Value="1" RecordId="28" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="28" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_PenilePlaque"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon28" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">DRE - Prostate</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_DREProstate" RecordId="29" GroupName="DREProstate" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="DRE - Prostate">
    <euc:EformRadioButton Id="DREProstateNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DREProstateAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DREProstateNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_DREProstate" Value="1" RecordId="29" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="29" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_DREProstate"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="3" valign="top" class="ControlBoxLinedRowsShaded">Peripheral Vascular</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Femoral Pulses</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_FemoralPulses" RecordId="30" GroupName="FemoralPulses" runat="server"
			Field1="ExamSystem" Value1="Peripheral Vascular"
			Field2="Exam" Value2="Femoral Pulses">
    <euc:EformRadioButton Id="FemoralPulsesNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FemoralPulsesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FemoralPulsesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_FemoralPulses" Value="1" RecordId="30" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="30" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_FemoralPulses"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon30" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Popliteal Pulses</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_PoplitealPulses" RecordId="31" GroupName="PoplitealPulses" runat="server"
			Field1="ExamSystem" Value1="Peripheral Vascular"
			Field2="Exam" Value2="Popliteal Pulses">
    <euc:EformRadioButton Id="PoplitealPulsesNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PoplitealPulsesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PoplitealPulsesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_PoplitealPulses" Value="1" RecordId="31" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="31" ShowCalendar="False" CalcDate="False" style="width:131px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_PoplitealPulses"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon31" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Pedal Pulses</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_PedalPulses" RecordId="32" GroupName="PedalPulses" runat="server"
			Field1="ExamSystem" Value1="Peripheral Vascular"
			Field2="Exam" Value2="Pedal Pulses">
    <euc:EformRadioButton Id="PedalPulsesNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PedalPulsesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PedalPulsesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_PedalPulses" Value="1" RecordId="32" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="32" ShowCalendar="False" CalcDate="False" style="width:132px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_PedalPulses"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon32" runat="server"/></td>
  </tr>
  
  
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Other</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">&nbsp;</td>
    <td class="ControlBoxLinedRowsShaded" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows">&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space:nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox RecordId="11" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other1" style="width: 50px;"/></td>
    <td style="white-space:nowrap;border-right: none;" valign="top" class="ControlBoxLinedRowsShaded" ><euc:EformComboBox RecordId="11" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Other1" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other1" RecordId="11" GroupName="Other1" runat="server">
    <span><euc:EformRadioButton Id="Other1Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other1Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span>
      <euc:EformRadioButton Id="Other1NotDone" Value="Not Done" runat="server"/>
      </span>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other1" Value="1" RecordId="11" /></span></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other1"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server"/></td>
  </tr>
    <tr>
    <td style="white-space:nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox RecordId="12" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other2" style="width: 50px;"/></td>
    <td style="white-space:nowrap;border-right: none;" valign="top" class="ControlBoxLinedRowsShaded" ><euc:EformComboBox RecordId="12" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Other2" style="width: 130px;"/></td>
    <td  class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other2" RecordId="12" GroupName="Other2" runat="server">
        <span><euc:EformRadioButton Id="Other2Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other2Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span>
      <euc:EformRadioButton Id="Other2NotDone" Value="Not Done" runat="server"/>
      </span>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other2" Value="1" RecordId="12" /></span></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other2"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space:nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox RecordId="13" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other3" style="width: 50px;"/></td>
    <td style="white-space:nowrap;border-right: none;" valign="top" class="ControlBoxLinedRowsShaded" ><euc:EformComboBox RecordId="13" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Other3" style="width: 130px;"/></td>
    <td  class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other3" RecordId="13" GroupName="Other3" runat="server">
        <span><euc:EformRadioButton Id="Other3Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other3Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span>
      <euc:EformRadioButton Id="Other3NotDone" Value="Not Done" runat="server"/>
      </span>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other3" Value="1" RecordId="13" /></span></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other3"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space:nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox RecordId="14" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other4" style="width: 50px;"/></td>
    <td style="white-space:nowrap;border-right: none;" valign="top" class="ControlBoxLinedRowsShaded" ><euc:EformComboBox RecordId="14" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Other4" style="width: 130px;"/></td>
    <td  class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other4" RecordId="14" GroupName="Other4" runat="server">
        <span><euc:EformRadioButton Id="Other4Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other4Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span>
      <euc:EformRadioButton Id="Other4NotDone" Value="Not Done" runat="server"/>
      </span>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other4" Value="1" RecordId="14" /></span></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other4"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space:nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox RecordId="15" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other5" style="width: 50px;"/></td>
    <td style="white-space:nowrap;border-right: none;" valign="top" class="ControlBoxLinedRowsShaded" ><euc:EformComboBox RecordId="15" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Other5" style="width: 130px;"/></td>
    <td  class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other5" RecordId="15" GroupName="Other5" runat="server">
        <span><euc:EformRadioButton Id="Other5Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other5Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span>
      <euc:EformRadioButton Id="Other5NotDone" Value="Not Done" runat="server"/>
      </span>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other5" Value="1" RecordId="15" /></span></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other5"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
