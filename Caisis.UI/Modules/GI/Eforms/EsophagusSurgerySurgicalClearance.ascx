<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgerySurgicalClearance" CodeFile="EsophagusSurgerySurgicalClearance.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="EsophagusSurgerySurgicalClearance" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgical Clearance"></asp:Label><br/>

<br />
<table class="eformLargePopulatedTable">
    <tr>
        <td>
            <span class="controlBoxTitle">Pulmonary Function Tests ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="PulmonaryRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="PulmonaryRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="PulmonaryAbsentDiv" runat="server" style="display: none;" >
 <br /><br />  
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="PulmonaryAbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="16" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_16"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="16" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_16"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>
<br />
</div>
                
<div id="PulmonaryDiv" runat="server" style="display: none;">
 <br /><br />  
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PulmonaryiditiesHtmlTable">
 
    <tr> 
        <td style="white-space:nowrap; ">   <strong>Date: </strong> 	
	        <euc:EformTextBox Width="100px"  RecordId="16"  TABLE="Surveys" FIELD="SurveyDateText" ID="SurveyDateText_16" Runat="server" ShowCalendar="True" CalcDate="True" class="InputText"  />
	        <euc:EformHidden RecordId="16"  Table="Surveys" Field="SurveyDate" ID="SurveyDate_16" Runat="server" />	
	        
	        <euc:EformTextBox Width="1px" style="display: none; " RecordId="16"  TABLE="Surveys" FIELD="SurveyType" ID="SurveyType_16" Runat="server"  />
	        
	        </td>
        <td colspan="3" style="white-space:nowrap; "><strong>Notes: </strong>    	
	        <euc:EformTextBox Width="300px"  RecordId="16"  TABLE="Surveys" FIELD="SurveyNotes" ID="SurveyNotes_16" Runat="server" ShowTextEditor="true"  /></td>
   </tr>
   
   <tr> 
    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Test</td>
    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Volume(L)</td>
    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >% predicted</td>
    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >% after dilators</td>
  </tr>

  
    <tr> 
        <td style="white-space:nowrap; "><strong><asp:Label ID="FuntionTest_FEV1" runat="server" Text="FEV1" /></strong></td>
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="100px" RecordId="1" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_1" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="16" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_1" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_1" runat="server" />       
        </td>
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_2" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="16" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_2" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_2" runat="server" />       
        </td>
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_3" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="16" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_3" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_3" runat="server" />       
        </td>
   </tr>
    <tr> 
        <td style="white-space:nowrap; "><strong><asp:Label ID="FuntionTest_FVC" runat="server" Text="FVC" /></strong></td>
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="100px" RecordId="4" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_4" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="16" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_4" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_4" runat="server" />       
        </td>
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="100px" RecordId="5" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_5" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="16" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_5" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_5" runat="server" />       
        </td>
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="100px" RecordId="6" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_6" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" ParentRecordId="16" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_6" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_6" runat="server" />       
        </td>
   </tr>
    <tr> 
        <td style="white-space:nowrap; "><strong><asp:Label ID="FuntionTest_DiffusionCapacity" runat="server" Text="Diffusion Capacity" /></strong></td>
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="100px" RecordId="7" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_7" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" ParentRecordId="16" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_7" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_7" runat="server" />       
        </td>
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="100px" RecordId="8" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_8" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" ParentRecordId="16" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_8" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_8" runat="server" />       
        </td>
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="100px" RecordId="9" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_9" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="9" ParentRecordId="16" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_9" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="9" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_9" runat="server" />       
        </td>
   </tr>
    <tr> 
    <td colspan="4" class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;<asp:Label ID="FuntionTest_OverallResults" runat="server" Text="Overall Results" /></td>
  </tr>
  <tr>
    <td colspan="4" style="white-space:nowrap; ">
        <euc:EformCheckBoxList RecordId="10" ParentRecordId="16"  TABLE="SurveyItems" FIELD="SurveyItemResult" ID="SurveyItemResult_10" runat="server" style="white-space:nowrap; "
                                  RepeatDirection="Vertical" RepeatLayout="Table" RepeatColumns="3" CellPadding="5" ShowOther="true"> 
            <asp:ListItem Value="COPD - mild" Text="COPD - mild"></asp:ListItem>              
            <asp:ListItem Value="COPD - moderate" Text="COPD - moderate"></asp:ListItem>              
            <asp:ListItem Value="COPD - severe" Text="COPD - severe"></asp:ListItem>              
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>              
        </euc:EformCheckBoxList>
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="10" ParentRecordId="16" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_10" runat="server" />
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="10" ParentRecordId="16" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_10" runat="server" />
        
        </td>
  </tr>

