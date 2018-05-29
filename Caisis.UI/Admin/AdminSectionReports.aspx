<%@ Page language="c#"  CodeFile="AdminSectionReports.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" AutoEventWireup="false" Inherits="Caisis.UI.Admin.AdminSectionReports" %>
<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Administrator</title>
    <link href="../Stylesheets/GlobalStyles.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>
    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        
        jQuery.noConflict();
        
        function clearOldReportInfo() {
            var rprt;
            rprt = document.getElementById('txtReportHidden');
            rprt.value = '';

            rprt = document.getElementById('txtSortByColumnHidden');
            rprt.value = '';
            rprt = document.getElementById('txtSortOrderHidden');
            rprt.value = '';
        }
        function setUseQueryStringCookie() {
            setCookie('AdminReportUseQuerystring', 'true')
        }
        function setUseQueryStringCookieNot() {
            setCookie('AdminReportUseQuerystring', 'false')
        }
        function setCookie(name, value) {
            document.cookie = name + "=" + escape(value);
        }
        
        
        function adjustOverflow() {
            jQuery('#reportResultContainer').css('height', jQuery(window).height() - 40 + 'px');
        }

        // init
        jQuery(document).ready(function() {
          adjustOverflow();
        });
        
        
        
        /* ]]> */
    </script>

    <style type="text/css">
        
        .OuterOptionsTable
        {
            border-right: #999999 1px solid;
            border-top: #999999 1px solid;
            margin-bottom: 10px;
            border-left: #999999 1px solid;
            width: 198px;
            border-bottom: #999999 1px solid;
        }
        .OuterOptionsTableHeaderCell
        {
            font-weight: bolder;
        }
        .OuterOptionsTableCellRightAlign
        {
            text-align: right;
        }
        .OuterOptionsTableCellLeftAlign
        {
            text-align: left;
        }
        .OptionBox
        {
            border-top: #999999 1px solid;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .OptionBoxHeading
        {
            padding-right: 4px;
            padding-left: 4px;
            left: 4px;
            position: relative;
            top: -8px;
        }
        .InnerOptionTable
        {
            position: relative;
            top: -6px;
        }
        .AdminReportHeader
        {
            font-weight: normal;
            color: #8d282c;
            background-color: white;
            text-align: left;
        }
        .AdminReportHeader A
        {
            font-weight: normal;
            color: #8d282c;
            position: relative;
            top: -3px;
            background-color: white;
        }
        .DataGridFixedHeader
        {
            position: relative; ;TOP:expression(this.offsetParent.scrollTop - 2);BACKGROUND-COLOR:white}
        TD A
        {
            color: black;
        }
        #HeadingPager
        {
            text-align: right;
        }
        #HeadingPager SPAN
        {
            margin-left: 4px;
            color: #8d282c;
        }
        #HeadingPager A
        {
            margin-left: 4px;
            color: #8d282c;
            text-decoration: none;
        }
        #HeadingPager A.HeaderPagerNoMargin
        {
            display: inline;
            margin-left: 0px;
            text-decoration: none;
        }
        #HeadingPager SPAN.HeaderPagerNoMargin
        {
            display: inline;
            margin-left: 0px;
        }
        .reportInfoHeading
        {
            font-weight: bolder;
            color: #8d282c;
        }
        .DisplayNone
        {
            display: none;
        }
        .DisplayInline
        {
            display: inline;
            text-decoration: none;
            margin-left: 4px;
            margin-right: 4px;
        }
        #HeadingPager SPAN.CurrentPageInPager
        {
            color: gray;
        }
    </style>
</head>
    <body onload="setUseQueryStringCookie()" style="height: auto;">
        <form id="dataForm" method="post" runat="server">
            <table style="background-color: #ffffff" cellSpacing="0" cellPadding="0" width="100%" border="0">
                <tr>
                    <td class="adminSectionTitle" width="200">Administrative Reports</td>
                    <td width="12"><IMG height="8" src="../Images/AdminImages/AdminWidgetRed.gif" width="6"></td>
                    <td colspan="2"><asp:table id="tblPageTitleAndPager" Runat="server" Width="635" EnableViewState="False">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:label id="lblPageTitle" runat="server" cssclass="adminPageTitle"></asp:label>
                                    <asp:label runat="server" ID="HeadingHeightHack">&nbsp;</asp:label>
                                </asp:TableCell>
                                <asp:TableCell ID="tcHeadingPager">
                                    <asp:label ID="txtRecordCount" runat="server">&nbsp;</asp:label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:table></td>
                </tr>
                <tr>
                    <td class="adminSectionTitleLine" colspan="3"><IMG height="1" src="../Images/shim.gif" width="1"></td>
                    <td><IMG height="1" src="../Images/shim.gif" width="1"></td>
                </tr>
                <tr>
                    <td vAlign="top">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td vAlign="top">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td vAlign="top"><asp:table id="tblReportMenu" runat="server"></asp:table><asp:table id="tblReportMenuOptions" Runat="server" CssClass="PDForm OuterOptionsTable">
                            <asp:TableRow ID="ddlrow1">
                                <asp:TableCell CssClass="OuterOptionsTableHeaderCell">
                                    Select report:
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="ddlrow2">
                                <asp:TableCell CssClass="OuterOptionsTableCellRightAlign">
                                    <asp:DropDownList ID="ddlReportMenu" Runat="server"></asp:DropDownList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="ddlrow3">
                                <asp:TableCell CssClass="OuterOptionsTableCellRightAlign">
                                    <asp:Button ID="btnShowReport" Runat="server" Text="Show report"></asp:Button>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <script type="text/javascript"> 
                                        var imgDir = "../Images/Calendar/";
                                    </script>
                                    <script src="../ClientScripts/popcalendar.js" type="text/javascript"></script>
                                    <script type="text/javascript">
                                        spanAltRef.style.visibility = 'hidden';
                                    </script>
                                    <div class="OptionBox">
                                        <span class="OptionBoxHeading PDForm">Time period</span>
                                        <asp:Table cssclass="InnerOptionTable" Runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label Runat="server" ID="lblFromDate">From:</asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <input id="txtFromDate" tabIndex="1" type="text" name="txtFromDate" runat="server" style="WIDTH: 110px">
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <IMG id="txtFromDateCal" height="16" alt="select date" src="../Images/Calendar/cal.gif"
                                                        width="16" align="absMiddle" border="0" runat="server">
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label Runat="server" ID="lblToDate">To:</asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <input id="txtToDate" tabIndex="2" type="text" name="txtToDate" runat="server" style="WIDTH: 110px">
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <IMG id="txtToDateCal" height="16" alt="select date" src="../Images/Calendar/cal.gif"
                                                        width="16" align="absMiddle" border="0" runat="server">
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                    <div class="OptionBox">
                                        <span class="OptionBoxHeading PDForm">Additional filtering</span>
                                        <asp:Table cssclass="InnerOptionTable" Runat="server" ID="Table1">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblAdditionalFiltering" runat="server">N/A</asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox Runat="server" Width="120" ID="txtAdditionalFilter1" Visible="True"></asp:TextBox>
                                                    <asp:DropDownList Runat="server" Width="120" ID="ddlAdditionalFilter1" Visible="True"></asp:DropDownList>
                                                </asp:TableCell>
                                                <asp:TableCell></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <div class="OptionBox">
                                        <span class="OptionBoxHeading PDForm">Display options</span>
                                        <asp:Table cssclass="InnerOptionTable" Runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    Columns:
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton GroupName="AllColumns" Runat="server" Width="30" ID="rbAllColumns" Text="All"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton GroupName="AllColumns" Runat="server" Width="30" ID="rbNotAllColumns" Text="Subset"
                                                        Checked="True" Enabled="False"></asp:RadioButton>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    Page size:
                                                </asp:TableCell>
                                                <asp:TableCell ColumnSpan="2">
                                                    <asp:dropdownlist id="ddlPageSize" Runat="server" Width="100" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:table><asp:table id="tblReportMenuExport" Runat="server" CssClass="PDForm OuterOptionsTable">
                            <asp:TableRow>
                                <asp:TableCell CssClass="OuterOptionsTableHeaderCell">
                                    Export:
                                </asp:TableCell>
                                <asp:TableCell CssClass="OuterOptionsTableCellRightAlign" ColumnSpan="3">
                                    <asp:label id="lblNoExport" runat="server"></asp:label>
                                    <excel:ExcelExportButton runat="server" ID="btnExport" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:table></td>
                    <td>&nbsp;</td>
                    <td vAlign="top">&nbsp;
                        
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            
            
            
            <div id="reportResultContainer" style="position: absolute; left: 240px; top: 30px; right: 10px; bottom: 10px; z-index: 1000; overflow: auto;">
                            <asp:Label id="lblAdminReportInfo" runat="server"></asp:Label>
                            <asp:PlaceHolder runat="server" ID="ReportsDesc" Visible="false" OnPreRender="ShowHideHelpDesc">
                                <div style="padding-top: 5px; padding-bottom: 5px;">
                                    <p>
                                        Please select a report in the drop down menu to the left.</p>
                                    <p>
                                        Use the date filter function below the left menu to show data for a chosen time
                                        period. The default time period is last 30 days.</p>
                                    <p>
                                        For some reports additional filtering can be applied.</p>
                                    <p>
                                        Click 'Export to Excel' to export the selected report to Excel.</p>
                                    <span class="reportInfoHeading" style="text-decoration: underline;">Available reports</span>
                                </div>
                                <ul style="list-style-type: none; padding-left: 0px; margin-left: 0px;">
                                    <asp:Repeater runat="server" ID="ReportsListRptr">
                                        <ItemTemplate>
                                            <li style="padding-top: 5px; padding-bottom: 5px;">
                                            <span class="reportInfoHeading">
                                                <%# Eval("Title") %>
                                                &nbsp;&nbsp;</span>
                                                <%# Eval("Description") %>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </asp:PlaceHolder>
                            <asp:datagrid id="dgAdminReport" Runat="server" Width="630" EnableViewState="True" CssClass="DatagridTable"
                                AllowSorting="True" AllowPaging="True" PagerStyle-Position="Bottom" PagerStyle-HorizontalAlign="Right"
                                PagerStyle-PageButtonCount="7" PagerStyle-Mode="NumericPages" BorderStyle="None" GridLines="None"
                                HeaderStyle-CssClass="DataGridFixedHeader AdminReportHeader"></asp:datagrid>
                            <asp:label id="lblAdminPage" runat="server" EnableViewState="False"></asp:label>
                        </div>
            
            
            
            
            <asp:Label ID="excelgridcontainer" Runat="server" Visible="false">
                <asp:DataGrid ID="dgExcel" Runat="server"></asp:DataGrid>
            </asp:Label>
            <asp:textbox id="txtReportHidden" Runat="server" CssClass="DisplayNone" Visible="true"></asp:textbox><asp:textbox id="txtDllReportLast" Runat="server" CssClass="DisplayNone" Visible="true"></asp:textbox><asp:textbox id="txtSortByColumnHidden" Runat="server" CssClass="DisplayNone" Visible="true"></asp:textbox><asp:textbox id="txtSortOrderHidden" Runat="server" CssClass="DisplayNone" Visible="True"></asp:textbox></form>
    </body>
</html>
