<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectSummary.aspx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectSummary" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Summary</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    Browser.ResizeElement( { nodeId: 'LeftCol', heightOffset: 235 },{ nodeId: 'RightCol', heightOffset: 235 } );
    
    NotesEditor.editorWidth = 400;
    NotesEditor.editorHeight = 200;
    NotesEditor.onOpen = function()
    {
        var editor = $('CoverLayer');
        editor.show('');
        editor.setTransparency(65);
    }
    NotesEditor.onClose = function()
    {
        var editor = $('CoverLayer');
        editor.hide('none');
    }
    
    function goToLink(srcWindow, pageLink)
    {
        window.location.href = srcWindow;
        parent.setNavLink(pageLink); 
    }
    
    function refreshList(projectId, organizationId)
    {
        parent.refreshList(projectId, organizationId);
    }
    
    function goToOrganizationView(orgId)
    {
        window.parent.location = 'EditProject.aspx?projectId=<%= ProjectId %>&organizationId=' + orgId;
    }
    
    </script>

    <style type="text/css">
    .dataGridItemHover
    {
        background-color: #993333;
        height: 14px;
        cursor: pointer;
    }
     .dataGridItemHover td
     {
         color: #ffffff;
         cursor: pointer;
     }
     
    .PageCol
    {
        width: 49.4%;
        background-color: #fcfcfc;
        border: 1px solid #cccccc;
        overflow: auto;
        position: relative;
    }
    #LeftCol
    {
        float: left;
    }
    #RightCol
    {
        float: right;
        
    }
    .ItemDescription
    {
        width: 100px;
        text-align: left;
        padding-bottom: 15px;
        vertical-align: top;
        font-weight: bold;
    }
    .ItemValue
    {
        padding-bottom: 15px;
    }
    .ItemValue input[type='text'],
    .ItemValue select,
    .ItemValue textarea
    {
        width: 200px;
    }
    .ColTable
    {
        table-layout: fixed; 
        margin: 35px auto auto 20px;
    }
    .LegendTable
    {
        width: 100%;
        table-layout: fixed;
        border: 1px solid #cccccc;
        cursor: default;
    }
    .ColorCodeBox
    {
        width: 12px;
        height: 12px;
    }
    .LegendTable tr
    {
        padding-top: 2px;
        padding-bottom: 2px;
    }
    .dataGridItemRowA
    {
        height: 14px;
        cursor: pointer;
 
    }
    .dataGridItemRowB
    {
        height: 14px;
        cursor: pointer;
    }
    .ProjectGrid
    {
        width: 95%;
        table-layout: fixed;
        border: 1px solid #dddddd;
    }
    .ProjectGrid td
    {
        width: auto;
    }
    .ProjectGridField
    {
        display: block;
        padding-left: 5px;
    }
    #DeleteLayer
    {
        width: 50%;
        margin: auto;
        text-align: center;
    }
    #DeleteLayer a
    {
        width: 200px;
        font-size: 13px;
        margin: 5px 10px;
    }
    </style>
</head>
<body style="background-color: #eeeff0;">
    <form id="form1" runat="server">
        <div id="CoverLayer" style="width: 100%; position: absolute; z-index: 8; background-color: #000000;
            top: 0px; left: 0px; bottom: 0px; right: 0px; display: none;">
        </div>
        <div runat="server" id="DataEntryLayer" visible="true">
            <div id="LeftCol" class="PageCol">
                <table class="ColTable">
                    <tr>
                        <td class="ItemDescription" style="padding-top: 4px; width: 130px;">
                            <label for="ProjectTitle">
                                Project Title</label>
                        </td>
                        <td class="ItemValue">
                            <cc:CaisisTextBox runat="server" Table="Project" ID="ProjectTitle" Field="Title"
                                ShowLabel="false"></cc:CaisisTextBox>
                        </td>
                    </tr>
