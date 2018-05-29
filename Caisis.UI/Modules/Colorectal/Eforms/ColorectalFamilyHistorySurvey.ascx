<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalFamilyHistorySurvey" CodeFile="ColorectalFamilyHistorySurvey.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<script type="text/javascript" >

function showHideAmsterdamCriteria(showHide, critNum)
{
	var vis = 'hidden';
	if (showHide.toUpperCase() == 'SHOW') vis = 'visible';
	

	if (critNum.length > 0)
	{
		document.getElementById('AmsterdamCriteria' + critNum).style.visibility = vis;
	}
}


</script>

<style type="text/css">
ul {
	text-indent: 5px;
	list-style-position: outside;
	padding: 6px;
	margin: 2px;
	font-weight: normal;
}
</style>



<a name="ColorectalFamilyHistorySurvey" id="ColorectalFamilyHistorySurvey" />
<span class="controlBoxTitle">Family History Questionnaire</span>




<table id="FamilyHistoryTable" border="0" cellspacing="0" cellpadding="6" width="600" class="eformLargePopulatedTable">
<tr >
	<td colspan="2" style="padding-top: 20px; padding-left: 16px;">
		<strong>Date Completed</strong>
		<euc:EformTextBox Runat="server" ID="SurveyDateText" Table="Surveys" RecordId="1" FIELD="SurveyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="SurveyType" />
		<euc:EformHidden  Runat="server" ID="SurveyDate" Table="Surveys" RecordId="1" Field="SurveyDate"></euc:EformHidden>
		<euc:EformHidden Table="Surveys" RecordId="1" Field="SurveyType" id="SurveyType" runat="server" Value="Colorectal Family History" />
	</td>
</tr>
<tr>
<%--Inserted check all on top & delete buttons--%>
    <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    <td><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('FamilyHistoryTable', 1, 5);" /></td>
    <td><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('FamilyHistoryTable', 2, 5);" /></td>
    <td><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('FamilyHistoryTable', 3, 5);" /></td>
</tr>
<tr>
	<td style="padding-top: 12px; padding-left: 16px; font-weight: 800; width: 300px;">
		<euc:EformHidden Table="SurveyItems" ParentRecordId="1" RecordId="1" Field="SurveyItem" id="SurveyItem_1" runat="server" Value="CRC < 40 Years Old" />
		CRC < 40 Years Old		
	</td>	
	<td style="padding-top: 12px; padding-left: 0px; >
	<euc:EformRadioButtonGroup Table="SurveyItems" ParentRecordId="1" RecordId="1"  Field="SurveyItemResult" id="SurveyItemResult_1" GroupName="CRC" runat="server">
    <euc:EformRadioButton id="CRCYes" Value="Yes" Text="Yes"  runat="server" /></td>
    <td style="padding-top: 12px; padding-left: 0px; ><euc:EformRadioButton id="CRCNo" Value="No" Text="No"  runat="server"/></td>
    <td style="padding-top: 12px; padding-left: 0px; width: 200px;"><euc:EformRadioButton ID="CRCNoAns" Value="" Text="No Answer"  runat="server"/>
	</euc:EformRadioButtonGroup>
	</td>
		
   <td  style="padding-top: 12px; padding-left: 0px; "><euc:EformDeleteIcon runat="server"></euc:EformDeleteIcon></td>
</tr>
<tr>
  <td style=" padding-left: 16px;font-weight: 800;">
    		<euc:EformHidden Table="SurveyItems" ParentRecordId="1" RecordId="2" Field="SurveyItem" id="SurveyItem_2" runat="server" Value="Known FAP" />
		Known FAP  
  </td>
  <td style="padding-left: 0px;">
	<euc:EformRadioButtonGroup Table="SurveyItems" ParentRecordId="1" RecordId="2"  Field="SurveyItemResult" id="SurveyItemResult_2" GroupName="FAP" runat="server">
    <euc:EformRadioButton id="FAPYes" Value="Yes" Text="Yes"  runat="server" /></td>
    <td style="padding-left: 0px;"><euc:EformRadioButton id="FAPNo" Value="No" Text="No"  runat="server"/></td>
    <td style="padding-left: 0px;"><euc:EformRadioButton ID="FAPNoAns" Value="" Text="No Answer"  runat="server"/>
	</euc:EformRadioButtonGroup>
	</td>
    <td style="padding-left: 0px;"><euc:EformDeleteIcon runat="server"></euc:EformDeleteIcon></td>
