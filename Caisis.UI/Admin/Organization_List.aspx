<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Organization_List.aspx.cs"
    Inherits="Caisis.UI.Admin.Organization_List" %>

<%@ Register TagPrefix="filter" TagName="SearchFilter" Src="~/Admin/ListFilter_Control.ascx" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        jQuery.noConflict();
        
        var ORGANIZATION_ID = null;

        jQuery(document).ready(function() {
            var editBtn = jQuery("#EditOrganzationBtn");
            var editFrameContainer = jQuery("#ContactsFrameContainer");
            var items = jQuery("#OrganizationsList > li");
            items.click(function(e) {
                var li = jQuery(this);
                ORGANIZATION_ID = li.find('input').val();
                items.filter('.selected').removeClass('selected');
                if (!li.hasClass('selected'))
                    li.addClass('selected');
                var link = jQuery(this).find('a');
                window.frames["ContactsFrame"].location = link.attr('href');
                editFrameContainer.show();
                editBtn.show();
            });
        });

        function addNewOrganization() {
            return editOrganization('');
        }
        
        function editCurrentOrganization() {
            editOrganization(ORGANIZATION_ID);
        }

        function editOrganization(orgId) {
            var title = orgId && orgId != '' ? 'Edit Organization' : 'Add New Organization';
            top.showModalWithConfig('Organization_Edit.aspx?organizationId=' + orgId, title, { width: 325, height: 375, context: window });
            return false;
        }
    
    </script>

    <style type="text/css">
        #ContactsFrameContainer
        {
            display: none;
            padding: 5px;
            margin-left: 450px;
            margin-top: 0;
            overflow-x: hidden;
            z-index: 20;
        }
        #ContactsFrame
        {
            height: 500px;
            width: 100%;
        }
        .orgNum
        {
            display: inline-block;
            width: 30px;
            white-space: normal;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="OrganizationPanel">
        <div id="SelectFormBox" class="adminNavBoxContainer" style="width: 400px;">
            <table class="itemTable" cellspacing="0">
                <thead>
                    <tr>
                        <th>
                            Organization
                        </th>
                    </tr>
                </thead>
            </table>
            <div id="mainAdminBox" class="adminBox">
                <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;
                    word-wrap: break-word;">
                    <filter:SearchFilter ID="OrganizationFilter" runat="server" ListId="OrganizationsList" />
                    <ul id="OrganizationsList" class="adminBoxNavList">
                        <asp:Repeater runat="server" ID="OrganizationsRptr">
                            <ItemTemplate>
                                <li class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "") %>">                                     
                                    <asp:HiddenField runat="server" Value='<%# Eval("OrganizationId") %>' />
                                    <a target="ContactsFrame" href="Organization_Contacts.aspx?organizationId=<%# Eval("OrganizationId") %>">
                                        <span class="orgNum"><%# Eval("OrgNum") %>&nbsp;</span><%# Eval("Name") %>
                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <li id="NoResultsMsg" runat="server" style="text-align: center;" visible="false">No
                            Organizations have been assigned. </li>
                    </ul>
                </div>
            </div>
            <div class="buttons" style=" margin-top: 2px;">
                <span onclick="return addNewOrganization();" class="dataEntryButtonGray">
                    Add New Organzation</span>
                <span id="EditOrganzationBtn" class="dataEntryButtonGray" onclick="editCurrentOrganization();" style=" float: right; display: none;">Edit Organization Details</span>
            </div>
        </div>
        <div id="ContactsFrameContainer">
            <iframe name="ContactsFrame" id="ContactsFrame" frameborder="0"></iframe>
        </div>
    </div>
    </form>
</body>
</html>
