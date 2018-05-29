<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EFormControl.ascx.cs"
    Inherits="Caisis.UI.Admin.EFormControl" %>
<%@ Register TagPrefix="eform" TagName="page" Src="~/Admin/AdminEformBuilder/Controls/EFormPageControl.ascx" %>
<ol class="EFormPageList">
    <asp:Repeater runat="server" ID="PagesRptr">
        <ItemTemplate>
            <li>
            <eform:page runat="server" ID="page" /></li>
        </ItemTemplate>
    </asp:Repeater>
</ol>
