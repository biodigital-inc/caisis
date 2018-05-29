<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditAssociatedOrganizations.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.EditAssociatedOrganizations" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Associated Projects</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    Browser.ResizeElement( { nodeId: 'NewOrgFrame', heightOffset: 300, context: window } );
    
    // Toggle showing add new Organization Frame
    function handleAddOrganizationClick(btn)
    {
        var associateTable = $('AssociateTable')
        if(associateTable.isHidden())
        {
            window.location = window.location;
        }
        else
        {
//            associateTable.hide('none');
            var addNewPage =  $('NewOrgFrame');
            var url = '<%= Page.ResolveUrl("ProjectOrgsDetails.aspx") %>?projectId=<%= ProjectId %>&organizationId=-1&edit=true';
            
            return showEditDetailsInModal(url,'Add New Organization',550,400);

            
            //addNewPage.show('');
            //addNewPage.src = url;
        }
        return false;
    }
    
    // When organization is saved/updated in frame, reload page to reflect changes
    function onRecordSave(orgId)
    {
        window.location = window.location;
    }
    
    </script>

</head>
<body style="background-color: #ffffff;">
    <form id="form1" runat="server">
        
        <div style="width: 90%; margin: auto;" id="AssociateTable">
            <custom:ExtendedGridView runat="server" ID="AssociatedOrgsGrid" AutoGenerateColumns="false"
                TableName="Project_ProjectOrganization" DataKeyNames="ProjectId,OrganizationId,ProjectOrganizationId"
                CssClass="dataGrid" OnRowDeleted="OnOrganizationDeleted" HeaderStyle-CssClass="dataGridHeader"
                RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                OnRowDataBound="SetOrgDropDown" Width="100%" BlankRows="13" VisibleBlankRows="13"
                BlankRowCssClass="blankGridRow" VisibleBlankRowCssClass="blankGridRow">
                <Columns>
                    <custom:ExtendedTemplateField HeaderText="Organization" HeaderStyle-Width="60%">
                        <ItemTemplate>
                            <cc:CaisisSelect runat="server" ID="OrganizationDropDown" ShowLabel="false" DataTextField="Name"
                                DataValueField="OrganizationId" Table="Project_ProjectOrganization" Field="OrganizationId"
                                Width="90%">
                            </cc:CaisisSelect>
                        </ItemTemplate>
                    </custom:ExtendedTemplateField>
                    <custom:ExtendedTemplateField HeaderText="Organization Role" HeaderStyle-Width="30%">
                        <ItemTemplate>
                            <cc:CaisisSelect ID="CaisisSelect1" runat="server" ShowLabel="false" Table="Project_ProjectOrganization"
                                Field="OrganizationType" DataTextField="Name" DataValueField="OrganizationType"
                                Width="90%" LookupCode="ProjectOrganizationRole">
                            </cc:CaisisSelect>
                        </ItemTemplate>
                    </custom:ExtendedTemplateField>
                    <custom:ExtendedTemplateField HeaderText="Delete" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return confirmDelete();"
                                CommandName="Delete" ImageUrl="~/Images/iconDelete.gif" AlternateText="Delete this stage and details." />
                        </ItemTemplate>
                    </custom:ExtendedTemplateField>
                </Columns>
            </custom:ExtendedGridView>
            <table class="ProjectMgmtBtnContainer">
                <tr>
                    <td style="text-align: left;">
                        <asp:ImageButton ID="AddNewRowBtn" runat="server" ImageUrl="~/Images/DataGridAddNewRow.gif"
                            OnClick="SaveOrgs" />
                    </td>
                    <td style="text-align: right;">
                        <asp:ImageButton ID="SaveBtn" runat="server" ImageUrl="Images/Button_Save.gif" OnClick="SaveOrgs"
                            AlternateText="Update" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="margin: 10px auto 10px auto;">
            <iframe id="NewOrgFrame" name="NewOrgFrame" style="width: 100%; height: 400px; display: none;
                margin: auto; border-style: none;" frameborder="0"></iframe>
        </div>
        <div style="text-align: center;">
            <asp:ImageButton runat="server" ID="CancelBtn" OnClientClick="top.hideModal();"
                ImageUrl="Images/Button_Cancel.gif" ToolTip="Cancel" />
            <project:ProjectMgmtButton runat="server" ID="AddOrganizationBtn" UserTypeNames="ModuleAdmin"
                ImageUrl="Images/Button_NewOrganization.gif" ToolTip="Add A New Organization"
                OnClientClick="return handleAddOrganizationClick(this);" Style="margin-left: 40px;" />
        </div>
        
    </form>
</body>
</html>
