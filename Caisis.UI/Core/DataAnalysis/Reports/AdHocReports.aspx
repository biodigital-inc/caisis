<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdHocReports.aspx.cs" Inherits="Caisis.UI.Core.DataAnalysis.Reports.AdHocReports" %>

<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="chart" TagName="ReportChart" Src="~/Core/DataAnalysis/Reports/ReportChartControl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Reports</title>
    <link href="../../../Stylesheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../../StyleSheets/DataAnalysis.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        
        jQuery.noConflict();
        
        var REPORT_PAGE_SIZE = <%= AdminReportGrid.PageSize %>;

        // list of resizeable elements
        Browser.ResizeElement(
            { nodeId: 'TableGraphScroller', heightOffset: 225 },
            { nodeId: 'GraphContainer', heightOffset: 285 },
            { nodeId: 'ReportLayerOverflow', heightOffset: 365 },
            { nodeId: 'ReportsMenuScrollerCell', heightOffset: 150 },
            { nodeId: '<%= StaticReportsFrame.ClientID %>', heightOffset: 245 },
            { customResizer: adjustScrollers }
        );

        // adjusts the overflow of the param scroller to fit in window
        function adjustScrollers(winWidth, winHeight) {
            $('ParameterScroller').style.maxHeight = Math.max(100, winHeight - 275) + 'px';
        }

        // loads the current Report by index in list
        // @index: the report to load by index in drop down
        function loadReportItem(reportId) {
            // get persistented filter params
            var cat = '<%= Server.HtmlEncode(QueryStringCategory) %>';
            var subCat = '<%= Server.HtmlEncode(QueryStringSubCategory) %>';
            var disease = '<%= QueryDisease %>';
            window.location = 'AdHocReports.aspx?category=' + cat + '&subcategory=' + subCat + '&report=' + reportId + '&disease=' + disease;
            hideReportSelectorMenu();
            return false;
        }

        // shows the report selector
        function showReportSelectorMenu() {
            var reportMenu = $('ReportSelectorMenu');
            reportMenu.style.visibility = 'visible';
            return false;
        }

        // hides the report selector
        // @src: optional src DOM node (for checking mouseLeave event)
        // @e: optional event arg (for checking mouseLeave event)
        function hideReportSelectorMenu(src, e) {
            // verify if mouse leave before closing layer or no args
            if ((src == null && e == null) || isMouseLeave(src, e)) {
                var reportMenu = $('ReportSelectorMenu');
                reportMenu.style.visibility = 'hidden';
            }
            return false;
        }

        function clearOldReportInfo() {
            $('txtReportHidden').value = '';
            $('txtSortByColumnHidden').value = '';
            $('txtSortOrderHidden').value = '';
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

        function setTodayOnBlur(field) {
            if (field.value.replace(' ', '') == '') { field.value = '<%= DateTime.Today.ToShortDateString() %>'; }
        }

        function loadStaticForm() {

            return true;
        }

        // shows the chart and hides table
        function showChartLayer() {
//            if ($('ChartLayer')) {
//                $('ReportLayer').style.display = 'none';
//                $('ChartLayer').style.display = 'block';
//                $('TableToggleBtn').className = 'buttonInactive';
//                $('GraphToggleBtn').className = 'buttonActive';
//            }
            showHideChartLayer(true);
        }

        // hides the chart and shows table
        function closeChartLayer() {
//            if ($('ChartLayer')) {
//                $('ReportLayer').style.display = 'block';
//                $('ChartLayer').style.display = 'none';
//                $('TableToggleBtn').className = 'buttonActive';
//                $('GraphToggleBtn').className = 'buttonInactive';
//                doGridUIAdjust();
//            }
            showHideChartLayer(false);
        }
        
        function showHideChartLayer(doShow) {
            
            var gridLayer = jQuery('#ReportLayer');
            var gridBtn = jQuery('#TableToggleBtn');
            var chartLayer = jQuery('#ChartLayer');
            var chartBtn = jQuery('#GraphToggleBtn');
            if(doShow) {               
                gridLayer.hide();
                gridBtn.attr('class', 'buttonInactive');
                chartLayer.show();
                chartBtn.attr('class', 'buttonActive');
            }
            else{
                gridLayer.show();
                gridBtn.attr('class', 'buttonActive');
                chartLayer.hide();
                chartBtn.attr('class', 'buttonInactive');                
                // adjust table UI
                doGridUIAdjust();
            }
        }

        // prints the current report
        function printForm() {
            // if static frame loaded, print frame contents
            if ($('<%= StaticReportsFrame.ClientID %>') != null) {
                printStaticReport();
            }
            // otherwise print current dynamic report view
            else {
                printDynamicReport();
            }
        }

         function printDynamicReport() {
        
            // print current window
        
//            // print hack, adjust DOM
            var grid = jQuery('#<%= AdminReportGrid.ClientID %>');
            var gridParent = grid.parent().first();
            var headerTable = jQuery('#<%= AdminReportGrid.ClientID %>_Header');            
            //grid.prepend('<thead>' + headerTable.html() + '</head>');
            
            var divs = jQuery('div');
            //headerTable.hide();
            divs.each(function(index, div) {
                var dom = jQuery(div);
                dom.data('pre-height', dom.css('height'));
                dom.css('height', '').css('overflow', '');
            });
            
            // move DOM
            gridParent.remove(grid);
            jQuery(document.body).append(grid);
            
            // simple print
            window.focus();
            window.print();
            // simple print
            
             // put back DOM
              jQuery(document.body).remove(grid);
            gridParent.append(grid);
            
            //headerTable.show();
            //grid.find('thead').remove();
             divs.each(function(index, div) {
                var dom = jQuery(div);
                dom.css('height', dom.data('pre-height'));
            });
        }

        // prints the current static report
        function printStaticReport() {
            var reportFrame = window.frames['<%= StaticReportsFrame.ClientID %>'];
            reportFrame.focus();
            if(reportFrame.printForm != null) {
                reportFrame.printForm();
            }
            else {
                reportFrame.print();
            }
        }

        function showHowGraphsMade(docPath) {
            top.showModal(docPath, 'How are these graphs created?');
        }

        function toggleParamaters() {
            var doShow = $('ParametersToggle').className != 'toggleOn';
            adjustParamaters(doShow);
        }

        function showParamaters() {
            return adjustParamaters(true);
        }

        function hideParamaters() {
            return adjustParamaters(false);
        }

        function adjustParamaters(doShow) {
            var reportContainer = $('ResultsContainer');
            var paramContainer = $('ParametersContainer');
            var toggleIcon = $('ParametersToggle');
            var paramatersWidth = getComputedCSS(paramContainer, 'width');
            var paramatersMarginRight = getComputedCSS(paramContainer, 'margin-right');
            if (reportContainer._initMarginRight == null) {
                reportContainer._initMarginRight = getComputedCSS(reportContainer, 'margin-right');
            }
            if (doShow) {
                // show paramaters
                paramContainer.style.display = '';
                // adjust report container (reset inital margin)
                reportContainer.style.marginRight = reportContainer._initMarginRight;
                // adjust icon
                //toggleIcon.innerHTML = 'hide paramaters';
                toggleIcon.src = '../../../Images/HideParameters.png';
                toggleIcon.className = 'toggleOn';
            }
            else {
                // hide paramaters
                paramContainer.style.display = 'none';
                // adjust report container (set margin to account for hidden params)
                reportContainer.style.marginRight = paramatersMarginRight;
                // adjust icon
                //toggleIcon.innerHTML = 'show paramaters';
                toggleIcon.src = '../../../Images/ShowParameters.png';
                toggleIcon.className = 'toggleOff';
            }
            doGridUIAdjust();
            return false;
        }

        function doGridUIAdjust() {
            var grid = jQuery('#<%= AdminReportGrid.ClientID %>');
            var headerTable = jQuery('#<%= AdminReportGrid.ClientID %>_Header');
            if (grid.size() > 0) {
                var rows = grid.find('tbody > tr');
                var firstRow = rows.first();
                if (firstRow.size() > 0) {
                    var firstRowCells = firstRow.find('td');
                    var headerRowCells = headerTable.find('th');
                    var cellCount = firstRowCells.size();
                    var largestCell = 0;
                    var largestCellIndex = -1;
                    firstRowCells.each(function(index, cell) {
                        var dataCell = jQuery(cell);
                        var headerCell =  jQuery(headerRowCells[index]);
                        var dataCellWidth = dataCell.width();
                        var headerCellWidth = headerCell.width();
                        // adjust cell widths to match
                        var cellWidth = Math.max(dataCellWidth, headerCellWidth);
                        dataCell.css('width', cellWidth + 'px');
                        headerCell.css('width', cellWidth + 'px');
                        
                        var isLargest = cellWidth > largestCell;
                        largestCell = isLargest ? cellWidth: largestCell;
                        largestCellIndex = isLargest? index : largestCellIndex;
                    });
                    // column with largest first row cell, will auto size
                    if(largestCell)
                    {
                        var dataCell = jQuery(firstRowCells[largestCellIndex]);
                        var headerCell = jQuery(headerRowCells[largestCellIndex]);
                        dataCell.css('width', 'auto');
                        headerCell.css('width', 'auto');
                    }
                }
            }
        }

        // UI adjustments on load
        jQuery(document).ready(function(e) {
            var grid = jQuery('#<%= AdminReportGrid.ClientID %>');
            // move header from internal overflown grid to external static table
            if (grid.size() > 0) {
                var hasRows = grid.find('tbody > tr').size() > 0;
                if (hasRows) {
                    // adjust header
                    var headerTable = jQuery('#<%= AdminReportGrid.ClientID %>_Header');
                    var gridHeader = grid.find('thead');
                    if (gridHeader.size() > 0 && headerTable.size() > 0) {
                       // headerTable.append(gridHeader);
                    }
                    // adjust pager
                    var footerTable = jQuery('#<%= AdminReportGrid.ClientID %>_Footer');
                    var footerRow = grid.find('tr.Pager');
                    if (footerRow.size() > 0) {
                        footerTable.append(footerRow);
                        footerRow.find('a,span').each(function(index,item) {
                            var node = jQuery(item);
                            var nodeText = node.text();
                            var nodeNum = parseInt(nodeText);
                            if(nodeNum.toString()!='NaN') {
                                // set new page label to show range
                                var index = nodeNum-1;
                                var from = (REPORT_PAGE_SIZE * index) + 1;
                                var to = REPORT_PAGE_SIZE * (index+1);
                                var dateRange = from + '-' + to;
                                node.text(dateRange);
                            }
                        });
                    }
                    // adjust header cell widths to match first row
                    doGridUIAdjust();
                    jQuery(window).resize(doGridUIAdjust);
                }
            }

            // customize patient characteristics with disease
            var pcButton = jQuery('#<%= PatientCharacteristics.ClientID %>');
            var onclick = "top.showModal('../../Modules/All/Reports/AmplioPatientCharacteristics.aspx?disease=<%= QueryDisease %>', 'Patient Characteristics. All values are median (IQR) or frequency (%)');";
            pcButton.click(function() {
                top.showModal("../../Modules/All/Reports/AmplioPatientCharacteristics.aspx?disease=<%= QueryDisease %>", "Patient Characteristics. All values are median (IQR) or frequency (%)");
            });
        });
        /* ]]> */
    </script>

    <style type="text/css">
        #ReportsMenuLayer
        {
            display: none;
            position: absolute;
            z-index: 10;
        }
        #ReportsMenuLayer a
        {
            display: block;
            cursor: pointer;
            text-decoration: none;
            font-size: 12px;
            padding-top: 2px;
            padding-bottom: 2px;
            vertical-align: middle;
        }
        #ReportsMenuLayer img
        {
            border-style: none;
            vertical-align: middle;
        }
        #ReportsMenuLayer a:hover
        {
            color: #000000;
        }         
        .EFormListTable
        {
            width: 100%;
            table-layout: fixed;
            text-align: left;
        }
        #EFormListContainer
        {
            overflow: auto;
            overflow-x: hidden;
            height: 400px;
            clear: both;
            border: solid 1px #cccccc;
        }
        .DisplayNone
        {
            display: none;
        }
        th
        {
        }
        td
        {
        }
        .RowA
        {
            background-color: #E0EBF1;
        }
        .RowA td
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #111111;
            border-bottom: solid 1px #cccccc;
            padding: 6px 0px 6px 14px;
        }
        .RowB
        {
            background-color: #ffffff;
        }
        .RowB td
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #111111;
            border-bottom: solid 1px #cccccc;
            padding: 6px 0px 6px 14px;
        }
        .RowHighlight
        {
            background-color: #E3CFCF;
            cursor: pointer;
        }
        .RowHighlight td
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #000000;
            border-bottom: solid 1px #cccccc;
            padding: 6px 0px 6px 14px;
        }
        .ListHeader th
        {
            cursor: pointer;
            text-decoration: underline;
            font-size: 12px;
            padding: 6px 0px 6px 14px;
            color: #ffffff;
            background-color: #3D556D;
        }
        .dataGrid
        {
             margin: 0px;
        }
        #UpdateActiveEformsBtn
        {
            float: right;
            margin-top: 10px;
        }
        .ParameterFieldContainer
        {
            max-height: 200px;
            overflow: auto;
        }
    </style>
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
            position: relative;
            top: expression(this.offsetParent.scrollTop - 2);
            background-color: #ffffff;
        }
        td a
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
        .DisplayInline
        {
            display: inline;
            text-decoration: none;
            /*margin-left: 4px;
            margin-right: 4px;*/
        }
        #HeadingPager SPAN.CurrentPageInPager
        {
            color: gray;
        }
        .Pager
        {
            line-height: 12px;
            width: 100%;
            text-align: left;
            display: block;
        }
        .Pager td
        {
            width: auto;
            font-weight: bold;
            padding: 2px 5px;
            margin: 2px 5px;
        }
        .Pager span, .Pager a
        {
            display: block;
            min-width: 15px;
            padding: 1px 1px;
            margin: auto;
        }
        .Pager span
        {
            color: #ccc;
        }
        .Pager a
        {
            color: #333;
            text-decoration: none;
        }
        .adminReportDescription
        {
            margin: 0px 0px 0px 30px;
        }
        .DatagridTable
        {
        }
        #FilteredList td
        {
            vertical-align: top;
            text-align: left;
        }
        .errorText
        {
            display: block;
        }
        .ParamField
        {
        }
        #ChartLayer
        {
            display: none;
            background-color: #ffffff;
        }
        #ParametersToggle
        {
            
        }
        #ReportLayerOverflow
        {
            overflow: auto;
            height: auto;
            border: 1px solid #cccccc;
        }
        #ReportRecordCount
        {
            display: block;
            text-align: center;
            font-weight: bold;
            font-style: italic;
        }
        #ParamButtons
        {
            margin: 3px auto;
            text-align: center;
        }
        #ParamButtons input
        {
            margin: 2px;
            text-align: right;
        }
        .ParameterNumber
        {
            width: 12px;
        }
        .ParameterText label
        {
            font-weight: bold;
        }
    </style>
    <style type="text/css" media="screen">
        #Wrapper
        {
            margin-top: 10px;
            margin-left: 30px;
            height: 550px;
            overflow: hidden;
        }
        #OverflowContainer
        {
            overflow: auto;
            height: 100%;
        }
        #printFormButton
        {
            display: inline;
        }
        
        
        .toggleOn
        {
            position: absolute;
            z-index: 1000;
            top: 150px;
            right: 300px;
            cursor: pointer;
            margin-right: 0px;
        }
        .toggleOff
        {
            position: absolute;
            z-index: 1000;
            top: 150px;
            right: 0px;
            cursor: pointer;
        }
        
        .reportDescription
        {
            font-family: Arial, Helvetica, sans-serif;
	        font-size: 11px;
	        font-weight: normal;
	        line-height: 10px;
	        color: #999999;
	        margin-left: 12px;
           cursor: help;
        }
        .reportDescriptionIcon
        {
           vertical-align: middle;
           margin-left: 4px;
           cursor: help;
        }
    </style>
    <style type="text/css" media="print">
        #optionColumn
        {
            display: none;
        }
        #printFormButton
        {
            display: none;
        }
        .DatagridTable td
        {
            border-top: solid 1px #666666;
        }
        /* print hack */
        form
        {
            display: none;
        }
        
    </style>