</tr>
<tr>
  <td style=" padding-left: 16px;font-weight: 800; vertical-align: top;"><euc:EformHidden Table="SurveyItems" ParentRecordId="1" RecordId="3" Field="SurveyItem" id="SurveyItem_3" runat="server" Value="Hx of osteoma, desmoid or periampullary neoplasms" />
    History of osteomas, desmoids or periampullary neoplasms </td>
    <td style="padding-left: 0px; vertical-align: top;">
	<euc:EformRadioButtonGroup Table="SurveyItems" ParentRecordId="1" RecordId="3"  Field="SurveyItemResult" id="SurveyItemResult_3" GroupName="HIS" runat="server">
    <euc:EformRadioButton id="HISYes" Value="Yes" Text="Yes"  runat="server" /></td>
    <td style="padding-left: 0px; vertical-align: top;"><euc:EformRadioButton id="HISNo" Value="No" Text="No"  runat="server"/></td>
    <td style="padding-left: 0px; vertical-align: top;"><euc:EformRadioButton ID="HISNoAns" Value="" Text="No Answer"  runat="server"/>
	</euc:EformRadioButtonGroup>
	</td>
    <td style="padding-top: 10px; padding-left: 0px; vertical-align: top;"><euc:EformDeleteIcon runat="server"></euc:EformDeleteIcon></td>
</tr>
<tr>
  <td style=" padding-left: 16px;font-weight: 800; vertical-align: top;"><euc:EformHidden Table="SurveyItems" ParentRecordId="1" RecordId="4" Field="SurveyItem" id="SurveyItem_4" runat="server" Value="HNPCC (Amsterdam I criteria)" />
    HNPCC&nbsp;
	<span style="font-weight: normal;">(<a onmouseover="showHideAmsterdamCriteria('show','1');" onmouseout="showHideAmsterdamCriteria('hide','1');" style="text-decoration: underline; color: #004256; font-size: 12px; cursor: default;">Amsterdam I criteria</a>)</span>
	
	<div id="AmsterdamCriteria1" style="z-index: 30; visibility: hidden; width: 300px; position: absolute; height: 100px; background-color: #ffffff; border: solid 1px #cccccc; font-size: 11px; padding: 10px;">
	
	<strong>Amsterdam I Criteria</strong>
	<ul >
	<li>Three relatives with colorectal cancer</li>
	<li>One is a first degree relative of the other two</li>
	<li>Two successive generations affected</li>
	<li>One patient with colorectal cancer less than 50</li>
	<li>FAP Excluded</li>
	</ul>
	</div>
	</td>
	<td style="padding-left: 0px; vertical-align: top;">
	<euc:EformRadioButtonGroup Table="SurveyItems" ParentRecordId="1" RecordId="4"  Field="SurveyItemResult" id="SurveyItemResult_4" GroupName="HNPCCI" runat="server">
    <euc:EformRadioButton id="HNPCCIYes" Value="Yes" Text="Yes"  runat="server" /></td>
    <td style="padding-left: 0px; vertical-align: top;"><euc:EformRadioButton id="HNPCCINo" Value="No" Text="No"  runat="server"/></td>
    <td style="padding-left: 0px; vertical-align: top;"><euc:EformRadioButton ID="HNPCCNoIAns" Value="" Text="No Answer"  runat="server"/>
	</euc:EformRadioButtonGroup>
	</td>
    <td style="padding-top: 10px; padding-left: 0px; vertical-align: top;"><euc:EformDeleteIcon runat="server"></euc:EformDeleteIcon></td>
