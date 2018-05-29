<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EformPageTitleListItem.ascx.cs" Inherits="Caisis.UI.Core.DynamicEforms.EformPageTitleListItem" %>

	

<div id="SectionNameContainer" runat="server" style="margin-left: 0px;margin-bottom: 6px;">
	<asp:Label ID="PageTitle" CssClass="EFormPageTitle" runat="server" style="margin-right: 40px;"/>
	<asp:Repeater ID="SectionNameLabels" runat="server">
		<ItemTemplate>
			
				<a class="eformNavLink" onclick="goToSection('<%# Container.DataItem.ToString().Replace("'", "\\'") %>');"><asp:Label id="SectionNameLabel" Text="<%# Container.DataItem %>" runat="server"/></a>
			    
		</ItemTemplate>
	</asp:Repeater>
</div>