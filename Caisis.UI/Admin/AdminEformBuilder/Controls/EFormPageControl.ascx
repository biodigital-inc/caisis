<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EFormPageControl.ascx.cs"
    Inherits="Caisis.UI.Admin.EFormPageControl" %>
<%@ Register TagPrefix="eform" TagName="section" Src="~/Admin/AdminEformBuilder/Controls/EFormSectionControl.ascx" %>
<div class="EformPageContainer">
    <asp:Label runat="server" AssociatedControlID="PageTitle">Page Title:</asp:Label>
    <asp:TextBox runat="server" ID="PageTitle"></asp:TextBox>
    <asp:Repeater runat="server" ID="SectionsRptr" OnItemDataBound="OnSectionBound">
        <ItemTemplate>
            <eform:section runat="server" ID="section" />
        </ItemTemplate>
    </asp:Repeater>
</div>
