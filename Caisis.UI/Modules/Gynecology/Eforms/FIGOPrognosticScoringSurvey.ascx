<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.FIGOPrognosticScoringSurvey" CodeFile="FIGOPrognosticScoringSurvey.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
#SurveyTable
{
    width: 650px;
}
#SurveyTable td
{
    font-size: 12px;
}
.FIGOPrognosticScoringSurveyNumber
{
    vertical-align: top;
    font-size: 14px;
    font-weight: bold;
    padding-right: 4px;
    padding-left: 4px;
    padding-top: 21px;
    background-color: #dddddd;
    color: #000000;
    border: solid 1px #cccccc;
    border-right: none;
    
}
.FIGOCalculateButton
{
    background-image: url(../../Images/EFormCalculate.png);
    height: 15px;
    width: 67px;
    vertical-align: middle;
    cursor: pointer;
}
</style>
<script language="javascript" type="text/javascript">
	tableArray.FIGOPrognosticScoringSurveyGridContainer = "FIGOPrognosticScoringSurveyGridContainer";
</script>

<a name="FIGOPrognosticScoringSurvey" id="FIGOPrognosticScoringSurvey" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="FIGO Prognostic Scoring"></asp:Label>


<table id="FIGOPrognosticScoringSurveyGridContainer"  cellspacing="0" cellpadding="0">

<tr><td class="FIGOPrognosticScoringSurveyNumber">
#1
</td>
<td>
<table id="SurveyTable_Record1" border="0" cellspacing="0" cellpadding="6" class="eformXLargePopulatedTable">
<tr>
	<td colspan="3" style="padding-top: 20px; padding-left: 16px; border-bottom: solid 1px #dddddd;" onclick="setFIGOPrognosticScoringSurveyFields(1);">
		<strong>Date</strong>
		<euc:EformTextBox Runat="server" ID="SurveyDateText" TABLE="Surveys" RecordId="1" FIELD="SurveyDateText" style="width:80px; margin-left: 20px;"  ShowCalendar="True" CalcDate="True"  AppendToOnChange="setFIGOPrognosticScoringSurveyFields(1);" />
		<euc:EformHidden  Runat="server" ID="SurveyDate" Table="Surveys" RecordId="1" Field="SurveyDate"></euc:EformHidden>
        <euc:EformTextBox style="display: none;" TABLE="Surveys"  RecordId="1"   FIELD="SurveyType" Runat="server" ID="SurveyType_1" />
        <euc:EformTextBox style="display: none;" TABLE="Surveys"  RecordId="1"   FIELD="SurveyQuality" Runat="server" ID="SurveyQuality_1" />
	</td>
