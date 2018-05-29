<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CTCAEWizardPage.aspx.cs"
    Inherits="Caisis.UI.Plugins.CTCAEWizard.CTCAEWizardPage" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>CTC Wizard</title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>

    <script src="../../ClientScripts/UVACC_JScriptFunctions.js" type="text/javascript"></script>

    <script src="../../ClientScripts/UVACC_AE.js" type="text/javascript"></script>

    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>

    <script src="../../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        // supress conflict with caisis specific $ object
        jQuery.noConflict();

        jQuery(document).ready(function() {
            var dataSource = window.SAE_DATA ? window.SAE_DATA : [];
            var category = jQuery('#Categories');
            category.change(function(e) {
                var selectedCatId = jQuery(this).find(':selected').val();
                var selectedCat = jQuery(this).find(':selected').text();
                filterSEADataSource(selectedCatId);
                // set category
                jQuery('#ToxCategoryValue').val(selectedCat);
            });
            jQuery("#SAESearch").autocomplete({
                source: dataSource,
                // allow dropdown
                minLength: 0,
                // on selection of serious adverse event
                select: function(event, ui) {
                    jQuery("#SAESearch").val(ui.item.value);
                    //$("#project").val(ui.item.label);
                    // set category id by selected event
                    doGradeSearch(ui.item.saeId);
                    var selectedSAE = ui.item.label;
                    jQuery('#ToxNameValue').val(selectedSAE);

                    var selectedCategoryId = ui.item.catId;
                    // set selected category value
                    category.val(selectedCategoryId);
                    // set selected category text
                    var selectedCat = category.find(':selected').text();
                    jQuery('#ToxCategoryValue').val(selectedCat);
                    // filter
                    filterSEADataSource(selectedCategoryId);
                    return false;
                }
            });
            jQuery("#SAESearch").click(function(e) {
                if (jQuery(this).val() == '') {
                    jQuery('#SAESearch').autocomplete('search', '');
                    e.stopImmediatePropagation();
                }
            });

        });

        var lock = null;

        function doGradeSearch(saeId) {
            if (!lock) {
                lock = true;
                // do POST
                jQuery.post('CTCAEWizardPage.aspx', { method: 'grades', saeId: saeId },
             function(data) {
                 // locate generated grid
                 var grid = jQuery(data).find('#GradeTable');
                 var gridLabel = jQuery('#GradeLabel');
                 gridLabel.show();
                 // add populated grid
                 jQuery('#GradePlaceholder').empty().append(grid).css('visibility', 'visible');
                 // unlock
                 lock = null;
             });
            }
        }

        function filterSEADataSource(categoryId) {
            var dataSource = window.SAE_DATA ? window.SAE_DATA : [];
            var filteredDataSource = new Array();
            if (categoryId && categoryId != '') {
                for (var i = 0; i < dataSource.length; i++) {
                    var item = dataSource[i];
                    if (item.catId == categoryId) {
                        filteredDataSource.push(item);
                    }
                }
            }
            else {
                filteredDataSource = dataSource;
            }
            // udpdate events data source
            jQuery("#SAESearch").autocomplete("option", "source", filteredDataSource);
        }


        // client id of parent page field which loaded form
        var ClientToxNameKey = '<%= ClientToxNameKey %>';

        function setGradeAndLoad(grade) {
            $('ToxGradeValue').value = grade;
            setMainFormFields();
        }

        // calls parent page with values
        function setMainFormFields() {
            if (parent.setCTCFields) {
                var _scale = jQuery('#ToxScaleValue').val();
                var _category = jQuery('#ToxCategoryValue').val();
                var _name = jQuery('#ToxNameValue').val();
                var _grade = jQuery('#ToxGradeValue').val();
                // notify parent page with hidden values used to track user selected values
                parent.setCTCFields(_scale, _category, _name, _grade, ClientToxNameKey);
                window.location = window.location;
            }
            return false;
        }

        function hideWizard() {
            if (parent.hideCTCWizard) {
                parent.hideCTCWizard();
            }
            window.location = window.location;
            return false;
        }

        function addClickEvents() {
            $('InsertBtn').addEvent('click', setMainFormFields);
            $('CancelBtn').addEvent('click', hideWizard);
        }
        /* ]]> */
    </script>

    <style type="text/css">
        body
        {
            background-color: #ffffff;
            height: auto;
        }
        .CTCTable
        {
            width: 100%;
            table-layout: fixed;
        }
        .stepTitle
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: bold;
            color: #111111;
        }
        a.ClickableRow, a.ClickableRow:visited, a.ClickableRow:active
        {
            display: block;
            vertical-align: middle;
            margin: 0px;
            padding-left: 3px;
            text-decoration: none;
            cursor: pointer;
            color: #000000;
        }
        .toxDataEntryField
        {
            width: 99%;
            margin: auto 0px;
        }
        #GradePlaceholder
        {
            overflow: auto;
            oveflow-x: hidden;
            height: 125px;
            overflow-x: hidden;
            border: 1px solid #cccccc;
            visibility: hidden;
        }
        .ui-autocomplete
        {
            width: 250px;
        }
        .ui-autocomplete a
        {
            border-style: none;
        }
        #DataEntryButtons
        {
            text-align: center;
            margin: 5px auto auto auto;
        }
        #DataEntryButtons span
        {
            min-width: 65px;
            margin: auto 5px;
        }
    </style>
