<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.GUProstateAppointment" CodeFile="GUProstateAppointment.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
ComboMaxCharLength = 52;
</script>

<a name="GUProstateAppointment" id="GUProstateAppointment" />
<!--<a name="ClinicDate" id="ClinicDate" />--><span class="controlBoxTitle">Appointment</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">
 <tr >
	<td ><strong>Date</strong><br>
		<euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server" AppendToOnChange="setTimeout('updateDateJSVars()', 100)" />
		<euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate" Runat="server"/>
	</td>
	<td ><strong>Attending</strong><br>
		<euc:EformComboBox LookupDistinct="Appointments;ApptPhysician;ApptPhysician" id="EncPhysician" Table="Encounters" Field="EncPhysician" runat="server"/>
		<euc:EformHidden id="EncType" Table="Encounters" Field="EncType" runat="server"/>
	</td>
  </tr>
</table>
<script type="text/javascript">
var apptDateText;
var apptDate;

function updateDateJSVars()
{
    apptDateText = document.getElementById('<% = EncDateText.ClientID %>').value;
    apptDate = document.getElementById('<% = EncDate.ClientID %>').value;
   
    if(window.updateProstateSitesOfDiseaseDate) {updateProstateSitesOfDiseaseDate(apptDateText, apptDate); }
}
setTimeout('updateDateJSVars()', 500);

</script>
<br/><br/><br/>
