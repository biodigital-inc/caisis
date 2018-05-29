<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.PhysicalExamsBreastFU" CodeFile="PhysicalExamsBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<a name="PhysicalExamsBreastFU" /><span class="controlBoxTitle">Exam</span>&nbsp;&nbsp;Clinician(s) Performing Initial Exam:

<euc:EformCheckBox  Text="PA/NP" TABLE="NoTable" FIELD="Exam_Clinician_PANP" Runat="server" ID="Exam_Clinician_PANP" Value="True" />
<euc:EformCheckBox  Text="Fellow" TABLE="NoTable" FIELD="Exam_Clinician_Fellow" Runat="server" ID="Exam_Clinician_Fellow" Value="True" />
<euc:EformCheckBox  Text="Attending" TABLE="NoTable" FIELD="Exam_Clinician_Attending" Runat="server" ID="Exam_Clinician_Attending" Value="True"  /> <%-- removed, should fix and return it: onclick="CheckAllWidgetsInColBasedOnCheckboxAndRadios(this, 'ExamsHtmlTable', 5, 7)" --%>

<br/><img src="../../Images/shim.gif" width="1" height="10" /><br/>
<table>
    <tr>
        <td style="vertical-align: top;">
           <table width="450" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ExamsHtmlTable1">
    <tr>
        <td valign="top" class="controlBoxDataGridHeaderFirstCol" style="background-color:Transparent;">&nbsp;</td>
        <td align="center" colspan="2" valign="middle" class="controlBoxDataGridHeaderFirstCol" 
            style="background-color:Transparent"><euc:EformTextBox RecordId="8" style="width:1px; display:none;" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_8"/>Left Breast</td>
        <td valign="middle" colspan="4" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;background-color:Transparent">
            <euc:EformCheckbox TABLE="EncExams" FIELD="ExamResult" Runat="server" RecordId="8" ID="ExamResult_8" 
                Value="Surgically Absent"/>  Surgically Absent</td>
    </tr>
    <tr>
        <td valign="bottom" class="controlBoxDataGridHeaderFirstCol">System</td>
        <td colspan="2" align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol" ><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ExamsHtmlTable1', 2, 7);" style="margin-bottom:3px;" /><br/>Normal Findings</td>
        <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">    <img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage"  style="margin-bottom:3px;" onclick="return checkAllWidgetsInColumn('ExamsHtmlTable1', 3, 7);" /><br />Abnormal</td>
        <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Atten.<br />Perf. </td>
        <td valign="bottom" class="controlBoxDataGridHeaderFirstCol">Notes</td>
        <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    </tr>
    <tr id="LeftTR1" runat="server">
        <td valign="top" class="ControlBoxLinedRowsShaded" rowspan="5">Breast </td>
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">Normal Symmetry </td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NormalSymmetry" RecordId="1" GroupName="NormalSymmetry" runat="server"
	            Field1="ExamSystem" Value1="Breast"
	            Field2="Exam" Value2="Normal Symmetry">
                <euc:EformRadioButton Id="NormalSymmetryNormal" Value="Normal" runat="server"/>	</td>
                <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NormalSymmetryAbnormal" Value="Abnormal" runat="server"/>
	        </euc:EformRadioButtonGroup></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NormalSymmetry" Value="1" RecordId="1" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true" ID="ExamNotes_NormalSymmetry"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon21"/></td>
    </tr>  
    <tr id="LeftTR2" runat="server">
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">Normal Skin / Nipple</td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NSN" RecordId="2" GroupName="NSN" runat="server"
		        Field1="ExamSystem" Value1="Breast"
		        Field2="Exam" Value2="Normal Skin / Nipple">
        <euc:EformRadioButton Id="NSNNormal" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="NSNAbnormal" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NSN" Value="1" RecordId="2" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_NSN"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon22"/></td>
    </tr>
    <tr id="LeftTR3" runat="server">
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">No Nipple Discharge</td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NND" RecordId="3" GroupName="NND" runat="server"
		        Field1="ExamSystem" Value1="Breast"
		        Field2="Exam" Value2="No Nipple Discharge">
        <euc:EformRadioButton Id="NNDNormal" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="NNDAbnormal" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NND" Value="1" RecordId="3" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_NND"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon23"/></td>
    </tr>
    <tr id="LeftTR4" runat="server">
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">No Masses </td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoMasses" RecordId="4" GroupName="NoMasses" runat="server"
		        Field1="ExamSystem" Value1="Breast"
		        Field2="Exam" Value2="No Masses">
        <euc:EformRadioButton Id="NoMassesNormal" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="NoMassesAbnormal" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoMasses" Value="1" RecordId="4" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_NoMasses"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon24"/></td>
    </tr>
    <tr id="LeftTR5" runat="server">
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">Well Healed Incision </td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_WHI" RecordId="5" GroupName="WHI" runat="server"
		        Field1="ExamSystem" Value1="Breast"
		        Field2="Exam" Value2="Well Healed Incision">
        <euc:EformRadioButton Id="WHINormal" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="WHIAbnormal" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_WHI" Value="1" RecordId="5" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_WHI"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon25"/></td>
    </tr>

    <tr><td valign="top" class="controlBoxDataGridHeaderFirstCol" colspan="7" style="text-align:left;">Nodes</td></tr>
    <tr>
        <td valign="top" class="ControlBoxLinedRowsShaded">Axilla</td>
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">No Palpable Nodes </td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NPN" RecordId="6" GroupName="NPN" runat="server"
		        Field1="ExamSystem" Value1="Axilla"
		        Field2="Exam" Value2="No Palpable Nodes">
        <euc:EformRadioButton Id="NPNNormal" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="NPNAbnormal" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NPN" Value="1" RecordId="6" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_NPN"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon26"/></td>
    </tr> 
    <tr>
        <td valign="top" class="ControlBoxLinedRowsShaded">Supraclav</td>
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">No Palpable Nodes </td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_SupraclavNPN" RecordId="7" GroupName="SupraclavNPN" runat="server"
		        Field1="ExamSystem" Value1="Supraclav"
		        Field2="Exam" Value2="No Palpable Nodes">
        <euc:EformRadioButton Id="SupraclavNPNNormal" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="SupraclavNPNAbnormal" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_SupraclavNPN" Value="1" RecordId="7" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_SupraclavNPN"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon27"/></td>
    </tr>       
