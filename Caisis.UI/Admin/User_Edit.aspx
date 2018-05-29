<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Edit.aspx.cs" Inherits="Caisis.UI.Admin.User_Edit" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit User</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../ClientScripts/DynamicControls.js"></script>
    <script type="text/javascript" src="../ClientScripts/PatientDataEntry.js"></script>
    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        
        // needed for calendar script
        top.APP_PATH = '<%= Page.ResolveUrl("~/") %>';

        jQuery.noConflict();
        
        jQuery(document).ready(function(e) {
            // adjust main content height
            adjustMainContentScroll();        
            jQuery(window).resize(adjustMainContentScroll);
            // set inital notes
            toggleUserNotes('DeactivateUserMsg', <%= DeactivateUser.Checked.ToString().ToLower() %>);
            toggleUserNotes('EmailNewUserMsg', <%= EmailUser.Checked.ToString().ToLower() %>);
        });

        function adjustMainContentScroll() {
            var winHeight = jQuery(window).height() - 100;
            var mainContainer = jQuery('#adminBoxNavListContainer');
            mainContainer.css('max-height', Math.max(winHeight, 100) + 'px');
        }

        function populateUser(username, email, fname, lname, employeeID) {
            $('Username').value = username;
            $('UserEmail').value = email;
            $('FirstName').value = fname;
            $('LastName').value = lname;
            $('UserEmployeeId').value = employeeID;
        }

        function setRandomPassword(fieldId, btn) {
            // lock button
            if (btn) {
                jQuery(btn).attr('disabled', 'disabled');
            }
            jQuery.post('User_Edit.aspx?random=true', function(data) {
                jQuery('#' + fieldId).val(data);
                // unlock button
                if (btn) {
                    jQuery(btn).removeAttr('disabled');
                }
            });
            return false;
        }

        function openLDAPPopup(LDAPButton)
        {
            var LDAPPopup = jQuery('#LDAPPopup');
            var position = jQuery(LDAPButton).offset();
            LDAPPopup.show().css({ left: position.left-100, top: position.top+15 });
        }

        function closeLDAPPopup()
        {
            var LDAPPopup = jQuery('#LDAPPopup');
            LDAPPopup.hide();
        }
        
        function setActiveTab(activeTab, e) {
            var tabIndex = 0; 
            switch(activeTab)
            {
                case 'groups':
                    tabIndex = 0;
                    break;
                case 'email':
                    tabIndex = 1;
                    break;
                case 'password':
                    tabIndex = 2;
                    break;   
                case 'attributes':
                    tabIndex = 3;
                    break;         
            }           
            setActiveDataEntryTab('Tabs', tabIndex, true, e);
        }

        // sets the user note
        function toggleUserNotes(id, checked) {
            var note = jQuery('#' + id);
            var classes = checked ? ['UserNote UserNoteShow'] : ['UserNote'];
            note.attr('class', classes.join(' '));
        }

        function setDeactivateField(checked) {
            var deactivateDate = jQuery('#<%= DeactivateDate.ClientID %>');
            // set to inital date or today
            if(checked) {
                var defaultDate = deactivateDate.attr('defaultValue');
                var setDate = defaultDate != '' ? defaultDate : '<%= DateTime.Today.ToShortDateString() %>';
                deactivateDate.val(setDate);
            }
            else {
                deactivateDate.val('');
            }
        }
        
        // confirm delete
        function confirmDeleteUser() {
            var message = 'Are you sure you want to delete user "<%= Username.Value  %>"?';
            return confirm(message);
        }
        
        function setUserUpdateMessage(message) {
//            jQuery('#UserUpdateMsg').text(message ? message : '');
              alert(message);
        }
        
        function toggleAddUserGroups() {
            var userGroupsList = jQuery("#UserGroupsLayer");
            var layer = jQuery("#AddUserGroupLayer");
            var layerText = jQuery("#AddUserGroupText");
            if(layer.is(":visible")) {
                layer.hide();
                userGroupsList.show();
                layerText.text("Add/Remove Groups");
            }
            else {
                layer.show();
                userGroupsList.hide();
                 layerText.text("Assigned Group(s)");
            }
            return false;
        }
        
        function manageGroup(groupId) {           
            var url = 'Group_Edit.aspx?groupId=' + groupId;
            var title = 'Manage Groups';
            top.showModalWithConfig(url, title, { width: 800, height: 500 });           
            return false;
        }

        
        function uploadSignatureImage()
        {
            var url = '../Plugins/FileLoader/FileUploadForm.aspx?tableName=users&primaryKey=<% = this.QueryUserId %>&fileLabel=signature';
            var title = 'Add or Change Signature Image';
//            top.showModalWithConfig(url, title, { width: 1000, height: 700 });

            window.open(url, '', 'toolbars=no,resizable=yes,scrollbars=yes,width=900,height=800,left=20,top=20');

            return false;
        }

        
        function setFullImage(newSrc)
        {
            var signatureImage = document.getElementById('<% = SignatureImage.ClientID %>');
            var addSignatureButton =  document.getElementById('<% = AddSignatureLink.ClientID %>');
            if(signatureImage != null && newSrc.toString().length > 0)
            { 
                signatureImage.style.display = '';
                addSignatureButton.style.display = 'none';
                signatureImage.src = newSrc; 
            }
            else
            {
                signatureImage.style.display = 'none';
                addSignatureButton.style.display = '';
                signatureImage.src = ''; 
            }
        }


        /* ]]> */
    </script>

    <style type="text/css">
        .adminSectionHeading
        {
        }
        #UserGroupsCheckboxesContainer td
        {
            padding-right: 30px;
        }
        #userMain td
        {
            padding: 5px;
            font-weight: bold;
        }
        .dataEntryTabDisabled .EditDataEntryForm_ChildTableTitle
        {
            color: #aaaaaa;
        }
        .UserNote
        {
            margin-left: 20px;
            font-weight: normal;
            color: #666666;
            display: none;
        }
        .UserNoteShow
        {
            margin-left: 20px;
            font-weight: normal;
            color: #666666;
            display: inline;
        }
        .validatorMsg
        {
        }
        .UserList
        {
            list-style-type: none;
            margin: 4px 0px 10px 0px;
            padding: 0px;
            border: solid 1px #dddddd;
            background-color: #f8f8f8;
        }
        .UserList li
        {
            padding: 3px 0px 3px 3px;
        }
        #UserGroupsList span
        {
            display: inline-block;
            min-width: 200px;
            cursor: pointer;
        }
        #UserAttributesList li
        {
        }
        #UserAttributesList li:first-child
        {
            background-color: #ddd;
            border: 1px solid #ccc;
        }
        #UserAttributesList li:first-child span
        {
            font-weight: bold;
        }
        #UserAttributesList span
        {
            display: inline-block;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            font-size: 11px;
        }
        #UserAttributesList span:last-child
        {
        }
 
        
        .dataGrid
        {
            border-collapse: collapse;
            background-color: Red;
        }
        td.userInfoText
        {
            padding-left: 30px;
            font-size: 9px;
            font-weight: normal;
            white-space: nowrap;
            text-align: right;
        }
        
        img.signatureImage
        {
            width: 200px;
            border: solid 1px #999999;
            cursor: pointer;
        }
        img.signatureImage:hover
        {
            border: solid 1px #8d2a2c;
        }
    </style>
