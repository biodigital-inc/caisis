<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectCommunicationLogDetails.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectCommunicationLogDetails" %>

<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Communication Log</title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        Browser.ResizeElement({ nodeId: 'commLogDiv', heightOffset: 270 });

        /* ]]> */
    </script>

    <style type="text/css">
        #projectDataEntryButtons
        {
            margin: 0px auto 0px auto;
        }
        #projectDataEntryButtons input
        {
            float: right;
            margin-top: 15px;
            margin-right: 20px;
            width: 100px;
            font-size: 11px;
        }
        .ComLogGridContainer
        {
            width: 902px;
            overflow: auto;
            overflow-x: hidden;
            margin: 0px auto 0px auto;
            padding: 1px;
        }
        #commLogTableHeader
        {
            border: solid 1px #cccccc;
            border-bottom: none;
            table-layout: fixed;
            width: 100%;
            margin: 0px auto 0px auto;
        }
        #commLogTableHeader td
        {
            background-color: #00668D;
            color: #ffffff;
            font-family: Arial;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
            padding: 3px 10px 3px 10px;
        }
        #commLogTable
        {
            border: solid 1px #cccccc;
            border-bottom: none;
            table-layout: fixed;
            width: 100%;
            margin: 0px auto 0px auto;
        }
        #commLogTable td
        {
            padding: 7px 10px 7px 10px;
            color: #222222;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            vertical-align: top;            
        }
        #commLogTable td.header
        {
            background-color: #00668D;
            color: #ffffff;
            font-family: Arial;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
        }
        #commLogTable td.notes
        {
            border-bottom: solid 1px #cccccc;
            padding-bottom: 16px;
        }
        #commLogTable td.notes table.commNotesTable
        {
            width: 100%;
        }
        #commLogTable td.notes table.commNotesTable td
        {
            padding: 0px 0px 0px 10px;
            color: #666666;
            font-size: 12px;
            font-weight: normal;
            text-align: left;
        }
        .rowA
        {
            background-color: #ffffff;
        }
        .rowB
        {
            background-color: #DFEDF9;
        }
        
        input[type="text"]
        {
            border: solid 1px #999999;
        }
        input[type="text"]:hover
        {
            border: solid 1px #8d2a2c;
        }
        textarea
        {
            border: solid 1px #cccccc;
        }
        textarea:hover
        {
            border: solid 1px #8d2a2c;
        }
        #commLogDiv
        {
            overflow: auto;
            overflow-x: hidden;
        }
        .ReadOnlyLogLabel
        {
            text-align: left;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 902px; margin: 0px auto 0px auto;">
            <table id="commLogTableHeader" cellspacing="0">
                <tr>
                    <td class="header" style="width: 100px;">
                        Date
                    </td>
                    <td class="header" style="width: 125px;">
                        Type
                    </td>
                    <td class="header" style="width: auto;">
                        Description
                    </td>
                    <td class="header" style="width: 135px;">
                        Contact
                    </td>
                    <td class="header" style="width: 150px;">
                        Organization
                    </td>
                    <td class="header" style="width: 50px;">
                        <span style="font-size: 11px; <%= BtnSave.Visible ? "": "display: none;" %>">Delete</span>&nbsp;
                    </td>
                </tr>
                </table>
                <div  id="commLogDiv" >
                <table id="commLogTable" cellspacing="0">
                <asp:Repeater runat="server" ID="ReadOnlyLogRptr" OnItemDataBound="SetLabelState">
                    <ItemTemplate>
                        <tr class="<%# Container.ItemIndex %2 ==0 ? "rowA" : "rowB" %>">
                            <td style="width: 100px;">
                                <cic:CaisisHidden runat="server" ID="CommunicationLogIdField" Table="ProjectCommunicationLog"
                                    Field="CommunicationLogId" />
                                <cic:CaisisTextBox runat="server" ID="CommDateText" Table="ProjectCommunicationLog"
                                    Field="LogCommDateText" ShowLabel="false" ShowCalendar="true" CalcDate="true"
                                    Style="width: 70px;" OnValueChanged="MarkRowDirty"></cic:CaisisTextBox>
                                <cic:CaisisHidden runat="server" ID="CommDate" Table="ProjectCommunicationLog" Field="LogCommDate"
                                    ShowLabel="false" DisplayCalculatedDate="false" OnValueChanged="MarkRowDirty" />
                                <asp:Label runat="server" ID="LogCommDateTextLabel" CssClass="ReadOnlyLogLabel"></asp:Label>
                            </td>
                            <td style="width: 125px;">
                                <cic:CaisisComboBox ID="CaisisComboBox1" runat="server" Table="ProjectCommunicationLog"
                                    Field="LogCommType" LookupCode="CommunicationType" DropDownHeight="auto" ShowLabel="false" Style="width: 100px;"
                                    OnValueChanged="MarkRowDirty"></cic:CaisisComboBox>
                                <asp:Label runat="server" ID="LogCommTypeLabel" CssClass="ReadOnlyLogLabel"></asp:Label>
                            </td>
                            <td style="text-align: left; width: auto;">
                                <cic:CaisisTextBox ID="CaisisTextBox1" runat="server" Table="ProjectCommunicationLog"
                                    Field="LogCommDescription" ShowLabel="false" ShowTextEditor="true" OnValueChanged="MarkRowDirty" Width="90%"></cic:CaisisTextBox>
                                <asp:Label runat="server" ID="LogCommDescriptionLabel" CssClass="ReadOnlyLogLabel"></asp:Label>
                            </td>
                            <td style="width: 135px;">
                                <cic:CaisisSelect ID="ContactSel" runat="server" Table="ProjectCommunicationLog"
                                    Field="ContactId" ShowLabel="false" Width="90%" DataTextField="Name" DataValueField="ContactId"
                                    OnValueChanged="MarkRowDirty">
                                </cic:CaisisSelect>
                                <asp:Label runat="server" ID="ContactIdLabel" CssClass="ReadOnlyLogLabel"></asp:Label>
                            </td>
                            <td style="width: 150px;">
                                <cic:CaisisSelect ID="OrgSel" runat="server" Table="ProjectCommunicationLog" Field="OrganizationId"
                                    ShowLabel="false" Width="90%" DataTextField="Name" DataValueField="OrganizationId"
                                    OnValueChanged="MarkRowDirty">
                                </cic:CaisisSelect>
                                <asp:Label runat="server" ID="OrganizationIdLabel" CssClass="ReadOnlyLogLabel"></asp:Label>
                            </td>
                            <td style="width: 50px; text-align: left;">
                                <asp:ImageButton ID="DeleteBtn" runat="server" ImageUrl="~/Images/iconDelete.gif"
                                    AlternateText="Delete This Record" OnClientClick="return confirm('Are you sure you want to delete this record?');" OnCommand="DeleteRow" CommandArgument='<%# Eval("CommunicationLogId") %>' />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="<%# Container.ItemIndex %2 ==0 ? "rowA" : "rowB" %> notes">
                                <table cellspacing="0" class="commNotesTable">
                                    <tr>
                                        <td style="font-weight: bold; width: 100px;">
                                            <asp:Label runat="server" AssociatedControlID="LogCommNotesField" CssClass="ReadOnlyLogLabel">Notes:</asp:Label>
                                        </td>
                                        <td>
                                            <cic:CaisisTextArea ID="LogCommNotesField" runat="server" Table="ProjectCommunicationLog"
                                                Field="LogCommNotes" ShowLabel="false" ShowTextEditor="true" Width="90%" OnValueChanged="MarkRowDirty" Height="34"></cic:CaisisTextArea>
                                            <asp:Label runat="server" ID="LogCommNotesLabel"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            </div>
        <div id="projectDataEntryButtons">
            <asp:Button runat="server" ID="BtnSave" OnClick="SaveClick" Text="Save" ToolTip="Save"
                CssClass="dataEntryButtonRed" />
            <asp:Button runat="server" ID="BtnEdit" OnClick="EditClick" Text="Edit" ToolTip="Edit"
                CssClass="dataEntryButtonRed" />
            <asp:Button runat="server" ID="BtnCancel" OnClick="CancelClick" ToolTip="Cancel"
                Text="Cancel" CssClass="dataEntryButtonRed" />
            <asp:Button runat="server" ID="ExportBtn" OnClick="ExportClick" ToolTip="Export"
                Text="Export" CssClass="dataEntryButtonRed" />
        </div>
            
</div>
    </form>
</body>
</html>
