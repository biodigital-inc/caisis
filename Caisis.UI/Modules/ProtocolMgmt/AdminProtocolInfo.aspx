<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminProtocolInfo.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminProtocolInfo" %>
    
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Protocol Info</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>
    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
    /* <![CDATA[ */
   
    function onWindowResize(w,h) 
    { 
        var winHeight = getHeight(window);
        var panel = $('ProtocolInfoScroller');
        if(panel)
        {
            panel.style.maxHeight = Math.max(100,winHeight - 80) + 'px';
        }
    }
            
    function refreshPage()
    {
        window.location.href = window.location.href;
    }

    // reloaded parent frame with new protocol info
    function fullRefreshPage(url) {
        parent.location = url;
    }
    
    function ExitEditProtocol()
    {
        var url = '<%= GetQueryString("AdminProtocolInfo.aspx") %>';

        window.location = url;
    }
    function EditProtocol()
    {
        var url = '<%= GetQueryString(Page.ResolveUrl("AdminProtocolInfo.aspx")) %>';
        url += '&edit=true';
//        return showEditDetailsInModal( url,'Edit Protocol',600,450);
        window.location = url;

    }

    function onCancelClick() {
        if(<%= IsNew.ToString().ToLower() %>)
        {
            // back to list on new Protocol
            fullRefreshPage('ProtocolList.aspx');
            return false;
        }
        else
        {
            return true;
        }
    }
    
    function importExportProtocol() {
       return showEditDetailsInModal('<%= Page.ResolveUrl("AdminImportExportProtocol.aspx?mode=import") %>', 'Import a Protocol', 325, 150);
    }
    
    /* ]]> */
    </script>
    <style type="text/css">
    .dataEntryButtonGray,
    .dataEntryButtonRed
    {
        min-width: 50px;
        padding: 3px 7px 4px 7px;
        margin: auto 7px; 
    }
    </style>
