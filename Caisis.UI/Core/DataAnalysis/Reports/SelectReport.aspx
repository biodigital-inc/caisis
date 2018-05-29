<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectReport.aspx.cs" Inherits="Caisis.UI.Core.DataAnalysis.Reports.SelectReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Select A Report</title>
    <link href="../../../StyleSheets/DataAnalysis.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        Browser.ResizeElement({ customResizer: adjustReportHeight });

        // reisizes main report container
        function adjustReportHeight() {
            var height = getHeight(window);
            // set max height to allow div to grow as needed
            var maxHeight = Math.max(200, height - 130);
            $('scrollableDiv').style.maxHeight = maxHeight + 'px';
        }
        
        // loads the specifed report by encoded url report id
        function loadReport(reportId, sub_category) {
            // encode values
            var _category = '<%= Server.UrlEncode(QueryCategory) %>';
            var _sub_category = escape(sub_category);
            var _reportId = escape(reportId);
            window.location = 'AdHocReports.aspx?category=' + _category + '&subCategory=' + _sub_category + '&report=' + _reportId + '&disease=' + '<%= QueryDisease %>';
        }

        function toggleSubCategory(index) {
            var subCat = $('SubCategory_' + index);
            // show/hide list based on current visibility
            if (subCat) {
                var isHidden = subCat.style.display == 'none';
                subCat.style.display = isHidden ? '' : 'none';
            }
        }

        /* ]]> */
    </script>
    <style type="text/css">
    #DiseaseSelection
    {
        display: block;
        margin: auto;
        text-align: center;
    }
    #DiseaseSelection img
    {
        display: block;
        margin: 2px auto;
        border: none;
    }
    #DiseaseSelection a
    {
        font-family: Arial;
        font-size: 16px;
        display: inline-block;
        padding: 15px;
        width: 125px;
        margin: 15px;
        text-align: center;
        text-decoration: none;
        border: 1px solid #bbb;
        border-radius: 3px;
    }
    #DiseaseSelection a:hover
    {
        background-color: #eeeeee;
    }
    </style>
