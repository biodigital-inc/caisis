<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Organization_Contacts.aspx.cs"
    Inherits="Caisis.UI.Admin.Organization_Contacts" %>

<%@ Register TagPrefix="filter" TagName="SearchFilter" Src="~/Admin/ListFilter_Control.ascx" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.tablesorter.min.js"></script>

    <script type="text/javascript">

        var ORGANIZATION_ID = '<%= Request.QueryString["organizationId"] %>';

        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            jQuery("#AssociateContactsTable").tablesorter();
            var items = jQuery("#AssociateContactList > li");
            items.click(function() {
                var li = jQuery(this);
                var checked = li.find('input:checked').size() > 0;
                if (checked && !li.hasClass('selected'))
                    li.addClass('selected');
                else if (!checked)
                    li.removeClass('selceted');
            });
        });

        function addContact() {
            return editContact('');
        }

        function editContact(contactId) {
            top.showModalWithConfig('Contact_Edit.aspx?edit=true&contactId=' + contactId + '&organizationId=' + ORGANIZATION_ID, 'Edit Contact', { width: 650, height: 400, context: window });
            return false;
        }

        function associateContact() {
            var title = getOrganizationName() + ' Contacts';
            top.showModalWithConfig('Organization_Contacts.aspx?method=associate_contact&organizationId=' + ORGANIZATION_ID, title, { width: 400, height: 500, context: window });
        }
        
        function getOrganizationName() {
            return jQuery.trim(jQuery('#OrganizationName').text());
        }

        function reloadForm() {
            window.location = window.location;
        }

        function reloadMainPage() {
            var mainFrame = top.getModalCallingWindow();
            if (mainFrame) {
                mainFrame.location = mainFrame.location;
                top.hideModal();
            }
        }
    
    </script>

    <style type="text/css">
        h1
        {
            font-size: 13px;
        }
        .block
        {
            display: block;
            width: 100%;
        }
        #ProtocolProjects
        {
            width: 100%;
        }
        #OrganizationPanel a
        {
            display: block;
        }
        .itemTable
        {
            table-layout: fixed;
            width: 100%;
        }
        #AssociateContactsTable
        {
            table-layout: fixed;
            width: 400px;
            text-align: left;
        }
        .adminBoxNavList > li > a
        {
            display: block;
        }
        .buttons
        {
            text-align: center;
            margin: 20px;
        }
        .buttons span
        {
            min-width: 80px;
        }
        .scrollTabContent
        {
           height: 375px;
           margin: 5px;
           overflow: auto;
           white-space: normal;
        }
        .noListItems
        {
            display: block;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 90%; margin: auto;">
        <div id="mainAdminBox" class="adminBox" style="border-color: #e1e1e1; -webkit-box-shadow: 0px 0px 10px #ddd;
            box-shadow: 0px 0px 10px #ddd; margin: 0px auto;">
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;
                max-height: 600px;">
                <asp:Panel runat="server" ID="MainPanel">
                    <asp:Label runat="server" ID="OrganizationName" CssClass="boldText" Style="display: block;"></asp:Label>
                    <!-- Tabs -->
                    <div class="EditDataEntryForm_ChildTable" id="UserGroupsCheckboxesContainer">
                        <div style="white-space: nowrap;" class="EditDataEntryForm_ChildTableTitleOuterContainer">
                            <span onclick="setActiveDataEntryTab('Tabs', 0, true, event);" class="EditDataEntryForm_ChildTableTitleInnerContainer" id="Tabs_Link_0">
                                <span class="EditDataEntryForm_ChildTableTitle" id="Tabs_Text_0">Contacts</span></span>
                            <span onclick="setActiveDataEntryTab('Tabs', 1, true, event);" class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled" id="Tabs_Link_1">
                                <span class="EditDataEntryForm_ChildTableTitle" id="Tabs_Text_1">Projects</span></span>
                            <span onclick="setActiveDataEntryTab('Tabs', 2, true, event);" class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled" id="Tabs_Link_2">
                                <span class="EditDataEntryForm_ChildTableTitle" id="Tabs_Text_2">Protocols</span></span>
                                <!-- Contacts -->
                                <div class="scrollTabContent" id="Tabs_Tab_0">
                                    <asp:Label runat="server" ID="NoContacsMessage" CssClass="noListItems" Text="No contacts for this organization"
                                        Visible="false" />
                                    <div style="max-height: 300px; overflow: auto;">
                                        <ul class="adminBoxNavList">
                                            <asp:Repeater runat="server" ID="ContactsRptr">
                                                <ItemTemplate>
                                                    <li class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "")  %>"><a href="#"
                                                        onclick="return editContact('<%# Eval("ContactId") %>');">
                                                        <%# Eval("LastName") %>,
                                                        <%# Eval("FirstName") %>
                                                        <%# Eval("UserName").ToString() != "" ? "<b>(" + Eval("UserName") + ")</b>" : ""%></a>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </div>
                                    <div class="buttons" style="position: absolute; bottom: 25px; left: 50%; width: 300px; margin-left: -175px;">
                                        <span class="dataEntryButtonGray" onclick="addContact();">Add Contact</span> <span
                                            class="dataEntryButtonGray" onclick="associateContact();">Manage Organization Contacts</span>
                                    </div>
                                </div>
                                <!-- Projects -->
                                <div class="scrollTabContent" style="display: none;" id="Tabs_Tab_1">
                                    <asp:Label runat="server" ID="NoProjectsMessage" CssClass="noListItems" Text="No projects for this organization"
                                        Visible="false" />
                                    <ul class="adminBoxNavList">
                                        <asp:Repeater runat="server" ID="ProjectsRptr">
                                            <ItemTemplate>
                                                <li class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "")  %>">
                                                    <span><%# Eval("Title") %></span>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                                <!-- Protocols -->
                                <div class="scrollTabContent" style="display: none;" id="Tabs_Tab_2">
                                    <asp:Label runat="server" ID="NoProtocolsMessage" CssClass="noListItems" Text="No protocols for this organization"
                                        Visible="false" />
                                    <ul class="adminBoxNavList">
                                        <asp:Repeater runat="server" ID="ProtocolRptr">
                                            <ItemTemplate>
                                                <li class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "")  %>">
                                                    <span><%# Eval("ProtocolNum")%></span> 
                                                    <span><%# Eval("ProtocolTitle")%></span>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                    </div>                    
                </asp:Panel>
                <asp:Panel ID="associate_contact" runat="server" Visible="false">
                    <p>
                        Select contacts to associate with this organization</p>
                        <div style="height: 400px; overflow: auto; overflow-x: hidden;">
                                    <ul id="AssociateContactList" class="adminBoxNavList">
                                        <asp:Repeater runat="server" ID="AssociateContactsRptr">
                                            <ItemTemplate>
                                                <li class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "") %> <%# Eval("OrganizationContactId").ToString() != "" ? "selected" : ""%>">
                                                    <asp:HiddenField runat="server" ID="ContactId" Value='<%# Eval("ContactId") %>' />
                                                    <asp:HiddenField runat="server" ID="OrganizationContactId" Value='<%# Eval("OrganizationContactId") %>' />
                                                    <label class="block">
                                                        <asp:CheckBox runat="server" ID="AssociateCheckBox" Checked='<%# Eval("OrganizationContactId").ToString() != "" %>' />
                                                        <span>
                                                            <%# Eval("LastName") %>,
                                                            <%# Eval("FirstName") %>
                                                            <%#Eval("UserName").ToString()!="" ? "<b>(" + Eval("UserName") + ")</b>" : ""%></span></label>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div> 
                    
                    <asp:Button runat="server" ID="BulkAssociateButton" Text="Update Organization Contacts" CssClass="dataEntryButtonGray"
                        OnClick="BulkAssociateContacts" style=" margin-top: 10px;" />
                </asp:Panel>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