</table> 
        </td>
        <td style="vertical-align: top;">
            <table width="450" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ExamsHtmlTable2">
    <tr>
        <td valign="top" class="controlBoxDataGridHeaderFirstCol" style="background-color:Transparent;">&nbsp;</td>
        <td align="center" colspan="2" valign="middle" class="controlBoxDataGridHeaderFirstCol" 
            style="background-color:Transparent"><euc:EformTextBox RecordId="9" style="width:1px; display:none;" TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_9"/>Right Breast</td>
        <td valign="middle" colspan="4" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;background-color:Transparent">
            <euc:EformCheckbox TABLE="EncExams" FIELD="ExamResult" Runat="server" ID="ExamResult_9" Value="Surgically Absent" 
                RecordId="9" />  Surgically Absent</td>
    </tr>
    <tr>
        <td valign="bottom" class="controlBoxDataGridHeaderFirstCol">System</td>
        <td colspan="2" align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol" ><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ExamsHtmlTable2', 2, 7);" style="margin-bottom:3px;" /><br/>Normal Findings</td>
        <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">    <img src="../../Images/EFormCheckAll.gif" width="28" height="11" hspace="16" class="ClickableImage"  style="margin-bottom:3px;" onclick="return checkAllWidgetsInColumn('ExamsHtmlTable2', 3, 7);" /><br />Abnormal</td>
        <td valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Atten.Perf. </td>
        <td width="40%" valign="bottom" class="controlBoxDataGridHeaderFirstCol">Notes</td>
        <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    </tr>
    <tr id="RightTR1" runat="server">
        <td valign="top" class="ControlBoxLinedRowsShaded" rowspan="5">Breast </td>
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">Normal Symmetry </td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NormalSymmetry2" RecordId="10" GroupName="NormalSymmetry" runat="server"
	            Field1="ExamSystem" Value1="Breast"
	            Field2="Exam" Value2="Normal Symmetry">
                <euc:EformRadioButton Id="NormalSymmetryNormal2" Value="Normal" runat="server"/>	</td>
                <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NormalSymmetryAbnormal2" Value="Abnormal" runat="server"/>
	        </euc:EformRadioButtonGroup></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NormalSymmetry2" Value="1" RecordId="10" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true" ID="ExamNotes_NormalSymmetry2"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon28"/></td>
    </tr>  
    <tr id="RightTR2" runat="server">
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">Normal Skin / Nipple</td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NSN2" RecordId="11" GroupName="NSN" runat="server"
		        Field1="ExamSystem" Value1="Breast"
		        Field2="Exam" Value2="Normal Skin / Nipple">
        <euc:EformRadioButton Id="NSNNormal2" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="NSNAbnormal2" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NSN2" Value="1" RecordId="11" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_NSN2"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon29"/></td>
    </tr>
    <tr id="RightTR3" runat="server">
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">No Nipple Discharge</td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NND2" RecordId="12" GroupName="NND" runat="server"
		        Field1="ExamSystem" Value1="Breast"
		        Field2="Exam" Value2="No Nipple Discharge">
        <euc:EformRadioButton Id="NNDNormal2" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="NNDAbnormal2" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NND2" Value="1" RecordId="12" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_NND2"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon30"/></td>
    </tr>
    <tr id="RightTR4" runat="server">
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">No Masses </td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NoMasses2" RecordId="13" GroupName="NoMasses" runat="server"
		        Field1="ExamSystem" Value1="Breast"
		        Field2="Exam" Value2="No Masses">
        <euc:EformRadioButton Id="NoMassesNormal2" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="NoMassesAbnormal2" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NoMasses2" Value="1" RecordId="13" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_NoMasses2"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon31"/></td>
    </tr>
    <tr id="RightTR5" runat="server">
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">Well Healed Incision </td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_WHI2" RecordId="14" GroupName="WHI" runat="server"
		        Field1="ExamSystem" Value1="Breast"
		        Field2="Exam" Value2="Well Healed Incision">
        <euc:EformRadioButton Id="WHINormal2" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="WHIAbnormal2" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_WHI2" Value="1" RecordId="14" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_WHI2"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon32"/></td>
    </tr>

    <tr><td valign="top" class="controlBoxDataGridHeaderFirstCol" colspan="7" style="text-align:left;">Nodes</td></tr>
    <tr>
        <td valign="top" class="ControlBoxLinedRowsShaded">Axilla</td>
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">No Palpable Nodes </td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_NPN2" RecordId="15" GroupName="NPN" runat="server"
		        Field1="ExamSystem" Value1="Axilla"
		        Field2="Exam" Value2="No Palpable Nodes">
        <euc:EformRadioButton Id="NPNNormal2" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="NPNAbnormal2" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_NPN2" Value="1" RecordId="15" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_NPN2"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon33"/></td>
    </tr> 
    <tr>
        <td valign="top" class="ControlBoxLinedRowsShaded">Supraclav</td>
        <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; white-space:nowrap;">No Palpable Nodes </td>
        <td class="ControlBoxLinedRowsShaded" align="center">
	        <euc:EformRadioButtonGroup Table="EncExams" Field="ExamResult" id="ExamResult_SupraclavNPN2" RecordId="16" GroupName="SupraclavNPN" runat="server"
		        Field1="ExamSystem" Value1="Supraclav"
		        Field2="Exam" Value2="No Palpable Nodes">
        <euc:EformRadioButton Id="SupraclavNPNNormal2" Value="Normal" runat="server"/>	</td>
        <td class="ControlBoxLinedRows" align="center">
	        <euc:EformRadioButton Id="SupraclavNPNAbnormal2" Value="Abnormal" runat="server"/>
            </euc:EformRadioButtonGroup>    </td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformCheckbox TABLE="EncExams" FIELD="ExamAttendingPerformed" Runat="server" ID="ExamAttendingPerformed_SupraclavNPN2" Value="1" RecordId="16" /></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncExams" FIELD="ExamNotes" Runat="server" ShowTextEditor="true"  ID="ExamNotes_SupraclavNPN2"/></td>
        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon34"/></td>
    </tr>       