</head>
<body onload="setUseQueryStringCookie()">
    <form id="dataForm" method="post" runat="server">
    <div class="TopModuleBar_OuterContainer"><div class="TopModuleBar_InnerContainer">
        <img runat="server" id="GraphsCreatedImg" src="../../../Images/Button_HowAreTheseGraphsCreated.png" style="float: right; margin-top: 5px; cursor: pointer;" />
        <%--<img id="PatientCharacteristics" runat="server" src="~/Images/Button_PatientCharacteristics.png" onclick="top.showModal('../../Modules/All/Reports/AmplioPatientCharacteristics.aspx', 'Patient Characteristics');" style="float: right; margin-top: 5px; margin-right: 20px;  cursor: pointer;"/>--%>
        <img id="PatientCharacteristics" runat="server" src="~/Images/Button_PatientCharacteristics.png" style="float: right; margin-top: 5px; margin-right: 20px;  cursor: pointer;"/>
<table  cellspacing="0" cellpadding="0"><tr>
<td>
    <span class="TopModuleBarTitle"><img src="../../../Images/DataAnalysisHomeIcon.png" style="vertical-align: middle; cursor: pointer;" onclick="top.location='../ReportsIndex.aspx';" /></span>
    
    <asp:HyperLink runat="server" ID="MainReportsLink" CssClass="TopModuleBarTitle"></asp:HyperLink>

    <asp:HyperLink runat="server" ID="CategoriesReportsLink" CssClass="TopModuleBarTitle" style="text-decoration: none;"></asp:HyperLink>
    
    <asp:Label runat="server" ID="SubCategoriesReportsLink" CssClass="TopModuleBarTitle"></asp:Label>
