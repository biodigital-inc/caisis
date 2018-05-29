<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreatitisAdmissionSurveys" CodeFile="PancreatitisAdmissionSurveys.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="PancreatitisAdmissionSurveys" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Past Medical History Assessment"></asp:Label><br/>

<div >
    <br />
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date:  </strong>
               <euc:EformTextBox  Width="100px" RecordId="2" Table="Surveys" Field="SurveyDateText" ID="SurveyDateText_2" runat="server"  ShowCalendar="true" CalcDate="true"/>
               <euc:EformHidden RecordId="2" Table="Surveys" Field="SurveyDate" ID="SurveyDate_2" runat="server"  />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" Table="Surveys" Field="SurveyType" ID="SurveyType_2" runat="server" /></td>                
                
        </tr>
    </table>
    <br />
</div>

<strong>Past Medical History</strong>
<table border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="PMHAssessmentHtmlTable" > 

          <tr>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Question/Item</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Response/Result</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes </td>
          </tr>
          <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_1" runat="server" Text="1" />.&nbsp;&nbsp;<asp:Label ID="Question_1" runat="server" Text="When was your pancreatitis first diagnosed?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_1"  runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_1"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="1" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_1" runat="server" ShowCalendar="true" /> (date)</td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="1" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_1" runat="server" ShowTextEditor="true" /></td>
         </tr>
           <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_2" runat="server" Text="2" />.&nbsp;&nbsp;<asp:Label ID="Question_2" runat="server" Text="How many attacks have you had in the past?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_2"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_2"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_2" runat="server" /> (number) </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_2" runat="server" ShowTextEditor="true" /></td>
         </tr>
           <tr>
            <td valign="top" style="white-space: nowrap;">
                 <asp:Label ID="QuestionNum_3" runat="server" Text="3" />.&nbsp;&nbsp;<asp:Label ID="Question_3" runat="server" Text="Is there a family history of pancreatitis?" />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_3"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_3"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="3" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_3" LookupCode="YesNoUnknown" runat="server" /></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_3" runat="server" ShowTextEditor="true" /></td>
         </tr>
            <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_4" runat="server" Text="4" />.&nbsp;&nbsp;<asp:Label ID="Question_4" runat="server" Text="Is there a family history of gallstones?" />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_4"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_4"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="4" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_4" LookupCode="YesNoUnknown" runat="server" /></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="4" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_4" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_5" runat="server" Text="5" />.&nbsp;&nbsp;<asp:Label ID="Question_5" runat="server" Text="Have you been told you have gallstones?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_5"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_5"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="5" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_5" LookupCode="YesNoUnknown" runat="server" /></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="5" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_5" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr  >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_6" runat="server" Text="6" />.&nbsp;&nbsp;<asp:Label ID="Question_6" runat="server" Text="When were you first told?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_6"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_6"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="6" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_6" runat="server" /></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="6" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_6" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr  >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_7" runat="server" Text="7" />.&nbsp;&nbsp;<asp:Label ID="Question_7" runat="server" Text="How many gallstone attacks prior to this admission?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_7"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_7"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="7" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_7" runat="server" /> (number)</td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="7" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_7" runat="server" ShowTextEditor="true" /></td>
         </tr >
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_8" runat="server" Text="8" />.&nbsp;&nbsp;<asp:Label ID="Question_8" runat="server" Text="Did you have episodes of pancreatitis as a child?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_8"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_8"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="8" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_8" LookupCode="YesNoUnknown" runat="server" /></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="8" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_8" runat="server" ShowTextEditor="true" /></td>
         </tr>       

</table>

<br /><br />

<div >
    <br />
    <table class="eformLargePopulatedTableBlue">
        <tr>
           <td height="28" ><strong> Date:  </strong>
               <euc:EformTextBox  Width="100px" RecordId="3" Table="Surveys" Field="SurveyDateText" ID="SurveyDateText_3" runat="server"  ShowCalendar="true" CalcDate="true"/>
               <euc:EformHidden RecordId="3" Table="Surveys" Field="SurveyDate" ID="SurveyDate_3" runat="server"  />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" Table="Surveys" Field="SurveyType" ID="SurveyType_3" runat="server" /></td>                
                
        </tr>
    </table>
    <br />
