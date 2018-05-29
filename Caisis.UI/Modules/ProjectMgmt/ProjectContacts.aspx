<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectContacts.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectContacts" %>

<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contacts</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/Menu.js"></script>

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <script type="text/javascript">
    Browser.ResizeElement({ nodeId: 'List_Filter_Container', customResizer: handleResize });
   
    function handleResize(w,h)
    {
        var winHeight = getHeight(window);
        $('List_Filter_Container').style.height = Math.max(100, winHeight - 125) + 'px';
    }
    
    var isListPage = true;
    var contactType = '<%= contactType %>';
    
    // Refreshs navigation list
    function refreshList(id)
    {
        var qsParm = new Array();

        var query = window.location.search.substring(1);

        var parms = query.split('&');

        for (var i=0; i<parms.length; i++) 
        {
            var pos = parms[i].indexOf('=');
            if (pos > 0) 
            {
                var key = parms[i].substring(0,pos);
                var val = parms[i].substring(pos+1);
                qsParm[key] = val;
            }
        }
        
        var qs='';
        if (qsParm['FilterBy'] == 'Projects')
            qs = '&FilterBy=Projects&FilterID=' + qsParm['FilterID'];

        window.location = 'ProjectContacts.aspx?contactId=' + id + qs;
        //if (id == -1) { $('ContactInfoPage').src = 'ProjectContactsDetails.aspx?contactId=' + id; }
    }
      
    // Loads record into ContactInfo frame
    function goToContact(projectId,contactId) 
    {
        $('ContactInfoPage').src = 'ProjectContactsDetails.aspx?projectId=' + projectId + '&contactId=' + contactId + '&contactType=' + contactType + '&admin=<%= isAdmin %>';
    }
    
    // Navigates to associate contacts screen
    function goToAddContacts(projectId)
    {
        projectId = projectId ? projectId : '<%= ProjectId %>';
        var strUrl = '<%= Page.ResolveUrl("EditAssociatedContacts.aspx") %>?projectId=' + projectId;
        showEditDetailsInModal(strUrl,'Assign Contacts',800,700);
        return false;
    }
    
    function goToAddNewContact()
    {
        var url = '<%= Page.ResolveUrl("ProjectContactsDetails.aspx") %>?projectId=<%= ProjectId %>&contactId=-1&contactType=' + contactType + '&edit=true&admin=<%= isAdmin %>';
        showEditDetailsInModal(url,'Add A New Contact',800,700);
        return false;
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table class="ProjectListViewEditLayout" style="margin-top: 10px;">
            <tr>
                <td style="width: 370px; vertical-align: top;">
                    <table id="MainTable" cellpadding="0" cellspacing="0" style="width: 100%; border: solid 1px #cccccc;">
                        <tr>
                            <td class="ProjMgrListHeader">
                                <asp:LinkButton ToolTip="Name" ID="LinkButton1" runat="server" OnCommand="HandleHeaderSortClick"
                                    CommandArgument="Name" ForeColor="white">Contact Name</asp:LinkButton></td>
                            <td class="ProjMgrListHeader">
                                <asp:LinkButton ForeColor="White" ToolTip="Organization" ID="LinkButton2" runat="server"
                                    OnCommand="HandleHeaderSortClick" CommandArgument="Organization">Organization</asp:LinkButton></td>
                            <%--<td class="ProjMgrListHeader">
                                <asp:LinkButton ForeColor="White" ToolTip="Department" ID="LinkButton3" runat="server"
                                    OnCommand="HandleHeaderSortClick" CommandArgument="Department">Department</asp:LinkButton></td> --%>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 10px; background-color: #ffffff;">
                                <input type="text" value="" id="List_Filter" name="List_Filter" />
                                <div id="List_Filter_Container" style="overflow: auto; height: 362px; text-align: left;">
                                    <!-- Empty Message for Grids with No Data -->
                                    <asp:Label CssClass="NoDataMessage" runat="server" ID="EmptyMessageLabel" Text="No Contacts have been assigned to this project"
                                        Visible="false"></asp:Label>
                                    <asp:GridView runat="server" GridLines="none" CellPadding="0" CellSpacing="0" ID="ContactsGrid"
                                        CssClass="ProjectGrid" RowStyle-CssClass="dataGridItemRowB" AlternatingRowStyle-CssClass="dataGridItemRowA"
                                        AutoGenerateColumns="false" AllowSorting="True" OnRowCreated="AddClickToContactRow"
                                        HeaderStyle-CssClass="dataGridHeader" OnSorting="ContactsGrid_Sorting" ShowHeader="false"  Width="95%" BorderStyle="solid" BorderColor="#dddddd" BorderWidth="1" >
                                        <Columns>
                                            <asp:BoundField DataField="Name" />
                                            <asp:BoundField DataField="Organization" />
                                            <%--<asp:BoundField DataField="Department" />--%>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <table class="ProjectMgmtBtnContainer">
                                    <tr>
                                        <td>
                                            <project:ProjectMgmtButton ID="AssignContactsToProject" runat="server" ProjectContext="Project"
                                                ImageUrl="Images/Button_AddContact.gif" ToolTip="Assign Contacts" OnClientClick="return goToAddContacts();" />
                                            <project:ProjectMgmtButton ID="AddNewContact" runat="server" ProjectContext="Global"
                                                UserTypeNames="ModuleAdmin" ImageUrl="Images/Button_NewContact.gif" ToolTip="Add New Contact"
                                                OnClientClick="return goToAddNewContact();" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="ProjectDetailsContainer" id="ProjectDetailsContainer" style="padding: 20px;">
                    <div class="ProjectDetailsFrameHolder">
                        <iframe src="" runat="server" id="ContactInfoPage" frameborder="0" class="ProjectDetailsFrame"
                            style="width: 500px; height: 450px;"></iframe>
                    </div>
                    <div class="ProjectDetailsClickLeftNotice">
                        Select a contact on the left.</div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
