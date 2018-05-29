<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientRandomization.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientRandomization" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Protocol Randomization</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript" src="../../ClientScripts/jQuery.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        jQuery.noConflict();

        var mouseFocus = false;

        jQuery(document).ready(function(e) {
            jQuery(window).resize(resizeMainWrapper);
            var doc = jQuery(document);
            var doUnbind = function() { doc.unbind('mousemove', setOnInit); }
            var setOnInit = function() {
                if (!mouseFocus) {
                    mouseFocus = true;
                    resizeMainWrapper();
                    doUnbind();
                }
            };
            doc.bind('mousemove', setOnInit);
            // run default gleason scoring
            calculateGleasonScore('GleasonField1', 'GleasonField2', 'GleasonFieldSum');
        });

        function resizeMainWrapper() {
            var main = jQuery("#MainWrapper");
            main.css("height", jQuery(window).height() - 40 + "px");
        }

        function getPSADoublingTime() {
            var btn = jQuery("#CalcPSABtn");
            btn.attr("disabled", "disabled");
            // make ajax request to calcualte score
            jQuery.post("PatientRandomization.aspx", { ajax: true, psaData: _getPSAData() },
                        function(data) {
                            var output = data != "" ? data + " Months" : "N/A";
                            jQuery("#PSADoublingTime").text(output);
                            // enable button
                            btn.removeAttr("disabled");
                        }
            );
            return false;
        }

        // return client entered date and lab results as a query string
        // i.e., 1/12/2005=3.4&5/13/2005=4.6
        function _getPSAData() {
            var data = new Array();
            var labDates = jQuery("input.LabDateField");
            var labResults = jQuery("input.LabResultField");
            labDates.each(function(index, field) {
                var labDate = jQuery(field).val();
                var labResult = labResults.eq(index).val();
                if (labDate != "" && labResult != "") {
                    data.push(labDate + "=" + labResult);
                }
            });
            return data.join("&");
        }

        function showNextGridRow() {
            var btn = jQuery("#AddLabBtn");
            var grid = jQuery("#LabTestsGrid");
            var rows = grid.find("tr");
            var hiddenRows = rows.filter(".dataGridBlankRowHidden");
            var hiddenRowCount = hiddenRows.size();
            if (hiddenRowCount > 0) {
                hiddenRows.first().removeClass("dataGridBlankRowHidden");
            }
            if (hiddenRowCount <= 1) {
                btn.hide();
            }
            return false;
        }

        function calculateGleasonScore(g1, g2, gSum) {
            var g1Field = $(g1);
            var g2Field = $(g2);
            var gSumField = $(gSum);
            validateGleason(g1Field, g2Field, gSumField, true);
            var g1Value = g1Field.value;
            var g2Value = g2Field.value;
            setGleasonScore(g1Value, g2Value);
        }

        // set gleason score fields
        function setGleasonScore(g1, g2) {
            var fieldsValid = validateGleason(g1, g2);
            var sum = "";
            if (fieldsValid) {
                g1 = parseInt(g1);
                g2 = parseInt(g2);
                sum = g1 + g2 + "";
            }
            var gleasonFields = jQuery("input.gleasonScoreSum");
            gleasonFields.val(sum);
            var isLow = fieldsValid && isLowGleason(g1, g2);
            var isHigh = fieldsValid && isHighGleason(g1, g2);
            var naField = jQuery(".gleasonScoreNA");
            var lowField = jQuery(".gleasonScoreLow");
            var highField = jQuery(".gleasonScoreHigh");
            setGleanScoreField(naField, !isLow && !isHigh);
            setGleanScoreField(lowField, isLow);
            setGleanScoreField(highField, isHigh);
        }

        function setGleanScoreField(field, active) {
            if (active) {
                if (!field.hasClass("active"))
                    field.addClass("active");
            }
            else {
                field.removeClass("active");
            }
        }

        function isLowGleason(g1, g2) {
            return g1 + g2 <= 6 || g1 == 3 && g2 == 4;
        }

        function isHighGleason(g1, g2) {
            return g1 + g2 >= 8 || g1 == 4 && g2 == 3;
        }

        function validateGleason(g1, g2) {
            return g1 != null && g1 != "" && g2 != null && g2 != "";
        }

        // load registered tab, then go to next step
        function goToNextRegistrationStep() {
            if(parent.initActivePanel) {
                var panelName = "Registered";
                var nextIndex = 1;
                parent.initActivePanel(panelName, nextIndex);
            }
        }

        /* ]]> */
    </script>

    <style type="text/css">
        .dataGrid
        {
            width: 350px;
            margin: 2px auto;
        }
        .dataGrid td
        {
            vertical-align: top;
        }
        .dataEntryButtonGray
        {
            margin: 10px auto;
        }
        /*
        #gleasonScoreColumn div.gleasonScore
        {
            display: none;
        }
        #gleasonScoreColumn div.gleasonScore.active
        {
            display: block;
        }
        */.gleasonScore
        {
            width: 50%;
            display: inline-block;
        }
        .gleasonScore img
        {
            width: 15px;
            height: 15px;
            background-image: url(Images/Icon_Refused.png);
            background-position: center center;
            background-repeat: no-repeat;
        }
        .gleasonScore.active img
        {
            background-image: url(Images/icon_check.png);
        }
        label
        {
            font-weight: bold;
        }
        /*#RandomizeBtn
        {
            display: none;
        }
        */
    </style>