</table>

</div>
<table style="display: none; ">
    <tr id="PulmonaryAbsentRow">
        <td>
            <euc:EformTextBox RecordId="16" Table="AbsentEvents" Field="TableName" ID="TableName_16"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="16" Table="AbsentEvents" Field="FieldName" ID="FieldName_16"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="16" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_16"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="16" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_16"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="16" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_16"
            runat="server" Width="16px" Style="display: none;" />
        </td>
    </tr>
</table>
 <br /><br />  

<table class="eformLargePopulatedTable">
    <tr>
        <td>
            <span class="controlBoxTitle">Cardiac Stress Testing done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="CardiacStressTestingRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="CardiacStressTestingRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="CardiacStressTestingAbsentDiv" runat="server" style="display: none;" >
 <br /><br />  
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="CardiacStressTestingAbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="21" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_21"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="21" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_21"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>
<br />
</div>
                
<div id="CardiacStressTestingDiv" runat="server" style="display: none;">
 <br /><br />  
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="Table2">
    <tr> 
    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date</td>
    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
  </tr>

    <tr> 
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="80px" RecordId="21"  TABLE="Diagnostics" FIELD="DxDateText" ID="DxDateText_21" Runat="server"  ShowCalendar="True" CalcDate="True"   />
            <euc:EformHidden RecordId="21" Table="Diagnostics" Field="DxDate" ID="DxDate_21" Runat="server"   />
            
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="21"  TABLE="Diagnostics" FIELD="DxType" ID="DxType_21" Runat="server"  />
            <euc:EformTextBox Width="1px" style="display: none; " RecordId="21"  TABLE="Diagnostics" FIELD="DxResult" ID="DxResult_21" Runat="server"  />
            </td>
        <td style="white-space:nowrap; ">
            <euc:EformTextBox Width="150px" RecordId="21"  TABLE="Diagnostics" FIELD="DxNotes" ID="DxNotes_21" Runat="server" ShowTextEditor="true"   /></td>
   </tr>
</table>
</div>
<table style="display: none; ">
    <tr id="CardiacStressTestingAbsentRow">
        <td>
            <euc:EformTextBox RecordId="21" Table="AbsentEvents" Field="TableName" ID="TableName_21"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="21" Table="AbsentEvents" Field="FieldName" ID="FieldName_21"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="21" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_21"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="21" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_21"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="21" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_21"
            runat="server" Width="16px" Style="display: none;" />
        </td>
    </tr>
</table>
 <br /><br />  <br />



