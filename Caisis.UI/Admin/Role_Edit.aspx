<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Role_Edit.aspx.cs" Inherits="Caisis.UI.Admin.Role_Edit" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Roles</title>
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
            var winHeight = jQuery(window).height() - 100;
            var mainContainer = jQuery('#adminBoxNavListContainer');
            mainContainer.css('max-height', Math.max(winHeight, 100) + 'px');
        }
        
        
        

        var PermissionsCheckBoxes = {};

        // A Lookup object used for checking dependenceies when a checkbox is clicked
        var PermissionsLookup =
    {
        'EditData': { dependencies: { 'ViewData': true} },
        'DeleteData': { dependencies: { 'ViewData': true, 'EditData': true} },
        'UnlockData': { dependencies: { 'ViewData': true, 'EditData': true, 'DeleteData': true} },
        'AddPatient': { dependencies: { 'ViewData': true, 'EditData': true} },
        'DeletePatient': { dependencies: { 'ViewData': true, 'EditData': true, 'DeleteData': true, 'AddPatient': true} },
        'EditNarrative': { dependencies: { 'ViewData': true, 'EditData': true, 'DeleteData': true} },
        'EditSecurity':
        {
            alert: 'WARNING: Having permission to edit security allows a role full access to this administrative utility.\nShould only be granted to System Administrators.',
            dependencies: { 'ViewData': true, 'EditData': true, 'DeleteData': true }
        },
        'ApproveEForm': { dependencies: { 'EditEForm': true, 'InitiateEForm': true} },
        'InitiateEForm': { dependencies: { 'EditEForm': true} },
        'ViewPatientIdentifiers':
        {
        //confirm: 'NOTE: If you deny access to all patients none of the other permissions will apply.',
        //dependencies: { all: false }
    }
}

        // When a checkbox is clicked
        function cascadePermissions(cb, key) {
            if (cb.checked) {
                //document.forms[0].DenyPatientAccess.checked = false;
                checkDependency(cb, key);
            }
        }

        // Check off dependent checkboxes
        function checkDependency(cb, lookupKey) {
            // Get lookup item
            var lookupItem = PermissionsLookup[lookupKey];
            if (lookupItem) {
                // Check dependencies
                var doDependencyCheck = true;
                if (lookupItem.alert) { alert(lookupItem.alert); }
                if (lookupItem.confirm) { doDependencyCheck = confirm(lookupItem.confirm); }
                if (doDependencyCheck) {
                    // check if dependecy rule applies to all
                    if (lookupItem.dependencies.all != null) {
                        var doCheck = lookupItem.dependencies.all;
                        for (var key in PermissionsCheckBoxes) {
                            if (PermissionsCheckBoxes[key] != cb)
                                checkPermissionCheckBox(key, doCheck);
                        }
                    }
                    // Other check individual rule
                    else {
                        for (var key in lookupItem.dependencies) {
                            var doCheck = lookupItem.dependencies[key];
                            doCheck = doCheck == null ? false : doCheck;
                            checkPermissionCheckBox(key, doCheck);
                        }
                    }
                }
            }
        }

        function checkPermissionCheckBox(key, doCheck) {
            var cb = PermissionsCheckBoxes[key];
            if (cb) { cb.checked = doCheck; }
        }

        function showHideLegend(doShow) {
            var div = $('LegendDiv');
            if (doShow) { div.show(); }
            else { div.hide(); }
            return false;
        }

        // Bulds the PermissionsCheckBoxes has will contain mapping of permission checkbox
        // Ex: PermissionsCheckBoxes['EditData'] - > DOM checkbox
        function buildPermissionsCheckBoxes() {
            var permissions = $('PermissionsTable');
            var inputs = permissions.getElementsByTagName('INPUT');
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type == 'checkbox') {
                    var permissionCheck = $(inputs[i]);
                    // Permissions checkboxes are referenced by title attribute
                    var key = permissionCheck.title;
                    PermissionsCheckBoxes[key] = permissionCheck;
                    permissionCheck.addEvent('click', curry(cascadePermissions, permissionCheck, key));
                }
            }
        }

        // During load, build hash to permission to checkbox
        window.addEvent('load', buildPermissionsCheckBoxes);
        /* ]]> */
    </script>

    <style type="text/css">
        #PermissionsTable
        {
         table-layout: fixed;
         width: 95%;
        }
        #PermissionsTable td
        {
            vertical-align: top;
        }
        #PermissionsTable th
        {
            background-color: #666666;
            color: #ffffff;
            font-weight: bold;
            text-align: left;
        }
        .permissionModuleFirstRow
        {
            border-top: solid 1px #dddddd;
        }
    </style>
</head>
<body  onload="top.setActiveButton('Roles');">
    <form id="form1" runat="server">
