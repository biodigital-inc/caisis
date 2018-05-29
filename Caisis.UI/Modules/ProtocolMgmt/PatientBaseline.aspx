<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientBaseline.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientBaseline" %>

<%@ Register TagPrefix="dataEntry" TagName="Form" Src="~/Core/DataEntryForms/DynamicDataEntryForm.ascx" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Baseline Form</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>
    <script type="text/javascript" src="../../ClientScripts/EFormScripts.js"></script>
    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        Browser.ResizeElement({ nodeId: "BaselineFormPanel", heightOffset: 300 });

        jQuery.noConflict();

        jQuery(document).ready(function () {
            // get components
            var dataEntryPanel = jQuery("#BaselineFormPanel");
            var dataEntryComponents = jQuery("#BaselineFormPanel .DataEntryComponent");
            var components = jQuery("table.DataRecords.EditableRecords");
            var gridDataEntry = components.filter(function (index, table) {
                return jQuery(table).find("thead").length > 0;
            });
            var singleDataEntry = components.not(gridDataEntry);
            var getInputs = function (container) {
                return jQuery(container).find("input, select, textarea").not("input[type='hidden']");
            };
            var inputHasValue = function (input) {
                return jQuery(input).val() != "";
            };
            var getInputsWithValue = function (index, input) {
                return inputHasValue(input);
            };
            // validate form
            jQuery("form").submit(function (e) {
                var formValid = true;
                var validateSection = function (index, container) {
                    var dataEntryComponent = jQuery(container).parents(".DataEntryComponent");
                    var componentHeader = dataEntryComponent.find("> h3");
                    var componentHash = componentHeader.attr("id");
                    var componentTitle = jQuery.trim(componentHeader.text());
                    var inputs = getInputs(container);
                    var requiredInputs = inputs.filter("[data-required]");
                    if (requiredInputs.length == 0)
                        return;
                    var standardInputs = inputs.not(requiredInputs);
                    // check inputs
                    var inputsHaveValue = standardInputs.filter(getInputsWithValue).length > 0;
                    var requiredHaveValue = requiredInputs.filter(getInputsWithValue).length > 0;
                    if (inputsHaveValue && !requiredHaveValue) {
                        // scroll to section and warn user
                        window.location.hash = componentHash;
                        alert("Please check the required field in the section : " + componentTitle);
                        formValid = false;
                        // stop check
                        return false;
                    }
                };
                // validate first
                singleDataEntry.each(validateSection);
                if (formValid) {
                    gridDataEntry.each(function (index, table) {
                        var rows = jQuery(table).find("tbody > tr");
                        var tableValid = true;
                        rows.each(validateSection);
                        // check
                        return formValid;
                    });
                }
                return formValid;
            });
        });

        function loadBaselineEForm(urlVars) {
            var targetWindow = window;
            // set active Baseline tab (don't load tab, just set active)
            if (window.parent && window.parent.parent.setActiveTab) {
                targetWindow = window.parent;
                window.parent.parent.setActiveTab('PatientBaseline', true);
            }
            else if (parent.setActiveTab) {
                targetWindow = window;
                window.parent.setActiveTab('PatientBaseline', true);
            }
            // load new or update eform
            targetWindow.location = '<%= Page.ResolveUrl("~/Core/Eforms/EditEFormContainer.aspx") %>?' + urlVars;
            return false;
        }

        function loadApprovedEForm(eformId) {
            var url = '<%= Page.ResolveUrl("~/Core/EForms/EFormPrintableText.aspx") %>';
            top.showModalWithConfig(url + '?approved=true&eformId=' + eformId, 'Approved EForm', { width: '1000px', height: '90%' });
        }

        function LoadDataEntryForm(tableName, priKey) {
            var url = "../../Core/DataEntryForms/DynamicForm.aspx?tablename=" + tableName + "&pkey=" + priKey;
            top.showModal(url, "Edit " + tableName, window);
            return false;
        }

        function reloadDataIframe() {
            window.location = window.location;
        }

        function CloseDynFormPopup() {
            // do nothing
            top.hideModal();
        }

        // TODO: cleanup
        function showFirstAdditionalRow(linkReference, tableId) {
            var rowShown = false;
            var hideWidget = true;
            var table = document.getElementById(tableId);
            for (i = 0; i < table.rows.length; i++) {
                var row = table.rows[i];
                var rowIsHidden = getComputedCSS(row, "display") == "none";
                if (rowShown == false && rowIsHidden) {
                    row.style['display'] = 'table-row';
                    rowShown = true;
                } else if (rowShown == true && rowIsHidden) {
                    hideWidget = false;
                }
            }

            if (hideWidget) {
                linkReference.style['display'] = 'none';
            }
            return false;
        }

        function showHidePanel(panelId, show) {
            var panel = document.getElementById(panelId);
            if (show) {
                panel.style.display = 'block';
            }
            else {
                panel.style.display = 'none';
            }
        }

        function printForm() {
            var inputs = jQuery("#BaselineFormPanel input[type='text'],#BaselineFormPanel select,#BaselineFormPanel textarea");
            inputs.each(function () {
                var input = jQuery(this);
                var value = input.val();
                var span = jQuery("<div class='inputLabel' />");
                span.text(value);
                span.insertBefore(input);
            });
            // hide inputs
            inputs.hide();
            // print form
            window.print();
            // remove labels
            var labels = jQuery("#BaselineFormPanel div.inputLabel");
            labels.remove();
            // show inputs
            inputs.show();
        }

        /* ]]> */
    </script>
    <style type="text/css">
        #NavigationLayout {
            display: table;
            table-layout: fixed;
            width: 100%;
            margin: 0;
        }

            #NavigationLayout > div {
                display: table-cell;
            }

        ol#FormNavigation {
            display: block;
            width: 150px;
            padding: 0px;
            margin: 0;
            background-color: #fff;
            border-radius: 3px;
            border: 1px solid #ddd;
        }

        #FormNavigationContainer {
            position: fixed;
            top: 0;
            left: 0;
        }

        ol#FormNavigation li {
            list-style-type: none;
            padding: 0;
            margin: 0;
            white-space: normal;
        }

        ol#FormNavigation > li > span {
            display: block;
            padding: 2px;
            background-color: #eee;
            font-weight: bold;
            font-size: 14px;
        }

        ol#FormNavigation ol {
            display: block;
            margin: 0;
            padding: 0;
        }

            ol#FormNavigation ol > li {
                margin: 0;
            }

                ol#FormNavigation ol > li > a {
                    display: block;
                    padding: 2px;
                    font-size: 13px;
                    color: #222;
                    border: 1px solid transparent;
                }

                    ol#FormNavigation ol > li > a:hover {
                        text-decoration: underline;
                        background-color: #eee;
                    }

                    ol#FormNavigation ol > li > a:active {
                        color: Red;
                    }

        #FormNavigationPanel {
            display: inline-block;
            width: 175px;
        }

        #BaselineFormPanel {
            position: relative;
            display: block;
            overflow: auto;
            margin-bottom: 10px; /*
            border: 1px solid #dddddd;
            border-radius: 3px;
            */
        }

            #BaselineFormPanel .DataEntryComponent {
                margin: auto auto 10px auto;
                padding: 8px;
                border: 1px solid #dddddd;
                border-radius: 3px;
            }

                #BaselineFormPanel .DataEntryComponent label {
                    font-weight: bold;
                }
            /* required grids */
            #BaselineFormPanel table.DataRecords > tbody > tr.required {
                background-color: #FF0000;
            }

        #DataEntryFooter,
        #PrintBtn {
            display: block;
            margin: 15px auto;
            text-align: center;
        }

        #DataEntryFooter {
            margin-left: 175px;
        }

        .DataSelectionPanel {
            margin: 5px auto;
            font-size: larger;
        }
    </style>
    <style type="text/css" media="print">
        #FormNavigationPanel, #DataEntryFooter, #PrintBtn {
            display: none !important;
        }

        #BaselineFormPanel {
            display: block;
            width: 100%;
            height: auto !important;
        }

            #BaselineFormPanel table.DataRecords {
                width: auto;
                max-width: 100%;
                table-layout: auto;
            }
            /* input fields */
            #BaselineFormPanel input[type="text"], #BaselineFormPanel select, #BaselineFormPanel textarea {
                display: none !important;
            }
            /* input labels */
            #BaselineFormPanel .inputLabel {
                display: inline-block;
                white-space: normal;
            }
            /* components */
            #BaselineFormPanel .DataEntryComponent {
                height: auto;
                margin: 5px auto;
                page-break-before: auto;
                page-break-after: auto;
            }
            /* blank rows */
            #BaselineFormPanel tr.dataGridBlankRowVisible, #BaselineFormPanel tr.dataGridBlankRowHidden {
                display: none !important;
            }
        /* add row buttons */
        .AddNewRowBtn {
            display: none;
        }
        /* widgets */
        .CalendarWidget, .ComboWidget, .TextEditorWidget, .imageButtonOn {
            display: none;
        }
    </style>