</tr>
<tr>
	<td style="padding-top: 12px; padding-left: 16px; border-bottom: solid 1px #dddddd;">
        <strong>Disease</strong>
	</td>	
	<td style="padding-top: 12px; padding-left: 0px; border-bottom: solid 1px #dddddd;" >
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="1" ParentRecordId="1"  FIELD="SurveyItem" Runat="server" ID="SurveyItem_1_1" />
        <euc:EformComboBox LookupCode="GTD_SubDisease" id="SurveyItemResult_1_1" Table="SurveyItems" RecordId="1" ParentRecordId="1" Field="SurveyItemResult" runat="server" Width="210" />
	</td>
   <td  style="padding-top: 12px; padding-left: 0px; border-bottom: solid 1px #dddddd;"><euc:EformDeleteIcon  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(1);">
	<td style="padding-left: 16px; border-bottom: solid 1px #e6e6e6;">
        <strong>Age, years</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #e6e6e6;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_1_2" RecordId="2" ParentRecordId="1" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Age, years">		
			<asp:ListItem Text="<40" Value="0"  />	
			<asp:ListItem Text=">40" Value="1"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="2" ParentRecordId="1"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_1_2" />

	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #e6e6e6;"><euc:EformDeleteIcon ID="EformDeleteIcon1"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(1);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Antecedent Pregnancy</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_1_3" RecordId="3" ParentRecordId="1" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Antecedent Pregnancy">		
			<asp:ListItem Text="Mole" Value="0"  />	
			<asp:ListItem Text="Abortion" Value="1"  />
			<asp:ListItem Text="Term" Value="2"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="3" ParentRecordId="1"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_1_3" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);"></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(1);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Interval from Index<br />Pregnancy, months</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_1_4" RecordId="4" ParentRecordId="1" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Interval from Index Pregnancy, months">		
			<asp:ListItem Text="<4" Value="0"  />	
			<asp:ListItem Text="4-6" Value="1"  />
			<asp:ListItem Text="7-12" Value="2"  />
			<asp:ListItem Text=">12" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="4" ParentRecordId="1"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_1_4" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon3"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(1);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Pretreatment serum hCG,<br />IU/mL</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_1_5" RecordId="5" ParentRecordId="1" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Pretreatment serum hCG, IU/mL">		
			<asp:ListItem Text="<1000" Value="0"  />	
			<asp:ListItem Text="1000-10000" Value="1"  />
			<asp:ListItem Text="1000-100000" Value="2"  />
			<asp:ListItem Text=">100000" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="5" ParentRecordId="1"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_1_5" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon4"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(1);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Largest tumor size, cm<br />(including uterus)</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_1_6" RecordId="6" ParentRecordId="1" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Largest tumor size, cm (including uterus)">		
			<asp:ListItem Text="<3" Value="0"  />	
			<asp:ListItem Text="3-4" Value="1"  />
			<asp:ListItem Text=">5" Value="2"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="6" ParentRecordId="1"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_1_6" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee; "><euc:EformDeleteIcon ID="EformDeleteIcon5"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(1);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Site of Metastases</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_1_7" RecordId="7" ParentRecordId="1" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Site of Metastases">		
			<asp:ListItem Text="Lung" Value="0"  />	
			<asp:ListItem Text="Spleen/Kidney" Value="1"  />
			<asp:ListItem Text="GI" Value="2"  />
			<asp:ListItem Text="Liver/Brain" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="7" ParentRecordId="1"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_1_7" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon6"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(1);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Number of Metastases Identified</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_1_8" RecordId="8" ParentRecordId="1" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Number of Metastases Identified">		
			<asp:ListItem Text="1-4" Value="1"  />
			<asp:ListItem Text="5-8" Value="2"  />
			<asp:ListItem Text=">8" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="8" ParentRecordId="1"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_1_8" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon7"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(1);">
	<td style="padding-left: 16px;">
        <strong>Previously experienced treatment<br />failure after chemotherapy</strong>
	</td>	
	<td style="padding-left: 0px;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_1_9" RecordId="9" ParentRecordId="1" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Previously experienced treatment failure after chemotherapy">		
			<asp:ListItem Text="Single Drug" Value="2"  />
			<asp:ListItem Text="Two or More Drugs" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="9" ParentRecordId="1"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_1_9" />
	</td>
   <td  style="padding-left: 0px; "><euc:EformDeleteIcon ID="EformDeleteIcon8"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(1);">
	<td style="padding-left: 16px;">
        <strong>Total Score</strong>
	</td>	
	<td style="padding-left: 0px;" >
        <euc:EformTextBox style="width: 50px;" TABLE="Surveys"  RecordId="1" FIELD="SurveyTotal" Runat="server" ID="SurveyTotal_1" />
	    <img class="FIGOCalculateButton" src="../../Images/shim.gif" onclick="CalculateFIGOTotal(1);" />
	</td>
   <td  style="padding-left: 0px; "><euc:EformDeleteIcon ID="EformDeleteIcon36"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
</table>
</td></tr>
<tr style="display: none;"><td class="FIGOPrognosticScoringSurveyNumber">
#2
</td>
<td>
<table id="SurveyTable_Record2" border="0" cellspacing="0" cellpadding="6" class="eformXLargePopulatedTable">
<tr>
	<td colspan="3" style="padding-top: 20px; padding-left: 16px; border-bottom: solid 1px #dddddd;" onclick="setFIGOPrognosticScoringSurveyFields(2);">
		<strong>Date</strong>
		<euc:EformTextBox Runat="server" ID="SurveyDateText_2" TABLE="Surveys" RecordId="2" FIELD="SurveyDateText" style="width:80px; margin-left: 20px;"  ShowCalendar="True" CalcDate="True"  AppendToOnChange="setFIGOPrognosticScoringSurveyFields(2);" />
		<euc:EformHidden  Runat="server" ID="SurveyDate_2" TABLE="Surveys" RecordId="2" Field="SurveyDate"></euc:EformHidden>
        <euc:EformTextBox style="display: none;" TABLE="Surveys" RecordId="2"   FIELD="SurveyType" Runat="server" ID="SurveyType_2" />
        <euc:EformTextBox style="display: none;" TABLE="Surveys" RecordId="2"   FIELD="SurveyQuality" Runat="server" ID="SurveyQuality_2" />
	</td>
