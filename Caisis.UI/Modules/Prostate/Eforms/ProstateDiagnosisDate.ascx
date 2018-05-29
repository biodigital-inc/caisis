<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateDiagnosisDate" CodeFile="ProstateDiagnosisDate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
#StatusContainer table
{
    float: right;
}
#StatusContainer td
{
    vertical-align: top;
    padding-right: 12px;
}
</style>

<a name="ProstateDiagnosisDate" id="ProstateDiagnosisDate" />
<span class="controlBoxTitle">Diagnosis Date</span><br/>
<table id="StatusContainer" border="0" cellspacing="0" cellpadding="16" width="650" class="eformLargePopulatedTable" style="margin-bottom: 20px;">
 <tr >
	<td ><strong>Date</strong>
		<euc:EformTextBox Runat="server" ID="StatusDateText" TABLE="Status" RecordId="1" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setTimeout('setDiagnosisDateVars()',500);" />
		<euc:EformHidden Runat="server" ID="StatusDate" Table="Status" RecordId="1" Field="StatusDate" />
		<euc:EformTextBox style="display: none;" id="StatusDisease" Table="Status" Field="StatusDisease" Runat="server"/>
	</td>

	<td>
	
	<euc:EformRadioButtonList  onclick="setStatusFields();" RepeatColumns="2" RepeatLayout="Table"  RepeatDirection="Horizontal" TABLE="Status" RecordId="1" FIELD="Status" id="Status" CellPadding="0" runat="server">
				<asp:ListItem Value="Localized">Localized</asp:ListItem>
				<asp:ListItem Value="Rising PSA Non-Castrate">Rising PSA Non-Castrate</asp:ListItem>
				<asp:ListItem Value="Clinical Mets Non-Castrate">Clinical Mets Non-Castrate</asp:ListItem>
				<asp:ListItem Value="Rising PSA Castrate">Rising PSA Castrate</asp:ListItem>
				<asp:ListItem Value="Clinical Mets Castrate">Clinical Mets Castrate</asp:ListItem>
	  </euc:EformRadioButtonList>
	<strong>Status</strong>
	</td>
  </tr>
</table>
<script type="text/javascript">
function setStatusFields()
{
    var StatusDisease = $('<% =StatusDisease.ClientID %>');
    StatusDisease.value = 'Prostate Cancer';
}

var DiagnosisDateTextVal = '<% = StatusDateText.Value %>';
var DiagnosisDateVal = '<% = StatusDate.Value %>';

function setDiagnosisDateVars()
{
    DiagnosisDateTextVal = $('<% =StatusDateText.ClientID %>').value;
    DiagnosisDateVal = $('<% =StatusDate.ClientID %>').value;
}





</script>