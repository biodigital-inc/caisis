<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectContactsDetails.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectContactsDetails" %>

<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Contact Details</title>

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        Browser.ResizeElement({ nodeId: 'OverflowPanel', heightOffset: 180, context: window });

        function showAddNewRow(btn, tableId) {
            btn = $(btn);
            var doHide = true;
            var table = $(tableId);
            for (var i = 0; i < table.rows.length; i++) {
                var row = table.rows[i];
                if (row.className == 'HiddenRow') {
                    row.className = 'VisibleRow';
                    doHide = i == (table.rows.length - 1);
                    break;
                }
            }
            if (doHide) { btn.hide('none'); }
            return false;
        }

        function deleteContact() { return confirmDelete('Are you sure you want to delete this contact?'); }

        function showMessageLayer(lid) {
            var ids = ['FindUserLayer', 'MultiFindUser', 'SingleFindUser', 'NoUserFound', 'RemoveUserTable'];
            for (var k in ids) { $(ids[k])[lid == ids[k] || k == 0 ? 'show' : 'hide'](); } $(ids[0]).center();
        }

        function needConfirmUser() {
            var fNameField = $('<%= ContactFirstName.ClientID %>');
            var lNameField = $('<%= ContactLastName.ClientID %>');
            var userCheck = $('UserCheck');
            return isFieldDirty(fNameField) || isFieldDirty(lNameField) || isFieldDirty(userCheck);
        }

        // Determine if need to check db for Users, and call server method
        function doUserCheck(e) {
            var cb = $('UserCheck');
            var curUserId = $('UserIdField').value;
            if (cb.checked) {
                var args = new Param();
                var fName = $('<%= ContactFirstName.ClientID %>').value;
                var lName = $('<%= ContactLastName.ClientID %>').value;
                args.add('FirstName', fName);
                args.add('LastName', lName);
                _doProjectMgmtCallBack(args);
                return false;
            }
            else {
                if ($('UserIdField').value != '') {
                    showConfirmRemoveUser();
                    return false;
                }
                else {
                    return true;
                }
            }
        }

        // Results from server call
        function _handleProjectMgmtCallBack(results, context) {
            var noUser = $('NoUserFound');
            var findUser = $('FindUserLayer');
            var multi = $('MultiFindUser');
            var single = $('SingleFindUser');
            var removeUser = $('RemoveUserTable');

            if (results && results != '') {
                var multiBody = multi.tag('TBODY')[0];

                // Clear respecitve containers for data
                multiBody.clear();

                var rawArray = eval(results);
                var userList = new DataTable(rawArray, ['UserId', 'FirstName', 'LastName', 'Email']);

                var isMultiUser = userList.length > 1;
                var baseLink = document.createElement('A');
                for (var i = 0; i < userList.length; i++) {
                    var user = userList[i];
                    var uid = user['UserId'];
                    var email = user['Email'];

                    // 1 User Found
                    if (!isMultiUser) {
                        showMessageLayer('SingleFindUser');

                        var uCell = $('SingleFindUserId');
                        var eCell = $('SingleFindUserEmail');
                        uCell.innerHTML = uid;
                        eCell.innerHTML = email;
                    }
                    // Multiple Users
                    else {
                        showMessageLayer('MultiFindUser');

                        var row = multiBody.insertRow(i);
                        var uCell = row.insertCell(0);
                        var eCell = row.insertCell(1);
                        var sCell = row.insertCell(2);

                        uCell.innerHTML = uid;
                        eCell.innerHTML = email;

                        var copyLink = $(baseLink.cloneNode(true));
                        copyLink.className = 'SelectUserLink';
                        copyLink.innerHTML = 'choose';
                        copyLink.addEvent('click', curry(doYesClick, uid));
                        copyLink.addEvent('click', closeFindUser);
                        sCell.appendChild(copyLink);
                    }
                }
            }
            else { showMessageLayer('NoUserFound'); }
        }

        function setUserIdField(uid) { $('UserIdField').value = uid; }

        function clearUserIdField() {
            var userIdField = $('UserIdField');
            userIdField.value = '';
            return false;
        }

        function showConfirmRemoveUser() { showMessageLayer('RemoveUserTable'); }

        function closeFindUser() { $('FindUserLayer').hide(); return false; }

        function DataTable(table, colNames) {
            var serialized = new Array();
            for (var i = 0; i < table.length; i++) {
                var row = new Object();
                for (var j = 0; j < colNames.length; j++) {
                    var colName = colNames[j];
                    row[colName] = table[i][j];
                }
                serialized.push(row);
            }
            return serialized;
        }

        // When user clicks save, determine if need to prompt
        function handleSaveClick(e) {
            if (needConfirmUser()) { return doUserCheck(e); }
            else { return true; }
        }

        // Clear UserId field, and save record
        function doNoClick() {
            clearUserIdField();
            _doContactSave();
            return false;
        }

        // Update user field and submit form
        function doYesClick(id) {
            setUserIdField(id);
            if (_doContactSave) { _doContactSave(); }
            return false;
        }
    </script>

    <style type="text/css">
        h3
        {
            font-weight: bold; 
            font-size: 12px;
            margin-bottom: 3px;
        }
        .gridView
        {
            table-layout: fixed;
            width: 95%;
            margin-bottom: 10px;
        }
        .HiddenRow
        {
            display: none;
        }
        .VisibleRow
        {
            display: table-row;
        }
        .HeaderTable
        {
            margin: auto;
            width: 100%;
            border: 1px solid #cccccc;
        }
        .HeaderTable span
        {
            font-weight: bold;
            font-size: 13px;
            margin: 7px;
            text-align: left;
        }
        #ContentTableHolder
        {
            margin: auto;
        }
        .ContentTable
        {
            margin: 20px;
            table-layout: fixed;
            width: 90%;
            cursor: pointer;
        }
        .ContentTable span
        {
            display: block;
            margin: 2px auto 2px 10px;
            white-space: normal;
        }
        .LabelStyle
        {
            border: 0px;
            background-color: #f8fafc;
        }
        .Footer
        {
            white-space: nowrap;
        }
        .DataEntryLabelCol
        {
            padding-right: 10px;
            text-align: right;
            width: 50%;
            vertical-align: top;
        }
        .LabelCol
        {
            width: 125px;
        }
        .DeleteBtnCol
        {
            padding-left: 5px;
            padding-right: 5px;
            text-align: center;
        }
        .VisibleEntryBtn
        {
            display: auto;
            vertical-align: middle;
            cursor: pointer;
        }
        .HiddenEntryBtn
        {
            display: none;
        }
        .RequiredFieldValidator
        {
            display: block;
        }
        #BtnContainer
        {
            width: 260px;
            margin: 15px auto auto auto;
        }
        #BtnContainer input
        {
            margin: auto 4px auto 4px;
            display: block;
            float: left;
        }
        .EnabledBtn
        {
            cursor: pointer;
        }
        .DisabledBtn
        {
            cursor: default;
        }
        #FindUserLayer
        {
            position: absolute;
            left: 25%;
            width: 50%;
            background-color: #ffffff;
            border: 1px solid #333333;
            z-index: 3000;
        }
        .FindTable
        {
            table-layout: fixed;
            margin: auto;
            width: 100%;
            text-align: center;
            padding: 5px auto 5px auto;
        }
        .FindTable button
        {
            width: 50px;
            border: 1px solid #333333;
            color: #000000;
            text-align: center;
        }
        .FindTable thead
        {
            text-align: center;
            font-weight: bold;
        }
        .FindTableHeader
        {
            background-color: #660000;
            color: #ffffff;
            border: 1px solid #333333;
        }
        .SelectUserLink
        {
            cursor: pointer;
            font-weight: bold;
            text-align: center;
            text-decoration: underline;
        }
        #NoUserFound
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="dataForm" runat="server">
    <cic:CaisisHidden Field="ContactId" Table="Contact" ID="ContactIdField" runat="server" />
    <asp:HiddenField ID="hiddenAddContact" runat="server" />
    <!-- View Of Contact Details -->
    <div runat="server" id="DisplayContactPanel" style="border: 1px solid #cccccc; width: auto;">
        <!-- Contact Title -->
        <asp:Label runat="server" ID="DetailsHeader" CssClass="ProjMgrDetailsHeader">
            <asp:Label runat="server" ID="FirstName"></asp:Label>&nbsp;<asp:Label runat="server"
                ID="LastName"></asp:Label>
        </asp:Label>
        <!-- Contact Info -->
        <div id="OverflowContainer" style="overflow: auto; border: 1px solid #cccccc; background: #ffffff;">
            <div runat="server" id="ViewContactInfo" style="padding: 10px; height: 300px; overflow: auto;
                padding-right: 20px; margin-bottom: 10px;">
                <div style="font-weight: bold; font-size: 12px; display: none;">
                    Organization(s)</div>
                <asp:Repeater runat="server" ID="OrgViewList">
                    <ItemTemplate>
                        <div style="font-weight: bold; color: #00668d; font-size: 15px;">
                            <%# Eval("Name")%>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <!-- Contact Department and Occupation -->
                <div style="margin-top: 5px; font-size: 13px;">
                    <asp:Label runat="server" ID="Department"></asp:Label>
                </div>
                <!-- Contact Information (Address, Assistant, etc..) -->
                <table style="table-layout: fixed; width: 90%; margin-top: 15px;" cellpadding="0"
                    cellspacing="0">
                    <tr>
                        <td class="LabelCol" style="height: 18px;">
                            Address
                        </td>
                        <td class="ValueCol">
                            <asp:Label runat="server" ID="Address1" Style="display: block;"></asp:Label>
                            <asp:Label runat="server" ID="Address2" Style="display: block;"></asp:Label>
                            <asp:Label runat="server" ID="City"></asp:Label>,
                            <asp:Label runat="server" ID="State"></asp:Label>
                            <asp:Label runat="server" ID="PostalCode"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <!-- List of Contact Details -->
                            <table id="ContactDetailsTable" style="width: 100%;" cellpadding="0" cellspacing="0">
                                <asp:Repeater runat="server" ID="ContactDetailsRptr">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="LabelCol">
                                                <%# Eval("Type") %>
                                            </td>
                                            <td class="ValueCol">
                                                <%# Eval("ContactData")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol" style="padding-top: 25px;">
                            Notes
                        </td>
                        <td class="ValueCol" style="padding-top: 25px;">
                            <asp:Label runat="server" ID="Notes"></asp:Label>
                        </td>
                    </tr>
                </table>
                <cic:CaisisSelect TabIndex="14" ShowLabel="false" FieldLabel="New Organizations"
                    Table="ProjectOrganization" Field="Name" runat="server" ID="ContactProjOrgName"
                    DataTextField="Name" DataValueField="OrganizationId" Visible="false" />
            </div>
            <table class="ProjectMgmtBtnContainer">
                <tr>
                    <td style="padding-bottom: 20px;">
                        <project:ProjectMgmtButton runat="server" ID="DeleteContactButton" UserTypeNames="ModuleAdmin"
                            ImageUrl="Images/Button_Delete.gif" ToolTip="Delete Contact" OnCommand="DeleteClick"
                            OnClientClick="return deleteContact();" Style="margin-right: 20px;" />
                        <project:ProjectMgmtButton runat="server" ID="ShowEditBtn" ImageUrl="Images/Button_Edit.gif"
                            ToolTip="Edit Contact" Style="margin-right: 20px;" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <!-- Editable Contacts Record -->
    <asp:Panel runat="server" ID="EditContactPanel">
        <div id="OverflowPanel" class="OverflowPanel" style="background-color: #ffffff; height: 300px;
            overflow: auto;">
            <asp:Panel ID="EditPanel" runat="server" Style="z-index: 2002; position: relative;">
                <cic:CaisisHidden Field="UserId" Table="Contact" ID="UserIdField" runat="server" />
                <!-- Layer to Find User -->
                <div id="FindUserLayer" style="display: none;">
                    <!-- Formatting for Multiple Users -->
                    <table id="MultiFindUser" class="FindTable" style="display: none;">
                        <thead>
                            <tr>
                                <td colspan="3" style="text-align: center;" class="FindTableHeader">
                                    Users Found
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    User Id
                                </td>
                                <td>
                                    User Email
                                </td>
                                <td>
                                    Select User
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="3">
                                    <button onclick="return doNoClick();" style="width: 80%;">
                                        Continue without assigning user to a Contact.
                                    </button>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                    <!-- Formatting for a Single User -->
                    <table id="SingleFindUser" class="FindTable" style="display: none;">
                        <thead>
                            <tr>
                                <td colspan="2" class="FindTableHeader">
                                    User Found
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2">
                                    The following user was found, would you like to assign this User?
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    User Id
                                </td>
                                <td id="SingleFindUserId">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    User Email
                                </td>
                                <td id="SingleFindUserEmail">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button onclick="return doYesClick(getNodeValue( $('SingleFindUserId') ));">
                                        Yes</button>
                                </td>
                                <td>
                                    <button onclick="return doNoClick();">
                                        No</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- No User Found -->
                    <table id="NoUserFound" class="FindTable" style="display: none;">
                        <thead>
                            <tr>
                                <td colspan="2" class="FindTableHeader">
                                    No User Found
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2">
                                    Would you like to continue without assigning this contact to a user?
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button onclick="return doYesClick('');">
                                        Yes</button>
                                </td>
                                <td>
                                    <button onclick="return closeFindUser();">
                                        No</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- Confirm Remove Assign to User -->
                    <table id="RemoveUserTable" class="FindTable" style="display: none;">
                        <thead>
                            <tr>
                                <td colspan="2" class="FindTableHeader">
                                    Remove User Association
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2">
                                    There is currently a User assigned to this Contact, remove association?
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button onclick="return doYesClick('');">
                                        Yes</button>
                                </td>
                                <td>
                                    <button onclick="_doContactSave(); return false;">
                                        No</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <table style="width: 90%; margin: 10px auto auto auto;">
                    <tr>
                        <td class="DataEntryLabelCol">
                            <span class="pdFormFieldLabelRequired">First Name</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisTextBox TabIndex="1" Required="true" ShowLabel="false" Table="Contact"
                                Field="FirstName" MaxLength="50" runat="server" ID="ContactFirstName" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ContactFirstName"
                                CssClass="RequiredFieldValidator" ErrorMessage="Required" ValidationGroup="NameGroup"></asp:RequiredFieldValidator>
                        </td>
                        <td class="DataEntryLabelCol">
                            <span>Title</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisComboBox TabIndex="10" ShowLabel="false" Table="Contact" Field="Title"
                                runat="server" MaxLength="100" ID="ContactTitle" LookupCode="ContactTitle" />
                        </td>
                    </tr>
                    <tr>
                        <td class="DataEntryLabelCol">
                            <span class="pdFormFieldLabelRequired">Last Name</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisTextBox TabIndex="2" Required="true" ShowLabel="false" Table="Contact"
                                Field="LastName" MaxLength="50" runat="server" ID="ContactLastName" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ContactLastName"
                                CssClass="RequiredFieldValidator" ErrorMessage="Required" ValidationGroup="NameGroup"></asp:RequiredFieldValidator>
                        </td>
                        <td class="DataEntryLabelCol">
                            <span>Degree</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisComboBox TabIndex="11" ShowLabel="false" Table="Contact" Field="Degree"
                                runat="server" MaxLength="50" ID="ContactDegree" LookupCode="ContactDegree" />
                        </td>
                    </tr>
                    <tr>
                        <td class="DataEntryLabelCol">
                            <span>
                                <label for="UserCheck">
                                    Contact Is User</label></span>
                        </td>
                        <td>
                            <asp:CheckBox runat="server" ID="UserCheck" />
                        </td>
                        <td class="DataEntryLabelCol">
                            <span>
                                <label for="ContactType">
                                    Contact Type</label></span>
                        </td>
                        <td>
                            <cic:CaisisComboBox runat="server" ID="ContactType" Enabled="False" ShowLabel="false"
                                Table="Contact" Field="ContactType" LookupDistinct="Contact;ContactType;ContactType">
                            </cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="DataEntryLabelCol">
                            <span>Address 1</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisTextBox TabIndex="3" ShowLabel="false" Table="Contact" Field="Address1"
                                runat="server" MaxLength="50" ID="ContactAddress1" />
                        </td>
                        <td class="DataEntryLabelCol">
                            <span>Department</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisComboBox TabIndex="12" ShowLabel="false" Table="Contact" Field="Department"
                                runat="server" MaxLength="50" ID="ContactDepartment" LookupCode="ContactDepartment" />
                        </td>
                    </tr>
                    <tr>
                        <td class="DataEntryLabelCol">
                            <span>Address 2</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisTextBox TabIndex="4" ShowLabel="false" Table="Contact" Field="Address2"
                                runat="server" MaxLength="50" ID="ContactAddress2" />
                        </td>
                        <td class="DataEntryLabelCol">
                            <span>Notes</span>
                        </td>
                        <td rowspan="3">
                            <cic:CaisisTextArea TabIndex="14" ShowLabel="false" Table="Contact" Field="Notes"
                                runat="server" MaxLength="1000" ID="ContactNotes" />
                        </td>
                    </tr>
                    <tr>
                        <td class="DataEntryLabelCol">
                            <span>City</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisTextBox TabIndex="5" ShowLabel="false" Table="Contact" Field="City" runat="server"
                                ID="ContactCity" MaxLength="50" />
                        </td>
                    </tr>
                    <tr>
                        <td class="DataEntryLabelCol">
                            <span>State</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisComboBox TabIndex="6" ShowLabel="false" Table="Contact" Field="State"
                                runat="server" ID="ContactState" MaxLength="50" LookupCode="State" />
                        </td>
                    </tr>
                    <tr>
                        <td class="DataEntryLabelCol">
                            <span>Postal Code</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisTextBox TabIndex="7" ShowLabel="false" Table="Contact" Field="Postalcode"
                                runat="server" MaxLength="50" ID="ContactPostalcode" />
                        </td>
                    </tr>
                    <tr>
                        <td class="DataEntryLabelCol">
                            <span>Country</span>
                        </td>
                        <td style="vertical-align: top;">
                            <cic:CaisisComboBox TabIndex="8" ShowLabel="false" Table="Contact" Field="Country"
                                runat="server" ID="ContactCountry" MaxLength="50" LookupCode="Country" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <!-- Associated Organizations -->
            <div class="GridContainer" style="margin-top: 30px; position: relative; z-index: 2001;">
                <asp:Panel runat="server" ID="NoRecordPanel" Visible="false" Style="text-align: center;
                    font-weight: bold;">
                    Please create a new Contact before adding Organization(s) and Contact Method(s)</asp:Panel>
                <h3>Organization(s)</h3>
                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                    <tr>
                        <td class="ProjMgrListHeaderSmall" style="width: 50%;">
                            <span style="cursor: pointer;">Name</span>
                        </td>
                        <td class="ProjMgrListHeaderSmall" style="width: 33%;">
                            <span style="cursor: pointer;">Contact's Role in Organization</span>
                        </td>
                        <td class="ProjMgrListHeaderSmall" style="width: 17%;">
                            <span style="cursor: pointer;">Delete</span>
                        </td>
                        <!-- END: Column List -->
                    </tr>
                </table>
                <Custom:ExtendedGridView HeaderStyle-BorderStyle="None" CssClass="gridView" runat="server"
                    GridLines="None" ID="OrgGrid2" TableName="ProjectOrganization_ProjectContact"
                    BorderColor="#cccccc" DataKeyNames="OrganizationContactId,OrganizationId,ContactId"
                    AutoGenerateColumns="false" ShowHeader="false" ShowFooter="false" OnRowDeleted="OrgGridRecordDelete"
                    OnRowUpdating="AddContactTypeOnUpdate" OnPreRender="HandleOrgBound" BlankRowCssClass="HiddenRow"
                    VisibleBlankRows="1" Width="100%" BorderWidth="1" Style="margin-bottom: 0px;">
                    <Columns>
                        <Custom:ExtendedTemplateField ItemStyle-Width="45%" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <cic:CaisisHidden runat="server" Table="ProjectOrganization_ProjectContact" Field="ContactType"
                                    Value="0">
                                </cic:CaisisHidden>
                                <cic:CaisisSelect ID="OrgSel" runat="server" Table="ProjectOrganization_ProjectContact"
                                    Field="OrganizationId" ShowLabel="false" Width="80%" DataTextField="Name" DataValueField="OrganizationId">
                                </cic:CaisisSelect>
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField ItemStyle-Width="40%">
                            <ItemTemplate>
                                <cic:CaisisComboBox ID="CaisisComboOrgRole" runat="server" Table="ProjectOrganization_ProjectContact"
                                    Field="OrganizationRole" MaxLength="100" ShowLabel="false" Width="80%" LookupCode="ContactTitle">
                                </cic:CaisisComboBox>
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField ItemStyle-Width="15%">
                            <ItemTemplate>
                                <asp:ImageButton ID="OrgDelBtn" runat="server" ImageUrl="~/Images/iconDelete.gif"
                                    CommandName="Delete" OnClientClick="return confirmDelete();" AlternateText="Delete This Associated Organization" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                    </Columns>
                </Custom:ExtendedGridView>
                <asp:ImageButton ID="buttonAddNewOrg" runat="server" ImageUrl="../../Images/AddNewOrganizatiion.PNG"
                    CausesValidation="false" OnClick="ImageButton1_Click" OnClientClick="return showAddNewRow(this,'OrgGrid2');" />
            </div>
            <div class="GridContainer" style="margin-top: 30px; position: relative; z-index: 2000;">
                <h3>
                    Contact Methods</h3>
                <!-- Contact Methods -->
                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                    <tr>
                        <!-- START: Column List - Columns should add upto 50% -->
                        <td class="ProjMgrListHeaderSmall" style="width: 20%;">
                            <span style="cursor: pointer;">Type</span>
                        </td>
                        <td class="ProjMgrListHeaderSmall" style="width: 20%;">
                            <span style="cursor: pointer;">Details</span>
                        </td>
                        <td class="ProjMgrListHeaderSmall" style="width: 20%;">
                            <span style="cursor: pointer;">Priority</span>
                        </td>
                        <td class="ProjMgrListHeaderSmall" style="width: 30%;">
                            <span style="cursor: pointer;">Notes</span>
                        </td>
                        <td class="ProjMgrListHeaderSmall" style="width: 10%;">
                            <span style="cursor: pointer; text-align: center;">Delete</span>
                        </td>
                        <!-- END: Column List -->
                    </tr>
                </table>
                <Custom:ExtendedGridView TableName="ContactMethod" CssClass="gridView" BorderWidth="1"
                    BorderColor="#cccccc" GridLines="None" HeaderStyle-CssClass="dataGridHeader"
                    runat="server" ID="ContactMethodGridView" AutoGenerateColumns="false" ShowFooter="false"
                    OnRowDeleted="ContactMethodRecordDeleted" BlankRowCssClass="HiddenRow" BlankRows="3"
                    VisibleBlankRows="1" ShowHeader="false" Width="100%" Style="margin-bottom: 0px;">
                    <Columns>
                        <Custom:ExtendedTemplateField ItemStyle-Width="20%" ItemStyle-VerticalAlign="Top"
                            FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisComboBox Width="100px" FieldLabel="Type" ShowLabel="false" runat="server"
                                    ID="NewContactMethodType" Table="ContactMethod" Field="Type" MaxLength="50" LookupCode="ContactMethodType" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <cic:CaisisSelect Width="40" FieldLabel="Type" ShowLabel="false" runat="server" ID="NewContactMethodTypeFooter"
                                    Table="ContactMethod" Field="Type" LookupCode="ContactMethodType" />
                            </FooterTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top"
                            ItemStyle-Width="18%">
                            <ItemTemplate>
                                <cic:CaisisTextBox Width="100" FieldLabel="Details" ShowLabel="false" runat="server"
                                    ID="NewContactMethodDetails" Table="ContactMethod" Field="ContactData" MaxLength="50" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <cic:CaisisTextBox Width="100" FieldLabel="Details" ShowLabel="false" runat="server"
                                    ID="NewContactMethodDetailsFooter" Table="ContactMethod" Field="ContactData"
                                    MaxLength="50" />
                            </FooterTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top"
                            ItemStyle-Width="18%">
                            <ItemTemplate>
                                <cic:CaisisSelect Width="100" FieldLabel="Priority" ShowLabel="false" runat="server"
                                    ID="NewContactMethodPriority" Table="ContactMethod" Field="Priority">
                                    <asp:ListItem Text="1" Value="1" />
                                    <asp:ListItem Text="2" Value="3" />
                                    <asp:ListItem Text="4" Value="4" />
                                    <asp:ListItem Text="5" Value="5" />
                                    <asp:ListItem Text="6" Value="6" />
                                    <asp:ListItem Text="7" Value="7" />
                                    <asp:ListItem Text="8" Value="8" />
                                    <asp:ListItem Text="9" Value="9" />
                                    <asp:ListItem Text="10" Value="10" />
                                </cic:CaisisSelect>
                            </ItemTemplate>
                            <FooterTemplate>
                                <cic:CaisisTextBox Width="100" FieldLabel="Priority" ShowLabel="false" runat="server"
                                    ID="NewContactMethodPriorityFooter" Table="ContactMethod" Field="Priority" />
                            </FooterTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Notes" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top"
                            ItemStyle-Width="37%">
                            <ItemTemplate>
                                <cic:CaisisTextArea Width="220" Height="40" FieldLabel="Notes" ShowLabel="false"
                                    runat="server" ID="NewContactMethodNotes" Table="ContactMethod" Field="Notes"
                                    MaxLength="1000" ShowTextEditor="true" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <cic:CaisisTextArea Width="220" Height="40" FieldLabel="Notes" ShowLabel="false"
                                    runat="server" ID="NewContactMethodNotesFooter" Table="ContactMethod" Field="Notes"
                                    MaxLength="1000" ShowTextEditor="true" />
                            </FooterTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField ItemStyle-Width="7%">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/iconDelete.gif"
                                    CommandName="Delete" OnClientClick="return confirmDelete();" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                    </Columns>
                </Custom:ExtendedGridView>
                <asp:ImageButton ID="buttonAddNewContactMethod" runat="server" ImageUrl="../../Images/AddNewOrganizatiion.PNG"
                    CausesValidation="false" OnClick="AddNewContactMethod_Click" OnClientClick="return showAddNewRow(this,'ContactMethodGridView');" />
            </div>
            <div class="GridContainer" style="margin-top: 30px; position: relative; z-index: 1999;">
                            <%-- rendered calendar --%>
                <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

                <h3>
                    Regulatory Details</h3>
                <Custom:ExtendedGridView TableName="ContactRegulatoryDetail" CssClass="gridView"
                    BorderWidth="1" BorderColor="#cccccc" GridLines="None" HeaderStyle-CssClass="dataGridHeader"
                    runat="server" ID="ContactDocumentsGrid" AutoGenerateColumns="false" ShowFooter="false"
                    RebindOnDelete="true" BlankRowCssClass="HiddenRow" VisibleBlankRowCssClass="VisibleRow"
                    BlankRows="3" VisibleBlankRows="1" ShowHeader="true" Width="100%" Style="margin-bottom: 0px;"
                    OnRowDataBound="SetShortDateFields">
                    <Columns>
                        <Custom:ExtendedTemplateField HeaderText="Approval Date" HeaderStyle-CssClass="ProjMgrListHeaderSmall"
                            HeaderStyle-Width="110px" ItemStyle-Width="110px" ItemStyle-VerticalAlign="Top"
                            FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="RegDocApprovalDateField" Width="75px" FieldLabel="Path" ShowLabel="false"
                                    runat="server" Table="ContactRegulatoryDetail" Field="RegDocApprovalDate" ShowCalendar="true"
                                    CalcDate="false"></cic:CaisisTextBox>
                                <asp:RangeValidator runat="server" ControlToValidate="RegDocApprovalDateField" MaximumValue="<%# DateTime.MaxValue.ToShortDateString() %>"
                                    MinimumValue="<%# DateTime.MinValue.ToShortDateString() %>" Type="Date" ErrorMessage="* Please enter a valid date."
                                    Display="Dynamic" SetFocusOnError="true">*</asp:RangeValidator>
                            </ItemTemplate>
                            <FooterTemplate>
                                <cic:CaisisTextBox ID="RegDocApprovalDateField" Width="75px" FieldLabel="Path" ShowLabel="false"
                                    runat="server" Table="ContactRegulatoryDetail" Field="RegDocApprovalDate" ShowCalendar="true"
                                    CalcDate="false"></cic:CaisisTextBox>
                                <asp:RangeValidator runat="server" ControlToValidate="RegDocApprovalDateField" MaximumValue="<%# DateTime.MaxValue.ToShortDateString() %>"
                                    MinimumValue="<%# DateTime.MinValue.ToShortDateString() %>" Type="Date" ErrorMessage="* Please enter a valid date."
                                    Display="Dynamic" SetFocusOnError="true">*</asp:RangeValidator>
                            </FooterTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Expiration Date" HeaderStyle-CssClass="ProjMgrListHeaderSmall"
                            HeaderStyle-Width="110px" ItemStyle-Width="110px" ItemStyle-VerticalAlign="Top"
                            FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="RegDocExpirationDateField" Width="75px" FieldLabel="Path" ShowLabel="false"
                                    runat="server" Table="ContactRegulatoryDetail" Field="RegDocExpirationDate" ShowCalendar="true"
                                    CalcDate="false"></cic:CaisisTextBox>
                                <asp:RangeValidator ID="valRange" runat="server" ControlToValidate="RegDocExpirationDateField"
                                    MaximumValue="<%# DateTime.MaxValue.ToShortDateString() %>" MinimumValue="<%# DateTime.MinValue.ToShortDateString() %>"
                                    Type="Date" ErrorMessage="* Please enter a valid date." Display="Dynamic" SetFocusOnError="true">*</asp:RangeValidator>
                            </ItemTemplate>
                            <FooterTemplate>
                                <cic:CaisisTextBox ID="RegDocExpirationDateField" Width="75px" FieldLabel="Path" ShowLabel="false"
                                    runat="server" Table="ContactRegulatoryDetail" Field="RegDocExpirationDate" ShowCalendar="true"
                                    CalcDate="false"></cic:CaisisTextBox>
                                <asp:RangeValidator ID="valRange" runat="server" ControlToValidate="RegDocExpirationDateField"
                                    MaximumValue="<%# DateTime.MaxValue.ToShortDateString() %>" MinimumValue="<%# DateTime.MinValue.ToShortDateString() %>"
                                    Type="Date" ErrorMessage="* Please enter a valid date."
                                    Display="Dynamic" SetFocusOnError="true">*</asp:RangeValidator>
                            </FooterTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Type" HeaderStyle-CssClass="ProjMgrListHeaderSmall">
                            <ItemTemplate>
                                <cic:CaisisTextBox runat="server" ID="RegDocTypeField" ShowLabel="false" Table="ContactRegulatoryDetail"
                                    Field="RegDocType" Width="90%"></cic:CaisisTextBox>
                            </ItemTemplate>
                            <FooterTemplate>
                                <cic:CaisisTextBox ID="RegDocTypeField" runat="server" ShowLabel="false" Table="ContactRegulatoryDetail"
                                    Field="RegDocType" Width="90%"></cic:CaisisTextBox>
                            </FooterTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Name" HeaderStyle-CssClass="ProjMgrListHeaderSmall">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="RegDocNameField" runat="server" ShowLabel="false" Table="ContactRegulatoryDetail"
                                    Field="RegDocName" Width="90%"></cic:CaisisTextBox>
                            </ItemTemplate>
                            <FooterTemplate>
                                <cic:CaisisTextBox ID="RegDocNameField" runat="server" ShowLabel="false" Table="ContactRegulatoryDetail"
                                    Field="RegDocName" Width="90%"></cic:CaisisTextBox>
                            </FooterTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Location" HeaderStyle-CssClass="ProjMgrListHeaderSmall">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="RegDocLocationField" runat="server" ShowLabel="false" Table="ContactRegulatoryDetail"
                                    Field="RegDocLocation" Width="90%"></cic:CaisisTextBox>
                            </ItemTemplate>
                            <FooterTemplate>
                                <cic:CaisisTextBox ID="RegDocLocationField" runat="server" ShowLabel="false" Table="ContactRegulatoryDetail"
                                    Field="RegDocLocation" Width="90%"></cic:CaisisTextBox>
                            </FooterTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Notes" HeaderStyle-CssClass="ProjMgrListHeaderSmall"
                            HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="RegDocNotesField" runat="server" ShowLabel="false" Table="ContactRegulatoryDetail"
                                    Field="RegDocNotes" ShowTextEditor="true" Width="115px"></cic:CaisisTextBox>
                            </ItemTemplate>
                            <FooterTemplate>
                                <cic:CaisisTextBox ID="RegDocNotesField" runat="server" ShowLabel="false" Table="ContactRegulatoryDetail"
                                    Field="RegDocNotes" ShowTextEditor="true" Width="115px"></cic:CaisisTextBox>
                            </FooterTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:GridRowDeleteImage HeaderStyle-CssClass="ProjMgrListHeaderSmall" HeaderStyle-Width="50px"
                            ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        </Custom:GridRowDeleteImage>
                    </Columns>
                </Custom:ExtendedGridView>
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="../../Images/AddNewOrganizatiion.PNG"
                    CausesValidation="false" OnClientClick="return showAddNewRow(this,'ContactDocumentsGrid');" />
            </div>
        </div>
        <!-- Data Entry Buttons -->
        <div id="DataEntryButtons">
            <project:ProjectMgmtButton runat="server" ID="BtnDelete" ImageUrl="Images/Button_Delete.gif"
                UserTypeNames="ModuleAdmin" OnCommand="DeleteClick" OnClientClick="return deleteContact();"
                ToolTip="Delete Contact" Style="margin-right: 20px;" />
            <project:ProjectMgmtButton runat="server" ID="CancelBtn" OnClientClick="top.hideModal();"
                ImageUrl="Images/Button_Cancel.gif" ToolTip="Cancel" Style="margin-right: 20px;" />
            <project:ProjectMgmtButton runat="server" ID="BtnSave" ImageUrl="Images/Button_Save.gif"
                OnClientClick="return handleSaveClick(event);" OnCommand="SaveClick" ToolTip="Save Contact"
                CausesValidation="false" ValidationGroup="NameGroup" />
        </div>
    </asp:Panel>
    </form>
</body>
</html>