</tr>
<tr>
	<td style="padding-top: 12px; padding-left: 16px; border-bottom: solid 1px #dddddd;">
        <strong>Disease</strong>
	</td>	
	<td style="padding-top: 12px; padding-left: 0px; border-bottom: solid 1px #dddddd;" >
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="1" ParentRecordId="2"  FIELD="SurveyItem" Runat="server" ID="SurveyItem_2_1" />
        <euc:EformComboBox LookupCode="GTD_SubDisease" id="SurveyItemResult_2_1" Table="SurveyItems" RecordId="1" ParentRecordId="2" Field="SurveyItemResult" runat="server" Width="210" />
	</td>
   <td  style="padding-top: 12px; padding-left: 0px; border-bottom: solid 1px #dddddd;"><euc:EformDeleteIcon ID="EformDeleteIcon9"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(2);">
	<td style="padding-left: 16px; border-bottom: solid 1px #e6e6e6;">
        <strong>Age, years</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #e6e6e6;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_2_2" RecordId="2" ParentRecordId="2" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Age, years">		
			<asp:ListItem Text="<40" Value="0"  />	
			<asp:ListItem Text=">40" Value="1"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="2" ParentRecordId="2"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_2_2" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #e6e6e6;"><euc:EformDeleteIcon ID="EformDeleteIcon10"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(2);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Antecedent Pregnancy</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_2_3" RecordId="3" ParentRecordId="2" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Antecedent Pregnancy">		
			<asp:ListItem Text="Mole" Value="0"  />	
			<asp:ListItem Text="Abortion" Value="1"  />
			<asp:ListItem Text="Term" Value="2"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="3" ParentRecordId="2"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_2_3" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);"></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(2);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Interval from Index<br />Pregnancy, months</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_2_4" RecordId="4" ParentRecordId="2" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Interval from Index Pregnancy, months">		
			<asp:ListItem Text="<4" Value="0"  />	
			<asp:ListItem Text="4-6" Value="1"  />
			<asp:ListItem Text="7-12" Value="2"  />
			<asp:ListItem Text=">12" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="4" ParentRecordId="2"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_2_4" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon12"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(2);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Pretreatment serum hCG,<br />IU/mL</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_2_5" RecordId="5" ParentRecordId="2" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Pretreatment serum hCG, IU/mL">		
			<asp:ListItem Text="<1000" Value="0"  />	
			<asp:ListItem Text="1000-10000" Value="1"  />
			<asp:ListItem Text="1000-100000" Value="2"  />
			<asp:ListItem Text=">100000" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="5" ParentRecordId="2"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_2_5" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon13"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(2);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Largest tumor size, cm<br />(including uterus)</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_2_6" RecordId="6" ParentRecordId="2" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Largest tumor size, cm (including uterus)">		
			<asp:ListItem Text="<3" Value="0"  />	
			<asp:ListItem Text="3-4" Value="1"  />
			<asp:ListItem Text=">5" Value="2"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="6" ParentRecordId="2"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_2_6" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee; "><euc:EformDeleteIcon ID="EformDeleteIcon14"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(2);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Site of Metastases</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_2_7" RecordId="7" ParentRecordId="2" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Site of Metastases">		
			<asp:ListItem Text="Lung" Value="0"  />	
			<asp:ListItem Text="Spleen/Kidney" Value="1"  />
			<asp:ListItem Text="GI" Value="2"  />
			<asp:ListItem Text="Liver/Brain" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="7" ParentRecordId="2"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_2_7" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon15"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(2);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Number of Metastases Identified</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_2_8" RecordId="8" ParentRecordId="2" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Number of Metastases Identified">		
			<asp:ListItem Text="1-4" Value="1"  />
			<asp:ListItem Text="5-8" Value="2"  />
			<asp:ListItem Text=">8" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="8" ParentRecordId="2"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_2_8" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon16"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(2);">
	<td style="padding-left: 16px;">
        <strong>Previously experienced treatment<br />failure after chemotherapy</strong>
	</td>	
	<td style="padding-left: 0px;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_2_9" RecordId="9" ParentRecordId="2" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Previously experienced treatment failure after chemotherapy">		
			<asp:ListItem Text="Single Drug" Value="2"  />
			<asp:ListItem Text="Two or More Drugs" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="9" ParentRecordId="2"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_2_9" />
	</td>
   <td  style="padding-left: 0px; "><euc:EformDeleteIcon ID="EformDeleteIcon17"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>