</td>
<td class="TopModuleBar_SelectorLeft" onclick="showReportSelectorMenu();">
<div id="ReportSelectorMenu" style="position: absolute; z-index: 10; margin-left: -14px; margin-top: -7px; visibility: hidden;" onmouseout="hideReportSelectorMenu(this, event);">
	<table cellpadding="0" cellspacing="0">
    	<tr>
        	<td class="TopModuleBar_SelectorMenuTopLeft"><img src="../../../Images/ReportIcon_SelectAReport.png" style="margin: 0px 10px 0px 0px; vertical-align: baseline;" />Select a Report</td>
            <td class="TopModuleBar_SelectorMenuTopRight">&nbsp;</td>
        </tr>
        <asp:Repeater runat="server" ID="ReportMenuRptr" OnItemDataBound="SetReportIcon">
            <ItemTemplate>
                <tr class="TopModuleBar_SelectorMenuRow" onclick="return loadReportItem('<%# Server.UrlEncode(Eval("Id").ToString()) %>');"
                    title="<%# Server.HtmlEncode(Eval("Description").ToString()) %>">
                    <td class="TopModuleBar_SelectorMenuMidLeft">
                        <asp:Image runat="server" ID="ReportIcon" CssClass="ReportMenuIcon" ImageUrl="~/Images/ReportIcon_MainReport.png" />
                        <%# Eval("Title") %>
                    </td>
                    <td class="TopModuleBar_SelectorMenuMidRight">
                        &nbsp;
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
        	<td class="TopModuleBar_SelectorMenuBottomLeft">&nbsp;</td>
            <td class="TopModuleBar_SelectorMenuBottomRight">&nbsp;</td>
        </tr>
    </table>
