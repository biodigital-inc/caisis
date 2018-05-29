<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectManuscript.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectManuscript" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Manuscript</title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    var isListPage = true;

    function goToManuscript(manuscriptId, projectId)
    {
        $('ManuscriptDetailsPage').src = "ProjectManuscriptDetails.aspx?manuscriptId=" + manuscriptId + "&projectId=" + projectId;
    }
    
    // Reloads page and loads manuscripts into details page
    function refreshList(manuscriptId, projectId)
    {
        var url = 'ProjectManuscript.aspx?projectId=' + projectId + '&manuscriptId=' + manuscriptId;
        window.location = url;
    }
    
    function addNewManuscript()
    {
        var projectId = '<%= projectId %>';
        var progMgmtPath = '<%= Page.ResolveUrl("ProjectManuscriptDetailsEdit.aspx") %>';
        var url = progMgmtPath + '?projectId=' + projectId + '&manuscriptId=-1';
        showEditDetailsInModal(url,'Manuscript Details',800);
        return false;
    }
   
    </script>

    <style type="text/css">

    #ContentTableHolder
    {
        margin: auto;
        overflow: auto;
    }
    .ContentTable
    {
        margin: auto;
        table-layout: fixed;
        width: 100%;
        cursor: pointer;
        border-bottom: 1px solid #cccccc;
    }
    .ContentTable span
    {
        display: block;
        margin: 2px auto 2px 10px;
        white-space: normal;
    }
    .dataGrid
    {
        margin: auto;
        width: 90%;
    }
    .ManuscriptTitleColumn
    {
        padding-right: 20px;
        line-height: 12px;;
    }
    </style>
</head>
<body style="padding-top: 10px;">
    <form id="form1" runat="server">
        <table class="ProjectListViewEditLayout" style="margin-top: 10px;">
            <tr>
                <td style="width: 350px; vertical-align: top;">
                    <table id="MainTable" cellpadding="0" cellspacing="0" style="width: 100%; border: solid 1px #cccccc;">
                        <tr>
                            <td class="ProjMgrListHeader" style="width: 50%;">
                                <asp:LinkButton ToolTip="Title" ID="LinkButton1" runat="server" OnCommand="HandleHeaderSortClick"
                                    CommandArgument="Title">Title</asp:LinkButton></td>
                            <td class="ProjMgrListHeader">
                                <asp:LinkButton ToolTip="Author" ID="LinkButton2" runat="server" OnCommand="HandleHeaderSortClick"
                                    CommandArgument="Name">Author</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 10px; background-color: #ffffff;">
                                <div id="InnerTable" style="overflow: auto; height: 362px; text-align: left;">
                                    <asp:Label runat="server" CssClass="NoDataMessage" ID="EmptyMessageLabel" Text="No Manuscripts have been assigned to this project"
                                        Visible="false"></asp:Label>
                                    <!-- Manuscript Grid -->
                                    <asp:GridView runat="server" ID="ManuscriptsGrid" RowStyle-CssClass="dataGridItemRowB"
                                        GridLines="None" CssClass="ProjectGrid" AlternatingRowStyle-CssClass="dataGridItemRowA"
                                        AutoGenerateColumns="false" ShowHeader="false" AllowSorting="True" OnSorting="ManuscriptsGrid_Sorting"
                                        OnRowCreated="ContactsGrid_RowCreated"  Width="95%" BorderStyle="solid" BorderColor="#dddddd" BorderWidth="1">
                                        <Columns>
                                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ItemStyle-CssClass="ManuscriptTitleColumn" />
                                            <asp:BoundField DataField="Name" HeaderText="Author" SortExpression="Name" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <table class="ProjectMgmtBtnContainer">
                                    <tr>
                                        <td>
                                            <asp:ImageButton runat="server" ID="NewButton" ImageUrl="Images/Button_NewManuscript.gif"
                                                ToolTip="New Manuscript" OnClientClick="return addNewManuscript();" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="ProjectDetailsContainer" id="ProjectDetailsContainer" style="padding: 20px;">
                    <div class="ProjectDetailsFrameHolder">
                        <iframe src="" runat="server" id="ManuscriptDetailsPage" class="ProjectDetailsFrame"
                            frameborder="0" style="width: 500px; height: 520px; overflow: auto;"></iframe>
                    </div>
                    <div class="ProjectDetailsClickLeftNotice" style="padding-left: 20px;">
                        Select a Manuscript on the left.</div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
