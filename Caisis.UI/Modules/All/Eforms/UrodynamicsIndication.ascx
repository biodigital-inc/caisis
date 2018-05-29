<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.UrodynamicsIndication" CodeFile="UrodynamicsIndication.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
#UrodynamicsIndicationTable td
{
	padding-left: 20px;
	padding-right: 20px;
} 
</style>
<a name="UrodynamicsIndication" id="UrodynamicsIndication" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Previous History / Indication" /><br/>
<table id="UrodynamicsIndicationTable" border="0" cellspacing="0" cellpadding="16" width="600"  class="eformLargePopulatedTable">
  <tr>
    <td style="vertical-align: top; padding-right: 0px;">
        <euc:EformHidden id="SurveyItem_1" runat="server" RecordId="1" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Indication"/>
        <euc:EformExtendedCheckBoxList RepeatLayout="Table" RepeatDirection="Vertical" RepeatColumns="2" CellPadding="0" ShowOther="true" id="SurveyItemResult_1" runat="server" RecordId="1" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" EnableHiddenOnUIEvent="SurveyItem_1" >
			<asp:ListItem >Post Prostatectomy</asp:ListItem>
			<asp:ListItem >Post Cystectomy</asp:ListItem>
			<asp:ListItem >Post Radical GI Surgery</asp:ListItem>
			<asp:ListItem >Post BCG Therapy</asp:ListItem>
			<asp:ListItem >Frequency</asp:ListItem>
			<asp:ListItem >Augmentation</asp:ListItem>
			<asp:ListItem >Radical Prostatectomy</asp:ListItem>
			<asp:ListItem >Laprascopic Prostatectomy</asp:ListItem>
			<asp:ListItem >Neobladder</asp:ListItem>
			<asp:ListItem >Post Radical GYN Surgery</asp:ListItem>
			<asp:ListItem >Urgency</asp:ListItem>
			<asp:ListItem >Pelvic Prolapse</asp:ListItem>
			<asp:ListItem >Ileal-conduit</asp:ListItem>
			<asp:ListItem >Post Radiation</asp:ListItem>
			<asp:ListItem >Retention</asp:ListItem>
			<asp:ListItem >Neurogenic Bladder</asp:ListItem>
			<asp:ListItem >Catheter Use</asp:ListItem>
			<asp:ListItem >Catheter Use (Intermittent)</asp:ListItem>
			<asp:ListItem >Catheter Use (In Dwelling)</asp:ListItem>
			<asp:ListItem >Robot Assisted Prostatectomy</asp:ListItem>
			<asp:ListItem >Continent Cutaneous Reservoir</asp:ListItem>
			<asp:ListItem >Post TURBT</asp:ListItem>
			<asp:ListItem >Incontinence (PCa)</asp:ListItem>
			<asp:ListItem >Incontinence (Other Cause)</asp:ListItem>
			<asp:ListItem >BPH</asp:ListItem>
			<asp:ListItem >Preop for procedure</asp:ListItem>
		</euc:EformExtendedCheckBoxList>
    </td>
  </tr>
</table>
<br/><br/><br/>