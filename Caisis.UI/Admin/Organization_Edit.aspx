<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Organization_Edit.aspx.cs"
    Inherits="Caisis.UI.Admin.Organization_Edit" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Organization</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script type="text/javascript" src="../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript">

        function reloadMainPage(isDelete) {
            var mainFrame = top.getModalCallingWindow();
            if (mainFrame) {
                mainFrame.location = mainFrame.location;
                top.hideModal();
            }
        }
        
    </script>

    <style type="text/css">
        .DataEntryLabelCol
        {
            width: 125px;
        }
        .pdFormFieldLabelRequired
        {
            text-align: left;
        }
        table input[type="text"]
        {
            width: 200px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 90%; margin: auto;">
        <div id="mainAdminBox" class="adminBox" style="border-color: #e1e1e1; -webkit-box-shadow: 0px 0px 10px #ddd;
            box-shadow: 0px 0px 10px #ddd;">
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;
                max-height: 600px;">
                <!-- Edit Panel -->
                <asp:Panel runat="server" ID="EditPanel">
                    <table style="width: 90%; margin: 10px auto auto auto;">
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="OrganizationName" class="pdFormFieldLabelRequired">
                                    Name</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisTextBox Required="true" ShowLabel="false" Table="ProjectOrganization"
                                    Field="Name" runat="server" ID="OrganizationName" />
                                <asp:RequiredFieldValidator ID="RequireName" runat="server" ControlToValidate="OrganizationName"
                                    CssClass="RequiredFieldValidator" ErrorMessage="Required" ValidationGroup="NameGroup"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="ShortName">
                                    Short Name</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisTextBox ShowLabel="false" Table="ProjectOrganization" Field="ShortName"
                                    runat="server" ID="ShortName" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="OrgNum">
                                    Site Id</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisTextBox ShowLabel="false" Table="ProjectOrganization" Field="OrgNum" runat="server"
                                    ID="OrgNum" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="Address1">
                                    Address 1</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisTextBox ShowLabel="false" Table="ProjectOrganization" Field="Address1"
                                    runat="server" ID="Address1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="Address2">
                                    Address 2</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisTextBox ShowLabel="false" Table="ProjectOrganization" Field="Address2"
                                    runat="server" ID="Address2" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="City">
                                    City</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisTextBox ShowLabel="false" Table="ProjectOrganization" Field="City" runat="server"
                                    ID="City" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="State">
                                    State</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisComboBox ShowLabel="false" Table="ProjectOrganization" Field="State" runat="server"
                                    ID="State" LookupCode="State" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="Country">
                                    Country</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisComboBox ShowLabel="false" Table="ProjectOrganization" Field="Country"
                                    runat="server" ID="Country" LookupCode="Country" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="PostalCode">
                                    Postal Code</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisTextBox ShowLabel="false" Table="ProjectOrganization" Field="PostalCode"
                                    runat="server" ID="PostalCode" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="ColorCode">
                                    Color Code</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisTextBox ShowLabel="false" Table="ProjectOrganization" Field="ColorCode"
                                    runat="server" ID="ColorCode" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DataEntryLabelCol">
                                <label for="CoordinatingCenter">
                                    Coordinating Center</label>
                            </td>
                            <td style="vertical-align: top;">
                                <cic:CaisisCheckBox ShowLabel="false" Table="ProjectOrganization" Field="CoordinatingCenter"
                                    runat="server" ID="CoordinatingCenter" />
                            </td>
                        </tr>
                    </table>
                    <div class="buttons">
                        <asp:Button ID="UpdateBtn" Text="Save" runat="server" CssClass="dataEntryButtonRed"
                            OnClick="SaveClick" />
                        <asp:Button ID="DeleteBtn" Text="Delete" runat="server" CssClass="dataEntryButtonGray"
                            OnClick="DeleteClick" OnClientClick="return confirmDelete();" Visible="false" style="float: right;" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
