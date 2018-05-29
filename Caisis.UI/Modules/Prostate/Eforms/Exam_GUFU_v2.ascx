<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.Exam_GUFU_v2" CodeFile="Exam_GUFU_v2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Exam_FU" /><span class="controlBoxTitle" style="margin-right: 20px;">Exam</span>
<euc:EformCheckBox  Text="PA&nbsp;&nbsp;" TABLE="NoTable" FIELD="Exam_Clinician_PA" Runat="server" ID="Exam_Clinician_PA" Value="True" />
<euc:EformCheckBox  Text="NP&nbsp;&nbsp;" TABLE="NoTable" FIELD="Exam_Clinician_NP" Runat="server" ID="Exam_Clinician_NP" Value="True" />
<euc:EformCheckBox  Text="Fellow&nbsp;&nbsp;" TABLE="NoTable" FIELD="Exam_Clinician_Fellow" Runat="server" ID="Exam_Clinician_Fellow" Value="True" />
<euc:EformCheckBox  Text="Attending Confirmed" TABLE="NoTable" FIELD="Exam_Clinician_Attending" Runat="server" ID="Exam_Clinician_Attending" Value="True" onclick="CheckAllWidgetsInColBasedOnCheckboxAndRadios(this, 'ExamsHtmlTable', 5, 8)" />

