<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.DataEntryForms.PSAAtDiagnosis"
    CodeFile="PSAAtDiagnosis.ascx.cs" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<h3 id="PSAAtDiagnosis">
    PSA At Diagnosis</h3>
<table id="PSAAtDiagnosisTable" class="DataRecords EditableRecords" cellspacing="0"
    style="width: 400px;">
    <tbody>
        <tr>
            <td style="width: 80px;">
                <asp:Label runat="server" AssociatedControlID="LabDateText" CssClass="boldText" Text="Date"></asp:Label>
            </td>
            <td>
                <asp:HiddenField runat="server" ID="LabTestIdField" Value="" />
                <cic:CaisisTextBox runat="server" ID="LabDateText" ShowLabel="false" Table="LabTests"
                    Field="LabDateText" ShowCalendar="True" Width="65px" CalcDate="True"></cic:CaisisTextBox>
                <cic:CaisisHidden runat="server" ID="LabDate" Table="LabTests" Field="LabDate" />
            </td>
            <td style="width: 80px;">
                <asp:Label runat="server" AssociatedControlID="LabResult" CssClass="boldText" Text="Result (ng/ml)">
                </asp:Label>
            </td>
            <td>
                <cic:CaisisTextBox Style="width: 60px;" ID="LabResult" ShowLabel="false" Table="LabTests"
                    Field="LabResult" runat="server" ShowNumberPad="true" />
            </td>
        </tr>
    </tbody>
</table>
