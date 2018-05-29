<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Group_Edit.aspx.cs" Inherits="Caisis.UI.Admin.Group_Edit" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="filter" TagName="SearchFilter" Src="~/Admin/ListFilter_Control.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Edit Group</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript" src="../ClientScripts/PatientDataEntry.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();
        
        jQuery(document).ready(function(e) {
            // adjust main content height
            adjustMainContentScroll();        
            jQuery(window).resize(adjustMainContentScroll);
            // set inital user state
            toggleAssignedUsers(<%= AssignedUsers.Checked.ToString().ToLower() %>);
        });

        function adjustMainContentScroll() {
            var winHeight = jQuery(window).height() - 75;
            var mainContainer = jQuery('#mainAdminBox');
            mainContainer.css('max-height', Math.max(winHeight, 100) + 'px');
        }

        function manageRoles() {
            var roleId = jQuery("#GroupRole").val();
            if(roleId=='') {
                alert('Please select a Role.');
            }
            else {
                var url = 'Role_Edit.aspx?roleId=' + roleId;
                var title = 'Manage Roles';
                top.showModalWithConfig(url, title, { width: 800, height: 500 });
            }
            return false;
        }

        function checkUnCheckUserRow(tr, index, e) {
            var target = e.srcElement || e.target;
            var row = jQuery(tr);
            var cb = row.find("input[type='checkbox']");
            var doCheckAdjust = target != cb[0];
            var isChecked = cb.is(":checked");
            if (isChecked) {
                if (doCheckAdjust) {
                    row.attr("class", index % 2 == 0 ? "alternate" : "");
                    cb.removeAttr("checked");
                } else {
                    row.attr("class", "selected");
                }
            }
            else {
                if (doCheckAdjust) {
                    row.attr("class", "selected");
                    cb.attr("checked", "checked");
                }
                else {
                    row.attr("class", index % 2 == 0 ? "alternate" : "");
                }
            }
        }
        
        function toggleAssignedUsers(showAll) {
            var assignedCheckBox = jQuery("#AssignedUsers");
            var isChecked = showAll != null ? showAll : assignedCheckBox.is(":checked");
            var UsersListContainer = jQuery("#UsersListContainer");
            var allRows = jQuery("#UsersList li");
            if (isChecked) {
                allRows.show();
                UsersListContainer.addClass("showAll");
            }
            else {
                var checkedRows = allRows.find("input:checked").parent();
                var uncheckeRows = allRows.not(checkedRows);
                uncheckeRows.hide();
                UsersListContainer.removeClass("showAll");
            }
        }

        /* ]]> */
    </script>
    
    <style type="text/css">
    
    ul#UsersList li:hover
    {
	        background-image: none;
    }

    ul#UsersList li.alternate:hover
    {
	        background-image: none;
    }

    ul#UsersList li.selected
    {
	    border: solid 1px #f1f1f1;
	    background-color: #f1f1f1;

    	
	    -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        -khtml-border-radius: 3px;
        border-radius: 3px;
    /*	behavior: url(../ClientScripts/border-radius.htc); */
    	
	    color: #000000;
    	
	    background-image: none;
	    background-position: right center;
	    background-repeat: no-repeat;
    	
	    cursor: default;
    }
    ul#UsersList li.selected:hover
    {
	    border: solid 1px #8D2A2C;
	    background-color: #E9DDDF;
	    -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        -khtml-border-radius: 3px;
        border-radius: 3px;
    /*	behavior: url(../ClientScripts/border-radius.htc); */
    	
	    color: #000000;
	    cursor: pointer;
	    background-image: none;
	    background-position: right center;
	    background-repeat: no-repeat;
    }
    ul#UsersList li.selected:hover a
    {
	    color: #000000;
    }
    ul#UsersList li.selected a
    {
	    color: #000000;
    }
    
    div.showAll ul#UsersList li.selected
    {
	    border: solid 1px #8D2A2C;
	    background-color: #8D2A2C;
    	
	    -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        -khtml-border-radius: 3px;
        border-radius: 3px;
    /*	behavior: url(../ClientScripts/border-radius.htc); */
    	
	    color: #ffffff;
    	
	    background-image: none;
	    background-position: right center;
	    background-repeat: no-repeat;
    	
	    cursor: default;
    }
    div.showAll ul#UsersList li.selected:hover
    {
	    border: solid 1px #8D2A2C;
	    background-color: #8D2A2C;	
	    -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        -khtml-border-radius: 3px;
        border-radius: 3px;
    /*	behavior: url(../ClientScripts/border-radius.htc); */
    	
	    color: #ffffff;
	    cursor: pointer;
	    background-image: none;
	    background-position: right center;
	    background-repeat: no-repeat;
    }
    div.showAll ul#UsersList li.selected:hover a
    {
	    color: #ffffff;
    }
    </style>
    
    

