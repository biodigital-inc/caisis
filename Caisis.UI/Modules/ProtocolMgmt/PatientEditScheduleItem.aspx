<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientEditScheduleItem.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientEditScheduleItem" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit Patient Schedule</title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>
    <script type="text/javascript">

        jQuery.noConflict();

        jQuery(document).ready(function (e) {
            resizeElements(e);
            jQuery(window).resize(resizeElements);
        });

        function resizeElements() {
            var height = jQuery(window).height();
            var div = jQuery("#RecordContainer");
            var maxHeight = Math.max(height - 125, 100);
            div.css("max-height", maxHeight + "px");
            // adjust headers
            adjustExternalTableHeader("TableValues");
        }

        function adjustExternalTableHeader(id) {
            var table = jQuery("#" + id);
            var header = jQuery("#" + id + "_Header");
            var th = header.find("thead th");
            var td = table.find("tbody tr:first-child td");
            var headerCount = th.size();
            var widthProperty = "outerWidth";  //true == 'transfer' ? 'outerWidth' : 'width';
            for (var i = 0; i < headerCount; i++) {
                var thWidth = th.eq(i)[widthProperty]();
                td.eq(i).width(thWidth);
                if (i == headerCount - 1)
                    td.eq(headerCount - 1).css("width", "auto");
            }
        }

        function showRemoveBtn() {
            var btn = jQuery("#RemoveAdminBtn");
            if (btn.is(":hidden"))
                btn.show();
            else
                btn.hide();
            return false;
        }

        function confirmDisassociate() {
            if (confirm("Are you sure you would like to disassociate all records with this visit item?")) {
                return confirm("You are about to disassociate all records with this visit item; and cannot be undone. Continue?");
            }
            return true;
        }

        function selectDataEntryTab(panelId, link) {
            var panels = jQuery("div.dataEntryPanel");
            var tabs = jQuery(".dataEntryNavToggle a");
            var panel = jQuery("#" + panelId);
            var tab = jQuery(link);
            panels.hide();
            panel.show();
            tabs.removeClass("active");
            tab.addClass("active");
        }

    </script>
    <style type="text/css">
        .dataGrid
        {
            table-layout: fixed;
            width: 100%;
            margin: 0;
        }
        .dataGrid td
        {
            white-space: normal;
        }
        #RecordPager
        {
            display: none; /*
            position: fixed;
            background-color: #ffffff;
            border: 1px solid #eeeeee;
            margin: 0;
            top: 0;
            left: 0;
            right: 0;
            */
        }
        /*#RecordFooter
        {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
        }
        */
        #RecordContainer
        {
            max-height: 400px;
            overflow: auto;
        }
        #UpdateBtn
        {
            display: block;
            width: 150px;
            text-align: center;
            margin: 3px auto;
        }
        input[type="text"]
        {
            width: 85px;
        }
    </style>
