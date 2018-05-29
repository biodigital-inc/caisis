<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.LabTestsBreastFU"
    CodeFile="LabTestsBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript">
    tableArray.BreastLabTestsHtmlTbl = "BreastLabTestsHtmlTbl";
    
    function ShowHideLabTestsTR(option_value)
    {
      var BreastLabTestDetailsTR = $('BreastLabTestDetails');
      if (option_value == "Yes")
      {
        BreastLabTestDetailsTR.style.display='block';
      } 
      else if (option_value == "No")
      {
        BreastLabTestDetailsTR.style.display='none';
        
        //clears row data
        for(var i=1;i<=5;i++)
        {
            clearElementsInParentRow(document.getElementById('BreastLabTestsHtmlTr'+i));
        }
      }
    }
</script>

<br /><br /><a name="LabTestsBreastFU" /><span class="controlBoxTitle">Lab Tests</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
 <tr >
    <td style="white-space:nowrap;"><strong>Any Lab Tests performed ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="LabTestsDone" id="LabTestsDone" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:40%"></td>
  </tr>
 <tr id="BreastLabTestDetails" style="display: none;">
     <td style="padding: 0px 0px 0px 16px;" colspan="3">
        <table width="250" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BreastLabTestsHtmlTbl">
            <tr>
                <td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                <td width="23%" class="controlBoxDataGridHeaderFirstCol">Test</td>
                <td width="20%" class="controlBoxDataGridHeaderFirstCol">Result</td>
                <td width="15%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
                <td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            <asp:Repeater ID="BreastLabTests" runat="server" OnItemDataBound="EFormRepeaterOnDataBoundForOther">
                <ItemTemplate>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabNotes,LabQuality', 'LabTests');">
                        <td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabNotes") %>&nbsp;</td>
                        <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" 
                            height="11" id="OtherLockImage" runat="server" title="This record has been locked.">&nbsp;</td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            
            <tr id="BreastLabTestsHtmlTr1">
                <td height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="1" ID="LabDateText_1" Table="LabTests" Field="LabDateText" runat="server" 
                        ShowCalendar="True" CalcDate="True" class="InputText" />
                    <euc:EformHidden style="width: 80px;" RecordId="1" ID="LabDate_1" Table="LabTests" Field="LabDate" runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDropDownList Style="width: 80px;" RecordId="1" ID="LabTest_1" Table="LabTests" Field="LabTest" 
                        LookupCode="BreastGeneticTests" runat="server" /></td>
                <td align="center">
                    <euc:EformDropDownList Style="width: 80px;" RecordId="1" ID="LabResult_1" Table="LabTests" Field="LabResult" runat="server" 
                        ShowEmptyListItem="true" LookupCode="DxResult,Disease,Breast" /></td>
                <td align="center">
                    <euc:EformTextBox Width="100px" RecordId="1" ID="LabNotes_1" Table="LabTests" Field="LabNotes" runat="server" 
                        ShowTextEditor="true" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="1" ID="LabQuality_1" Table="LabTests" Field="LabQuality" 
                        runat="server" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" /></td>
            </tr>
            <tr id="BreastLabTestsHtmlTr2">
                <td height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="2" ID="LabDateText_2" Table="LabTests" Field="LabDateText" runat="server" 
                        ShowCalendar="True" CalcDate="True" class="InputText" />
                    <euc:EformHidden style="width: 80px;" RecordId="2" ID="LabDate_2" Table="LabTests" Field="LabDate" runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDropDownList Style="width: 80px;" RecordId="2" ID="LabTest_2" Table="LabTests" Field="LabTest" 
                        LookupCode="BreastGeneticTests" runat="server" /></td>
                <td align="center">
                    <euc:EformDropDownList Style="width: 80px;" RecordId="2" ID="LabResult_2" Table="LabTests" Field="LabResult" runat="server" 
                        ShowEmptyListItem="true" LookupCode="DxResult,Disease,Breast" /></td>
                <td align="center">
                    <euc:EformTextBox Width="100px" RecordId="2" ID="LabNotes_2" Table="LabTests" Field="LabNotes" runat="server" 
                        ShowTextEditor="true" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="2" ID="LabQuality_2" Table="LabTests" Field="LabQuality" 
                        runat="server" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" /></td>
            </tr>
            <tr style="display: none;" id="BreastLabTestsHtmlTr3">
                <td height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="3" ID="LabDateText_3" Table="LabTests" Field="LabDateText" runat="server" 
                        ShowCalendar="True" CalcDate="True" class="InputText" />
                    <euc:EformHidden style="width: 80px;" RecordId="3" ID="LabDate_3" Table="LabTests" Field="LabDate" runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDropDownList Style="width: 80px;" RecordId="3" ID="LabTest_3" Table="LabTests" Field="LabTest" 
                        LookupCode="BreastGeneticTests" runat="server" /></td>
                <td align="center">
                    <euc:EformDropDownList Style="width: 80px;" RecordId="3" ID="LabResult_3" Table="LabTests" Field="LabResult" runat="server" 
                        ShowEmptyListItem="true" LookupCode="DxResult,Disease,Breast" /></td>
                <td align="center">
                    <euc:EformTextBox Width="100px" RecordId="3" ID="LabNotes_3" Table="LabTests" Field="LabNotes" runat="server" 
                        ShowTextEditor="true" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="3" ID="LabQuality_3" Table="LabTests" Field="LabQuality" 
                        runat="server" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" /></td>
            </tr>
            <tr style="display: none;" id="BreastLabTestsHtmlTr4">
                <td height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="4" ID="LabDateText_4" Table="LabTests" Field="LabDateText" runat="server" 
                        ShowCalendar="True" CalcDate="True" class="InputText" />
                    <euc:EformHidden style="width: 80px;" RecordId="4" ID="LabDate_4" Table="LabTests" Field="LabDate" runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDropDownList Style="width: 80px;" RecordId="4" ID="LabTest_4" Table="LabTests" Field="LabTest" 
                        LookupCode="BreastGeneticTests" runat="server" /></td>
                <td align="center">
                    <euc:EformDropDownList Style="width: 80px;" RecordId="4" ID="LabResult_4" Table="LabTests" Field="LabResult" runat="server" 
                        ShowEmptyListItem="true" LookupCode="DxResult,Disease,Breast" /></td>
                <td align="center">
                    <euc:EformTextBox Width="100px" RecordId="4" ID="LabNotes_4" Table="LabTests" Field="LabNotes" runat="server" 
                        ShowTextEditor="true" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="4" ID="LabQuality_4" Table="LabTests" Field="LabQuality" 
                        runat="server" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" /></td>
            </tr>
            <tr style="display: none;" id="BreastLabTestsHtmlTr5">
                <td height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="5" ID="LabDateText_5" Table="LabTests" Field="LabDateText" runat="server" 
                        ShowCalendar="True" CalcDate="True" class="InputText" />
                    <euc:EformHidden style="width: 80px;" RecordId="5" ID="LabDate_5" Table="LabTests" Field="LabDate" runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDropDownList Style="width: 80px;" RecordId="5" ID="LabTest_5" Table="LabTests" Field="LabTest" 
                        LookupCode="BreastGeneticTests" runat="server" /></td>
                <td align="center">
                    <euc:EformDropDownList Style="width: 80px;" RecordId="5" ID="LabResult_5" Table="LabTests" Field="LabResult" runat="server" 
                        ShowEmptyListItem="true" LookupCode="DxResult,Disease,Breast" /></td>
                <td align="center">
                    <euc:EformTextBox Width="100px" RecordId="5" ID="LabNotes_5" Table="LabTests" Field="LabNotes" runat="server" 
                        ShowTextEditor="true" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="5" ID="LabQuality_5" Table="LabTests" Field="LabQuality" 
                        runat="server" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" /></td>
            </tr>
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
            onclick="return showFirstAdditionalRow(this,'BreastLabTestsHtmlTbl');" /><br /><br />
     </td>
 </tr>
