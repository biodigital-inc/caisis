<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectManuscriptDetailsEdit.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectManuscriptDetailsEdit" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manuscript Details</title>

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        Browser.ResizeElement({ nodeId: 'OverflowPanel', heightOffset: 180, context: window });
              
        function setOptionalFields(toggleImage)
        {
            if ($('OptionalManuscript').style.display == 'none')
            {
                $('OptionalManuscript').style.display = 'block';
                toggleImage.src = 'Images/HideOptionalFields.gif';
            }
            else
            {
                $('OptionalManuscript').style.display = 'none';
                toggleImage.src = 'Images/ViewOptionalFields.gif';
            }
        }
        
        function goToJournalDetails(pageToOpen)
        {
            var page = pageToOpen;
            var url = window.location.href;
            url = url.substr(0,url.lastIndexOf("/")) + "/" + page;
            showEditDetailsInModal(url);
        }
        
        function openJournalDetails(bShow)
        {
            var details = $('JournalDetails');
            details.style.display = (bShow==true ? 'block' : 'none');
            details.center();
            /*
            $('JournalDetailsPage').style.display = (bShow==true ? 'block' : 'none');
            $('PanelManuscriptInfo').style.display = (bShow==true ? 'none' : 'block');
            $('EditAuthorsPanel').style.display = (bShow==true ? 'none' : 'block');
            $('EditCitationsPanel').style.display = (bShow==true ? 'none' : 'block');
            $('EditEventsPanel').style.display = (bShow==true ? 'none' : 'block');
            $('buttons').style.display = (bShow==true ? 'none' : 'block');*/
        }
        
        
        function reloadJournalList(JournalIds, JournalNames, selectedId)
        {
            var i;
            for(i=$('JournalID').options.length-1;i>=0;i--)
            {
                $('JournalID').remove(i);
            }
            
            for(i=0; i < JournalIds.length; i++)
            {
                var opt = document.createElement("option");

                $('JournalID').options.add(opt);

                // Assign text and value to Option object
                opt.text = JournalNames[i];
                opt.value = JournalIds[i];
                if (JournalIds[i] == selectedId)
                {
                    opt.selected="selected";
                }
            }
            
            openJournalDetails(false);
        }
        
        function setPublicationFields()
        {
            if ($('StatusEdit').value == "Publication")
            {
                $('EditCitationsPanel').style.display = 'block';
                $('CitationsLabel').style.display = 'block';
                $('divPublication').style.display = 'block';
            }
            else
            {
                $('EditCitationsPanel').style.display = 'none';
                $('CitationsLabel').style.display = 'none';
                $('divPublication').style.display = 'none';
            }
            
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
            font-weight: bold;
            text-align: left;
            width: 125px;
            vertical-align: top;
        }
        .VisibleEntryBtn
        {
            display: auto;
            vertical-align: middle;
            cursor: pointer;
        }
        .HiddenEntryBtn
        {
            display: none;
        }
        
        .DetailsSubSectionHeader
        {
            font-weight: bold;
            color: #000000;
            font-size: larger;
        }
        .ManuscriptPanel
        {
            border: solid 1px #999999;
            width: 750px;
            background-color: #ffffff;
        }
        .pdFormFieldLabel
        {
            margin-right: 8px;
        }
    </style>
