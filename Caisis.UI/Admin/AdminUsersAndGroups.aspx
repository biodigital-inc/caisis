<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminUsersAndGroups.aspx.cs" Inherits="Caisis.UI.Admin.AdminUsersAndGroups" %>
<%@ Register TagPrefix="admin" TagName="Header" Src="~/Admin/AdminHeader.ascx" %>
<%@ Register TagPrefix="val" TagName="Modal" Src="~/Core/Header/Modal.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Users &amp; Groups</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery.tablesorter.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();
        
        jQuery(document).ready(function(e) {
            var sortableTables = jQuery('.sortableTable').tablesorter();
            // adjust main content height
            adjustMainContentScroll();        
            jQuery(window).resize(adjustMainContentScroll);
        });

        function adjustMainContentScroll() {
            var winHeight = jQuery(window).height() - 150;
            var mainContainer = jQuery('#userGroupFrame');
            mainContainer.css('height', Math.max(winHeight, 100) + 'px');
        }

        function loadUserGroupsPage(pageUrl) {
            $('userGroupFrameContainer').style.display = 'block';
            $('userGroupFrame').src = pageUrl;
            
            jQuery('#usersSchematic').animate({left:0},300);
            return false;
        }        
        
        function showUserGroups() {
            jQuery('#GroupsPopup').fadeIn();
        }
        function showAdminPopup(popupType, popupX, popupY, popupWidth, flip) {
//            jQuery('#adminPopup').fadeIn();

            $('adminPopup').style.display = 'block';
            jQuery('#adminPopup').offset({ top: popupY, left: popupX});
            jQuery('#adminPopup').width(popupWidth);
            
            if (flip)
            {
                $('adminPopupContentContainer').className = 'adminPopupContentContainer_Flipped';
                $('adminPopupContent').className = 'adminPopupContent_Flipped';
                $('adminPopupBottomContainer').className = 'adminPopupBottomContainer_Flipped';
            }
            else
            {
                $('adminPopupContentContainer').className = 'adminPopupContentContainer';
                $('adminPopupContent').className = 'adminPopupContent';
                $('adminPopupBottomContainer').className = 'adminPopupBottomContainer';
                
                
            }
            
            
            
            $('Users').style.display = 'none';
            $('Groups').style.display = 'none';
            $('Datasets').style.display = 'none';
            $('ModulesTabs').style.display = 'none';
            $('Roles').style.display = 'none';
            $('Permissions').style.display = 'none';
            
            $(popupType).style.display = 'block';
        }
        function closeAdminPopup()
        {
//            jQuery('#adminPopup').fadeOut();
                $('adminPopup').style.display = 'none';
        
        }
        function highlightSelectedRow(selectedTr)
        {
            var adminPopup = $('adminPopup');
            
            var popupRows = adminPopup.getElementsByTagName('tr');
	        for (var i=0;i<popupRows.length;i++)
	        {
	            if (popupRows[i].className.indexOf('adminPopupRowHighlighted') > -1) popupRows[i].className = 'adminPopupRow'; 
	        }
	        
	        selectedTr.className = 'adminPopupRowHighlighted';
	        
        }
        
        function hideUserGroups() {
//            jQuery('#GroupsPopup').fadeOut();

        }               
        
        function refreshUserGroups() {
        }
        
        function editUserGroup(groupId,selectedTr) {
            loadUserGroupsPage('Group_Edit.aspx?groupId=' + groupId);
            if (selectedTr != null) highlightSelectedRow(selectedTr);
            return false;
        }
        
        function editUser(userId) {
            loadUserGroupsPage('User_Edit.aspx?userId=' + userId);
            return false;
        }

        function editDataset(datasetId) {
            loadUserGroupsPage('Dataset_Edit.aspx?datasetId=' + datasetId);
            return false;
        }

        function editRole(roleId) {
            loadUserGroupsPage('Roles_Edit.aspx?roleId=' + roleId);
            return false;
        }
        
        
        function setActiveButton(activeButton)
        {
            $('button_Users').style.backgroundImage = 'none';
            $('button_Groups').style.backgroundImage = 'none';
            $('button_Datasets').style.backgroundImage = 'none';
            $('button_ModulesTabs').style.backgroundImage = 'none';
            $('button_Roles').style.backgroundImage = 'none';
            $('button_Permissions').style.backgroundImage = 'none';
            
            var activeButtonId = 'button_' + activeButton;
            $(activeButtonId).style.backgroundImage = 'url("../Images/AdminImages/AdminSchematic2_' + activeButton + '_on.png")';
        }
        

        
        
        
        
        
        
        /* ]]> */
    </script>
    <style type="text/css">
    
    #GroupsOverflow
    {        
    }
    #GroupsOverflow table
    {

    }
    .adminPopupOverflow
    {
        overflow: auto;
        overflow-x: none;
        margin: auto;
        width: 100%;
        max-height: 250px;
        border: 1px solid #CCCCCC;
        border-collapse: collapse;
        margin: 3px 0px 0px 0px;
        
        display: none; /*prevent these from showing for now */
    }
    .adminPopupOverflow table
    {
        margin: 0px;
        width: 100%;
    }
    .adminPopupButton
    {
        cursor: pointer;
        margin-top: 2px;
        display: none;
    }
    #adminPopup
    {
        display: none;
    }
    .adminPopup
    {
        z-index: 2000;
        position: absolute;
        top: 0px;
        left: 90px;
        cursor: default;
        width: 400px;
    }
    .adminPopupContentContainer
    {
        background-image: url(../Images/AdminImages/AdminPopup_TopRight.png);
	    background-position: right top;
	    background-repeat: no-repeat;
	    padding: 0px 21px 0px 0px;
    }
    .adminPopupContent
    {
        background-image: url(../Images/AdminImages/AdminPopup_TopLeft.png);
	    background-position: left top;
	    background-repeat: no-repeat;
	    padding: 14px 0px 0px 40px;
	    min-width: 200px;
	    min-height: 30px;
    }
    .adminPopupContentContainer_Flipped
    {
        background-image: url(../Images/AdminImages/AdminPopup_TopRight_Flipped.png);
	    background-position: right top;
	    background-repeat: no-repeat;
	    padding: 0px 39px 0px 0px;
    }
    .adminPopupContent_Flipped
    {
        background-image: url(../Images/AdminImages/AdminPopup_TopLeft_Flipped.png);
	    background-position: left top;
	    background-repeat: no-repeat;
	    padding: 14px 0px 0px 40px;
	    min-width: 200px;
	    min-height: 30px;
    }
    .adminPopupBottomContainer
    {
        background-image: url(../Images/AdminImages/AdminPopup_BottomRight.png);
	    background-position: right bottom;
	    background-repeat: no-repeat;
	    padding: 0px 21px 0px 0px;
	    font-size: 1px;
	    line-height: 1px;
    }
    .adminPopupBottomContainer_Flipped
    {
        background-image: url(../Images/AdminImages/AdminPopup_BottomRight_Flipped.png);
	    background-position: right bottom;
	    background-repeat: no-repeat;
	    padding: 0px 39px 0px 0px;
	    font-size: 1px;
	    line-height: 1px;
    }
    .adminPopupBottom
    {
        background-image: url(../Images/AdminImages/AdminPopup_BottomLeft.png);
	    background-position: left bottom;
	    background-repeat: no-repeat;
	    font-size: 1px;
	    line-height: 1px;
	    height: 21px;
	    width: 100%;
    }
    .adminPopupCloseButton
    {
        background-image: url(../Images/AdminImages/AdminPopup_Close.png);
	    background-repeat: no-repeat;
	    height: 13px;
	    width: 13px;
        cursor: pointer;
        float: right;
        margin-top: -4px;
        margin-right: -11px;
    }
    .adminPopupCloseButton:hover
    {
        background-image: url(../Images/AdminImages/AdminPopup_Close_hover.png);
    }
    .adminPopupRow
    {
    }
    .adminPopupRow td
    {
        vertical-align: top;
        
        font-family: Arial, Helvetica, sans-serif;
	    font-size: 10px;
	    line-height: 12px;
	    font-weight: normal;
    	
	    color: #1f1f1f;
	    
	    padding: 4px 2px 4px 3px;
    }
    .adminPopupRow:hover td
    {
        background-color: #EEDFE0;
    	cursor: pointer;
	    color: #000000;
	    
	    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	    background-image: -webkit-gradient(
		    linear,
		    left top,
		    left bottom,
		    color-stop(0, #D0C9D1),
		    color-stop(0.47, #DBA5B2),
		    color-stop(1, #EED2D9)
	    );
	    background-image: -moz-linear-gradient(
		    center top,
		    #D0C9D1 0%,
		    #DBA5B2 47%,
		    #EED2D9 100%
	    );
	    
    }
    .adminPopupRowHighlighted
    {
    }
    .adminPopupRowHighlighted td
    {
        vertical-align: top;
        
        font-family: Arial, Helvetica, sans-serif;
	    font-size: 10px;
	    line-height: 12px;
	    font-weight: normal;
        background-color: #8d2a2c;
	    color: #ffffff;
	    
	    padding: 4px 2px 4px 3px;
    }
    #userGroupFrame
    {
        overflow: hidden;
    }
    #userGroupFrameContainer
    {
        overflow-x: hidden;
    }
    
#button_Users
{top: 9px; left: 19px; width: 118px; height: 55px;}
#button_Groups
{top: 329px; left: 9px; width: 138px; height: 103px;}
#button_Datasets
{top: 351px; left: 291px; width: 139px; height: 83px;}
#button_ModulesTabs
{top: 471px; left: 291px; width: 139px; height: 83px;}
#button_Roles
{top: 122px; left: 291px; width: 139px; height: 83px;}
#button_Permissions
{top: 253px; left: 311px; width: 98px; height: 63px;}
    
    </style>
</head>
<body>
    <val:Modal ID="Modal1" runat="server" />
    <form id="form1" runat="server">
        <val:Modal ID="AdminModal" runat="server" />
        <admin:Header ID="AdminHeader" runat="server" />
        <div id="adminPageContentContainer">
            <div id="userGroupFrameContainer" style="display: none; padding: 5px;">
                <iframe id="userGroupFrame" name="userGroupFrame" frameborder="0"></iframe>
            </div>
            <div id="usersSchematic">
                <div><strong style="display: block; font-size: 12px; margin-bottom: 2px;">The Caisis User Security Model</strong>Caisis provides a robust, but flexible model to meet varied and evolving demands. A three tiered approach is used that first limits access to sets of patients(Datasets), then functionality under tabs(Modules), and finally rights(Permissions) to perform tasks within Modules. <strong style="display: block; color: #8d2a2c; margin-top: 10px;">Click a box to view/edit.</strong></div>
                <a id="button_Users" href="User_List.aspx" target="userGroupFrame" <%--onmouseover="showAdminPopup('Users',140,66,280,false);" onmouseout="closeAdminPopup();"--%>  onclick="return loadUserGroupsPage(this.href);" ></a>
                <a id="button_Groups" href="Group_List.aspx" target="userGroupFrame" <%--onmouseover="showAdminPopup('Users',160,310,280,false);" onmouseout="closeAdminPopup();"--%> onclick="return loadUserGroupsPage(this.href);" ></a>
                <a id="button_Datasets" href="Dataset_List.aspx" onclick="return loadUserGroupsPage(this.href);"  ></a>
                <a id="button_ModulesTabs" href="ModuleTab_List.aspx"  onclick="setActiveButton('ModulesTabs'); return loadUserGroupsPage(this.href);" ></a>
                <a id="button_Roles"  href="Role_List.aspx" onclick="return loadUserGroupsPage(this.href);"   ></a>
                <a id="button_Permissions" href="Permission_List.aspx"  onclick="return loadUserGroupsPage(this.href);" ></a>
            </div>
            
            <div id="adminPopup" class="adminPopup">
                <div id="adminPopupContentContainer" class="adminPopupContentContainer"><div id="adminPopupContent" class="adminPopupContent"><img class="adminPopupCloseButton" src="../Images/shim.gif" onclick="closeAdminPopup();" />
                    
                    <div id="Groups">
                        <span class="adminNavBoxContainerTitle" style="margin: 3px auto 3px auto;">
                            <asp:Label runat="server" ID="GroupsCount"></asp:Label> Groups in Caisis </span>&nbsp;&nbsp;(click to view)
                        <div id="GroupsOverflow" class="adminPopupOverflow">
                            <table cellspacing="0">
                                <asp:Repeater runat="server" ID="GroupsRptr">
                                    <ItemTemplate>
                                        <tr class="adminPopupRow" title="<%# Eval("GroupDescription") %>" onclick="return editUserGroup('<%# Eval("GroupId") %>',this);">
                                            <td>
                                                <%# Eval("GroupName") %>
                                            </td>
                                            <td>
                                                <%# Eval("Role") %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <img src="../Images/AdminImages/AdminButton_AddNewGroup.png" class="adminPopupButton" onclick="return editUserGroup('',null);" />
                    </div>
                    <div id="Datasets">
                        <span class="adminNavBoxContainerTitle" style="margin: 3px auto 3px auto;">
                            <asp:Label runat="server" ID="DatasetsCount"></asp:Label> Datasets in Caisis </span>(click to edit) 
                        <div id="DatasetsOverflow" class="adminPopupOverflow">
                            <table cellspacing="0">
                                <asp:Repeater runat="server" ID="DatasetsRptr">
                                    <ItemTemplate>
                                        <tr class="adminPopupRow" onclick="return editDataset('<%# Eval("DatasetId") %>',this);">
                                            <td>
                                                <%# Eval("DatasetName")%>
                                            </td>
                                            <td>
                                                <%# Eval("DatasetActive")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <img src="../Images/AdminImages/AdminButton_AddNewDataset.png" class="adminPopupButton" onclick="return editUserGroup('',null);" />
                    </div>
                    <div id="Users">
                        <span class="adminNavBoxContainerTitle" style="margin: 3px auto 3px auto;">
                            <asp:Label runat="server" ID="UsersCount"></asp:Label> Users in Caisis </span>&nbsp;&nbsp;(click to view)
                        <div id="UsersOverflow" class="adminPopupOverflow">
                            <table class="sortableTable" cellspacing="0" >
                                <thead>
                                    <tr>
                                        <th style="text-align: left;">
                                            Name
                                        </th>
                                        <th style="text-align: left;">
                                            Username
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="UsersRptr">
                                        <ItemTemplate>
                                            <tr class="adminPopupRow" onclick="return editUser('<%# Eval("UserId") %>',this);" title="<%# Eval("UserEmail") %>">
                                                <td>
                                                    <%# Eval("UserLastName")%>,
                                                    <%# Eval("UserFirstName")%>
                                                </td>
                                                <td>
                                                    <%# Eval("Username") %>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <img src="../Images/AdminImages/AdminButton_AddNewUser.png" class="adminPopupButton" onclick="return editUserGroup('',null);" />
                    </div>
                    <div id="ModulesTabs">
                        <span class="adminNavBoxContainerTitle" style="margin: 3px auto 3px auto;">
                           <asp:Label runat="server" ID="ModulesCount"></asp:Label> Modules in Caisis </span>
                        <div id="ModulesTabsOverflow" class="adminPopupOverflow">
                            <table cellspacing="0">
                                <asp:Repeater runat="server" ID="ModulesRptr">
                                    <ItemTemplate>
                                        <tr class="adminPopupRow">
                                            <td>
                                                <%# Container.DataItem %>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
<%--                        <img src="../Images/AdminImages/AdminButton_AddNewGroup.png"  class="adminPopupButton" onclick="return editUserGroup('',null);" />
--%>                    </div>
                    <div id="Roles">
                        <span class="adminNavBoxContainerTitle" style="margin: 3px auto 3px auto;">
                            <asp:Label runat="server" ID="RolesCount"></asp:Label>
                            Roles in Caisis </span>(click to edit)
                        <div id="RolesOverflow" class="adminPopupOverflow">
                            <table cellspacing="0">
                             <asp:Repeater runat="server" ID="RolesRptr">
                                 <ItemTemplate>
                                     <tr class="adminPopupRow" title="<%# Eval("RoleDescription") %>" onclick="return editRole('<%# Eval("RoleId") %>',this);">
                                         <td>
                                             <%# Eval("Role")%>
                                         </td>
                                         <td>
                                             &nbsp;
                                         </td>
                                     </tr>
                                 </ItemTemplate>
                             </asp:Repeater>
                            </table>
                        </div>
                        <img src="../Images/AdminImages/AdminButton_AddNewRole.png"  class="adminPopupButton" onclick="return editUserGroup('',null);" />
                    </div>
                    <div id="Permissions">
                        <span class="adminNavBoxContainerTitle" style="margin: 3px auto 3px auto;">
                            <asp:Label runat="server" ID="PermissionsCount"></asp:Label>
                            Permissions in Caisis </span>(click to edit)
                        <div id="PermissionsOverflow" class="adminPopupOverflow">
                            <table cellspacing="0">
                                <asp:Repeater runat="server" ID="PermissionsRptr">
                                    <ItemTemplate>
                                        <tr class="adminPopupRow">
                                            <td>
                                                <%# Eval("Permission")%>
                                            </td>
                                            <td>
                                                <%# Eval("PermissionDescription")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
<%--                        <img src="../Images/AdminImages/AdminButton_AddNewGroup.png"  class="adminPopupButton" onclick="return editUserGroup('',null);" />
--%>                    </div>
                    
                
                </div></div>
                <div id="adminPopupBottomContainer" class="adminPopupBottomContainer"><div class="adminPopupBottom"><img src="../Images/shim.gif" style="width: 100px; height: 1px;" /></div></div>
            </div>
            
        </div>
        
    </form>
</body>
</html>
