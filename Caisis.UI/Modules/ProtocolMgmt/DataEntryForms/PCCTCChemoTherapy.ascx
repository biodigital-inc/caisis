<%@ Control Language="c#" Inherits="Caisis.UI.Modules.ProtocolMgmt.DataEntryForms.PCCTCChemoTherapy"
    CodeFile="PCCTCChemoTherapy.ascx.cs" %>
<%@ Register TagPrefix="pcctc" TagName="MedTxControl" Src="~/Modules/ProtocolMgmt/DataEntryForms/PCCTCMedTxGrid.ascx" %>
<%@ Register TagPrefix="custom" TagName="AbsentEventQuestion" Src="~/Modules/All/DataEntryForms/AbsentEventYesNo.ascx" %>
<h3>
    Chemotherapy</h3>
<custom:AbsentEventQuestion runat="server" ID="MedTxAbsentEvent" AbsentTable="MedicalTherapy"
    AbsentField="MedTxType" AbsentFieldValue="CHEMO" AbsentQuestionText="Has the subject had prior chemotherapy?"
    PanelId="PCCTCChemoTherapyPanel" />
<div id="PCCTCChemoTherapyPanel" style="display: none;">
    <pcctc:MedTxControl runat="server" ID="MedTxControl" TxType="CHEMO" />
</div>
