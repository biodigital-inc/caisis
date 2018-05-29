<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientEditSchedule.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientEditSchedule" %>

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
            var dataFrame = jQuery("#DataFrame");
            var dataFrameWindow = window.frames["DataFrame"];
            var grid = jQuery("#VisitDataGrid");
            var dataRows = grid.find("tr.dataItemRow");
            var footerRows = grid.find("tr.dataItemFooter");
            var showRow = function (index) {
                var dataRow = dataRows.eq(index);
                var footerRow = footerRows.eq(index);
                footerRows.hide();
                footerRow.show();
                dataRows.removeClass("ItemRow_Hover");
                dataRow.addClass("ItemRow_Hover");
            };
            dataRows.each(function (index, row) {
                var dataRow = jQuery(row);
                var footerRow = footerRows.eq(index);
                var patientItemIdField = dataRow.find("input[id*='PatientItemId']");
                var dateStart = dataRow.find("input[id*='DateStart']").val();
                var dateEnd = dataRow.find("input[id*='DateEnd']").val();
                dataRow.click(function (e) {
                    // suppress delete checkbox
                    if (jQuery(e.target).is(":checkbox")) {
                        return;
                    }
                    var patientItemId = patientItemIdField.val();
                    showRow(index);
                    footerRow.find("td:first-child").append(dataFrame);
                    dataFrame.hide();
                    dataFrame.attr("src", "PatientEditScheduleItem.aspx?patientItemId=" + patientItemId + "&dateStart=" + dateStart + "&dateEnd=" + dateEnd);
                });
            });
            dataFrame.bind("load", function (e) {
                if (!!dataFrame.attr("src")) {
                    dataFrame.show();
                    var frameWindowHeight = dataFrame.contents().height();
                    var maxFrameHeight = frameWindowHeight;
                    dataFrame.css({ "display": "block", "height": maxFrameHeight + "px" });
                }
            });
        });

        function onPatientLinkUpdated(updated) {
            if (updated) {
                jQuery("#UpdateBtn").click();
                //document.getElementById("dataForm").submit();
            }
        }

        function confirmDeleteItems() {
            return confirm("Are you sure you would like to remove these items? This change CANNOT be undone.");
        }

    </script>
    <style type="text/css">
        #DataFrame
        {
            display: block;
            width: 100%;
            min-height: 100px;
            max-height: 275px;
            margin: 0;
            border: none;
            overflow: auto;
            border-top: 2px solid #222;
            border-bottom: 2px solid #222;
        }
        #VisitDataGrid
        {
            table-layout: fixed;
            width: 100%;
        }
        #VisitDataGrid tr.dataItemFooter
        {
            display: none;
        }
        .SelectionRow
        {
            display: block;
            margin: 2px auto;
        }
        .SelectionRow label
        {
            font-weight: bold;
            display: inline-block;
            min-width: 50px;
        }
    </style>
</head>
<body>
    <form id="dataForm" method="post" runat="server">
    <iframe id="DataFrame" name="DataFrame" frameborder="0" style="display: none;"></iframe>
    <div class="SelectionRow">
        <label for="PatientList">
            Patient</label>
        <cic:CaisisSelect runat="server" ID="PatientList" ShowLabel="false" LabelClass="dropDownLabel"
            DataTextField="PatientDisplayName" DataValueField="PatientProtocolId" AutoPostBack="true"
            OnSelectedIndexChanged="BuildPatientVisits">
        </cic:CaisisSelect>
    </div>
    <div class="SelectionRow">
        <label for="PatientVisits">
            Visit</label>
        <cic:CaisisSelect runat="server" ID="PatientVisits" ShowLabel="false" DataTextField="VisitLabel"
            DataValueField="TimelineId" AutoPostBack="true" OnSelectedIndexChanged="BuildVisitsOnChange">
        </cic:CaisisSelect>
        <asp:Button runat="server" ID="UpdateBtn" OnClick="BuildVisitsOnChange" Text="Updated"
            Style="display: none;" />
    </div>
    <asp:Repeater runat="server" ID="PatientVisitItems">
        <HeaderTemplate>
            <table id="VisitDataGrid" class="dataGrid">
                <thead>
                    <tr class="dataGridHeader">
                        <th>
                            ItemDescription
                        </th>
                        <th>
                            DestTable
                        </th>
                        <th>
                            ScheduledDate
                        </th>
                        <th>
                            FirstAnticipatedDate
                        </th>
                        <th>
                            LastAnticipatedDate
                        </th>
                        <th>
                            Status
                        </th>
                        <th>
                            Delete
                        </th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr class="<%# Container.ItemIndex%2==0?"ItemRow_A":"ItemRow_B" %> dataItemRow">
                <th>
                    <%# Eval("ItemDescription") %>
                </th>
                <th>
                    <%# Eval("DestTable") %>
                </th>
                <th>
                    <asp:HiddenField runat="server" ID="PatientItemId" Value='<%# Eval("PatientItemId") %>' />
                    <asp:HiddenField runat="server" ID="DateStart" Value='<%# Eval("FirstAnticipatedDate") %>' />
                    <asp:HiddenField runat="server" ID="DateEnd" Value='<%# Eval("LastAnticipatedDate") %>' />
                    <%# Eval("ScheduledDate", "{0:d}") %>
                </th>
                <th>
                    <%# Eval("FirstAnticipatedDate", "{0:d}") %>
                </th>
                <th>
                    <%# Eval("LastAnticipatedDate", "{0:d}") %>
                </th>
                <th>
                    <%# Eval("Status") %>
                </th>
                <th>
                    <cic:CaisisCheckBox runat="server" ShowLabel="false" ID="DeletePatientItemIdField" />
                </th>
            </tr>
        </ItemTemplate>
        <SeparatorTemplate>
            <tr class="dataItemFooter">
                <td colspan="6">
                </td>
            </tr>
        </SeparatorTemplate>
        <FooterTemplate>
            <tr class="dataItemFooter">
                <td colspan="6">
                </td>
            </tr>
            </tbody></table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:Button runat="server" ID="DeleteBtn" OnClick="DeleteSelected" OnClientClick="return confirmDeleteItems();"
        Text="Delete Selected Items" CssClass="dataEntryButtonRed" style="margin: 5px auto;" />
    </form>
</body>
</html>
