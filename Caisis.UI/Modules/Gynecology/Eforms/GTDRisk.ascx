<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.GTDRisk" CodeFile="GTDRisk.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script language="javascript">
	tableArray.RiskTable = "RiskTable";
</script>

<a name="GTDRisk" id="GTDRisk" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Risk"></asp:Label>

<table cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="RiskTable">
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" >Risk</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
   <tr> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">

        <euc:EformTextBox Runat="server" ID="SurveyDateText_5" TABLE="Surveys" RecordId="5" FIELD="SurveyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden  Runat="server" ID="SurveyDate_5" Table="Surveys" RecordId="5" Field="SurveyDate"></euc:EformHidden>
    </td>
    <td style="padding-left: 0px;" >
        <euc:EformRadioButtonList Table="Surveys" Field="SurveyResult" id="SurveyItemResult_5" RecordId="5" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyType" Value1="GTD Risk" Field2="SurveyQuality" Value2="STD">		
			<asp:ListItem Text="Low" Value="Low"  />	
			
			<asp:ListItem Text="High" Value="High"  />
	    </euc:EformRadioButtonList>
	</td>
    <td><euc:EformDeleteIcon onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" runat="server"/></td> 
  </tr>
   <tr> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">

        <euc:EformTextBox Runat="server" ID="SurveyDateText_6" TABLE="Surveys" RecordId="6" FIELD="SurveyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden  Runat="server" ID="SurveyDate_6" Table="Surveys" RecordId="6" Field="SurveyDate"></euc:EformHidden>
    </td>
    <td style="padding-left: 0px;" >
        <euc:EformRadioButtonList Table="Surveys" Field="SurveyResult" id="SurveyItemResult_6" RecordId="6" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyType" Value1="GTD Risk" Field2="SurveyQuality" Value2="STD">		
			<asp:ListItem Text="Low" Value="Low"  />	
			
			<asp:ListItem Text="High" Value="High"  />
	    </euc:EformRadioButtonList>
	</td>
    <td><euc:EformDeleteIcon onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ID="EformDeleteIcon1" runat="server"/></td> 
  </tr>
   <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">

        <euc:EformTextBox Runat="server" ID="SurveyDateText_7" TABLE="Surveys" RecordId="7" FIELD="SurveyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden  Runat="server" ID="SurveyDate_7" Table="Surveys" RecordId="7" Field="SurveyDate"></euc:EformHidden>
    </td>
    <td style="padding-left: 0px;" >
        <euc:EformRadioButtonList Table="Surveys" Field="SurveyResult" id="SurveyItemResult_7" RecordId="7" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyType" Value1="GTD Risk" Field2="SurveyQuality" Value2="STD">		
			<asp:ListItem Text="Low" Value="Low"  />	
			
			<asp:ListItem Text="High" Value="High"  />
	    </euc:EformRadioButtonList>
	</td>
    <td><euc:EformDeleteIcon onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ID="EformDeleteIcon2" runat="server"/></td> 
  </tr>
   <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">

        <euc:EformTextBox Runat="server" ID="SurveyDateText_8" TABLE="Surveys" RecordId="8" FIELD="SurveyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden  Runat="server" ID="SurveyDate_8" Table="Surveys" RecordId="8" Field="SurveyDate"></euc:EformHidden>
    </td>
    <td style="padding-left: 0px;" >
        <euc:EformRadioButtonList Table="Surveys" Field="SurveyResult" id="SurveyItemResult_8" RecordId="8" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyType" Value1="GTD Risk" Field2="SurveyQuality" Value2="STD">		
			<asp:ListItem Text="Low" Value="Low"  />	
			
			<asp:ListItem Text="High" Value="High"  />
	    </euc:EformRadioButtonList>
	</td>
    <td><euc:EformDeleteIcon onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ID="EformDeleteIcon3" runat="server"/></td> 
  </tr>
   <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">

        <euc:EformTextBox Runat="server" ID="SurveyDateText_9" TABLE="Surveys" RecordId="9" FIELD="SurveyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden  Runat="server" ID="SurveyDate_9" Table="Surveys" RecordId="9" Field="SurveyDate"></euc:EformHidden>
    </td>
    <td style="padding-left: 0px;" >
        <euc:EformRadioButtonList Table="Surveys" Field="SurveyResult" id="SurveyItemResult_9" RecordId="9" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyType" Value1="GTD Risk" Field2="SurveyQuality" Value2="STD">		
			<asp:ListItem Text="Low" Value="Low"  />	
			
			<asp:ListItem Text="High" Value="High"  />
	    </euc:EformRadioButtonList>
	</td>
    <td><euc:EformDeleteIcon onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ID="EformDeleteIcon4" runat="server"/></td> 
  </tr>
   <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">

        <euc:EformTextBox Runat="server" ID="SurveyDateText_10" TABLE="Surveys" RecordId="10" FIELD="SurveyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden  Runat="server" ID="SurveyDate_10" Table="Surveys" RecordId="10" Field="SurveyDate"></euc:EformHidden>
    </td>
    <td style="padding-left: 0px;" >
        <euc:EformRadioButtonList Table="Surveys" Field="SurveyResult" id="SurveyItemResult_10" RecordId="10" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Horizontal" runat="server" Field1="SurveyType" Value1="GTD Risk" Field2="SurveyQuality" Value2="STD">		
			<asp:ListItem Text="Low" Value="Low"  />	
			
			<asp:ListItem Text="High" Value="High"  />
	    </euc:EformRadioButtonList>
	</td>
    <td><euc:EformDeleteIcon onclick="clearAllElementsContainedInNode(this.parentElement.parentElement);" ID="EformDeleteIcon5" runat="server"/></td> 
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RiskTable');" />

<br /><br /><br />

<script type="text/javascript">




</script>