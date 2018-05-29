<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.AppointmentWMultiClinicians" CodeFile="AppointmentWMultiClinicians.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
ComboMaxCharLength = 52;
</script>

<a name="AppointmentWMultiClinicians" id="AppointmentWMultiClinicians" />
<!--<a name="ClinicDate" id="ClinicDate" />--><span class="controlBoxTitle">Appointment</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="vertical-align: top;"><strong>Date</strong>
		<euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server"/>
		<euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate" Runat="server"/>
	</td>
	<td style="vertical-align: top; padding-top: 12px;">
	    <table cellpadding="0" cellspacing="4">
	    <tr>
	    <td><span style="font-weight: bold;">Attending</span></td>
	    <td><euc:EformComboBox LookupCode="ApptPhysician" id="EncPhysician" Table="Encounters" Field="EncPhysician" runat="server"/>
		<euc:EformHidden id="EncType" Table="Encounters" Field="EncType" runat="server"/></td>
	    </tr><tr>
	    <td><span style="font-weight: bold;">Fellow</span></td>
	    <td><euc:EformComboBox LookupCode="ApptPhysician" id="EncFellow" Table="Encounters" Field="EncFellow" runat="server"/></td>
	    </tr><tr>
	    <td><span style="font-weight: bold;">Nurse</span></td>
	    <td><euc:EformComboBox LookupCode="Nurses" id="EncNurse" Table="Encounters" Field="EncNurse" runat="server"/></td>
	    </tr>
	    </table>
	</td>
  </tr>
</table>
<br/><br/><br/>
<!--<span class="controlBoxTitle">Chief Complaint</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable"><euc:EformTextArea TextMode="MultiLine" TABLE="Encounters" FIELD="EncChiefComplaint" Rows="4" style="width: 560px;" Runat="server" ID="EncChiefComplaint"/></td>
  </tr>
 
</table>

<br/><br/><br/>-->