<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact_List.aspx.cs"
    Inherits="Caisis.UI.Admin.Contact_List" %>
<%@ Register TagPrefix="filter" TagName="SearchFilter" Src="~/Admin/ListFilter_Control.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paper Forms Eforms</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            // adjust overflow and on resize
                adjustOverflow();
                jQuery(window).resize(adjustOverflow);
        });
        
        // adjuts the height of the main list
        function adjustOverflow() {
            jQuery('.adminBoxNavListContainer').css('maxHeight', jQuery(window).height() - 90 + 'px');
        }

        function loadContact(contactId, e) {
            $('ContactFrameContainer').style.display = 'block';
            $('ContactFrame').src = 'Contact_Edit.aspx?contactId=' + contactId;

            stopBubble(e);
            return false;
        }

        function loadUserGroupsPage(pageUrl) {
            $('userGroupFrameContainer').style.display = 'block';
            $('userGroupFrame').src = pageUrl;
            
            jQuery('#usersSchematic').animate({left:0},300);
            return false;
        }

        function editContact(contactId) {
            top.showModalWithConfig('<%= Page.ResolveUrl("Contact_Edit.aspx") %>?edit=true&contactId=' + contactId + '&organizationId=', 'Edit Contact', { width: 650, height: 400, context: window });
            return false;
        }

        var self = window;
        if (parent.onRecordSave == null) {
            parent.onRecordSave = function(contactId) {
                self.frames['ContactFrame'].location = '<%= Page.ResolveUrl("Contact_Edit.aspx") %>?contactId=' + contactId;
            };
        }

        /* ]]> */
    </script>

    <style type="text/css">
        #SurveyQuestionFields
        {
            max-height: 450px;
            overflow: auto;
        }
        .surveyListItemTable
        {
            table-layout: fixed;
            width: 95%;
        }
        .surveyListItemTable th
        {
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 12px;
            color: #000000;
            font-weight: bold;
            padding: 0px 0px 1px 2px;
            white-space: nowrap;
        }
        #ContactFrameContainer
        {
	        display: none;
	        margin-left: 450px;
	        margin-top: 0px;
	        z-index: 20;
	        overflow-x: hidden;
        }
        #ContactFrame
        {
	        height: 500px;
	        width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="SelectFormBox" class="adminNavBoxContainer" style="width: 400px;">
        <table class="surveyListItemTable" cellspacing="0">
            <thead>
                <tr>
                    <th style="width: 50%;">
                        Contact Name
                    </th>
                    <th style="width: 50%;">
                        Organization
                    </th>

                </tr>
            </thead>
        </table>
        <div id="mainAdminBox" class="adminBox">
            <filter:SearchFilter ID="ContactsSearch" runat="server" ListId="ContactsList" />
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden; word-wrap: break-word;">
                <ul id="ContactsList" class="adminBoxNavList">
                    <asp:Repeater runat="server" ID="ContactsRptr">
                        <ItemTemplate>
                            <li id="" title="" class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "") %>"  onclick="return loadContact('<%# Eval("ContactId")%>',event);" >
                                <table cellspacing="0" class="surveyListItemTable">
                                    <tr class="">
                                        <td style="width: 50%;">
                                            <%# Eval("Name")%>
                                        </td>
                                        <td style="width: 50%;">
                                            <%# Eval("Organization")%>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                                <li id="NoResultsMsg" runat="server" style="text-align: center;">
                                    No Contacts have been assigned.
                                </li>
                </ul>
            </div>
        </div>
        <span onclick="return editContact(-1);" class="dataEntryButtonGray" style=" margin-top: 2px;">Add Contact</span>

    </div>
    
    
    <div id="ContactFrameContainer" style="display: none; padding: 5px;">
        <iframe id="ContactFrame" name="ContactFrame" frameborder="0"></iframe>
    </div>

    
    </form>
</body>
</html>
