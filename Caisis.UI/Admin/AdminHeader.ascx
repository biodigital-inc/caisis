<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminHeader.ascx.cs" Inherits="Caisis.UI.Admin.AdminHeader" %>
<div id="headerOuterContainer">
    <a id="headerIndexIcon" href="Index.aspx"></a>
    <div id="headerInnerContainer">        
        <div id="headerButtons">
            <a title="Back To Caisis" href="../Core/Utilities/Dashboard.aspx">
                <img alt="Back To Caisis" id="HeaderButton_BackToCaisis" src="../Images/AdminImages/AdminHeaderButton_BackToCaisis.png" /></a>
            <a title="Logout" href="../Logout.aspx">
                <img alt="Logout" id="HeaderButton_LogOut" src="../Images/AdminImages/AdminHeaderButton_LogOut.png" /></a></div>
        <div id="headerLinks">
            <a id="UsersGroupsLink" <% = Request.Url.ToString().IndexOf("AdminUsersAndGroups") > -1 ? "class=\"active\"" : "" %> href="AdminUsersAndGroups.aspx">Users &amp; Groups</a>
            <a id="SystemConfigLink" style="margin: 0px 140px 0px 140px;" <% = Request.Url.ToString().IndexOf("AdminSystemConfig") > -1 ? "class=\"active\"" : "" %> href="AdminSystemConfig.aspx">System Config</a>
            <a id="AdminReportsLink" <% = Request.Url.ToString().IndexOf("AdminReports") > -1 ? "class=\"active\"" : "" %> href="AdminReports.aspx">Tools &amp; Reports</a></div>
    </div>
</div>