</div>

<strong>Visit History/Current Illness</strong>
<table border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTableBlue" id="VisitAssessmentHtmlTable" > 

          <tr>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Question/Item</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Response/Result</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes </td>
          </tr>
          <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_1b" runat="server" Text="1" />.&nbsp;&nbsp;<asp:Label ID="Question_1b" runat="server" Text="Primary Care MD/Medical Home?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_1b"  runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_1b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="1" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_1b" runat="server" LookupCode="YesNoUnknown"/> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="1" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_1b" runat="server" ShowTextEditor="true" /></td>
         </tr>
           <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_2b" runat="server" Text="2" />.&nbsp;&nbsp;<asp:Label ID="Question_2b" runat="server" Text="Pain?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_2b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_2b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="2" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_2b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="No pain" Text="No pain" />
                    <asp:ListItem Value="Sharp pain" Text="Sharp pain" />
                    <asp:ListItem Value="Dull pain" Text="Dull pain" />
                    <asp:ListItem Value="Dull and Sharp Pain" Text="Dull and Sharp Pain" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_2b" runat="server" ShowTextEditor="true" /></td>
         </tr>
           <tr>
            <td valign="top" style="white-space: nowrap;">
                 <asp:Label ID="QuestionNum_3b" runat="server" Text="3" />.&nbsp;&nbsp;<asp:Label ID="Question_3b" runat="server" Text="Pain Radiating?" />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_3b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_3b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="3" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_3b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_3b" runat="server" ShowTextEditor="true" /></td>
         </tr>
            <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_4b" runat="server" Text="4" />.&nbsp;&nbsp;<asp:Label ID="Question_4b" runat="server" Text="Location of Pain?" />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_4b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_4b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="100px" Width="100px" RecordId="4" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_4b" runat="server" RepeatDirection="Vertical" RepeatLayout="Table">
                    <asp:ListItem Value="RUQ" Text="RUQ" />
                    <asp:ListItem Value="LUQ" Text="LUQ" />
                    <asp:ListItem Value="RLQ" Text="RLQ" />
                    <asp:ListItem Value="LLQ" Text="LLQ" />
                    <asp:ListItem Value="Epigastric" Text="Epigastric" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformExtendedCheckBoxList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="4" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_4b" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_5b" runat="server" Text="5" />.&nbsp;&nbsp;<asp:Label ID="Question_5b" runat="server" Text="Frequency of pain?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_5b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_5b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="5" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_5b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Once or twice" Text="Once or twice" />
                    <asp:ListItem Value="Intermittent" Text="Intermittent" />
                    <asp:ListItem Value="Constant" Text="Constant" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="5" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_5b" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr  >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_6b" runat="server" Text="6" />.&nbsp;&nbsp;<asp:Label ID="Question_6b" runat="server" Text="Pain at worst x/10" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_6b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_6b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="6" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_6b" runat="server" /> (number 0-10)</td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="6" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_6b" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr  >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_7b" runat="server" Text="7" />.&nbsp;&nbsp;<asp:Label ID="Question_7b" runat="server" Text="Pain now x/10" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_7b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_7b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="7" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_7b" runat="server" /> (number 0-10)</td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="7" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_7b" runat="server" ShowTextEditor="true" /></td>
         </tr >
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_8b" runat="server" Text="8" />.&nbsp;&nbsp;<asp:Label ID="Question_8b" runat="server" Text="Pain after eating?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_8b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_8b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="8" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_8b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="8" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_8b" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_9b" runat="server" Text="9" />.&nbsp;&nbsp;<asp:Label ID="Question_9b" runat="server" Text="Do you feel full quickly?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="9" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_9b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="9" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_9b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="9" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_9b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="9" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_9b" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_10b" runat="server" Text="10" />.&nbsp;&nbsp;<asp:Label ID="Question_10b" runat="server" Text="Do you feel nauseous when you eat?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="10" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_10b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="10" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_10b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="10" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_10b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="10" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_10b" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_11b" runat="server" Text="11" />.&nbsp;&nbsp;<asp:Label ID="Question_11b" runat="server" Text="Do certain foods make it worse?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="11" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_11b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="11" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_11b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="11" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_11b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="11" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_11b" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_12b" runat="server" Text="12" />.&nbsp;&nbsp;<asp:Label ID="Question_12b" runat="server" Text="Are you taking pain killers?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="12" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_12b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="12" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_12b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="12" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_12b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="12" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_12b" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_13b" runat="server" Text="13" />.&nbsp;&nbsp;<asp:Label ID="Question_13b" runat="server" Text="What are you taking?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="13" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_13b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="13" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_13b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="13" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_13b" runat="server" /></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="13" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_13b" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_14b" runat="server" Text="14" />.&nbsp;&nbsp;<asp:Label ID="Question_14b" runat="server" Text="Abdominal Trauma?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="14" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_14b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="14" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_14b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="14" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_14b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="14" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_14b" runat="server" ShowTextEditor="true" /></td>
        </tr>
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_15b" runat="server" Text="15" />.&nbsp;&nbsp;<asp:Label ID="Question_15b" runat="server" Text="Immune modulating medication?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="15" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_15b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="15" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_15b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="15" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_15b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="15" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_15b" runat="server" ShowTextEditor="true" /></td>
        </tr>
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_16b" runat="server" Text="16" />.&nbsp;&nbsp;<asp:Label ID="Question_16b" runat="server" Text="How often?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="16" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_16b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="16" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_16b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="16" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_16b" runat="server" /></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="16" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_16b" runat="server" ShowTextEditor="true" /></td>
        </tr>
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_17b" runat="server" Text="17" />.&nbsp;&nbsp;<asp:Label ID="Question_17b" runat="server" Text="ERCP?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="17" ParentRecordId="3" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_17b"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="17" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_17b"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="17" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_17b" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="17" ParentRecordId="3" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_17b" runat="server" ShowTextEditor="true" /></td>
        </tr>

