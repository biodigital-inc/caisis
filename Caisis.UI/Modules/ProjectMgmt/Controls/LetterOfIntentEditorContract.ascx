<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LetterOfIntentEditorContract.ascx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.LetterOfIntentEditorContract" %>
<%@ Register TagPrefix="spaw" Namespace="Solmetra.Spaw2" Assembly="Solmetra.Spaw2" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>

<table runat="server" cellpadding="0" cellspacing="0" style="table-layout: fixed;
    width: 95%; margin: 10px auto 25px auto; vertical-align: top;" id="MainTable">
    <tr>
        <td>
            <div id="ProjectContainerModal" style="position: absolute; z-index: 5; background-color: #000000;
                width: 100%; margin: 0; padding: 0; height: 300px; top: 0px; left: 0px; display: none;">
            </div>
        </td>
    </tr>
    <tr>
        <td style="font-weight: bold; padding-top: 20px; font-size: 13px; color: #000000;" colspan="4">
            Contract<br />
            <table cellpadding="4" cellspacing="0"  style="border: solid 1px #999999; width: 100%; font-weight: normal; table-layout: fixed;" >
                <tr>
                    <td  style="width: 22%;">
                        <label for="ContractExecuted" title="Contract Executed">
                            Contract Executed</label>
                    </td>
                    <td >
                        <cc:CaisisComboBox ID="ContractExecuted" runat="server" CssClass="UnselectedField"
                            ShowLabel="false" Table="ProjectLetterOfIntent" Field="ContractExecuted" LookupCode="YesNoUnknown"
                            MaxLength="50" ></cc:CaisisComboBox>
                    </td>
                    <td style="width: 12%;">
                        <label for="MCTAUsed" title="MCTA Used">
                            MCTA Used</label>
                    </td>
                    <td >
                        <cc:CaisisComboBox ID="MCTAUsed" runat="server" CssClass="UnselectedField" ShowLabel="false"
                            Table="ProjectLetterOfIntent" Field="MCTAUsed" MaxLength="50" LookupCode="YesNoUnknown"></cc:CaisisComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="SponsorAgreed" title="Sponsor Agreed To Proceed">
                            Sponsor Agreed To Proceed</label>
                    </td>
                    <td>
                        <cc:CaisisComboBox ID="SponsorAgreed" runat="server" CssClass="UnselectedField" ShowLabel="false"
                            Table="ProjectLetterOfIntent" Field="SponsorAgreed" MaxLength="50" LookupCode="YesNoUnknown"></cc:CaisisComboBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
