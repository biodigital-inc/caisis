<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserEformsWidget.ascx.cs"
    Inherits="Caisis.UI.Core.Utilities.Widget.UserEformsWidget" %>
<table style="width: 100%;">
    <thead>
        <tr>
            <th style="width: 25%;">
                Name
            </th>
            <th style="width: 15%;">
                MRN
            </th>
            <th style="width: 20%;">
                EForm
            </th>
            <th style="width: 17%;">
                Updated
            </th>
            <th style="width: 23%;">
                Status
            </th>
        </tr>
    </thead>
</table>
<div class="DashboardScrollingList">
    <table class="DashboardScrollingListTable" cellspacing="0">
        <tbody>
            <asp:Repeater ID="UserEformsRpt" runat="server"  OnItemDataBound="SetRptIdentifiers">
                <ItemTemplate>
        	        <tr class="DashboardScrollingListRowType<%# Container.ItemIndex % 2==0 ? "A" : "B" %>" onclick="window.top.location = '<asp:Literal ID="encPID" runat="server" />'; return false;">
        	            <td style="width: 25%;"><asp:Label runat="server" ID="PatientName" ></asp:Label></td>
        	            <td style="width: 15%;"><asp:Label runat="server" ID="PatientIdentifier"></asp:Label></td>
        	            <td style="width: 20%;"><%# Eval("EformName") %></td>
        	            <td style="width: 17%;"><%# FormatDisplayDate(Eval("UpdatedTime")) %></td>
        	            <td style="width: 23%;">
        	                <asp:Image ID="StatusImg" runat="server" ImageUrl="~/Images/EFormStatus_NotStarted.gif" style="width: 78px; height: 19px; border: none; background-repeat: no-repeat;" />
        	                <asp:Literal ID="EFormStatus" runat="server" />
        	            </td>
        	        </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr id="NoEformsMessage" runat="server"  >
                <td style="background-color: #efefef; padding: 5px; text-align: center; font-size: 13px; ">
                    You have not viewed any EForms recently.
                </td>
            </tr>
        </tbody>
    </table>
</div>
<a href="<%= Page.ResolveUrl("~/Core/Eforms/Index.aspx?EFormListType=physician") %>" target="_top" title="View Entire EForm History"><img alt="View Entire EForm History" title="View Entire EForm History" src="<%= Page.ResolveUrl("~/Images/DashboardButton_ViewEntireEFormHistory.png") %>" class="DashboardButton" /></a>