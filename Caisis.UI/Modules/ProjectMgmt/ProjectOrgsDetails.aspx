<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectOrgsDetails.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectOrgsDetails" %>

<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Organization Details</title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <script type="text/javascript">
    Browser.ResizeElement({ nodeId: 'OverflowContainer', customResizer: setOverFlow });
    
    var PROJECT_LIST_URL = '<%= Page.ResolveUrl("ProjectOrgsProjectsList.aspx") %>';

    function setOverFlow(w,h)
    {
        var overflow = $('OverflowContainer');
        if(overflow) 
        { 
            overflow.style.height = Math.max((getHeight(window) - 50),100) + 'px'; 
        }
    }
    
    function goToProjectList()
    {
        var url = PROJECT_LIST_URL + "?organizationId=" + <%= OrganizationId %>;
        var organization = getNodeValue($('OrganizationFullName'));
        var title = organization + ' Projects';
        return showEditDetailsInModal(url, title,850,650);
    }
    
    function editOrg()
    {
        var url = '<%=Request.RawUrl %>&edit=true';
        return showEditDetailsInModal(url,'Edit Organization',500,380);
    }
    
    function confirmAddOrg()
    {
        $('AddToProjectLayer').show();        
        return false;    
    }
                
    function cancelConfirmAddOrg()    
    {
        $('AddToProjectLayer').hide();
        return false;    
    }
    
    function deleteOrganization()
    {
        return confirmDelete('Are you sure you want to delete this organization?');
    }

    </script>

    <style type="text/css">
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
        .LabelCol
        {
            width: 95px;
        }

        .ContentDetails
        {
            height: auto;
        }
        .ChoiceButton
        {
            margin: auto;
            border: 1px solid #cccccc;
            background-color: #ffffff;
            color: #000000;
            text-alilgn: center;
            width: 75px;
            margin: 10px auto 10px auto;
            font-size: 11px;
        }
        #AddToProjectLayer
        {
            font-weight: bold;
            font-size: 14px;
        }
    </style>
