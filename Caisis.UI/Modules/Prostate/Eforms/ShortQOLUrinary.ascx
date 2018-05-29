<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ShortQOLUrinary" CodeFile="ShortQOLUrinary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script>
function getRadioButtonValue(radioButtonName)
{
   var radioValue = '';

   for (var i=0; i < document.dataForm.radioButtonName.length; i++)
   {
      if (document.dataForm.radioButtonName[i].checked)
      {
		radioValue = document.dataForm.radioButtonName[i].value;
      }
   }   
}
function updateSurveyNotes() {
	var s;
	var surveyNotes = document.getElementById('<%= SurveyNotes_1.ClientID %>');
	if (surveyNotes != null) {
		var urinarySum = document.getElementById('UrinaryQTotal');
		var sexualSum = document.getElementById('SexualQTotal');
		if (urinarySum.innerHTML != null && urinarySum.innerHTML != '') {
			s = 'Urinary Total: ' + urinarySum.innerHTML;
			if (sexualSum.innerHTML != null && sexualSum.innerHTML != '') {
				s += ', Sexual Total: ' + sexualSum.innerHTML;
			}
		} else {
			if (sexualSum.innerHTML != null && sexualSum.innerHTML != '') {
				s = 'Sexual Total: ' + sexualSum.innerHTML;
			} else {
				// no value
				s = '';
			}
		}
		surveyNotes.value = s;
	}
}

function updateUrinarySum() {
	updateSumWithSelections('UrinaryQTotal','<%= SurveyItemResult_1.ClientID %>','<%= SurveyItemResult_2.ClientID %>','<%= SurveyItemResult_3.ClientID %>');
	updateSurveyNotes();
}

function executePageEventOnComboClick(selVal, inputFieldName) {
	if (selVal != null && selVal != '') {
		if (inputFieldName.indexOf("IncontinenceTX") > -1) {
			document.getElementById('<%= IncontinenceTX_Indication.ClientID %>').removeAttribute('disabled');
		} else if (inputFieldName.indexOf("StrictureTX") > -1) {
			document.getElementById('<%= StrictureTX_Indication.ClientID %>').removeAttribute('disabled');
		}
	}
}

function enableIncontinenceHidden(val) {
	if (val != null && val != '') {
		document.getElementById('<%= IncontinenceTX_Indication.ClientID %>').removeAttribute('disabled');
	}
}

function enableStrictureHidden(val) {
	if (val != null && val != '') {
		document.getElementById('<%= StrictureTX_Indication.ClientID %>').removeAttribute('disabled');
	}
}
</script>

<a name="ShortQOLUrinary" /><span class="controlBoxTitle">Urinary Function Survey </span><br>
<euc:EformHidden id="SurveyType_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyType" Value="Short QOL Urinary and Sexual"/>
<euc:EformHidden id="SurveyTotal_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyTotal" Value="33"/>
<euc:EformHidden id="SurveyNotes_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyNotes"/>

<euc:EformHidden id="SurveyDate_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyDate"/>
<euc:EformHidden id="SurveyDateText_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyDateText"/>

