<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.SmokingSurveyThoracic" CodeFile="SmokingSurveyThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SmokingSurveyThoracic" /><span class="controlBoxTitle">Smoking History Survey</span> <br/>
<table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SmokingHxHtmlTbl">
  <tr>
	<td  class="controlBoxDataGridTitleColumn">Date</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
	<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="Surveys" FIELD="SurveyDateText" 
        Runat="server" ID="SurveyDateText_1"/>
        <euc:EformHidden RecordId="1" TABLE="Surveys" FIELD="SurveyDate" Runat="server" ID="SurveyDate_1"/></td>
    <td align="center"><euc:EformTextBox RecordId="1" Width="150px" TABLE="Surveys" FIELD="SurveyType" Runat="server" ID="SurveyType_1"/>
        <euc:EformTextBox RecordId="1" Width="1px" style="display:none;" TABLE="Surveys" FIELD="SurveyQuality" Runat="server" ID="SurveyQuality_1"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
<tr>
    <td colspan="3">
        <table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SmokingHxTable">
  <tr>
	<td  class="controlBoxDataGridTitleColumn">Item</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center; padding-right:60px;">Result</td>
	<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr>
	 <td><asp:Label runat="server" ID="survey1" Text="Cigarette Hx"/><euc:EformTextBox RecordId="1" Width="1px" style=" display:none;" 
	    TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_1"/></td>
	 <td><euc:EformDropDownList RecordId="1" Width="100px" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_1" 
	    LookupCode="ThoracicCigaretteHx"/></td>
	<td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr>
	 <td><asp:Label runat="server" ID="survey2" Text="Packs per day"/><euc:EformTextBox RecordId="2" Width="1px" style=" display:none;" 
	    TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_2" /></td>
	 <td><euc:EformTextBox RecordId="2" Width="100px" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_2"/></td>
	<td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr>
	 <td><asp:Label runat="server" ID="survey3" Text="Years smoked"/><euc:EformTextBox RecordId="3" Width="1px" style=" display:none;" 
	    TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_3" /></td>
	 <td><euc:EformTextBox RecordId="3" Width="100px" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_3"/></td>
	<td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr>
	 <td><asp:Label runat="server" ID="survey4" Text="Pack years"/><euc:EformTextBox RecordId="4" Width="1px" style=" display:none;" 
	    TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_4" /></td>
	 <td><euc:EformTextBox RecordId="4" Width="100px" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_4"/></td>
	<td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr>
	 <td><asp:Label runat="server" ID="survey5" Text="Time Quit"/><euc:EformTextBox RecordId="5" Width="1px" style=" display:none;" 
	    TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_5" /></td>
	 <td><euc:EformDropDownList RecordId="5" Width="100px" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_5" 
	    LookupCode="ThoracicTimeQuit"/></td>
	 <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr>
	 <td><asp:Label runat="server" ID="survey6" Text="Quit by OR?"/><euc:EformTextBox RecordId="6" Width="1px" style=" display:none;" 
	    TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_6" /></td>
	 <td><euc:EformDropDownList RecordId="6" Width="100px" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_6" 
	    LookupCode="YesNoUnknown"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr>
	 <td><asp:Label runat="server" ID="survey7" Text="Other Tobacco"/><euc:EformTextBox RecordId="7" Width="1px" style=" display:none;" 
	    TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_7" /></td>
	 <td><euc:EformDropDownList RecordId="7" Width="100px" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_7" 
	    LookupCode="ThoracicTobacco"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr>
	 <td><asp:Label runat="server" ID="survey8" Text="Asbestos Exposure"/><euc:EformTextBox RecordId="8" Width="1px" 
	    style="display:none;" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_8" /></td>
	 <td><euc:EformDropDownList RecordId="8" Width="100px" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_8" 
	    LookupCode="ThoracicAsbestosExposure"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table><br />
    </td>
</tr>
</table><br /><br />

<script type="text/javascript">
    //Adds events to controls
    function addEvents(surveyResult,surveyItem,surveyLbl)
    { 
        $(surveyResult).addEvent('blur',curry(AutoPopulates,surveyResult,surveyItem,surveyLbl));
    }
 
    addEvents($('<%= SurveyItemResult_1.ClientID %>'),$('<%= SurveyItem_1.ClientID %>'),$('<%= survey1.ClientID %>'));
    addEvents($('<%= SurveyItemResult_2.ClientID %>'),$('<%= SurveyItem_2.ClientID %>'),$('<%= survey2.ClientID %>'));
    addEvents($('<%= SurveyItemResult_3.ClientID %>'),$('<%= SurveyItem_3.ClientID %>'),$('<%= survey3.ClientID %>'));
    addEvents($('<%= SurveyItemResult_4.ClientID %>'),$('<%= SurveyItem_4.ClientID %>'),$('<%= survey4.ClientID %>'));
    addEvents($('<%= SurveyItemResult_5.ClientID %>'),$('<%= SurveyItem_5.ClientID %>'),$('<%= survey5.ClientID %>'));
    addEvents($('<%= SurveyItemResult_6.ClientID %>'),$('<%= SurveyItem_6.ClientID %>'),$('<%= survey6.ClientID %>'));  
    addEvents($('<%= SurveyItemResult_7.ClientID %>'),$('<%= SurveyItem_7.ClientID %>'),$('<%= survey7.ClientID %>'));
    addEvents($('<%= SurveyItemResult_8.ClientID %>'),$('<%= SurveyItem_8.ClientID %>'),$('<%= survey8.ClientID %>'));   


    function AutoPopulates(surveyResult,surveyItem,surveyLbl)
    {
       if (surveyResult.value != '')
        {
           surveyItem.value = surveyLbl.innerText;
        }
        else
        {
            surveyItem.value = '';
        }
    }

    function addSmokingHxEvents(surveyDate,surveyType,surveyQlty)
    { 
        $(surveyDate).addEvent('blur',curry(SmokingHxPopulates,surveyDate,surveyType,surveyQlty));
    }
 
    addSmokingHxEvents($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyQuality_1.ClientID %>'));


    function SmokingHxPopulates(surveyDate,surveyType,surveyQlty)
    {
       if (surveyDate.value != '')
        {
           surveyType.value = 'Thoracic Smoking';
           surveyQlty.value = 'STD';
        }
        else
        {
            surveyType.value = '';
            surveyQlty.value = '';
        }
    }
</script>