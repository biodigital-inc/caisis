<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Role_List.aspx.cs" Inherits="Caisis.UI.Admin.Role_List" %>
<%@ Register TagPrefix="filter" TagName="SearchFilter" Src="~/Admin/ListFilter_Control.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Roles</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        
        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            // adjust main content height
            adjustMainContentScroll();        
            jQuery(window).resize(adjustMainContentScroll);
        });

        function adjustMainContentScroll() {
            var winHeight = jQuery(window).height() - 90;
            var mainContainer = jQuery('#adminBoxNavListContainer');
            mainContainer.css('max-height', Math.max(winHeight, 100) + 'px');
        }




        function editRole(roleId) {
            slideOutNavigation('Role_Edit.aspx?roleId=' + roleId, 'left');
            return false;
        }

        /* ]]> */
    </script>

</head>
<body onload="top.setActiveButton('Roles');">
    <form id="form1" runat="server">
    

<div id="AdminUserGroupPopupContainer" style="width: 500px;">
    <span class="adminNavHeading">Roles</span>
    <asp:Label runat="server" ID="RolesCount" CssClass="adminNavHelpText" style="margin-left: 20px;"></asp:Label>
    <span class="adminNavHelpText">Roles in Caisis (click to edit)</span>
    <div id="mainAdminBox" class="adminBox" style="border-color: #e1e1e1;-webkit-box-shadow: 0px 0px 10px #ddd; box-shadow: 0px 0px 10px #ddd;">
    <filter:SearchFilter ID="RoleSearch" runat="server" ListId="RoleList" />
    <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden; ">
                <ul id="RoleList" class="adminBoxNavList">                    
                    <asp:Repeater runat="server" ID="RolesRptr">
                    <ItemTemplate>
                            <li onclick="this.className='selected'; return editRole('<%# Eval("RoleId") %>');" title="Last Updated: <%# Eval("UpdatedTime") %>" <%# Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "" %>>
                                <table cellspacing="0" style="width: 95%; table-layout: fixed;"><tr>
                                <td style="width: 30%; vertical-align: top; font-weight: bold;"><%# Eval("Role") %></td>
                                <td><%# Eval("RoleDescription")%></td>
                                </tr>
                                </table>

                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <span runat="server" id="NoTablesMessage" visible="false">No data entry forms have been customized for this disease view.<br /><br />Click <strong>Manage Tables</strong> below to select forms you would like to customize for this disease.</span>
            </div>
</div>
<span class="dataEntryButtonGray NavListFooterButton" onclick="return editRole('');">Add New Role</span>
</div>    

    </form>
</body>
</html>
