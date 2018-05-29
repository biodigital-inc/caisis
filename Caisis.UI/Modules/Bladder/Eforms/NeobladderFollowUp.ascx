<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.NeobladderFollowUp" CodeFile="NeobladderFollowUp.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<%-- javascript moved to end of this file - jf --%>

<style type="text/css">
.continenceTable
{
	border: solid 1px #cccccc;
	border-collapse: collapse;
}
.continenceTable td
{
	border: solid 1px #cccccc;
	padding: 3px 6px 3px 6px;
}
.continenceTable th
{
	border: solid 1px #cccccc;
	background-color: #d8d8d8;
	padding: 2px 4px 2px 4px;
	color: #111111;
	font-size: 12px;
	font-weight: bold;
	text-align: center;
}
.continenceQOLTable
{
	border: solid 1px #cccccc;
	border-collapse: collapse;
}
.continenceQOLTable td
{
	border-top: solid 1px #cccccc;
	border-bottom: solid 1px #cccccc;
	padding: 7px 6px 7px 6px;
}
</style>


<a name="NeobladderFollowUp" id="NeobladderFollowUp" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Neobladder"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>Neobladder Diversion Performed?</strong><euc:EformRadioButtonList Table="NoTable" Field="NeobladderDiversionFollowUpData" id="NeobladderDiversionFollowUpData" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;">
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="NeobladderFollowUpDetails" style="display: none;">
    <td>
        <table>
			<tr>
				<td>
					<strong style="display: block;">Continence</strong>
<table cellspacing="0" class="continenceTable">
  <tr>
    <th>&nbsp;</th>
    <th>Daytime</th>
    <th>Nighttime</th>
  </tr>
  <tr>
    <th style="text-align: left;">Continence</th>
    <td><euc:EformDropDownList Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_1_1"  runat="server" RecordId="1" ParentRecordId="201" style="width: 250px;">
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1">1: Continence (no pads)</asp:ListItem>
			<asp:ListItem Value="2">2: Mild SUI (leaks only during heavy activity)</asp:ListItem>
			<asp:ListItem Value="3">3: Moderate SUI (leaks with moderate activity)</asp:ListItem>
			<asp:ListItem Value="4">4: Severe SUI (leaks during nl activity, dry at night and at rest)</asp:ListItem>
			<asp:ListItem Value="5">5: Total Incontinence (continuous leakage of urine at rest)</asp:ListItem>
	</euc:EformDropDownList></td>
    <td><euc:EformDropDownList Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_1_2"  runat="server" RecordId="2" ParentRecordId="201" style="width: 250px;">
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1">1: Continence (no pads)</asp:ListItem>
			<asp:ListItem Value="2">2: Mild SUI (leaks only during heavy activity)</asp:ListItem>
			<asp:ListItem Value="3">3: Moderate SUI (leaks with moderate activity)</asp:ListItem>
			<asp:ListItem Value="4">4: Severe SUI (leaks during nl activity, dry at night and at rest)</asp:ListItem>
			<asp:ListItem Value="5">5: Total Incontinence (continuous leakage of urine at rest)</asp:ListItem>
	</euc:EformDropDownList></td>
  </tr>
  <tr>
    <th style="text-align: left;">Date Mild Continence Achieved</th>
    <td><euc:EformTextBox id="SurveyDateText_2" Table="Surveys" Field="SurveyDateText" RecordId="202" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="SurveyDate_2" Table="Surveys" Field="SurveyDate"  RecordId="202" runat="server"/></td>
    <td><euc:EformTextBox id="SurveyDateText_3" Table="Surveys" Field="SurveyDateText" RecordId="203" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="SurveyDate_3" Table="Surveys" Field="SurveyDate"  RecordId="203" runat="server"/></td>
  </tr>
  <tr>
    <th style="text-align: left;">Date Total Continence Achieved&nbsp;</th>
    <td><euc:EformTextBox id="SurveyDateText_4" Table="Surveys" Field="SurveyDateText" RecordId="204" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="SurveyDate_4" Table="Surveys" Field="SurveyDate"  RecordId="204" runat="server"/></td>
    <td><euc:EformTextBox id="SurveyDateText_5" Table="Surveys" Field="SurveyDateText" RecordId="205" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="SurveyDate_5" Table="Surveys" Field="SurveyDate"  RecordId="205" runat="server"/></td>
  </tr>
