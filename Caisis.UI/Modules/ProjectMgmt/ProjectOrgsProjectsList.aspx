<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectOrgsProjectsList.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectOrgsProjectsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Organization Projects</title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">

        Browser.ResizeElement({ nodeId: 'ContentTableHolder', heightOffset: 275 });    
    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" style="margin: auto; width: 100%;">
        <tr class="BlueListBar">
            <td class="BlueListBar" style="width: 5%;">
                <img src="Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;"
                    alt="Project List" />
            </td>
            <td class="BlueListBar" style="width: 10%;">
                <span class="HeaderItem" title="Project Number">Number</span>
            </td>
            <td class="BlueListBar" style="width: 35%;">
                <span class="HeaderItem" title="Project Title">Project Name</span>
            </td>
            <td class="BlueListBar" style="width: 15%;">
                <span class="HeaderItem" title="Project Status">Status</span>
            </td>
            <td class="BlueListBar" style="width: 10%;">
                <span class="HeaderItem" title="Project Priority">Priority</span>
            </td>
            <td class="BlueListBar" style="width: 20%;">
                <span class="HeaderItem" title="Project Notes">Notes</span>
            </td>
            <td class="BlueListBar" style="width: 5%; text-align: right;">
                <img src="Images/HeaderBarBlueRight.gif" width="6" height="35" alt="Project List" />
            </td>
        </tr>
        <tr>
            <td colspan="7" align="center">
                <div id="ContentTableHolder" style="height: 300px; overflow: auto;">
                    <table id="ProjectsTable" class="ProjectTable" cellpadding="0" cellspacing="0" border="0"
                        style="width: 98%; overflow-x: hidden; text-align: left;">
                        <tbody>
                            <asp:Repeater runat="server" ID="OrganizationProjectsRptr">
                                <ItemTemplate>
                                    <tr id="<%# Eval("ProjectId") %>" class="<%# Container.ItemIndex % 2 ==0? "dataGridItemRowA" : "dataGridItemRowB" %>"
                                        title="<%# Caisis.UI.Core.Classes.PageUtil.EscapeDoubleQuotes(Eval("Description").ToString()) %>">
                                        <td style="width: 5%; background-position: left bottom;">
                                            &nbsp;
                                        </td>
                                        <td style="width: 10%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;
                                            background-position: center bottom;">
                                            <span>
                                                <%# Eval("ProjectNum") %>
                                            </span>
                                        </td>
                                        <td style="width: 35%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;
                                            background-position: center bottom;">
                                            <asp:Label runat="server" ID="TitleField" Style="display: block;" Text='<%# Eval("Title") %>'>                                                    </asp:Label>
                                            <asp:Label runat="server" ID="TitlePre"></asp:Label><asp:Label runat="server" ID="TitleMatch"
                                                CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="TitlePost"></asp:Label>
                                        </td>
                                        <td style="width: 15%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;
                                            background-position: center bottom;">
                                            <span>
                                                <%# Eval("Status") %>&nbsp;</span>
                                        </td>
                                        <td style="width: 10%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;
                                            background-position: center bottom;">
                                            <span>
                                                <%# Eval("Priority") %>&nbsp;</span>
                                        </td>
                                        <td style="width: 20%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;
                                            background-position: center bottom;">
                                            <asp:Label runat="server" ID="NotesField" Style="display: block;" Text='<%# Eval("Notes") %>'>                                                    </asp:Label><asp:Label
                                                runat="server" ID="NotesPre"></asp:Label><asp:Label runat="server" ID="NotesMatch"
                                                    CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="NotesPost"></asp:Label>
                                        </td>
                                        <td style="width: 5%;">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
                <span id="RecordCount">
                    <%= OrganizationProjectsRptr.Items.Count %>
                    Projects </span>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
