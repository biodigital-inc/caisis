<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ModuleSplash.ascx.cs"
    Inherits="Caisis.UI.Core.Utilities.ModuleSplash" %>
<div class="splashBG">
    <div class="splashTitle">
        What would you like to do?</div>
    <div class="splashLinkContainer">
        <p runat="server" id="NoTabMessage" style="font-size: 13px;">
            You do not have access to any sections in the <span class="boldText">
                <%= ModuleName %></span> module, please contact your Administrator.
        </p>
        <asp:Repeater runat="server" ID="SplashIconsRptr" OnItemDataBound="ModuleItemBuilt">
            <ItemTemplate>
                <a href="<%# XPath("@location").ToString() != "" ? Page.ResolveUrl(XPath("@location").ToString()) : "#" %>" target="<%# XPath("@target") %>">
                    <img onclick="<%# XPath("@onclick") %>" alt="<%# Server.HtmlEncode(XPath("@title").ToString()) %>"
                        title="<%# Server.HtmlEncode(XPath("@title").ToString()) %>" src="<%# Page.ResolveUrl(XPath("@splashIcon").ToString()) %>" /></a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