</table>

				</td>
			</tr>
		</table>
		
<table cellspacing="0" class="continenceQOLTable" style="margin-top:20px;">

  <tr>
    <td style="text-align: left;">Treatment for Incontinence&nbsp;&nbsp;
	<euc:EformComboBox LookupCode="QOL_Therapy" style="width:150px;" Field="QOL_Therapy" Table="QOL_Therapy" RecordId="1" Runat="server" id="QOL_Therapy_1" DropDownWidth="380"  /></td>
    <td style="padding-left: 30px;">TX Date</td>
	<td><euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" Table="QOL_Therapy"  RecordId="1"  Field="QOL_TxDateText" Runat="server" ID="QOL_TxDateText_1" />
	<euc:EformHidden RecordId="1" Runat="server" ID="QOL_TxDate_1" Table="QOL_Therapy" Field="QOL_TxDate" /></td>
  </tr>
  <tr>
    <td style="text-align: left;">Treatment for Bladder Neck Contracture&nbsp;&nbsp;
	<euc:EformCheckBox Field="QOL_Therapy" Table="QOL_Therapy" RecordId="2" Runat="server" id="QOL_Therapy_2"  Value="Yes"  />Yes</td>
    <td style="padding-left: 30px;">TX Date</td>
	<td><euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" Table="QOL_Therapy"  RecordId="2"  Field="QOL_TxDateText" Runat="server" ID="QOL_TxDateText_2" />
	<euc:EformHidden RecordId="2" Runat="server" ID="QOL_TxDate_2" Table="QOL_Therapy" Field="QOL_TxDate" /></td>
  </tr>
</table>		

<table cellspacing="0" class="continenceQOLTable" style="margin-top:20px;">
  <tr>
    <td style="text-align: left;">Need for Intermittent Catheterization&nbsp;&nbsp;
	<euc:EformRadioButtonList Table="SurveyItems"  Field="SurveyItemResult" RecordId="1" ParentRecordId="207" id="NeobladderIntermittentCathNeeded" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
    <td style="padding-left: 30px;">Date&nbsp;&nbsp;<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" Table="SurveyItems" Field="SurveyItemResult" RecordId="2" ParentRecordId="207" Runat="server" ID="NeobladderIntermittentCathDateText" />
	<euc:EformHidden Runat="server" ID="NeobladderIntermittentCathDate" Table="SurveyItems" Field="SurveyItemResult" RecordId="3" ParentRecordId="207" /></td>
  </tr>
  <tr>
    <td colspan="2" style="text-align: left;">Frequency of Catheterization&nbsp;&nbsp;
	<euc:EformTextBox  style="width:70px;" Table="SurveyItems"  Field="SurveyItemResult" RecordId="4" ParentRecordId="207" Runat="server" ID="NeobladderIntermittentCathFrequency" /> 
	times / day
	</td>
  </tr>
</table>

<table cellspacing="0" class="continenceQOLTable" style="margin-top:20px;">
  <tr>
    <td style="text-align: left;">Nocturia&nbsp;&nbsp;
	<euc:EformRadioButtonList Table="SurveyItems"  Field="SurveyItemResult"  RecordId="5" ParentRecordId="207" id="Nocturia" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList>&nbsp;&nbsp;&nbsp;&nbsp;
		#: <euc:EformTextBox  style="width:70px;" Table="SurveyItems"  Field="SurveyItemResult" RecordId="6" ParentRecordId="207" Runat="server" ID="NocturiaNumber" />
	</td>
    <td style="padding-left: 50px;">Pads&nbsp;&nbsp;
	<euc:EformRadioButtonList Table="SurveyItems"   Field="SurveyItemResult"  RecordId="7" ParentRecordId="207" id="Pads" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList>&nbsp;&nbsp;&nbsp;&nbsp;
		#: <euc:EformTextBox  style="width:70px;" Table="SurveyItems"  Field="SurveyItemResult" RecordId="8" ParentRecordId="207" Runat="server" ID="PadsNumber" />
	
	</td>
  </tr>