</head>
<body onload="top.setActiveButton('Users');">
    <script type="text/javascript" src="../ClientScripts/popcalendar.js"></script>
    <form id="form1" runat="server">    
    <div id="AdminUserGroupPopupContainer" style="width: 450px;">
    <asp:HiddenField runat="server" ID="UserIdField" />
    
    <span class="dataEntryButtonGray slideNavRight" style="float: left; margin-right: 30px; clear: none;" onclick="window.location='User_List.aspx';">< All Users</span>
<asp:Label ID="UserTitle" runat="server" CssClass="adminNavHeading">Add New User</asp:Label>
    <div id="mainAdminBox" class="adminBox" style="border-color: #e1e1e1;-webkit-box-shadow: 0px 0px 10px #ddd; box-shadow: 0px 0px 10px #ddd;">
    <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden; padding-right: 13px;">
                


        <div id="tab-main" class="adminSectionContent">
            <span id="UserUpdateMsg" class="UserNote UserNoteShow" style=" display: block; text-align: center;"></span>
            <table id="userMain" cellspacing="0" >
                <tr>
                    <td style="width: 80px;">
                    <asp:RequiredFieldValidator CssClass="validatorMsg" ID="UsernameValidator" runat="server" ControlToValidate="Username"
                            ErrorMessage="! REQUIRED" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                        <label for="Username" style="display: block;">Username</label>
                        
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" ID="Username" ShowLabel="false" Table="Users" Field="Username"
                            Enabled="false"></cic:CaisisTextBox>
                        <asp:PlaceHolder runat="server" ID="NewUserPanel" Visible="true"><span class="dataEntryButtonGray"
                            onclick="return openLDAPPopup(this);">Search LDAP</span>
                            <div id="LDAPPopup" style="display: none;" class="EditDataEntryField_Tooltip">
                                <div class="EditDataEntryField_TooltipContentContainer">
                                    <img class="adminPopupCloseButton" src="../Images/shim.gif" onclick="return closeLDAPPopup();" />
                                    <div class="EditDataEntryField_TooltipContent">
                                        <span class="EditDataEntryField_TooltipTitle">LDAP Search</span>
                                        <iframe id="LdapFrame" name="LdapFrame" frameborder="0" style="width: 100%; display: block;
                                            height: 145px;" scrolling="no" src="AdminLdapSearch.aspx" runat="server"></iframe>
                                    </div>
                                </div>
                            </div>
                        </asp:PlaceHolder>
                    </td>
                    <td class="userInfoText"><asp:Label ID="UserEntered" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <label for="FirstName">
                            First Name
                        </label>
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" ID="FirstName" ShowLabel="false" Table="Users"
                            Field="UserFirstName"></cic:CaisisTextBox>
                    </td>
                    <td class="userInfoText"><asp:Label ID="LastUpdated" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <label for="LastName">
                            Last Name
                        </label>
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" ID="LastName" ShowLabel="false" Table="Users" Field="UserLastName"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="UserEmail">
                            Email
                        </label>
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" ID="UserEmail" ShowLabel="false" Table="Users"
                            Field="UserEmail"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="UserEmployeeId">
                            Employee ID
                        </label>
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" ID="UserEmployeeId" ShowLabel="false" Table="Users"
                            Field="UserEmployeeId"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr runat="server" id="UserPasswordRow">
                    <td>
                        <asp:RequiredFieldValidator CssClass="validatorMsg" ID="UserPasswordValidator" runat="server" ControlToValidate="UserPassword"
                            ErrorMessage="! REQUIRED" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                        <label for="UserPassword" style="display: block;">Password</label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="UserPassword"></asp:TextBox>
                        <asp:Button runat="server" ID="RandomPasswordCheck" Text="random" ToolTip="Generate a random password"
                            CssClass="dataEntryButtonGray" Style="font-weight: normal;" OnClientClick="return setRandomPassword('UserPassword', this);" />
                    </td>
                </tr>
                <tr id="UserActiveRow">
                    <td style="vertical-align: top;">
                        <label for="DeactivateUser">
                            Inactive?</label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="DeactivateUser" onclick="toggleUserNotes('DeactivateUserMsg', this.checked); setDeactivateField(this.checked);" />
                        <span id="DeactivateUserMsg" class="UserNote" style="margin-left: auto;">
                            <cic:CaisisTextBox runat="server" ID="DeactivateDate" ShowLabel="false" ShowCalendar="true"></cic:CaisisTextBox>
                            <span style=" display: block;">(deactivate date may be future date)</span></span>
                    </td>
                </tr>
                <tr id="UserSignatureRow" runat="server" visible="false">
                    <td style="vertical-align: top;">Signature</td>
                    <td>
                    <a onclick="uploadSignatureImage();" id="AddSignatureLink" runat="server" class="dataEntryButtonGray">Add Signature</a>
                    <asp:Image runat="server" ImageUrl="../Images/shim.gif" ID="SignatureImage" onclick="uploadSignatureImage();" CssClass="signatureImage" style="display: none; border: solid 1px #999999;"  />
                    </td>
                </tr>
                <tr runat="server" id="EmailUserRow">
                    <td>
                        <label for="EmailUser">Email user?</label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="EmailUser" onclick="toggleUserNotes('EmailNewUserMsg', this.checked);" />
                        <span id="EmailNewUserMsg" class="UserNote" >(The email panel will be displayed after you save.)</span>
                    </td>
                </tr>
            </table>
        </div>
        <div id="UserGroupsCheckboxesContainer" class="EditDataEntryForm_ChildTable">
            <div class="EditDataEntryForm_ChildTableTitleOuterContainer" style="white-space: nowrap;">
                <span id="Tabs_Link_0" class="EditDataEntryForm_ChildTableTitleInnerContainer" onclick="setActiveTab('groups', event);">
                    <span id="Tabs_Text_0" class="EditDataEntryForm_ChildTableTitle">Groups</span></span>
                    
                    <asp:PlaceHolder runat="server" ID="CurrentUserTabsPanel" Visible="false">
                        <span id="Tabs_Link_1"
                        class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled"
                        onclick="setActiveTab('email', event);"><span id="Tabs_Text_1" class="EditDataEntryForm_ChildTableTitle">
                            Email This User</span></span>
                        <span id="Tabs_Link_2" class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled"
                            onclick="setActiveTab('password', event);"><span id="Tabs_Text_2" class="EditDataEntryForm_ChildTableTitle dataEntryTabDisabled">
                                Update Password</span></span>                                
                        <span id="Tabs_Link_3" class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled"
                            onclick="setActiveTab('attributes', event);"><span id="Tabs_Text_3" class="EditDataEntryForm_ChildTableTitle dataEntryTabDisabled">
                        User Attributes</span></span>
                    </asp:PlaceHolder>
                <div id="Tabs_Tab_0" style="padding: 10px; position: relative;">
                    <span runat="server" id="AddUserGroupText" class="dataEntryButtonGray" style="position: absolute;
                        top: 5px; right: 10px;" onclick="return toggleAddUserGroups();">Add/Edit Groups
                    </span>
                    <asp:PlaceHolder runat="server" ID="UserGroupsPanel" Visible="false">
                        <div id="UserGroupsLayer">
                            <span class="boldText">Assigned Group(s)</span>
                            <ul id="UserGroupsList" class="UserList">
                                <asp:Repeater runat="server" ID="CurrentUserGroupsRptr">
                                    <ItemTemplate>
                                        <li title="<%# Eval("GroupDescription") %>" <%# Container.ItemIndex % 2 == 0 ? "style=\"background-color:#efefef;\"" : "" %>>
                                            <span onclick="return manageGroup('<%# Eval("GroupId") %>');">
                                                <%# Eval("GroupName") %></span>
                                            <asp:Button runat="server" Text="Delete" CssClass="dataEntryButtonGray" OnCommand="DeleteUserGroup"
                                                CommandArgument='<%# Eval("UserGroupId") %>' OnClientClick="return confirmDelete();" />
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </asp:PlaceHolder>
                    <div id="AddUserGroupLayer" style="display: <%= IsNew ? "block" : "none" %>;">
                        <span class="boldText">Add/Remove Groups</span>
                        <div style="border: solid 1px #dddddd; padding: 6px; margin-top: 3px;">
                            <cic:CaisisCheckBoxList runat="server" ShowLabel="false" ID="GroupsList" DataTextField="GroupName"
                                DataValueField="GroupId" RepeatColumns="2" RepeatLayout="Table">
                            </cic:CaisisCheckBoxList>
                        </div>
                    </div>
                </div>
                
                
    
            
                <asp:PlaceHolder runat="server" ID="CurrentUserPanel" Visible="false">
                        
                        <div id="Tabs_Tab_1" style="display: none; overflow: hidden;">
                        <iframe runat="server" id="emailUserFrame" name="emailUserFrame" scrolling="no" frameborder="0" style="overflow: hidden; width: 95%; margin: 5px auto; height: 325px; display: block;"></iframe>
                        </div>
                        
                        <div id="Tabs_Tab_2" style="display: none; margin-top: 12px;">
                        <div class="EditDataEntryForm_2Cols">
                            <div id="tab-password" class="adminSectionContent">
                                <label for="NewUserPassword">
                                    New Password:</label>
                                <asp:TextBox runat="server" ID="NewUserPassword"></asp:TextBox>
                                <button title="Generate a random password" class="dataEntryButtonGray" style="font-weight: normal;" onclick="return setRandomPassword('NewUserPassword', this);">
                                    random
                                </button>
                                <asp:Button runat="server" ID="UpdatePasswordBtn" Text="Update Password" OnClick="UpdatePasswordClick"
                                    CssClass="dataEntryButtonGray" Style=" display: block; margin: 2px auto;" />
                            </div>
                        </div>
                        </div>
                        <div id="Tabs_Tab_3" style="display: none; margin-top: 12px;">
                            <div class="EditDataEntryForm_2Cols">
                                <div id="tab-attributes" class="adminSectionContent">
                                    <ul id="UserAttributesList" class="UserList" style="width: 98%;" >
                                        <li>
                                            <span style="width: 25%;">Type</span> 
                                            <span style="width: 40%;">Name</span> 
                                            <span style="width: 17%;">Value</span>
                                        </li>
                                        <asp:Repeater runat="server" ID="UserAttributesRptr">
                                            <ItemTemplate>
                                                <li <%# Container.ItemIndex % 2 == 0 ? "style=\"background-color:#efefef;\"" : "" %>>
                                                    <span style="width: 25%;" title="TYPE: <%# Eval("UserAttributeType") %>"><%# Eval("UserAttributeType") %></span> 
                                                    <span style="width: 40%;" title="NAME: <%# Eval("UserAttributeName") %>"> <%# Eval("UserAttributeName")%></span> 
                                                    <span style="width: 17%;" title="VALUE: <%# Eval("UserAttributeValue") %>"> <%# Eval("UserAttributeValue")%></span>
                                                    <asp:Button runat="server" Text="Delete" CssClass="dataEntryButtonGray" style="display: inline; margin: 0px 0px 0px 0px;" OnCommand="DeleteUserAttribute" CommandArgument='<%# Eval("UserAttributeId") %>' OnClientClick="return confirmDelete();" />
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                         <li class="footer">
                                            <span style="width: 25%;" title="TYPE:">
                                                <cic:CaisisComboBox runat="server" ID="AddAttributeType" LookupDistinct="UserAttributes;UserAttributeType;UserAttributeType" Width="70px" ShowLabel="false"></cic:CaisisComboBox>
                                            </span> 
                                            <span style="width: 40%;" title="NAME:">
                                                <cic:CaisisComboBox runat="server" ID="AddAttributeName" LookupDistinct="UserAttributes;UserAttributeName;UserAttributeName" Width="125px" ShowLabel="false"></cic:CaisisComboBox>
                                            </span> 
                                            <span style="width: auto;" title="VALUE:" >
                                                <cic:CaisisTextBox runat="server" ID="AddAttributeValue" Width="115px" ShowLabel="false"></cic:CaisisTextBox>
                                            </span>                                                    
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                </asp:PlaceHolder>
            </div>
        </div>
         
            </div>
        <div style="text-align: center; margin-top: 5px; margin-bottom: 5px;">
            <asp:Button runat="server" ID="DeleteBtn" Text="Delete User" OnClick="DeleteClick"
                OnClientClick="return confirmDeleteUser();"
                CssClass="dataEntryButtonGray" />
            <asp:Button runat="server" ID="SaveButton" Text="Save" OnClick="SaveClick" CssClass="dataEntryButtonGray" />
        </div>
</div>
</div>
    </form>
</body>
</html>