<%--                    <tr>
                        <td class="ItemDescription" style="padding-top: 4px; width: 130px;">
                            <label for="ProjectNum">
                                Project Number</label>
                        </td>
                        <td class="ItemValue">
                            <cc:CaisisTextBox runat="server" Table="Project" ID="ProjectNum" Field="ProjectNum" MaxLength="50"
                                Enabled="false" ShowLabel="false" Style="border: none; background-color: none;
                                font-size: 13px; color: #000000; font-weight: bold;"></cc:CaisisTextBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="ItemDescription" style="padding-top: 4px; width: 130px;">
                            <label for="ShortName">
                                Project Short Name</label>
                        </td>
                        <td class="ItemValue">
                            <cc:CaisisTextBox runat="server" Table="Project" ID="ShortName" Field="ShortName" MaxLength="50"
                                ShowLabel="false"></cc:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="ItemDescription" style="width: 130px;">
                            <label for="ProjectDescription">
                                Protocol #</label>
                        </td>
                        <td class="ItemValue">
                            <cc:CaisisTextBox runat="server" Table="Project" ID="ProjectDescription" Field="Description" MaxLength="500"
                                ShowLabel="false"></cc:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="ItemDescription">
                            <label for="Status">
                                Status</label>
                        </td>
                        <td class="ItemValue">
                            <cc:CaisisTextArea runat="server" Table="Project" ID="Status" Field="Status" MaxLength="255"
                                ShowLabel="false"></cc:CaisisTextArea>
                        </td>
                    </tr>
                    <tr>
                        <td class="ItemDescription">
                            <label for="Phase">
                                Phase</label>
                        </td>
                        <td class="ItemValue">
                            <cc:CaisisSelect runat="server" Table="Project" ID="Phase" Field="Phase" LookupCode="ProjectPhase"
                                ShowLabel="false">
                            </cc:CaisisSelect>
                        </td>
                    </tr>
                    <tr>
                        <td class="ItemDescription">
                            <label for="AgentName">
                                Agent Name</label>
                        </td>
                        <td class="ItemValue">
                            <cc:CaisisCheckBoxList runat="server" Table="Project" ID="AgentName" Field="AgentName"
                                MaxLength="255" ShowLabel="false" LookupCode="MedTxAgent" RepeatLayout="Table"
                                RepeatColumns="1" DropDown="true">
                            </cc:CaisisCheckBoxList>
                        </td>
                    </tr>
