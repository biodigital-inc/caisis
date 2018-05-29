<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.TreatmentDecision" CodeFile="TreatmentDecision.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<style type="text/css">
#TreatmentDecisionHTMLTable
{
    border: solid 1px #cccccc;
    background-color: #f1f1f1;
}
#TreatmentDecisionHTMLTable>tbody>tr>td
{
    padding: 16px;
    color: #8d2a2c;
    font-size: 15px;
}
#TreatmentDecisionOptionsContainer td
{
    padding: 2px 50px 2px 0px;
}
</style>

<div id="EndActiveSurveilancePanel" runat="server" visible="true" style="margin-bottom: 50px;">
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Treatment Plan"></asp:Label><br/>
<table id="TreatmentDecisionHTMLTable" style="width: 600px;">
<!-- <tr >
	<td>If a treatment plan has been decided, please indicate:</td>
</tr> -->
<tr>
	
	<td id="TreatmentDecisionOptionsContainer" style="padding-top: 0px; font-weight: normal;">

				<euc:EformRadioButtonList TABLE="Actions" RecordId="1" FIELD="ActionNotes" id="ActionNotes" RepeatLayout="Table" RepeatDirection="Vertical" RepeatColumns="2" runat="server" ShowOther="true">
                    <asp:ListItem Value="Active Surveillance" Text="Active Surveillance" />
                    <asp:ListItem Value="Surgery" Text="Surgery" />
                    <asp:ListItem Value="Non-Surgical Candidate" Text="Non-Surgical Candidate" />
                    <asp:ListItem Value="Patient will call with decision" Text="Patient will call with decision" />
                    <asp:ListItem Value="Medical Oncology Referral" Text="Medical Oncology Referral" />
                    <asp:ListItem Value="Radiation Oncology Referral" Text="Radiation Oncology Referral" />
                    <asp:ListItem Value="Discharged Elsewhere" Text="Discharged Elsewhere" />
				</euc:EformRadioButtonList>

	</td>	
  </tr>
  
</table>
</div>