<script type="text/javascript">
    /* <![CDATA[ */


   function SetSurveyName() {

       if ($('<%= SurveyDateText_16.ClientID %>').value != '' || $('<%= SurveyNotes_16.ClientID %>').value != '' ||
                   $('<%= SurveyItemTotal_1.ClientID %>').value != '' ||
                   $('<%= SurveyItemTotal_2.ClientID %>').value != '' ||
                   $('<%= SurveyItemTotal_3.ClientID %>').value != '' ||
                   $('<%= SurveyItemTotal_4.ClientID %>').value != '' ||
                   $('<%= SurveyItemTotal_5.ClientID %>').value != '' ||
                   $('<%= SurveyItemTotal_6.ClientID %>').value != '' ||
                   $('<%= SurveyItemTotal_7.ClientID %>').value != '' ||
                   $('<%= SurveyItemTotal_8.ClientID %>').value != '' ||
                   $('<%= SurveyItemTotal_9.ClientID %>').value != ''

                 ) {
           return true;
       }
                 
        var cbl = $('<%= SurveyItemResult_10.ClientID %>').getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++) {
            var cblRef = cbl[j];
            if (cblRef.checked)
                return true;
        }

        return false;

    }


    addEventPulmonary($('<%= PulmonaryRecorded.ClientID %>'), $('<%= PulmonaryDiv.ClientID %>'), $('<%= PulmonaryAbsentDiv.ClientID %>'), $('<%= SurveyDateText_16.ClientID %>'), $('<%= SurveyDate_16.ClientID %>'), $('<%= SurveyType_16.ClientID %>'), $('<%= SurveyNotes_16.ClientID %>'), $('<%= SurveyItem_1.ClientID %>'), $('<%= SurveyItemResult_1.ClientID %>'), $('<%= SurveyItemTotal_1.ClientID %>'), $('<%= FuntionTest_FEV1.ClientID %>').innerHTML, 'Volume(L)');
    addEventPulmonary($('<%= PulmonaryRecorded.ClientID %>'), $('<%= PulmonaryDiv.ClientID %>'), $('<%= PulmonaryAbsentDiv.ClientID %>'), $('<%= SurveyDateText_16.ClientID %>'), $('<%= SurveyDate_16.ClientID %>'), $('<%= SurveyType_16.ClientID %>'), $('<%= SurveyNotes_16.ClientID %>'), $('<%= SurveyItem_2.ClientID %>'), $('<%= SurveyItemResult_2.ClientID %>'), $('<%= SurveyItemTotal_2.ClientID %>'), $('<%= FuntionTest_FEV1.ClientID %>').innerHTML, '% predicted');
    addEventPulmonary($('<%= PulmonaryRecorded.ClientID %>'), $('<%= PulmonaryDiv.ClientID %>'), $('<%= PulmonaryAbsentDiv.ClientID %>'), $('<%= SurveyDateText_16.ClientID %>'), $('<%= SurveyDate_16.ClientID %>'), $('<%= SurveyType_16.ClientID %>'), $('<%= SurveyNotes_16.ClientID %>'), $('<%= SurveyItem_3.ClientID %>'), $('<%= SurveyItemResult_3.ClientID %>'), $('<%= SurveyItemTotal_3.ClientID %>'), $('<%= FuntionTest_FEV1.ClientID %>').innerHTML, '% after dilators');

    addEventPulmonary($('<%= PulmonaryRecorded.ClientID %>'), $('<%= PulmonaryDiv.ClientID %>'), $('<%= PulmonaryAbsentDiv.ClientID %>'), $('<%= SurveyDateText_16.ClientID %>'), $('<%= SurveyDate_16.ClientID %>'), $('<%= SurveyType_16.ClientID %>'), $('<%= SurveyNotes_16.ClientID %>'), $('<%= SurveyItem_4.ClientID %>'), $('<%= SurveyItemResult_4.ClientID %>'), $('<%= SurveyItemTotal_4.ClientID %>'), $('<%= FuntionTest_FVC.ClientID %>').innerHTML, 'Volume(L)');
    addEventPulmonary($('<%= PulmonaryRecorded.ClientID %>'), $('<%= PulmonaryDiv.ClientID %>'), $('<%= PulmonaryAbsentDiv.ClientID %>'), $('<%= SurveyDateText_16.ClientID %>'), $('<%= SurveyDate_16.ClientID %>'), $('<%= SurveyType_16.ClientID %>'), $('<%= SurveyNotes_16.ClientID %>'), $('<%= SurveyItem_5.ClientID %>'), $('<%= SurveyItemResult_5.ClientID %>'), $('<%= SurveyItemTotal_5.ClientID %>'), $('<%= FuntionTest_FVC.ClientID %>').innerHTML, '% predicted');
    addEventPulmonary($('<%= PulmonaryRecorded.ClientID %>'), $('<%= PulmonaryDiv.ClientID %>'), $('<%= PulmonaryAbsentDiv.ClientID %>'), $('<%= SurveyDateText_16.ClientID %>'), $('<%= SurveyDate_16.ClientID %>'), $('<%= SurveyType_16.ClientID %>'), $('<%= SurveyNotes_16.ClientID %>'), $('<%= SurveyItem_6.ClientID %>'), $('<%= SurveyItemResult_6.ClientID %>'), $('<%= SurveyItemTotal_6.ClientID %>'), $('<%= FuntionTest_FVC.ClientID %>').innerHTML, '% after dilators');

    addEventPulmonary($('<%= PulmonaryRecorded.ClientID %>'), $('<%= PulmonaryDiv.ClientID %>'), $('<%= PulmonaryAbsentDiv.ClientID %>'), $('<%= SurveyDateText_16.ClientID %>'), $('<%= SurveyDate_16.ClientID %>'), $('<%= SurveyType_16.ClientID %>'), $('<%= SurveyNotes_16.ClientID %>'), $('<%= SurveyItem_7.ClientID %>'), $('<%= SurveyItemResult_7.ClientID %>'), $('<%= SurveyItemTotal_7.ClientID %>'), $('<%= FuntionTest_DiffusionCapacity.ClientID %>').innerHTML, 'Volume(L)');
    addEventPulmonary($('<%= PulmonaryRecorded.ClientID %>'), $('<%= PulmonaryDiv.ClientID %>'), $('<%= PulmonaryAbsentDiv.ClientID %>'), $('<%= SurveyDateText_16.ClientID %>'), $('<%= SurveyDate_16.ClientID %>'), $('<%= SurveyType_16.ClientID %>'), $('<%= SurveyNotes_16.ClientID %>'), $('<%= SurveyItem_8.ClientID %>'), $('<%= SurveyItemResult_8.ClientID %>'), $('<%= SurveyItemTotal_8.ClientID %>'), $('<%= FuntionTest_DiffusionCapacity.ClientID %>').innerHTML, '% predicted');
    addEventPulmonary($('<%= PulmonaryRecorded.ClientID %>'), $('<%= PulmonaryDiv.ClientID %>'), $('<%= PulmonaryAbsentDiv.ClientID %>'), $('<%= SurveyDateText_16.ClientID %>'), $('<%= SurveyDate_16.ClientID %>'), $('<%= SurveyType_16.ClientID %>'), $('<%= SurveyNotes_16.ClientID %>'), $('<%= SurveyItem_9.ClientID %>'), $('<%= SurveyItemResult_9.ClientID %>'), $('<%= SurveyItemTotal_9.ClientID %>'), $('<%= FuntionTest_DiffusionCapacity.ClientID %>').innerHTML, '% after dilators');

    addEventPulmonary($('<%= PulmonaryRecorded.ClientID %>'), $('<%= PulmonaryDiv.ClientID %>'), $('<%= PulmonaryAbsentDiv.ClientID %>'), $('<%= SurveyDateText_16.ClientID %>'), $('<%= SurveyDate_16.ClientID %>'), $('<%= SurveyType_16.ClientID %>'), $('<%= SurveyNotes_16.ClientID %>'), $('<%= SurveyItem_10.ClientID %>'), $('<%= SurveyItemResult_10.ClientID %>'), $('<%= SurveyItemTotal_10.ClientID %>'), $('<%= FuntionTest_OverallResults.ClientID %>').innerHTML, '');


    function addEventPulmonary(pulmonaryRecordedID,pulmonaryDivID,pulmonaryAbsentDivID, surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName)
    {
        $(pulmonaryRecordedID).addEvent('click', curry(PulmonaryYesNo, pulmonaryRecordedID, pulmonaryDivID, pulmonaryAbsentDivID, pulmonaryRecordedID,pulmonaryDivID,pulmonaryAbsentDivID, surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName));
        $(surveyDateTextID).addEvent('blur', curry(PulmonaryYesNo, pulmonaryRecordedID, pulmonaryDivID, pulmonaryAbsentDivID, surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName));
        $(surveyNotesID).addEvent('blur', curry(PulmonaryYesNo, pulmonaryRecordedID, pulmonaryDivID, pulmonaryAbsentDivID, surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName));


        if (surveyItemResultID.id.indexOf('_10') > -1) {
            var cbl = surveyItemResultID.getElementsByTagName('input');
            for (var j = 0; j < cbl.length; j++) {
                var cblRef = cbl[j];
                if (cblRef.type == 'checkbox')
                    $(cblRef).addEvent('click', curry(PulmonaryYesNo, pulmonaryRecordedID, pulmonaryDivID, pulmonaryAbsentDivID,surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName));
                else if (cblRef.type == 'text')
                    $(cblRef).addEvent('blur', curry(PulmonaryYesNo, pulmonaryRecordedID, pulmonaryDivID, pulmonaryAbsentDivID,surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName));
            }
        }
        else
            $(surveyItemResultID).addEvent('blur', curry(PulmonaryYesNo, pulmonaryRecordedID, pulmonaryDivID, pulmonaryAbsentDivID, surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName));

        $(surveyItemTotalID).addEvent('blur', curry(PulmonaryYesNo, pulmonaryRecordedID, pulmonaryDivID, pulmonaryAbsentDivID, surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName));
        
        // check on load as well
        PulmonaryYesNo(pulmonaryRecordedID, pulmonaryDivID, pulmonaryAbsentDivID,surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName);
    }

    /* ]]> */



    function PulmonaryYesNo(pulmonaryRecordedID, pulmonaryDivID, pulmonaryAbsentDivID,surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName)
    {
       var pulmonaryRecordedRef = pulmonaryRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < pulmonaryRecordedRef.length; i++) 
        if (pulmonaryRecordedRef[i].checked) {
            PulmonaryRadioClick(pulmonaryRecordedRef[i].value, pulmonaryDivID, pulmonaryAbsentDivID,surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName);
            }
    }

    function PulmonaryRadioClick(Pulmonaryoption_value, PulmonaryhideDiv, PulmonaryhideAbsentDiv,surveyDateTextID, surveyDateID, surveyTypeID, surveyNotesID, surveyItemID, surveyItemResultID, surveyItemTotalID, testName, testResultName)
    {
      if (Pulmonaryoption_value == "Yes")
      { 
        PulmonaryhideDiv.style.display='block';
        PulmonaryhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_16.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_16.ClientID %>').value='';
        document.getElementById('<%= TableName_16.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_16.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_16.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_16.ClientID %>').value = '';
        document.getElementById('<%= AbsentQuality_16.ClientID %>').value = '';

        if (surveyItemResultID.id.indexOf('_10') > -1) {

            var overallResults = RetrieveCheckBoxListSelectedValues(surveyItemResultID, "TABLE");
            if (overallResults != '') {
                surveyItemID.value = testName;
            }
            else {
                surveyItemID.value = '';
            }

        }
        else{

            if (surveyItemTotalID.value != '') {
                surveyItemID.value = testName;
                surveyItemResultID.value = testResultName;
            }
            else {
                surveyItemID.value = '';
                surveyItemResultID.value = '';
            }    
        }

        if (SetSurveyName) {
            surveyTypeID.value = 'Pulmonary Function Tests';
        }
        else
            surveyTypeID.value = '';

        
      }
      else if (Pulmonaryoption_value == "No" || Pulmonaryoption_value == "Unknown" || Pulmonaryoption_value == "N/A")
      {
        PulmonaryhideAbsentDiv.style.display='block';
        PulmonaryhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_16.ClientID %>').value = 'Surveys';
        document.getElementById('<%= FieldName_16.ClientID %>').value = 'SurveyType';        
        document.getElementById('<%= FieldValue_16.ClientID %>').value = 'Pulmonary Function Tests'; 
        
        if (Pulmonaryoption_value == "No")       
            document.getElementById('<%= AbsentReason_16.ClientID %>').value = 'None Recorded';        
        else if (Pulmonaryoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_16.ClientID %>').value = 'Unknown';
        else if (Pulmonaryoption_value == "N/A")
            document.getElementById('<%= AbsentReason_16.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= PulmonaryAbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_16.ClientID %>').value + ' as of ';
        document.getElementById('<%= AbsentQuality_16.ClientID %>').value = 'OUT';

        surveyDateTextID.value = '';
        surveyDateID.value = '';
        surveyTypeID.value = '';
        surveyNotesID.value = '';
        surveyItemID.value = '';
        if (surveyItemResultID.id.indexOf('_10') > -1) {
            ResetCheckBoxList(surveyItemResultID)
        }
        else
            surveyItemResultID.value = '';
        surveyItemTotalID.value = '';






     }
    }

    /*************************************************************************/
    /*************************************************************************/
    /*************************************************************************/

    addEventCST($('<%= CardiacStressTestingRecorded.ClientID %>'), $('<%= CardiacStressTestingDiv.ClientID %>'), $('<%= CardiacStressTestingAbsentDiv.ClientID %>'), $('<%= DxDateText_21.ClientID %>'), $('<%= DxDate_21.ClientID %>'), $('<%= DxType_21.ClientID %>'), $('<%= DxResult_21.ClientID %>'), $('<%= DxNotes_21.ClientID %>'));

    function addEventCST(cstRecordedID, cstDivID, cstAbsentDivID,dxDateTextID, dxDateID, dxTypeID, dxResultID, dxNotesID) {
        $(cstRecordedID).addEvent('click', curry(CSTYesNo, cstRecordedID, cstDivID, cstAbsentDivID,dxDateTextID, dxDateID, dxTypeID, dxResultID, dxNotesID));
        $(dxDateTextID).addEvent('blur', curry(CSTYesNo, cstRecordedID, cstDivID, cstAbsentDivID,dxDateTextID, dxDateID, dxTypeID, dxResultID, dxNotesID));
        $(dxNotesID).addEvent('blur', curry(CSTYesNo, cstRecordedID, cstDivID, cstAbsentDivID,dxDateTextID, dxDateID, dxTypeID, dxResultID, dxNotesID));

        // check on load as well
        CSTYesNo(cstRecordedID, cstDivID, cstAbsentDivID,dxDateTextID, dxDateID, dxTypeID, dxResultID, dxNotesID);
    }

    /* ]]> */

    function CSTYesNo(cstRecordedID, cstDivID, cstAbsentDivID,dxDateTextID, dxDateID, dxTypeID, dxResultID, dxNotesID) {
        var cstRecordedRef = cstRecordedID.getElementsByTagName('input');

        for (var i = 0; i < cstRecordedRef.length; i++)
            if (cstRecordedRef[i].checked) {
            CSTRadioClick(cstRecordedRef[i].value, cstDivID, cstAbsentDivID,dxDateTextID, dxDateID, dxTypeID, dxResultID, dxNotesID);
        }
    }

    function CSTRadioClick(CSToption_value, CSThideDiv, CSThideAbsentDiv,dxDateTextID, dxDateID, dxTypeID, dxResultID, dxNotesID) {
        if (CSToption_value == "Yes") {
            CSThideDiv.style.display = 'block';
            CSThideAbsentDiv.style.display = 'none';

            document.getElementById('<%= AbsentDateText_21.ClientID %>').value = '';
            document.getElementById('<%= AbsentDate_21.ClientID %>').value = '';
            document.getElementById('<%= TableName_21.ClientID %>').value = '';
            document.getElementById('<%= FieldName_21.ClientID %>').value = '';
            document.getElementById('<%= FieldValue_21.ClientID %>').value = '';
            document.getElementById('<%= AbsentReason_21.ClientID %>').value = '';
            document.getElementById('<%= AbsentQuality_21.ClientID %>').value = '';

            if (dxDateTextID.value != '' || dxNotesID.value != '') {

                dxTypeID.value = 'Cardiac Stress Test';
                dxResultID.value = 'Done';
            }
            else {
                dxTypeID.value = '';
                dxResultID.value = '';
            }

        }
        else if (CSToption_value == "No" || CSToption_value == "Unknown" || CSToption_value == "N/A") {
            CSThideAbsentDiv.style.display = 'block';
            CSThideDiv.style.display = 'none';

            document.getElementById('<%= TableName_21.ClientID %>').value = 'Diagnostics';
            document.getElementById('<%= FieldName_21.ClientID %>').value = 'DxType';
            document.getElementById('<%= FieldValue_21.ClientID %>').value = 'Cardiac Stress Testing';

            if (CSToption_value == "No")
                document.getElementById('<%= AbsentReason_21.ClientID %>').value = 'None Recorded';
            else if (CSToption_value == "Unknown")
                document.getElementById('<%= AbsentReason_21.ClientID %>').value = 'Unknown';
            else if (CSToption_value == "N/A")
                document.getElementById('<%= AbsentReason_21.ClientID %>').value = 'Not Applicable';

            document.getElementById('<%= CardiacStressTestingAbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_21.ClientID %>').value + ' as of ';
            document.getElementById('<%= AbsentQuality_21.ClientID %>').value = 'OUT';

            dxDateTextID.value = '';
            dxDateID.value = '';
            dxTypeID.value = '';
            dxResultID.value = '';
            dxNotesID.value = '';
        }
    }
</script>