</tr>
<tr>
  <td style=" padding-left: 16px;font-weight: 800; vertical-align: top;"><euc:EformHidden Table="SurveyItems" ParentRecordId="1" RecordId="5" Field="SurveyItem" id="SurveyItem_5" runat="server" Value="Known HNPCC (Amsterdam II criteria)" />
    Known HNPCC&nbsp;
	<span style="font-weight: normal;">(<a onmouseover="showHideAmsterdamCriteria('show','2');" onmouseout="showHideAmsterdamCriteria('hide','2');" style="text-decoration: underline; color: #004256; font-size: 12px; cursor: default;">Amsterdam II criteria</a>)</span>
	
		<div id="AmsterdamCriteria2" style="z-index: 30; visibility: hidden; width: 300px; position: absolute; height: 100px; background-color: #ffffff; border: solid 1px #cccccc; font-size: 11px; padding: 10px; font-weight: normall;">
	
	<strong>Amsterdam II Criteria</strong>
	<ul >
	<li>Three relatives with HNPCC-associated cancer<br/>&nbsp;&nbsp;(CR, endometrial, small bowell, ureter or renal pelvis)</li>
	<li>One is a first degree relative of the other two</li>
	<li>Two successive generations affected</li>
	<li>One patient with colorectal cancer less than 50</li>
	<li>FAP Excluded</li>
	</ul>
	</div>
	</td>
	<td style="padding-left: 0px; vertical-align: top;">
	<euc:EformRadioButtonGroup Table="SurveyItems" ParentRecordId="1" RecordId="5"  Field="SurveyItemResult" id="SurveyItemResult_5" GroupName="HNPCCII" runat="server">
    <euc:EformRadioButton id="HNPCCIIYes" Value="Yes" Text="Yes"  runat="server" /></td>
    <td style="padding-left: 0px; vertical-align: top;"><euc:EformRadioButton id="HNPCCIINo" Value="No" Text="No"  runat="server"/></td>
    <td style="padding-left: 0px; vertical-align: top;"><euc:EformRadioButton ID="HNPCCIINoAns" Value="" Text="No Answer"  runat="server"/>
	</euc:EformRadioButtonGroup>
	</td>
    <td style="padding-top: 10px; padding-left: 0px; vertical-align: top;"><euc:EformDeleteIcon runat="server"></euc:EformDeleteIcon></td>
</tr>
<tr>
  <td style=" padding-left: 16px;font-weight: 800; vertical-align: top;"><euc:EformHidden Table="SurveyItems" ParentRecordId="1" RecordId="6" Field="SurveyItem" id="SurveyItem_6" runat="server" Value="Suspected HNPCC / MYH" />
    Suspected HNPCC / MYH</td>
    <td style="padding-left: 0px; vertical-align: top;">
	<euc:EformRadioButtonGroup Table="SurveyItems" ParentRecordId="1" RecordId="6"  Field="SurveyItemResult" id="SurveyItemResult_6" GroupName="MYH" runat="server">
    <euc:EformRadioButton id="MYHYes" Value="Yes" Text="Yes"  runat="server" /></td>
    <td style="padding-left: 0px; vertical-align: top;"><euc:EformRadioButton id="MYHNo" Value="No" Text="No"  runat="server"/></td>
    <td style="padding-left: 0px; vertical-align: top;"><euc:EformRadioButton ID="MYHNoAns" Value="" Text="No Answer"  runat="server"/>
	</euc:EformRadioButtonGroup>
	</td>
    <td style="padding-top: 10px; padding-left: 0px; vertical-align: top;"><euc:EformDeleteIcon runat="server"></euc:EformDeleteIcon></td>
</tr>
<tr>
  <td style=" padding-left: 16px;font-weight: 800; vertical-align: top;"><euc:EformHidden Table="SurveyItems" ParentRecordId="1" RecordId="7" Field="SurveyItem" id="SurveyItem_7" runat="server" Value="Other Polyposis syndromes" />
    Other Polyposis syndromes<br/><span style="font-size: 10px; font-weight: normal;">including Puetz-Jeghers, juvenile polyposis, Muir-Torre syndrome, Cowden's disease, Hereditary Mixed Polyposis Syndrome
    
    </span><br /><br /></td>
    <td style="padding-left: 0px; vertical-align: top;">
	<euc:EformRadioButtonGroup Table="SurveyItems" ParentRecordId="1" RecordId="7"  Field="SurveyItemResult" id="SurveyItemResult_7" GroupName="Polyp" runat="server">
    <euc:EformRadioButton id="PolypYes" Value="Yes" Text="Yes"  runat="server" /></td>
    <td style="padding-left: 0px; vertical-align: top;"><euc:EformRadioButton id="PolypNo" Value="No" Text="No"  runat="server"/></td>
    <td style="padding-left: 0px; vertical-align: top;"><euc:EformRadioButton ID="PolypNoAns" Value="" Text="No Answer"  runat="server"/>
	</euc:EformRadioButtonGroup>
	</td>
    <td style="padding-top: 10px; padding-left: 0px; vertical-align: top;"><euc:EformDeleteIcon runat="server"></euc:EformDeleteIcon></td>
</tr>
</table>
<br /><br /><br />