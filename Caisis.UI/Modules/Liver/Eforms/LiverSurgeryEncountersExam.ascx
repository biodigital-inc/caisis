<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryEncountersExam" CodeFile="LiverSurgeryEncountersExam.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="LiverSurgeryEncountersExam" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Exam"></asp:Label><br/>
<table width="650" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ExamsHtmlTable">
  
         <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Exam</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;System</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Result</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
  
  
          <tr>
               <td>
                    <euc:EformCheckbox RecordId="1"  TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_AbdominalPain" Value="Abdominal Pain" /> Abdominal Pain </td>
              <td>
                    <euc:EformComboBox Width="80px" RecordId="1" TABLE="EncExams" FIELD="ExamSystem"  ID="ExamSystem_AbdominalPain" LookupCode="BodySystem" Runat="server" TabIndex="1"   /></td>        
              <td>
                    <euc:EformComboBox Width="80px" RecordId="1" TABLE="EncExams" FIELD="ExamResult" ID="ExamResult_AbdominalPain"   LookupCode="Result"   Runat="server" TabIndex="3"  /> </td>
              <td>
                    <euc:EformTextBox Width="80px" RecordId="1" TABLE="EncExams" FIELD="ExamNotes" ID="ExamNotes_AbdominalPain" ShowTextEditor="true" TabIndex="4" runat="server"  /> </td>

              <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
           <tr>
               <td>
                    <euc:EformCheckbox RecordId="2"  TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Jaundice" Value="Jaundice" /> Jaundice </td>
              <td>
                    <euc:EformComboBox Width="80px" RecordId="2" TABLE="EncExams" FIELD="ExamSystem"  ID="ExamSystem_Jaundice" LookupCode="BodySystem" Runat="server" TabIndex="1"   /></td>        
              <td>
                    <euc:EformComboBox Width="80px" RecordId="2" TABLE="EncExams" FIELD="ExamResult" ID="ExamResult_Jaundice"   LookupCode="Result"   Runat="server" TabIndex="3"  /> </td>
              <td>
                    <euc:EformTextBox Width="80px" RecordId="2" TABLE="EncExams" FIELD="ExamNotes" ID="ExamNotes_Jaundice" ShowTextEditor="true" TabIndex="4" runat="server"  /> </td>

              <td><euc:EformDeleteIcon runat="server"/></td>
         </tr> 
          <tr>
               <td>
                    <euc:EformCheckbox RecordId="3"  TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_Asymptomatic" Value="Asymptomatic" /> Asymptomatic </td>
              <td>
                    <euc:EformComboBox Width="80px" RecordId="3" TABLE="EncExams" FIELD="ExamSystem"  ID="ExamSystem_Asymptomatic" LookupCode="BodySystem" Runat="server" TabIndex="1"   /></td>        
              <td>
                    <euc:EformComboBox Width="80px" RecordId="3" TABLE="EncExams" FIELD="ExamResult" ID="ExamResult_Asymptomatic"   LookupCode="Result"   Runat="server" TabIndex="3"  /> </td>
              <td>
                    <euc:EformTextBox Width="80px" RecordId="3" TABLE="EncExams" FIELD="ExamNotes" ID="ExamNotes_Asymptomatic" ShowTextEditor="true" TabIndex="4" runat="server"  /> </td>

              <td><euc:EformDeleteIcon runat="server"/></td>
         </tr> 
          <tr>
               <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other/Unknown:<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<euc:EformComboBox Width="80px" RecordId="4"  TABLE="EncExams" FIELD="Exam" Runat="server" ID="Exam_OtherUnkown" LookupCode="Exam"/> </td>
              <td>
                    <euc:EformComboBox Width="80px" RecordId="4" TABLE="EncExams" FIELD="ExamSystem"  ID="ExamSystem_OtherUnkown" LookupCode="BodySystem" Runat="server" TabIndex="1"   /></td>        
              <td>
                    <euc:EformComboBox Width="80px" RecordId="4" TABLE="EncExams" FIELD="ExamResult" ID="ExamResult_OtherUnkown"   LookupCode="Result"   Runat="server" TabIndex="3"  /> </td>
              <td>
                    <euc:EformTextBox Width="80px" RecordId="4" TABLE="EncExams" FIELD="ExamNotes" ID="ExamNotes_OtherUnkown" ShowTextEditor="true" TabIndex="4" runat="server"  /> </td>

              <td><euc:EformDeleteIcon runat="server"/></td>
         </tr> 
 
</table>
<br/>
<br/>
<br/>