</div>

<img class="ReportMenuIcon" src="../../../Images/ReportIcon_MainReport.png" /><%= ActiveReportTitle %></td>
<td class="TopModuleBar_SelectorRight" onclick="showReportSelectorMenu();">&nbsp;</td>
</tr></table>
<%--<asp:DropDownList ID="ReportMenu" runat="server" DataTextField="Title" DataValueField="ID" AutoPostBack="true" Style="display: none;"></asp:DropDownList>
--%>
</div></div><img  id="ParametersToggle" class="toggleOn" onclick="return toggleParamaters();"  src="../../../Images/HideParameters.png" />
    <div id="ParametersContainer" >
    
        
        <div id="DataAnalysisParametersTitle">
            ADJUST PARAMETERS</div>
        <div class="GrayContainerBox_TopLeft">
            <div class="GrayContainerBox_TopRight">
                <div class="GrayContainerBox_BottomLeft">
                    <div class="GrayContainerBox_BottomRight">
                        <div class="GrayContainerBox_InnerContainer" style="padding-top: 10px;">
                            <div id="ParameterScroller" style="max-height: 560px;">

                                <script type="text/javascript">
                                    var imgDir = '<%= Page.ResolveUrl("~/Images/Calendar/") %>';
                                </script>

                                <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>

                                <script type="text/javascript">
                                    spanAltRef.style.visibility = 'hidden';
                                </script>

                                <%-- Dynamic List Of Parameters --%>
                                <table id="ParametersTable" class="ParametersTable" cellspacing="0">
                                    <%-- Dynamic Report Params --%>
                                    <asp:Repeater runat="server" ID="ReportFieldsRptr" OnItemCreated="BuildReportFields">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="ParameterNumber">
                                                    <%# Eval("Index") %>.
                                                </td>
                                                <td class="ParameterText">
                                                    <asp:Label runat="server" ID="FieldLabel" CssClass="boldText"></asp:Label>
                                                    <span class="ParameterHelp">(choose one)</span>:
                                                    <div class="ParameterFieldContainer">
                                                        <asp:PlaceHolder runat="server" ID="FieldHolder"></asp:PlaceHolder>
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                                <%-- To/From Dates --%>
                                <table runat="server" class="ParametersTable" id="DateFilterTable">
                                    <tr>
                                        <td class="ParameterNumber">
                                            &nbsp;
                                        </td>
                                        <td class="ParameterText">
                                            <asp:Label runat="server" ID="lblFromDate" AssociatedControlID="txtFromDate">From:&nbsp;</asp:Label>
                                            <div>
                                                <cic:CaisisTextBox ID="txtFromDate" runat="server" ShowLabel="false" TabIndex="1"
                                                    onblur="setTodayOnBlur(this);" Style="width: 110px" ShowCalendar="true" CssClass="DisplayInline"></cic:CaisisTextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="ParameterNumber">
                                            &nbsp;
                                        </td>
                                        <td class="ParameterText">
                                            <asp:Label runat="server" ID="lblToDate" AssociatedControlID="txtToDate">To:&nbsp;</asp:Label>
                                            <div>
                                                <cic:CaisisTextBox ID="txtToDate" runat="server" ShowLabel="false" TabIndex="2" onblur="setTodayOnBlur(this);"
                                                    Style="width: 110px" ShowCalendar="true" CssClass="DisplayInline"></cic:CaisisTextBox>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <%-- Additional Filter --%>
                                <table runat="server" id="AdditionalFilterTable" class="ParametersTable">
                                    <tr>
                                        <td class="ParameterNumber">
                                            &nbsp;
                                        </td>
                                        <td class="ParameterText">
                                            <asp:Label ID="lblAdditionalFiltering" runat="server" AssociatedControlID="txtAdditionalFilter1">N/A</asp:Label>
                                            <div>
                                                <asp:TextBox runat="server" Width="120" ID="txtAdditionalFilter1" Visible="True" CssClass="DisplayInline"></asp:TextBox>
                                                <asp:DropDownList runat="server" Width="120" ID="ddlAdditionalFilter1" Visible="True" CssClass="DisplayInline">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                    <%-- Page Size Options --%>
                                <table class="InnerOptionTable ParametersTable" runat="server" id="ColumnsRadios">
                                    <tr>
                                        <td class="ParameterNumber">
                                            &nbsp;
                                        </td>
                                        <td class="ParameterText">
                                            <label>
                                                Columns:</label>
                                            <div>
                                                <asp:RadioButton GroupName="AllColumns" runat="server" Width="30" ID="rbAllColumns"
                                                    Text="All" CssClass="DisplayInline"></asp:RadioButton>
                                                <asp:RadioButton GroupName="AllColumns" runat="server" Width="30" ID="rbNotAllColumns"
                                                    Text="Subset" Checked="True" Enabled="False" CssClass="DisplayInline"></asp:RadioButton>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <table runat="server" id="PageFilterTable" class="ParametersTable">
                                    <tr>
                                        <td class="ParameterNumber">
                                            &nbsp;
                                        </td>
                                        <td class="ParameterText">
                                            <label for="ddlPageSize">
                                                Page size:</label>
                                            <div>
                                                <asp:DropDownList ID="ddlPageSize" runat="server" Width="100"  CssClass="DisplayInline"/>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="ParamButtons">
                                <asp:Button ID="btnShowReport" Text="Show Report" CssClass="dataEntryButtonGray"
                                    runat="server" />
                                <asp:PlaceHolder runat="server" ID="tblReportMenuExport" Visible="false">
                                    <excel:ExcelExportButton runat="server" ID="btnExport" CssClass="dataEntryButtonGray"
                                        Text="Excel" ToolTip="Export to Excel" OnClick="ExportToExcelClick" />
                                    <excel:ExcelExportButton runat="server" ID="btnCSV" CssClass="dataEntryButtonGray"
                                        Text="CSV" ToolTip="Export to CSV" OnClick="ExportToCSVClick" />
                                </asp:PlaceHolder>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="ResultsContainer">
        <img alt="Print Report" title="Print Report" src="../../../Images/Print_small.png" id="PrintReportButton" class="buttonActive" style="float: right; margin-bottom: 5px; margin-left: 10px;" onclick="printForm();"  />
        <div id="DataAnalysisResultsTitle"><%= ActiveReportTitle %><%--<img  title="<%= ActiveReportDescription%>" src="../../../Images/Icon_QuestionMark_12px.png" class="reportDescriptionIcon" />--%><span class="reportDescription" title="<%= ActiveReportDescription %>"> <%= ActiveReportDescription %> </span></div>
        <div class="GrayContainerBox_TopLeft">
            <div class="GrayContainerBox_TopRight">
                <div class="GrayContainerBox_BottomLeft">
                    <div id="TableGraphScroller" class="GrayContainerBox_BottomRight" style="height: 400px; width: 100%;">
                        <div class="GrayContainerBox_InnerContainer">
                            <%-- Dynamic Reports Toggle --%>
                            <asp:Panel runat="server" ID="ResultsToggleContainer" Visible="false">
                                <img id="TableToggleBtn" alt="View as Table" src="../../../Images/shim.gif"
                                    class="buttonActive" onclick="return closeChartLayer();" /><img id="GraphToggleBtn"
                                        alt="View as Graph" src="../../../Images/shim.gif" class="buttonInactive"
                                        onclick="return showChartLayer();" />
                            </asp:Panel>
                            <%-- Dynamic Reports Panel --%>
                            <asp:Panel runat="server" ID="GraphContainer" Style="height: 250px; overflow: auto;
                                width: auto; padding: 10px;">
                                <asp:Label runat="server" ID="SelectReportMessage">
                                Please adjust paramaters and click "Show Report" to view the report.
                                </asp:Label>
                                <div id="ReportLayer">
                                    <table id="<%= AdminReportGrid.ClientID %>_Header" class="dataGrid" style="border-color:#CCCCCC;border-width:1px;border-style:None;width:100%;border-collapse:collapse;" cellspacing="0" cellpadding="4" border="0">
                                    </table>
                                    <div id="ReportLayerOverflow">
                                        <asp:GridView ID="AdminReportGrid" runat="server" EnableViewState="True" Width="100%"
                                            ShowHeader="true" UseAccessibleHeader="true" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
                                            RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                                            GridLines="None" BorderStyle="None" AllowSorting="True" AllowPaging="True" PagerSettings-Position="Bottom"
                                            PagerStyle-HorizontalAlign="Left" PagerSettings-Mode="NumericFirstLast" AlternatingItemStyle-BackColor="#dfedf9"
                                            PagerStyle-CssClass="Pager" CellPadding="4" BorderColor="#cccccc" BorderWidth="1"
                                            ItemStyle-Height="26px" HeaderStyle-BackColor="#00668d" HeaderStyle-ForeColor="#ffffff">
                                        </asp:GridView>
                                    </div>
                                    <table id="<%= AdminReportGrid.ClientID %>_Footer" class="DatagridTable" style="width: 100%">
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <asp:Panel runat="server" ID="ChartLayer" Visible="false">
                                    <chart:ReportChart runat="server" ID="UserReportChart" />
                                </asp:Panel>
                                <asp:Label runat="server" ID="ReportRecordCount"></asp:Label>
                            </asp:Panel>
                            <%-- Static IFRAME Reports --%>
                            <iframe runat="server" id="StaticReportsFrame" name="StaticReportsFrame" src="ReportsContainer.aspx" frameborder="0"
                                scrolling="no" style="width: 100%; height: 400px; margin: 10px auto 10px auto;
                                border-style: none;"></iframe>
                        </div>
                        
                        <asp:Panel runat="server" ID="DataAnalysisResults" Visible="false">
                            <%--<asp:Label runat="server" ID="ReportNotesTitle"></asp:Label>--%>
                            <span class="DataAnalysisHighlightText"></span>
                            <table cellspacing="0" id="DataAnalysisResultsTable">
                                <asp:Repeater runat="server" ID="ReportNotesRptr">
                                    <ItemTemplate>
                                        <%-- <tr>
                                            <td class="DataAnalysisResults_ItemName">
                                                <%# Container.DataItem.ToString() %>
                                            </td>
                                        </tr> --%>
                                        <%--<td>
                                        32%
                                        </td>
                                        <td class="DataAnalysisResults_AdditionalInfo">
                                            (Ranked 2nd out of 25 surgeons)
                                        </td>--%>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </asp:Panel> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:PlaceHolder runat="server" ID="DynamicReportPanel">
        <table id="tblPageTitleAndPager" runat="server" enableviewstate="False" style="width: 635px;
            margin-bottom: 2px; margin-left: 30px; margin-top: 10px;">
            <tr>
                <td>
                    <asp:Label ID="lblPageTitle" runat="server" CssClass="adminPageTitle" Visible="false"></asp:Label>
                </td>
                <td style="margin-left: 40px;">
                    <asp:Label ID="txtRecordCount" runat="server">&nbsp;</asp:Label>
                </td>
                <td>
