<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Encounter2" CodeFile="Encounter2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

</script>

<a name="Encounter2" id="ChiefComplaint" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Encounter"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td ><strong>Date</strong><br/>
		<euc:EformTextBox Width="80px" id="EncDateText" RecordId="1" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server"/>
		<euc:EformHidden id="EncDate" RecordId="1" Table="Encounters" Field="EncDate" Runat="server"/>
	</td>
	<td ><strong>Physician</strong><br/>
		<euc:EformComboBox Width="150px" id="EncPhysician" RecordId="1" Table="Encounters" Field="EncPhysician" runat="server"  LookupCode="Physician"/>
	</td>
  </tr>
</table>
<br/><br/><br/>
