<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModuleTab_List.aspx.cs" Inherits="Caisis.UI.Admin.ModuleTab_List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Datasets</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        function showGroupsWithAccess(moduleName) {
            slideOutNavigation('ModuleTab_List.aspx?moduleName=' + escape(moduleName));
            return false;
        }
        
        function editGroup(groupId) {
             slideOutNavigation('Group_Edit.aspx?groupId=' + groupId);
            return false;
        }
        

        function loadGroupList() {
            slideOutNavigation('Group_List.aspx', 'left');
            return false;
        }
        
        /* ]]> */
    </script>

    <style type="text/css">
        ul.adminBoxNavList li:hover
        {
            background-color: #ffffff;
            border: solid 1px #ffffff;
            color: #1f1f1f;
            cursor: pointer;
            background-image: none;
        }
        ul.adminBoxNavList li.alternate:hover
        {
            border: solid 1px #eeeeee;
            background-color: #eeeeee;
            color: #1f1f1f;
            cursor: pointer;
            background-image: none;
        }
    </style>
</head>
<body onload="top.setActiveButton('ModulesTabs');">
    <form id="form1" runat="server">
    <div id="AdminUserGroupPopupContainer" style="width: 400px;">
        <asp:Label  runat="server" ID="ListMainLabel" CssClass="adminNavHeading">Modules / Tabs</asp:Label>
        <asp:Label runat="server" ID="ListCountLabel" CssClass="adminNavHelpText" Style="margin-left: 20px;"></asp:Label>
        <asp:Label runat="server" ID="ListLabel"  CssClass="adminNavHelpText">Modules in Caisis</asp:Label>
        <div id="mainAdminBox" class="adminBox" style="width: 100%; border-color: #e1e1e1;
            -webkit-box-shadow: 0px 0px 10px #ddd; box-shadow: 0px 0px 10px #ddd;">
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;">
                <ul id="TableList" class="adminBoxNavList">
                    <%-- List Of Modules --%>
                    <asp:Repeater runat="server" ID="ModulesRptr">
                        <ItemTemplate>
                            <li onclick="return showGroupsWithAccess('<%# Caisis.UI.Core.Classes.PageUtil.EscapeSingleQuotes(Container.DataItem.ToString()) %>');"
                                <%# Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "" %>>
                                <%# Container.DataItem %>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <%-- List Of Groups in a Module --%>
                    <asp:Repeater runat="server" ID="ModuleGroupsRptr" Visible="false">
                        <ItemTemplate>
                            <li onclick="editGroup('<%# Eval("GroupId") %>');" <%# Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "" %>>
                                <%# Eval("GroupName")%>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
