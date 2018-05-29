<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminManageTimeline.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminManageTimeline" %>

<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Timeline</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/ProtocolMgmtStyles.css" rel="stylesheet" type="text/css" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery.noConflict();

        jQuery(document).ready(function (e) {
            var inputs = jQuery("#TimelineTable input,#TimelineTable select");
            var reset = jQuery("input[type='reset']");

            var adjustAudit = function (input) {
                var td = input.parents("td").add(input.parents("th"));
                var isDefault = input.is(":checkbox") ? (input[0].defaultChecked == input[0].checked) : (input.is("select") ? (input.find(":selected")[0].defaultSelected == true) : (input[0].defaultValue == input[0].value));
                if (isDefault) {
                    td.removeClass("audit");
                }
                else {
                    td.addClass("audit");
                }
            };
            inputs.change(function (e) {
                var input = jQuery(this);
                adjustAudit(input);
            });
            reset.click(function (e) {
                jQuery("#dataForm")[0].reset();
                inputs.each(function (index, input) {
                    adjustAudit(jQuery(input));
                });
            });
        });

        function confirmDeleteTimeline() {
            return confirmDelete("Are you sure you would like to remove this Visit? This action CANNOT be undone.");
        }

    </script>
    <style type="text/css">
        label
        {
            display: inline-block;
            font-weight: bold;
        }
        fieldset
        {
            border: 1px solid #eeeeee;
            padding: 0;
            margin: 1px auto;
        }
        fieldset legend
        {
        }
        fieldset .unit
        {
            width: 65px;
        }
        fieldset .unitValue
        {
            width: 25px;
        }
        #TimelineTable
        {
            margin: 5px 0;
        }
        #TimelineTable thead th
        {
            padding: 3px;
        }
        #TimelineTable tbody td:first-child
        {
            text-align: left;
            font-weight: bold;
        }
        #TimelineTable tbody td
        {
            text-align: center;
        }
        th.audit, td.audit
        {
            background-color: #884C4D;
        }
    </style>
</head>
<body>
    <form id="dataForm" runat="server">
    <label for="SchemaSelection">
        Select Schema:
    </label>
    <cic:CaisisSelect runat="server" ID="SchemaSelection" ShowLabel="false" DataTextField="ItemText"
        DataValueField="ItemValue" OnSelectedIndexChanged="BuildSchemaTimeline" AutoPostBack="true">
    </cic:CaisisSelect>
    <asp:PlaceHolder runat="server" ID="TimelinePanel" Visible="false">
        <table id="TimelineTable" cellpadding="0" cellspacing="0" border="0" class="dataGrid">
            <thead>
                <tr class="dataGridHeader">
                    <th>
                        Timeline
                    </th>
                    <asp:Repeater runat="server" ID="TimelineRptr" OnItemCreated="TrackFieldUpdates"
                        OnItemDataBound="SetFieldValues">
                        <ItemTemplate>
                            <th>
                                <cic:CaisisHidden runat="server" ID="TimelineId" Table="ProtocolMgr_Timeline" Field="TimelineId">
                                </cic:CaisisHidden>
                                <fieldset title="Label">
                                    <legend>Label</legend>
                                    <cic:CaisisTextBox runat="server" ID="VisitLabel" ShowLabel="false" Table="ProtocolMgr_Timeline"
                                        Field="VisitLabel"></cic:CaisisTextBox>
                                </fieldset>
                                <fieldset title="Units">
                                    <legend>Units</legend>
                                    <cic:CaisisSelect runat="server" ID="DisplayUnitName" ShowLabel="false" Table="ProtocolMgr_Timeline"
                                        Field="DisplayUnitName" CssClass="unit">
                                        <asp:ListItem Text="Day" Value="Day"></asp:ListItem>
                                        <asp:ListItem Text="Week" Value="Week"></asp:ListItem>
                                        <asp:ListItem Text="Month" Value="Month"></asp:ListItem>
                                    </cic:CaisisSelect>
                                    <cic:CaisisTextBox runat="server" ID="NumberOfUnits" ShowLabel="false" Table="ProtocolMgr_Timeline"
                                        Field="NumberOfUnits" CssClass="unitValue"></cic:CaisisTextBox>
                                </fieldset>
                                <fieldset title="Buffer">
                                    <legend>Buffer</legend>+<cic:CaisisTextBox runat="server" ID="BufferNumberOfUnitsPlus"
                                        ShowLabel="false" Table="ProtocolMgr_Timeline" Field="BufferNumberOfUnitsPlus"
                                        CssClass="unitValue"></cic:CaisisTextBox>
                                    <label>
                                        -<cic:CaisisTextBox runat="server" ID="BufferNumberOfUnitsMinus" ShowLabel="false"
                                            Table="ProtocolMgr_Timeline" Field="BufferNumberOfUnitsMinus" CssClass="unitValue"></cic:CaisisTextBox></label>
                                    <cic:CaisisSelect runat="server" ID="BufferUnitName" ShowLabel="false" Table="ProtocolMgr_Timeline"
                                        Field="BufferUnitName" CssClass="unit">
                                        <asp:ListItem Text="Days" Value="Day"></asp:ListItem>
                                        <asp:ListItem Text="Weeks" Value="Week"></asp:ListItem>
                                        <asp:ListItem Text="Months" Value="Month"></asp:ListItem>
                                    </cic:CaisisSelect>
                                </fieldset>
                                <fieldset title="Interval Type">
                                    <legend>Interval Type</legend>
                                    <cic:CaisisTextBox runat="server" ID="ItemIntervalType" ShowLabel="false" Table="ProtocolMgr_Timeline"
                                        Field="ItemIntervalType"></cic:CaisisTextBox>
                                </fieldset>
                                <asp:Button runat="server" ID="DeleteTimelineBtn" OnCommand="DeleteTimelineClick"
                                    CommandArgument='<%# Eval("TimelineId") %>' Text="Delete" CssClass="dataEntryButtonRed"
                                    OnClientClick="return confirmDeleteTimeline();" />
                            </th>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater runat="server" ID="SchemaItemsRptr" OnItemDataBound="SetSchemaFields">
                    <ItemTemplate>
                        <tr class="<%# Container.ItemIndex%2==0?"ItemRow_A":"ItemRow_B" %>">
                            <td>
                                <cic:CaisisHidden runat="server" ID="SchemaItemId" Table="ProtocolMgr_SchemaItems"
                                    Field="SchemaItemId">
                                </cic:CaisisHidden>
                                <%# Eval("ItemDescription")%>
                            </td>
                            <asp:Repeater runat="server" ID="ItemTimelineRptr" OnItemDataBound="SetItemTimeline">
                                <ItemTemplate>
                                    <td>
                                        <cic:CaisisHidden runat="server" ID="TimelineId" Table="ProtocolMgr_Timeline" Field="TimelineId">
                                        </cic:CaisisHidden>
                                        <asp:HiddenField runat="server" ID="ItemTimelineId" />
                                        <asp:CheckBox runat="server" ID="ItemTimelineCheckBox" OnCheckedChanged="MarkUpdatedItemTimeline" />
                                    </td>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <asp:Button runat="server" ID="UpdateBtn" Text="Update" CssClass="dataEntryButtonRed"
            OnClick="UpdateClick" /></asp:PlaceHolder>
    <input type="reset" class="dataEntryButtonGray" value="Reset" />
    </form>
</body>
</html>
