<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminImportExportProtocol.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminImportExportProtocol" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Import/Export Protocols</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">

        var disableValidation = false;
        var processing = false;

        jQuery.noConflict();

        jQuery(document).ready(function (e) {
            var exportPatientBtn = jQuery("#ExportProtocolPatientsBtn");
            var exportPatieneBtns = jQuery("#ExportProtocolPatientsBtns input[type='submit']");
            var exportPatientForm = jQuery("#form1");
            var checkBoxes = jQuery("#DataPreview td input[type='checkbox']").not(":disabled");

            var getExportCount = function () {
                return checkBoxes.filter(":checked").size();
            };
            // export patient: validation
            if (exportPatientBtn.size() > 0 && exportPatientBtn.is(":visible")) {
                // on submit, validate checkbox selection
                exportPatientForm.submit(function (e) {
                    if (getExportCount() == 0 && !disableValidation) {
                        alert("Please select at least 1 patient for export.");
                        return false;
                    }
                    // submit ok: prevent double submit
                    else {
                        if (disableValidation) {
                            return true;
                        }
                        else if (!processing) {
                            processing = true;
                            setTimeout(function () { processing = false; }, 5000);
                            return true;
                        }
                        else {
                            return confirm("The current request is being processed, would you like to re-submit?");
                        }
                    }
                });
            }
            // table filter: enable disable fields
            var filterTableCheckBoxes = jQuery("#ExportTableNames td input[type='checkbox'].filterable");
            filterTableCheckBoxes.each(function (index, tableCheckBox) {
                var tableCheck = jQuery(tableCheckBox);
                var table = tableCheck.val();
                var listId = table + "_Filter";
                var list = jQuery("#" + listId);
                var listInputs = list.find("input[type='checkbox']");
                var cbAll = jQuery("#" + table + "_CheckAll");
                var masterCheckBoxes = tableCheck.add(cbAll);
                var setCheckState = function (boxes, checked, updateList) {
                    // set check state
                    setCheckBoxes(boxes, checked);
                    // optionally adjust filter list
                    if (updateList)
                        checkAllFields(listId, checked);
                };
                // on table selection || check-all || uncheck-all sync values
                masterCheckBoxes.change(function (e) {
                    var checked = jQuery(this).is(":checked");
                    setCheckState(masterCheckBoxes, checked, true);
                });
                // when selecting individual filters, ensure table selected/unselected
                listInputs.change(function (e) {
                    var checked = listInputs.filter(":checked").size() > 0;
                    setCheckState(tableCheck, checked, false);
                });
            });
        });

        function refreshMainList(url, protocolTitle, protocolNum) {
            var message = 'Successfully added the Protocol.\n\nTITLE: ' + protocolTitle + '\nNUMBER: ' + protocolNum;
            message += '\n\nYou will now be redirected...';
            alert(message);
            var main = window.top.frames['ModuleWindow'];
            if (main && main.frames.length > 0) {
                main.frames[0].location = url;
                if (top.hideModal) {
                    top.hideModal();
                }
            }
        }

        function setExportDeceasedText(includeDeceased) {
            var text = includeDeceased ? "INCLUDES" : "EXCLUDES";
            document.getElementById("ExportDeceasedText").innerHTML = text;
        }

        function checkAllFields(id, checked, doOnChange) {
            var checkboxes = jQuery("#" + id).find("td input[type='checkbox']").not(":disabled");
            setCheckBoxes(checkboxes, checked);
            if (doOnChange)
                checkboxes.change();
        }

        function setCheckBoxes(boxes, checked) {
            if (checked)
                boxes.attr("checked", "checked");
            else
                boxes.removeAttr("checked");
        }

        function selectPatientPanel(panelId) {
            var allPanels = jQuery("#PatientPanels > div");
            var panel = jQuery("#PatientPanel_" + panelId);
            allPanels.hide();
            panel.show();
            return false;
        }

        function confirmUnmasked(checked) {
            if (!checked)
                return true;
            else
                return confirm("Are you sure you would like to include un-masked dates?");
        }

        function validateImportSelections() {
            var protocolId = jQuery("#ProtocolSelection option:selected").val();
            // validate using existing protocol
            if (protocolId != null && protocolId != "") {
                return confirm("You have selected to import this Protocol's mappings (versions, schemas,etc...) into an existing Protocol. Continue?");
            }
            return true;
        }
    
    </script>
    <style type="text/css">
        .Wrapper
        {
            display: block;
            width: 300px;
            margin: auto;
            text-align: center;
        }
        #PreviewListing ul
        {
            margin: 0;
            padding: 2;
            list-style-type: none;
            vertical-align: top;
        }
        .dataGridOverflowPanel
        {
            overflow: auto;
            max-height: 240px;
            margin: auto;
            border: 1px solid #bbbbbb;
        }
        .dataGrid
        {
            width: 100%;
            text-align: left;
            margin: 0;
        }
        .dataGrid tbody > td
        {
            padding: auto 2px;
            white-space: normal;
        }
        .dataGrid tbody > td:first-child
        {
            text-align: center;
        }
        .noteText
        {
            font-weight: bold;
        }
        ul
        {
            margin: 0;
            padding: 2px 15px;
        }
        #ExportProtocolPatientsBtns
        {
            margin: 5px auto;
        }
        #ExportProtocolPatientsBtns input[type='submit']
        {
            width: 150px;
            margin: auto 5px;
        }
        #ExportProtocolPatientsBtn
        {
            float: right;
        }
        tr.activeRow
        {
            font-weight: bold;
        }
        #PatientPanel_Filters
        {
            width: 100%;
            text-align: left;
            font-weight: bold;
        }
        #PatientPanel_Filters td, #Encounters_Filter td
        {
            vertical-align: top;
            text-align: left;
        }
        #PatientExportInfo
        {
            width: 100%;
            text-align: left;
        }
        #PatientExportInfo td
        {
            vertical-align: top;
        }
        table.DataRecords
        {
            min-width: 100%;
        }
    </style>
