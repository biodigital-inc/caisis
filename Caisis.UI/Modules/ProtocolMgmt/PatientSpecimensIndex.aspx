<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientSpecimensIndex.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientSpecimensIndex" EnableViewState="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Specimens Index</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery-ui.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.tablesorter.min.js"></script>
    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            var table = jQuery('#SpecimensListing');
            var header = jQuery("#SpecimensListing_Header");
            var overflow = jQuery("#SpecimensListing_Overflow");
            // init table sorter
            var sorter = table.tablesorter();

            // move header outside overflow
            header.append(table.find("thead"));

            var lastTH = header.find("tr:first-child th").last();
            var lastTD = table.find("tr:first-child td").last();

            var headerFixed = false;
            var adjustTableHeaders = function() {
                var targetWidth = header.width() - table.width();
                var tdWidth = lastTH.width() - targetWidth;
                lastTD.width(tdWidth);
                if(!headerFixed) {
                    setTimeout(function() {
                        var buffer = header.outerWidth() - table.outerWidth() - 3;
                        if(buffer > 0 && buffer < 20)
                            lastTD.width(tdWidth - buffer);
                       headerFixed = true;       
                     }, 100);
                 }
            };
            adjustTableHeaders();
            sorter.bind("sortEnd", adjustTableHeaders); 
            jQuery(window).resize(adjustTableHeaders);

            overflow.css("max-height", jQuery(window).height() - 115 + "px");
        });

        function editAccession(accessionId, visitType)
        {
            var specimenType = '<%= QuerySpecimenType %>';
            var url = '<%= GetQueryString("PatientSpecimens.aspx") %>' + '&SpecimenAccessionId=' + accessionId + '&specimenType='+ specimenType + "&visitType=" + visitType;
            window.location = url; 
            return false;
        }

        /* ]]> */
    </script>
    <style type="text/css">
        #SpecimensListing_Overflow
        {
            max-height: 100%;
            overflow: auto;
            border: 1px solid #dddddd;
        }
        .SpecimensListing
        {
            table-layout: fixed;
            width: 100%;
            margin: 0;
        }
        .SpecimensListing tr:hover td
        {
            background-color: #dddddd;
            cursor: pointer;
        }
        table.sortable
        {
        }
        table.sortable > thead th
        {
            /*background-color: #bbbbbb;*/
            cursor: pointer;
        }
        table.sortable > thead th.no-sort
        {
            background-color: inherit;
            cursor: default;
        }
        table.sortable th, table.sortable td
        {
            padding: 5px 2px 5px 2px;
        }
        .headerSortUp
        {
        }
        .headerSortDown
        {
        }
        
        #AddNewButton
        {
            width: 100px;
            font-size: 13px;
            margin-top: 5px;
        }
        #TissueTypeSelection
        {
            text-align: center;
        }
        #TissueTypeSelection a
        {
            display: inline-block;
            width: 200px;
            padding: 5px;
            margin: 5px;
            font-size: 16px;
            line-height: 16px;
            vertical-align: middle;
            padding: auto 25px;
        }
        #TissueTypeSelection img
        {
            display: block;
           float: left;
           vertical-align: middle;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <!-- type filter -->
    <div id="TissueTypeSelection">
        <a href="<%= GetQueryString("PatientSpecimensIndex.aspx") %>&specimenType=Blood"
                    class="dataEntryButton<%= QuerySpecimenType == "Blood" ? "Red" : "Gray" %>">
                    <img src="../../Images/icon_LabTests.png" alt="Blood" />                
                    Blood Specimens</a>
        <a href="<%= GetQueryString("PatientSpecimensIndex.aspx") %>&specimenType=Tissue"
                    class="dataEntryButton<%= QuerySpecimenType == "Tissue" ? "Red" : "Gray" %>">
                    <img src="../../Images/icon_Pathology.png" alt="Tissue" />
                    Tissue Specimens</a>
    </div>
    <asp:Panel runat="server" ID="ListingsPanel">
        <!-- accession/specimen listing -->
        <table id="SpecimensListing_Header" class="sortable SpecimensListing">
        </table>
        <div id="SpecimensListing_Overflow">
            <asp:GridView runat="server" ID="SpecimensListing" AutoGenerateColumns="false" UseAccessibleHeader="true"
                ShowHeader="true" CssClass="dataGrid sortable SpecimensListing" HeaderStyle-CssClass="dataGridHeader"
                RowStyle-CssClass="ItemRow_A" AlternatingRowStyle-CssClass="ItemRow_B" OnRowDataBound="SetEditLink">
                <Columns>
                </Columns>
            </asp:GridView>
            <asp:Label runat="server" ID="NoRecordsText" Visible="false"></asp:Label>
        </div>
        <a id="AddNewButton" href="#" class="dataEntryButtonGray" onclick="return editAccession('','<%= QueryVisitType %>');">
            Add New</a>
    </asp:Panel>
    </form>
</body>
</html>