<tr onclick="setFIGOPrognosticScoringSurveyFields(2);">
	<td style="padding-left: 16px;">
        <strong>Total Score</strong>
	</td>	
	<td style="padding-left: 0px;" >
        <euc:EformTextBox style="width: 50px;" TABLE="Surveys"  RecordId="2" FIELD="SurveyTotal" Runat="server" ID="SurveyTotal_2" />
	    <img class="FIGOCalculateButton" src="../../Images/shim.gif" onclick="CalculateFIGOTotal(2);" />
	</td>
   <td  style="padding-left: 0px; "><euc:EformDeleteIcon ID="EformDeleteIcon37"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>

</table>
</td></tr>
<tr style="display: none;"><td class="FIGOPrognosticScoringSurveyNumber">
#3
</td>
<td>
<table id="SurveyTable_Record3" border="0" cellspacing="0" cellpadding="6" class="eformXLargePopulatedTable">
<tr>
	<td colspan="3" style="padding-top: 20px; padding-left: 16px; border-bottom: solid 1px #dddddd;" onclick="setFIGOPrognosticScoringSurveyFields(3);">
		<strong>Date</strong>
		<euc:EformTextBox Runat="server" ID="SurveyDateText_3" TABLE="Surveys" RecordId="3" FIELD="SurveyDateText" style="width:80px; margin-left: 20px;"  ShowCalendar="True" CalcDate="True"  AppendToOnChange="setFIGOPrognosticScoringSurveyFields(3);" />
		<euc:EformHidden  Runat="server" ID="SurveyDate_3" TABLE="Surveys" RecordId="3" Field="SurveyDate"></euc:EformHidden>
        <euc:EformTextBox style="display: none;" TABLE="Surveys" RecordId="3"   FIELD="SurveyType" Runat="server" ID="SurveyType_3" />
        <euc:EformTextBox style="display: none;" TABLE="Surveys" RecordId="3"   FIELD="SurveyQuality" Runat="server" ID="SurveyQuality_3" />
	</td>
</tr>
<tr>
	<td style="padding-top: 12px; padding-left: 16px; border-bottom: solid 1px #dddddd;">
        <strong>Disease</strong>
	</td>	
	<td style="padding-top: 12px; padding-left: 0px; border-bottom: solid 1px #dddddd;" >
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="1" ParentRecordId="3"  FIELD="SurveyItem" Runat="server" ID="SurveyItem_3_1" />
        <euc:EformComboBox LookupCode="GTD_SubDisease" id="SurveyItemResult_3_1" Table="SurveyItems" RecordId="1" ParentRecordId="3" Field="SurveyItemResult" runat="server" Width="210" />
	</td>
   <td  style="padding-top: 12px; padding-left: 0px; border-bottom: solid 1px #dddddd;"><euc:EformDeleteIcon ID="EformDeleteIcon18"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(3);">
	<td style="padding-left: 16px; border-bottom: solid 1px #e6e6e6;">
        <strong>Age, years</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #e6e6e6;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_3_2" RecordId="2" ParentRecordId="3" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Age, years">		
			<asp:ListItem Text="<40" Value="0"  />	
			<asp:ListItem Text=">40" Value="1"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="2" ParentRecordId="3"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_3_2" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #e6e6e6;"><euc:EformDeleteIcon ID="EformDeleteIcon19"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(3);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Antecedent Pregnancy</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_3_3" RecordId="3" ParentRecordId="3" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Antecedent Pregnancy">		
			<asp:ListItem Text="Mole" Value="0"  />	
			<asp:ListItem Text="Abortion" Value="1"  />
			<asp:ListItem Text="Term" Value="2"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="3" ParentRecordId="3"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_3_3" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);"></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(3);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Interval from Index<br />Pregnancy, months</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_3_4" RecordId="4" ParentRecordId="3" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Interval from Index Pregnancy, months">		
			<asp:ListItem Text="<4" Value="0"  />	
			<asp:ListItem Text="4-6" Value="1"  />
			<asp:ListItem Text="7-12" Value="2"  />
			<asp:ListItem Text=">12" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="4" ParentRecordId="3"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_3_4" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon21"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(3);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Pretreatment serum hCG,<br />IU/mL</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_3_5" RecordId="5" ParentRecordId="3" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Pretreatment serum hCG, IU/mL">		
			<asp:ListItem Text="<1000" Value="0"  />	
			<asp:ListItem Text="1000-10000" Value="1"  />
			<asp:ListItem Text="1000-100000" Value="2"  />
			<asp:ListItem Text=">100000" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="5" ParentRecordId="3"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_3_5" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon22"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(3);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Largest tumor size, cm<br />(including uterus)</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_3_6" RecordId="6" ParentRecordId="3" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Largest tumor size, cm (including uterus)">		
			<asp:ListItem Text="<3" Value="0"  />	
			<asp:ListItem Text="3-4" Value="1"  />
			<asp:ListItem Text=">5" Value="2"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="6" ParentRecordId="3"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_3_6" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee; "><euc:EformDeleteIcon ID="EformDeleteIcon23"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(3);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Site of Metastases</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_3_7" RecordId="7" ParentRecordId="3" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Site of Metastases">		
			<asp:ListItem Text="Lung" Value="0"  />	
			<asp:ListItem Text="Spleen/Kidney" Value="1"  />
			<asp:ListItem Text="GI" Value="2"  />
			<asp:ListItem Text="Liver/Brain" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="7" ParentRecordId="3"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_3_7" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon24"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(3);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Number of Metastases Identified</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_3_8" RecordId="8" ParentRecordId="3" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Number of Metastases Identified">		
			<asp:ListItem Text="1-4" Value="1"  />
			<asp:ListItem Text="5-8" Value="2"  />
			<asp:ListItem Text=">8" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="8" ParentRecordId="3"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_3_8" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon25"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(3);">
	<td style="padding-left: 16px;">
        <strong>Previously experienced treatment<br />failure after chemotherapy</strong>
	</td>	
	<td style="padding-left: 0px;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_3_9" RecordId="9" ParentRecordId="3" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Previously experienced treatment failure after chemotherapy">		
			<asp:ListItem Text="Single Drug" Value="2"  />
			<asp:ListItem Text="Two or More Drugs" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="9" ParentRecordId="3"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_3_9" />
	</td>
   <td  style="padding-left: 0px; "><euc:EformDeleteIcon ID="EformDeleteIcon26"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(3);">
	<td style="padding-left: 16px;">
        <strong>Total Score</strong>
	</td>	
	<td style="padding-left: 0px;" >
        <euc:EformTextBox style="width: 50px;" TABLE="Surveys"  RecordId="3" FIELD="SurveyTotal" Runat="server" ID="SurveyTotal_3" />
	    <img class="FIGOCalculateButton" src="../../Images/shim.gif" onclick="CalculateFIGOTotal(3);" />
	</td>
   <td  style="padding-left: 0px; "><euc:EformDeleteIcon ID="EformDeleteIcon38"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>

