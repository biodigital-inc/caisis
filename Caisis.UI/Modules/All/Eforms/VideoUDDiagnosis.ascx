<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.VideoUDDiagnosis" CodeFile="VideoUDDiagnosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
#VideoUDDiagnosisTable td
{
	padding-left: 20px;
	padding-right: 20px;
} 
</style>
<a name="VideoUDDiagnosis" id="VideoUDDiagnosis" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Video Urodynamics Study Diagnosis" /><br/>
<table id="VideoUDDiagnosisTable" border="0" cellspacing="0" cellpadding="16" width="600"  class="eformLargePopulatedTable">
  <tr>
    <td style="vertical-align: top; padding-right: 0px;">
        <euc:EformHidden id="SurveyItem_66" runat="server" RecordId="66" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video UD Diagnosis"/>
        <euc:EformExtendedCheckBoxList RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" ShowOther="true" id="SurveyItemResult_66" runat="server" RecordId="66" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" EnableHiddenOnUIEvent="SurveyItem_66" >
			<asp:ListItem >Bladder Outlet Obstruction</asp:ListItem>
			<asp:ListItem >Detrusor Sphincter Dyssynergia</asp:ListItem>
			<asp:ListItem >Detrusor Overactivity Incontinence</asp:ListItem>
			<asp:ListItem >Detrusor Underactivity</asp:ListItem>
			<asp:ListItem >Vesicoureteral Reflex</asp:ListItem>
			<asp:ListItem >Poor Compliance</asp:ListItem>
			<asp:ListItem >Urethral Stricture</asp:ListItem>
			<asp:ListItem >Stomal Stenosis</asp:ListItem>
			<asp:ListItem >Small Capacity Bladder</asp:ListItem>
			<asp:ListItem >Sphincteric Incontinence</asp:ListItem>
			<asp:ListItem >Diverticula</asp:ListItem>
			<asp:ListItem >Detrusor Overactivity</asp:ListItem>
			<asp:ListItem >Large Capacity Bladder</asp:ListItem>
			<asp:ListItem >Trabeculations</asp:ListItem>
			<asp:ListItem >Impaired Sensation</asp:ListItem>
			<asp:ListItem >Abdominal Voiding</asp:ListItem>
			<asp:ListItem >Peristalsis</asp:ListItem>
			<asp:ListItem >Filling Defect</asp:ListItem>
			<asp:ListItem >Bladder stones</asp:ListItem>
			<asp:ListItem >Prolapse</asp:ListItem>
			<asp:ListItem >Preop for procedure</asp:ListItem>
		</euc:EformExtendedCheckBoxList>
    </td>
  </tr>
</table>
<br/><br/><br/>