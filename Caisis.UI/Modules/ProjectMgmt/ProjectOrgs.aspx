<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectOrgs.aspx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectOrgs" %>

<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Organizations</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/Menu.js"></script>

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <script type="text/javascript">
    var isListPage = true;
 
    // Reloads page and loads organization into details page
    function refreshList(orgId, projectId)
    {
        var url = 'ProjectOrgs.aspx?projectId=' + projectId + '&organizationId=' + orgId;
        window.location = url;
    }
    
    function goToAddOrganizations(projectId)
    {
        projectId = projectId ? projectId : '<%= ProjectId %>';
        var strUrl = '<%= Page.ResolveUrl("EditAssociatedOrganizations.aspx") %>?projectId=' + projectId + '&returnToOrgsList=true';
        strUrl = strUrl + '&editType=Organizations';
        //window.location = strUrl;
        showEditDetailsInModal(strUrl,'Associate Organizations to Project',800,700);
        return false;
    }
    
    function goToOrganization(orgId)
    {
        $('OrgInfoPage').src = 'ProjectOrgsDetails.aspx?organizationId=' + orgId + '&projectId=<%= ProjectId %>';
    }
    
    function goToAddNewOrganization()
    {
        var strUrl = '<%= Page.ResolveUrl("ProjectOrgsDetails.aspx") %>?projectId=<%= ProjectId %>&organizationId=-1&edit=true';
        showEditDetailsInModal(strUrl,'Add New Organization',800,700);
        return false;
    }  
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table class="ProjectListViewEditLayout" style="margin-top: 10px;">
            <tr>
                <td style="width: 350px; text-align: right; vertical-align: top;">
                    <table id="MainTable" cellpadding="0" cellspacing="0" style="width: 100%; border: solid 1px #cccccc;">
                        <tr>
                            <td class="ProjMgrListHeader">Participating Organizations</td>
                        </tr>
                        <tr>
                            <td style="padding: 10px; background-color: #ffffff;">
                                <input type="text" value="" id="List_Filter" name="List_Filter" />
                                <div id="List_Filter_Container" style="overflow: auto; height: 340px; text-align: left;">
                                    <!-- Empty Message for Grids with No Data -->
                                    <asp:Label runat="server" CssClass="NoDataMessage" ID="EmptyMessageLabel" Text="No Organizations have been assigned to this project"
                                        Visible="false"></asp:Label>
                                    <!-- Organization Grid -->
                                    <asp:GridView runat="server" DataKeyNames="OrganizationId" ID="OrgsGrid" GridLines="None"
                                        CssClass="ProjectGrid" RowStyle-CssClass="dataGridItemRowB" AlternatingRowStyle-CssClass="dataGridItemRowA"
                                        AutoGenerateColumns="false" ShowHeader="false" 
                                        OnPreRender="SetGridViewSelectedByKey" OnRowDataBound="AddOnClickClientEvent" Width="95%" BorderStyle="solid" BorderColor="#dddddd" BorderWidth="1">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <span title="<%# Eval("ShortName") %>"><%# Eval("Name") %></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <table class="ProjectMgmtBtnContainer">
                                    <tr>
                                        <td>
                                            <project:ProjectMgmtButton ID="AssignOrgsToProject" ProjectContext="Project" runat="server" ImageUrl="Images/Button_AddOrganization.gif"
                                                ToolTip="Add Organizations" OnClientClick="return goToAddOrganizations();" />
                                            <project:ProjectMgmtButton ID="AddNewOrg" runat="server" ProjectContext="Global"  ImageUrl="Images/Button_NewOrganization.gif" UserTypeNames="ModuleAdmin"
                                                ToolTip="Add New Organization" OnClientClick="return goToAddNewOrganization();" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="ProjectDetailsContainer" id="ProjectDetailsContainer" style="padding: 20px;">
                    <div class="ProjectDetailsFrameHolder">
                        <iframe src="" runat="server" id="OrgInfoPage" frameborder="0" scrolling="no" class="ProjectDetailsFrame"
                            style="width: 452px; height: 315px;"></iframe>
                    </div>
                    <div class="ProjectDetailsClickLeftNotice" style="padding-left: 20px;">
                        Select an Organization on the left.</div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
