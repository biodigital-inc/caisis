<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectManuscriptDetails.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectManuscriptDetails" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="~/Core/Help/helpToolTip.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manuscript Details</title>

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script src="../../ClientScripts/Help.js" type="text/javascript"></script>

    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <script type="text/javascript">

    function setOptionalFields(toggleImage)
    {
        showHideOptionalFields(toggleImage,'DisplayManuscriptOptional');
    }
    
    function goToEditDetails()
    {
        var projectId = '<%= projectId %>';
        var manuscriptId = '<%= manuscriptId %>';
        var progMgmtPath = '<%= Page.ResolveUrl("ProjectManuscriptDetailsEdit.aspx") %>';
        var url = progMgmtPath + '?projectId=' + projectId + '&manuscriptId=' + manuscriptId;
        showEditDetailsInModal(url,'Manuscript Details',800);
        return false;
    }
    
    function refreshList(manuscriptId, projectId)
    {
        parent.refreshList(manuscriptId, projectId);
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
            font-size: 12px;
            width: 65px;

        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <cic:CaisisHidden Field="ManuscriptId" Table="ProjectManuscript" id="ManuscriptId"
            runat="server" />
        <uc1:helpToolTip ID="HelpToolTipLayer" runat="server" />
        <asp:Label runat="server" ID="DetailsHeader" CssClass="ProjMgrDetailsHeader">
            <asp:Label runat="server" ID="Title"></asp:Label></asp:Label>
        <div id="PDFormDiv" style="overflow: auto; border: 1px solid #cccccc; position: relative;
            background-color: #ffffff; padding: 10px;">
            
            <div style="width: 100%; height: 360px; overflow: auto; margin-bottom: 10px;" >
            
            <asp:Panel ID="DisplayManuscriptPanel" runat="server">
                <table runat="server" id="DetailsViewLayer" class="ContentDetails" cellpadding="4">
                    <tr>
                        <td class="LabelCol">
                            Notes
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="Notes" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Status
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="Status" runat="server" />
                        </td>
                    </tr>
                </table>
                <div id="divPublication" runat="server" style="display: none;">
                    <table runat="server" id="PublicationInfo" class="ContentDetails" cellpadding="4">
                        <tr>
                            <td class="LabelCol">
                                Published Year
                            </td>
                            <td class="ValueCol">
                                <asp:Label ID="PublishedYear" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="LabelCol">
                                Online Published Date
                            </td>
                            <td class="ValueCol">
                                <asp:Label ID="OnlinePublishedDate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="LabelCol">
                                Journal Name
                            </td>
                            <td class="ValueCol">
                                <asp:Label ID="JournalName" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
                <img src="Images/ViewOptionalFields.gif" style="width: 112px; height: 9px; cursor: pointer;
                    float: right; margin-right: 30px;" onclick="setOptionalFields(this); return false;"
                    alt="View Optional Fields" title="View Optional Fields" />
                <div id="DisplayManuscriptOptional" runat="server" style="display: none; border: solid 1px #cccccc;
                    background-color: #eeeff0; margin-top: 20px; width: 90%">
                    <table cellpadding="4" width="100%">
                        <tr>
                            <td class="LabelCol" style="width: 33%; font-size: 11px; vertical-align: middle;">
                                Research Category
                            </td>
                            <td colspan="3">
                                <asp:Label runat="server" ID="ResearchCategory" />
                            </td>
                        </tr>
                        <tr>
                            <td class="LabelCol" style="width: 33%; font-size: 11px; vertical-align: middle;">
                                Manuscript Type
                            </td>
                            <td style="width: 27%">
                                <asp:Label runat="server" ID="ManuscriptType" />&nbsp;
                            </td>
                            <td class="LabelCol" style="width: 25%; font-size: 11px; vertical-align: middle;">
                                Deadline Date
                            </td>
                            <td style="width: 15%">
                                <asp:Label runat="server" ID="DeadlineDate" />
                            </td>
                        </tr>
                        <tr>
                            <td class="LabelCol" style="font-size: 11px; vertical-align: middle;">
                                Conference Title
                            </td>
                            <td colspan="3">
                                <asp:Label runat="server" ID="ConferenceTitle" />
                            </td>
                        </tr>
                        <tr>
                            <td class="LabelCol" style="font-size: 11px; vertical-align: middle;">
                                Conference Start Date
                            </td>
                            <td colspan="3">
                                <asp:Label runat="server" ID="ConferenceStartDate" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="ViewEventsPanel" runat="server" style="margin-top: 30px; width: 90%">
                    <asp:Label runat="server" ID="EventLabel" Text="Events"  style="display: block; font-size: 12px; font-weight: bold;" />
                    <asp:GridView runat="server" ShowHeader="true" HeaderStyle-CssClass="dataGridHeader"
                        ID="ProjectManuscriptEventGridViewReadOnly" AutoGenerateColumns="false" ShowFooter="false"
                        RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB">
                        <Columns>
                            <asp:TemplateField HeaderText="Date" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                                <ItemTemplate>
                                    <asp:Label Width="50" Text='<%#Eval("EventDate")%>' runat="server" ID="ProjectManuscriptEventEventDate" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Event" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                                <ItemTemplate>
                                    <asp:Label Width="100" Text='<%#Eval("EventName")%>' runat="server" ID="ProjectManuscriptEventEventName" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Editor" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                                <ItemTemplate>
                                    <asp:Label Width="150" Text='<%#Eval("Name")%>' runat="server" ID="ProjectManuscriptEventName" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Document Name" ItemStyle-VerticalAlign="Top" ItemStyle-Width="100px"
                                FooterStyle-VerticalAlign="Top">
                                <ItemTemplate>
                                    <div onmouseover="var docName = '<%#Eval("DocumentName")%>'; showToolTipMessage(docName);"
                                        onmouseout="hideToolTip();">
                                        <asp:Label Text='<%#Eval("DocumentName")%>' ID="ProjectManuscriptEventDocument" runat="server" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes" ItemStyle-VerticalAlign="Top" ItemStyle-Width="50px"
                                FooterStyle-VerticalAlign="Top">
                                <ItemTemplate>
                                    <div onmouseover="var notes = '<%#Eval("Notes")%>'; showToolTipMessage(notes);" onmouseout="hideToolTip();">
                                        <asp:Label ID="ProjectManuscriptEventNotes" runat="server" Text='<%#Eval("Notes")%>' />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle BorderColor="Black" />
                    </asp:GridView>
                </div>
                <span  style="display: block; font-size: 12px; font-weight: bold; margin-top: 30px;" >Authors</span>
                <asp:GridView HeaderStyle-CssClass="dataGridHeader" BorderColor="#cccccc" runat="server"
                    ID="ManuscriptAuthorGridViewReadOnly" ShowHeader="true" AutoGenerateColumns="false"
                    ShowFooter="false" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB">
                    <Columns>
                        <asp:TemplateField HeaderText="Author Name" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="150" runat="server" ID="Name" Text='<%#Eval("Name")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Author Role" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="100" runat="server" ID="AuthorRole" Text='<%#Eval("AuthorRole") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact Author" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="100" runat="server" ID="PrimaryAuthor" Text='<%#Eval("PrimaryAuthor") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Author Order" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="50" runat="server" ID="AuthorOrder" Text='<%#Eval("AuthorOrder")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label runat="server" ID="CitationLabel" Text="Citations"  style="display: block; font-size: 12px; font-weight: bold; margin-top: 30px;" />
                <asp:GridView HeaderStyle-CssClass="dataGridHeader" BorderColor="#cccccc" runat="server"
                    ID="ManuscriptCitationGridViewReadOnly" ShowHeader="true" AutoGenerateColumns="false"
                    ShowFooter="false" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB">
                    <Columns>
                        <asp:TemplateField HeaderText="Year" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="80" runat="server" ID="CitationYear" Text='<%#Eval("CitationYear")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Count" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="50" runat="server" ID="CitationCount" Text='<%#Eval("CitationCount") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Notes" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="220" runat="server" ID="Notes" Text='<%#Eval("Notes")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
            
            </div>
            <table class="ProjectMgmtBtnContainer">
                <tr>
                    <td><asp:ImageButton ID="DeleteButton" runat="server" ImageUrl="Images/Button_Delete.gif"
                            ToolTip="Delete Manuscript" CausesValidation="false" OnClientClick="return confirmDelete();"
                            OnClick="DeleteButton_Click" />
                        </td>
                    <td><asp:ImageButton ID="EditButton" runat="server" ImageUrl="Images/Button_Edit.gif"
                            ToolTip="Edit Manuscript" OnClientClick="return goToEditDetails();" />
                        
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
