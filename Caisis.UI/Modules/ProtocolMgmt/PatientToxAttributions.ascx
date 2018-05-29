<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PatientToxAttributions.ascx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientToxAttributions" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<asp:Label runat="server" ID="AttributionsMessage" CssClass="errorText" Text="There are no therapies specified for this trial."></asp:Label>
<asp:GridView runat="server" ID="ToxAttributionGrid"  
    DataKeyNames="ToxicityId,ToxAttributionId" AutoGenerateColumns="false" BlankRows="0"
    CssClass="DataRecords" GridLines="None" VisibleBlankRows="0" OnRowDataBound="SetAttributionFields"
    OnRowDeleted="DeleteToxAttribution" Style="margin-left: 0px;" Width="300px" ShowHeader="false">
    <Columns>
        <asp:TemplateField HeaderText="Name" HeaderStyle-Width="40%">
            <ItemTemplate>
                <cic:CaisisHidden runat="server" ID="ToxAttributionField" ShowLabel="false" Table="ToxAttribution"
                    Field="ToxAttribution" Visible="false" >
                </cic:CaisisHidden>
                <asp:Label runat="server" ID="ToxAttributionLabel" CssClass="boldText"></asp:Label>
                <table>
                    <tr>
                        <td style="width: 175px;">Relationship to Study Treatment
                        </td>
                        <td>
                            <cic:CaisisSelect runat="server" ID="ToxProbabilityField" ShowLabel="false" Table="ToxAttribution"
                                Field="ToxAttributionProbability" LookupCode="ToxProbability" Width="100px">
                            </cic:CaisisSelect>
                        </td>
                    </tr>

                    <tr>
                        <td>Action Taken
                        </td>
                        <td>
                            <cic:CaisisSelect runat="server" ID="ToxActionField" ShowLabel="false" Table="ToxAttribution"
                                Field="ToxAttributionAction" Width="100px" LookupCode="ToxIntervention">
                            </cic:CaisisSelect>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
