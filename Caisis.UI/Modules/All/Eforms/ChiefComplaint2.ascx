<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ChiefComplaint2" CodeFile="ChiefComplaint2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
ComboMaxCharLength = 52;
</script>

<a name="ChiefComplaint2" id="ChiefComplaint" />
<!--<a name="ClinicDate" id="ClinicDate" />--><span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Appointment"></asp:Label></span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td ><strong>Date</strong><br>
		<euc:EformTextBox id="EncDateText" RecordId="1" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server"/>
		<euc:EformHidden id="EncDate" RecordId="1" Table="Encounters" Field="EncDate" Runat="server" />
	</td>
	<td ><strong>Attending</strong><br>
		<euc:EformComboBox LookupCode="Physician" id="EncPhysician" RecordId="1" Table="Encounters" Field="EncPhysician" runat="server"/>
		<euc:EformHidden id="EncType" RecordId="1" Table="Encounters" Field="EncType" runat="server" />
	</td>
  </tr>
</table>
<br/><br/><br/>
<!--<a name="ChiefComplaint" id="ChiefComplaint" />--><span class="controlBoxTitle">Chief Complaint</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable"><euc:EformTextArea TextMode="MultiLine" RecordId="1" TABLE="Encounters" FIELD="EncChiefComplaint" Rows="4" style="width: 560px;" Runat="server" ID="EncChiefComplaint"/></td>
  </tr>
 
</table>

<br/><br/><br/>