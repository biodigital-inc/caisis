<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EformSection.ascx.cs" Inherits="Caisis.UI.Core.DynamicEforms.EformSection" %>


<div id="SectionContainer" class="normalSection" runat="server" >
    
    <a id="SectionNameAnchor" runat="server"><asp:Label ID="SectionNameLabel" CssClass="SubFormSectionTitle" runat="server" Visible="false" /></a><a id="<% =SectionNameAnchor.Name %>Section" > </a>
	<div id="CellContainer" class="ListContainer" runat="server">

	</div>
</div>