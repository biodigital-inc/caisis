<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientToxicity.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientToxicity" %>

<%@ Register TagPrefix="plugin" TagName="CTCAE" Src="~/Plugins/CTCAEWizard/CTCAEWizardControl.ascx" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Toxicities</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>
    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>
    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        jQuery(document).ready(function (e) {
            // init SAE toggle
            // add change handler
            var saeCheckBox = jQuery("#ToxSAEField");
            saeCheckBox.change(updateSAECheck);
            // inital
            updateSAECheck();

            // init other checkbox logic
            var deathDate = jQuery("#PtDeathDateText");

            // init on-going logic
            var toxOngoing = jQuery("#ToxOngoing");
            var stopDateText = jQuery("#ToxStopDateText");
            var stopDate = jQuery("#ToxStopDate");
            var STOP_DATE_MESSAGE = "Either End Date or Ongoing should be checked, but not both.";
            var validateStopDateField = function (e) {
                var valid = validateStopDate(stopDateText, toxOngoing);
                if (!valid) {
                    alert(STOP_DATE_MESSAGE);
                }
                return valid;
            };
            toxOngoing.change(validateStopDateField);
            stopDateText.blur(validateStopDateField);
            // validate on-going before submit
            jQuery("#UpdateBtn").click(function (e) {
                var valid = validateStopDateField(e);
                return valid;
            });
        });

        function validateStopDate(stopDateText, toxOngoing) {
            var stopDateValue = stopDateText.val();
            var ongoingChecked = toxOngoing.is(":checked");
            return stopDateValue === "" || !ongoingChecked;
        }

        function isSAEChecked() {
            return jQuery("#ToxSAEField").is(":checked");
        };

        function showSAE(goToSection) {
            jQuery("#SAEDetailsBtn").show();
        }

        function hideSAE() {
            jQuery("#SAEDetailsBtn").hide();
        }

        // toggle related record tables
        function showHideAllRelatedRecords(doShow) {
            var tables = ['LabsTable', 'DiagnosticsTable', 'MedicationsTable', 'ComorbiditiesTable'];
            for (var index in tables) {
                var tableId = tables[index];
                showHideRelatedRecords(tableId, doShow);
            }
        }

        // for the related record table, show/hide rows which are linked-unlinked
        function showHideRelatedRecords(tableId, doShow) {
            var table = jQuery("#" + tableId);
            var showHideCheck = jQuery("#" + tableId + "_Check");
            if (doShow) {
                showHideCheck.attr("checked", "checked");
            }
            else {
                showHideCheck.removeAttr("checked");
            }
            var rows = table.find("tbody > tr");
            rows.each(function () {
                var row = jQuery(this);
                var cb = row.find(":checkbox");
                var checked = cb.is(":checked");
                if (doShow || checked) {
                    row.show();
                }
                else {
                    row.hide();
                }
            });
        }

        function updateSAECheck() {
            if (isSAEChecked()) {
                showSAE();
            }
            else {
                hideSAE();
            }
        }

        // notify parent page that record has been updated
        function notifyRecordUpdate(isDelete) {
            // get the loading window
            var visitWindow = top.getCallingWindow();
            // notify of updates
            if (visitWindow && visitWindow.notifyUnplannedEventUpdate) {
                visitWindow.notifyUnplannedEventUpdate(isDelete);
            }
        }

        function cancelEnterData() {
            if (top.hideModal) { top.hideModal(); }
            return false;
        }

        function showNextRow(btn, gridId) {
            var hideBtn = false;
            var rows = $(gridId).getElementsByTagName("TR");
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                if (row.className == "dataGridBlankRowHidden") {
                    row.className = "dataGridBlankRowVisible";
                    if (i == rows.length - 1)
                        hideBtn = true;
                    break;
                }
            }
            if (hideBtn)
                btn.style.display = 'none';

            return false;
        }

        function confirmRequiredFields() {
            var dateField = jQuery("#ToxDateText");
            var toxField = jQuery("#ToxNameField");
            if (dateField.val() == "") {
                alert("Please enter a valid Start Date.");
                return false;
            }
            else if (toxField.val() == "") {
                alert("Please enter a valid CTCAE Term.");
                return false;
            }
            return true;
        }

        function confirmSAE() {
            if (confirmRequiredFields())
                return true;
            else
                return false;
        }

        function setDeathCheckBox(focusOnDate) {
            var deathDateCheck = jQuery("#PtDeathDateTextCheck");
            var deathDate = jQuery("#PtDeathDateText");
            // focus on field
            if (focusOnDate) {
                if (deathDateCheck.is(":checked")) {
                    deathDate.focus();
                }
            }
                // check/uncheck box
            else {
                if (deathDate.val() != "") {
                    deathDateCheck.attr("checked", "checked");
                }
            }
        }

        /* ]]> */
    </script>
    <style type="text/css">
        #PageTitle {
            display: block;
            font-size: 16px;
            text-align: center;
        }

        fieldset {
            border: 1px solid #ddd;
            margin-bottom: 10px;
        }

        #UnplannedEventContainer > fieldset:last-child {
            margin-bottom: 100px;
        }

        fieldset legend {
            font-weight: bold;
            font-size: 13px;
            text-transform: uppercase;
        }

        fieldset table td > label {
            display: inline-block;
            min-width: 100px;
        }

        body {
            margin: 0px;
        }

        h3,
        h4 {
            margin: 5px auto;
        }

        .DateDisplay {
            display: inline;
            float: left;
            margin: 0px 0px 0px 0px;
            color: #999999;
        }

        table td {
            vertical-align: top;
        }

        table.SAEDataEntryTable {
            width: 100%;
        }
        table.SAEDataEntryTable input[type="text"],
        table.SAEDataEntryTable select,
        table.SAEDataEntryTable textarea {
            width: 165px;
        }

        #UnplannedEventContainer {
            position: absolute;
            height: auto;
            top: 10px;
            bottom: 75px;
            padding-bottom: 75px;
            overflow: auto;
        }

            #UnplannedEventContainer input[readonly] {
                background-color: #eeeeee;
                border: 1px solid #dddddd;
            }

        #UnplannedEventFooter {
            position: absolute;
            bottom: 25px;
            text-align: right;
        }

            #UnplannedEventFooter input {
                padding: 5px 10px 5px 10px;
                width: 100px;
                margin: auto 90px auto 90px;
            }

        .DataRecordOverflow {
            display: inline-block;
            overflow-x: hidden;
            max-height: 200px;
        }
        /* print styles */
        @media print {
            #UnplannedEventContainer {
                position: relative;
                border-style: none;
                overflow: hidden;
                height: auto;
            }

            input, textarea, select {
                border-style: none;
                background-color: transparent;
                color: #000000;
            }

            .DataRecordOverflow {
                overflow: hidden;
                height: auto;
                max-height: 100%;
            }

            #UnplannedEventFooter {
                display: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="PatientItemId" />
        <asp:HiddenField runat="server" ID="ToxicityIdField" />
        <asp:HiddenField runat="server" ID="RelatedRecordId" />
        <plugin:CTCAE runat="server" />
        <div id="UnplannedEventContainer" class="UnplannedEventContainer">
            <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>
            <h1 id="PageTitle">ADVERSE EVENT FORM</h1>
            <asp:Panel runat="server" ID="ToxicityFields">
                <fieldset>
                    <legend>Event</legend>
                    <table class="SAEDataEntryTable">
                        <tr>
                            <td>
                                <label for="ToxDateText">
                                    Start Date</label>
                            </td>
                            <td>
                                <cic:CaisisTextBox runat="server" ID="ToxDateText" Table="Toxicities" Field="ToxDateText"
                                    ShowLabel="false" ShowCalendar="true" CalcDate="true" Width="75px"></cic:CaisisTextBox>
                                <cic:CaisisHidden runat="server" ID="ToxDate" Table="Toxicities" Field="ToxDate"
                                    ShowLabel="false" DisplayCalculatedDate="false" />
                            </td>
                            <td>
                                <label for="ToxStopDateText">
                                    End Date</label>
                            </td>
                            <td>
                                <cic:CaisisTextBox runat="server" ID="ToxStopDateText" Table="Toxicities" Field="ToxStopDateText"
                                    ShowLabel="false" ShowCalendar="true" CalcDate="true" Width="75px"></cic:CaisisTextBox>
                                <cic:CaisisHidden runat="server" ID="ToxStopDate" Table="Toxicities" Field="ToxStopDate"
                                    ShowLabel="false" DisplayCalculatedDate="false" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="ToxScaleField">
                                    Scale</label>
                            </td>
                            <td>
                                <cic:CaisisSelect ID="ToxScaleField" runat="server" Table="Toxicities" Field="ToxScale"
                                    ShowLabel="false" LookupCode="ToxScale">
                                </cic:CaisisSelect>
                            </td>
                            <td>
                                <label for="ToxNameField" class="requiredField">
                                    CTCAE Term</label>
                            </td>
                            <td>
                                <cic:CaisisComboBox ID="ToxNameField" runat="server" Table="Toxicities" Field="ToxName"
                                    ShowLabel="false"></cic:CaisisComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="ToxClassField">
                                    Class</label>
                            </td>
                            <td>
                                <cic:CaisisComboBox runat="server" ID="ToxClassField" Table="Toxicities" Field="ToxClass"
                                    ShowLabel="false" LookupCode="ToxClass">
                                </cic:CaisisComboBox>
                            </td>
                            <td>
                                <label for="ToxCategoryField">
                                    Category</label>
                            </td>
                            <td>
                                <cic:CaisisSelect runat="server" ID="ToxCategoryField" Table="Toxicities" Field="ToxCategory"
                                    ShowLabel="false">
                                </cic:CaisisSelect>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="ToxOngoing">
                                    Ongoing</label>
                            </td>
                            <td>
                                <cic:CaisisCheckBox runat="server" ID="ToxOngoing" Table="Toxicities" Field="ToxOngoing"
                                    ShowLabel="false" />
                            </td>
                            <td>
                                <label for="ToxGradeField">
                                    Grade</label>
                            </td>
                            <td>
                                <cic:CaisisSelect runat="server" ID="ToxGradeField" Table="Toxicities" Field="ToxGrade"
                                    LookupCode="ToxGrade" ShowLabel="false">
                                </cic:CaisisSelect>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="RelatedToField">
                                    Related To</label>
                            </td>
                            <td>
                                <cic:CaisisSelect ID="RelatedToField" runat="server" Table="Toxicities" Field="ToxRelatedTo"
                                    ShowLabel="false" LookupCode="RelatedTo">
                                </cic:CaisisSelect>
                            </td>
                            <td>
                                <label for="SAE_AttributedOutcome">
                                    *Outcome</label>
                            </td>
                            <td>
                                <cic:CaisisSelect runat="server" ID="SAE_AttributedOutcome" ShowLabel="false" Table="SeriousAdverseEvents"
                                    Field="SAE_AttributedOutcome" LookupCode="ToxAttributedOutcome">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Recovered/Resolved</asp:ListItem>
                                    <asp:ListItem>Recovering/Resolving</asp:ListItem>
                                    <asp:ListItem>Not Recovered/Resolved</asp:ListItem>
                                    <asp:ListItem>Recovered/Resolved with Sequelae </asp:ListItem>
                                    <asp:ListItem>Fatal</asp:ListItem>
                                    <asp:ListItem>Unknown</asp:ListItem>
                                </cic:CaisisSelect>
                            </td>                          
                        </tr>
                        <tr>
                            <td>
                                <label for="ToxNotesField">
                                    Notes</label>
                            </td>
                            <td>
                                <cic:CaisisTextArea runat="server" ID="ToxNotesField" Table="Toxicities" Field="ToxNotes"
                                    ShowLabel="false"></cic:CaisisTextArea>
                            </td>
                            <td>
                                <label for="ToxSAEField">
                                    Serious Adverse Event?</label>
                            </td>
                            <td>
                                <!-- SAE Toggle -->
                                <cic:CaisisCheckBox runat="server" ID="ToxSAEField" Table="Toxicities" Field="ToxSAE"
                                    ShowLabel="false" />
                                <asp:Button runat="server" ID="SAEDetailsBtn" CssClass="dataEntryButtonRed" Text="Enter SAE Details" Style="display: none;" OnClientClick="return confirmSAE();" OnClick="EnterSAEDetails"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset>
                    <legend>Suspect Product(s)</legend>
                    <asp:Label runat="server" ID="AttributionsMessage" CssClass="errorText" Text="There are no therapies specified for this trial."></asp:Label>
                    <cic:ExtendedGridView runat="server" ID="ToxAttributionGrid" RenderFullTable="true" TableName="ToxAttribution"
                        DataKeyNames="ToxicityId,ToxAttributionId" AutoGenerateColumns="false" BlankRows="0"
                        CssClass="DataRecords" GridLines="None" VisibleBlankRows="0" OnRowDataBound="SetAttributionFields"
                        OnRowDeleted="DeleteToxAttribution" Style="margin-left: 0px;" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <cic:CaisisHidden runat="server" ID="ToxAttributionField" ShowLabel="false" Table="ToxAttribution"
                                        Field="ToxAttribution" Visible="false" Value='<%# Eval("ToxAttribution") %>'>
                                    </cic:CaisisHidden>
                                    <h3>
                                        <%# Eval("ToxAttribution") %></h3>
                                    <table>
                                        <tr>
                                            <td style="width: 175px;">Relationship to Study Treatment
                                            </td>
                                            <td>
                                                <cic:CaisisSelect runat="server" ID="ToxProbabilityField" ShowLabel="false" Table="ToxAttribution"
                                                    Field="ToxAttributionProbability" LookupCode="ToxProbability" Width="100px">
                                                </cic:CaisisSelect>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Event abated after use, stopped or dose reduced?
                                            </td>
                                            <td>
                                                <cic:CaisisSelect runat="server" ID="ToxEventAbated" ShowLabel="false" Table="ToxAttribution"
                                                    Field="ToxEventAbated" Width="100px" LookupCode="YesNoNA">
                                                </cic:CaisisSelect>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Event reappeared after reintroduction?
                                            </td>
                                            <td>
                                                <cic:CaisisSelect runat="server" ID="ToxEventReappeared" ShowLabel="false" Table="ToxAttribution"
                                                    Field="ToxEventReappeared" Width="100px" LookupCode="YesNoNA">
                                                </cic:CaisisSelect>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Action Taken
                                            </td>
                                            <td>
                                                <cic:CaisisSelect runat="server" ID="ToxActionField" ShowLabel="false" Table="ToxAttribution"
                                                    Field="ToxAttributionAction" Width="100px" LookupCode="ToxIntervention">
                                                </cic:CaisisSelect>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <cic:GridRowDeleteImage HeaderStyle-Width="5%">
                            </cic:GridRowDeleteImage>
                        </Columns>
                    </cic:ExtendedGridView>
                </fieldset>
            </asp:Panel>
        </div>
        <div id="UnplannedEventFooter">
            <asp:Button runat="server" ID="DeleteBtn" Text="Delete" ToolTip="Delete" OnClick="DeleteClick"
                OnClientClick="return confirmDelete();" CssClass="dataEntryButtonRed" />
            <asp:Button runat="server" ID="CancelBtn" Text="Cancel" ToolTip="Cancel" OnClientClick="return cancelEnterData();"
                CssClass="dataEntryButtonGray" />
            <asp:Button runat="server" ID="UpdateBtn" Text="Update" ToolTip="Save" OnClick="SaveClick"
                OnClientClick="return confirmRequiredFields();" CssClass="dataEntryButtonGray" />
        </div>
    </form>
</body>
</html>
