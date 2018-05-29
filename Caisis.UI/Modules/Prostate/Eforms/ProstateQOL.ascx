<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateQOL" CodeFile="ProstateQOL.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ProstateQOL" /><span class="controlBoxTitle" style="margin-right: 15px;">Prostate QOL Survey</span>
<span style="font-size: 12px; font-weight: 800;">Reported by:</span>&nbsp;

<euc:EformRadioButtonList   RepeatLayout="Flow" RepeatDirection="Horizontal" RecordId="16" TABLE="SurveyItems" FIELD="SurveyItemResult" id="SurveyItemResult_PatientReported" runat="server" EnableHiddenOnUIEvent="SurveyType_1,SurveyTotal_1,SurveyDate_1,SurveyDateText_1,SurveyItem_16,SurveyItemNum_16" >
<asp:ListItem Value="Yes" Text="Patient&nbsp;&nbsp;"  />
<asp:ListItem Value="No" Text="Physician"  />
</euc:EformRadioButtonList>
<a href="#" onclick="return viewPaperFormInModal('ProstateQOLResults', 'Prostate QOL Results', 1);" class="dataEntryButtonGray" style="margin-left: 135px;">View QOL History</a>
<euc:EformHidden id="SurveyItem_16" runat="server" RecordId="16" Table="SurveyItems" Field="SurveyItem" Value="Patient reported?"/>
<euc:EformHidden id="SurveyItemNum_16" runat="server" RecordId="16" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="16"/>
	

<%-- 
<euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_PatientReported" RecordId="16" GroupName="PatientReported" runat="server"
			Field1="SurveyItem" Value1="Patient reported?">
			<euc:EformRadioButton Id="Yes" Value="Yes" Text="Patient" runat="server" EnableHiddenOnUIEvent="SurveyType_1,SurveyTotal_1,SurveyDate_1,SurveyDateText_1"  /><euc:EformRadioButton Id="No" Value="No" Text="Physician" runat="server" EnableHiddenOnUIEvent="SurveyQuestion_1,SurveyType_1,SurveyTotal_1,SurveyDate_1,SurveyDateText_1"/>
</euc:EformRadioButtonGroup>--%>
<br />

<euc:EformHidden id="SurveyType_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyType" Value="Prostate QOL Survey"/>
<euc:EformHidden id="SurveyTotal_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyTotal" Value="86"/>
<euc:EformHidden id="SurveyDate_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyDate"/>
<euc:EformHidden id="SurveyDateText_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyDateText"/>


