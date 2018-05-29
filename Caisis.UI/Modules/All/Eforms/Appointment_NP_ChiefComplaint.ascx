<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Appointment_NP_ChiefComplaint" CodeFile="Appointment_NP_ChiefComplaint.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="Appointment_NP_ChiefComplaint" id="Appointment_NP_ChiefComplaint" />
<!--<a name="ClinicDate" id="ClinicDate" />--><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Appointment" /><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="vertical-align: top;"><strong>Date</strong>
		<euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server"/>
		<euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate" Runat="server"/>
	</td>
	<td style="vertical-align: top; padding-top: 12px;">
	    <table cellpadding="0" cellspacing="10"><tr>
	    <td><span style="font-weight: bold;">NP</span></td>
	    <td><euc:EformComboBox LookupCode="Nurses" id="EncNurse" Table="Encounters" Field="EncNurse" runat="server"/></td>
	    </tr>
	    <tr>
	    <td><span style="font-weight: bold;">Attending</span></td>
	    <td><euc:EformComboBox LookupCode="ApptPhysician" id="EncPhysician" Table="Encounters" Field="EncPhysician" runat="server"/>
		<euc:EformHidden id="EncType" Table="Encounters" Field="EncType" runat="server"/></td>
	    </tr>
	    </table>
	</td>
  </tr>
</table>
<br/><br/><br/>
<span class="controlBoxTitle">Chief Complaint</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable"><euc:EformTextArea TextMode="MultiLine" TABLE="Encounters" FIELD="EncChiefComplaint" Rows="4" style="width: 560px;" Runat="server" ID="EncChiefComplaint"/></td>
  </tr>
 
</table>

<br/><br/><br/>