<%--                    <tr>
                        <td class="ItemDescription">
                            <label for="ClassOfDrug">
                                Class of Drug</label>
                        </td>
                        <td class="ItemValue">
                            <cc:CaisisComboBox runat="server" Table="Project" ID="ClassOfDrug" Field="ClassOfDrug" MaxLength="255"
                                ShowLabel="false" LookupCode="MedTxType">
                            </cc:CaisisComboBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="ItemDescription">
                            Additional Forms</td>
                        <td>
                            <cc:CaisisRadioButtonList ID="IncludeFormRadioList" runat="server" Width="200px"
                                TextAlign="Right" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0"
                                CellSpacing="0">
                                <asp:ListItem Value="Letter Of Intent">Include Letter Of Intent</asp:ListItem>
                                <asp:ListItem Value="Project Proposal">Include Project Proposal Form</asp:ListItem>
                                <asp:ListItem Value="None">None</asp:ListItem>
                            </cc:CaisisRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="ItemDescription">
                            <label for="Notes">
                                Notes</label>
                        </td>
                        <td class="ItemValue">
                            <cc:CaisisTextArea runat="server" Table="Project" ID="Notes" Field="Notes" MaxLength="1000" ShowLabel="false"></cc:CaisisTextArea>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="RightCol" class="PageCol">
                <table class="ColTable">
                    <tr>
                        <td class="ItemDescription" style="padding-top: 8px;">
                            <asp:Label runat="server" ID="OrgHeading" Text="Organizations"></asp:Label></td>
                        <td class="ItemValue" style="padding-top: 8px;">
                            <!-- Admin Level List Of Organizations -->
                            <asp:GridView runat="server" ID="OrganizationsGrid" CssClass="ProjectGrid" AutoGenerateColumns="false"
                                GridLines="None" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                                CellPadding="1" CellSpacing="0" ShowHeader="false" OnRowDataBound="OrganizationsGrid_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="25px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="OrgColorCode" CssClass="ColorCodeBox"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <span class="ProjectGridField" title="<%# Server.HtmlEncode(Eval("Name").ToString()) %>">
                                                <%# Eval("ShortName") %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <!-- Organization Level Listing -->
                            <asp:Panel runat="server" ID="OrgAddress" Style="padding: 4px; font-size: 12px; border: solid 1px #cccccc;
                                background-color: #ffffff; width: 80%">
                                <asp:Label runat="server" ID="OrgName" Style="display: block; font-weight: bold;
                                    font-size: 15px;"></asp:Label>
                                <asp:Label runat="server" ID="OrgShortName" Style="display: block;"></asp:Label>
                                <asp:Label runat="server" ID="OrgAddress1" Style="display: block; margin-top: 8px;"></asp:Label>
                                <asp:Label runat="server" ID="OrgAddress2" Style="display: block;"></asp:Label>
                                <asp:Label runat="server" ID="OrgCity"></asp:Label>,
                                <asp:Label runat="server" ID="OrgState"></asp:Label>
                                <asp:Label runat="server" ID="OrgPostal"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td class="ItemDescription" style="padding-top: 8px;">
                            Contacts</td>
                        <td class="ItemValue" style="padding-top: 8px;">
                            <!-- Admin Level List Of Contacts -->
                            <asp:GridView runat="server" ID="ContactsGrid" CssClass="ProjectGrid" AutoGenerateColumns="false"
                                GridLines="None" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                                CellPadding="1" CellSpacing="0" ShowHeader="false" OnRowDataBound="ContactsGrid_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="225px">
                                        <ItemTemplate>
                                            <span class="ProjectGridField" title="<%# Server.HtmlEncode(Eval("LastName").ToString()) %>, <%# Server.HtmlEncode(Eval("FirstName").ToString()) %>">
                                                <%# Eval("LastName")%>
                                                ,
                                                <%# Eval("FirstName") %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <!-- Organization Level Contacts View -->
                            <asp:Panel runat="server" ID="OrgContactsPanel">
                                <asp:GridView runat="server" ID="OrgContactsRptr" CssClass="ProjectGrid" AutoGenerateColumns="false"
                                    GridLines="None" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                                    CellPadding="1" CellSpacing="0" ShowHeader="false" OnRowDataBound="ContactsGrid_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="225px">
                                            <ItemTemplate>
                                                <span class="ProjectGridField" title="<%# Server.HtmlEncode(Eval("Name").ToString()) %>">
                                                    <%# Eval("Name") %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td class="ItemDescription" style="padding-top: 8px;">
                            Manuscripts</td>
                        <td class="ItemValue" style="padding-top: 8px;">
                            <!-- List Of Manuscripts -->
                            <asp:GridView runat="server" ID="ManuscriptGrid" CssClass="ProjectGrid" AutoGenerateColumns="false"
                                GridLines="None" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                                CellPadding="3" CellSpacing="0" ShowHeader="false" OnRowDataBound="ManuscriptGrid_RowDataBound">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <span class="ProjectGridField" title="<%# Server.HtmlEncode(Eval("Title").ToString()) %>">
                                                <%# Eval("Title")%>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="ItemDescription" style="padding-top: 8px;">
                            Funding Sources</td>
                        <td class="ItemValue" style="padding-top: 8px;">
                            <!-- List Of Funding Sources -->
                            <asp:GridView runat="server" ID="FundingGrid" CssClass="ProjectGrid" AutoGenerateColumns="false"
                                GridLines="None" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                                CellPadding="3" CellSpacing="0" ShowHeader="false" OnRowDataBound="FundingGrid_RowDataBound">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <span class="ProjectGridField" title="<%# Server.HtmlEncode(Eval("Source").ToString()) %>">
                                                <%# Eval("Source")%>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>
            <project:ProjectMgmtButton runat="server" ID="UpdateBtn" ImageUrl="Images/Button_Update.gif"
                ToolTip="Update Project" OnClick="UpdateProjectRecord" Style="margin-top: 6px;
                margin-left: 200px;" />
            <project:ProjectMgmtButton runat="server" ID="DeleteBtn" ImageUrl="Images/Button_Delete.gif"
                ToolTip="Delete Project" OnClick="PreviewDeleteProjectRecord" Style="margin-top: 6px;
                margin-left: 200px;" />
        </div>
        <div runat="server" id="DeleteLayer" visible="false">
            <h2>
                Are you sure you would like to delete this Project?</h2>
            <p>
                Removing this project will delete the Project, Stages, Events, Event Arributes,
                Manuscripts and Funding Information. It will also remove the <b>association</b>
                with Contacts and Organizations, but not the Contacts and Organizations.</p>
            <asp:LinkButton runat="server" ID="DeleteProjectBtn" OnClick="DeleteProjectRecord"
                OnClientClick="return confirmDelete();" CssClass="dataEntryButtonRed">Yes, Delete this Project</asp:LinkButton>
            <a href="#" class="dataEntryButtonGray" onclick="window.location=window.location; return false;">
                No, Cancel Delete</a>
        </div>
    </form>    
</body>
</html>
