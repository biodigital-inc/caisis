<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserPatientViewWidget.ascx.cs"
    Inherits="Caisis.UI.Core.Utilities.Widget.UserPatientViewWidget" %>
<table style="width: 100%;">
    <thead>
        <tr>
            <th style="width: 33%;">
                Name
            </th>
            <th style="width: 33%;">
                MRN
            </th>
            <th style="width: 34%;">
                Last Viewed
            </th>
        </tr>
    </thead>
</table>
<div class="DashboardScrollingList">
	<table class="DashboardScrollingListTable" cellspacing="0">
	    <tbody>
	        <asp:Repeater ID="UserPatientViewRpt" runat="server"  OnItemDataBound="SetRptIdentifiers">
	            <ItemTemplate>
	                <tr class="DashboardScrollingListRowType<%# Container.ItemIndex % 2==0 ? "A" : "B" %>" onclick="top.location = '<%= Page.ResolveUrl("~/Core/DataEntryForms/Index.aspx?epid=") %><asp:Literal ID="encPID" runat="server" />';">
	                    <td style="width: 33%;"><asp:Label runat="server" ID="PatientName" ></asp:Label></td>
	                    <td style="width: 33%;"><asp:Label runat="server" ID="PatientIdentifier"></asp:Label></td>
	                    <td style="width: 34%;"><%# FormatDisplayDate(Eval("ViewTime")) %></td>
	                </tr>
	            </ItemTemplate>
	        </asp:Repeater>
	    </tbody>
    </table>
</div>
<a href="<%= Page.ResolveUrl("~/Core/PatientLists/PatientListPage.aspx") %>" target="_top" title="Find More Patients"><img alt="Find More Patients" title="Find More Patients" src="<%= Page.ResolveUrl("~/Images/DashboardButton_FindMorePatients.png") %>" class="DashboardButton" /></a>