<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminRolePermissions.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminRolePermissions" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Group Administrator</title>
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript">
    /* <![CDATA[ */

    var PermissionsCheckBoxes = {};
        
    // A Lookup object used for checking dependenceies when a checkbox is clicked
	var PermissionsLookup =
    {			 
        'EditData' : { dependencies: { 'ViewData' : true } },
        'DeleteData' : { dependencies: { 'ViewData' : true, 'EditData' : true } },
        'UnlockData' : {dependencies: { 'ViewData' : true, 'EditData' : true, 'DeleteData' : true } },
        'AddPatient' : { dependencies: { 'ViewData' : true, 'EditData' : true } },
        'DeletePatient' : { dependencies: { 'ViewData' : true, 'EditData' : true, 'DeleteData' : true, 'AddPatient' : true } },
        'EditNarrative' : { dependencies: { 'ViewData' : true, 'EditData' : true, 'DeleteData' : true } },
        'EditSecurity' : 
        { 
            alert: 'WARNING: Having permission to edit security allows a role full access to this administrative utility.\nShould only be granted to System Administrators.',
            dependencies: { 'ViewData' : true, 'EditData' : true, 'DeleteData' : true }
        },
        'ApproveEForm' : { dependencies: { 'EditEForm' : true, 'InitiateEForm' : true } },
        'InitiateEForm' : { dependencies: { 'EditEForm' : true } },
        'ViewPatientIdentifiers' :
        {
            //confirm: 'NOTE: If you deny access to all patients none of the other permissions will apply.',
            //dependencies: { all: false }
        }
    }
    
    // When a checkbox is clicked
	function cascadePermissions(cb,key)
	{
		if(cb.checked)
		{
			//document.forms[0].DenyPatientAccess.checked = false;
			checkDependency(cb,key);
	    }
    }
        
    // Check off dependent checkboxes
	function checkDependency(cb,lookupKey)
	{
	    // Get lookup item
	    var lookupItem = PermissionsLookup[lookupKey];
	    if(lookupItem)
	    {
	        // Check dependencies
	        var doDependencyCheck = true;
	        if(lookupItem.alert){ alert(lookupItem.alert); }
	        if(lookupItem.confirm){ doDependencyCheck = confirm(lookupItem.confirm); }
	        if(doDependencyCheck)
	        {
	            // check if dependecy rule applies to all
	            if(lookupItem.dependencies.all!=null)
	            {
	                var doCheck = lookupItem.dependencies.all;
	                for(var key in PermissionsCheckBoxes) 
	                { 
	                    if(PermissionsCheckBoxes[key] != cb) 
	                    checkPermissionCheckBox(key,doCheck); 
	                }
	            }
	            // Other check individual rule
	            else
	            {
	                for(var key in lookupItem.dependencies)
	                {
	                    var doCheck = lookupItem.dependencies[key];
	                    doCheck = doCheck==null?false:doCheck;
	                    checkPermissionCheckBox(key,doCheck);
	                }
	            }
	        }
	    }
	}
	
	function checkPermissionCheckBox(key,doCheck)
	{
	    var cb = PermissionsCheckBoxes[key];
	    if(cb) { cb.checked = doCheck; }
	}
	 
	function showHideLegend(doShow) 
	{ 
	    var div = $('LegendDiv');
	    if(doShow) { div.show(); } 
	    else { div.hide(); } 
	    return false; 
    }
    
    // Bulds the PermissionsCheckBoxes has will contain mapping of permission checkbox
    // Ex: PermissionsCheckBoxes['EditData'] - > DOM checkbox
    function buildPermissionsCheckBoxes()
    {
        var permissions = $('PermissionsList');
        var inputs = permissions.getElementsByTagName('INPUT');
        for(var i=0;i<inputs.length;i++)
        {
            if(inputs[i].type=='checkbox')
            {
                var permissionCheck = $(inputs[i]);
                // Permissions checkboxes are referenced by title attribute
                var key = permissionCheck.title;
                PermissionsCheckBoxes[key] = permissionCheck;
                permissionCheck.addEvent('click',curry(cascadePermissions,permissionCheck,key));
            }
        }
    }

    // During load, build hash to permission to checkbox
    window.addEvent('load',buildPermissionsCheckBoxes);
	
    /* ]]> */
    </script>

    <style type="text/css">
    .LabelCol
    {
        width: 85px;
        vertical-align: top;
        font-weight: bold;
    }
    #PermissionsList
    {
        list-style-type: none;
        margin-top: 0px;
        padding-top: 0px;
        margin-left: 0px;
        padding-left: 0px;
    }
    #PermissionsList li
    {
        width: 33%;
        display: block;
        vertical-align: middle;
        float: left;
        white-space: nowrap;
    }
    #SecurityNotes
    {
        color: red;
        margin-top: 10px;
    }
    #SecurityNotes span
    {
        display: block;
        font-size: 14px;
        font-weight: bold;
    }
    #LegendDiv
    {
        width: 90%;
        margin: auto;
        left: 5%;
        top: 5%;
        position: absolute;
        background-color: #ffffff; 
        border: solid 1px black; 
        padding: 10px; 
        font-size: 12px;
    }
    #LegendTable
    {
        width: 100%;
        margin: 5px auto 5px auto;
    }
    #NavButtons
    {
        clear: both;
        padding-top: 10px;
    }
    .NavBtn
    {
        margin-right: 25px;
        vertical-align: middle;
        cursor: pointer;
    }
    </style>