</table>

<br /><br />

<div >
    <br />
    <table class="eformLargePopulatedTable">
        <tr >
           <td height="28" ><strong> Date:  </strong>
               <euc:EformTextBox  Width="100px" RecordId="4" Table="Surveys" Field="SurveyDateText" ID="SurveyDateText_4" runat="server"  ShowCalendar="true" CalcDate="true"/>
               <euc:EformHidden RecordId="4" Table="Surveys" Field="SurveyDate" ID="SurveyDate_4" runat="server"  />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" Table="Surveys" Field="SurveyType" ID="SurveyType_4" runat="server" /></td>                
                
        </tr>
    </table>
    <br />
</div>

<strong>Nutrition</strong>
<table border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTableBlue" id="NutritionAssessmentHtmlTable" > 

          <tr>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Question/Item</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Response/Result</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes </td>
          </tr>
          <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_1c" runat="server" Text="1" />.&nbsp;&nbsp;<asp:Label ID="Question_1c" runat="server" Text="Did you stop eating prior to admission?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="4" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_1c"  runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_1c"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="1" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_1c" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Yes" Text="Yes" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="1" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_1c" runat="server" ShowTextEditor="true" /></td>
         </tr>
           <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_2c" runat="server" Text="2" />.&nbsp;&nbsp;<asp:Label ID="Question_2c" runat="server" Text="How many days did you limit intake of food prior to admission?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="4" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_2c"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_2c"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="2" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_2c" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="1" Text="1" />
                    <asp:ListItem Value="2" Text="2" />
                    <asp:ListItem Value="3" Text="3" />
                    <asp:ListItem Value="4" Text="4" />
                    <asp:ListItem Value="Over a week" Text="Over a week" />
                    <asp:ListItem Value="Over a month" Text="Over a month" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_2c" runat="server" ShowTextEditor="true" /></td>
         </tr>
           <tr>
            <td valign="top" style="white-space: nowrap;">
                 <asp:Label ID="QuestionNum_3c" runat="server" Text="3" />.&nbsp;&nbsp;<asp:Label ID="Question_3c" runat="server" Text="During hospital stay?" />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="4" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_3c"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_3c"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="3" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_3c" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="No food or liquids" Text="No food or liquids" />
                    <asp:ListItem Value="Liquid only" Text="Liquid only" />
                    <asp:ListItem Value="Food" Text="Food" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_3c" runat="server" ShowTextEditor="true" /></td>
         </tr>
            <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_4c" runat="server" Text="4" />.&nbsp;&nbsp;<asp:Label ID="Question_4c" runat="server" Text="Receiving nutrition?" />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="4" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_4c"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_4c"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="4" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_4c" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="TPN" Text="TPN" />
                    <asp:ListItem Value="EN" Text="EN" />
                    <asp:ListItem Value="No nutrition" Text="No nutrition" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                </euc:EformDropDownList></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="4" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_4c" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_5c" runat="server" Text="5" />.&nbsp;&nbsp;<asp:Label ID="Question_5c" runat="server" Text="Number of days in hospital without nutrition?" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="4" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_5c"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_5c"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="5" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_5c" runat="server" /></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="5" ParentRecordId="4" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_5c" runat="server" ShowTextEditor="true" /></td>
         </tr>
