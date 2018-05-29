<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserReportWidget.ascx.cs"
    Inherits="Caisis.UI.Core.Utilities.Widget.UserReportWidget" %>

<script type="text/javascript">
    /* <![CDATA[ */

    // loads report in report section
    function loadUserRecentReport(reportName, isReport) {
        var noPatient = <%= (Session["PatientId"]== null || Session["PatientId"].ToString()=="").ToString().ToLower() %>;
        // special case
        if (reportName == 'Patient Summary Report') {
            if(noPatient) {
                alert('Please select a Patient before viewing.');
            }
            else if(top.viewPatientSummaryReport) {
                top.viewPatientSummaryReport();
            }
        }
        else if(isReport)
        {
            window.top.location = '<%= Page.ResolveUrl("~/Core/DataAnalysis/ReportsIndex.aspx") %>?report=' + escape(reportName);
        }
        else {
            // not valid report
        }
        return false;
    }

    /* ]]> */
</script>

<table style="width: 100%;">
    <thead>
        <tr>
            <th style="width: 55%;">
                Name
            </th>
            <th style="width: 45%;">
                Last Viewed
            </th>
        </tr>
    </thead>
</table>
<div class="DashboardScrollingList">
    <table class="DashboardScrollingListTable" cellspacing="0">
        <tbody>
            <asp:Repeater ID="UserRecentReports" runat="server">
                <ItemTemplate>
                    <tr class="DashboardScrollingListRowType<%# Container.ItemIndex % 2==0 ? "A" : "B" %>"
                        onclick="loadUserRecentReport('<%# Caisis.UI.Core.Classes.PageUtil.EscapeSingleQuotes(Eval("ReportName").ToString()) %>', <%# Eval("IsReport").ToString().ToLower() %>);">
                        <td style="width: 55%;">
                            <%# Eval("ReportName") %>                            
                        </td>
                        <td style="width: 45%;">
                            <%# FormatDisplayDate(Eval("ExportDate")) %>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr id="NoReportsMessage" runat="server">
                <td style="background-color: #efefef; padding: 5px; text-align: center; font-size: 13px;">
                    You have not viewed any reports recently.
                </td>
            </tr>
        </tbody>
    </table>
</div>
<a href="<%= Page.ResolveUrl("~/Core/DataAnalysis/ReportsIndex.aspx") %>" target="_top"
    title="View More Reports">
    <img alt="View More Reports" title="View More Reports" src="<%= Page.ResolveUrl("~/Images/DashboardButton_MoreReports.png") %>"
        class="DashboardButton" /></a>