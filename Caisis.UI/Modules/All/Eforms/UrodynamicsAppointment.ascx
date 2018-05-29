<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.UrodynamicsAppointment" CodeFile="UrodynamicsAppointment.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
ComboMaxCharLength = 52;


</script>

<a name="UrodynamicsAppointment" id="UrodynamicsAppointment" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Appointment"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable" style="margin-bottom: 40px;">

 <tr >
	<td ><strong>Date</strong><br/>
		<euc:EformTextBox id="EncDateText" style="width: 80px;" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server" EnableHiddenOnUIEvent="SurveyType,SurveyDate,SurveyDateText,SurveyQuality" AppendToOnChange="setTimeout('syncDates()', 500)" />
		<euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate" Runat="server" />
	</td>
	<td ><strong>Physician</strong><br/>
		<euc:EformComboBox LookupDistinct="Appointments;ApptPhysician;ApptPhysician" id="EncPhysician" Table="Encounters" Field="EncPhysician" runat="server"  EnableHiddenOnUIEvent="SurveyType,SurveyDate,SurveyDateText,SurveyQuality"/>
		<euc:EformHidden id="EncType" Table="Encounters" Field="EncType" runat="server"/>
	</td>
  </tr>
</table>
<euc:EformHidden id="SurveyType" runat="server" RecordId="1" Table="Surveys" Field="SurveyType" Value="Urodynamics"/>
<euc:EformHidden id="SurveyQuality" runat="server" RecordId="1" Table="Surveys" Field="SurveyQuality" Value="STD"/>
<euc:EformHidden id="SurveyDate" runat="server" RecordId="1" Table="Surveys" Field="SurveyDate"/>
<euc:EformHidden id="SurveyDateText" runat="server" RecordId="1" Table="Surveys" Field="SurveyDateText"/>

<script type="text/javascript">
var EncDateTextField = $('<%= EncDateText.ClientID %>');
var EncDateField = $('<%= EncDate.ClientID %>');
var SurveyDateTextField = $('<%= SurveyDateText.ClientID %>');
var SurveyDateField = $('<%= SurveyDate.ClientID %>');

function syncDates()
{
	SurveyDateTextField.value = EncDateTextField.value;
	SurveyDateField.value = EncDateField.value;
}

if(window.addEventListener) {
	window.addEventListener("unload", syncDates, false);
} else if(window.attachEvent) {
	window.attachEvent("unload", syncDates);
}

</script>