</table>

<table cellspacing="0" class="continenceQOLTable" style="margin-top:20px;">
  <tr>
    <td style="text-align: left; vertical-align: top; padding-top: 10px;">Current Erectile Function</td>
    <td ><euc:EformRadioButtonList Table="SurveyItems"   Field="SurveyItemResult"  RecordId="1" ParentRecordId="208" id="CurrentErectileFunction" runat="server" RepeatLayout="Flow" RepeatDirection="Vertical"  >
			<asp:ListItem Value="1" Text="1-Normal, full erections" /> 
			<asp:ListItem Value="2" Text="2-Full, but recently diminished" /> 
			<asp:ListItem Value="3" Text="3-Partial, satis. for intercourse" /> 
			<asp:ListItem Value="4" Text="4-Partial, unsatis. for intercourse" /> 
			<asp:ListItem Value="5" Text="5-Impotent" /> 
		</euc:EformRadioButtonList>
	</td>
  </tr>
  <tr>
    <td style="text-align: left;">% Best Erection (No Meds)</td>
    <td ><euc:EformTextBox  style="width:40px;" Table="SurveyItems"  Field="SurveyItemResult" RecordId="2" ParentRecordId="208" Runat="server" ID="PercentBestErection" />%
	</td>
  </tr>
  <tr>
    <td style="text-align: left;">% Best Erection (Oral PDE-5 Drugs)</td>
    <td ><euc:EformTextBox  style="width:40px;" Table="SurveyItems"  Field="SurveyItemResult" RecordId="3" ParentRecordId="208" Runat="server" ID="PercentBestErectionMeds" />%
	</td>
  </tr>
</table>




<table cellspacing="0" class="continenceQOLTable" style="margin-top:20px;">
  <tr>
    <td colspan="2" style="text-align: left;"><strong>Sexual Function Survey</strong><br/>(Fill in scores below from questions 4 & 5 of Urinary & Sexual Function Questionnaire)</td>
  </tr>
  <tr>
    <td style="text-align: left; vertical-align: top; padding-top: 10px;">Q4 How often did you use a pill like viagra</td>
    <td ><euc:EformDropDownList Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_9_1"  runat="server" RecordId="1" ParentRecordId="209" style="width: 110px;">
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1"  Text="1" />
			<asp:ListItem Value="2"  Text="2" />
			<asp:ListItem Value="3"  Text="3" />
			<asp:ListItem Value="4"  Text="4" />
			<asp:ListItem Value="5"  Text="5" />
			<asp:ListItem Value="6"  Text="6" />
	</euc:EformDropDownList>
	</td>
  </tr>
  <tr>
    <td style="text-align: left; vertical-align: top; padding-top: 10px;">Q5 How often get erection during sexual activity</td>
    <td ><euc:EformDropDownList Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_9_2"  runat="server" RecordId="2" ParentRecordId="209" style="width: 110px;">
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1"  Text="1" />
			<asp:ListItem Value="2"  Text="2" />
			<asp:ListItem Value="3"  Text="3" />
			<asp:ListItem Value="4"  Text="4" />
			<asp:ListItem Value="5"  Text="5" />
			<asp:ListItem Value="6"  Text="6" />
	</euc:EformDropDownList>
	</td>
  </tr>
</table>


</td>
  </tr>
</table>
<br/><br/>

<script type="text/javascript">
showHideBasedOnRadioToggle($('<% = NeobladderDiversionFollowUpData.ClientID %>'), $('NeobladderFollowUpDetails'), 'Yes', 'No');
</script>