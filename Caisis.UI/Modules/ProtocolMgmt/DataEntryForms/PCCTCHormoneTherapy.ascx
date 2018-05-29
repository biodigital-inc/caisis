<%@ Control Language="c#" Inherits="Caisis.UI.Modules.ProtocolMgmt.DataEntryForms.PCCTCHormoneTherapy"
    CodeFile="PCCTCHormoneTherapy.ascx.cs" %>
<%@ Register TagPrefix="pcctc" TagName="MedTxControl" Src="~/Modules/ProtocolMgmt/DataEntryForms/PCCTCMedTxGrid.ascx" %>
<%@ Register TagPrefix="custom" TagName="AbsentEventQuestion" Src="~/Modules/All/DataEntryForms/AbsentEventYesNo.ascx" %>
<h3>
    Hormone Therapy</h3>
<custom:AbsentEventQuestion runat="server" ID="MedTxAbsentEvent" AbsentTable="MedicalTherapy"
    AbsentField="MedTxType" AbsentFieldValue="HORM" AbsentQuestionText="Has the subject had prior hormonal therapy?"
    PanelId="PCCTCHormoneTherapyPanel" />
<div id="PCCTCHormoneTherapyPanel" style="display: none;">
    <pcctc:MedTxControl runat="server" ID="MedTxControl" TxType="HORM" />
</div>