</table>
</td></tr>
<tr style="display: none;"><td class="FIGOPrognosticScoringSurveyNumber">
#4
</td>
<td>
<table id="SurveyTable_Record4" border="0" cellspacing="0" cellpadding="6" class="eformXLargePopulatedTable">
<tr>
	<td colspan="3" style="padding-top: 20px; padding-left: 16px; border-bottom: solid 1px #dddddd;" onclick="setFIGOPrognosticScoringSurveyFields(4);">
		<strong>Date</strong>
		<euc:EformTextBox Runat="server" ID="SurveyDateText_4" TABLE="Surveys" RecordId="4" FIELD="SurveyDateText" style="width:80px; margin-left: 20px;"  ShowCalendar="True" CalcDate="True"  AppendToOnChange="setFIGOPrognosticScoringSurveyFields(4);" />
		<euc:EformHidden  Runat="server" ID="SurveyDate_4" TABLE="Surveys" RecordId="4" Field="SurveyDate"></euc:EformHidden>
        <euc:EformTextBox style="display: none;" TABLE="Surveys" RecordId="4"   FIELD="SurveyType" Runat="server" ID="SurveyType_4" />
        <euc:EformTextBox style="display: none;" TABLE="Surveys" RecordId="4"   FIELD="SurveyQuality" Runat="server" ID="SurveyQuality_4" />
	</td>
