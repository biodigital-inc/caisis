<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Workflow_List.aspx.cs" Inherits="Caisis.UI.Admin.Workflow_List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Workflows</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        var USE_NEW_WINDOW = true;
        var BUILDER_WINDOW;
         
        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            // adjust overflow and on resize
                adjustOverflow();
                jQuery(window).resize(adjustOverflow);
        });
        
        // adjuts the height of the main eform list
        function adjustOverflow() {
            jQuery('.EFormListContainer').css('maxHeight', jQuery(window).height() - 90 + 'px');
        }
        
        function editWorkflow(eid, eFormName) {
            // warn user if they're editing Baseline form
            if (eFormName == 'Baseline') {
                // cancel by user request if needed
                var goToBaseline = confirm('Editing this Eform may have consequences to the Protocol Manager module. Would you like to continue?');
                if (!goToBaseline) {
                    return false;
                }
            }
            var url = 'AdminEformBuilder/AdminEformBuilder.aspx?eformId=' + eid;
            if (USE_NEW_WINDOW) {
                BUILDER_WINDOW = window.open(url, '', 'menubar=0,toolbar=0,resizable=1');
            }
            else {
                window.location = url;
            }
        }

        function createNewWorkflow() {
            editWorkflow('', '');
        }

        // previews a dynamic eform
        // @eFormName: the name of the dynamic eform
        function previewDynamicEform(eFormName, e) {
            var url = '<%= Page.ResolveUrl("~/Core/DynamicEforms/Eform.aspx") %>' + '?paid=&eformName=' + escape(eFormName) + '&preview=true'
            var title = 'Preview: ' + eFormName;
            viewPageInModal(url, title);
            if(e) { stopBubble(e); }
        }
        
        function doSetEFormActive(eFormId, cb, e) {
            var isActive = cb.checked;
            // disable before post
            jQuery(cb).attr('disabled', 'disabled');
            jQuery.post('Workflow_List.aspx', { method: "setEFormActive", eformId: eFormId, isActive: isActive }, function(data) {
                // remove disabled
                jQuery(cb).removeAttr('disabled');
                // check cb to confirm return value
                cb.checked = isActive;
            });
            stopBubble(e);
            return false;
        }

        function closeBuilderAndReload() {
            if (BUILDER_WINDOW) BUILDER_WINDOW.close();
            window.location = window.location;
        }

        function viewPageInModal(url, title, width, height) {
            top.showModalWithConfig(url, title, { width: width ? width : 950, height: height ? height : 700 });
        }

        /* ]]> */
    </script>
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
        <table class="surveyListItemTable" cellspacing="0">
            <thead>
                <tr>
                    <th style="width: 50%;">
                        Workflow Name
                    </th>
                    <th style="width: auto; <%= QueryDiseaseId.HasValue ? "display: none;": "" %>">
                        Disease
                    </th>
                    <th style="width: 10%;">
                        Active
                    </th>
                    <th style="width: 15%; text-align: right; padding-right: 20px;">
                        Preview
                    </th>
                </tr>
            </thead>
        </table>
        <div id="mainAdminBox" class="adminBox">
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer EFormListContainer" style="overflow-x: hidden; word-wrap: break-word;">
                <ul id="TableList" class="adminBoxNavList">
                    <asp:Repeater runat="server" ID="WorkflowsRptr">
                        <ItemTemplate>
                            <li id="" title="" class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "") %>" onclick="return editWorkflow('<%# Eval("EformId") %>', '<%# Eval("Name").ToString().Replace("\'","\\\'") %>');">
                                <table cellspacing="0" class="surveyListItemTable">
                                    <tr id="Survey_<%# Eval("EFormId") %>" class="">
                                        <td style="width: 50%;">
                                            <%# Eval("Name")%>
                                        </td>
                                        <td style="width: auto; <%= QueryDiseaseId.HasValue ? "display: none;": "" %>">
                                            <%# Eval("Disease")%>
                                        </td>
                                        <td style="width: 10%; text-align: center;">
                                            <input type="checkbox" <%# (bool)Eval("Active") ? "checked=\"checked\"" : ""%> onclick="doSetEFormActive('<%# Eval("EformId") %>', this, event);">
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
                                    No workflows are associated with the selected disease.
                                </li>
                </ul>
                <span runat="server" id="NoTablesMessage" visible="false">No surveys have been customized
                    for this disease view.<br />
                    <br />
                    Click <strong>Add Survey</strong> below to select surveys you would like to associate
                    with this disease.</span>
            </div>
        </div>
        <span class="dataEntryButtonGray NavListFooterButton" onclick="return createNewWorkflow();">
            Add A New Workflow</span>
    </div>
    </form>
</body>
</html>
