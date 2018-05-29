<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolSpecimensSequencing.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolSpecimensSequencing" %>


<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocol Specimens</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>
    <script type="text/javascript">

        jQuery.noConflict();

        jQuery(document).ready(function (e) {
            var rows = jQuery("#BulkEditGrid > tbody > tr:not(.dataGridHeader)");
            var firstRow = rows.first();
            // jQuery selector for getting inputs for current row
            var rowInputSelector = ["input[type='radio']", "select[id*='Failed_Reason']", "input[id*='StatusDate']"].join(",");
            rows.each(function (rowIndex, row) {
                var _row = jQuery(row);
                var cells = _row.find("> td");
                var failedReason = _row.find(".Failed_Row select");
                // button to copy values from first row
                var copyBtn = _row.find("span[id^='Copy_Status']");
                // copy values events
                copyBtn.click(function () {
                    // copy values from first row to current
                    var firstRowInputs = firstRow.find(rowInputSelector);
                    var currentRowInputs = _row.find(rowInputSelector);
                    // validate before copying
                    if (firstRowInputs.length == currentRowInputs.length) {
                        firstRowInputs.each(function (index, radio) {
                            var firstInput = firstRowInputs.eq(index);
                            var currentInput = currentRowInputs.eq(index);
                            // for radio, click to process events
                            if (firstInput.is(":radio")) {
                                if (firstInput.is(":checked")) {
                                    currentInput.click();
                                }
                            }
                            // otherwise, copy raw value
                            else {
                                currentInput.val(firstInput.val());
                            }
                        });
                    }
                });
                // hide first row
                if (rowIndex == 0) {
                    copyBtn.hide();
                }
                // radio button events
                cells.each(function (cellIndex, cell) {
                    var _cell = jQuery(cell);
                    var check = _cell.find("input[type='radio']");
                    if (check.length == 0)
                        return;
                    var yes = check.eq(0);
                    var no = check.eq(1);
                    // next x columns
                    var allNextCells = cells.filter(":gt(" + cellIndex + ")");
                    var allNextCellInputs = allNextCells.find("input[type='radio']");
                    // next 1 column
                    var nextCell = allNextCells.first();
                    var nextCellInputs = nextCell.find("input[type='radio']");
                    // YES: enable next column
                    yes.click(function (e) {
                        // allow next column of fields
                        nextCellInputs.removeAttr("disabled");
                        // hide and clear failed
                        failedReason.hide().val("");
                    });
                    // NO: disable next column
                    no.click(function (e) {
                        allNextCellInputs.attr("disabled", "disabled").removeAttr("checked");
                        // make failed reason available
                        failedReason.show();
                    });
                    // set default state
                    if (!(yes.is(":checked") || no.is(":checked")))
                        allNextCellInputs.attr("disabled", "disabled");
                    if (no.is(":checked"))
                        no.click();
                });
            });
            // init date field validation
            var dateFields = jQuery("input[name*='StatusDate']");
            dateFields.blur(function (e) {
                var input = jQuery(this)[0];
                validateDateField(input);
            });


        });
    </script>
    <style type="text/css">
        #MainOverflow
        {
            height: 275px;
            overflow: auto;
        }
        #Layout
        {
            margin: auto;
        }
        #StatusTable > tbody > tr td:first-child
        {
            font-weight: bold;
            width: 50%;
        }
        span.readonly-field
        {
            display: inline-block;
            font-weight: bold;
        }
    </style>
