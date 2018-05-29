<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.RadiographicFindings" CodeFile="RadiographicFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="RadiographicFindings" id="RadiographicFindings" />
<span class="controlBoxTitle">Radiographic Findings / Upper Tracts</span><br/>

<euc:EformCheckBox  Text="None Examined" TABLE="NoTable" FIELD="Exam_Clinician_Attending" Runat="server" ID="Exam_Clinician_Attending" Value="None Examined"  /> 
<!-- CheckAllWidgetsInColBasedOnCheckbox(this, 'ExamsHtmlTable', 5, 8) -->
<br/><img src="../../../Images/shim.gif" width="1" height="10" /><br/>
<table width="650" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ExamsHtmlTable">
  
  <tr>
    <td align="center" class="controlBoxDataGridHeaderFirstCol" >Examined</td>
    <td align="center" class="controlBoxDataGridHeaderFirstCol" >Normal</td>
    <td class="controlBoxDataGridHeaderFirstCol"  nowrap>Abnormal</td>
    <td width="40%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_1" Value="Urogram" RecordId="1" />Urogram</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButtonGroup Table="EncExams" Field="Exam" id="ExamResult_VitalSignsVerified" RecordId="1" GroupName="VitalSignsVerified" runat="server"
			Field1="ExamSystem" Value1="Constitution">
	<euc:EformRadioButton Id="VitalSignsVerifiedNormal" Value="Normal" runat="server" />	</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="VitalSignsVerifiedNotDone" Value="Not Done" runat="server" />
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_VitalSignsVerified"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1"/></td>
  </tr>
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_2" Value="Retrogrades (Left)" RecordId="2" />Retrogrades (Left) </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_WellHealedIncision" RecordId="2" GroupName="WellHealedIncision" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal">
    <euc:EformRadioButton Id="WellHealedIncisionNormal" Value="Normal" runat="server" />    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="WellHealedIncisionNotDone" Value="Not Done" runat="server" />
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_WellHealedIncision"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon2"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_3" Value="Retrogrades (Right)" RecordId="3" />Retrogrades (right) </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoMassesorTenderness" RecordId="3" GroupName="NoMassesorTenderness" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal">
    <euc:EformRadioButton Id="NoMassesorTendernessNormal" Value="Normal" runat="server" />    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoMassesorTendernessNotDone" Value="Not Done" runat="server" />
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoMassesorTenderness"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon3"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_4" Value="Ureteroscopy (Left)" RecordId="4" />Ureteroscopy (Left) </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoPalpableHernia" RecordId="4" GroupName="NoPalpableHernia" runat="server"
			Field1="ExamSystem" Value1="Musculoskeletal">
    <euc:EformRadioButton Id="NoPalpableHerniaNormal" Value="Normal" runat="server" />    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NoPalpableHerniaNotDone" Value="Not Done" runat="server" />
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_NoPalpableHernia"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon4"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none;"><euc:EformCheckbox TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_5" Value="Ureteroscopy (Right)" RecordId="5" />Ureteroscopy (Right) </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_TestesWoTendernessOrMasses" RecordId="5" GroupName="TestesWoTendernessOrMasses" runat="server"
			Field1="ExamSystem" Value1="Genitourinary">
    <euc:EformRadioButton Id="TestesWoTendernessOrMassesNormal" Value="Normal" runat="server" />    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="TestesWoTendernessOrMassesNotDone" Value="Not Done" runat="server" />
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_TestesWoTendernessOrMasses"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon5"/></td>
  </tr>

</table>
<br/><br/><br/>