<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectLOIResponseDetails.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectLOIResponseDetails" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOI Response</title>

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        Browser.ResizeElement({ nodeId: 'GridOverflow', heightOffset: 300 });

        function refreshList(ProjectLOIResponseId, ProjectLetterOfIntentId) {
            parent.refreshList(ProjectLOIResponseId, ProjectLetterOfIntentId);
        }

        // Make a call to the server to get contacts by selected orgid
        function onOrgChange(orgSel, orgClientId, contactClientId) {
            var orgId = getSelectValue(orgSel);
            // Clear items in contact drop down
            $(contactClientId).clear();
            // Make a server request(function doOrgCallback registered by server)
            // with org id, and id of helper contact dropdown to populate
            if (doOrgCallback && orgId) {
                var arg = orgId + ';' + contactClientId;
                doOrgCallback(arg);
            }
        }

        // Gets called when server call retuns
        // Should receive a string in format
        //  ['contactid_hidden_field_id', new Array(['Contact 1', 23],['Mike Jones',46] ) ]
        function onOrgCallBackEnd(val) {
            var obj = eval(val);
            var contactSelect = $(obj[0]);
            var contactList = obj[1];
            if (contactSelect && contactList) {
                popualteSelectFromArray(contactSelect, contactList, true);
                contactSelect.selectedIndex = 0;
            }
        }

        // Copies the contactid from a helper contact dropdown to a hidden contactid field
        function copyToContactId(sel, contactIdField) {
            var contactId = getSelectValue(sel);
            $(contactIdField).value = contactId ? contactId : '';
        }

    </script>

    <style type="text/css">
        .LabelCol
        {
            font-weight: bold;
            text-align: left;
            width: 125px;
            vertical-align: top;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div runat="server" id="DetailsHeader" class="ProjMgrDetailsHeader">
            <asp:Label runat="server" ID="Source"></asp:Label>&nbsp;</div>
        <asp:Panel ID="EditResponsePanel" runat="server" Style="background-color: #ffffff;">
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                <tbody id="ResponseHeaderBody">
                </tbody>
            </table>
            <div id="GridOverflow" style="overflow: auto; border: 1px solid #cccccc; height: 400px;">
                <Custom:ExtendedGridView TableName="ProjectLOIResponse" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
                    RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowA"
                    UseAccessibleHeader="true" runat="server" ID="LOIResponseGridView" ShowHeader="true"
                    GridLines="None" BorderWidth="0" AutoGenerateColumns="false" ShowFooter="false"
                    ShowFooterOnEmpty="false" BlankRows="5" RebindOnDelete="true" OnRowDataBound="BindOrganizationsAndContacts"
                    Width="100%" style=" margin-top: 0px;">
                    <Columns>
                        <Custom:ExtendedTemplateField HeaderText="Response Date" HeaderStyle-Width="110px"
                            ItemStyle-Width="110px" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox Width="80" FieldLabel="Response Date" ShowCalendar="true" CalcDate="true"
                                    ShowLabel="false" Table="ProjectLOIResponse" Field="ResponseDateText" runat="server"
                                    ID="ResponseDateTextEdit" />
                                <cic:CaisisHidden ShowLabel="false" Table="ProjectLOIResponse" Field="ResponseDate"
                                    DisplayCalculatedDate="false" runat="server" ID="ResponseDateEdit" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Organization" ItemStyle-VerticalAlign="Top"
                            HeaderStyle-CssClass="dataGridHeaderRequired">
                            <ItemTemplate>
                                <cic:CaisisSelect FieldLabel="Organization" Table="ProjectLOIResponse" ShowLabel="false"
                                    Required="true" Field="OrganizationId" DataTextField="Name" DataValueField="OrganizationId"
                                    runat="server" ID="OrganizationEdit" Width="90%" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Name" HeaderStyle-Width="110px" ItemStyle-Width="110px"
                            ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <!-- This doprdown is only used on UI is not tracked/saved. HiddenField contacts ContactId -->
                                <select id="ContactNameEdit" runat="server" datatextfield="Name" datavaluefield="ContactId"
                                    style="width: 100px;">
                                </select>
                                <cic:CaisisHidden ID="ContactId" runat="server" Table="ProjectLOIResponse" Field="ContactId">
                                </cic:CaisisHidden>
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Participation" HeaderStyle-Width="100px"
                            ItemStyle-Width="100px" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisComboBox Width="75px" FieldLabel="Participation" Table="ProjectLOIResponse"
                                    Field="Participation" runat="server" ShowLabel="false" ID="ParticipationEdit"
                                    LookupCode="ProjectResponseParticipation" MaxLength="50" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Reason" HeaderStyle-Width="175px" ItemStyle-Width="175px"
                            ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisComboBox FieldLabel="Reason" Table="ProjectLOIResponse" Field="Reason"
                                    runat="server" ID="ReasonEdit" ShowLabel="false" LookupCode="ProjectResponseReason"
                                    MaxLength="255" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:ExtendedTemplateField HeaderText="Notes" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                            ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox FieldLabel="Notes" Width="125px" Table="ProjectLOIResponse" Field="Notes"
                                    ShowLabel="false" ShowTextEditor="true" runat="server" ID="EndDateEdit" MaxLength="1000" />
                            </ItemTemplate>
                        </Custom:ExtendedTemplateField>
                        <Custom:GridRowUIHelper HeaderText="Reset" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" CssClass="ResetGridRowLink" ImageUrl="~/Images/icon_refresh_small.gif"
                                    runat="server" Style="cursor: pointer; visibility: hidden;"></asp:HyperLink>
                            </ItemTemplate>
                        </Custom:GridRowUIHelper>
                        <Custom:GridRowDeleteImage HeaderText="Delete" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                            ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
                        </Custom:GridRowDeleteImage>
                    </Columns>
                </Custom:ExtendedGridView>
            </div>
        </asp:Panel>
        <asp:Panel ID="DisplayResponsePanel" runat="server">
            <div style="overflow: auto; border: 1px solid #cccccc; height: 450px; background-color: #ffffff;
                padding: 7px;">
                <asp:Panel runat="server" ID="NoRecordPanel" CssClass="NoRecord">
                    Please choose a record from the left.</asp:Panel>
                <table runat="server" id="DetailsViewLayer" class="ContentDetails">
                    <tr>
                        <td class="LabelCol">
                            Response Date
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="ResponseDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Organization
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="Organization" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Contact
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="ContactName" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Participation
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="Participation" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Reason
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="Reason" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Notes
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="Notes" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
    <table style="width: 80%; table-layout: fixed; margin: auto;">
        <tr>
            <td style="text-align: right; padding-right: 10px;">
                <asp:ImageButton ID="CancelButton" runat="server" ImageUrl="Images/Button_Cancel.gif"
                    OnClick="CancelButton_Click" CausesValidation="false"></asp:ImageButton>
            </td>
            <td style="text-align: left; padding-left: 10px;">
                <asp:ImageButton ID="UpdateButton" ValidationGroup="OrgValidGroup" runat="server"
                    ImageUrl="Images/Button_Save.gif" OnClick="UpdateButton_Click" CausesValidation="true"
                    OnClientClick="return validateGrids();"></asp:ImageButton>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
