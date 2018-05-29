<%@ Control Language="c#" Inherits="Caisis.UI.Modules.ProtocolMgmt.DataEntryForms.PCCTCImmunoTherapy"
    CodeFile="PCCTCImmunoTherapy.ascx.cs" %>
<%@ Register TagPrefix="pcctc" TagName="MedTxControl" Src="~/Modules/ProtocolMgmt/DataEntryForms/PCCTCMedTxGrid.ascx" %>
<%@ Register TagPrefix="custom" TagName="AbsentEventQuestion" Src="~/Modules/All/DataEntryForms/AbsentEventYesNo.ascx" %>
<h3>
    Immunotherapy</h3>
<custom:AbsentEventQuestion runat="server" ID="MedTxAbsentEvent" AbsentTable="MedicalTherapy"
    AbsentField="MedTxType" AbsentFieldValue="IMMUNO" AbsentQuestionText="Has the subject had prior immunotherapy?"
    PanelId="PCCTCImmunoTherapyPanel" />
<div id="PCCTCImmunoTherapyPanel" style="display: none;">
    <pcctc:MedTxControl runat="server" ID="MedTxControl" TxType="IMMUNO"/>
</div>