</table><br /><br />
    
    

<script type="text/javascript">
    //Adds events to controls
    function addEvents(labDateTextID,labTestID,labResultID,labQualityID)
    { 
        $(labDateTextID).addEvent('blur',curry(SetHiddenFields,labDateTextID,labTestID,labResultID,labQualityID));
        $(labTestID).addEvent('blur',curry(SetHiddenFields,labDateTextID,labTestID,labResultID,labQualityID));
        $(labResultID).addEvent('blur',curry(SetHiddenFields,labDateTextID,labTestID,labResultID,labQualityID));
   }

    addEvents($('<%= LabDateText_1.ClientID %>'),$('<%= LabTest_1.ClientID %>'),$('<%= LabResult_1.ClientID %>'),$('<%= LabQuality_1.ClientID %>'));
    addEvents($('<%= LabDateText_2.ClientID %>'),$('<%= LabTest_2.ClientID %>'),$('<%= LabResult_2.ClientID %>'),$('<%= LabQuality_2.ClientID %>'));
    addEvents($('<%= LabDateText_3.ClientID %>'),$('<%= LabTest_3.ClientID %>'),$('<%= LabResult_3.ClientID %>'),$('<%= LabQuality_3.ClientID %>'));
    addEvents($('<%= LabDateText_4.ClientID %>'),$('<%= LabTest_4.ClientID %>'),$('<%= LabResult_4.ClientID %>'),$('<%= LabQuality_4.ClientID %>'));
    addEvents($('<%= LabDateText_5.ClientID %>'),$('<%= LabTest_5.ClientID %>'),$('<%= LabResult_5.ClientID %>'),$('<%= LabQuality_5.ClientID %>'));
    
function SetHiddenFields(labDateTextID,labTestID,labResultID,labQualityID)
{
    if (labDateTextID.value != '' || labTestID.value != '' || labResultID.value != '' )
    {
        labQualityID.value = 'STD';
    }
    else
    { 
        labQualityID.value = '';
    }
}
</script>