<table width="650" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc;">
  <tr>
    <td colspan="4" valign="top" class="ControlBoxRowAlternatingRowsA" style="background-color: #666666; color: #ffffff;"><strong>Sexual Domain </strong></td>
  </tr>
  <tr>
    <td width="6%" valign="top" class="ControlBoxRowAlternatingRowsB">Q1</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsB">During the last four (4) weeks, how often did you take a pill like Viagra?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB"  >
    
	
	<euc:EformHidden id="SurveyQuestion_1" runat="server" RecordId="1" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="During the last four (4) weeks, how often did you take a pill like Viagra?"/>
	<euc:EformHidden id="SurveyItemNum_1" runat="server" RecordId="1" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="1"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_1" runat="server" RecordId="1" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_1,SurveyType_1,SurveyTotal_1,SurveyDate_1,SurveyDateText_1,SurveyItemNum_1">
		
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1">1: Never</asp:ListItem>
			<asp:ListItem Value="2">2: Sometimes (less than once a week)</asp:ListItem>
			<asp:ListItem Value="3">3: Regularly (once or twice a week)</asp:ListItem>
			<asp:ListItem Value="4">4: Routinely (every day or nearly every day)</asp:ListItem>
			<asp:ListItem Value="5">5: More than once a day</asp:ListItem>
	</euc:EformDropDownList>	</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsA">Q2</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsA">Rate your confidence that you could get and keep an erection:</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsA">
	<euc:EformHidden id="SurveyQuestion_2" runat="server" RecordId="2" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Rate your confidence that you could get and keep an erection:"/>
	<euc:EformHidden id="SurveyItemNum_2" runat="server" RecordId="2" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="2"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_2"  runat="server" RecordId="2" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_2,SurveyType_1,SurveyTotal_1,SurveyItemNum_2">
		
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1">1: Very Poor</asp:ListItem>
			<asp:ListItem Value="2">2: Poor</asp:ListItem>
			<asp:ListItem Value="3">3: Fair</asp:ListItem>
			<asp:ListItem Value="4">4: Good</asp:ListItem>
			<asp:ListItem Value="5">5: Very Good</asp:ListItem>
	</euc:EformDropDownList>	</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">Q3</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsB">How often were you able to get an erection during sexual activity?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">
	
		
	<euc:EformHidden id="SurveyQuestion_3" runat="server" RecordId="3" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="How often were you able to get an erection during sexual activity?"/>
	<euc:EformHidden id="SurveyItemNum_3" runat="server" RecordId="3" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="3"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_3"  runat="server" RecordId="3" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_3,SurveyType_1,SurveyTotal_1,SurveyItemNum_3">
		
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1">1: No sexual activity</asp:ListItem>
			<asp:ListItem Value="2">2: Almost never / never</asp:ListItem>
			<asp:ListItem Value="3">3: A few times (less than half of the time)</asp:ListItem>
			<asp:ListItem Value="4">4: Sometimes (about half of the time)</asp:ListItem>
			<asp:ListItem Value="5">5: Most times (more than half of the time)</asp:ListItem>
			<asp:ListItem Value="6">6: Almost always / always</asp:ListItem>
	</euc:EformDropDownList>	</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsA">Q4</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsA">When you had erections with sexual stimulation, how often were your erections hard enough for penetration (entering your partner)?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsA"><euc:EformHidden id="SurveyQuestion_4" runat="server" RecordId="4" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="When you had erections with sexual stimulation, how often were your erections hard enough for penetration (entering your partner)?"/>
        <euc:EformHidden id="SurveyItemNum_4" runat="server" RecordId="4" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="4"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_4"  runat="server" RecordId="4" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_4,SurveyType_1,SurveyTotal_1,SurveyItemNum_4">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: No sexual activity</asp:ListItem>
          <asp:ListItem Value="2">2: Almost never / never</asp:ListItem>
          <asp:ListItem Value="3">3: A few times (less than half of the time)</asp:ListItem>
          <asp:ListItem Value="4">4: Sometimes (about half of the time)</asp:ListItem>
          <asp:ListItem Value="5">5: Most times (more than half of the time)</asp:ListItem>
          <asp:ListItem Value="6">6: Almost always / always</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">Q5</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsB">When you attempted sexual intercourse, how often were you able to penetrate (enter) your partner?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB"><euc:EformHidden id="SurveyQuestion_5" runat="server" RecordId="5" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="When you attempted sexual intercourse, how often were you able to penetrate (enter) your partner?"/>
        <euc:EformHidden id="SurveyItemNum_5" runat="server" RecordId="5" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="5"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_5"  runat="server" RecordId="5" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_5,SurveyType_1,SurveyTotal_1,SurveyItemNum_5">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: No sexual activity</asp:ListItem>
          <asp:ListItem Value="2">2: Almost never / never</asp:ListItem>
          <asp:ListItem Value="3">3: A few times (less than half of the time)</asp:ListItem>
          <asp:ListItem Value="4">4: Sometimes (about half of the time)</asp:ListItem>
          <asp:ListItem Value="5">5: Most times (more than half of the time)</asp:ListItem>
          <asp:ListItem Value="6">6: Almost always / always</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsA">Q6</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsA">During sexual intercourse, how often were you able to maintain your erection after you had penetrated your partner?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsA"><euc:EformHidden id="SurveyQuestion_6" runat="server" RecordId="6" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="During sexual intercourse, how often were you able to maintain your erection after you had penetrated your partner?"/>
        <euc:EformHidden id="SurveyItemNum_6" runat="server" RecordId="6" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="6"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_6"  runat="server" RecordId="6" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_6,SurveyType_1,SurveyTotal_1,SurveyItemNum_6">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: Did not attempt intercourse</asp:ListItem>
          <asp:ListItem Value="2">2: Almost never / never</asp:ListItem>
          <asp:ListItem Value="3">3: A few times (less than half of the time)</asp:ListItem>
          <asp:ListItem Value="4">4: Sometimes (about half of the time)</asp:ListItem>
          <asp:ListItem Value="5">5: Most times (more than half of the time)</asp:ListItem>
          <asp:ListItem Value="6">6: Almost always / always</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">Q7</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsB">During sexual intercourse, how difficult was it to maintain your erection to complete intercourse?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB"><euc:EformHidden id="SurveyQuestion_7" runat="server" RecordId="7" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="During sexual intercourse, how difficult was it to maintain your erection to complete intercourse?"/>
        <euc:EformHidden id="SurveyItemNum_7" runat="server" RecordId="7" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="7"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_7"  runat="server" RecordId="7" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_7,SurveyType_1,SurveyTotal_1,SurveyItemNum_7">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: Did not attempt intercourse</asp:ListItem>
          <asp:ListItem Value="2">2: Extremely difficult</asp:ListItem>
          <asp:ListItem Value="3">3: Very difficult</asp:ListItem>
          <asp:ListItem Value="4">4: Difficult</asp:ListItem>
          <asp:ListItem Value="5">5: Slightly difficult</asp:ListItem>
          <asp:ListItem Value="6">6: Not difficult</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td colspan="4" class="ControlBoxRowAlternatingRowsA" style="background-color: #666666; color: #ffffff;"><strong>Urinary Domain </strong></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">Q8</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsB">How many pads or adult diapers per 24-hour period did you use to control urine leakage during the last week?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB"><euc:EformHidden id="SurveyQuestion_8" runat="server" RecordId="8" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="How many pads or adult diapers per 24-hour period did you use to control urine leakage during the last week?"/>
        <euc:EformHidden id="SurveyItemNum_8" runat="server" RecordId="8" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="8"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_8"  runat="server" RecordId="8" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_8,SurveyType_1,SurveyTotal_1,SurveyItemNum_8">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: None (or no leakage)</asp:ListItem>
          <asp:ListItem Value="2">2: An occasional pad or protective material</asp:ListItem>
          <asp:ListItem Value="3">3: 1 pad per 24-hour period</asp:ListItem>
          <asp:ListItem Value="4">4: 2 pads per 24-hour period</asp:ListItem>
          <asp:ListItem Value="5">5: 3 or more pads per 24-hour period</asp:ListItem>
          <asp:ListItem Value="6">6: Adult diaper(s)</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsA">Q9</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsA">In the past week, have you dripped or leaked urine when you had the urge to urinate, before you could get to the bathroom?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsA"><euc:EformHidden id="SurveyQuestion_9" runat="server" RecordId="9" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="In the past week, have you dripped or leaked urine when you had the urge to urinate, before you could get to the bathroom?"/>
        <euc:EformHidden id="SurveyItemNum_9" runat="server" RecordId="9" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="9"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_9"  runat="server" RecordId="9" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_9,SurveyType_1,SurveyTotal_1,SurveyNotes_1,SurveyItemNum_9">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: Rarely or not at all</asp:ListItem>
          <asp:ListItem Value="2">2: About once a week</asp:ListItem>
          <asp:ListItem Value="3">3: More than once a week</asp:ListItem>
          <asp:ListItem Value="4">4: About once a day</asp:ListItem>
          <asp:ListItem Value="5">5: More than once a day</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">Q10</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsB">In the past week, when you have had the feeling you need to urinate, how often have you found it difficult to postpone urination?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB"><euc:EformHidden id="SurveyQuestion_10" runat="server" RecordId="10" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="In the past week, when you have had the feeling you need to urinate, how often have you found it difficult to postpone urination?"/>
        <euc:EformHidden id="SurveyItemNum_10" runat="server" RecordId="10" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="10"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_10"  runat="server" RecordId="10" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_10,SurveyType_1,SurveyTotal_1,SurveyItemNum_10">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: None of the time or rarely</asp:ListItem>
          <asp:ListItem Value="2">2: Less than half the time</asp:ListItem>
          <asp:ListItem Value="3">3: About half the time</asp:ListItem>
          <asp:ListItem Value="4">4: More than half the time</asp:ListItem>
          <asp:ListItem Value="5">5: Almost always</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsA">Q11</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsA">In the past week, how often have you had to urinate again less than two hours after you finished urinating?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsA"><euc:EformHidden id="SurveyQuestion_11" runat="server" RecordId="11" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="In the past week, how often have you had to urinate again less than two hours after you finished urinating?"/>
        <euc:EformHidden id="SurveyItemNum_11" runat="server" RecordId="11" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="11"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_11"  runat="server" RecordId="11" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_11,SurveyType_1,SurveyTotal_1,SurveyItemNum_11">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: None of the time or rarely</asp:ListItem>
          <asp:ListItem Value="2">2: Less than half the time</asp:ListItem>
          <asp:ListItem Value="3">3: About half the time</asp:ListItem>
          <asp:ListItem Value="4">4: More than half the time</asp:ListItem>
          <asp:ListItem Value="5">5: Almost always</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">Q12</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsB">Overall, how big a problem has your urinary function been for you during the last week?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB"><euc:EformHidden id="SurveyQuestion_12" runat="server" RecordId="12" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Overall, how big a problem has your urinary function been for you during the last week?"/>
        <euc:EformHidden id="SurveyItemNum_12" runat="server" RecordId="12" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="12"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_12"  runat="server" RecordId="12" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_12,SurveyType_1,SurveyTotal_1,SurveyItemNum_12">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: No problem</asp:ListItem>
          <asp:ListItem Value="2">2: Very small problem</asp:ListItem>
          <asp:ListItem Value="3">3: Small problem</asp:ListItem>
          <asp:ListItem Value="4">4: Moderate problem</asp:ListItem>
          <asp:ListItem Value="5">5: Big problem</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td colspan="4" class="ControlBoxRowAlternatingRowsA" style="background-color: #666666; color: #ffffff;"><strong>Bowel Domain </strong></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">Q13</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsB">Overall, how big a problem have your bowel habits been for you during the last four (4) weeks?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB"><euc:EformHidden id="SurveyQuestion_13" runat="server" RecordId="13" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Overall, how big a problem have your bowel habits been for you during the last four (4) weeks?"/>
        <euc:EformHidden id="SurveyItemNum_13" runat="server" RecordId="13" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="13"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_13"  runat="server" RecordId="13" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_13,SurveyType_1,SurveyTotal_1,SurveyItemNum_13">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: No problem</asp:ListItem>
          <asp:ListItem Value="2">2: Very small problem</asp:ListItem>
          <asp:ListItem Value="3">3: Small problem</asp:ListItem>
          <asp:ListItem Value="4">4: Moderate problem</asp:ListItem>
          <asp:ListItem Value="5">5: Big problem</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsA">Q14</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsA">Over the past four (4) weeks, how often have bowel problems or bowel pain made it difficult to enjoy your life?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsA"><euc:EformHidden id="SurveyQuestion_14" runat="server" RecordId="14" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Over the past four (4) weeks, how often have bowel problems or bowel pain made it difficult to enjoy your life?"/>
        <euc:EformHidden id="SurveyItemNum_14" runat="server" RecordId="14" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="14"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_14"  runat="server" RecordId="14" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_14,SurveyType_1,SurveyTotal_1,SurveyItemNum_14">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="1">1: Never</asp:ListItem>
          <asp:ListItem Value="2">2: Rarely</asp:ListItem>
          <asp:ListItem Value="3">3: Some of the time</asp:ListItem>
          <asp:ListItem Value="4">4: Frequently</asp:ListItem>
          <asp:ListItem Value="5">5: Most of the time</asp:ListItem>
        </euc:EformDropDownList>    </td>
  </tr>
  <tr>
    <td colspan="4" class="ControlBoxRowAlternatingRowsB" style="background-color: #666666; color: #ffffff;"><strong>General</strong></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">Q15</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsB">Using the scale below, circle the number that best indicates how you feel about your current state of health:</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB"><euc:EformHidden id="SurveyQuestion_15" runat="server" RecordId="15" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Using the scale below, circle the number that best indicates how you feel about your current state of health:"/>
        <euc:EformHidden id="SurveyItemNum_15" runat="server" RecordId="15" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" Value="15"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_15"  runat="server" RecordId="15" ParentRecordId="1" style="width: 250px;"
		EnableHiddenOnUIEvent="SurveyQuestion_15,SurveyType_1,SurveyTotal_1,SurveyItemNum_15">
          <asp:ListItem Value="">-- Select Value --</asp:ListItem>
          <asp:ListItem Value="0">0: Very Poor Health</asp:ListItem>
          <asp:ListItem Value="1">1</asp:ListItem>
          <asp:ListItem Value="2">2</asp:ListItem>
          <asp:ListItem Value="3">3</asp:ListItem>
          <asp:ListItem Value="4">4</asp:ListItem>
          <asp:ListItem Value="5">5: Average Health</asp:ListItem>
          <asp:ListItem Value="6">6</asp:ListItem>
          <asp:ListItem Value="7">7</asp:ListItem>
          <asp:ListItem Value="8">8</asp:ListItem>		  
          <asp:ListItem Value="9">9</asp:ListItem>
          <asp:ListItem Value="10">10: Excellent Health</asp:ListItem>
    </euc:EformDropDownList>    </td>
  </tr>
</table>



<br/>
<br/>
<br/>