<%--                    <img id="printFormButton" runat="server" src="../../../../Images/PrintThisReport.gif"
                        style="cursor: pointer; float: right; border-style: none;" onclick="printForm();"
                        runat="server" alt="Print" />--%>
                </td>
            </tr>
        </table>
        <asp:Label ID="ErrorMsg" runat="server" Visible="false"></asp:Label>
        <div id="Wrapper" style="display: none;">
            <div id="OverflowContainer">
                <asp:Label ID="lblAdminPage" runat="server" EnableViewState="false"></asp:Label>
            </div>
        </div>
    </asp:PlaceHolder>
    <%-- Track Report --%>
    <asp:HiddenField runat="server" ID="ReportNameField" />
    <asp:HiddenField ID="txtReportHidden" runat="server" Visible="true"></asp:HiddenField>
    <asp:HiddenField ID="txtDllReportLast" runat="server" Visible="true"></asp:HiddenField>
    <asp:HiddenField ID="txtSortByColumnHidden" runat="server" Visible="true"></asp:HiddenField>
    <asp:HiddenField ID="txtSortOrderHidden" runat="server" Visible="true"></asp:HiddenField>
    </form>
    <!-- Loader Logic -->
    <script type="text/javascript">
        (function() {
            // hide when page loaded
            $(window).addEvent("load", function(){
                top.hideLoaderBar();
            });
            // show when page un-loading
            $(window).addEvent("beforeunload", function(){
                top.showLoaderBar();
            });
            // init logic for static report frame
            var containerFrameId = "<%= StaticReportsFrame.ClientID %>";
            var containerFrame = $(containerFrameId);
            var containerFrameWindow = $(window.frames[containerFrameId]);
            // report container frame loaded, wire showing/hiding of main report frame
            if(containerFrame){
                containerFrame.addEvent("load", function() {
                    // hide loader
                    top.hideLoaderBar();
                    // wire events for report inner frame
                    var reportFrameId = "ReportContent";
                    var reportFrameElement = containerFrameWindow.document.getElementById(reportFrameId);                
                    var reportFrameWindow = containerFrameWindow.frames[reportFrameId];
                    if(reportFrameElement && reportFrameWindow){               
                        $(reportFrameElement).addEvent("load", function() {
                            top.hideLoaderBar();
                            $(reportFrameWindow).addEvent("beforeunload", function() {
                                top.showLoaderBar();
                            });
                        });
                    }
                });
            }
        })();
    </script>
</body>
</html>