<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DiseaseState.ascx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.DiseaseState" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<asp:Repeater runat="server" ID="DiseaseStateRptr" OnItemDataBound="OnDiseaseStateRptrBound">
    <ItemTemplate>
        <div>
            <cc:CaisisCheckBox Field="PopulationDiseaseState" runat="server" ID="DiseaseStateCheckBox" ShowLabel="false">
            </cc:CaisisCheckBox>
        </div>
    </ItemTemplate>
</asp:Repeater>
