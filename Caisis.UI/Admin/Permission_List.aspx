<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Permission_List.aspx.cs" Inherits="Caisis.UI.Admin.Permission_List" %>

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
        
        jQuery(document).ready(function(e) {
            // adjust main content height
            adjustMainContentScroll();        
            jQuery(window).resize(adjustMainContentScroll);
        });

        function adjustMainContentScroll() {
            var winHeight = jQuery(window).height() - 75;
            var mainContainer = jQuery('#adminBoxNavListContainer');
            mainContainer.css('max-height', Math.max(winHeight, 100) + 'px');
        }
        
        function showGroupsWithAccess(ModuleId) {
            
            
            return false;
        }
        
        function loadRoleList() {
            slideOutNavigation('Role_List.aspx', 'left');
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
	cursor: default;
	background-image: none;

}

ul.adminBoxNavList li.alternate:hover
{
	border: solid 1px #eeeeee;
	background-color: #eeeeee;

	color: #1f1f1f;
	cursor: default;
	background-image: none;
}
</style>

</head>
<body onload="top.setActiveButton('Permissions');">
    <form id="form1" runat="server">
<div id="AdminUserGroupPopupContainer" style="width: 600px;">
    <span class="adminNavHeading">Permissions</span>
     <asp:Label runat="server" ID="PermissionsCount" CssClass="adminNavHelpText" style="margin-left: 20px;"></asp:Label>
    <span class="adminNavHelpText">Permissions in Caisis</span>
    <div id="mainAdminBox" class="adminBox" style="width: 100%; border-color: #e1e1e1;-webkit-box-shadow: 0px 0px 10px #ddd; box-shadow: 0px 0px 10px #ddd;">
    <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden; ">
                <ul id="TableList" class="adminBoxNavList">                    
                    <asp:Repeater runat="server" ID="PermissionsRptr">
                    <ItemTemplate>
                            <li  onclick="return showGroupsWithAccess('');" <%# Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "" %>>
                                <table cellspacing="0" style="width: 95%; table-layout: fixed;"><tr>
                                <td style="width: 30%; vertical-align: top; font-weight: bold;"><%# Eval("Permission")%></td>
                                <td><%# Eval("PermissionDescription")%></td>
                                </tr>
                                </table>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
</div>
&nbsp;&nbsp;To set Permissions, select a role from the Role list.&nbsp;&nbsp;&nbsp;&nbsp;<span class="dataEntryButtonGray NavListFooterButton" onclick="return loadRoleList();">Go to role list ></span>
</div>
    </form>
</body>
</html>
