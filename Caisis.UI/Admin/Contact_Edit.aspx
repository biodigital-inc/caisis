<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact_Edit.aspx.cs" Inherits="Caisis.UI.Admin.Contact_Edit" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit Dataset</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../ClientScripts/DynamicControls.js"></script>
    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */


        jQuery.noConflict();

        jQuery(document).ready(function() {
 

        });
        
        function deleteContact() {
            return confirmDelete();
        }
        
        function editContact(contactId) {
            top.showModalWithConfig('Contact_Edit.aspx?edit=true&contactId=' + contactId + '&organizationId=<%= Request.QueryString["organizationId"] %>', 'Edit Contact', { width: 650, height: 400, context: window });
            return false;
        }
        
       function reloadMainPage(isDelete) {
           var modal = top.getModalCallingWindow();
           var mainFrame = modal;
           if (isDelete) {
               mainFrame = modal ? modal.parent : window.parent;
           }
           if (mainFrame) {
               mainFrame.location = mainFrame.location;
               top.hideModal();
           }
        }

        /* ]]> */
    </script>

    <style type="text/css">


        input[type="text"], select
        {
            min-width: 150px;
        }
        .pdFormFieldLabelRequired
        {
            text-align: left;
        }
        .buttons
        {
            text-align: center;
            margin: 10px auto;
        }
        .buttons input
        {
            width: 80px;
            margin: auto 5px;
        }
        .buttons .dataEntryButtonGray
        {
            float: right;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
    <div style="width: 90%; margin: auto;">
        <asp:Label ID="ContactTitle" runat="server" CssClass="adminNavHeading"></asp:Label>
        <div id="mainAdminBox" class="adminBox" style="border-color: #e1e1e1;
            -webkit-box-shadow: 0px 0px 10px #ddd; box-shadow: 0px 0px 10px #ddd;">
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;
                max-height: 600px;">
<asp:Panel runat="server" ID="ViewPanel" Visible="true">
    <div runat="server" id="DisplayContactPanel" >
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
        <div class="buttons">
            <asp:Button ID="ShowEditBtn" Text="Edit" runat="server" CssClass="dataEntryButtonRed" />
            <asp:Button ID="DeleteContactButton" Text="Delete" OnClick="DeleteClick" runat="server"
                OnClientClick="return deleteContact();" CssClass="dataEntryButtonGray" />
        </div>
    </div>
 </asp:Panel>
 
     <!-- Edit Panel -->
     <asp:Panel runat="server" ID="EditPanel" Visible="false">
        <table style="width: 90%; margin: 10px auto auto auto;">
            <tr>
                <td class="DataEntryLabelCol">
                    <label for="ContactFirstName" class="pdFormFieldLabelRequired">
                        First Name</label>
                </td>
                <td style="vertical-align: top;">
                    <cic:CaisisTextBox TabIndex="1" Required="true" ShowLabel="false" Table="Contact"
                        Field="FirstName" MaxLength="50" runat="server" ID="ContactFirstName" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ContactFirstName"
                        CssClass="RequiredFieldValidator" ErrorMessage="Required" ValidationGroup="NameGroup"></asp:RequiredFieldValidator>
                </td>
                <td class="DataEntryLabelCol">
                    <label for="ContactTitleField">
                        Title</label>
                </td>
                <td style="vertical-align: top; white-space: nowrap; ">
                    <cic:CaisisComboBox TabIndex="10" ShowLabel="false" Table="Contact" Field="Title"
                        runat="server" MaxLength="100" ID="ContactTitleField" LookupCode="ContactTitle" />
                </td>
            </tr>
            <tr>
                <td class="DataEntryLabelCol">
                    <label for="ContactLastName" class="pdFormFieldLabelRequired">Last Name</label>
                </td>
                <td style="vertical-align: top;">
                    <cic:CaisisTextBox TabIndex="2" Required="true" ShowLabel="false" Table="Contact"
                        Field="LastName" MaxLength="50" runat="server" ID="ContactLastName" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ContactLastName"
                        CssClass="RequiredFieldValidator" ErrorMessage="Required" ValidationGroup="NameGroup"></asp:RequiredFieldValidator>
                </td>
                <td class="DataEntryLabelCol">
                    <label for="ContactDegree">Degree</label>
                </td>
                <td style="vertical-align: top; white-space: nowrap; ">
                    <cic:CaisisComboBox TabIndex="11" ShowLabel="false" Table="Contact" Field="Degree"
                        runat="server" MaxLength="50" ID="ContactDegree" LookupCode="ContactDegree" />
                </td>
            </tr>
            <tr>
                <td class="DataEntryLabelCol" style="white-space: nowrap; ">
                    <label for="ContactUser">
                        User</label>
                </td>
                <td style="white-space: nowrap; ">
                    <cic:CaisisSelect runat="server" ID="ContactUser" ShowLabel="false" Table="Contact"
                        Field="UserId" LookupDistinct="Users;UserId;UserName">
                    </cic:CaisisSelect>
                </td>
                <td class="DataEntryLabelCol" style="white-space: nowrap; ">
                    <span>
                        <label for="ContactType">
                            Contact Type</label></span>
                </td>
                <td style="white-space: nowrap; ">
                    <cic:CaisisComboBox runat="server" ID="ContactType" Enabled="true" ShowLabel="false"
                        Table="Contact" Field="ContactType" LookupDistinct="Contact;ContactType;ContactType">
                    </cic:CaisisComboBox>
                </td>
            </tr>
            <tr>
                <td class="DataEntryLabelCol">
                    <label for="ContactAddress1">Address 1</label>
                </td>
                <td style="vertical-align: top;">
                    <cic:CaisisTextBox TabIndex="3" ShowLabel="false" Table="Contact" Field="Address1"
                        runat="server" MaxLength="50" ID="ContactAddress1" />
                </td>
                <td class="DataEntryLabelCol">
                    <label for="ContactDepartment">Department</label>
                </td>
                <td style="vertical-align: top; white-space: nowrap; ">
                    <cic:CaisisComboBox TabIndex="12" ShowLabel="false" Table="Contact" Field="Department"
                        runat="server" MaxLength="50" ID="ContactDepartment" LookupCode="ContactDepartment" />
                </td>
            </tr>
            <tr>
                <td class="DataEntryLabelCol">
                    <label for="ContactAddress2">Address 2</label>
                </td>
                <td style="vertical-align: top;">
                    <cic:CaisisTextBox TabIndex="4" ShowLabel="false" Table="Contact" Field="Address2"
                        runat="server" MaxLength="50" ID="ContactAddress2" />
                </td>
                <td class="DataEntryLabelCol">
                    <label for="ContactNotes">Notes</label>
                </td>
                <td rowspan="3">
                    <cic:CaisisTextArea TabIndex="14" ShowLabel="false" Table="Contact" Field="Notes"
                        runat="server" MaxLength="1000" ID="ContactNotes" />
                </td>
            </tr>
            <tr>
                <td class="DataEntryLabelCol">
                    <label for="ContactCity">City</label>
                </td>
                <td style="vertical-align: top;">
                    <cic:CaisisTextBox TabIndex="5" ShowLabel="false" Table="Contact" Field="City" runat="server"
                        ID="ContactCity" MaxLength="50" />
                </td>
            </tr>
            <tr>
                <td class="DataEntryLabelCol">
                    <label for="ContactState">State</label>
                </td>
                <td style="vertical-align: top; white-space: nowrap; ">
                    <cic:CaisisComboBox TabIndex="6" ShowLabel="false" Table="Contact" Field="State"
                        runat="server" ID="ContactState" MaxLength="50" LookupCode="State" />
                </td>
            </tr>
            <tr>
                <td class="DataEntryLabelCol">
                    <label for="ContactPostalcode">Postal Code</label>
                </td>
                <td style="vertical-align: top;">
                    <cic:CaisisTextBox TabIndex="7" ShowLabel="false" Table="Contact" Field="Postalcode"
                        runat="server" MaxLength="50" ID="ContactPostalcode" />
                </td>
            </tr>
            <tr>
                <td class="DataEntryLabelCol">
                    <label for="ContactCountry">Country</label>
                </td>
                <td style="vertical-align: top; white-space: nowrap; ">
                    <cic:CaisisComboBox TabIndex="8" ShowLabel="false" Table="Contact" Field="Country"
                        runat="server" ID="ContactCountry" MaxLength="50" LookupCode="Country" />
                </td>
            </tr>
        </table>
         <div class="buttons">
             <asp:Button ID="UpdateBtn" Text="Save" runat="server" CssClass="dataEntryButtonRed"
                 OnClick="SaveClick" />
             <asp:Button ID="DeleteBtn" Text="Delete" runat="server" CssClass="dataEntryButtonGray"
                 OnClick="DeleteClick" OnClientClick="return deleteContact();" Visible="false" />
         </div>
    </asp:Panel>

        </div>






            </div>
        </div>
        
  
    </form>
</body>
</html>
