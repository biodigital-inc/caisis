<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SurveyItemsByProtocolVisit.aspx.cs" Inherits="Caisis.UI.Modules.All.Reports.SurveyItemsByProtocolVisit" %>
<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Items By Protocol Visit Report</title>
    <script type="text/javascript" src="../../../ClientScripts/jquery.js"></script>
    <script type="text/javascript">
        jQuery.noConflict();

        jQuery(document).ready(function () {
            var protocolList = jQuery("#ProtocolList");
            var schemaList = jQuery("#SchemaList");
            var visitList = jQuery("#VisitList");
            var btn = jQuery('#RunReportBtn');
            var excelBtn = jQuery("#ExcelExport");
            var csvBtn = jQuery("#CSVExport");

            var surveyTypes = jQuery("#SurveyTypeListContainer input");
            var checkAllBtn = jQuery("#checkAllBtn");
            var uncheckAllBtn = jQuery("#uncheckAllBtn");

            function runReportOnUpdate(action) {
                var protocolId = protocolList.find("option:selected").val() || "";
                var schemaId = schemaList.find("option:selected").val() || "";
                var timelineId = visitList.find("option:selected").val() || "";
                var surveys = "";
                // build surveys
                if (timelineId != "") {
                    var checked = surveyTypes.filter(":checked").map(function (index, cb) {
                        return  encodeURIComponent(jQuery(cb).val());
                    });
                    surveys = checked.toArray().join(",");
                }
                runReportWithParams({
                    "protocolId": protocolId,
                    "schemaId": schemaId,
                    "timelineId": timelineId,
                    "surveys" : surveys,
                    "action": action || ""
                });
            }

            var onChangeUpdate = function(e) {
                runReportOnUpdate("query");
            }

            // select events
            protocolList.change(onChangeUpdate);
            schemaList.change(onChangeUpdate);
            visitList.change(onChangeUpdate);

            // button events
            btn.click(function (e) {
                runReportOnUpdate("run");
                return false;
            });
            excelBtn.click(function (e) {
                runReportOnUpdate("export-excel");
                return false;
            });
            csvBtn.click(function (e) {
                runReportOnUpdate("export-csv");
                return false;
            });

            // check uncheck all
            checkAllBtn.click(function () {
                surveyTypes.attr("checked", "checked");
                return false;
            });
            uncheckAllBtn.click(function () {
                surveyTypes.removeAttr("checked");
                return false;
            });

            function showHideSearchButton() {
                // enable search button if selected value is non-empty
                var val = jQuery('#VisitList option:selected').val();
                if (val && val.length) {
                    btn.show();
                } else {
                    btn.hide();
                }
            }

            jQuery('#VisitList').change(function() {
                showHideSearchButton();
            });

            showHideSearchButton();
        });


        function runReportWithParams(urlParams) {
            // get base url
            var url = "SurveyItemsByProtocolVisit.aspx?";
            // build encoded url params
            var qs = [];
            jQuery.each(urlParams, function (key, value) {
                qs.push(key + "=" + (key == "surveys" ? value : encodeURIComponent(value)));
            });
            var fullURL = url + qs.join("&");
            // navigate with query params
            window.location = fullURL;
        }

    </script>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .surveySelectionListItem
        {
            display: inline-block;
            width: 200px;
            float: left;
        }
        #SurveyTypeListCheck a
        {
           display: inline-block;
           margin: 5px;
           font-weight: bold;
        }
    </style>
</head>
<body id="ReportContentBody" runat="server" class="reportContentBody">
    <form id="form1" runat="server" method="get">
    <div>
        <table class="parameterEntryTable" style="table-layout: fixed; width: 95%; margin: auto;">
            <tr>
                <td style="width: 200px;"><asp:Label ID="ProtocolLabel" runat="server" Text="Please select a protocol:" /></td>
                <td>
                    <asp:DropDownList runat="server" ID="ProtocolList"
                        OnSelectedIndexChanged="ProtocolListSelectedIndexChanged" 
                        AppendDataBoundItems="true">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr id="SchemaRow" runat="server" visible="false">
                <td><asp:Label ID="SchemaLabel" runat="server" Text="Please select a schema:" /></td>
                <td>
                    <asp:DropDownList runat="server" ID="SchemaList"  
                        OnSelectedIndexChanged="SchemaListSelectedIndexChanged"
                        AppendDataBoundItems="true">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr id="VisitRow" runat="server" visible="false">
                <td>Please select a visit:</td>
                <td>
                    <asp:DropDownList runat="server" ID="VisitList"
                        
                        OnSelectedIndexChanged="VisitListSelectedIndexChanged"
                        AppendDataBoundItems="true">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr id="SurveyRow" runat="server" visible="false">
                <td valign="top">Please select the surveys to export:</td>
                <td >
                    <div id="SurveyTypeListCheck">
                        <a href="#" id="checkAllBtn">Check All</a> | 
                        <a href="#" id="uncheckAllBtn">Uncheck All</a>
                    </div>
                    <div id="SurveyTypeListContainer">
                        <asp:Repeater runat="server" ID="SurveyTypeListRptr">
                            <ItemTemplate>
                                <div class="surveySelectionListItem">
                                    <label>
                                        <input type="checkbox" id="SurveyTypeItem_<%# Container.ItemIndex %>" name="SurveyTypeItem"
                                            value="<%# Eval("SurveyType") %>" <%# (bool)Eval("Selected") ? "checked='checked'" : "" %> />
                                        <%# Eval("SurveyType") %>
                                    </label>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
<%--                    <asp:CheckBoxList runat="server" ID="SurveyTypeList"
                        RepeatLayout="Table"
                        RepeatColumns="3">
                    </asp:CheckBoxList>--%>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:ImageButton runat="server" ID="RunReportBtn" 
                        ImageUrl="~/Images/Search_small.gif"
                        OnClick="RunReportClick" Visible="false" />
                    <asp:Label runat="server" ID="ExportButtons" Visible="false">
                        <excel:ExcelExportButton runat="server" ID="ExcelExport" CssClass="dataEntryButtonGray"
                                        Text="Excel" ToolTip="Export to Excel" OnClick="ExcelExportClick" />
                        <excel:ExcelExportButton runat="server" ID="CSVExport" CssClass="dataEntryButtonGray"
                            Text="CSV" ToolTip="Export to CSV" OnClick="CSVExportClick" />
                    </asp:Label>
                </td>
            </tr>
        </table>
        <div id="ReportLayer">
            <div id="ReportLayerOverflow">
                <asp:GridView ID="ResultsGridView" runat="server" EnableViewState="False" Width="100%"
                    ShowHeader="true" UseAccessibleHeader="true" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
                    RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                    GridLines="None" BorderStyle="None" AllowSorting="True" AllowPaging="False" PagerSettings-Position="Bottom"
                    PagerStyle-HorizontalAlign="Left" PagerSettings-Mode="NumericFirstLast" AlternatingItemStyle-BackColor="#dfedf9"
                    PagerStyle-CssClass="Pager" CellPadding="4" BorderColor="#cccccc" BorderWidth="1"
                    ItemStyle-Height="26px" HeaderStyle-BackColor="#00668d" HeaderStyle-ForeColor="#ffffff">
                </asp:GridView>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
