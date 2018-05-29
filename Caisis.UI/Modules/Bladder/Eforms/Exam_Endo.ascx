<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.Exam_Endo" CodeFile="Exam_Endo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Exam_Endo" /><span class="controlBoxTitle">Exam</span><br />
Clinician(s) Performing Initial Exam:

<euc:EformCheckBox  Text="PA/NP" TABLE="NoTable" FIELD="Exam_Clinician_PANP" Runat="server" ID="Exam_Clinician_PANP" Value="True" />
<euc:EformCheckBox  Text="Fellow" TABLE="NoTable" FIELD="Exam_Clinician_Fellow" Runat="server" ID="Exam_Clinician_Fellow" Value="True" />
<euc:EformCheckBox  Text="Attending" TABLE="NoTable" FIELD="Exam_Clinician_Attending" Runat="server" ID="Exam_Clinician_Attending" Value="True" onclick="CheckAllWidgetsInColBasedOnCheckbox(this, 'ExamsHtmlTable', 5, 8)" />

<br/><img src="../../Images/shim.gif" width="1" height="10" /><br/>
<table width="650" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ExamsHtmlTable">
  
  <tr>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol">Area</td>
    <td align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol" >Normal </td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Abnormal</td>
    <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Attending Performed </td>
    <td width="40%" valign="bottom" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Abdomen</td>
    <td align="center" valign="top" class="ControlBoxLinedRows" ><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_1" RecordId="1" GroupName="Abdomen" runat="server"
			Field1="ExamSystem" Value1="Abdomen"
			Field2="Exam" Value2="Abdomen">
    <euc:EformRadioButton Id="Exam_1_Normal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Exam_1_Abnormal" Value="Abnormal" runat="server"/></euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_1" Value="1" RecordId="1" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="Exam_1_Notes"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Right Groin</td>
    <td align="center" valign="top" class="ControlBoxLinedRows" ><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_2" RecordId="2" GroupName="RightGroin" runat="server"
			Field1="ExamSystem" Value1="Right Groin"
			Field2="Exam" Value2="Right Groin">
    <euc:EformRadioButton Id="Exam_2_Normal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Exam_2_Abnormal" Value="Abnormal" runat="server"/></euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_2" Value="1" RecordId="2" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="Exam_2_Notes"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr> 
   <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Left Groin</td>
    <td align="center" valign="top" class="ControlBoxLinedRows" ><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_3" RecordId="3" GroupName="LeftGroin" runat="server"
			Field1="ExamSystem" Value1="Left Groin"
			Field2="Exam" Value2="Left Groin">
     <euc:EformRadioButton Id="Exam_3_Normal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Exam_3_Abnormal" Value="Abnormal" runat="server"/></euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_3" Value="1" RecordId="3" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="Exam_3_Notes"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr> 
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Genitalia</td>
    <td align="center" valign="top" class="ControlBoxLinedRows" ><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_4" RecordId="4" GroupName="Genitalia" runat="server"
			Field1="ExamSystem" Value1="Genitalia"
			Field2="Exam" Value2="Genitalia">
    <euc:EformRadioButton Id="Exam_4_Normal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Exam_4_Abnormal" Value="Abnormal" runat="server"/></euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_4" Value="1" RecordId="4" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="Exam_4_Notes"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Other</td>
    <td colspan="5" align="center" valign="top" class="ControlBoxLinedRows" style="border-right: none;">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformSelect RecordId="5" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other1" style="width: 50px;"/></td>
    <td align="center" valign="top" class="ControlBoxLinedRows"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other1" RecordId="5" GroupName="Other1" runat="server">
      <span>
    <euc:EformRadioButton Id="Other1Normal" Value="Normal" runat="server"/>
    </span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other1Abnormal" Value="Abnormal" runat="server"/></span></euc:EformRadioButtonGroup>  </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other1" Value="1" RecordId="5" /></span></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other1"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformSelect RecordId="6" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other2" style="width: 50px;"/></td>
    <td align="center" valign="top" class="ControlBoxLinedRows" ><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other2" RecordId="6" GroupName="Other2" runat="server">
        <span>
      <euc:EformRadioButton Id="Other2Normal" Value="Normal" runat="server"/>
      </span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other2Abnormal" Value="Abnormal" runat="server"/></span></euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other2" Value="1" RecordId="6" /></span></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other2"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformSelect RecordId="7" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other3" style="width: 50px;"/></td>
    <td align="center" valign="top" class="ControlBoxLinedRows"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other3" RecordId="7" GroupName="Other3" runat="server">
        <span>
    <euc:EformRadioButton Id="Other3Normal" Value="Normal" runat="server"/>
    </span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other3Abnormal" Value="Abnormal" runat="server"/></span></euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other3" Value="1" RecordId="7" /></span></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other3"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformSelect RecordId="8" LookupCode="BodySystem" TABLE="EncExams" FIELD="ExamSystem" Runat="server" ID="ExamSystem_Other4" style="width: 50px;"/></td>
    <td align="center" valign="top" class="ControlBoxLinedRows"><euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_Other4" RecordId="8" GroupName="Other4" runat="server">
        <span>
    <euc:EformRadioButton Id="Other4Normal" Value="Normal" runat="server"/>
    </span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other4Abnormal" Value="Abnormal" runat="server"/></span></euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_Other4" Value="1" RecordId="8" /></span></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ID="ExamNotes_Other4"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