</head>
<body>
    <form id="dataForm" method="post" runat="server">
    <div runat="server" id="ToggleSelection" class="dataEntryNavToggleContainer">
        <div class="dataEntryNavToggle">
            <a href="#" onclick="return selectDataEntryTab('PatientItemRecords', this)" class="active">
                Linked Records</a> <a href="#" onclick="return selectDataEntryTab('PatientItemFields', this)">
                    Item Schedule Details</a>
        </div>
    </div>
    <div id="PatientItemRecords" class="dataEntryPanel">
        <asp:Label runat="server" ID="Message" CssClass="boldText" style="display: block;"></asp:Label>
        <!-- admin allowed to update form -->
        <asp:Panel runat="server" ID="AdminPanel" Visible="false">
            <asp:HiddenField runat="server" ID="patientItemId" />
            <label>
                From:
                <cic:CaisisTextBox runat="server" ID="dateStart" ShowLabel="false" ShowCalendar="true"
                    Width="85px"></cic:CaisisTextBox>
            </label>
            <label>
                To:
                <cic:CaisisTextBox runat="server" ID="dateEnd" ShowLabel="false" ShowCalendar="true"
                    Width="85px"></cic:CaisisTextBox>
            </label>
            <label>
                Restrict to Schema Values:
                <asp:CheckBox runat="server" ID="restrict" Checked="true" />
            </label>
            <asp:Button runat="server" ID="UpdateAdminBtn" Text="Update Filter" CssClass="dataEntryButtonRed"
                OnClick="UpdateAdminFilters" />
            <input type="button" onclick="return showRemoveBtn();" class="dataEntryButtonRed"
                value="Advanced Options" />
            <asp:Button runat="server" ID="RemoveAdminBtn" Text="Disassociate All Records with Visit"
                CssClass="dataEntryButtonRed" OnClick="CleanupClick" OnClientClick="return confirmDisassociate();"
                Style="display: none;" />
        </asp:Panel>
        <!-- pager -->
        <div id="RecordPager" class="pager">
            <span class="boldText">Pages </span>
            <asp:Repeater runat="server" ID="PagesRptr">
                <ItemTemplate>
                    <a href="<%# Eval("URL") %>" class="<%# (bool)Eval("Active") ? "active": "" %>">
                        <%# Eval("Number") %></a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!-- header -->
        <asp:Repeater runat="server" ID="TableHeaderRptr">
            <HeaderTemplate>
                <table id="TableValues_Header" class="dataGrid" style="width: 100%;">
                    <thead class="dataGridHeader">
                        <tr>
            </HeaderTemplate>
            <ItemTemplate>
                <th>
                    <%# Container.DataItem %>
                </th>
            </ItemTemplate>
            <FooterTemplate>
                </tr></thead> </table>
            </FooterTemplate>
        </asp:Repeater>
        <div id="RecordContainer">
            <!-- table -->
            <asp:GridView runat="server" ID="TableValues" AutoGenerateColumns="false" ShowHeader="false"
                ShowFooter="false" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
                RowStyle-CssClass="ItemRow_A" AlternatingRowStyle-CssClass="ItemRow_B" GridLines="Both"
                CellPadding="0" CellSpacing="0" Style="width: 100%;">
                <Columns>
                    <asp:TemplateField HeaderText="Associate" HeaderStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="CheckBox" Checked='<%# (bool)Eval("Associated") %>'
                                OnCheckedChanged="MarkUpdateRow" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div id="RecordFooter">
            <asp:Label runat="server" ID="RecordCount" Style="display: block; margin: 2px auto;
                text-align: center; font-weight: bold;"></asp:Label>
            <asp:Button runat="server" ID="UpdateBtn" Text="Update Patient Record Links" OnClick="UpdateClick"
                CssClass="dataEntryButtonRed" />
        </div>
    </div>
    <!-- edit patient item -->
    <div runat="server" id="PatientItemFields" class="dataEntryPanel" style="display: none;">
        <table>
            <tr>
                <td>
                    <label for="ScheduledDate">
                        Date
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="ScheduledDate" ShowLabel="false" Table="ProtocolMgr_PatientItems"
                        Field="ScheduledDate" ShowCalendar="true"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="FirstAnticipatedDate">
                        First Date
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="FirstAnticipatedDate" ShowLabel="false" Table="ProtocolMgr_PatientItems"
                        Field="FirstAnticipatedDate" ShowCalendar="true"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="LastAnticipatedDate">
                        Last Date
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="LastAnticipatedDate" ShowLabel="false" Table="ProtocolMgr_PatientItems"
                        Field="LastAnticipatedDate" ShowCalendar="true"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="Status">
                        Status</label>
                </td>
                <td>
                    <cic:CaisisComboBox runat="server" ID="Status" ShowLabel="false" Table="ProtocolMgr_PatientItems"
                        Field="Status" LookupDistinct="ProtocolMgr_PatientItems;Status;Status"></cic:CaisisComboBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button runat="server" ID="UpdatedPatientItemBtn" Text="Updated Schedule Details"
                        OnClick="UpdateItemClick" CssClass="dataEntryButtonRed" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