<br/>
<table width="700" border="0" cellspacing="0" cellpadding="1" style="border: solid 1px #cccccc;" id="ExamsHtmlTable">
  
  <tr>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol">System</td>
    <td colspan="2" align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol" ><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="checkAllWidgetsInColumn('ExamsHtmlTable', 2, 8);setAllAttendingPerformed();" style="margin-bottom:3px;" /><br/>Normal Findings</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">    <img src="../../Images/EFormCheckAll.gif" width="28" height="11" hspace="16" class="ClickableImage"  style="margin-bottom:3px;" onclick="checkAllWidgetsInColumn('ExamsHtmlTable', 3, 8);setAllAttendingPerformed();" /><br />Abnormal</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;" nowrap><img src="../../Images/EFormCheckAll.gif" width="28" height="11" hspace="16" class="ClickableImage"  style="margin-bottom:3px;" onclick="checkAllWidgetsInColumn('ExamsHtmlTable', 4, 8);setAllAttendingPerformed();" /><br />
    Not Done </td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px; display: none;">Attending Performed </td>
    <td width="40%" valign="bottom" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Gen/MS </td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">WD WN </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_WellDevelopedWellNourished" RecordId="1" GroupName="WellDevelopedWellNourished" runat="server"
			Field1="ExamSystem" Value1="Constitution"
			Field2="Exam" Value2="Well Developed / Well Nourished">
	<euc:EformRadioButton Id="WellDevelopedWellNourishedNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="WellDevelopedWellNourishedAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="WellDevelopedWellNourishedNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_WellDevelopedWellNourished" Value="1" RecordId="1" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_WellDevelopedWellNourished"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1"/></td>
  </tr>
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">NAD</td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoApparentDistress" RecordId="2" GroupName="NoApparentDistress" runat="server"
			Field1="ExamSystem" Value1="Constitution"
			Field2="Exam" Value2="No Apparent Distress">
	<euc:EformRadioButton Id="NoApparentDistressNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoApparentDistressAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoApparentDistressNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoApparentDistress" Value="1" RecordId="2" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoApparentDistress"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon2"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">A&amp;O</td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_AlertAndOriented" RecordId="3" GroupName="AlertAndOriented" runat="server"
			Field1="ExamSystem" Value1="Constitution"
			Field2="Exam" Value2="Alert and Oriented">
	<euc:EformRadioButton Id="AlertAndOrientedNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="AlertAndOrientedAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AlertAndOrientedNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_AlertAndOriented" Value="1" RecordId="3" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_AlertAndOriented"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon3"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Eyes</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Scleral Icterus </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoScleralIcterus" RecordId="4" GroupName="NoScleralIcterus" runat="server"
			Field1="ExamSystem" Value1="Eyes"
			Field2="Exam" Value2="No Scleral Icterus">
	<euc:EformRadioButton Id="NoScleralIcterusNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoScleralIcterusAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoScleralIcterusNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoScleralIcterus" Value="1" RecordId="4" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoScleralIcterus"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon4"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">ENT</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Mucositis </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoMucositis" RecordId="5" GroupName="NoMucositis" runat="server"
			Field1="ExamSystem" Value1="Ears / Nose / Throat"
			Field2="Exam" Value2="No Mucositis">
	<euc:EformRadioButton Id="NoMucositisNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoMucositisAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoMucositisNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoMucositis" Value="1" RecordId="5" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoMucositis"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon5"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Thrush </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoThrush" RecordId="6" GroupName="NoThrush" runat="server"
			Field1="ExamSystem" Value1="Ears / Nose / Throat"
			Field2="Exam" Value2="No Thrush">
	<euc:EformRadioButton Id="NoThrushNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoThrushAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoThrushNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoThrush" Value="1" RecordId="6" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoThrush"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon6"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Mucous Membranes Moist </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_MucousMembranesMoist" RecordId="7" GroupName="MucousMembranesMoist" runat="server"
			Field1="ExamSystem" Value1="Ears / Nose / Throat"
			Field2="Exam" Value2="Mucous Membranes Moist">
	<euc:EformRadioButton Id="MucousMembranesMoistNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="MucousMembranesMoistAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="MucousMembranesMoistNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_MucousMembranesMoist" Value="1" RecordId="7" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_MucousMembranesMoist"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon7"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Nodes</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Cervical </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoCervical" RecordId="8" GroupName="NoCervical" runat="server"
			Field1="ExamSystem" Value1="Nodes"
			Field2="Exam" Value2="No Cervical">
	<euc:EformRadioButton Id="NoCervicalNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoCervicalAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoCervicalNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoCervical" Value="1" RecordId="8" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoCervical"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon8"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Axillary </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoAxillary" RecordId="9" GroupName="NoAxillary" runat="server"
			Field1="ExamSystem" Value1="Nodes"
			Field2="Exam" Value2="No Axillary">
	<euc:EformRadioButton Id="NoAxillaryNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoAxillaryAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoAxillaryNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoAxillary" Value="1" RecordId="9" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoAxillary"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon9"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Supracavicular </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoSupracavicular" RecordId="10" GroupName="NoSupracavicular" runat="server"
			Field1="ExamSystem" Value1="Nodes"
			Field2="Exam" Value2="No Supracavicular">
	<euc:EformRadioButton Id="NoSupracavicularNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoSupracavicularAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoSupracavicularNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoSupracavicular" Value="1" RecordId="10" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoSupracavicular"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon10"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Resp.</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Clear to Percussion &amp; Ausculation </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_ClearToPercussionAndAusculation" RecordId="11" GroupName="ClearToPercussionAndAusculation" runat="server"
			Field1="ExamSystem" Value1="Respiratory"
			Field2="Exam" Value2="Clear to Percussion and Ausculation">
	<euc:EformRadioButton Id="ClearToPercussionAndAusculationNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="ClearToPercussionAndAusculationAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ClearToPercussionAndAusculationNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_ClearToPercussionAndAusculation" Value="1" RecordId="11" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_ClearToPercussionAndAusculation"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon11"/></td>
  </tr>
  <%--
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">C/V</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Edema </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoEdema" RecordId="12" GroupName="NoEdema" runat="server"
			Field1="ExamSystem" Value1="Cardiovascular"
			Field2="Exam" Value2="No Edema">
	<euc:EformRadioButton Id="NoEdemaNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoEdemaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoEdemaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoEdema" Value="1" RecordId="12" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoEdema"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon12"/></td>
  </tr> --%>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">C/V&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Murmurs </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoMurmurs" RecordId="13" GroupName="NoMurmurs" runat="server"
			Field1="ExamSystem" Value1="Cardiovascular"
			Field2="Exam" Value2="No Murmurs">
	<euc:EformRadioButton Id="NoMurmursNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoMurmursAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoMurmursNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoMurmurs" Value="1" RecordId="13" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoMurmurs"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon13"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Regular Rate &amp; Rhythm </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_RegularRateAndRhythm" RecordId="14" GroupName="RegularRateAndRhythm" runat="server"
			Field1="ExamSystem" Value1="Cardiovascular"
			Field2="Exam" Value2="Regular Rate and Rhythm">
	<euc:EformRadioButton Id="RegularRateAndRhythmNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="RegularRateAndRhythmAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="RegularRateAndRhythmNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_RegularRateAndRhythm" Value="1" RecordId="14" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_RegularRateAndRhythm"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon14"/></td>
  </tr>
  <tr>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">System</td>
    <td colspan="2" align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol"  style="font-size: 9px;"> Normal Findings</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">Abnormal</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;" nowrap="nowrap">Not Done </td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px; display: none;">Atten. Perf.</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">Notes</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Abdomen</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Hepatosplenomegaly </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoHepatosplenomegaly" RecordId="15" GroupName="NoHepatosplenomegaly" runat="server"
			Field1="ExamSystem" Value1="Abdomen"
			Field2="Exam" Value2="No Hepatosplenomegaly">
	<euc:EformRadioButton Id="NoHepatosplenomegalyNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoHepatosplenomegalyAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoHepatosplenomegalyNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoHepatosplenomegaly" Value="1" RecordId="15" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoHepatosplenomegaly"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon15"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Ascites </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoAscites" RecordId="16" GroupName="NoAscites" runat="server"
			Field1="ExamSystem" Value1="Abdomen"
			Field2="Exam" Value2="No Ascites">
	<euc:EformRadioButton Id="NoAscitesNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoAscitesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoAscitesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoAscites" Value="1" RecordId="16" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoAscites"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon16"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Soft Non-tender </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_SoftNonTender" RecordId="17" GroupName="SoftNonTender" runat="server"
			Field1="ExamSystem" Value1="Abdomen"
			Field2="Exam" Value2="Soft Non-Tender">
	<euc:EformRadioButton Id="SoftNonTenderNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="SoftNonTenderAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="SoftNonTenderNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_SoftNonTender" Value="1" RecordId="17" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_SoftNonTender"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon17"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Normal Bowel Sounds </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NormalBowelSounds" RecordId="18" GroupName="NormalBowelSounds" runat="server"
			Field1="ExamSystem" Value1="Abdomen"
			Field2="Exam" Value2="Normal Bowel Sounds">
	<euc:EformRadioButton Id="NormalBowelSoundsNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NormalBowelSoundsAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NormalBowelSoundsNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NormalBowelSounds" Value="1" RecordId="18" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NormalBowelSounds"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon18"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Back</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Spinal Tenderness </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoSpinalTenderness" RecordId="19" GroupName="NoSpinalTenderness" runat="server"
			Field1="ExamSystem" Value1="Back"
			Field2="Exam" Value2="No Spinal Tenderness">
	<euc:EformRadioButton Id="NoSpinalTendernessNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoSpinalTendernessAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoSpinalTendernessNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoSpinalTenderness" Value="1" RecordId="19" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoSpinalTenderness"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon19"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No CVA Tenderness </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoCVATenderness" RecordId="20" GroupName="NoCVATenderness" runat="server"
			Field1="ExamSystem" Value1="Back"
			Field2="Exam" Value2="No CVA Tenderness">
	<euc:EformRadioButton Id="NoCVATendernessNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoCVATendernessAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoCVATendernessNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoCVATenderness" Value="1" RecordId="20" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoCVATenderness"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon20"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">GU Male </td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Testes w/o Tenderness or Masses </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_TestesWithoutTendernessOrMasses" RecordId="21" GroupName="TestesWithoutTendernessOrMasses" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Testes Without Tenderness or Masses">
	<euc:EformRadioButton Id="TestesWithoutTendernessOrMassesNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="TestesWithoutTendernessOrMassesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="TestesWithoutTendernessOrMassesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_TestesWithoutTendernessOrMasses" Value="1" RecordId="21" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_TestesWithoutTendernessOrMasses"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon21"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">DRE of Prostate </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_DREOfProstate" RecordId="22" GroupName="DREOfProstate" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="DRE of Prostate">
	<euc:EformRadioButton Id="DREOfProstateNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="DREOfProstateAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DREOfProstateNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_DREOfProstate" Value="1" RecordId="22" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_DREOfProstate"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon22"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">M/S</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Clubbing or Cyanosis </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoClubbingOrCyanosis" RecordId="23" GroupName="NoClubbingOrCyanosis" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="No Clubbing or Cyanosis">
	<euc:EformRadioButton Id="NoClubbingOrCyanosisNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoClubbingOrCyanosisAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoClubbingOrCyanosisNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoClubbingOrCyanosis" Value="1" RecordId="23" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoClubbingOrCyanosis"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon23"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Cord </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoCord" RecordId="24" GroupName="NoCord" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="No Cord">
	<euc:EformRadioButton Id="NoCordNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoCordAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoCordNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoCord" Value="1" RecordId="24" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="24" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoCord"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon24"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Calf Tenderness </td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoCalfTenderness" RecordId="25" GroupName="NoCalfTenderness" runat="server"
			Field1="ExamSystem" Value1="Cardiovascular"
			Field2="Exam" Value2="No Calf Tenderness">
    <euc:EformRadioButton Id="NoCalfTendernessNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoCalfTendernessAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoCalfTendernessNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoCalfTenderness" Value="1" RecordId="25" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="25" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoCalfTenderness"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon26"/></td>
  </tr>
  

  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Leg Swelling  </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoLegSwelling" RecordId="26" GroupName="NoLegSwelling" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="No Leg Swelling">
	<euc:EformRadioButton Id="NoLegSwellingNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoLegSwellingAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoLegSwellingNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoLegSwelling" Value="1" RecordId="26" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="26" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoLegSwelling"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon25"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Neuro</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Motor Function </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_MotorFunction" RecordId="27" GroupName="MotorFunction" runat="server"
			Field1="ExamSystem" Value1="Neurological"
			Field2="Exam" Value2="Motor Function">
	<euc:EformRadioButton Id="MotorFunctionNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="MotorFunctionAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="MotorFunctionNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_MotorFunction" Value="1" RecordId="27" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="27" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_MotorFunction"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon27"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Sensation</td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Sensation" RecordId="28" GroupName="Sensation" runat="server"
			Field1="ExamSystem" Value1="Neurological"
			Field2="Exam" Value2="Sensation">
	<euc:EformRadioButton Id="SensationNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="SensationAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="SensationNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Sensation" Value="1" RecordId="28" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="28" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_Sensation"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon28"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Cranial Nerves II-XII Intact </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_CranialNervesIIToXIIIntact" RecordId="29" GroupName="CranialNervesIIToXIIIntact" runat="server"
			Field1="ExamSystem" Value1="Neurological"
			Field2="Exam" Value2="Cranial Nerves II-XII Intact">
	<euc:EformRadioButton Id="CranialNervesIIToXIIIntactNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="CranialNervesIIToXIIIntactAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="CranialNervesIIToXIIIntactNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_CranialNervesIIToXIIIntact" Value="1" RecordId="29" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="29" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_CranialNervesIIToXIIIntact"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon29"/></td>
  </tr>
  <tr>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">System</td>
    <td colspan="2" align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol"  style="font-size: 9px;"> Normal Findings</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">Abnormal</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;" nowrap="nowrap">Not Done </td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px; display: none;">Atten. Perf.</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">Notes</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Skin</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Rash or Ulcers </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoRashOrUlcers" RecordId="30" GroupName="NoRashOrUlcers" runat="server"
			Field1="ExamSystem" Value1="Skin"
			Field2="Exam" Value2="No Rash or Ulcers">
	<euc:EformRadioButton Id="NoRashOrUlcersNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoRashOrUlcersAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoRashOrUlcersNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoRashOrUlcers" Value="1" RecordId="30" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="30" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoRashOrUlcers"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon30"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Nodules </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoNodules" RecordId="31" GroupName="NoNodules" runat="server"
			Field1="ExamSystem" Value1="Skin"
			Field2="Exam" Value2="No Nodules">
	<euc:EformRadioButton Id="NoNodulesNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="NoNodulesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoNodulesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoNodules" Value="1" RecordId="31" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="31" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_NoNodules"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon31"/></td>
  </tr>
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Other</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">&nbsp;</td>
    <td class="ControlBoxLinedRowsShaded" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformSelect RecordId="32" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other1" style="width: 50px;"/></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformSelect RecordId="32" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Other1" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other1" RecordId="32" GroupName="Other1" runat="server">
    <span><euc:EformRadioButton Id="Other1Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other1Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span>
      <euc:EformRadioButton Id="Other1NotDone" Value="Not Done" runat="server"/>
      </span>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center" style="display: none;"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other1" Value="1" RecordId="32" /></span></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="32" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="EncExams" FIELD="ExamNotes" ShowTextEditor="true" Runat="server" ID="ExamNotes_Other1"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon32"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
<script type="text/javascript">
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
function defaultGUMaleSection()
{
    if (!($('<% = TestesWithoutTendernessOrMassesNormal.ClientID %>').checked || $('<% = TestesWithoutTendernessOrMassesAbnormal.ClientID %>').checked || $('<% = TestesWithoutTendernessOrMassesNotDone.ClientID %>').checked))
    {$('<% = TestesWithoutTendernessOrMassesNotDone.ClientID %>').checked = true;}
    
    if (!($('<% = DREOfProstateNormal.ClientID %>').checked || $('<% = DREOfProstateAbnormal.ClientID %>').checked || $('<% = DREOfProstateNotDone.ClientID %>').checked))
    {$('<% = DREOfProstateNotDone.ClientID %>').checked = true;}
}
defaultGUMaleSection();
</script>