<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalAppointment" CodeFile="ColorectalAppointment.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
ComboMaxCharLength = 52;
var colorectalAppointmentDateText = '<% =EncDateText.Text %>';
var colorectalAppointmentDate = '<% =EncDate.Value %>';

//if (typeof(globalDefaultDateText)!= 'undefined') globalDefaultDateText = colorectalAppointmentDateText;


</script>

<a name="ColorectalAppointment" id="Appointment" /><span class="controlBoxTitle">Reason for Visit</span><span style="font-size: 12px; color: #666666; margin-left: 30px;">(how the patient presents in clinic that day)</span><br/>
<table border="0" cellspacing="0" cellpadding="10" width="510" class="eformLargePopulatedTable" onmouseout="setColorectalAppointmentDateVars();" onmouseover="setColorectalAppointmentDateVars();">

 <tr >
	<td valign="top" style="width: 120px;" title="Date of Presentation in Clinic"><strong>Date</strong></td>
	<td valign="top">
		<euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/>
		<euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate" Runat="server"/>
	</td>
  </tr>
  <tr>
	<td valign="top" title="Name of Attending's Clinic"><strong>Attending</strong></td>
	<td>
		<euc:EformComboBox LookupDistinct="Appointments;ApptPhysician;ApptPhysician" id="EncPhysician" Table="Encounters" Field="EncPhysician" 
		    runat="server" Width="125px"/>
		<euc:EformHidden id="EncType" Table="Encounters" Field="EncType" runat="server"/>
	</td>
  </tr>
  <tr>
    <td valign="top" title="Anatomic Site of Disease"><strong>Site of Disease</strong></td>
    <td valign="top" >
        <euc:EformComboBox width="125" LookupCode="DxTarget" ID="DisSite" TABLE="NoTable" FIELD="AnatomicSiteofDisease" runat="server"  />
    </td>
  </tr>
  <tr>
    <td valign="top" title="Chief Complaint"><strong>Type</strong></td>
    <td style="vertical-align:top;"><euc:EformComboBox width="125" ID="EncChiefComplaint" TABLE="Encounters" FIELD="EncChiefComplaint" runat="server" LookupCode="ColorectalDiseaseType" />
    </td>
  </tr>  
</table><br/><br/>

<script type="text/javascript">

function setColorectalAppointmentDateVars()
{
    var DateTextInput = document.getElementById('<% =EncDateText.ClientID %>');
    var DateInput = document.getElementById('<% =EncDate.ClientID %>');
    
    if (DateTextInput != null) 
    {
        colorectalAppointmentDateText = DateTextInput.value;
//        if (typeof(globalDefaultDateText)!= 'undefined') globalDefaultDateText = colorectalAppointmentDateText;

    }
    if (DateInput != null) colorectalAppointmentDate = DateInput.value;
    
    
    
}


</script>