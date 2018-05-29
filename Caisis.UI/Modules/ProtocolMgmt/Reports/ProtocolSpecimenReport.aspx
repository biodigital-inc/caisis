<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolSpecimenReport.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolSpecimenReport" %>

<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocol Specimen Report</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../StyleSheets/ProtocolReportStyles.css" rel="stylesheet" type="text/css" />
    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../../ClientScripts/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery.noConflict();

        Browser.ResizeElement({
            nodeId: "MainOverflow",
            customResizer: adjustOnResize
        });

        function adjustOnResize() {
            // adjust table headers to data cells
            var th = jQuery("#MainHeader table:first-child thead th");
            var td = jQuery("#MainOverflow table:first-child tbody tr:first-child td");
            var adjustCount = th.size(); // - 1;
            var widthProperty = 'outerWidth';
            for (var i = 0; i < adjustCount; i++) {
                var thWidth = th.eq(i)[widthProperty]();
                td.eq(i).width(thWidth);
            }
            // adjust overflow
            jQuery("#MainOverflow").css("max-height", jQuery(window).height() - 125 + "px");
        }
    </script>
    <style type="text/css">
        body
        {
            margin: 0;
        }
        #MainOverflow
        {
            overflow: auto;
            max-height: 100%;
        }
        #MainHeaderTable, #ResultsGrid
        {
            margin: 0;
            padding: 0;
            table-layout: fixed;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="MainHeader">
        <table id="MainHeaderTable">
            <thead>
                <tr>
                    <asp:Repeater runat="server" ID="HeaderRptr">
                        <ItemTemplate>
                            <th>
                                <%# Container.DataItem %>
                            </th>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
            </thead>
        </table>
    </div>
    <div id="MainOverflow">
        <asp:GridView runat="server" ID="ResultsGrid" AutoGenerateColumns="true" ShowHeader="false"
            GridLines="Both" CellPadding="0" CellSpacing="0">
        </asp:GridView>
    </div>
    <asp:Button runat="server" ID="ExportBtn" CssClass="dataEntryButtonGray" Text="Export to Excel"
        ToolTip="Export to Excel" OnClick="ExportClick" />
    </form>
</body>
</html>
