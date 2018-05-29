<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LetterOfIntentEditorBudget.ascx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.LetterOfIntentEditorBudget" %>
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
            Budget<br />
            <table cellpadding="4" cellspacing="0"  style="border: solid 1px #999999; width: 100%; font-weight: normal; table-layout: fixed;" >
                <tr>
                    <td >
                        <label for="PCCTCBudgetUsed" title="PCCTC Budget Used">
                            PCCTC Budget Used</label>
                    </td>
                    <td >
                        <cc:CaisisComboBox ID="PCCTCBudgetUsed" runat="server" CssClass="UnselectedField"
                            ShowLabel="false" Table="ProjectLetterOfIntent" Field="PCCTCBudgetUsed" LookupCode="YesNoUnknown" MaxLength="50"></cc:CaisisComboBox>
                    </td>
                    <td >
                        <label for="IsBudgetPerPatient" title="Budget Based Per Patient">
                            Budget Based Per Patient</label>
                    </td>
                    <td >
                        <cc:CaisisComboBox ID="IsBudgetPerPatient" runat="server" CssClass="UnselectedField"
                            ShowLabel="false" Table="ProjectLetterOfIntent" Field="IsBudgetPerPatient" LookupCode="YesNoUnknown" MaxLength="50"></cc:CaisisComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="RelativeStudiesProposed" title="Correlative Studies Proposed">
                            Correlative Studies Proposed</label>
                    </td>
                    <td>
                        <cc:CaisisComboBox ID="RelativeStudiesProposed" runat="server" CssClass="UnselectedField"
                            ShowLabel="false" Table="ProjectLetterOfIntent" Field="RelativeStudiesProposed"
                            LookupCode="YesNoUnknown" MaxLength="50">
                        </cc:CaisisComboBox>
                    </td>
                    <td>
                        <label for="RelativeStudiesFunded" title="Correlative Studies Funded">
                            Correlative Studies Funded</label>
                    </td>
                    <td>
                        <cc:CaisisComboBox ID="RelativeStudiesFunded" runat="server" CssClass="UnselectedField"
                            ShowLabel="false" Table="ProjectLetterOfIntent" Field="RelativeStudiesFunded"
                            LookupCode="YesNoUnknown" MaxLength="50"></cc:CaisisComboBox>
                    </td>
                </tr>            
            
            </table>
        </td>
    </tr>
</table>