</tr>
<tr>
	<td style="padding-top: 12px; padding-left: 16px; border-bottom: solid 1px #dddddd;">
        <strong>Disease</strong>
	</td>	
	<td style="padding-top: 12px; padding-left: 0px; border-bottom: solid 1px #dddddd;" >
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="1" ParentRecordId="4"  FIELD="SurveyItem" Runat="server" ID="SurveyItem_4_1" />
        <euc:EformComboBox LookupCode="GTD_SubDisease" id="SurveyItemResult_4_1" Table="SurveyItems" RecordId="1" ParentRecordId="4" Field="SurveyItemResult" runat="server" Width="210" />
	</td>
   <td  style="padding-top: 12px; padding-left: 0px; border-bottom: solid 1px #dddddd;"><euc:EformDeleteIcon ID="EformDeleteIcon27"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(4);">
	<td style="padding-left: 16px; border-bottom: solid 1px #e6e6e6;">
        <strong>Age, years</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #e6e6e6;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_4_2" RecordId="2" ParentRecordId="4" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Age, years">		
			<asp:ListItem Text="<40" Value="0"  />	
			<asp:ListItem Text=">40" Value="1"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="2" ParentRecordId="4"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_4_2" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #e6e6e6;"><euc:EformDeleteIcon ID="EformDeleteIcon28"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(4);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Antecedent Pregnancy</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_4_3" RecordId="3" ParentRecordId="4" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Antecedent Pregnancy">		
			<asp:ListItem Text="Mole" Value="0"  />	
			<asp:ListItem Text="Abortion" Value="1"  />
			<asp:ListItem Text="Term" Value="2"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="3" ParentRecordId="4"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_4_3" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);"></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(4);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Interval from Index<br />Pregnancy, months</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_4_4" RecordId="4" ParentRecordId="4" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Interval from Index Pregnancy, months">		
			<asp:ListItem Text="<4" Value="0"  />	
			<asp:ListItem Text="4-6" Value="1"  />
			<asp:ListItem Text="7-12" Value="2"  />
			<asp:ListItem Text=">12" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="4" ParentRecordId="4"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_4_4" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon30"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(4);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Pretreatment serum hCG,<br />IU/mL</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_4_5" RecordId="5" ParentRecordId="4" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Pretreatment serum hCG, IU/mL">		
			<asp:ListItem Text="<1000" Value="0"  />	
			<asp:ListItem Text="1000-10000" Value="1"  />
			<asp:ListItem Text="1000-100000" Value="2"  />
			<asp:ListItem Text=">100000" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="5" ParentRecordId="4"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_4_5" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon31"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(4);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Largest tumor size, cm<br />(including uterus)</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_4_6" RecordId="6" ParentRecordId="4" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Largest tumor size, cm (including uterus)">		
			<asp:ListItem Text="<3" Value="0"  />	
			<asp:ListItem Text="3-4" Value="1"  />
			<asp:ListItem Text=">5" Value="2"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="6" ParentRecordId="4"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_4_6" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee; "><euc:EformDeleteIcon ID="EformDeleteIcon32"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(4);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Site of Metastases</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_4_7" RecordId="7" ParentRecordId="4" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Site of Metastases">		
			<asp:ListItem Text="Lung" Value="0"  />	
			<asp:ListItem Text="Spleen/Kidney" Value="1"  />
			<asp:ListItem Text="GI" Value="2"  />
			<asp:ListItem Text="Liver/Brain" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="7" ParentRecordId="4"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_4_7" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon33"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(4);">
	<td style="padding-left: 16px; border-bottom: solid 1px #eeeeee;">
        <strong>Number of Metastases Identified</strong>
	</td>	
	<td style="padding-left: 0px; border-bottom: solid 1px #eeeeee;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_4_8" RecordId="8" ParentRecordId="4" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Number of Metastases Identified">		
			<asp:ListItem Text="1-4" Value="1"  />
			<asp:ListItem Text="5-8" Value="2"  />
			<asp:ListItem Text=">8" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="8" ParentRecordId="4"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_4_8" />
	</td>
   <td  style="padding-left: 0px; border-bottom: solid 1px #eeeeee;"><euc:EformDeleteIcon ID="EformDeleteIcon34"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(4);">
	<td style="padding-left: 16px;">
        <strong>Previously experienced treatment<br />failure after chemotherapy</strong>
	</td>	
	<td style="padding-left: 0px;" >
        <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemTotal" id="SurveyItemTotal_4_9" RecordId="9" ParentRecordId="4" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyItem" Value1="Previously experienced treatment failure after chemotherapy">		
			<asp:ListItem Text="Single Drug" Value="2"  />
			<asp:ListItem Text="Two or More Drugs" Value="4"  />
	    </euc:EformRadioButtonList>
        <euc:EformTextBox style="display: none;" TABLE="SurveyItems"  RecordId="9" ParentRecordId="4"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_4_9" />
	</td>
   <td  style="padding-left: 0px; "><euc:EformDeleteIcon ID="EformDeleteIcon35"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>
<tr onclick="setFIGOPrognosticScoringSurveyFields(4);">
	<td style="padding-left: 16px;">
        <strong>Total Score</strong>
	</td>	
	<td style="padding-left: 0px;" >
        <euc:EformTextBox style="width: 50px;" TABLE="Surveys"  RecordId="4" FIELD="SurveyTotal" Runat="server" ID="SurveyTotal_4" />
	    <img class="FIGOCalculateButton" src="../../Images/shim.gif" onclick="CalculateFIGOTotal(4);" />
	</td>
   <td  style="padding-left: 0px; "><euc:EformDeleteIcon ID="EformDeleteIcon39"  runat="server" onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ></euc:EformDeleteIcon></td>
