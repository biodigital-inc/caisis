<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Group_List.aspx.cs" Inherits="Caisis.UI.Admin.Group_List" %>
<%@ Register TagPrefix="filter" TagName="SearchFilter" Src="~/Admin/ListFilter_Control.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Groups</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
   <script type="text/javascript" src="../ClientScripts/Admin.js"></script>
    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>

 

    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        jQuery(document).ready(loadUserGroup);

jQuery(document).ready(function(e) {
            // adjust main content height
            adjustMainContentScroll();        
            jQuery(window).resize(adjustMainContentScroll);
        });

        function adjustMainContentScroll() {
            var winHeight = jQuery(window).height() - 125;
            var mainContainer = jQuery('#adminBoxNavListContainer');
            mainContainer.css('max-height', Math.max(winHeight, 100) + 'px');
        }
        
        function editUserGroup(groupId) {
            slideOutNavigation('Group_Edit.aspx?groupId=' + groupId, 'left');
            return false;
        }

        function loadUserGroup() {
            var $lefty = jQuery('#GroupsOverflow');
            $lefty.animate({
                right: parseInt($lefty.css('right'), 10) == 0 ? -$lefty.outerWidth() : 0
            });

        }


        /* ]]> */
    </script>

    <style type="text/css">
        .adminPopupOverflow
        {
            overflow: auto;
            overflow-x: none;
            margin: auto;
            width: 100%;
            max-height: 100%;
            border: 1px solid #CCCCCC;
            border-collapse: collapse;
            margin: 3px 0px 0px 0px;
        }
        .adminPopupOverflow table
        {
            margin: 0px;
            width: 100%;
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
    </style>
</head>
<body onload="top.setActiveButton('Groups');">
    <form id="form1" runat="server">
<div id="AdminUserGroupPopupContainer" style="width: 500px;">
    <span class="adminNavHeading">Groups</span>
    <asp:Label runat="server" ID="GroupsCount" CssClass="adminNavHelpText" style="margin-left: 20px;"></asp:Label>
    <span class="adminNavHelpText">Groups in Caisis (click to edit)</span>
    <div id="mainAdminBox" class="adminBox" style="border-color: #e1e1e1;-webkit-box-shadow: 0px 0px 10px #ddd; box-shadow: 0px 0px 10px #ddd;">
    <filter:SearchFilter ID="GroupSearch" runat="server" ListId="GroupsList" />
    <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden; ">
                <ul id="GroupsList" class="adminBoxNavList">                    
                    <asp:Repeater runat="server" ID="GroupsRptr">
                    <ItemTemplate>
                            <li onclick="this.className='selected'; return editUserGroup('<%# Eval("GroupId") %>',this);" title="<%# Eval("GroupDescription") %>"  <%# Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "" %>>
                                <span style="width: 220px; margin-right: 20px; float: left;">
                                    <%# Eval("GroupName") %>
                                </span>
                                <span style="">
                                    <%# Eval("Role") %>
                                </span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
<%--                <span runat="server" id="NoTablesMessage" visible="false">No data entry forms have been customized for this disease view.<br /><br />Click <strong>Manage Tables</strong> below to select forms you would like to customize for this disease.</span>
--%>            </div>
</div>
<span class="dataEntryButtonGray NavListFooterButton" onclick="return editUserGroup('');">Add New Group</span>

</div>
</form>
</body>
</html>
