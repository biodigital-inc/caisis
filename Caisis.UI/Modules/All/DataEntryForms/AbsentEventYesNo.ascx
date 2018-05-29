<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.DataEntryForms.AbsentEventYesNo"
    CodeFile="AbsentEventYesNo.ascx.cs" %>
<div class="DataSelectionPanel">
    <asp:Label runat="server" ID="AbsentText"></asp:Label>
    <asp:RadioButton runat="server" ID="YesCheck" Text="Yes" GroupName="YesNoCheckGroup" />
    <asp:RadioButton runat="server" ID="NoCheck" Text="No" GroupName="YesNoCheckGroup" />
    <asp:HiddenField runat="server" ID="AbsentEventId" />
</div>
