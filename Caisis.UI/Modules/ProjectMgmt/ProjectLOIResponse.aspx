<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectLOIResponse.aspx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectLOIResponse" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>LOI Response</title>
    
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    var isListPage = true;
    
    function goToResponse(LOIId, ProjectLetterOfIntentId)
    {
        $('LOIResponseDetailsPage').src = "ProjectLOIResponseDetails.aspx?ProjectLOIResponseId=" + LOIId + "&ProjectLetterOfIntentId=" + ProjectLetterOfIntentId;
    }
    
    // Reloads page and loads LOI Response into details page
    function refreshList(LOIId, ProjectLetterOfIntentId)
    {
        var url = 'ProjectLOIResponse.aspx?ProjectLetterOfIntentId=' + ProjectLetterOfIntentId + '&ProjectLOIResponseId=' + LOIId;
        window.location = url;
    }
    
    function AddNewResponse(ProjectLetterOfIntentId)
    {
        top.OpenObj=window.self;
        var page = 'ProjectLOIResponseDetails.aspx?edit=true&ProjectLetterOfIntentId=' + ProjectLetterOfIntentId + '&ProjectLOIResponseId=-1';
        var url = window.location.href;
        url = url.substr(0,url.lastIndexOf("/")) + "/" + page;
        showEditDetailsInModal(url, 'Response Details', 1000, 600);
    }
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    
            <table class="ProjectListViewEditLayout" style="margin-top: 10px;">
            <tr>
                <td style="width: 380px; text-align: right; vertical-align: top;">
                    <table id="MainTable" cellpadding="0" cellspacing="0" style="width: 100%; border: solid 1px #cccccc;">
                        <tr>
                            <td class="ProjMgrListHeader">
                                
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr >

                                <td style="width: 35%; vertical-align: middle;">
                                    <asp:LinkButton ToolTip="Organization" ID="LinkButton4" runat="server" OnCommand="HandleHeaderSortClick"
                                        CommandArgument="OrgName">Organization</asp:LinkButton></td>
                                <td  style="width: 35%; vertical-align: middle;">
                                    <asp:LinkButton ToolTip="Name" ID="LinkButton5" runat="server" OnCommand="HandleHeaderSortClick"
                                        CommandArgument="Name">Name</asp:LinkButton></td>
                                <td style="width: 30%; vertical-align: middle;">
                                    <asp:LinkButton ToolTip="Participation" ID="LinkButton6" runat="server" OnCommand="HandleHeaderSortClick"
                                        CommandArgument="Participation">Participation</asp:LinkButton></td>

                            </tr>
                        </table>
                                
                                
                                
                                
                                
                                
                                
                                </td>
                        </tr>
                        <tr>
                            <td style="padding: 10px; background-color: #ffffff;">
                                <div id="InnerTable" style="overflow: auto; height: 362px; text-align: left; margin-bottom: 10px;">
                                   
                                    <asp:Label runat="server" ID="EmptyMessageLabel" Text="No Responses have been assigned to this project"
                            Visible="false"></asp:Label>
                        
                        
                            <!-- Manuscript Grid -->
                            <asp:GridView runat="server" ID="ResponseGrid" CssClass="ProjectGrid" RowStyle-CssClass="dataGridItemRowA"
                                GridLines="None" AlternatingRowStyle-CssClass="dataGridItemRowB"
                                AutoGenerateColumns="false" AllowSorting="True" OnSorting="ResponseGrid_Sorting"
                                OnRowCreated="ResponseGrid_RowCreated" ShowHeader="false"  Width="95%" BorderStyle="solid" BorderColor="#dddddd" BorderWidth="1">
                                <Columns>
                                    <asp:BoundField DataField="OrgName" HeaderText="Organization" SortExpression="Organization" >
                                        <HeaderStyle CssClass="BlueListBar" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
                                        <HeaderStyle CssClass="BlueListBar" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Participation" HeaderText="Participation" SortExpression="Participation" >
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
                                        <project:ProjectMgmtButton runat="server" ID="EditButton" ImageUrl="Images/Button_AddEdit.gif" ToolTip="Add/Edit LOI Response" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="ProjectDetailsContainer" id="ProjectDetailsContainer" style="padding: 20px;">
                    <div class="ProjectDetailsFrameHolder">
                        <iframe src="" runat="server" id="LOIResponseDetailsPage" frameborder="0" style="width: 500px;
                            height: 500px; overflow: auto;"></iframe>
                    </div>
                    <div class="ProjectDetailsClickLeftNotice" style="padding-left: 20px;">
                        Select an LOI Resp on the left.</div>
                </td>
            </tr>
        </table>
    
    
    
       
    
    </div>
    </form>
</body>
</html>