</head>
<body style="background-color: transparent;">
    <form id="form1" runat="server">

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <div id="MainWrapper" style="overflow: auto; height: 135px;">
        <span class="boldText">Labs</span>
        <cic:ExtendedGridView runat="server" ID="LabTestsGrid" BlankRows="4" VisibleBlankRows="4"
            TableName="LabTests" AutoGenerateColumns="false" GridLines="None" CellPadding="2"
            Width="100%" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA"
            AlternatingRowStyle-CssClass="dataGridItemRowB" BlankRowCssClass="dataGridBlankRowHidden"
            OnRowDeleted="RebindOnDelete">
            <Columns>
                <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="75px">
                    <ItemTemplate>
                        <cic:CaisisTextBox runat="server" ID="LabDateText" ShowLabel="false" Table="LabTests"
                            Field="LabDateText" Width="75px" ShowCalendar="true" CalcDate="true" CssClass="LabDateField" OnValueChanged="MarkFormDirty"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="LabDate" ShowLabel="false" Table="LabTests"
                            Field="LabDate" Width="50px" ShowCalendar="true" DisplayHiddenValue="false" OnValueChanged="MarkFormDirty">
                        </cic:CaisisHidden>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Lab Test" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="75px">
                    <ItemTemplate>
                        <input type="text" value="PSA" disabled="disabled" style="width: 75px;" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Result">
                    <ItemTemplate>
                        <cic:CaisisTextBox runat="server" ID="LabResult" ShowLabel="false" Table="LabTests"
                            Field="LabResult" ShowNumberPad="true" Width="50px" CssClass="LabResultField" OnValueChanged="MarkFormDirty"></cic:CaisisTextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Units" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="75px">
                    <ItemTemplate>
                        <cic:CaisisSelect runat="server" ID="LabUnits" ShowLabel="false" Table="LabTests"
                            Field="LabUnits" Width="50px" LookupCode="LabUnits" OnValueChanged="MarkFormDirty">
                        </cic:CaisisSelect>
                    </ItemTemplate>
                </asp:TemplateField>
                <cic:GridRowDeleteImage ItemStyle-HorizontalAlign="Center">
                </cic:GridRowDeleteImage>
            </Columns>
        </cic:ExtendedGridView>
        <table style="width: 100%;">
            <tr>
                <td style="width: 25%;">
                    <asp:Button runat="server" ID="CalcPSABtn" CssClass="dataEntryButtonGray" Text="Calculate PSADT"
                        OnClick="CalculatePSADoublingTime" Style="float: right;" OnClientClick="return getPSADoublingTime();" />
                </td>
                <td style="width: 25%;">
                    <asp:Label runat="server" ID="PSADoublingTime"></asp:Label>
                </td>
                <td colspan="2">
                    <button id="AddLabBtn" class="dataEntryButtonGray" onclick="return showNextGridRow();"
                        style="float: right;">
                        Add Row</button>
                </td>
            </tr>
        </table>
        <span class="boldText">Gleason Score</span>
        <asp:Panel runat="server" ID="GleasonFields">
            <table class="dataGrid" style="width: 100%;">
                <tbody>
                    <tr>
                        <td>
                            <label for="PathSpecimenType">
                                Procedure</label>
                        </td>
                        <td>
                            <cic:CaisisSelect runat="server" ID="PathSpecimenType" ShowLabel="false" Table="Pathology"
                                Field="PathSpecimenType" TabIndex="100" OnValueChanged="MarkFormDirty">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="Prostatectomy" Value="Prostatectomy"></asp:ListItem>
                                <asp:ListItem Text="Biopsy" Value="Biopsy"></asp:ListItem>
                            </cic:CaisisSelect>
                        </td>
                        <td>
                            <label for="GleasonField1">
                                Primary Gleason</label>
                        </td>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="GleasonField1" ShowLabel="false" Width="50px"
                                onblur="calculateGleasonScore('GleasonField1','GleasonField2','GleasonFieldSum');"
                                TabIndex="102" OnValueChanged="MarkFormDirty"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="PathDateText">
                                Date</label>
                        </td>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="PathDateText" ShowLabel="false" Table="Pathology"
                                Field="PathDateText" Width="75px" ShowCalendar="true" CalcDate="true" TabIndex="101" OnValueChanged="MarkFormDirty"></cic:CaisisTextBox>
                            <cic:CaisisHidden runat="server" ID="PathDate" ShowLabel="false" Table="Pathology"
                                Field="PathDate" DisplayHiddenValue="false" OnValueChanged="MarkFormDirty">
                            </cic:CaisisHidden>
                        </td>
                        <td>
                            <label for="GleasonField2">
                                Secondary Gleason</label>
                        </td>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="GleasonField2" ShowLabel="false" Width="50px"
                                onblur="calculateGleasonScore('GleasonField1','GleasonField2','GleasonFieldSum');"
                                TabIndex="103" OnValueChanged="MarkFormDirty"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                        <td>
                            <label for="GleasonFieldSum">
                                Gleason Sum</label>
                        </td>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="GleasonFieldSum" ShowLabel="false" CssClass="gleasonScoreSum"
                                Width="50px" TabIndex="104" OnValueChanged="MarkFormDirty"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="boldText">
                            Scoring Criteria
                        </td>
                        <td colspan="2" id="gleasonScoreColumn">
                            <div class="boldText gleasonScore gleasonScoreLow">
                                &lt;= 6,3+4
                                <img alt="Gleason" title="Gleason" src="../../Images/shim.gif" /></div>
                            <div class="boldText gleasonScore gleasonScoreHigh">
                                4+3,&gt;=8
                                <img alt="Gleason" title="Gleason" src="../../Images/shim.gif" /></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel>
    </div>
    <asp:Button runat="server" ID="RandomizeBtn" Text="Next Step" CssClass="dataEntryButtonGray"
        OnClick="SaveDetails" />
    </form>
</body>
</html>
