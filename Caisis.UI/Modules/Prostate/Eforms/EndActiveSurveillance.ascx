<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.EndActiveSurveillance" CodeFile="EndActiveSurveillance.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<style type="text/css">
#EndActiveSurveilanceHTMLTable
{
    border: solid 3px #8d2a2c;
    background-color: #f1f1f1;
}
#EndActiveSurveilanceHTMLTable>tbody>tr>td
{
    padding: 16px;
    color: #8d2a2c;
    font-size: 15px;
}
</style>

<div id="EndActiveSurveilancePanel" runat="server" visible="false" style="margin-bottom: 50px;">
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="End Active Surveillance?"></asp:Label><br/>
<table id="EndActiveSurveilanceHTMLTable" style="width: 600px;">
 <tr >
	<td>This patient has a previous status record indicating active surveillance.  You have chosen the Prostate Follow-Up form indicating the patient has received treatment or will receive treatment.   If the patient is still on active surveillance please close this form and choose the Active Surveillance EForm.  If not, please choose the primary indication for treatment:</td>
</tr>
<tr>
	
	<td style="padding-top: 0px; font-weight: normal;">

				<euc:EformRadioButtonList TABLE="Status" RecordId="2" FIELD="StatusNotes" id="StatusNotes" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" ShowOther="true">
                    <asp:ListItem Value="Gleason grade upgrade" Text="Gleason grade upgrade" />
                    <asp:ListItem Value="Increase in the volume or percentage of cores with cancer" Text="Increase in the volume or percentage of cores with cancer" />
                    <asp:ListItem Value="Imaging" Text="Imaging" />
                    <asp:ListItem Value="Changes in PSA or DRE" Text="Changes in PSA or DRE" />
                    <asp:ListItem Value="Patient preference" Text="Patient preference" />
				</euc:EformRadioButtonList>

	</td>	
  </tr>
  
</table>
</div>