</head>
<body id="body" runat="server">
    <form id="form1" method="post" runat="server">
    <%-- Currently Selected Values --%>
    <asp:HiddenField runat="server" ID="ToxScaleValue" />
    <asp:HiddenField runat="server" ID="ToxCategoryValue" />
    <asp:HiddenField runat="server" ID="ToxNameValue" />
    <asp:HiddenField runat="server" ID="ToxGradeValue" />
    <table style="width: 100%; table-layout: fixed;">
        <tr>
            <td style="width: 100px;">
                <label for="Versions" class="boldText">
                    <%= GetToxFieldLabel("ToxScale", "CTC AE Version") %></label>
            </td>
            <td>
                <cic:CaisisRadioButtonList ID="Versions" runat="server" DataTextField="AE_Terminology_ShortDesc"
                    DataValueField="AE_TerminologyID" OnSelectedIndexChanged="SelectedScaleChange"
                    AutoPostBack="true" ShowLabel="false" RepeatDirection="Horizontal" CssClass="toxDataEntryField" />
            </td>
        </tr>
        <tr>
            <td>
                <label for="SAESelect" class="boldText">
                   <%= GetToxFieldLabel("ToxName", "Adverse Event") %></label>
            </td>
            <td>
                <cic:CaisisTextBox runat="server" ID="SAESearch" ShowLabel="false" DataTextField="ToxDesc"
                    CssClass="toxDataEntryField">
                </cic:CaisisTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <label for="Categories" class="boldText">
                    <%= GetToxFieldLabel("ToxCategory", "Category") %></label>
            </td>
            <td>
                <cic:CaisisSelect ID="Categories" runat="server" DataTextField="AE_Category_Description"
                    DataValueField="AE_CategoryID" OnSelectedIndexChanged="SelectedCategoryChange"
                    AutoPostBack="true" ShowLabel="false" CssClass="toxDataEntryField">
                </cic:CaisisSelect>
            </td>
        </tr>
        <tr id="GradeLabel" style="display: none;">
            <td colspan="2">
                <span class="boldText">
                    <%= GetToxFieldLabel("ToxGrade", "Grade") %></span>
            </td>
        </tr>
    </table>
    <div id="GradePlaceholder" class="toxDataEntryField">
        <table id="GradeTable" style="table-layout: fixed; width: 100%;">
            <tbody>
                <asp:Repeater runat="server" ID="GradeRptr">
                    <ItemTemplate>
                        <tr title="Click to insert selected values" class="<%# Container.ItemIndex%2==0? "dataGridItemRowA" : "dataGridItemRowB" %>">
                            <td style="width: 50px;">
                                <a href="#" class="ClickableRow" onclick="return setGradeAndLoad('<%# PageUtil.EscapeSingleQuotes(Eval("AE_Grade").ToString()) %>');">
                                    <%# Eval("AE_Grade")%></a>
                            </td>
                            <td>
                                <a href="#" class="ClickableRow" onclick="return setGradeAndLoad('<%# PageUtil.EscapeSingleQuotes(Eval("AE_Grade").ToString()) %>');">
                                    <%# Eval("AE_Grade_Description")%></a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <div id="DataEntryButtons">
        <span id="CancelBtn" title="Cancel" class="dataEntryButtonGray largeButton">Cancel</span>
        <span id="InsertBtn" title="Insert" class="dataEntryButtonRed largeButton">Insert</span>
    </div>

    <script type="text/javascript">
        /* <![CDATA[ */
        addClickEvents();
        /* ]]> */
    </script>

    </form>
</body>
</html>
