<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.PregnancyPostTreatment" CodeFile="PregnancyPostTreatment.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
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
</style>

<a name="PregnancyPostTreatment" id="PregnancyPostTreatment" />

<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pregnancy Post-Treatment"></asp:Label>
<table id="PregnancyPostTreatmentSurveyTable" border="0" cellspacing="0" cellpadding="16" class="eformLargePopulatedTable">
<tr>
	<td >
       <strong>Date</strong>
		<euc:EformTextBox Runat="server" ID="SurveyDateText_11" RecordId="11" TABLE="Surveys" FIELD="SurveyDateText" style="width:80px; margin-left: 20px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden  Runat="server" ID="SurveyDate_11" RecordId="11" Table="Surveys" Field="SurveyDate"></euc:EformHidden>

	</td>
</tr>
<tr>
	<td style="padding-top: 0px;">
       <strong>Pregnancy Post-Treatment?</strong>
        <euc:EformRadioButtonList Table="Surveys" Field="SurveyResult" id="SurveyItemResult_11" RecordId="11" RepeatLayout="Table" CellSpacing="4" RepeatDirection="Vertical" runat="server" Field1="SurveyType" Value1="Pregnancy Post-Treatment" Field2="SurveyQuality" Value2="STD">		
			<asp:ListItem Text="No (did not desire future fertility)" Value="No (did not desire future fertility)"  />	
			<asp:ListItem Text="No (unable to conceive)" Value="No (unable to conceive)"  />
			<asp:ListItem Text="SAB (miscarriage)" Value="SAB"  />
			<asp:ListItem Text="TAB (abortion)" Value="TAB"  />
			<asp:ListItem Text="FTD (full term delivery)" Value="FTD"  />
			<asp:ListItem Text="PTD (pre-term delivery)" Value="PTD"  />
	    </euc:EformRadioButtonList>
	 </td>
</tr>


</table>
<br /><br />