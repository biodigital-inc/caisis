<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaperForms_View.aspx.cs"
    Inherits="Caisis.UI.Admin.PaperForms_View" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paper Forms Eforms</title>
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

        function previewPaperForm(formName, page, e) {
            var url = '<%= Page.ResolveUrl("~/Core/PaperForms/FormsContent.aspx") %>?formType=' + page;
            viewPageInModal(url, 'Paper Form: ' + formName, '900px', '95%');
            stopBubble(e);
            return false;
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
            padding: 0px 0px 1px 2px;
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="SelectFormBox" class="adminNavBoxContainer" style="width: 600px;">
        <table class="surveyListItemTable" cellspacing="0">
            <thead>
                <tr>
                    <th style="width: 50%;">
                        Form Name
                    </th>
                    <th style="width: 25%;">
                        Disease
                    </th>
                    <th style="width: 10%;">
                        Active
                    </th>
                    <th style="width: 15%;">
                        Preview
                    </th>
                </tr>
            </thead>
        </table>
        <div id="mainAdminBox" class="adminBox">
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;
                word-wrap: break-word;">
                <ul id="TableList" class="adminBoxNavList">
                    <asp:Repeater runat="server" ID="DiseaseFormsRptr">
                        <ItemTemplate>
                            <li id="" title="" class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "") %>"  onclick="return previewPaperForm('<%# Eval("FormName").ToString().Replace("\'","\\\'") %>', '<%# Eval("Page").ToString().Replace("\'","\\\'") %>',event);" >
                                <table cellspacing="0" class="surveyListItemTable">
                                    <tr class="">
                                        <td style="width: <%= QueryDiseaseId.HasValue ? "75%": "65%" %>;">
                                            <%# Eval("FormName") %>
                                        </td>
                                        <td style="width: auto; <%= QueryDiseaseId.HasValue ? "display: none;": "" %>">
                                            <%# Eval("Disease") %>
                                        </td>
                                        <td style="width: 50px; text-align: center;">
                                            <%# Eval("Active").ToString().ToLower() %>
                                        </td>
                                        <td style="width: 15%; text-align: right;">
                                            <span class="dataEntryButtonGray" onclick="return previewPaperForm('<%# Eval("FormName").ToString().Replace("\'","\\\'") %>', '<%# Eval("Page").ToString().Replace("\'","\\\'") %>',event);">Preview</span>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                                <li id="NoResultsMsg" runat="server" style="text-align: center;">
                                    No paper forms are associated with the selected disease.
                                </li>
                </ul>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