</head>
<body style="background-color: #ffffff;">
    <form id="form1" runat="server">
        <div id="OverflowPanel" style="width: 99%; height: 500px; overflow: auto; border: solid 1px #cccccc;">
            <div id="JournalDetails" style="border: 1px solid black; position: absolute; display: none;">
                <div style="background-color: Red;">
                    Journal Details</div>
                <iframe src="ProjectJournalDetails.aspx" runat="server" id="JournalDetailsPage" frameborder="0"
                    style="width: 400px; height: 275px; overflow: auto;"></iframe>
            </div>
            <asp:Panel ID="PanelManuscriptInfo" runat="server" Width="90%">
                <table id="TableManuscriptInfo" cellpadding="4">
                    <tr>
                        <td colspan="2">
                            <cic:CaisisTextBox ID="ManuscriptTitleEdit" runat="server" FieldLabel="Manuscript Title"
                                ShowLabel="true" Table="ProjectManuscript" Field="Title" Width="388px" MaxLength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <cic:CaisisTextArea ID="NotesEdit" runat="server" FieldLabel="Notes" ShowLabel="true"
                                Table="ProjectManuscript" Field="Notes" Width="374px" MaxLength="1000" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <cic:CaisisSelect ID="StatusEdit" runat="server" onchange="setPublicationFields()"
                                FieldLabel="Status" ShowLabel="true" Table="ProjectManuscript" Field="Status"
                                LookupCode="ProjectManuscriptStatus" Width="150px" />
                        </td>
                    </tr>
                </table>
                <div id="divPublication" runat="server" style="display: none;">
                    <table runat="server" id="PublicationInfo" class="ContentDetails">
                        <tr>
                            <td colspan="2">
                                <cic:CaisisTextBox ID="PublishedYearEdit" runat="server" FieldLabel="Published Year"
                                    ShowLabel="true" Table="ProjectManuscript" Field="PublishedYear" Width="150px" MaxLength="50" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <cic:CaisisTextBox ID="OnlinePublishedDateEdit" runat="server" FieldLabel="Online Published Date"
                                    ShowLabel="true" Table="ProjectManuscript" Field="OnlinePublishedDate" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisSelect ID="JournalId" runat="server" FieldLabel="Journal Name" ShowLabel="true"
                                    Table="ProjectManuscript" Field="JournalId" />
                            </td>
                            <td>
                                <asp:Button ID="AddJournalButton" runat="server" Text="Add a New Journal" OnClientClick="openJournalDetails(true); return false;" />
                            </td>
                        </tr>
                    </table>
                </div>
                <img src="Images/ViewOptionalFields.gif" style="width: 112px; height: 9px; cursor: pointer;
                    float: right; margin-right: 50px;" onclick="setOptionalFields(this); return false;" />
                <div id="OptionalManuscript" style="display: none; border: solid 1px #cccccc; background-color: #eeeff0;
                    margin-top: 20px;">
                    <table id="TableOptionalManuscriptInfo">
                        <tr>
                            <td colspan="2">
                                <cic:CaisisSelect ID="ResearchCategoryEdit" runat="server" FieldLabel="Research Category"
                                    ShowLabel="true" Table="ProjectManuscript" Field="ResearchCategory" LookupCode="ResearchCategory"
                                    Width="206px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisSelect ID="ManuscriptTypeEdit" runat="server" FieldLabel="Manuscript Category"
                                    ShowLabel="true" Table="ProjectManuscript" Field="ManuscriptType" LookupCode="ManuscriptCategory"
                                    Width="206px" />
                            </td>
                            <td>
                                <cic:CaisisTextBox ID="DeadlineDateEdit" runat="server" ShowCalendar="true" CalcDate="false"
                                    FieldLabel="Deadline" ShowLabel="true" Table="ProjectManuscript" Field="DeadlineDate" MaxLength="50" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisComboBox ID="ConferenceTitleEdit" runat="server" FieldLabel="Conference Name"
                                    ShowLabel="true" Table="ProjectManuscript" Field="ConferenceTitle" LookupCode="ConferenceName" MaxLength="50" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisTextBox ID="ConferenceStartDateEdit" runat="server" FieldLabel="Conference Start Date"
                                    ShowCalendar="true" CalcDate="false" ShowLabel="true" Table="ProjectManuscript"
                                    Field="ConferenceStartDate" MaxLength="50" />
                            </td>
                            <td>
                                <cic:CaisisTextBox ID="ConferenceEndDateEdit" runat="server" ShowCalendar="true"
                                    CalcDate="false" FieldLabel="Conference End Date" ShowLabel="true" Table="ProjectManuscript"
                                    Field="ConferenceEndDate" Visible="False" MaxLength="50" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <cic:CaisisHidden Field="ManuscriptId" Table="ProjectManuscript" id="ManuscriptIdField"
                runat="server" />
            <asp:Panel ID="EditEventsPanel" runat="server" style="margin-top: 30px;">
                <asp:Label ID="EventsLabel" runat="server" Text="Events" CssClass="DetailsSubSectionHeader"></asp:Label>
                <Custom:ExtendedGridView TableName="ProjectManuscriptEvent" runat="server" ID="ProjectManuscriptEventGridView"
                    ShowHeader="true" AutoGenerateColumns="false" ShowFooter="false" HeaderStyle-CssClass="dataGridHeader"
                    OnRowDataBound="ManuscriptEventGridView_RowDataBound" ShowFooterOnEmpty="false"
                    BlankRows="5" RebindOnDelete="true" CssClass="ManuscriptPanel">
                    <Columns>
                        <Custom:GridRowDeleteImage HeaderText="Delete" ItemStyle-VerticalAlign="Top">
                        </Custom:GridRowDeleteImage>
                        <Custom:ExtendedTemplateField HeaderText="Date" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox Width="80" ShowCalendar="true" CalcDate="False" FieldLabel="Event Date"
                                    ShowLabel="false" runat="server" ID="ProjectManuscriptEventEventDate" Table="ProjectManuscriptEvent"
                                    Field="EventDate" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Event" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisComboBox Width="150" FieldLabel="Event" ShowLabel="false" runat="server"
                                    ID="ProjectManuscriptEventEventName" Table="ProjectManuscriptEvent" Field="EventName"
                                    LookupCode="ManuscriptEvents" MaxLength="50" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Editor" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisSelect Width="150" FieldLabel="Editor" ShowLabel="false" runat="server"
                                    ID="ProjectManuscriptEventName" Table="ProjectManuscriptEvent" Field="ContactId" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Document" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextArea Width="100" Height="15" FieldLabel="Document Name" ShowLabel="false"
                                    runat="server" ID="ProjectManuscriptEventDocumentName" Table="ProjectManuscriptEvent"
                                    Field="DocumentName" MaxLength="50" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Notes" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextArea Width="100" Height="15" FieldLabel="Notes" ShowLabel="false"
                                    runat="server" ID="ProjectManuscriptEventNotes" Table="ProjectManuscriptEvent"
                                    Field="Notes" MaxLength="50" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                    </Columns>
                </Custom:ExtendedGridView>
            </asp:Panel>
            <asp:Panel ID="EditAuthorsPanel" runat="server" style="margin-top: 30px;">
                <asp:Label ID="Label2" runat="server" Text="Authors" CssClass="DetailsSubSectionHeader"></asp:Label>
                <Custom:ExtendedGridView TableName="ProjectManuscriptAuthor" HeaderStyle-CssClass="dataGridHeader"
                    BorderColor="#cccccc" runat="server" ID="ManuscriptAuthorGridView" ShowHeader="true"
                    AutoGenerateColumns="false" ShowFooter="false" ShowFooterOnEmpty="false" BlankRows="5"
                    OnRowDataBound="ManuscriptAuthorGridView_RowDataBound" RebindOnDelete="true"
                    CssClass="ManuscriptPanel">
                    <Columns>
                        <Custom:GridRowDeleteImage HeaderText="Delete" ItemStyle-VerticalAlign="Top">
                        </Custom:GridRowDeleteImage>
                        <Custom:ExtendedTemplateField HeaderText="Author Name" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisSelect Width="150" FieldLabel="Editor" ShowLabel="false" runat="server"
                                    ID="ManuscriptInfoAuthorName" Table="ProjectManuscriptAuthor" Field="ContactId" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAuthorName" runat="server"
                                    ControlToValidate="ManuscriptInfoAuthorName" ValidationGroup="AuthorInfo" ErrorMessage="required"></asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Author Role" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisSelect Width="100" FieldLabel="Role" ShowLabel="false" runat="server"
                                    ID="ManuscriptInfoAuthorRole" Table="ProjectManuscriptAuthor" Field="AuthorRole"
                                    LookupCode="AuthorRole" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAuthorRole" runat="server"
                                    ControlToValidate="ManuscriptInfoAuthorRole" ValidationGroup="AuthorInfo" ErrorMessage="required"></asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Contact Author" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisSelect Width="100" FieldLabel="Contact Author" ShowLabel="false" runat="server"
                                    ID="ManuscriptInfoPrimaryAuthor" Table="ProjectManuscriptAuthor" Field="PrimaryAuthor"
                                    LookupCode="PrimaryAuthor" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrimaryAuthor" runat="server"
                                    ControlToValidate="ManuscriptInfoPrimaryAuthor" ValidationGroup="AuthorInfo"
                                    ErrorMessage="required"></asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Author Order" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisSelect Width="100" FieldLabel="Author Order" ShowLabel="false" runat="server"
                                    ID="ManuscriptInfoAuthorOrder" Table="ProjectManuscriptAuthor" Field="AuthorOrder"
                                    LookupCode="AuthorOrder" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAuthorOrder" runat="server"
                                    ControlToValidate="ManuscriptInfoAuthorOrder" ValidationGroup="AuthorInfo" ErrorMessage="required"></asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                    </Columns>
                </Custom:ExtendedGridView>
            </asp:Panel>
            <asp:Panel ID="EditCitationsPanel" runat="server" style="margin-top: 30px;">
                <asp:Label ID="CitationsLabel" runat="server" Text="Citations"  CssClass="DetailsSubSectionHeader" ></asp:Label>
                <Custom:ExtendedGridView TableName="ProjectManuscriptCitation" HeaderStyle-CssClass="dataGridHeader"
                    BorderColor="#cccccc" runat="server" ID="PublicationCitationGridView" ShowHeader="true"
                    AutoGenerateColumns="false" ShowFooter="false" ShowFooterOnEmpty="false" BlankRows="5"
                    RebindOnDelete="true" CssClass="ManuscriptPanel">
                    <Columns>
                        <Custom:GridRowDeleteImage HeaderText="Delete" ItemStyle-VerticalAlign="Top">
                        </Custom:GridRowDeleteImage>
                        <Custom:ExtendedTemplateField HeaderText="Year" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox Width="50" ShowLabel="false" runat="server" ID="PublicationCitationYear"
                                    Table="ProjectManuscriptCitation" Field="CitationYear" MaxLength="50" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Count" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox Width="50" ShowLabel="false" runat="server" ID="PublicationCitationCount"
                                    Table="ProjectManuscriptCitation" Field="CitationCount" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Notes" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextArea Width="460" Height="40" ShowLabel="false" runat="server" ID="PublicationCitationNotes"
                                    Table="ProjectManuscriptCitation" Field="Notes" style="margin-left: 30px;" MaxLength="1000" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                    </Columns>
                </Custom:ExtendedGridView>
            </asp:Panel>
            
        </div>
        <div id="buttons" style="display: block; text-align: center; margin-top: 10px;">
                <asp:ImageButton ID="DeleteButton" runat="server" ImageUrl="Images/Button_Delete.gif"
                    ToolTip="Delete Manuscript" CausesValidation="false" OnClientClick="return confirmDelete();"
                    OnClick="DeleteButton_Click" style="margin-right: 20px;" />
                <asp:ImageButton ID="CancelEventsButton" runat="server" ImageUrl="Images/Button_Cancel.gif"
                    ToolTip="Cancel Edit" CausesValidation="false" OnClientClick="top.hideModal(); return false;"
                    OnClick="CancelEventsButton_Click" style="margin-right: 20px;" />
                <asp:ImageButton ID="UpdateEventsButton" runat="server" ImageUrl="Images/Button_Save.gif"
                    ToolTip="Save Manuscript" CausesValidation="true" ValidationGroup="ExistingEvents"
                    OnClick="UpdateEventsButton_Click" />
            </div>
    </form>
</body>
</html>