</table>

<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_1.ClientID %>'),$('<%= SurveyItemNum_1.ClientID %>'),$('<%= SurveyItemResult_1.ClientID %>'),$('<%= SurveyItemNotes_1.ClientID %>'),'Past Medical History (Pancreatitis)',$('<%= QuestionNum_1.ClientID %>'),$('<%= Question_1.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_2.ClientID %>'),$('<%= SurveyItemNum_2.ClientID %>'),$('<%= SurveyItemResult_2.ClientID %>'),$('<%= SurveyItemNotes_2.ClientID %>'),'Past Medical History (Pancreatitis)',$('<%= QuestionNum_2.ClientID %>'),$('<%= Question_2.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_3.ClientID %>'),$('<%= SurveyItemNum_3.ClientID %>'),$('<%= SurveyItemResult_3.ClientID %>'),$('<%= SurveyItemNotes_3.ClientID %>'),'Past Medical History (Pancreatitis)',$('<%= QuestionNum_3.ClientID %>'),$('<%= Question_3.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_4.ClientID %>'),$('<%= SurveyItemNum_4.ClientID %>'),$('<%= SurveyItemResult_4.ClientID %>'),$('<%= SurveyItemNotes_4.ClientID %>'),'Past Medical History (Pancreatitis)',$('<%= QuestionNum_4.ClientID %>'),$('<%= Question_4.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_5.ClientID %>'),$('<%= SurveyItemNum_5.ClientID %>'),$('<%= SurveyItemResult_5.ClientID %>'),$('<%= SurveyItemNotes_5.ClientID %>'),'Past Medical History (Pancreatitis)',$('<%= QuestionNum_5.ClientID %>'),$('<%= Question_5.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_6.ClientID %>'),$('<%= SurveyItemNum_6.ClientID %>'),$('<%= SurveyItemResult_6.ClientID %>'),$('<%= SurveyItemNotes_6.ClientID %>'),'Past Medical History (Pancreatitis)',$('<%= QuestionNum_6.ClientID %>'),$('<%= Question_6.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_7.ClientID %>'),$('<%= SurveyItemNum_7.ClientID %>'),$('<%= SurveyItemResult_7.ClientID %>'),$('<%= SurveyItemNotes_7.ClientID %>'),'Past Medical History (Pancreatitis)',$('<%= QuestionNum_7.ClientID %>'),$('<%= Question_7.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_8.ClientID %>'),$('<%= SurveyItemNum_8.ClientID %>'),$('<%= SurveyItemResult_8.ClientID %>'),$('<%= SurveyItemNotes_8.ClientID %>'),'Past Medical History (Pancreatitis)',$('<%= QuestionNum_8.ClientID %>'),$('<%= Question_8.ClientID %>'));

    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_1b.ClientID %>'),$('<%= SurveyItemNum_1b.ClientID %>'),$('<%= SurveyItemResult_1b.ClientID %>'),$('<%= SurveyItemNotes_1b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_1b.ClientID %>'),$('<%= Question_1b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_2b.ClientID %>'),$('<%= SurveyItemNum_2b.ClientID %>'),$('<%= SurveyItemResult_2b.ClientID %>'),$('<%= SurveyItemNotes_2b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_2b.ClientID %>'),$('<%= Question_2b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_3b.ClientID %>'),$('<%= SurveyItemNum_3b.ClientID %>'),$('<%= SurveyItemResult_3b.ClientID %>'),$('<%= SurveyItemNotes_3b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_3b.ClientID %>'),$('<%= Question_3b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_4b.ClientID %>'),$('<%= SurveyItemNum_4b.ClientID %>'),$('<%= SurveyItemResult_4b.ClientID %>'),$('<%= SurveyItemNotes_4b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_4b.ClientID %>'),$('<%= Question_4b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_5b.ClientID %>'),$('<%= SurveyItemNum_5b.ClientID %>'),$('<%= SurveyItemResult_5b.ClientID %>'),$('<%= SurveyItemNotes_5b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_5b.ClientID %>'),$('<%= Question_5b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_6b.ClientID %>'),$('<%= SurveyItemNum_6b.ClientID %>'),$('<%= SurveyItemResult_6b.ClientID %>'),$('<%= SurveyItemNotes_6b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_6b.ClientID %>'),$('<%= Question_6b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_7b.ClientID %>'),$('<%= SurveyItemNum_7b.ClientID %>'),$('<%= SurveyItemResult_7b.ClientID %>'),$('<%= SurveyItemNotes_7b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_7b.ClientID %>'),$('<%= Question_7b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_8b.ClientID %>'),$('<%= SurveyItemNum_8b.ClientID %>'),$('<%= SurveyItemResult_8b.ClientID %>'),$('<%= SurveyItemNotes_8b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_8b.ClientID %>'),$('<%= Question_8b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_9b.ClientID %>'),$('<%= SurveyItemNum_9b.ClientID %>'),$('<%= SurveyItemResult_9b.ClientID %>'),$('<%= SurveyItemNotes_9b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_9b.ClientID %>'),$('<%= Question_9b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_10b.ClientID %>'),$('<%= SurveyItemNum_10b.ClientID %>'),$('<%= SurveyItemResult_10b.ClientID %>'),$('<%= SurveyItemNotes_10b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_10b.ClientID %>'),$('<%= Question_10b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_11b.ClientID %>'),$('<%= SurveyItemNum_11b.ClientID %>'),$('<%= SurveyItemResult_11b.ClientID %>'),$('<%= SurveyItemNotes_11b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_11b.ClientID %>'),$('<%= Question_11b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_12b.ClientID %>'),$('<%= SurveyItemNum_12b.ClientID %>'),$('<%= SurveyItemResult_12b.ClientID %>'),$('<%= SurveyItemNotes_12b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_12b.ClientID %>'),$('<%= Question_12b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_13b.ClientID %>'),$('<%= SurveyItemNum_13b.ClientID %>'),$('<%= SurveyItemResult_13b.ClientID %>'),$('<%= SurveyItemNotes_13b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_13b.ClientID %>'),$('<%= Question_13b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_14b.ClientID %>'),$('<%= SurveyItemNum_14b.ClientID %>'),$('<%= SurveyItemResult_14b.ClientID %>'),$('<%= SurveyItemNotes_14b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_14b.ClientID %>'),$('<%= Question_14b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_15b.ClientID %>'),$('<%= SurveyItemNum_15b.ClientID %>'),$('<%= SurveyItemResult_15b.ClientID %>'),$('<%= SurveyItemNotes_15b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_15b.ClientID %>'),$('<%= Question_15b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_16b.ClientID %>'),$('<%= SurveyItemNum_16b.ClientID %>'),$('<%= SurveyItemResult_16b.ClientID %>'),$('<%= SurveyItemNotes_16b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_16b.ClientID %>'),$('<%= Question_16b.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_3.ClientID %>'),$('<%= SurveyDate_3.ClientID %>'),$('<%= SurveyType_3.ClientID %>'),$('<%= SurveyItem_17b.ClientID %>'),$('<%= SurveyItemNum_17b.ClientID %>'),$('<%= SurveyItemResult_17b.ClientID %>'),$('<%= SurveyItemNotes_17b.ClientID %>'),'Visit History/Current Illness (Pancreatitis)',$('<%= QuestionNum_17b.ClientID %>'),$('<%= Question_17b.ClientID %>'));

    addAbsentEvent($('<%= SurveyDateText_4.ClientID %>'),$('<%= SurveyDate_4.ClientID %>'),$('<%= SurveyType_4.ClientID %>'),$('<%= SurveyItem_1c.ClientID %>'),$('<%= SurveyItemNum_1c.ClientID %>'),$('<%= SurveyItemResult_1c.ClientID %>'),$('<%= SurveyItemNotes_1c.ClientID %>'),'Nutrition (Pancreatitis)',$('<%= QuestionNum_1c.ClientID %>'),$('<%= Question_1c.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_4.ClientID %>'),$('<%= SurveyDate_4.ClientID %>'),$('<%= SurveyType_4.ClientID %>'),$('<%= SurveyItem_2c.ClientID %>'),$('<%= SurveyItemNum_2c.ClientID %>'),$('<%= SurveyItemResult_2c.ClientID %>'),$('<%= SurveyItemNotes_2c.ClientID %>'),'Nutrition (Pancreatitis)',$('<%= QuestionNum_2c.ClientID %>'),$('<%= Question_2c.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_4.ClientID %>'),$('<%= SurveyDate_4.ClientID %>'),$('<%= SurveyType_4.ClientID %>'),$('<%= SurveyItem_3c.ClientID %>'),$('<%= SurveyItemNum_3c.ClientID %>'),$('<%= SurveyItemResult_3c.ClientID %>'),$('<%= SurveyItemNotes_3c.ClientID %>'),'Nutrition (Pancreatitis)',$('<%= QuestionNum_3c.ClientID %>'),$('<%= Question_3c.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_4.ClientID %>'),$('<%= SurveyDate_4.ClientID %>'),$('<%= SurveyType_4.ClientID %>'),$('<%= SurveyItem_4c.ClientID %>'),$('<%= SurveyItemNum_4c.ClientID %>'),$('<%= SurveyItemResult_4c.ClientID %>'),$('<%= SurveyItemNotes_4c.ClientID %>'),'Nutrition (Pancreatitis)',$('<%= QuestionNum_4c.ClientID %>'),$('<%= Question_4c.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_4.ClientID %>'),$('<%= SurveyDate_4.ClientID %>'),$('<%= SurveyType_4.ClientID %>'),$('<%= SurveyItem_5c.ClientID %>'),$('<%= SurveyItemNum_5c.ClientID %>'),$('<%= SurveyItemResult_5c.ClientID %>'),$('<%= SurveyItemNotes_5c.ClientID %>'),'Nutrition (Pancreatitis)',$('<%= QuestionNum_5c.ClientID %>'),$('<%= Question_5c.ClientID %>'));

    function addAbsentEvent(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question)
    {  
        $(surveyDateText).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question));

        // on survey result is a checkbox list
        if (surveyItemResult.id.indexOf('SurveyItemResult_4b') > 0) {

            var cbl = surveyItemResult.getElementsByTagName('input');
            for (var j = 0; j < cbl.length; j++) {
                var cblRef = cbl[j];
                if (cblRef.type == 'checkbox')
                    $(cblRef).addEvent('click', curry(SetHiddenFields, surveyDateText, surveyDate, surveyType, surveyItem, surveyItemNum, surveyItemResult, surveyItemNotes, surveyTypeValue, questionNum, question));
                else (cblRef.type == 'text')
                $(cblRef).addEvent('blur', curry(SetHiddenFields, surveyDateText, surveyDate, surveyType, surveyItem, surveyItemNum, surveyItemResult, surveyItemNotes, surveyTypeValue, questionNum, question));

            }
        }
        else
            $(surveyItemResult).addEvent('blur', curry(SetHiddenFields, surveyDateText, surveyDate, surveyType, surveyItem, surveyItemNum, surveyItemResult, surveyItemNotes, surveyTypeValue, questionNum, question));
       
        $(surveyItemNotes).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question));        
    }
   
    /* ]]> */
   
    function SetHiddenFields(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question)
    {                
        
       if (surveyItemResult.id.indexOf('SurveyItemResult_4b') > 0)
       {
            var resultCBLstring = RetrieveCheckBoxListSelectedValues(surveyItemResult,"TABLE");

            if (surveyDateText.value != '' || resultCBLstring != '' || surveyItemNotes.value != '')
            {
                surveyType.value = surveyTypeValue; 
                surveyItemNum.value = questionNum.innerHTML;
                surveyItem.value = question.innerHTML;            
            }
            else
            {
                surveyType.value = '';
                surveyItemNum.value = '';
                surveyItem.value = '';
            }       
       }
       else{
            if (surveyDateText.value != '' || surveyItemResult.value != '' || surveyItemNotes.value != '')
            {
                surveyType.value = surveyTypeValue; 
                surveyItemNum.value = questionNum.innerHTML;
                surveyItem.value = question.innerHTML;            
            }
            else
            {
                surveyType.value = '';
                surveyItemNum.value = '';
                surveyItem.value = '';
            }
        }
              
        if (surveyType.value == 'Past Medical History (Pancreatitis)')
            SetHiddenFieldsPMH(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question);
        else if (surveyType.value == 'Visit History/Current Illness (Pancreatitis)')
            SetHiddenFieldsVisit(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question);
        else if (surveyType.value == 'Nutrition (Pancreatitis)')
            SetHiddenFieldsNutrition(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question);
        

        
   }
   
   function SetHiddenFieldsPMH(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question)
   {
        var subQuestion;
        var subQuestionResult;
 
         if (surveyItem.value == 'Have you been told you have gallstones?' )
        {
            subQuestion = document.getElementById('<%=  Question_6.ClientID  %>');
            subQuestionResult = document.getElementById('<%=  SurveyItemResult_6.ClientID  %>');
            
            if (surveyItemResult.value == 'No' || surveyItemResult.value == 'Unknown')
            {               
                if (subQuestion.innerHTML == 'When were you first told?')
                {
                    subQuestionResult.value = 'N/A';                                    
                }
            }
            else
            {
               if (subQuestionResult.value.toLowerCase() == 'n/a')
                subQuestionResult.value = '';     
            }         
        }  
   }

   function SetHiddenFieldsVisit(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question)
   {
        var subQuestion;
        var subQuestionResult;
 
         if (surveyItem.value == 'Pain?' )
         {           
            if (surveyItemResult.value == 'No pain')
            {               
                subQuestion = document.getElementById('<%=  Question_3b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_3b.ClientID  %>');

                if (subQuestion.innerHTML == 'Pain Radiating?')
                    AddSetDropDownValue (subQuestionResult,'N/A');  
                             
                subQuestion = document.getElementById('<%=  Question_4b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_4b.ClientID  %>');

                if (subQuestion.innerHTML == 'Location of Pain?')
                    AddSetDropDownValue (subQuestionResult,'N/A');                                

                subQuestion = document.getElementById('<%=  Question_5b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_5b.ClientID  %>');

                if (subQuestion.innerHTML == 'Frequency of pain?')
                    AddSetDropDownValue (subQuestionResult,'N/A');                                

                subQuestion = document.getElementById('<%=  Question_6b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_6b.ClientID  %>');

                if (subQuestion.innerHTML == 'Pain at worst x/10')
                    subQuestionResult.value = 'N/A';                                    

                subQuestion = document.getElementById('<%=  Question_7b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_7b.ClientID  %>');

                if (subQuestion.innerHTML == 'Pain now x/10')
                    subQuestionResult.value = 'N/A';                                    

            }
            else
            {                
                subQuestion = document.getElementById('<%=  Question_3b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_3b.ClientID  %>');

                if (subQuestion.innerHTML == 'Pain Radiating?')
                   if (subQuestionResult.value.toLowerCase() == 'n/a')
                    AddSetDropDownValue (subQuestionResult,'');                              
                    
                subQuestion = document.getElementById('<%=  Question_4b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_4b.ClientID  %>');

                if (subQuestion.innerHTML == 'Location of Pain?')
                   if (subQuestionResult.value.toLowerCase() == 'n/a')
                    AddSetDropDownValue (subQuestionResult,'');                                
                    

                subQuestion = document.getElementById('<%=  Question_5b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_5b.ClientID  %>');

                if (subQuestion.innerHTML == 'Frequency of pain?')
                   if (subQuestionResult.value.toLowerCase() == 'n/a')
                    AddSetDropDownValue (subQuestionResult,'');                                

                subQuestion = document.getElementById('<%=  Question_6b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_6b.ClientID  %>');

                if (subQuestion.innerHTML == 'Pain at worst x/10')
                   if (subQuestionResult.value.toLowerCase() == 'n/a')
                    subQuestionResult.value = ''; 
                   
                subQuestion = document.getElementById('<%=  Question_7b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_7b.ClientID  %>');

                if (subQuestion.innerHTML == 'Pain now x/10')
                   if (subQuestionResult.value.toLowerCase() == 'n/a')
                    subQuestionResult.value = ''; 
                                     
         }         
        
        }
        if (surveyItem.value == 'Are you taking pain killers?' )
        {           
            if (surveyItemResult.value != 'Yes' && surveyItemResult.value != '' )
            {               
                subQuestion = document.getElementById('<%=  Question_13b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_13b.ClientID  %>');

                if (subQuestion.innerHTML == 'What are you taking?')
                    subQuestionResult.value = 'N/A';  
            }
            else
            {                
                subQuestion = document.getElementById('<%=  Question_13b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_13b.ClientID  %>');

                if (subQuestion.innerHTML == 'What are you taking?')
                   if (subQuestionResult.value.toLowerCase() == 'n/a')
                    subQuestionResult.value = '';                                                                                   
            }   
        } 
 
        if (surveyItem.value == 'Immune modulating medication?' )
        {           
            if (surveyItemResult.value != 'Yes' && surveyItemResult.value != '' )
            {               
                subQuestion = document.getElementById('<%=  Question_16b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_16b.ClientID  %>');

                if (subQuestion.innerHTML == 'How often?')
                    subQuestionResult.value = 'N/A';  
            }
            else
            {                
                subQuestion = document.getElementById('<%=  Question_16b.ClientID  %>');
                subQuestionResult = document.getElementById('<%=  SurveyItemResult_16b.ClientID  %>');

                if (subQuestion.innerHTML == 'How often?')
                   if (subQuestionResult.value.toLowerCase() == 'n/a')
                    subQuestionResult.value = '';                                                                                   
            }     
 
        }  
   }

   function SetHiddenFieldsNutrition(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question)
   {
        var subQuestion;
        var subQuestionResult;
   }
   
   
   
     function AddSetDropDownValue (ddl,value)
    {
        var valueSet = false;

        // set value as selected if already in ddl
        for ( var i = 0; i < ddl.options.length; i++ ) 
        {
            if ( ddl.options[i].value == value ) 
            {
                ddl.options[i].selected = true;
                valueSet = true;                
            }
        }
        
        // if value was not already in ddl, add, then set as selected
        if (!valueSet)
        {
            // add new value to ddl
            soption = value;
            st = new Option(soption,soption);
            ddl.add(st);
            
            // set value as selected
            for ( var j = 0; j < ddl.options.length; j++ ) 
            {
                if ( ddl.options[j].value == value ) 
                {
                    ddl.options[j].selected = true;
                    return;
                }
            }        
        }
         
    }

      
</script>