</tr>

</table>
</td></tr>


</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'FIGOPrognosticScoringSurveyGridContainer');" />
<br /><br /><br />

<script type="text/javascript">
function setFIGOPrognosticScoringSurveyFields(recordId)
{
    var surveyValueEntered = false;
    var surveyDate;
    var surveyType;
    var surveyQuality;
    var item_disease;
    var result_disease;
    var SurveyTable;
    
    switch (recordId)
    {
        case 1:
          surveyDate = $('<% = SurveyDateText.ClientID %>');
          surveyType = $('<% = SurveyType_1.ClientID %>');
          surveyQuality = $('<% = SurveyQuality_1.ClientID %>');
          item_disease = $('<% = SurveyItem_1_1.ClientID %>');
          result_disease = $('<% = SurveyItemResult_1_1.ClientID %>');
          SurveyTable = $('SurveyTable_Record1');
          break;
        case 2:
          surveyDate = $('<% = SurveyDateText_2.ClientID %>');
          surveyType = $('<% = SurveyType_2.ClientID %>');
          surveyQuality = $('<% = SurveyQuality_2.ClientID %>');
          item_disease = $('<% = SurveyItem_2_1.ClientID %>');
          result_disease = $('<% = SurveyItemResult_2_1.ClientID %>');
          SurveyTable = $('SurveyTable_Record2');
          break;
        case 3:
          surveyDate = $('<% = SurveyDateText_3.ClientID %>');
          surveyType = $('<% = SurveyType_3.ClientID %>');
          surveyQuality = $('<% = SurveyQuality_3.ClientID %>');
          item_disease = $('<% = SurveyItem_3_1.ClientID %>');
          result_disease = $('<% = SurveyItemResult_3_1.ClientID %>');
          SurveyTable = $('SurveyTable_Record3');
          break;
        case 4:
          surveyDate = $('<% = SurveyDateText_4.ClientID %>');
          surveyType = $('<% = SurveyType_4.ClientID %>');
          surveyQuality = $('<% = SurveyQuality_4.ClientID %>');
          item_disease = $('<% = SurveyItem_4_1.ClientID %>');
          result_disease = $('<% = SurveyItemResult_4_1.ClientID %>');
          SurveyTable = $('SurveyTable_Record4');
          break;
        default:
          break;
    }
    

    
    
    if (surveyDate.value != '') { surveyValueEntered = true; }
    if (result_disease.value != '') { surveyValueEntered = true; }
    
    
    if(!surveyValueEntered)
    {

        
        
        var inputs = SurveyTable.getElementsByTagName('input');
	    for (var i=0;i<inputs.length;i++)
	    {
		    type = inputs[i].getAttribute('type');
		    if (type == 'checkbox' || type == 'radio') {
			    if (inputs[i].checked == true) surveyValueEntered = true;
		    } else if (inputs[i].value != '')  {
			    surveyValueEntered = true; }
   	    }
 
 
    }
    
    
    if (surveyValueEntered)
    {
        surveyType.value = 'FIGO Prognostic Scoring';
        surveyQuality.value = 'STD';
        defaultFIGODiseaseField(item_disease,result_disease);
    }
    else
    {
        surveyType.value = '';
        surveyQuality.value = '';
    }

}

function defaultFIGODiseaseField(item_disease,result_disease)
{
    if (result_disease.value.length == 0)
    {
        item_disease.value = 'Disease';
        result_disease.value = 'Gestational Trophoblastic Disease';
    }
}

function addSurveyRadioLabelReferences()
{
    var allSurveysContainer = $('FIGOPrognosticScoringSurveyGridContainer');
    var labels = allSurveysContainer.getElementsByTagName('label');
    for (var i = 0; i < labels.length; i++) {
        if (labels[i].htmlFor != '') {
             var elem = document.getElementById(labels[i].htmlFor);
             if (elem)
             {
                elem.labelText = getNodeValue(labels[i]);
                elem.onclick = function() {setSurveyResponse(this,this.labelText)};
             }                    
        }
    }
}
addSurveyRadioLabelReferences();

function setSurveyResponse(rb,responseVal)
{
    var rbTd = rb.parentNode.parentNode.parentNode.parentNode.parentNode;
    var responseField = null;
    
    var inputs = rbTd.getElementsByTagName('input');
    for (var i=0;i<inputs.length;i++)
    {
	    var inputType = inputs[i].getAttribute('type');
	    var inputId = inputs[i].getAttribute('id');
	    
	    if (inputType == 'text' && inputId.indexOf('SurveyItemResult') > -1)
	    {
            responseField = inputs[i];
	    } 
    }
    
    if (responseField != null) {responseField.value = responseVal;}
    
}