<table width="650" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc;">
  <tr>
    <td width="5%" valign="top" class="ControlBoxRowAlternatingRowsA"><strong>1</strong></td>
    <td width="6%" valign="top" class="ControlBoxRowAlternatingRowsA">Q1</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsA">Over the past four (4) weeks, how often have you leaked urine? </td>
    <td valign="top" class="ControlBoxRowAlternatingRowsA"  >
    
	
	<euc:EformHidden id="SurveyQuestion_1" runat="server" RecordId="1" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Q1 How often did you leak urine"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_1" runat="server" RecordId="1" ParentRecordId="1"
		EnableHiddenOnUIEvent="SurveyQuestion_1,SurveyType_1,SurveyTotal_1,SurveyNotes_1,SurveyDate_1,SurveyDateText_1"
		AppendToOnChange="updateUrinarySum();">
		
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1">1: Not at all</asp:ListItem>
			<asp:ListItem Value="2">2: Rarely</asp:ListItem>
			<asp:ListItem Value="3">3: More than once a week</asp:ListItem>
			<asp:ListItem Value="4">4: About once a day</asp:ListItem>
			<asp:ListItem Value="5">5: More than once a day</asp:ListItem>
	</euc:EformDropDownList>	</td>
  </tr>
  <tr>
    <td class="ControlBoxRowAlternatingRowsB">&nbsp;</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">Q2</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsB">Over the past four (4) weeks, how much urine did you leak?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsB">
	<euc:EformHidden id="SurveyQuestion_2" runat="server" RecordId="2" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Q2 How much urine did you leak"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_2"  runat="server" RecordId="2" ParentRecordId="1"
		EnableHiddenOnUIEvent="SurveyQuestion_2,SurveyType_1,SurveyTotal_1,SurveyNotes_1"
		AppendToOnChange="updateUrinarySum();">
		
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1">1: Did not leak urine</asp:ListItem>
			<asp:ListItem Value="2">2: When I leaked, it was only a few drops</asp:ListItem>
			<asp:ListItem Value="3">3: When I leaked, it was less than a tablespoon</asp:ListItem>
			<asp:ListItem Value="4">4: When I leaked, it was more than a tablespoon</asp:ListItem>
	</euc:EformDropDownList>	</td>
  </tr>
  <tr>
    <td class="ControlBoxRowAlternatingRowsA">&nbsp;</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsA">Q3</td>
    <td colspan="2" valign="top" class="ControlBoxRowAlternatingRowsA">How many pads or adult diapers per 24-hour period did you use to control urine leakage during the last four (4) weeks?</td>
    <td valign="top" class="ControlBoxRowAlternatingRowsA">
	
		
	<euc:EformHidden id="SurveyQuestion_3" runat="server" RecordId="3" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Q3 How many pads or adult diapers in 24 hrs"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_3"  runat="server" RecordId="3" ParentRecordId="1"
		EnableHiddenOnUIEvent="SurveyQuestion_3,SurveyType_1,SurveyTotal_1,SurveyNotes_1"
		AppendToOnChange="updateUrinarySum();">
		
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1">1: None (or no leakage)</asp:ListItem>
			<asp:ListItem Value="2">2: An occasional pad or protective material</asp:ListItem>
			<asp:ListItem Value="3">3: One pad per 24-hour period</asp:ListItem>
			<asp:ListItem Value="4">4: Two pads per 24-hour period</asp:ListItem>
			<asp:ListItem Value="5">5: Three or more pads per 24-hour period</asp:ListItem>
			<asp:ListItem Value="6">6: Adult diapers</asp:ListItem>
	</euc:EformDropDownList>	</td>
  </tr>
  <tr>
    <td class="ControlBoxRowAlternatingRowsB">&nbsp;</td>
    <td class="ControlBoxRowAlternatingRowsB">&nbsp;</td>
    <td width="17%" class="ControlBoxRowAlternatingRowsB">&nbsp;</td>
    <td width="30%" class="ControlBoxRowAlternatingRowsB"><strong>TOTAL</strong></td>
    <td class="ControlBoxRowAlternatingRowsB">
		&nbsp;<span id="UrinaryQTotal" style="font-weight: bold; font-size: 13px;"></span>	</td>
  </tr>
  <tr id="LastUrinaryQOLRow" runat="server">
    <td colspan="3" class="ControlBoxRowAlternatingRowsB">&nbsp;</td>
    <td colspan="2" class="ControlBoxRowAlternatingRowsB"><asp:Label ID="UrinaryQOL" Runat="server" CssClass="blackBoldTextSmall" /></td>
  </tr>
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;"><strong>2</strong></td>
    <td colspan="4" class="ControlBoxRowAlternatingRowsA"><table border="0" cellspacing="0" cellpadding="0" width="420">
      <tr>
        <td style="font-weight: bold;">Continence<br/>&nbsp;&nbsp;<span style="font-size: smaller;">(TODAY)</span></td>
        <td align="right">
	

	<euc:EformHidden id="SurveyType_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyType" Value="Urinary Function"/>
	<euc:EformHidden id="SurveyDate_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyDate"/>
	<euc:EformHidden id="SurveyDateText_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyDateText"/>
	<euc:EformHidden id="SurveyQuestion_Continence" runat="server" RecordId="1" ParentRecordId="2" Table="SurveyItems" Field="SurveyItem" Value="Continence"/>
	<euc:EformDropDownList TABLE="SurveyItems" FIELD="SurveyItemResult" 
		id="SurveyItemResult_4"  runat="server" RecordId="1" ParentRecordId="2"
		EnableHiddenOnUIEvent="SurveyQuestion_Continence,SurveyType_2,SurveyDate_2,SurveyDateText_2">
		
			<asp:ListItem Value="">-- Select Value --</asp:ListItem>
			<asp:ListItem Value="1">1: Continence (no pads)</asp:ListItem>
			<asp:ListItem Value="2">2: Mild SUI (leaks only during heavy activity)</asp:ListItem>
			<asp:ListItem Value="3">3: Moderate SUI (leaks with moderate activity)</asp:ListItem>
			<asp:ListItem Value="4">4: Severe SUI (leaks during nl activity, dry at night and at rest)</asp:ListItem>
			<asp:ListItem Value="5">5: Total Incontinence (continuous leakage of urine at rest)</asp:ListItem>
	</euc:EformDropDownList>  	</td>
      </tr>
    </table><asp:Label ID="LastCont" Runat="server" CssClass="blackBoldTextSmall"/></td>
  </tr>
  <tr>
    <td height="45" valign="top" class="ControlBoxRowAlternatingRowsB"><strong>3</strong></td>
    <td colspan="4" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">

	<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td colspan="2"><asp:Label id="DateMildContinenceAchievedLabel" runat="server" Font-Bold="true">Mild Continence (Score 2 for Continence) was not achieved/recorded prior to today.</asp:Label></td>
  </tr>
  <tr id="PastMildContinenceRow" runat="server">
    <td  style="padding-top: 17px; padding-bottom: 14px; padding-left: 20px;">If Mild Continence <strong>was achieved prior to today</strong>,<br/>you may record the date it was achieved here:
	<euc:EformHidden id="SurveyType_MildContinence" runat="server" RecordId="5" Table="Surveys" Field="SurveyType" Value="Urinary Function"/>
	<euc:EformHidden id="SurveyQuestion_MildContinence" runat="server" RecordId="1" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" Value="Continence"/>
	<euc:EformHidden id="SurveyItemResult_MildContinence" runat="server" RecordId="1" ParentRecordId="5" Table="SurveyItems" FIELD="SurveyItemResult"  Value="2"/>
	<euc:EformHidden id="MildContinence_SurveyDate" runat="server" RecordId="5" Table="Surveys" Field="SurveyDate"/>
	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Surveys"  RecordId="5"  FIELD="SurveyDateText" Runat="server" ID="MildContinence_SurveyDateText" EnableHiddenOnUIEvent="SurveyType_MildContinence,SurveyQuestion_MildContinence,SurveyItemResult_MildContinence"/></td>
  </tr>