</head>
<body class="ProjectDetails">
    <form id="dataForm" runat="server">
        <asp:HiddenField runat="server" ID="OrgIdField" />
        <table cellpadding="0" cellspacing="0" style="width: 100%; border: solid 1px #cccccc;
            height: 100%;" id="contentTable" runat="server">
            <tr>
                <td>
                    <asp:Label runat="server" ID="DetailsHeader" CssClass="ProjMgrDetailsHeader">
                        <asp:Label runat="server" ID="OrganizationFullName" /></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff;">
                    <!-- Details View -->
                    <div runat="server" id="DetailsViewLayer" style="overflow: auto; padding: 4px; text-align: center;">
                        <table class="ContentDetails" cellpadding="4" style="width: 100%; text-align: left;">
                            <tr>
                                <td class="LabelCol">
                                    Short Name
                                </td>
                                <td class="ValueCol">
                                    <asp:Label runat="server" ID="ShortName"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="LabelCol">
                                    Address
                                </td>
                                <td class="ValueCol">
                                    <asp:Label runat="server" ID="Address1"></asp:Label><br />
                                    <asp:Label runat="server" ID="Address2"></asp:Label><br />
                                    <asp:Label runat="server" ID="City"></asp:Label>,
                                    <asp:Label runat="server" ID="State"></asp:Label>
                                    <asp:Label runat="server" ID="PostalCode"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="LabelCol">
                                    Country
                                </td>
                                <td class="ValueCol">
                                    <asp:Label runat="server" ID="Country"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table class="ProjectMgmtBtnContainer" style="margin-top: 20px; margin-bottom: 10px;">
                            <tr>
                                <td>
                                    <project:ProjectMgmtButton runat="server" ID="DisplayProjectsClick" UserTypeNames="ModuleAdmin"
                                        OnClientClick="goToProjectList(); return false;" ImageUrl="Images/Button_ViewProjects.gif"
                                        ToolTip="View Projects" Style="margin-right: 20px;" />
                                    <project:ProjectMgmtButton runat="server" ID="DeleteOrgButton" UserTypeNames="ModuleAdmin"
                                        ImageUrl="Images/Button_Delete.gif" ToolTip="Delete Organization" OnCommand="DeleteClick"
                                        OnClientClick="return deleteOrganization();" Style="margin-right: 20px;" />
                                    <project:ProjectMgmtButton runat="server" ID="ShowEditBtn" ImageUrl="Images/Button_Edit.gif"
                                        ToolTip="Edit Organization" Style="margin-right: 20px;" OnClientClick="return editOrg();" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- Edit View -->
                    <div style="width: 99%; text-align: left; margin: auto;" runat="server" id="DataEntryLayer">
                        <div id="OverflowContainer" style="padding: 25px auto auto auto; overflow: auto;
                            height: 200px; position: relative;">
                            <table cellpadding="3" cellspacing="0" border="0" style="width: 400px; margin: auto;
                                position: relative;">
                                <tr>
                                    <td>
                                        <cic:CaisisTextBox TabIndex="1" FieldLabel="Name" Table="ProjectOrganization" Field="Name"
                                            runat="server" MaxLength="255" ID="OrgName" Width="241px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="OrgName"
                                            ErrorMessage="Enter A Name"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cic:CaisisTextBox TabIndex="2" FieldLabel="Short Name" Table="ProjectOrganization"
                                            Field="ShortName" runat="server" ID="OrgShortName" MaxLength="50" /></td>
                                </tr>
                                <asp:PlaceHolder ID="CoordinatingCenterPanel" runat="server">
                                    <tr>
                                        <td>
                                            <cic:CaisisCheckBox TabIndex="4" FieldLabel="Coordinating Center" Table="ProjectOrganization"
                                                Field="CoordinatingCenter" runat="server" ID="OrgCoordinatingCenter" /></td>
                                    </tr>
                                </asp:PlaceHolder>
                                <tr>
                                    <td>
                                        <cic:CaisisHidden runat="server" ID="ColorCode" Table="ProjectOrganization" Field="ColorCode"
                                            FieldLabel="Color Code">
                                        </cic:CaisisHidden>
                                        <span style="font-style: italic; padding-left: 5px; display: block; float: left;">Click
                                            color box to change.</span><asp:Panel runat="server" ID="ColorCodeBox" CssClass="ColorCodeBox"
                                                Style="float: left; display: block;" onclick="showColorPicker('ColorCode',this,event);">
                                            </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cic:CaisisTextBox TabIndex="5" FieldLabel="Address 1" Table="ProjectOrganization"
                                            Field="Address1" runat="server" ID="OrgAddress1" MaxLength="50" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <cic:CaisisTextBox TabIndex="6" FieldLabel="Address 2" Table="ProjectOrganization"
                                            Field="Address2" runat="server" ID="OrgAddress2" MaxLength="50" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <cic:CaisisTextBox TabIndex="7" FieldLabel="City" Table="ProjectOrganization" Field="City"
                                            runat="server" ID="OrgCity" MaxLength="50" /></td>
                                </tr>
                                <tr>
                                    <td nowrap>
                                        <cic:CaisisComboBox TabIndex="8" FieldLabel="State" Table="ProjectOrganization" LookupCode="State"
                                            Field="State" runat="server" ID="OrgState" MaxLength="50" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <cic:CaisisTextBox TabIndex="9" FieldLabel="Postal Code" Table="ProjectOrganization"
                                            Field="PostalCode" runat="server" ID="OrgPostalCode" MaxLength="50" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <cic:CaisisComboBox TabIndex="10" FieldLabel="Country" Table="ProjectOrganization"
                                            Field="Country" runat="server" ID="OrgCountry" LookupCode="Country" MaxLength="50" /></td>
                                </tr>
                            </table>
                        </div>
                        <div id="DataEntryButtons">
                            &nbsp;<project:ProjectMgmtButton runat="server" ID="DeleteBtn" UserTypeNames="ModuleAdmin" OnCommand="DeleteClick"
                                OnClientClick="return deleteOrganization();" ImageUrl="Images/Button_Delete.gif"
                                ToolTip="Delete Organization" Style="margin-right: 20px;" />
                            <project:ProjectMgmtButton runat="server" ID="CancelBtn" OnClientClick="top.hideModal();"
                                ImageUrl="Images/Button_Cancel.gif" ToolTip="Cancel" Style="margin-right: 20px;" />
                            <project:ProjectMgmtButton runat="server" ID="SaveBtn" OnClientClick="return confirmAddOrg();"
                                OnPreRender="HandleIsNewProject" OnCommand="SaveClick" ImageUrl="Images/Button_Save.gif"
                                ToolTip="Save Organization" />
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <table runat="server" id="AddToProjectLayer" style="display: none; background-color: #ffffff;
            border: 1px solid #000000; position: absolute; width: 50%; position: absolute;
            bottom: 100px; left: 25%; margin: auto; table-layout: fixed;">
            <tr>
                <td colspan="3" style="text-align: center; padding-top: 10px;">
                    <span>Do you want to assign this Organization to the current Project?</span>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">
                    <asp:Button ID="AddToProjectBtn" CssClass="ChoiceButton" runat="server" OnCommand="HandleAddOrgToProject"
                        CommandArgument="true" Text="Yes" />
                </td>
                <td style="text-align: center;">
                    <asp:Button ID="DoNotAddToProjectBtn" CssClass="ChoiceButton" runat="server" OnCommand="HandleAddOrgToProject"
                        CommandArgument="false" Text="No" />
                </td>
                <td style="text-align: left;">
                    <asp:Button ID="CancelAddToProjectBtn" CssClass="ChoiceButton" runat="server" OnClientClick="return cancelConfirmAddOrg();"
                        Text="Cancel" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