</table>
        </td>
    </tr>
</table><br /><br />



<script type="text/javascript">
    //updates procedure autopopulates
    function addPEEvents(exam1,exResult1,LeftRow1,LeftRow2,LeftRow3,LeftRow4,LeftRow5,exam2,exResult2,RightRow1,RightRow2,RightRow3,RightRow4,RightRow5)
    { 
        $(exResult1).addEvent('click',curry(PEPopulates,exam1,exResult1,LeftRow1,LeftRow2,LeftRow3,LeftRow4,LeftRow5,exam2,exResult2,RightRow1,RightRow2,RightRow3,RightRow4,RightRow5));
        $(exResult2).addEvent('click',curry(PEPopulates,exam1,exResult1,LeftRow1,LeftRow2,LeftRow3,LeftRow4,LeftRow5,exam2,exResult2,RightRow1,RightRow2,RightRow3,RightRow4,RightRow5));
    } 
    addPEEvents($('<%= Exam_8.ClientID %>'),$('<%= ExamResult_8.ClientID %>'),$('<%= LeftTR1.ClientID %>'),$('<%= LeftTR2.ClientID %>'),$('<%= LeftTR3.ClientID %>'),$('<%= LeftTR4.ClientID %>'),$('<%= LeftTR5.ClientID %>'),$('<%= Exam_9.ClientID %>'),$('<%= ExamResult_9.ClientID %>'),$('<%= RightTR1.ClientID %>'),$('<%= RightTR2.ClientID %>'),$('<%= RightTR3.ClientID %>'),$('<%= RightTR4.ClientID %>'),$('<%= RightTR5.ClientID %>'));

    function PEPopulates(exam1,exResult1,LeftRow1,LeftRow2,LeftRow3,LeftRow4,LeftRow5,exam2,exResult2,RightRow1,RightRow2,RightRow3,RightRow4,RightRow5)
    {
       if (exResult1.checked==true)
        {
           exam1.value = 'Left Breast';
           LeftRow1.style.display='none';
           LeftRow2.style.display='none';
           LeftRow3.style.display='none';
           LeftRow4.style.display='none';
           LeftRow5.style.display='none';
        }
        else
        {
            exam1.value = '';
            LeftRow1.style.display='block';
            LeftRow2.style.display='block';
            LeftRow3.style.display='block';
            LeftRow4.style.display='block';
            LeftRow5.style.display='block';
        }
        
        if (exResult2.checked==true)
        {
           exam2.value = 'Right Breast';
           RightRow1.style.display='none';
           RightRow2.style.display='none';
           RightRow3.style.display='none';
           RightRow4.style.display='none';
           RightRow5.style.display='none';
        }
        else
        {
            exam2.value = '';
            RightRow1.style.display='block';
            RightRow2.style.display='block';
            RightRow3.style.display='block';
            RightRow4.style.display='block';
            RightRow5.style.display='block';
        }
    }   
    
</script>