</head>
<body onload="top.setActiveButton('Groups');">
    <form id="form1" runat="server">
    
    <span class="dataEntryButtonGray slideNavRight" style="float: left; margin-right: 30px; clear: none;" onclick="window.location='Group_List.aspx';">< All Groups</span>
    <asp:Label ID="GroupTitle" runat="server" CssClass="adminNavHeading">Add New Group</asp:Label>
    <div id="mainAdminBox" class="adminBox" style="width: 95%; border-color: #e1e1e1;-webkit-box-shadow: 0px 0px 10px #ddd; box-shadow: 0px 0px 10px #ddd;">
    <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden; max-height: 600px;"">
                



    <asp:PlaceHolder runat="server" ID="GroupFields">
        <table style="margin-top: 10px;">
            <tr>
                <td>
                    <label for="GroupName" class="adminNavBoxContainerTitle">
                        Name
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="GroupName" ShowLabel="false" Table="Groups"
                        Field="GroupName" Width="350px"></cic:CaisisTextBox>
                    <asp:RequiredFieldValidator ID="GroupNameValidator" runat="server" ControlToValidate="GroupName"
                        ErrorMessage="* required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="GroupDescription" class="adminNavBoxContainerTitle">
                        Description
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="GroupDescription" ShowLabel="false" Table="Groups"
                        Field="GroupDescription" Width="350px"></cic:CaisisTextBox>
                    <asp:RequiredFieldValidator ID="GroupDescriptionValidator" runat="server" ControlToValidate="GroupDescription"
                        ErrorMessage="* required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-top: 25px;">
                    <label for="GroupRole" class="adminNavBoxContainerTitle">
                        Assigned Role
                    </label>
                </td>
                <td style="padding-top: 25px;">
                    <cic:CaisisSelect runat="server" ID="GroupRole" ShowLabel="false" Table="Groups"
                        Field="RoleId" DataTextField="Role" DataValueField="RoleId" Width="150px">
                    </cic:CaisisSelect>
                    <button class="dataEntryButtonGray" onclick="return manageRoles();">
                        Manage Roles</button>
                    <asp:RequiredFieldValidator ID="RoleValidator" runat="server" ControlToValidate="GroupRole"
                        ErrorMessage="* required"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </asp:PlaceHolder>
        <div id="UserGroupsCheckboxesContainer" class="EditDataEntryForm_ChildTable">
            <div class="EditDataEntryForm_ChildTableTitleOuterContainer">
                <span id="Tabs_Link_0" class="EditDataEntryForm_ChildTableTitleInnerContainer" onclick="setActiveDataEntryTab('Tabs',0);">
                    <span id="Tabs_Text_0" class="EditDataEntryForm_ChildTableTitle">Assign Datasets</span></span>
                <span id="Tabs_Link_1" class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled" onclick="setActiveDataEntryTab('Tabs',1);">
                    <span id="Tabs_Text_1" class="EditDataEntryForm_ChildTableTitle">Assign Modules / Tabs</span></span>
                <span id="Tabs_Link_2" class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled" onclick="setActiveDataEntryTab('Tabs',2);">
                    <span id="Tabs_Text_2" class="EditDataEntryForm_ChildTableTitle">Group Members</span></span>
                <div id="Tabs_Tab_0">
                    <div class="EditDataEntryForm_Overflow" style="padding-right: 15px; overflow-x: hidden;
                        border: solid 1px #cccccc;">
                        <table class="dataGrid" style="table-layout: fixed; min-width: 200px; width: 100%;
                            margin: 0px; border: none;">
                            <asp:Repeater runat="server" ID="DatasetsRptr" OnItemDataBound="SetCheckBoxes">
                                <ItemTemplate>
                                    <tr class="<%# Container.ItemIndex % 2==0 ? "dataGridItemRowA" : "dataGridItemRowB" %>">
                                        <td style="width: 25px; text-align: center;">
                                            <cic:CaisisHidden runat="server" ID="DatasetId" Table="GroupDatasets" Field="DatasetId"
                                                Value='<%# Eval("DatasetId") %>'>
                                            </cic:CaisisHidden>
                                            <cic:CaisisCheckBox runat="server" ID="KeyField" ShowLabel="false" Table="GroupDatasets"
                                                Field="GroupDatasetId" />
                                            <cic:CaisisHidden runat="server" ID="ValueField" ShowLabel="false" Table="GroupDatasets"
                                                Field="GroupDatasetId">
                                            </cic:CaisisHidden>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" AssociatedControlID="KeyField"><%# Eval("DatasetName") %></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </div>
                <div id="Tabs_Tab_1" style="display: none;">
                    <div class="EditDataEntryForm_Overflow" style="padding-right: 15px; overflow-x: hidden;
                        border: solid 1px #cccccc;">
                        <table class="dataGrid" style="table-layout: fixed; min-width: 200px; width: 100%;
                            margin: 0px; border: none;">
                            <asp:Repeater runat="server" ID="TabsRptr" OnItemDataBound="SetCheckBoxes">
                                <ItemTemplate>
                                    <tr class="<%# Container.ItemIndex % 2==0 ? "dataGridItemRowA" : "dataGridItemRowB" %>">
                                        <td style="width: 25px; text-align: center;">
                                            <cic:CaisisCheckBox runat="server" ID="KeyField" ShowLabel="false" Table="Groups"
                                                Field="GroupAccessCode" />
                                            <cic:CaisisHidden runat="server" ID="ValueField" ShowLabel="false" Table="Groups"
                                                Field="GroupAccessCode" Value='<%# Container.DataItem %>'>
                                            </cic:CaisisHidden>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" AssociatedControlID="KeyField"><%# Container.DataItem %></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </div>
                <div id="Tabs_Tab_2" style="display: none;">
                    <filter:SearchFilter ID="UserSearch" runat="server" ListId="UsersList" />
                    <asp:CheckBox runat="server" ID="AssignedUsers" Text="View All Users (to add members to this group)" onclick="toggleAssignedUsers();" style="margin-left: 9px;" />
                    <div id="UsersListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;">
                        <ul id="UsersList" class="adminBoxNavList">
                            <asp:Repeater runat="server" ID="UsersRptr" OnItemDataBound="SetAssociatedGroupUsers">
                                <ItemTemplate>
                                    <li onclick="checkUnCheckUserRow(this, <%# Container.ItemIndex %>, event);" title="<%# Eval("UserEmail") %>"
                                        <%# associatedUsers.ContainsKey((int)Eval("UserId")) ? "class=\"selected\"" : (Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "") %>>
                                        <asp:HiddenField runat="server" ID="UserIdField" />
                                        <asp:HiddenField runat="server" ID="UserGroupIdField" />
                                        <asp:CheckBox runat="server" ID="AssociateUserField" />
                                        <span style="width: 220px; margin-right: 20px; display: inline-block;">
                                            <%# Eval("UserLastName")%>,
                                            <%# Eval("UserFirstName")%>
                                        </span><span style="">
                                            <%# Eval("Username") %>
                                        </span></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
     
        <div class="dataEntryButtons" style="text-align: center; clear: both; margin: 10px auto 10px auto;">
            <asp:Button ID="CancelBtn" runat="server" CssClass="dataEntryButtonGray" Text="Cancel"
                ToolTip="Cancel" OnClick="CancelClick" />
            <asp:Button ID="SaveBtn" runat="server" CssClass="dataEntryButtonGray" Text="Save"
                ToolTip="Save" OnClick="SaveClick" Style="margin-left: 30px;" />
            <asp:Button ID="DeleteBtn" runat="server" CssClass="dataEntryButtonGray" Text="Delete"
                ToolTip="Delete" OnClick="DeleteClick" OnClientClick="return confirmDelete('Are you sure you would like to delete the selected Group?');"
                Style="margin-left: 30px;" />
        </div>
    
    
            </div>
</div>
    
    
    </form>
</body>
</html>