</head>
<body style="height: auto;">
    <form id="form1" runat="server">
    <asp:Label runat="server" ID="ErrorText" CssClass="redText"></asp:Label>
    <h3>
        <asp:Label runat="server" ID="ProtocolNum"></asp:Label>
        <asp:Label runat="server" ID="ProtocolTitle"></asp:Label>
    </h3>
    <!-- Export Protocol -->
    <asp:Panel runat="server" ID="ExportPreviewPanel" Visible="false">
        <asp:Panel runat="server" ID="ExportProtocolControls" Visible="false">
        </asp:Panel>
        <asp:Panel runat="server" ID="ExportProtocolPatientsControls" Visible="false">
            <span class="noteText">NOTES</span>
            <ul>
                <li>
                    <asp:Label runat="server" ID="ExportPatientCount"></asp:Label></li>
                <li>Only patients in your current dataset [<asp:Label runat="server" ID="CurrentDataset"
                    class="boldText"></asp:Label>] are exported.</li>
                <li>Only patients with a <b>"Passed Screening" </b>date will be exported.</li>
                <li>All <b>date text</b> fields (i.e., LabDateText) are removed.</li>
                <li><span id="ExportDeceasedText">
                    <%= ExportProtocolIncludeDeceased.Checked ? "INCLUDES" : "EXCLUDES" %></span> <b>deceased</b>
                    patients</li>
                <asp:PlaceHolder runat="server" ID="MaskedDatesPanel">
                    <li>All <b>dates</b> (i.e., LabDate) are masked; X days from <b>"Passed Screening"</b> date.
                        i.e., LabDate=105, 105 days from "Passed Screening" date.</li>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="UnmaskedDatesPanel">
                   <li>All <b>dates</b> will be exported in their raw universal time format. (i.e., <%= DateTime.Now.ToUniversalTime().ToString("yyyy-MM-dd") %>)</li>
                </asp:PlaceHolder>
            </ul>
            <div class="dataEntryNavToggleContainer">
                <div class="dataEntryNavToggle">
                    <a href="#" onclick="return selectPatientPanel('Patients');">Select Patients</a>
                    <a href="#" onclick="return selectPatientPanel('Tables');">Select Tables</a> <a href="#"
                        onclick="return selectPatientPanel('Filters');">Select Table Filters</a> <a href="#"
                            onclick="return selectPatientPanel('Encounters');">Select Encounter Fields</a>
                    <a href="#" onclick="return selectPatientPanel('Info');">Export Info</a>
                </div>
            </div>
        </asp:Panel>
        <div id="PatientPanels" class="dataGridOverflowPanel">
            <div id="PatientPanel_Patients">
                <asp:GridView runat="server" ID="DataPreview" AutoGenerateColumns="true" OnRowDataBound="SetExportRow"
                    CssClass="DataRecords EditableRecords" GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="80px">
                            <HeaderTemplate>
                                <label>
                                    Export?
                                    <input type="checkbox" onclick="checkAllFields('DataPreview', this.checked);" tooltip="Check/Uncheck All" />
                                </label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="ExportCheckBox" Checked="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div id="PatientPanel_Tables" style="display: none;">
                <asp:GridView runat="server" ID="ExportTableNames" DataKeyNames="TableName" AutoGenerateColumns="false"
                    CssClass="DataRecords EditableRecords" GridLines="None" OnRowDataBound="SetCheckboxValues">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="80px">
                            <HeaderTemplate>
                                <label>
                                    Export?
                                    <input type="checkbox" onclick="checkAllFields('ExportTableNames', this.checked, true);"
                                        title="Check/Uncheck All" checked="checked" />
                                </label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input type="checkbox" runat="server" id="TableCheckBox" checked="true" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Table">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="TableNameLabel" AssociatedControlID="TableCheckBox"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div runat="server" id="PatientPanel_Filters" style="display: none;">
                <table class="DataRecords EditableRecords" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th>
                                <label>
                                    Lab Test
                                    <input id="LabTests_CheckAll" type="checkbox" title="Check/Uncheck All" checked="checked" />
                                </label>
                            </th>
                            <th>
                                <label>
                                    Procedure
                                    <input id="Procedures_CheckAll" type="checkbox" title="Check/Uncheck All" checked="checked" />
                                </label>
                            </th>
                            <th>
                                <label>
                                    Diagnostic
                                    <input id="Diagnostics_CheckAll" type="checkbox" title="Check/Uncheck All" checked="checked" />
                                </label>
                            </th>
                            <th>
                                <label>
                                    Pathology
                                    <input id="Pathology_CheckAll" type="checkbox" title="Check/Uncheck All" checked="checked" />
                                </label>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div id="LabTests_FilterPanel">
                                    <cic:CaisisCheckBoxList runat="server" ID="LabTests_Filter" Table="LabTests" Field="LabTest"
                                        ShowLabel="false" CssClass="DataRecords" OnDataBound="SetCheckAll">
                                    </cic:CaisisCheckBoxList>
                                </div>
                            </td>
                            <td>
                                <div id="Procedures_FilterPanel">
                                    <cic:CaisisCheckBoxList runat="server" ID="Procedures_Filter" Table="Procedures"
                                        Field="ProcName" ShowLabel="false" CssClass="DataRecords" OnDataBound="SetCheckAll">
                                    </cic:CaisisCheckBoxList>
                                </div>
                            </td>
                            <td>
                                <div id="Diagnostics_FilterPanel">
                                    <cic:CaisisCheckBoxList runat="server" ID="Diagnostics_Filter" Table="Diagnostics"
                                        Field="DxType" ShowLabel="false" CssClass="DataRecords" OnDataBound="SetCheckAll">
                                    </cic:CaisisCheckBoxList>
                                </div>
                            </td>
                            <td>
                                <div id="Pathology_FilterPanel">
                                    <cic:CaisisCheckBoxList runat="server" ID="Pathology_Filter" Table="Pathology" Field="PathSpecimenType"
                                        ShowLabel="false" CssClass="DataRecords" OnDataBound="SetCheckAll">
                                    </cic:CaisisCheckBoxList>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div runat="server" id="PatientPanel_Encounters" style="display: none;">
                <table class="DataRecords EditableRecords" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th>
                                <label>
                                    Check/Uncheck All
                                    <input id="Encounters_CheckAll" type="checkbox" title="Check/Uncheck All" checked="checked" />
                                </label>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div id="Encounters_FilterPanel">
                                    <cic:CaisisCheckBoxList runat="server" ID="Encounters_Filter" Table="Encounters"
                                        ShowLabel="false" DataTextField="FieldLabel" DataValueField="FieldName" RepeatLayout="Table"
                                        RepeatColumns="5" RepeatDirection="Horizontal" OnDataBound="SetCheckAll" CssClass="DataRecords">
                                    </cic:CaisisCheckBoxList>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="PatientPanel_Info" style="display: none;">
                <table id="PatientExportInfo"  class="DataRecords EditableRecords" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th style="width: 25%;">Setting</th>
                            <th>Values</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="PatientExportInfoRptr">
                            <ItemTemplate>
                                <tr class="<%#Container.ItemIndex%2==0?"ItemRow_A":"ItemRow_B" %>">
                                    <td class="boldText" style="width: 200px;">
                                        <%# Eval("Key") %>
                                    </td>
                                    <td>
                                        <asp:CheckBoxList runat="server" ID="ExportValues" RepeatLayout="Table" RepeatColumns="3"
                                            Enabled="false" DataSource='<%# Eval("Value") %>' CssClass="DataRecords">
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Export Protocol Preview -->
        <asp:Panel runat="server" id="ExportProtocolPreviewPanel" Visible="false">
            <asp:GridView runat="server" ID="ExportProtocolGrid" AutoGenerateColumns="false"
                 CssClass="DataRecords EditableRecords" GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="Export Version?" HeaderStyle-Width="75px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="ProtocolVersionId_Field" Value='<%# Eval("ProtocolVersionId") %>' />
                            <asp:CheckBox runat="server" ID="Exportable" Checked='<%# (bool)Eval("IsFirst") %>' Visible='<%# (bool)Eval("IsFirst") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Version #" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("VersionNum") %>' Visible='<%# (bool)Eval("IsFirst") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ArmNumber" HeaderText="Arm #" />
                    <asp:BoundField DataField="ArmDescription" HeaderText="Arm Description" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <asp:Button runat="server" ID="ExportProtocolBtn" Text="Export Protocol" CssClass="dataEntryButtonRed"
            OnClick="ExportProtocolClick" Visible="false" />
        <asp:Panel runat="server" ID="ExportProtocolPatientsBtns" Visible="false">

            <%--            <asp:Button runat="server" ID="ExportProtocolPreviewBtn" Text="Preview Export Patients"
                CssClass="dataEntryButtonGray" ToolTip="Export Protocol Patients" Enabled="true"
                OnClientClick="disableValidation=true;" OnClick="PreviewProtocolPatientsClick" />--%>
            <asp:CheckBox runat="server" ID="ExportProtocolPatientsValidate" Checked="false"
                Text="Validate Schema" Visible="false" />
            <asp:CheckBox runat="server" ID="ExportProtocolIncludeDeceased" Checked="false" Text="Deceased Patients" ToolTip="Include Deceased Patients"
                onclick="setExportDeceasedText(this.checked);" />
            <asp:CheckBox runat="server" ID="UnmaskedCheck" Checked="false" Text="Unmasked Dates" ToolTip="Include Unmasked Dates in Export" />
            <asp:Button runat="server" ID="ExportProtocolPreviewBtn" Text="Update Preview"
                OnClientClick="disableValidation=true;" OnClick="PreviewProtocolPatientsClick" CssClass="dataEntryButtonGray" />
            <asp:Button runat="server" ID="ExportPatientXSDBtn" Text="Get Patient XSD" CssClass="dataEntryButtonGray"
                OnClick="ExportProtocolPatientsXSDClick" ToolTip="Get the Patient XSD" OnClientClick="disableValidation=true;" />
            <asp:Button runat="server" ID="ExportProtocolPatientsBtn" Text="Export Patients"
                CssClass="dataEntryButtonRed" OnClick="ExportProtocolPatientsClick" ToolTip="Export Protocol Patients"
                Enabled="false" /> 
        </asp:Panel>
    </asp:Panel>
    <div runat="server" id="ExportPanel" class="Wrapper" visible="false">
        <h2>
            Export a Protocol</h2>
        <label for="ProtocolList">
            Select a Protocol:</label>
        <cic:CaisisSelect runat="server" ID="ProtocolList" ShowLabel="false" DataTextField="ProtocolNum"
            DataValueField="ProtocolId">
        </cic:CaisisSelect>
        <div>
            <asp:Button runat="server" ID="PreviewBtn" CssClass="dataEntryButtonGray" OnClick="PreviewClick"
                Text="Preview" />
            <asp:Button runat="server" ID="ExportBtn" CssClass="dataEntryButtonGray" Text="Export"
                OnClick="ExportProtocolClick" />
        </div>
    </div>
    <div runat="server" id="ImportPanel" class="Wrapper" visible="false">
        <h2>
            Import a Protocol (XML File)</h2>
        <div>
            <label for="ProtocolSelection" class="boldText">Existing Protocol: </label>
                <cic:CaisisSelect runat="server" ID="ProtocolSelection" ShowLabel="false" ShowEmptyListItem="false"
                    DataTextField="Title" DataValueField="Value">
                </cic:CaisisSelect>            
        </div>
        <br />
        <span class="boldText">Validate Fields</span>
        <asp:CheckBoxList runat="server" ID="ValidationFields" RepeatLayout="Flow" RepeatDirection="Horizontal">
            <asp:ListItem Text="ProtocolNum" Value="ProtocolNum" Selected="True"></asp:ListItem>
            <asp:ListItem Text="ProtocolTitle" Value="ProtocolTitle" Selected="True"></asp:ListItem>
        </asp:CheckBoxList>
        <asp:FileUpload runat="server" ID="FileUploadBtn" />
        <asp:Button runat="server" ID="ImportBtn" CssClass="dataEntryButtonGray" Text="Import"
            OnClick="ImportClick" OnClientClick="return validateImportSelections();" />
    </div>
    <div runat="server" id="PreviewListing" visible="false">
        <h3>
            Preview Import</h3>
        <span class="boldText">Protocol:</span>
        <asp:Repeater runat="server" ID="VersionsRptr" OnItemDataBound="BuildSchemas">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li><span class="boldText">Version: </span>
                    <%# Eval("VersionNumber")%>
                    <asp:Repeater runat="server" ID="SchemasRptr" OnItemDataBound="BuildSchemasItems">
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><span class="boldText">Arm: </span>
                                <%# Eval("ProtocolArmDescription")%>
                                <asp:Repeater runat="server" ID="SchemaItemsRptr">
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li><span class="boldText">Item: </span>
                                            <%# Eval("ItemDescription") %></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>