</head>
<body style="background-color: #fbfbfb;">
    <form id="form1" runat="server">
        <table runat="server" id="ProtocolInfoDetailsLayer" width="100%" border="0" cellspacing="0"
            cellpadding="0" style="margin: auto;">
            <tr>
                <td class="dashboardTitleBar">
                    <img src="images/AdminDashboardTitle_ProtocolInformation.gif" alt="Protocol Information"
                        width="165" height="17" style="margin-right: 16px; vertical-align: middle; margin-bottom: 3px;" />view
                    / edit general data about this protocol
                </td>
                <td style="width: 9px;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="dashboardBG_TopLeft">
                    <asp:MultiView ID="ProtocolInfoView" runat="server" ActiveViewIndex=-1>
                        <asp:View ID="ReadOnlyView" runat="server" OnLoad="ReadOnlyView_Load">
                            <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="dashboard_ProtocolInfo" style="width: 130px; font-weight: bold;">
                                        IRB</td>
                                    <td class="dashboard_ProtocolInfo" style="font-weight: bold;">
                                        <asp:Label ID="ProtocolNum" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo" style="font-weight: bold;">
                                        Protocol Title
                                    </td>
                                    <td class="dashboard_ProtocolInfo" style="font-weight: bold;">
                                        <asp:Label ID="ProtocolTitle" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo">
                                        Short Description</td>
                                    <td class="dashboard_ProtocolInfo">
                                        <asp:Label ID="ProtocolAlias" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo">
                                        Principal Investigator</td>
                                    <td class="dashboard_ProtocolInfo">
                                        <asp:Label ID="ProtocolPI" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo">
                                        Department</td>
                                    <td class="dashboard_ProtocolInfo">
                                        <asp:Label ID="ProtocolDept" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo">
                                        Related Project</td>
                                    <td class="dashboard_ProtocolInfo">
                                        <a id="ProjectIdLink" runat="server"><asp:Label ID="ProjectId" runat="server"/></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo">
                                        Notes</td>
                                    <td class="dashboard_ProtocolInfo">
                                        <span id="EditBtn" onclick="EditProtocol();" class="dataEntryButtonRed"
                                            style="float: right;" title="Edit Protocol">Edit</span>
                                        <asp:Label ID="ProtocolNotes" runat="server" Width="400" />
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        
                        <asp:View ID="EditView" runat="server" OnLoad="EditView_Load">
                        
                        
                        <div id="ProtocolInfoScroller" style="max-height: <%= (IsNew ? "400px" : "180px") %>; overflow: auto; overflow-x: hidden; position: relative;">
                        
                            <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="dashboard_ProtocolInfo" style="width: 130px; font-weight: bold;">
                                        IRB
                                    </td>
                                    <td class="dashboard_ProtocolInfo" style="font-weight: bold;">
                                        <cic:CaisisTextBox ID="EditProtocolNum" runat="server" Table="Protocols" Field="ProtocolNum" 
                                            ShowHelpBubble="false" ShowLabel="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo" style="font-weight: bold;">
                                        Protocol Title
                                    </td>
                                    <td class="dashboard_ProtocolInfo" style="font-weight: bold;">
                                        <cic:CaisisTextArea ID="EditProtocolTitle" runat="server" Table="Protocols" Field="ProtocolTitle" 
                                            ShowHelpBubble="false" ShowLabel="false" style="width: 85%; height: 45px;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo">
                                        Short Description</td>
                                    <td class="dashboard_ProtocolInfo">
                                        <cic:CaisisTextBox ID="EditProtocolAlias" runat="server" Table="Protocols" Field="ProtocolAlias" 
                                            ShowHelpBubble="false" ShowLabel="false" style="width: 300px;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo">
                                        Principal Investigator</td>
                                    <td class="dashboard_ProtocolInfo">
                                        <cic:CaisisComboBox LookupDistinct="Contact;COALESCE(FirstName,'') + ' ' + COALESCE(LastName,'');COALESCE(FirstName,'') + ' ' + COALESCE(LastName,'')" ID="EditProtocolPI" runat="server" Table="Protocols" Field="ProtocolPI" 
                                            ShowHelpBubble="false" ShowLabel="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo">
                                        Department</td>
                                    <td class="dashboard_ProtocolInfo">
                                        <cic:CaisisComboBox LookupDistinct="Contact;COALESCE(Department,'');COALESCE(Department,'')" ID="EditProtocolDept" runat="server" Table="Protocols" Field="ProtocolDept" 
                                            ShowHelpBubble="false" ShowLabel="false" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="dashboard_ProtocolInfo">
                                        Related Project</td>
                                    <td class="dashboard_ProtocolInfo">
                                        <cic:CaisisSelect ID="EditProjectId" runat="server" Table="Protocols" Field="ProjectId" ShowHelpBubble="false" ShowLabel="false" Width="400" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dashboard_ProtocolInfo">
                                        Notes</td>
                                    <td class="dashboard_ProtocolInfo">
                                        <cic:CaisisTextArea ID="EditProtocolNotes" runat="server" Table="Protocols" Field="ProtocolNotes" 
                                            ShowHelpBubble="false" ShowLabel="false" style="width: 400px;" />
                                    </td>
                                </tr>

                            </table>
                           </div>
                           <div style="margin-right: 115px; margin-top: 6px; text-align: right;">
                               <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="dataEntryButtonGray"
                                   Style="margin-right: 50px;" ToolTip="Cancel" CausesValidation="false" OnClick="CancelButton_Click"
                                   OnClientClick="return onCancelClick();" />
                               <asp:Button ID="SaveButton" runat="server" Text="Save" ToolTip="Save" CssClass="dataEntryButtonRed"
                                   CausesValidation="true" OnClick="SaveButton_Click" Style="margin-right: 75px;" />
                               <a runat="server" id="ImportBtn" visible="false" href="#" class="dataEntryButtonRed"
                                   target="_blank" title="Import Protocol" onclick="return importExportProtocol();">
                                   Import Protocol</a>
                                <asp:Button ID="DeleteButton" runat="server" Text="Delete" CssClass="dataEntryButtonRed"
                                   Style="margin-right: 50px;" ToolTip="Delete" CausesValidation="false" OnClick="DeleteButton_Click"
                                   Visible="false" OnClientClick="return confirmDelete('Are you sure you would like to delete this Protocol?');" />
                           </div>
                        </asp:View>
                    </asp:MultiView>
                </td>
                <td class="dashboardBG_TopRight">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="dashboardBG_BottomLeft">
                    &nbsp;</td>
                <td class="dashboardBG_BottomRight">
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>