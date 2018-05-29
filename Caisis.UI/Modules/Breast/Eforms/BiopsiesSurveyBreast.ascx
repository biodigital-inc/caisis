<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.BiopsiesSurveyBreast" CodeFile="BiopsiesSurveyBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.BiopsiesSurveryBreastHtmlTable = "BiopsiesSurveryBreastHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="BiopsiesSurveyBreast" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Prior Negative Biopsies"></asp:Label><br/>

<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BiopsiesSurveryBreastHtmlTable">
 
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td width="30%" class="controlBoxDataGridTitleColumn">Date&nbsp;</td>
    <td width="30%" class="controlBoxDataGridTitleColumn">Survey Type&nbsp;</td>
    <td width="30%" class="controlBoxDataGridTitleColumn">Question&nbsp;</td>
    <td width="15%" class="controlBoxDataGridTitleColumn">Result&nbsp;</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
 
   <asp:Repeater ID="SurveysHistory" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Surveys', <%# DataBinder.Eval(Container.DataItem, "SurveyId") %>, 'SurveyDateText,SurveyType,SurveyItem,SurveyItemResult,SurveyQuality','Surveys');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SurveyDateText")%></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SurveyType")%></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SurveyItem")%></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SurveyItemResult")%></td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
   

  <tr > 

    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="1"  ID="SurveyDateText" TABLE="Surveys" FIELD="SurveyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="1" Runat="server" ID="SurveyDate" Table="Surveys" Field="SurveyDate"></euc:EformHidden>	</td>

    <td  style="white-space: nowrap;" class="ClinicalEformGridColumnOne">
        <euc:CaisisTextBox Width="1px" style="display: none;" TABLE="NoTable" FIELD="BreastBiopsiesSurvey"   ID="BreastBiopsiesSurvey" LookupCode="SurveyType" Runat="server"  Value="Breast Biopsies"  />Breast Biopsies
    </td>
    
    <td  style="white-space: nowrap;">              
        <euc:EformTextBox  Width="1px" style="display: none;" Runat="server" RecordId="1"  TABLE="Surveys" FIELD="SurveyType"  ID="SurveyType"  />

        <euc:EformComboBox DropDownWidth="auto" style="width: 250px;"  Runat="server" RecordId="1" ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItem"  ID="SurveyItem_1" CascadeValuesBasedOn="BreastBiopsiesSurvey" CascadeFormatString="SurveyItem_{0}"  />&nbsp;</td>
    
    <td style="white-space: nowrap;">
        <euc:EformComboBox LookupCode="PriorBreastBiopsies" style="width: 100px;" Runat="server" RecordId="1" ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItemResult"  ID="SurveyItemResult_1"  />  
        <euc:EformTextBox Width="1px" style="display: none;"  Runat="server"  RecordId="1"  TABLE="Surveys" FIELD="SurveyQuality"  ID="SurveyQuality" LookupCode="DataQuality"/></td>

    <td><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td>
    
  </tr>
  <tr>       
      <td></td>
      <td></td>

    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width: 250px;" Runat="server" RecordId="2" ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItem"  ID="SurveyItem_2" CascadeValuesBasedOn="BreastBiopsiesSurvey" CascadeFormatString="SurveyItem_{0}"  />&nbsp;</td>

    <td style="white-space: nowrap;">
        <euc:EformComboBox LookupCode="PriorBreastBiopsies" style="width: 100px;" Runat="server" RecordId="2" ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItemResult"  ID="SurveyItemResult_2"  /></td>
    

    <td><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/></td>
  </tr>

 </table>
 
<br/><br/><br/>



<script type="text/javascript">
    //Adds events to controls
    function addEvents(surveyDateTextID,surveyTypeID,surveyItem1,surveyItem2,surveyResult1,surveyResult2,surveyDataQuality)
    { 
        $(surveyDateTextID).addEvent('blur',curry(SetHiddenFields1,surveyDateTextID,surveyTypeID,surveyItem1,surveyItem2,surveyResult1,surveyResult2,surveyDataQuality));
        $(surveyResult1).addEvent('blur',curry(SetHiddenFields1,surveyDateTextID,surveyTypeID,surveyItem1,surveyItem2,surveyResult1,surveyResult2,surveyDataQuality));
        $(surveyResult2).addEvent('blur',curry(SetHiddenFields1,surveyDateTextID,surveyTypeID,surveyItem1,surveyItem2,surveyResult1,surveyResult2,surveyDataQuality));
   }
 
    addEvents($('<%= SurveyDateText.ClientID %>'),$('<%= SurveyType.ClientID %>'),$('<%= SurveyItem_1.ClientID %>'),$('<%= SurveyItem_2.ClientID %>'),$('<%= SurveyItemResult_1.ClientID %>'),$('<%= SurveyItemResult_2.ClientID %>'),$('<%= SurveyQuality.ClientID %>'));


    function SetHiddenFields1(surveyDateTextID,surveyTypeID,surveyItem1,surveyItem2,surveyResult1,surveyResult2,surveyDataQuality)
    {
   
           if (surveyDateTextID.value != '' || surveyResult1.value != '' || surveyResult2.value != '' || surveyDataQuality.value != '')
            {
               surveyTypeID.value = "Breast Biopsies";
               surveyDataQuality.value = 'STD';
            }
            else
            {
                surveyTypeID.value = '';
                surveyDataQuality.value = '';
            }
             
    }


</script>