<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusAcidSuppressionHistory" CodeFile="EsophagusAcidSuppressionHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="EsophagusAcidSuppressionHistory" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Acid Suppression History"></asp:Label><br/>

<div>
    <br />
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date:  </strong>
               <euc:EformTextBox Width="100px" RecordId="2" Table="Surveys" Field="SurveyDateText" ID="SurveyDateText_2" runat="server" ShowCalendar="true" CalcDate="true" />
               <euc:EformHidden RecordId="2" Table="Surveys" Field="SurveyDate" ID="SurveyDate_2" runat="server" /> 
   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" Table="Surveys" Field="SurveyType" ID="SurveyType_2" runat="server" /></td>
                
                
        </tr>
    </table>
    <br />
</div>
<table border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="WeightHistoryHtmlTable" > 

          <tr>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Item</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Result</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes </td>
          </tr>
          <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_1" runat="server" Text="1" />.&nbsp;&nbsp;<asp:Label ID="Question_1" runat="server" Text="PPI's" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_1"  runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_1"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="1" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_1" runat="server" LookupCode="YesNoUnknown" /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="1" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_1" runat="server" ShowTextEditor="true" /></td>
         </tr>
          <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_2" runat="server" Text="2" />.&nbsp;&nbsp;<asp:Label ID="Question_2" runat="server" Text="H2-blockers" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_2"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_2"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="100px" RecordId="2" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_2" runat="server" LookupCode="YesNoUnknown" /></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_2" runat="server" ShowTextEditor="true" /></td>
         </tr>
          <tr>
            <td valign="top" style="white-space: nowrap;">
                 <asp:Label ID="QuestionNum_3" runat="server" Text="3" />.&nbsp;&nbsp;<asp:Label ID="Question_3" runat="server" Text="Years of use" />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_3"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_3"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_3" runat="server" /></td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="2" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_3" runat="server" ShowTextEditor="true" /></td>
         </tr>        

</table>

<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_1.ClientID %>'),$('<%= SurveyItemNum_1.ClientID %>'),$('<%= SurveyItemResult_1.ClientID %>'),$('<%= SurveyItemNotes_1.ClientID %>'),'Acid Suppression History',$('<%= QuestionNum_1.ClientID %>'),$('<%= Question_1.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_2.ClientID %>'),$('<%= SurveyItemNum_2.ClientID %>'),$('<%= SurveyItemResult_2.ClientID %>'),$('<%= SurveyItemNotes_2.ClientID %>'),'Acid Suppression History',$('<%= QuestionNum_2.ClientID %>'),$('<%= Question_2.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_2.ClientID %>'),$('<%= SurveyDate_2.ClientID %>'),$('<%= SurveyType_2.ClientID %>'),$('<%= SurveyItem_3.ClientID %>'),$('<%= SurveyItemNum_3.ClientID %>'),$('<%= SurveyItemResult_3.ClientID %>'),$('<%= SurveyItemNotes_3.ClientID %>'),'Acid Suppression History',$('<%= QuestionNum_3.ClientID %>'),$('<%= Question_3.ClientID %>'));

    function addAbsentEvent(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question)
    {          
        $(surveyDateText).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question));
        $(surveyItemResult).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question));
        $(surveyItemNotes).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question));   
        
    }
   
    /* ]]> */
   
    function SetHiddenFields(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question)
    {                       
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
       
</script>