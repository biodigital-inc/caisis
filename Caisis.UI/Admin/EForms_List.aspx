<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EForms_List.aspx.cs" Inherits="Caisis.UI.Admin.EForms_List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Eforms</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.tablesorter.min.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        // defines if dynamic eform will open in new window
        var USE_NEW_WINDOW = true;
        var BUILDER_WINDOW;

        jQuery.noConflict();

        // previews a static eform
        // @eFormName: the name of the static eform
        function previewStaticEform(eFormName) {
            var url = 'EForms_ViewStatic.aspx?eform=' + escape(eFormName) + '&preview=true';
            var title = 'Preview: ' + eFormName;
            viewPageInModal(url, title, '95%', '95%');
        }

        // views an efom XML
        // @eFormName: the name of the eform
        // @encEformPath: the encrypted path to the eform xml
        function viewEformXML(eFormName, encEformPath) {
            var url = '<%= Page.ResolveUrl("~/Core/Eforms/EformDebug.aspx?encEformName=") %>' + encEformPath;
            var title = 'XML: ' + eFormName;
            viewPageInModal(url, title);
            return false;
        }

        function viewEformComponent(component, componentPath) {
            var url = componentPath;
            var title = 'Eform Component: ' + component;
            viewPageInModal(url, title);
            return false;
        }       

        function viewPageInModal(url, title, width, height) {
            top.showModalWithConfig(url, title, { width: width ? width : 950, height: height ? height : 700 });
        }

        function viewEforms() {
            window.location = 'EForms_List.aspx?diseaseId=<%= QueryDiseaseId %>';
        }

        function viewEformComponents() {
            window.location = 'EForms_List.aspx?diseaseId=<%= QueryDiseaseId %>&view=components';
        }

        // closes current eform builder popup
        function closeBuilderAndReload() {
            if (BUILDER_WINDOW) BUILDER_WINDOW.close();
            window.location = window.location;
        }

        // adjuts the height of the main eform list
        function adjustOverflow() {
            jQuery('.EFormListContainer').css('maxHeight', jQuery(window).height() - 90 + 'px');
        }

        // init
        jQuery(document).ready(function() {
            // setup component lists
            var components = jQuery('#ComponentsList li');
            // on click of each component, set as active
            components.each(function(index, li) {
                jQuery(li).find('a').click(function(e) {
                    components.removeClass('selected');
                    jQuery(li).addClass('selected');
                });
            });

            // setup sorting on eform list (only 1 set will be visibale at a time, eforms or components)
            var sortableTable = jQuery('.EFormListTableSortable');
            var sortableTableHeader = jQuery('.EFormListTableHeader');
            var inner = sortableTable.find('thead');
            if (inner.size() > 0 && sortableTableHeader.size() > 0) {
                // init sortable
                sortableTable.tablesorter();
                // on click of header cell, delay adjust css for rows
                jQuery('.EFormListTableSortable thead').find('th').click(function(e) {
                    setTimeout(function() { adjustTableRowCSS(sortableTable); }, 50);
                });

                // at runtime move header row from inner table to outter table to prevent scrolling
                sortableTableHeader[0].appendChild(inner[0].parentNode.removeChild(inner[0]));
            }
                // adjust overflow and on resize
                adjustOverflow();
                jQuery(window).resize(adjustOverflow);
        });

        // adjuts the row alternating css for the table
        // @tableDOM: the table DOM or jQuery reference
        function adjustTableRowCSS(tableDOM) {
            var visibleIndex = 0;
            jQuery(tableDOM).find('tbody > tr').each(function(i, row) {
                // only account for visible rows
                if (jQuery(row).is(':visible')) {
                    // adjust row class based on visible index
                    jQuery(row).removeClass('RowA RowB').addClass(visibleIndex % 2 == 0 ? 'RowA' : 'RowB');
                    // increment
                    visibleIndex++;
                }
            });
        }

        // toggle whether dynamic eforms are show
        // @doShow: true | false whether to show dynamic eforms
        function toggleHideDynamicEforms(doShow) {
            var sortableTable = jQuery('.EFormListTableSortable');
            sortableTable.find('tbody > tr').each(function(i, row) {
                if (doShow) {
                    jQuery(row).show();
                }
                else {
                    // hide row if dynamic (by class)
                    if (jQuery(row).hasClass('EFormDynamicRow')) {
                        jQuery(row).hide();
                    }
                }
            });
            adjustTableRowCSS(sortableTable);
        }

        /* ]]> */
    </script>

    <style type="text/css">
        .EFormListTable
        {
            width: 100%;
            table-layout: fixed;
            text-align: left;
        }
        .EFormListTable td, .EFormListTable th
        {
            text-align: left;
        }
        .EFormListContainer
        {
            overflow: auto;
            overflow-x: hidden;
            max-height: 650px;
            clear: both;
        }
        th
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
        .RowA:hover, .RowB:hover, .RowHighlight
        {
            background-color: #E3CFCF;
            cursor: pointer;
        }
        .RowA:hover, .RowB:hover, .RowHighlight
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
        #UpdateActiveEformsBtn
        {
            float: right;
            margin-top: 10px;
        }
    </style>
    <style type="text/css">
        .surveyListItemTable
        {
            table-layout: fixed;
            width: 95%;
        }
        .surveyListItemTable th
        {
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 12px;
            color: #000000;
            font-weight: bold;
            padding: 0px 0px 1px 2px;
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="SelectFormBox" class="adminNavBoxContainer" style="width: 600px;">
        <asp:PlaceHolder runat="server" ID="EformListPanel">
            <table class="surveyListItemTable" cellspacing="0" >
                <thead>
                    <tr>
                        <th style="width: <%= QueryDiseaseId.HasValue ? "75%": "65%" %>;">
                            <%= EFormType %>
                            Name (<asp:Literal runat="server" ID="EFormCount" Text="0"></asp:Literal>)
                        </th>
                        <th style="width: auto; <%= QueryDiseaseId.HasValue ? "display: none;": "" %> text-align: left;">
                            Disease
                        </th>
                        <th style="width: 50px; text-align: center;">
                            Active
                        </th>
                        <th style="width: 15%;">
                            Preview
                        </th>
                    </tr>
                </thead>
            </table>
            <div id="mainAdminBox" class="adminBox">
                <div id="adminBoxNavListContainer" class="adminBoxNavListContainer EFormListContainer" style="overflow-x: hidden;
                    word-wrap: break-word;">
                    <ul id="TableList" class="adminBoxNavList">
                        <asp:Repeater runat="server" ID="EformsRptr">
                            <ItemTemplate>
                                <li id="" title="" class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "") %>" onclick="return previewStaticEform('<%# Eval("Name").ToString().Replace("\'","\\\'") %>');">
                                    <table cellspacing="0" class="surveyListItemTable">
                                        <tr id="Survey_<%# Eval("EFormId") %>" class="">
                                            <td style="width: <%= QueryDiseaseId.HasValue ? "75%": "65%" %>;">
                                                <%# Eval("Name")%>
                                            </td>
                                            <td style="width: auto; <%= QueryDiseaseId.HasValue ? "display: none;": "" %>">
                                                <%# Eval("Disease")%>
                                            </td>
                                            <td style="width: 50px; text-align: center;">
                                                <%# Eval("Active").ToString().ToLower() %>
                                            </td>
                                            <td style="width: 15%; text-align: right;">
                                                <span class="dataEntryButtonGray" onclick="return previewDynamicEform('<%# Eval("Name").ToString().Replace("\'","\\\'") %>', event);">
                                                    Preview</span>
                                            </td>
                                        </tr>
                                    </table>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                                <li id="NoResultsMsg" runat="server" style="text-align: center;">
                                    No EForms are associated with the selected disease.
                                </li>
                    </ul>
                </div>
            </div>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="EformComponentHolder" Visible="false">
            <table class="surveyListItemTable">
                <thead>
                    <tr>
                        <th style="width: auto;">
                            Component Name (<asp:Literal runat="server" ID="EFormComponentCount" Text="0"></asp:Literal>)
                        </th>
                        <th style="width: <%= QueryDiseaseId.HasValue ? "65%": "55%" %>;">
                            Path
                        </th>
                        <th style="width: 100px; <%= QueryDiseaseId.HasValue ? "display: none;": "" %>">
                            Disease
                        </th>
                    </tr>
                </thead>
            </table>
            <div id="mainAdminBox" class="adminBox">
                <div id="EFormListContainer" class="EFormListContainer" style="overflow-x: hidden;
                    word-wrap: break-word;">
                    <ul id="TableList" class="adminBoxNavList">
                        <asp:Repeater runat="server" ID="EformComponentsRptr">
                            <ItemTemplate>
                                <li id="" title="" class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "") %>">
                                    <table cellspacing="0" class="surveyListItemTable">
                                        <tr class="" onclick="return viewEformComponent('<%# Eval("Component").ToString().Replace("\'","\\\'") %>', 'AdminEformComponentHolder.aspx?componentPath=<%# Server.UrlEncode(Eval("Path").ToString()) %>&preview=true');">
                                            <td style="width: auto;">
                                                <%# Eval("Component") %>
                                            </td>
                                            <td style="width: <%= QueryDiseaseId.HasValue ? "65%": "55%" %>;">
                                                <%# Eval("Path") %>
                                            </td>
                                            <td style="width: 100px; <%= QueryDiseaseId.HasValue ? "display: none;": "" %>">
                                                <%# Eval("Disease") %>
                                            </td>
                                        </tr>
                                    </table>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                                <li id="NoComponentResultsMsg" runat="server" style="text-align: center;">
                                    No EForm components are associated with the selected disease.
                                </li>
                    </ul>
                </div>
            </div>
            <iframe id="ComponentFrame" name="ComponentFrame" src="AdminEformComponentHolder.aspx"
                style="position: absolute; top: 10px; right: 10px; width: 800px; height: 650px;
                display: none;" frameborder="0"></iframe>
        </asp:PlaceHolder>
        <span class="dataEntryButtonGray NavListFooterButton" name="viewToggle" id="EFormsToggle" runat="server"
        onclick="viewEforms();">View Eforms</span>
    <span class="dataEntryButtonGray NavListFooterButton" name="viewToggle"
        id="EFormComponentToggle" runat="server" onclick="viewEformComponents();">View Eform
        Components</span>
    </div>
    
    </form>
</body>
</html>
