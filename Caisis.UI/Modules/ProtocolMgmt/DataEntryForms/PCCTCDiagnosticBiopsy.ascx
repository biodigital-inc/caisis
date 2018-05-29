<%@ Control Language="c#" Inherits="Caisis.UI.Modules.ProtocolMgmt.DataEntryForms.PCCTCDiagnosticBiopsy"
    CodeFile="PCCTCDiagnosticBiopsy.ascx.cs" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<h3 id="PCCTCDiagnosticBiopsy">
    Diagnostic Biopsy
</h3>
<%--key fields --%>
<asp:HiddenField runat="server" ID="ProcedureId" />
<asp:HiddenField runat="server" ID="PathologyId" />
<asp:HiddenField runat="server" ID="PathologyStageGradeId" />
<table id="DiagnosticBiopsyTable" class="DataRecords EditableRecords" cellspacing="0"
    style="width: 600px;">
    <tbody>
        <asp:PlaceHolder runat="server" ID="DiagnosticBiopsyFields">
            <tr>
                <td colspan="1">
                    <asp:Label runat="server" AssociatedControlID="ProcDateText">
                    Date</asp:Label>
                </td>
                <td colspan="3">
                    <cic:CaisisTextBox ShowCalendar="true" CalcDate="true" Table="Procedures" Field="ProcDateText"
                        runat="server" ID="ProcDateText" Width="70px" ShowLabel="false"></cic:CaisisTextBox>
                    <cic:CaisisHidden runat="server" ID="ProcDate" Table="Procedures" Field="ProcDate">
                    </cic:CaisisHidden>
                </td>
                <td colspan="1">
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="PathSpecimenType" CssClass="requiredField">
                    Type</asp:Label>
                </td>
                <td colspan="3">
                    <cic:CaisisComboBox LookupCode="BxType" Table="Pathology" Field="PathSpecimenType"
                        runat="server" ID="PathSpecimenType" ShowLabel="false" Width="85px" Required="true"></cic:CaisisComboBox>
                </td>
            </tr>
            <tr>
                <td colspan="1">
                    <asp:Label ID="Label16" runat="server" AssociatedControlID="PathSite">
                    Site</asp:Label>
                </td>
                <td colspan="3">
                    <cic:CaisisComboBox LookupCode="BxSite" Table="Pathology" Field="PathSite" runat="server"
                        ID="PathSite" ShowLabel="false" Width="85px"></cic:CaisisComboBox>
                </td>
                <td colspan="1">
                    <asp:Label ID="Label2" runat="server" AssociatedControlID="PathHistology">
                    Histology</asp:Label>
                </td>
                <td colspan="3">
                    <cic:CaisisComboBox LookupCode="PathHistology" ID="PathHistology" Table="Pathology"
                        Field="PathHistology" runat="server" ShowLabel="false" Width="85px"></cic:CaisisComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" AssociatedControlID="PathGG1">
                    G1</asp:Label>
                </td>
                <td>
                    <cic:CaisisTextBox ID="PathGG1" Table="ProstateBiopsyPath" Field="PathGG1" runat="server"
                        Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" AssociatedControlID="PathGG2">
                    G2</asp:Label>
                </td>
                <td>
                    <cic:CaisisTextBox ID="PathGG2" Table="ProstateBiopsyPath" Field="PathGG2" runat="server"
                        Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" AssociatedControlID="PathGG3">
                    G3</asp:Label>
                </td>
                <td>
                    <cic:CaisisTextBox ID="PathGG3" Table="ProstateBiopsyPath" Field="PathGG3" runat="server"
                        Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" AssociatedControlID="">
                    G Sum</asp:Label>
                </td>
                <td>
                    <cic:CaisisTextBox ID="PathGGS" Table="ProstateBiopsyPath" Field="PathGGS" runat="server"
                        Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" AssociatedControlID="PathPosCores">
                    + Cores</asp:Label>
                </td>
                <td>
                    <cic:CaisisTextBox ID="PathPosCores" Table="ProstateBiopsyPath" Field="PathPosCores"
                        runat="server" Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" AssociatedControlID="PathNumCores">
                    Total Cores</asp:Label>
                </td>
                <td>
                    <cic:CaisisTextBox ID="PathNumCores" Table="ProstateBiopsyPath" Field="PathNumCores"
                        runat="server" Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                </td>
                <td>
                    <asp:Label ID="Label9" runat="server" AssociatedControlID="PathPercCancer">
                    % Cancer</asp:Label>
                </td>
                <td colspan="3">
                    <cic:CaisisTextBox ID="PathPercCancer" Table="ProstateBiopsyPath" Field="PathPercCancer"
                        runat="server" Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                </td>
            </tr>
        </asp:PlaceHolder>
        <!-- pathology stage grade -->
        <asp:PlaceHolder runat="server" ID="StageGradePanel">
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" AssociatedControlID="PathStageDisease">
                    Disease</asp:Label>
                </td>
                <td colspan="2">
                    <cic:CaisisSelect runat="server" ID="PathStageDisease" ShowLabel="false" Table="PathologyStageGrade"
                        Field="PathStageDisease" LookupCode="ClinStageDisease" Width="100px">
                    </cic:CaisisSelect>
                </td>
                <td>
                    <asp:Label ID="Label11" runat="server" AssociatedControlID="PathStageSystem">
                    System</asp:Label>
                </td>
                <td colspan="2">
                    <cic:CaisisSelect runat="server" ID="PathStageSystem" ShowLabel="false" Table="PathologyStageGrade"
                        Field="PathStageSystem" LookupCode="StagingSystem" Width="100px">
                    </cic:CaisisSelect>
                </td>
                <td>
                    <asp:Label ID="Label15" runat="server" AssociatedControlID="PathGrade">
                    Grade</asp:Label>
                </td>
                <td>
                    <cic:CaisisComboBox ID="PathGrade" runat="server" Table="PathologyStageGrade" ShowLabel="false"
                        Field="PathGrade" LookupCode="PathGrade" Width="50px"></cic:CaisisComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" AssociatedControlID="PathStageT">
                    T Stage</asp:Label>
                </td>
                <td colspan="2">
                    <cic:CaisisComboBox runat="server" ID="PathStageT" Table="PathologyStageGrade" ShowLabel="false"
                        Field="PathStageT" CascadeValuesBasedOn="$PathStageDisease,$PathStageSystem"
                        CascadeFormatString="StagePath_{0}_{n.1}_T" Width="50px"></cic:CaisisComboBox>
                </td>
                <td>
                    <asp:Label ID="Label13" runat="server" AssociatedControlID="PathStageN">
                    N Stage</asp:Label>
                </td>
                <td colspan="2">
                    <cic:CaisisComboBox ID="PathStageN" runat="server" Table="PathologyStageGrade" ShowLabel="false"
                        Field="PathStageN" CascadeValuesBasedOn="$PathStageDisease,$PathStageSystem"
                        CascadeFormatString="StagePath_{0}_{n.1}_N" Width="50px"></cic:CaisisComboBox>
                </td>
                <td>
                    <asp:Label ID="Label14" runat="server" AssociatedControlID="PathStageM">
                    M Stage</asp:Label>
                </td>
                <td>
                    <cic:CaisisComboBox ID="PathStageM" runat="server" Table="PathologyStageGrade" ShowLabel="false"
                        Field="PathStageM" CascadeValuesBasedOn="$PathStageDisease,$PathStageSystem"
                        CascadeFormatString="StagePath_{0}_{n.1}_M" Width="50px"></cic:CaisisComboBox>
                </td>
            </tr>
        </asp:PlaceHolder>
    </tbody>
</table>