</head>
<body style="background-color: transparent;">
    <form id="form1" runat="server">
        <div id="NavigationLayout">
            <!-- data entry navigation -->
            <div id="FormNavigationPanel">
                &nbsp;
            <div id="FormNavigationContainer">
                <ol id="FormNavigation">
                    <asp:Repeater runat="server" ID="NavigationRptr" OnItemDataBound="BuildControlNames">
                        <ItemTemplate>
                            <li><span>
                                <%# Eval("SectionName") %></span>
                                <ol>
                                    <asp:Repeater runat="server" ID="ControlNamesRptr">
                                        <ItemTemplate>
                                            <li><a href="#<%# Eval("ControlName") %>">
                                                <%# Eval("DisplayName") %>
                                            </a></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ol>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ol>
                <span id="PrintBtn" onclick="printForm();" class="dataEntryButtonRed">Print Form</span>
            </div>
            </div>
            <div id="BaselinePanelWrapper">
                <asp:Panel runat="server" ID="BaselineFormPanel">
                    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>
                    <!-- data entry components -->
                    <dataEntry:Form runat="server" ID="BaselineFormComponents"></dataEntry:Form>
                </asp:Panel>
            </div>
        </div>
        <div id="DataEntryFooter">
            <asp:Button runat="server" ID="SaveBtn" OnClick="SaveBaselineClick" Text="Update the Baseline Form"
                CssClass="dataEntryButtonRed" />
        </div>
    </form>
</body>
</html>