<div id="AdminUserGroupPopupContainer" style="max-width: 700px;">
    

    <span class="dataEntryButtonGray slideNavRight" style="float: left; margin-right: 30px; clear: none;" onclick="window.location='Role_List.aspx';">< All Roles</span>
    <asp:Label ID="RoleTitle" runat="server" CssClass="adminNavHeading"></asp:Label>
    <div id="mainAdminBox" class="adminBox" style="width: 95%; border-color: #e1e1e1;-webkit-box-shadow: 0px 0px 10px #ddd; box-shadow: 0px 0px 10px #ddd;">
    <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden; max-height: 400px;" >
     
   <!-- Data Entry -->
        <table style="width: 100%; margin: auto;">
            <tr>
                <td class="LabelCol">
                    <label for="Role">
                        role name</label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="Role" ShowLabel="false" Style="width: 250px;"></cic:CaisisTextBox>
                    <asp:RequiredFieldValidator ControlToValidate="Role" ErrorMessage="please enter a role name"
                        runat="server" Display="Dynamic" ID="val1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="LabelCol">
                    <label for="RoleDesc">
                        description
                    </label>
                </td>
                <td>
                    <cic:CaisisTextArea runat="server" ID="RoleDesc" ShowLabel="false" ShowTextEditor="false"
                        Style="width: 250px; height: 80px;"></cic:CaisisTextArea>
                    <asp:RequiredFieldValidator ControlToValidate="RoleDesc" ErrorMessage="please enter a description"
                        runat="server" Display="Dynamic" ID="val2"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>


<div class="EditDataEntryForm_ChildTable">
<div class="EditDataEntryForm_ChildTableTitleOuterContainer"><span class="EditDataEntryForm_ChildTableTitleInnerContainer"><span class="EditDataEntryForm_ChildTableTitle">Permissions</span></span></div>
<div id="" class="EditDataEntryForm_Grid">
<table id="PermissionsTable" cellpadding="2" cellspacing="0">
            <thead>
                <tr>
                    <th style="width: 25%;">
                        Module
                    </th>
                    <th class="LabelCol" style="width: 30%;">
                        Permission
                    </th>
                    <th style="width: 45%;">
                        Description
                    </th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater runat="server" ID="ModulePermissionsRptr" OnItemDataBound="BuildModulePermissions"
                    OnDataBinding="PopulateCurrentPermissions">
                    <ItemTemplate>
                        <asp:Repeater runat="server" ID="TabPermissionsRptr" OnItemDataBound="SetCheckBoxUIProperties">
                            <ItemTemplate>
                                <tr>
                                    <td <%# Container.ItemIndex==0 ? "class=\"permissionModuleFirstRow\"" : "" %>>
                                        <span class="boldText">
                                            <%# Container.ItemIndex == 0 ? DataBinder.Eval((Container.NamingContainer.NamingContainer as RepeaterItem).DataItem, "ModuleName") : "&nbsp;"%></span>
                                    </td>
                                    <td <%# Container.ItemIndex==0 ? "class=\"permissionModuleFirstRow\"" : "" %> style="white-space: nowrap;">
                                        <input runat="server" id="PermissionCheckBox" type="checkbox" onserverchange="SetControlDirty" />
                                        <input runat="server" id="RolePermissionIdField" type="hidden" />
                                        <asp:Label runat="server" ID="PermissionsLabel" AssociatedControlID="PermissionCheckBox"
                                            CssClass="PermissionsCheck" Text='<%# Eval("Key") %>'></asp:Label>
                                    </td>
                                    <td <%# Container.ItemIndex==0 ? "class=\"permissionModuleFirstRow\"" : "" %> style="white-space: normal;">
                                        <asp:Label runat="server" ID="PermissionsDesc" CssClass="PermissionsCheck" Text='<%# Eval("Value") %>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
    </table>
            </div>
</div>
</div>





        
        <!-- Buttons -->
        <div id="NavButtons">
            <asp:Button ID="AddBtn" Text="Add New Role" OnCommand="AddButtonClick" runat="server"
                CssClass="dataEntryButtonGray" />
            <asp:Button ID="UpdateBtn" Text="Update Role" OnCommand="UpdateButtonClick" runat="server"
                CssClass="dataEntryButtonGray" />
            <asp:Button ID="DeleteBtn" Text="Delete Role" OnCommand="DeleteButtonClick" runat="server"
                CssClass="dataEntryButtonGray" OnClientClick="return confirmDelete('Are you sure you would like to delete this Role?');" />
        </div>
        <asp:Literal ID="valMsg" runat="server"></asp:Literal>    
            </div>
</div>    
</div>    
    </form>
</body>
</html>