</head>
<body class="PatientPortalBody_miniTabs">
    <div id="PatientPortalHeaderBar" class="PatientTitleBar" style="height: 55px;">
        <div id="CustomProtocolText" style="padding-top: 5px;">
            <asp:Label runat="server" ID="HeadingTitle"></asp:Label>
        </div>
    </div>
    <form id="form1" runat="server">
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <div id="Layout">
        <%--<table id="StatusTable">
            <tbody>
                <tr>
                    <td>
                        <label for="SpecimenId">
                            Specimen ID
                        </label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="SpecimenNumField" ReadOnly="true" Enabled="false"
                            Width="125px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="SpecimenSubType">
                            Specimen Type
                        </label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="SpecimenSubTypeField" ReadOnly="true" Enabled="false"
                            Width="125px"></asp:TextBox>
                    </td>
                </tr>
                <!-- Sequencing Status Fields -->
                <asp:PlaceHolder runat="server" ID="Sequncing_Fields" Visible="false">
                    <tr class="radioSelectionRow">
                        <td>
                            Tissue Extraction Successful
                        </td>
                        <td>
                            <cic:CaisisRadioButtonList runat="server" ID="Extraction_Radio" RepeatLayout="Table"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </cic:CaisisRadioButtonList>
                        </td>
                    </tr>
                    <tr class="radioSelectionRow">
                        <td>
                            Library Constructed
                        </td>
                        <td>
                            <cic:CaisisRadioButtonList runat="server" ID="Library_Radio" RepeatLayout="Table"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </cic:CaisisRadioButtonList>
                        </td>
                    </tr>
                    <tr class="radioSelectionRow">
                        <td>
                            Sequenced
                        </td>
                        <td>
                            <cic:CaisisRadioButtonList runat="server" ID="Sequenced_Radio" RepeatLayout="Table"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </cic:CaisisRadioButtonList>
                        </td>
                    </tr>
                    <tr id="Sequenced_Failed_Row" style="display: none;" class="Failed_Row">
                        <td>
                            Reason
                        </td>
                        <td>
                            <cic:CaisisSelect runat="server" ID="Sequencing_Failed_Reason" ShowLabel="false">
                                <asp:ListItem Text=""></asp:ListItem>
                                <asp:ListItem Text="Sample Quality Related Failure"></asp:ListItem>
                                <asp:ListItem Text="Stochastic or Process Failure"></asp:ListItem>
                                <asp:ListItem Text="Unknown"></asp:ListItem>
                            </cic:CaisisSelect>
                        </td>
                    </tr>
                </asp:PlaceHolder>
                <!-- Analysis Status Fields -->
                <asp:PlaceHolder runat="server" ID="Analysis_Fields" Visible="false">
                    <tr class="radioSelectionRow">
                        <td>
                            Picard Analysis and Variant Call Format Successfull
                        </td>
                        <td>
                            <cic:CaisisRadioButtonList runat="server" ID="Analysis_Radio" RepeatLayout="Table"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </cic:CaisisRadioButtonList>
                        </td>
                    </tr>
                    <tr id="Analysis_Failed_Row" style="display: none;" class="Failed_Row">
                        <td>
                            Reason
                        </td>
                        <td>
                            <cic:CaisisSelect runat="server" ID="Analysis_Failed_Reason" ShowLabel="false">
                                <asp:ListItem Text=""></asp:ListItem>
                                <asp:ListItem Text="Insufficient Tumor Purity" Value="Insufficient Tumor Purity"></asp:ListItem>
                                <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
                            </cic:CaisisSelect>
                        </td>
                    </tr>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="Pathology_Fields" Visible="false">
                    <tr class="radioSelectionRow">
                        <td>
                            Pathology Review Completed
                        </td>
                        <td>
                            <cic:CaisisRadioButtonList runat="server" ID="Pathology_Radio" RepeatLayout="Table"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </cic:CaisisRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="SpecimenConditionNotes">
                                Condition</label>
                        </td>
                        <td>
                            <cic:CaisisComboBox runat="server" ID="SpecimenConditionNotes" ShowLabel="false"></cic:CaisisComboBox>
                        </td>
                    </tr>
                </asp:PlaceHolder>
                <tr runat="server" id="StatusDate_Fields">
                    <td>
                        <label for="StatusDate">
                            Date Completed</label>
                    </td>
                    <td>
                        <cic:CaisisTextBox runat="server" ID="StatusDate" ShowLabel="false" ShowCalendar="true"
                            Width="75px"></cic:CaisisTextBox>
                    </td>
                </tr>
            </tbody>
        </table>--%>
        <!-- bulk edit -->
        <div id="MainOverflow">
            <asp:GridView runat="server" ID="BulkEditGrid" AutoGenerateColumns="false" Width="100%"
                CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" CellPadding="2" OnRowDataBound="PopulateSpecimenDetailsRow">
                <Columns>
                    <%--Core--%>
                    <asp:TemplateField HeaderText="Copy">
                        <ItemTemplate>
                            <span id="Copy_Status_<%# Container.DataItemIndex %>" class="dataEntryButtonRed">copy values</span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Specimen ID">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="SpecimenId" Value='<%# Eval("SpecimenId") %>' />
                            <asp:HiddenField runat="server" ID="SpecimenNumField"></asp:HiddenField>
                            <span class="readonly-field">
                                <%# Eval("SpecimenReferenceNumber")%></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="SpecimenSubTypeField"></asp:HiddenField>
                            <span class="readonly-field">
                                <%# Eval("SpecimenSubType")%></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- Sequencing --%>
                    <asp:TemplateField HeaderText="Tissue Extraction Successful">
                        <ItemTemplate>
                            <cic:CaisisRadioButtonList runat="server" ID="Extraction_Radio" RepeatLayout="Table"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </cic:CaisisRadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Library Constructed">
                        <ItemTemplate>
                            <cic:CaisisRadioButtonList runat="server" ID="Library_Radio" RepeatLayout="Table"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </cic:CaisisRadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sequenced">
                        <ItemTemplate>
                            <cic:CaisisRadioButtonList runat="server" ID="Sequenced_Radio" RepeatLayout="Table"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </cic:CaisisRadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reason" HeaderStyle-CssClass="Failed_Row" ItemStyle-CssClass="Failed_Row">
                        <ItemTemplate>
                            <cic:CaisisSelect runat="server" ID="Sequencing_Failed_Reason" ShowLabel="false">
                                <asp:ListItem Text=""></asp:ListItem>
                                <asp:ListItem Text="Sample Quality Related Failure"></asp:ListItem>
                                <asp:ListItem Text="Stochastic or Process Failure"></asp:ListItem>
                                <asp:ListItem Text="Unknown"></asp:ListItem>
                            </cic:CaisisSelect>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- Analysis --%>
                    <asp:TemplateField HeaderText="Picard Analysis and Variant Call Format Successfull">
                        <ItemTemplate>
                            <cic:CaisisRadioButtonList runat="server" ID="Analysis_Radio" RepeatLayout="Table"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </cic:CaisisRadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reason">
                        <ItemTemplate>
                            <cic:CaisisSelect runat="server" ID="Analysis_Failed_Reason" ShowLabel="false">
                                <asp:ListItem Text=""></asp:ListItem>
                                <asp:ListItem Text="Insufficient Tumor Purity" Value="Insufficient Tumor Purity"></asp:ListItem>
                                <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
                            </cic:CaisisSelect>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- Pathology --%>
                    <asp:TemplateField HeaderText="Pathology Review Completed">
                        <ItemTemplate>
                            <cic:CaisisRadioButtonList runat="server" ID="Pathology_Radio" RepeatLayout="Table"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </cic:CaisisRadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Condition">
                        <ItemTemplate>
                            <cic:CaisisComboBox runat="server" ID="SpecimenConditionNotes" ShowLabel="false"></cic:CaisisComboBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Completed">
                        <ItemTemplate>
                            <cic:CaisisTextBox runat="server" ID="StatusDate" ShowLabel="false" ShowCalendar="true"
                                Width="75px"></cic:CaisisTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <!-- update buttons -->
        <asp:Button runat="server" ID="UpdateBtn" CssClass="dataEntryButtonRed" OnClick="UpdateClick"
            Text="Update" Style="margin: 15px auto; display: block; width: 100px;" />
    </div>
    </form>
</body>
</html>
