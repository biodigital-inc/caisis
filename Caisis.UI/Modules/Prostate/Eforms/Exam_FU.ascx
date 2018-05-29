<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.Exam_FU" CodeFile="Exam_FU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Exam_FU" /><span class="controlBoxTitle">Exam</span><br />
Clinician(s) Performing Initial Exam:

<euc:EformCheckBox  Text="PA/NP" TABLE="NoTable" FIELD="Exam_Clinician_PANP" Runat="server" ID="Exam_Clinician_PANP" Value="True" />
<euc:EformCheckBox  Text="Fellow" TABLE="NoTable" FIELD="Exam_Clinician_Fellow" Runat="server" ID="Exam_Clinician_Fellow" Value="True" />
<euc:EformCheckBox  Text="Attending" TABLE="NoTable" FIELD="Exam_Clinician_Attending" Runat="server" ID="Exam_Clinician_Attending" Value="True" onclick="CheckAllWidgetsInColBasedOnCheckboxAndRadios(this, 'ExamsHtmlTable', 5, 8)" />

<br/><img src="../../Images/shim.gif" width="1" height="10" /><br/>
<table width="650" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ExamsHtmlTable">
  
  <tr>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol">System</td>
    <td colspan="2" align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol" ><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ExamsHtmlTable', 2, 8);" style="margin-bottom:3px;" /><br/>Normal Findings</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">    <img src="../../Images/EFormCheckAll.gif" width="28" height="11" hspace="16" class="ClickableImage"  style="margin-bottom:3px;" onclick="return checkAllWidgetsInColumn('ExamsHtmlTable', 3, 8);" /><br />Abnormal</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;" nowrap><img src="../../Images/EFormCheckAll.gif" width="28" height="11" hspace="16" class="ClickableImage"  style="margin-bottom:3px;" onclick="return checkAllWidgetsInColumn('ExamsHtmlTable', 4, 8);" /><br />
    Not Done </td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Attending Performed </td>
    <td width="40%" valign="bottom" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Gen</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Vital Signs Verified </td>
    <td class="ControlBoxLinedRowsShaded" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_VitalSignsVerified" RecordId="1" GroupName="VitalSignsVerified" runat="server"
			Field1="ExamSystem" Value1="Constitution"
			Field2="Exam" Value2="Vital Signs Verified">
	<euc:EformRadioButton Id="VitalSignsVerifiedNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButton Id="VitalSignsVerifiedAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="VitalSignsVerifiedNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_VitalSignsVerified" Value="1" RecordId="1" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_VitalSignsVerified"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr>
    <td rowspan="3" valign="top" class="ControlBoxLinedRowsShaded">Abdomen</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Well Healed Incision  </td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_WellHealedIncision" RecordId="2" GroupName="WellHealedIncision" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="Well Healed Incision">
    <euc:EformRadioButton Id="WellHealedIncisionNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="WellHealedIncisionAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="WellHealedIncisionNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_WellHealedIncision" Value="1" RecordId="2" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_WellHealedIncision"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Masses or Tenderness</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoMassesorTenderness" RecordId="3" GroupName="NoMassesorTenderness" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="No Masses or Tenderness">
    <euc:EformRadioButton Id="NoMassesorTendernessNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoMassesorTendernessAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoMassesorTendernessNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoMassesorTenderness" Value="1" RecordId="3" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoMassesorTenderness"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Palpable Hernia </td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoPalpableHernia" RecordId="4" GroupName="NoPalpableHernia" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal"
			Field2="Exam" Value2="No Palpable Hernia">
    <euc:EformRadioButton Id="NoPalpableHerniaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoPalpableHerniaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoPalpableHerniaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoPalpableHernia" Value="1" RecordId="4" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoPalpableHernia"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="5" valign="top" class="ControlBoxLinedRowsShaded">GU</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Testes w/o Tenderness or Masses </td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_TestesWoTendernessOrMasses" RecordId="5" GroupName="TestesWoTendernessOrMasses" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Testes w/o Tenderness or Masses">
    <euc:EformRadioButton Id="TestesWoTendernessOrMassesNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="TestesWoTendernessOrMassesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="TestesWoTendernessOrMassesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_TestesWoTendernessOrMasses" Value="1" RecordId="5" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_TestesWoTendernessOrMasses"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Palpable Penile Plaque or Fibrosis </td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoPalpablePenilePlaqueOrFibrosis" RecordId="6" GroupName="NoPalpablePenilePlaqueOrFibrosis" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="No Palpable Penile Plaque or Fibrosis">
    <euc:EformRadioButton Id="NoPalpablePenilePlaqueOrFibrosisNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoPalpablePenilePlaqueOrFibrosisAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoPalpablePenilePlaqueOrFibrosisNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoPalpablePenilePlaqueOrFibrosis" Value="1" RecordId="6" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoPalpablePenilePlaqueOrFibrosis"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Empty Prostatic Fossa </td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_EmptyProstaticFossa" RecordId="7" GroupName="EmptyProstaticFossa" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Empty Prostatic Fossa">
    <euc:EformRadioButton Id="EmptyProstaticFossaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="EmptyProstaticFossaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="EmptyProstaticFossaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_EmptyProstaticFossa" Value="1" RecordId="7" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_EmptyProstaticFossa"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Rectal Masses </td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoRectalMasses" RecordId="8" GroupName="NoRectalMasses" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="No Rectal Masses">
    <euc:EformRadioButton Id="NoRectalMassesNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoRectalMassesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoRectalMassesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoRectalMasses" Value="1" RecordId="8" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoRectalMasses"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">Digital Rectal Exam</td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_DRE" RecordId="9" GroupName="NoDRE" runat="server"
			Field1="ExamSystem" Value1="Genitourinary"
			Field2="Exam" Value2="Digital Rectal Exam">
    <euc:EformRadioButton Id="DRENormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DREAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DRENotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_DRE" Value="1" RecordId="9" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_DRE"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>

  
    <tr>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">System</td>
    <td colspan="2" align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol"  style="font-size: 9px;">    Normal Findings</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">Abnormal</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;" nowrap>Not Done </td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">Atten. Perf.</td>
    <td width="40%" valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size: 9px;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  

  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">CV</td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Edema </td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoEdema" RecordId="10" GroupName="NoEdema" runat="server"
			Field1="ExamSystem" Value1="Cardiovascular"
			Field2="Exam" Value2="No Edema">
    <euc:EformRadioButton Id="NoEdemaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoEdemaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoEdemaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoEdema" Value="1" RecordId="10" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoEdema"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;">No Calf Tenderness </td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoCalfTenderness" RecordId="11" GroupName="NoCalfTenderness" runat="server"
			Field1="ExamSystem" Value1="Cardiovascular"
			Field2="Exam" Value2="No Calf Tenderness">
    <euc:EformRadioButton Id="NoCalfTendernessNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoCalfTendernessAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoCalfTendernessNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoCalfTenderness" Value="1" RecordId="11" /></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoCalfTenderness"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
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
    <td style="white-space:nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox RecordId="12" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other1" style="width: 50px;"/></td>
    <td style="white-space:nowrap;border-right: none;" valign="top" class="ControlBoxLinedRowsShaded" ><euc:EformComboBox RecordId="12" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Other1" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other1" RecordId="12" GroupName="Other1" runat="server">
    <span><euc:EformRadioButton Id="Other1Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other1Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span>
      <euc:EformRadioButton Id="Other1NotDone" Value="Not Done" runat="server"/>
      </span>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other1" Value="1" RecordId="12" /></span></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other1"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr>
    <td style="white-space:nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox RecordId="13" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other2" style="width: 50px;"/></td>
    <td style="white-space:nowrap;border-right: none;" valign="top" class="ControlBoxLinedRowsShaded" ><euc:EformComboBox RecordId="13" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Other2" style="width: 130px;"/></td>
    <td  class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other2" RecordId="13" GroupName="Other2" runat="server">
        <span><euc:EformRadioButton Id="Other2Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other2Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span>
      <euc:EformRadioButton Id="Other2NotDone" Value="Not Done" runat="server"/>
      </span>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other2" Value="1" RecordId="13" /></span></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other2"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space:nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox RecordId="14" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other3" style="width: 50px;"/></td>
    <td style="white-space:nowrap;border-right: none;" valign="top" class="ControlBoxLinedRowsShaded" ><euc:EformComboBox RecordId="14" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Other3" style="width: 130px;"/></td>
    <td  class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other3" RecordId="14" GroupName="Other3" runat="server">
        <span><euc:EformRadioButton Id="Other3Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other3Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span>
      <euc:EformRadioButton Id="Other3NotDone" Value="Not Done" runat="server"/>
      </span>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other3" Value="1" RecordId="14" /></span></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other3"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space:nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox RecordId="15" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other4" style="width: 50px;"/></td>
    <td style="white-space:nowrap;border-right: none;" valign="top" class="ControlBoxLinedRowsShaded" ><euc:EformComboBox RecordId="15" LookupCode="Exam" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Other4" style="width: 130px;"/></td>
    <td  class="ControlBoxLinedRowsShaded" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other4" RecordId="15" GroupName="Other4" runat="server">
        <span><euc:EformRadioButton Id="Other4Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other4Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span>
      <euc:EformRadioButton Id="Other4NotDone" Value="Not Done" runat="server"/>
      </span>
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other4" Value="1" RecordId="15" /></span></td>
    <td style="white-space:nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:130px;" ShowTextEditor="true" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other4"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
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
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
