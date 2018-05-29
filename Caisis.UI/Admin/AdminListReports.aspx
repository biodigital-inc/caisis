<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminListReports.aspx.cs" Inherits="Caisis.UI.Admin.AdminListReports" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            // adjust overflow and on resize
                adjustOverflow();
                jQuery(window).resize(adjustOverflow);
        });
        
        // adjuts the height of the main list
        function adjustOverflow() {
            jQuery('.adminBoxNavListContainer').css('maxHeight', jQuery(window).height() - 90 + 'px');
        }

        function viewPageInModal(url, title, width, height) {
            top.showModalWithConfig(url, title, { width: width ? width : 950, height: height ? height : 700 });
        }

        /* ]]> */
    </script>

    <style type="text/css">
        #SurveyQuestionFields
        {
            max-height: 450px;
            overflow: auto;
        }
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
            padding-left: 2px;
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="SelectFormBox" class="adminNavBoxContainer" style="width: 840px;">
        <table class="surveyListItemTable">
            <thead>
                <tr>
                    <th style="width: auto;">
                        Report Name
                    </th>
                    <th style="width: 160px;">
                        Category
                    </th>
                    <th style="width: 100px; text-align: center;">
                        Static
                    </th>
                </tr>
            </thead>
        </table>
        <div id="mainAdminBox" class="adminBox">
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;
                word-wrap: break-word;">
                <ul id="TableList" class="adminBoxNavList">
                    <asp:Repeater runat="server" ID="CategoriesRptr">
                        <ItemTemplate>
                            <li id="" title="" class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "") %>">
                                <table cellspacing="0" class="surveyListItemTable">
                                    <tr class="">
                                        <td style="width: auto; vertical-align: top; padding-right: 30px;">
                                            <span class="boldText" style="font-size: 12px; display: block;"><%# Eval("Title")%></span>
                                            <span style="margin-top: 6px; display: block;"><%# Eval("Description") %></span>

                                        </td>
                                        <td style="width: 160px; vertical-align: top; font-weight: bold;">
                                            <%# Eval("Category")%>
                                        </td>
                                        <td style="width: 100px; text-align: center; vertical-align: top;">
                                            &nbsp;&nbsp;&nbsp;<%# (bool)Eval("IsStatic") ? "Yes" : ""%>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