</head>
<body class="AdminBody">
    <form id="dataForm" method="post" runat="server">
        <div style="width: 95%; margin: auto;">
            <a href="AdminRoles.aspx" class="boldText" title="&lt; back" style="float: right;">&lt;
                back</a>
            <!-- Data Entry -->
            <table style="width: 100%; margin: auto;">
                <tr>
                    <td class="LabelCol">
                        <label for="Role">
                            role name</label></td>
                    <td>
                        <cic:CaisisTextBox runat="server" ID="Role" ShowLabel="false" Style="width: 250px;"></cic:CaisisTextBox>
                        <asp:RequiredFieldValidator ControlToValidate="Role" ErrorMessage="please enter a role name"
                            runat="server" Display="Dynamic" ID="val1"></asp:RequiredFieldValidator></td>
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
                            runat="server" Display="Dynamic" ID="val2"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="LabelCol">
                        <label>
                            permissions</label></td>
                    <td>
                        <ul id="PermissionsList">
                            <asp:Repeater runat="server" ID="PermissionsRptr" OnItemDataBound="SetCheckBoxUIProperties" OnDataBinding="PopulateCurrentPermissions">
                                <ItemTemplate>
                                    <li>
                                        <asp:Label runat="server" ID="PermissionsLabel" AssociatedControlID="PermissionCheckBox"
                                            CssClass="PermissionsCheck" ToolTip='<%# Eval("PermissionDescription") %>'>
                                            <input runat="server" id="PermissionCheckBox" type="checkbox" title='<%# Eval("Permission") %>' onserverchange="SetControlDirty" />
                                            <input runat="server" id="RolePermissionIdField" type="hidden"  />
                                            <span>
                                                <%# Eval("Permission") %>
                                            </span></asp:Label>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <!-- Buttons -->
                        <div id="NavButtons">
                            <asp:ImageButton ID="AddBtn" ToolTip="Add New Role" CssClass="NavBtn" OnCommand="AddButtonClick"
                                runat="server" ImageUrl="~/Images/AdminImages/submit.gif" />
                            <asp:ImageButton ID="UpdateBtn" ToolTip="Update Role" CssClass="NavBtn" OnCommand="UpdateButtonClick"
                                runat="server" ImageUrl="~/Images/AdminImages/submit.gif" />
                            <img alt="Back to Previous Page" title="Back to Previous Page" class="NavBtn" src="../Images/ButtonCancel.gif"
                                onclick="history.back()" />
                        </div>
                    </td>
                </tr>
            </table>
            <!-- Notes -->
            <div id="SecurityNotes">
                <span>Security Notes:</span>
                <ul>
                    <li>See <a href="#" onclick="return showHideLegend(true);" title="View Permissions Legend">
                        LEGEND</a> for descriptions of each role.</li>
                    <li>All roles at minimum must have the permission to view data.</li>
                    <li>EditSecurity should ONLY be granted to the SystemAdminister Role.</li>
                </ul>
            </div>
            <!-- Legend -->
            <div id="LegendDiv" style="display: none;">
                <a href="#" onclick="return showHideLegend(false);" style="float: right;">[ CLOSE ]</a>
                <h3>
                    Permissions Legend</h3>
                <table id="LegendTable" cellpadding="2">
                    <thead>
                        <tr>
                            <td class="LabelCol" style="background-color: #666666; color: #ffffff;">
                                Permission</td>
                            <td style="background-color: #666666; color: #ffffff;">
                                Description</td>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Legend" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td class="LabelCol">
                                        <%# Eval("Permission")%>
                                    </td>
                                    <td>
                                        <%# Eval("PermissionDescription") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <asp:Literal ID="valMsg" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
