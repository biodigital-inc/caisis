<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectFunding.aspx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectFunding" %>

<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Funding</title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    var isListPage = true;
    
    function goToFunding(fundingId, projectId)
    {
        $('FundingDetailsPage').src = "ProjectFundingDetails.aspx?fundingId=" + fundingId + "&projectId=" + projectId;
    }
    
    // Reloads page and loads fundings into details page
    function refreshList(fundingId, projectId)
    {
        var url = 'ProjectFunding.aspx?projectId=' + projectId + '&fundingSourceId=' + fundingId;
        window.location = url;
    }
    
    function addNewFunding()
    {
        var projectId = '<%= projectId %>';
        var progMgmtPath = '<%= Page.ResolveUrl("ProjectFundingDetails.aspx") %>';
        var url = progMgmtPath + '?edit=true&projectId=' + projectId + '&fundingId=-1';
        showEditDetailsInModal(url,'Funding Details',800);
        return false;
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table class="ProjectListViewEditLayout" style="margin-top: 10px;">
            <tr>
                <td style="width: 350px; vertical-align: top;">
                    <table id="MainTable" cellpadding="0" cellspacing="0" style="width: 100%; border: solid 1px #cccccc;">
                        <tr>
                            <td class="ProjMgrListHeader">
                                <asp:LinkButton ToolTip="Source" ID="LinkButton1" runat="server" OnCommand="HandleHeaderSortClick"
                                    CommandArgument="Source">Funding Source</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td style="padding: 10px; background-color: #ffffff;">
                                <div id="InnerTable" style="overflow: auto; height: 362px; text-align: left;">
                                    <asp:Label runat="server" CssClass="NoDataMessage" ID="EmptyMessageLabel" Text="No Fundings have been assigned to this project"
                                        Visible="false"></asp:Label>
                                    <!-- Funding Grid -->
                                    <asp:GridView runat="server" ID="FundingGrid" CssClass="ProjectGrid" RowStyle-CssClass="dataGridItemRowB"
                                        GridLines="None" AlternatingRowStyle-CssClass="dataGridItemRowA" AutoGenerateColumns="false"
                                        AllowSorting="True" OnSorting="FundingGrid_Sorting" OnRowCreated="FundingGrid_RowCreated"
                                        ShowHeader="false"  Width="95%" BorderStyle="solid" BorderColor="#dddddd" BorderWidth="1">
                                        <Columns>
                                            <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source">
                                                <HeaderStyle CssClass="BlueListBar" />
                                            </asp:BoundField>
                                        </Columns>
                                        <RowStyle CssClass="dataGridItemRowB" />
                                        <AlternatingRowStyle CssClass="dataGridItemRowA" />
                                    </asp:GridView>
                                </div>
                                <table class="ProjectMgmtBtnContainer">
                                    <tr>
                                        <td>
                                            <project:ProjectMgmtButton runat="server" ID="NewButton" ImageUrl="Images/Button_NewFundingSource.gif" UserTypeNames="ModuleAdmin"
                                                ToolTip="New Funding Source"  OnClientClick="return addNewFunding();"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="ProjectDetailsContainer" id="ProjectDetailsContainer" style="padding: 20px;">
                    <div class="ProjectDetailsFrameHolder">
                        <iframe src="" runat="server" id="FundingDetailsPage" frameborder="0" style="width: 500px;
                            height: 460px; overflow: auto;" scrolling="no"></iframe>
                    </div>
                    <div class="ProjectDetailsClickLeftNotice">
                        Select a Funding Source on the left.</div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
