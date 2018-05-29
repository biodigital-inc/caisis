<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientToxicitiesSAE.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientToxicitiesSAE" %>

<%@ Register TagPrefix="plugin" TagName="CTCAE" Src="~/Plugins/CTCAEWizard/CTCAEWizardControl.ascx" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ToxicitiesSAE</title>
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
            var showSAE = showSAEFields();
            // if not showing the SAE form, allow toggle functionality
            if(!showSAE) {
                // add change handler
                var saeCheckBox = jQuery("#ToxSAEField");
                saeCheckBox.change(function(e){
                    updateSAECheck(true);
                });
                // inital
                updateSAECheck();
            }
        });

        function showSAEFields() {
            return jQuery("#ShowSAEField").val() == "true";
        }

        function isSAEChecked() {
            return jQuery("#ToxSAEField").is(":checked");
        };

        function showSAE(goToSection) {
            var panelId = "SAEFields";
            jQuery("#" + panelId).show();
            if(goToSection) {
                //window.location.hash = panelId;
            }
        }

        function hideSAE() {
            jQuery("#SAEFields").hide();
        }

        function updateSAECheck(goToSection) {
            if (isSAEChecked()) {
                showSAE(goToSection);
            }
            else {
                hideSAE();
            }
        }

        // notify parnet page that record has been updated
        function notifyRecordUpdate(isDelete) {
            if (parent.notifyUnplannedEventUpdate) parent.notifyUnplannedEventUpdate(isDelete);
        }

        function cancelEnterData() {
            if (parent.hideDeviation) { parent.hideDeviation(); }
            return false;
        }

         function toggleSAE() {
            var isSAEShowing = jQuery("#SAEFields").is(":visible");
            var btn = jQuery("#SAEToggleButton");
            if (isSAEShowing) {
                btn.attr("src", "Images/Button_ShowSAEDetails.png");
            }
            else {
                btn.attr("src", "Images/Button_HideSAEDetails.png");
            }
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
            if(dateField.val()=="") {
                alert("Please enter a valid Start Date.");
                return false;
            }
            return true;
        }

        /* ]]> */
    </script>
    <style type="text/css">
        body
        {
            margin: 0px;
        }
        .DateDisplay
        {
            display: inline;
            float: left;
            margin: 0px 0px 0px 0px;
            color: #999999;
        }
        table td
        {
            vertical-align: top;
        }
        #ToxAttributionGrid tr
        {
            height: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="PatientItemId" />
    <asp:HiddenField runat="server" ID="ToxicityIdField" />
    <asp:HiddenField runat="server" ID="RelatedRecordId" />
    <asp:HiddenField runat="server" ID="ShowSAEField" />
    <plugin:CTCAE runat="server" />
    <div class="UnplannedEventContainer" style="position: relative;">
        <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>
        <asp:Panel runat="server" ID="ToxicityFields">
            <table style="table-layout: fixed;">
                <tr>
                    <td style="width: 20%;">
                        Start Date
                    </td>
                    <td style="width: 30%;">
                        <cic:CaisisTextBox runat="server" ID="ToxDateText" Table="Toxicities" Field="ToxDateText"
                            ShowLabel="false" ShowCalendar="true" CalcDate="true"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="ToxDate" Table="Toxicities" Field="ToxDate"
                            ShowLabel="false" DisplayCalculatedDate="true" />
                    </td>
                    <td style="width: 20%;">
                        Class
                    </td>
                    <td style="width: 30%;">
                        <cic:CaisisComboBox ID="ToxClassField" runat="server" Table="Toxicities" Field="ToxClass"
                            ShowLabel="false" LookupCode="ToxClass"></cic:CaisisComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Stop Date
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" ID="ToxStopDateText" Table="Toxicities" Field="ToxStopDateText"
                            ShowLabel="false" ShowCalendar="true" CalcDate="true"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="ToxStopDate" Table="Toxicities" Field="ToxStopDate"
                            ShowLabel="false" DisplayCalculatedDate="true" />
                    </td>
                    <td>
                        Category
                    </td>
                    <td>
                        <cic:CaisisComboBox runat="server" ID="ToxCategoryField" Table="Toxicities" Field="ToxCategory"
                            ShowLabel="false" LookupCode="ToxCategory"></cic:CaisisComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Scale
                    </td>
                    <td>
                        <cic:CaisisComboBox runat="server" ID="ToxScaleField" Table="Toxicities" Field="ToxScale"
                            ShowLabel="false" LookupCode="ToxScale"></cic:CaisisComboBox>
                    </td>
                    <td>
                        Grade
                    </td>
                    <td>
                        <cic:CaisisComboBox runat="server" ID="ToxGradeField" Table="Toxicities" Field="ToxGrade"
                            ShowLabel="false" LookupCode="ToxGrade"></cic:CaisisComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>Adverse Event/Toxicity</strong>
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="ToxNameField" runat="server" Table="Toxicities" Field="ToxName"
                            ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        Intervention
                    </td>
                    <td>
                        <cic:CaisisComboBox ID="ToxInterventionField" runat="server" Table="Toxicities" Field="ToxIntervention"
                            ShowLabel="false" LookupCode="ToxIntervention"></cic:CaisisComboBox>
                    </td>
                </tr>
                <%--<tr>
                     <td>
                        Related to
                    </td>
                    <td>
                        <cic:CaisisComboBox ID="RelatedToField" runat="server" Table="Toxicities" Field="ToxRelatedTo"
                            ShowLabel="false" LookupCode="RelatedTo"></cic:CaisisComboBox>
                    </td> 
                 <td>
                        Relationship to Study Treatment
                    </td>
                    <td>
                        <cic:CaisisComboBox ID="ToxProbabilityField" runat="server" Table="Toxicities" Field="ToxProbability"
                            ShowLabel="false" LookupCode="ToxProbability"></cic:CaisisComboBox>
                    </td>
                </tr>--%>
                <tr>
                    <td>
                        <h4>
                            Related To</h4>
                    </td>
                    <td colspan="3">
                        <cic:ExtendedGridView runat="server" ID="ToxAttributionGrid" TableName="ToxAttribution"
                            DataKeyNames="ToxicityId,ToxAttributionId" AutoGenerateColumns="false" CssClass="dataGrid"
                            HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="ItemRow_A" AlternatingRowStyle-CssClass="ItemRow_B"
                            BlankRows="5" GridLines="None" VisibleBlankRows="1" BlankRowCssClass="dataGridBlankRowHidden"
                            VisibleBlankRowCssClass="dataGridBlankRowVisible" OnRowDataBound="SetAttributionFields"
                            OnRowDeleted="DeleteToxAttribution" Style="margin-left: 0px;">
                            <Columns>
                                <asp:TemplateField HeaderText="Therapy">
                                    <ItemTemplate>
                                        <cic:CaisisSelect runat="server" ID="ToxAttributionField" ShowLabel="false" Table="ToxAttribution"
                                            Field="ToxAttribution">
                                        </cic:CaisisSelect>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Probability">
                                    <ItemTemplate>
                                        <cic:CaisisSelect runat="server" ID="ToxProbabilityField" ShowLabel="false" Table="ToxAttribution"
                                            Field="ToxAttributionProbability" LookupCode="ToxProbability">
                                        </cic:CaisisSelect>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <cic:GridRowDeleteImage>
                                </cic:GridRowDeleteImage>
                            </Columns>
                        </cic:ExtendedGridView>
<%--                        <asp:ImageButton runat="server" ID="AddRowBtn" ImageUrl="~/Images/DataGridAddNewRow.gif"
                            OnClientClick="return showNextRow(this, 'ToxAttributionGrid');" Style="margin-top: 5px;" />
--%>                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="ToxSAEField">
                            Serious Adverse Event?</label>
                    </td>
                    <td>
                        <!-- SAE Toggle -->
                        <cic:CaisisCheckBox runat="server" ID="ToxSAEField" Table="Toxicities" Field="ToxSAE"
                            ShowLabel="false" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <!--		<img id="SAEToggleButton" runat="server" src="Images/Button_HideSAEDetails.png" style="cursor: pointer; margin: 0px 0px 0px 0px;" runat="server" onclick="toggleSAE();" />
-->
        <asp:Panel runat="server" ID="SAEFields" OnPreRender="DetermineSAEVisibility">
            <br />
            <span class="SectionTitle">SAE Details</span>
            <table style="table-layout: fixed; border-top: solid 1px #8d2a2c;">
                <tr>
                    <td style="width: 20%;">
                        Age at Time of Event
                    </td>
                    <td style="width: 30%;">
                        <cic:CaisisTextBox runat="server" Table="SeriousAdverseEvents" Field="SAE_Age" ShowLabel="false"
                            ShowNumberPad="true" Width="50px"></cic:CaisisTextBox>
                    </td>
                    <td style="width: 20%;">
                        Outcome
                    </td>
                    <td style="width: 30%;">
                        <cic:CaisisSelect ID="CaisisSelect1" runat="server" Table="SeriousAdverseEvents"
                            Field="SAE_AttributedOutcome" ShowLabel="false">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Recovered/Resolved</asp:ListItem>
                            <asp:ListItem>Recovering/Resolving</asp:ListItem>
                            <asp:ListItem>Not recovered/Not Resolved</asp:ListItem>
                            <asp:ListItem>Recovered/Resolved with Sequelae</asp:ListItem>
                            <asp:ListItem>Fatal</asp:ListItem>
                            <asp:ListItem>Unknown</asp:ListItem>
                        </cic:CaisisSelect>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date Reported
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" ID="SAE_ReportDateText" Table="SeriousAdverseEvents"
                            Field="SAE_ReportDateText" ShowLabel="false" ShowCalendar="true" CalcDate="true"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="SAE_ReportDate" Table="SeriousAdverseEvents"
                            Field="SAE_ReportDate" ShowLabel="false" DisplayCalculatedDate="true" />
                    </td>
                    <td>
                        Description
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="CaisisTextBox1" runat="server" Table="SeriousAdverseEvents"
                            Field="SAE_EventDescription" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relevant Tests/Laboratory Data, Including Dates
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" Table="SeriousAdverseEvents" Field="SAE_RelevantTestData"
                            ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        Other Relevant History, Including Preexisting Medical Conditions
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="CaisisTextBox2" runat="server" Table="SeriousAdverseEvents"
                            Field="SAE_OtherRelevantHistory" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Concomitant Medical Products and Therapy Dates
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" Table="SeriousAdverseEvents" Field="SAE_ConcommitantMeds"
                            ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        NDC Number
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="CaisisTextBox3" runat="server" Table="SeriousAdverseEvents"
                            Field="SAE_NDC_Number" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        #1 Event Abated After Use Stopped or Dose Reduced?
                    </td>
                    <td>
                        <cic:CaisisRadioButtonList runat="server" Table="SeriousAdverseEvents" Field="SAE_EventAbated1"
                            ShowLabel="false" Uncheckable="true">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                            <asp:ListItem>Doesn't Apply</asp:ListItem>
                        </cic:CaisisRadioButtonList>
                    </td>
                    <td>
                        #2 Event Abated After Use Stopped or Dose Reduced?
                    </td>
                    <td>
                        <cic:CaisisRadioButtonList runat="server" Table="SeriousAdverseEvents" Field="SAE_EventAbated2"
                            ShowLabel="false" Uncheckable="true">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                            <asp:ListItem>Doesn't Apply</asp:ListItem>
                        </cic:CaisisRadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        #1 Event Reappeared After Reintroduction?
                    </td>
                    <td>
                        <cic:CaisisRadioButtonList runat="server" Table="SeriousAdverseEvents" Field="SAE_EventReappeared1"
                            ShowLabel="false" Uncheckable="true">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                            <asp:ListItem>Doesn't Apply</asp:ListItem>
                        </cic:CaisisRadioButtonList>
                    </td>
                    <td>
                        #2 Event Reappeared After Reintroduction?
                    </td>
                    <td>
                        <cic:CaisisRadioButtonList runat="server" Table="SeriousAdverseEvents" Field="SAE_EventReappeared2"
                            ShowLabel="false" Uncheckable="true">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                            <asp:ListItem>Doesn't Apply</asp:ListItem>
                        </cic:CaisisRadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Reporting Individual
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" Table="SeriousAdverseEvents" Field="SAE_ReportingIndividual"
                            ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        Date Reported to FDA
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" ID="SAE_ReportFDA_DateText" Table="SeriousAdverseEvents"
                            Field="SAE_ReportFDA_DateText" ShowLabel="false" ShowCalendar="true" CalcDate="true"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="SAE_ReportFDA_Date" Table="SeriousAdverseEvents"
                            Field="SAE_ReportFDA_Date" ShowLabel="false" DisplayCalculatedDate="true" />
                    </td>
                </tr>
                <tr>
                    <td>
                        FDA Report Status
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" Table="SeriousAdverseEvents" Field="SAE_ReportFDA_Status"
                            ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        Sequelae
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="CaisisTextBox4" runat="server" Table="SeriousAdverseEvents"
                            Field="SAE_Sequelae" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Reported To IRB
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" Table="SeriousAdverseEvents" Field="SAE_ReportedToIRB"
                            ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td style="vertical-align: top;">
                        SAE Notes
                    </td>
                    <td>
                        <cic:CaisisTextArea ID="CaisisTextArea1" runat="server" Table="SeriousAdverseEvents"
                            Field="SAE_Notes" ShowLabel="false" Style="width: 80%; height: 45px;"></cic:CaisisTextArea>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div style="width: 86%; margin: 0px auto 0px auto; text-align: right;">
        <asp:ImageButton runat="server" ID="DeleteBtn" ImageUrl="Images/Button_Delete.png"
            ToolTip="Delete" OnClick="DeleteClick" OnClientClick="return confirmDelete();"
            Style="float: left;" />
        <asp:ImageButton runat="server" ID="CancelBtn" ImageUrl="Images/Button_Cancel.png"
            ToolTip="Cancel" OnClientClick="return cancelEnterData();" Style="margin-right: 20px;" />
        <asp:ImageButton runat="server" ID="UpdateBtn" ImageUrl="Images/Button_Save.png"
            ToolTip="Save" OnClick="SaveClick" OnClientClick="return confirmRequiredFields();" />
    </div>
    </form>
</body>
</html>