function CalculateFIGOTotal(recordId)
{
    var total = 0;
    var surveyHtmlTableId = 'SurveyTable_Record' + recordId;
    var surveyHtmlTable = $(surveyHtmlTableId);
    var inputs = surveyHtmlTable.getElementsByTagName('input');
    
    for (var i=0;i<inputs.length;i++)
    {
	    var inputType = inputs[i].getAttribute('type');
	    
	    if (inputType == 'radio' && inputs[i].checked)
	    {
            total += parseInt(inputs[i].value);
	    } 
    }
    
    var target;
    
    switch (recordId)
    {
        case 1:
          target = $('<% = SurveyTotal_1.ClientID %>');
          break;
        case 2:
          target = $('<% = SurveyTotal_2.ClientID %>');
          break;
        case 3:
          target = $('<% = SurveyTotal_3.ClientID %>');
          break;
        case 4:
          target = $('<% = SurveyTotal_4.ClientID %>');
          break;
        default:
          break;
    }
    
    if (target!=null) target.value = total;
    
    
//    var q2,q3,q4,q5,q6,q7,q8,q9,target; // q1 is disease
//    
//    switch (recordId)
//    {
//        case 1:
//          q2 = $('<% = SurveyItemResult_1_2.ClientID %>');
//          q3 = $('<% = SurveyItemResult_1_3.ClientID %>');
//          q4 = $('<% = SurveyItemResult_1_4.ClientID %>');
//          q5 = $('<% = SurveyItemResult_1_5.ClientID %>');
//          q6 = $('<% = SurveyItemResult_1_6.ClientID %>');
//          q7 = $('<% = SurveyItemResult_1_7.ClientID %>');
//          q8 = $('<% = SurveyItemResult_1_8.ClientID %>');
//          q9 = $('<% = SurveyItemResult_1_9.ClientID %>');
//          target = $('<% = SurveyTotal_1.ClientID %>');
//          break;
//        case 2:
//          q2 = $('<% = SurveyItemResult_2_2.ClientID %>');
//          q3 = $('<% = SurveyItemResult_2_3.ClientID %>');
//          q4 = $('<% = SurveyItemResult_2_4.ClientID %>');
//          q5 = $('<% = SurveyItemResult_2_5.ClientID %>');
//          q6 = $('<% = SurveyItemResult_2_6.ClientID %>');
//          q7 = $('<% = SurveyItemResult_2_7.ClientID %>');
//          q8 = $('<% = SurveyItemResult_2_8.ClientID %>');
//          q9 = $('<% = SurveyItemResult_2_9.ClientID %>');
//          target = $('<% = SurveyTotal_2.ClientID %>');
//          break;
//        case 3:
//          q2 = $('<% = SurveyItemResult_3_2.ClientID %>');
//          q3 = $('<% = SurveyItemResult_3_3.ClientID %>');
//          q4 = $('<% = SurveyItemResult_3_4.ClientID %>');
//          q5 = $('<% = SurveyItemResult_3_5.ClientID %>');
//          q6 = $('<% = SurveyItemResult_3_6.ClientID %>');
//          q7 = $('<% = SurveyItemResult_3_7.ClientID %>');
//          q8 = $('<% = SurveyItemResult_3_8.ClientID %>');
//          q9 = $('<% = SurveyItemResult_3_9.ClientID %>');
//          target = $('<% = SurveyTotal_3.ClientID %>');
//          break;
//        case 4:
//          q2 = $('<% = SurveyItemResult_4_2.ClientID %>');
//          q3 = $('<% = SurveyItemResult_4_3.ClientID %>');
//          q4 = $('<% = SurveyItemResult_4_4.ClientID %>');
//          q5 = $('<% = SurveyItemResult_4_5.ClientID %>');
//          q6 = $('<% = SurveyItemResult_4_6.ClientID %>');
//          q7 = $('<% = SurveyItemResult_4_7.ClientID %>');
//          q8 = $('<% = SurveyItemResult_4_8.ClientID %>');
//          q9 = $('<% = SurveyItemResult_4_9.ClientID %>');
//          target = $('<% = SurveyTotal_4.ClientID %>');
//          break;
//        default:
//          break;
//    }
//    
//    try
//    {
//        target.value = q2.value + q3.value + q4.value + q5.value + q6.value + q7.value + q8.value + q9.value;
//    }
//    catch(err) {}
//    
}

</script>