</head>
<body>
    <form runat="server">
    <div class="TopModuleBar_OuterContainer">
        <div class="TopModuleBar_InnerContainer">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td style="padding-top: 3px;">
                        <span class="TopModuleBarTitle"><img src="../../../Images/DataAnalysisHomeIcon.png" style="vertical-align: middle; cursor: pointer;" onclick="top.location='../ReportsIndex.aspx';" /></span>
                        <asp:PlaceHolder runat="server" ID="DiseaseTitleBar" Visible="false"><a href="SelectReport.aspx?category=<%= QueryCategory %>"
                            class="TopModuleBarTitle" title="Select A Disease">                           
                            <%= QueryDisease %></a></asp:PlaceHolder>
                        <asp:Label CssClass="TopModuleBarTitle" style="background-image: none;" runat="server" ID="CategoryTitle" Text="All Reports"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="ReportListContainer">
        <div id="DataAnalysisSelectAReportTitle">
            <asp:Label runat="server" ID="ShowDiseaseLabel" Visible="false">SELECT A DISEASE</asp:Label>
            <asp:Label runat="server" ID="ShowReportLabel">SELECT A REPORT</asp:Label>
        </div>
        <div class="GrayContainerBox_TopLeft">
            <div class="GrayContainerBox_TopRight">
                <div class="GrayContainerBox_BottomLeft">
                    <div class="GrayContainerBox_BottomRight">
                        <div class="GrayContainerBox_InnerContainer" style="padding: 10px 2px 10px 18px;">
                            <div id="scrollableDiv" style="overflow: auto; overflow-x: hidden; max-height: 550px;">
                                <%-- disease selection --%>
                                <div id="DiseaseSelection">
                                    <asp:Repeater runat="server" ID="DiseasesRprt">
                                        <ItemTemplate>
                                            <a class="ReportList_ReportTitle" href="SelectReport.aspx?disease=<%# XPath("@disease") %>&category=<%= QueryCategory %>">
                                                <img src="../../../Images/ReportIcon_PerioperativeOutcomes.png" alt="<%# XPath("@disease")%>" />
                                                <%# XPath("@disease")%></a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <asp:Label runat="server" ID="NoReports" Text="No Reports Available" Visible="false"></asp:Label>
                                <%-- start repeating unit --%>
                                <%-- a list of reports by category or by category with no sub categories --%>
                                <asp:Repeater runat="server" ID="ReportSelectorRptr" OnItemDataBound="SetReportIcon">
                                    <ItemTemplate>
                                        <div class="ReportList_ReportOuterContainer" onclick="loadReport('<%# EvalClientValue(Container.DataItem, "ID") %>', '');">
                                            <div class="ReportList_ReportInnerContainer">
                                                <asp:Image runat="server" ID="ReportIcon" ImageUrl="~/Images/ReportIcon_MainReport.png" />
                                                <div class="ReportList_ReportText">
                                                    <span class="ReportList_ReportTitle">
                                                        <%# Eval("Title") %></span>
                                                    <%# Eval("Description") %>
                                                </div>
                                            </div>
                                            <div class="ReportList_ReportContainerBottom">
                                                &nbsp;</div>
                                        </div>
                                    </ItemTemplate>
                                    <SeparatorTemplate>
                                        <%-- separator --%>
                                        <div class="ReportList_Separator">
                                            &nbsp;</div>
                                        <%-- end separator --%>
                                    </SeparatorTemplate>
                                </asp:Repeater>
                                <%-- a list of report sub categories by category --%>
                                <asp:Repeater runat="server" ID="ReportsInCategoryRptr" OnItemDataBound="BuildSubReports">
                                    <ItemTemplate>
                                        <div class="ReportList_ReportOuterContainer">
                                            <div class="ReportList_ReportInnerContainer" onclick="toggleSubCategory(<%# Container.ItemIndex %>);">
                                                <asp:Image runat="server" ID="SubCatIcon" ImageUrl="~/Images/ReportIcon_MainReport.png" />
                                                <div class="ReportList_ReportText">
                                                    <span class="ReportList_ReportTitle" style="font-size:larger;">
                                                        <%#  Eval("SubCategory") %></span>
                                                    <%# Eval("Description") %>
                                                </div>
                                            </div>
                                            <div class="ReportList_ReportContainerBottom">
                                                &nbsp;</div>
                                            <div id="SubCategory_<%# Container.ItemIndex %>" style="display: none; margin: 5px auto 5px 45px;">
                                                <%-- a list of reports in current sub category --%>
                                                <asp:Repeater runat="server" ID="ReportsInSubCategoryRptr" OnItemDataBound="SetReportIcon">
                                                    <ItemTemplate>
                                                        <div class="ReportList_small_ReportOuterContainer" onclick="loadReport('<%# EvalClientValue(Container.DataItem, "ID") %>', '<%# EvalClientValue((Container.NamingContainer.NamingContainer as RepeaterItem).DataItem, "SubCategory") %>');">
                                                            <div class="ReportList_small_ReportInnerContainer" style="min-height: 15px;">
                                                                <asp:Image runat="server" ID="ReportIcon" ImageUrl="~/Images/ReportIcon_MainReport.png" />
                                                                <div class="ReportList_small_ReportText"  style=" margin-left: 5px;">
                                                                    <span class="ReportList_ReportTitle">
                                                                        <%# Eval("Title") %></span>
                                                                    <%# Eval("Description") %>
                                                                </div>
                                                            </div>
                                                            <div class="ReportList_small_ReportContainerBottom">
                                                                &nbsp;</div>
                                                        </div>
                                                    </ItemTemplate>
                                                    <SeparatorTemplate>
                                                        <%-- separator --%>
                                                        <div class="ReportList_Separator">
                                                            &nbsp;</div>
                                                        <%-- end separator --%>
                                                    </SeparatorTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <SeparatorTemplate>
                                        <%-- separator --%>
                                        <div class="ReportList_Separator">
                                            &nbsp;</div>
                                        <%-- end separator --%>
                                    </SeparatorTemplate>
                                </asp:Repeater>
                                <%-- end repeating unit --%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