</table>	</td>
  </tr>
  <tr>
    <td height="45" valign="top" class="ControlBoxRowAlternatingRowsA"><strong>4</strong></td>
    <td colspan="4" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;"><table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
        <td><asp:Label id="DateTotalContinenceAchievedLabel" runat="server" Font-Bold="true">Total Continence (Score 1 for Continence) was not achieved/recorded prior to today.</asp:Label></td>
      </tr>
      <tr id="PastTotalContinenceRow" runat="server">
        <td style="padding-top: 17px; padding-bottom: 14px;padding-left: 20px">If Total Continence <strong>was achieved prior to today</strong>,<br/>you may record the date it was achieved here:
        	<euc:EformHidden id="SurveyType_TotalContinence" runat="server" RecordId="6" Table="Surveys" Field="SurveyType" Value="Urinary Function"/>
            <euc:EformHidden id="SurveyQuestion_TotalContinence" runat="server" RecordId="1" ParentRecordId="6" Table="SurveyItems" Field="SurveyItem" Value="Continence"/>
            <euc:EformHidden id="SurveyItemResult_TotalContinence" runat="server" RecordId="1" ParentRecordId="6" Table="SurveyItems" FIELD="SurveyItemResult"  Value="1"/>
            <euc:EformHidden id="TotalContinence_SurveyDate" runat="server" RecordId="6" Table="Surveys" Field="SurveyDate"/>
            <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Surveys"  RecordId="6"  FIELD="SurveyDateText" Runat="server" ID="TotalContinence_SurveyDateText" EnableHiddenOnUIEvent="SurveyType_TotalContinence,SurveyQuestion_TotalContinence,SurveyItemResult_TotalContinence"/>        </td>
      </tr>
    </table>      </td>
  </tr>
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;"><strong>5</strong></td>
    <td colspan="2" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">TX for Incontinence</td>
    <td class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">
	<euc:EformHidden id="IncontinenceTX_Indication" name="IncontinenceTX_Indication" runat="server" RecordId="3" Table="QOL_Therapy" Field="QOL_TxIndication" Value="Incontinence" />
	<euc:EformComboBox LookupCode="QOL_Therapy"  RefBy="IncontinenceTX" style="width:100;" Field="QOL_Therapy" Table="QOL_Therapy" RecordId="3" Runat="server" id="IncontinenceTX"  />
      <asp:Label ID="LastIncontTx" Runat="server" CssClass="blackBoldTextSmall" /></td>
    <td class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">TX Date &nbsp;&nbsp;&nbsp;
	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="QOL_Therapy"  RecordId="3"  FIELD="QOL_TxDateText" Runat="server" ID="IncontinenceTXDateText" AppendToOnChange="enableIncontinenceHidden(this.value);"/>
	<euc:EformHidden RecordId="3" Runat="server" ID="IncontinenceTXDate" Table="QOL_Therapy" FIELD="QOL_TxDate" /></td>
  </tr>
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;"><strong>6</strong></td>
    <td colspan="2" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">TX for Stricture			</td>
    <td class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">
	
	<euc:EformHidden id="StrictureTX_Indication" runat="server" RecordId="4" Table="QOL_Therapy" Field="QOL_TxIndication" Value="Stricture"/>	
	<euc:EformComboBox  LookupCode="QOL_Therapy"   RefBy="IncontinenceTX" style="width:100;" Field="QOL_Therapy" Table="QOL_Therapy"    RecordId="4" Runat="server" id="StrictureTX"/></td>
    <td class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">TX Date &nbsp;&nbsp;&nbsp;
	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="QOL_Therapy"  RecordId="4"  FIELD="QOL_TxDateText" Runat="server" ID="StrictureTXDateText" AppendToOnChange="enableStrictureHidden(this.value);"/>
	<euc:EformHidden RecordId="4" Runat="server" ID="StrictureTXDate" Table="QOL_Therapy" FIELD="QOL_TxDate" />	</td>
  </tr>
  
  <tr>
    <td height="45" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;"><strong>7</strong>	</td>
    <td colspan="4" class="ControlBoxRowAlternatingRowsB" style="vertical-align: top;">IPSS Score
	<euc:EformHidden id="SurveyType_IPSS" runat="server" RecordId="4" Table="Surveys" Field="SurveyType" Value="IPSS"/>
	<euc:EformHidden id="SurveyDate_IPSS" runat="server" RecordId="4" Table="Surveys" Field="SurveyDate"/>
    <euc:EformHidden id="SurveyDateText_IPSS" runat="server" RecordId="4" Table="Surveys" Field="SurveyDateText"/>
	<euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" ShowNumberPad="true" style="width:90px;" TABLE="Surveys" FIELD="SurveyResult" Runat="server" ID="IPSSScore"   />	</td>
  </tr>
    <tr>
    <td height="45" valign="top" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;"><strong>8</strong></td>
    <td colspan="4" valign="top" class="ControlBoxRowAlternatingRowsA" style="vertical-align: top;">
		<table cellpadding="0" cellspacing="0" border="0">
		<tr><td valign="top" style="padding-right: 8px;">
	Notes</td><td>
      <euc:EformTextArea TextMode="MultiLine" TABLE="Surveys" FIELD="SurveyNotes" RecordId="2" Rows="4" Runat="server" ID="UrinaryNotes" style="width: 500px;"/></td>
  		</tr></table></td>
  </tr>
</table>
<br/>
<br/>
<br/>
<script language="javascript">
	updateSumWithSelections('UrinaryQTotal','<%= SurveyItemResult_1.ClientID %>','<%= SurveyItemResult_2.ClientID %>','<%= SurveyItemResult_3.ClientID %>');
</script>
<script language="javascript">
	function enableSurveyType() {
		var val = document.getElementById('<%= IPSSScore.ClientID %>').value;
		if (val != null && val != '') {
			document.getElementById('<%= SurveyType_IPSS.ClientID %>').removeAttribute('disabled');
			document.getElementById('<%= SurveyDate_IPSS.ClientID %>').removeAttribute('disabled');
			document.getElementById('<%= SurveyDateText_IPSS.ClientID %>').removeAttribute('disabled');
		} else {
			document.getElementById('<%= SurveyType_IPSS.ClientID %>').disabled = 'disabled';
			document.getElementById('<%= SurveyDate_IPSS.ClientID %>').disabled = 'disabled';
			document.getElementById('<%= SurveyDateText_IPSS.ClientID %>').disabled = 'disabled';
		}
	}
	
	document.getElementById('<%= IPSSScore.ClientID %>').onblur = enableSurveyType;
</script>
