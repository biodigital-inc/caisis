<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientImagingLesions.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientImagingLesions" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lesions</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <%--    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery-ui.js"></script>
--%>

    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        var MAIN_DATA_ENTRY_FIELD_CSS = 'MainDataEntryField';
        var activeLayer;
        var activeDiagnostic;

        function onWindowResize() {
            // size main div
            //$('LesionTableLayer').style.height = getHeight(window) - 200 + 'px';
            // size left columns
            var adjustedHeight = getHeight(window) - 165;
            $('LesionDiv').style.height = adjustedHeight + 'px';
            // size main matrix
            $('VisitColumnsShell').style.height = adjustedHeight + 'px';
            $('LesionMainDiv').style.height = (adjustedHeight) + 'px';

            var adjustedWidth = getWidth(window) - 296;
            $('LesionMainDiv').style.width = (adjustedWidth) + 'px';
            $('TimelineTabDiv_Imaging').style.width = (adjustedWidth - 58) + 'px';


        }

        // moves a DOM node into the main container, for easier positioning on page
        function moveNodeToMainContainer(node) {
            // prevent moving if already placed
            if (node && node.movedIntoMainContainer == null) {
                var mainContainer = $('LesionTableLayer');
                mainContainer.appendChild(node.parentNode.removeChild(node));
                node.movedIntoMainContainer == true;
            }
        }

        // Reset all the main data entry fields 
        function resetLesionFields() {
            document.forms[0].reset();
            return false;
        }

        // EDIT DIAGNOSTIC

        function editDiagnostic(index) {
            if (activeDiagnostic != null) { closeDiagnostic(activeDiagnostic); }
            var layer = $('EditDiagnostic_' + index);
            moveNodeToMainContainer(layer);
            layer.show('');
            layer.center();
            layer.style.top = '25px';
            activeDiagnostic = index;

            // handle baseline checkbox
            var baselineCheckBox = getBaselineCheckBox(layer);
            var isBaseline = baselineCheckBox && baselineCheckBox.checked;
            toggleBaselineFields('EditDiagnostic_' + index + '_Baseline', isBaseline);

            return false;
        }

        function closeDiagnostic(index) {
            var layer = $('EditDiagnostic_' + index);
            layer.hide('none');
            activeDiagnostic = null;
            return false;
        }

        // EDIT DXIMAGEFINDING

        function editLesion(layer, colIndex, rowIndex) {
            // if a layer is open, close
            cloesAllLesions();
            // show current layer
            layer.show();
            setActiveRow(colIndex, rowIndex, true);
            return false;
        }

        function cloesAllLesions() {
            jQuery(".EditLesionLayer").hide();
            setActiveRow(null, null, false);
        }

        // hilights the left column row and main matrix
        function setActiveRow(colIndex, rowIndex, isActive) {
            var tables = ['LesionRows', 'LesionCells'];
            for (var i = 0; i < tables.length; i++) {
                var table = jQuery("#" + tables[i]);
                var rows = table.find("> tbody > tr");
                // clear active row
                rows.removeClass("TimelineActiveRow");
                // set active row
                if(isActive) {
                    rows.eq(rowIndex).addClass("TimelineActiveRow");
                }
            }
        }

        function showAddNewLesion() {
            var layer = $('AddLesionLayer');
            layer.show('block');
            return false;
        }

        // Hide popup and clear fields for adding new lesion
        function hideAddNewLesion() {
            var layer = $('AddLesionLayer');
            layer.hide('');
            clearInputFields(layer);
            return false;
        }

        function showAddDiagnostic() {
            var diagLayer = $('AddDiagnosticLayer');
            diagLayer.show('block');
            diagLayer.center();
            diagLayer.style.top = '25px';
            cloesAllLesions();

            // handle baseline checkbox
            var baselineCheckBox = getBaselineCheckBox(diagLayer);
            var isBaseline = baselineCheckBox && baselineCheckBox.checked;
            toggleBaselineFields('EditDiagnostic_New_Baseline', isBaseline);

            // hide new and hottest lesions
            var mainLayer = $('EditDiagnostic_New_Main');
            var hottestLayer = $('EditDiagnostic_New_HottestLesions');
            var newLayer = $('EditDiagnostic_New_NewLesions');
            if(mainLayer)
                mainLayer.style.display = '';
            if(hottestLayer)
                hottestLayer.style.display = 'none';
            if(newLayer)
                newLayer.style.display = 'none';

            return false;
        }

        function toggleBaselineFields(layerId, isBaseline) {
            var baselineLayer = $(layerId);
            if (baselineLayer) {
                if (!isBaseline) {
                    baselineLayer.style.visibility = 'visible';
                }
                else {
                    baselineLayer.style.visibility = 'hidden';
                }
            }
        }

        function toggleEnterLesionsButtons(index, type) {
            var hottestButton = $('EnterLesions_' + index + '_Hottest');
            var newButton = $('EnterLesions_' + index + '_New');
            var newTotal = $('EnterLesions_' + index + '_NewTotal');
            if (type == 'New') {
                hottestButton.style.display = 'none';
                newButton.style.display = '';
                newTotal.style.display = '';
            }
            else if (type == 'Hottest') {
                hottestButton.style.display = '';
                newButton.style.display = 'none';
                newTotal.style.display = 'none';
            }

            $('NewLesionsGroup_Type').value = type;
        }

        function toggleEnterLesions(index, type) {
            var mainLayer = $('EditDiagnostic_' + index + '_Main');
            var hottestLayer = $('EditDiagnostic_' + index + '_HottestLesions');
            var newLayer = $('EditDiagnostic_' + index + '_NewLesions');
            // hide main data entry, show data grid based on type
            mainLayer.style.display = 'none';
            if (type == 'New') {
                hottestLayer.style.display = 'none';
                newLayer.style.display = 'block';
            }
            else if (type == 'Hottest') {
                hottestLayer.style.display = 'block';
                newLayer.style.display = 'none';
            }
        }

        function hideAddDiagnostic() {
            $('AddDiagnosticLayer').hide('none');
            return false;
        }

        function getBaselineCheckBox(container) {
            var baselineCheckBox = null;
            var inputs = container.getElementsByTagName('input');
            for (var i = 0; i < inputs.length; i++) {
                var cb = inputs[i];
                if (cb.type == 'checkbox' && cb.id.indexOf('Baseline') > -1) {
                    baselineCheckBox = cb;
                    break;
                }
            }
            return baselineCheckBox;
        }

        // returns all the input fields which represent the main data entry field
        function getMainDataEntryFields() {
            var searchFields = 'INPUT.' + MAIN_DATA_ENTRY_FIELD_CSS;
            return $('LesionTableLayer').tag(searchFields);
        }

        /* Initialization Events */

        // locate all main data entry fields and update their associated label when field's value changes
        function initTrackDataEntryLabels(e) {
            var lesionTableLayer = jQuery("#LesionTableLayer");
            var lesionTable = jQuery("#LesionCells");
            lesionTable.find("> tbody > tr").each(function(rowIndex) {
                var row = jQuery(this);
                row.find("> td").each(function(colIndex) {
                    var cell = jQuery(this);
                    // primary field and label
                    var dataEntryLayer = cell.find(".EditLesionLayer");
                    var primaryField = dataEntryLayer.find("input.MainDataEntryField");
                    var primaryLabel = cell.find("input.TimelinePrimaryValue");
                    // secondary field and label
                    var secondaryField = dataEntryLayer.find("input.SecondaryDataEntryField");
                    var secondaryLabel = cell.find("input.TimelineSecondaryValue");                   
                    var closeBtn = cell.find(".CloseLesionBtn");
                    var editBtn = cell.find(".LesionEditBtn");
                    if(dataEntryLayer.length==1)
                    {
                        // add handlers
                        editBtn.click(curry(editLesion, dataEntryLayer, colIndex, rowIndex));
                        closeBtn.click(cloesAllLesions);

                        // sync values of input fields to labels
                        attachSyncInputFields(primaryField, primaryLabel);
                        attachSyncInputFields(secondaryField, secondaryLabel);
                        // sync values of labels to inputs
                        attachSyncInputFields(primaryLabel, primaryField);
                        attachSyncInputFields(secondaryLabel, secondaryField);

                        // adjust DOM: move layer to main container
                        lesionTableLayer.append(dataEntryLayer);
                    }
                });
            });
        }

        // adds event handlers to update field2's value whenever field1's value has changed
        function attachSyncInputFields(field1, field2) {
            var eventHandler = curry(syncInputFields, field1, field2);
            var eventNames = ['change', 'keyup', 'click', 'focus', 'blur'].join(' ');
            field1.bind(eventNames, eventHandler);
        }

        // copies field2.value to field1.value
        function syncInputFields(field1, field2) {
            field2.val(field1.val());
        }

        // When window loads, initialize frozen pane and other data entry helpers
        window.addEvent('load', curry(initFrozenPane, 'LesionMainDiv', 'TimelineTabDiv_Imaging', 'LesionDiv'));
        window.addEvent('load', initTrackDataEntryLabels);

        /* ]]> */
    </script>

    <style type="text/css">
        html
        {
            height: 100%;
        }
        body
        {
            min-height: 100%;
            padding: 0px;
            margin: 0px;
            background-color: #ffffff;
        }         
        .TimelineImagingTopLeftBG
        {
            background-image: url(images/Timeline_Imaging_TopLeftBG.gif);
            background-repeat: no-repeat;
            width: 282px;
            height: 27px;
            text-align: center;
            vertical-align: bottom;
        }
        .TimelineTopRightBG
        {
            background-image: url(images/Timeline_TopRightBG.gif);
            background-position: right top;
            background-repeat: no-repeat;
            vertical-align: top;
            padding-top: 5px;
            padding-right: 12px;
        }
        .TimelineImagingMidLeftBG
        {
            background-color: #efefef;
            vertical-align: top;
            padding-top: 5px;
        }
        .TimelineBottomLeftBG
        {
            background-image: url(images/Timeline_BottomLeftBG.gif);
            background-position: bottom left;
            background-repeat: no-repeat;
            height: 13px;
        }
        .TimelineBottomRightBG
        {
            background-image: url(images/Timeline_BottomRightBG.gif);
            background-position: bottom right;
            background-repeat: no-repeat;
            height: 13px;
        }
        #LesionShell
        {
            border-top: solid 2px #dddddd;
            border-bottom: solid 2px #dddddd;
            background-color: #ffffff;
            margin-left: 12px;
        }
        #LesionDiv
        {
            border-left: solid 2px #dddddd;
            height: 400px;
            width: 268px;
            overflow: hidden;
            margin-right: 0px;
            background-color: #ffffff;
        }
        .schemaItemsTable
        {
            width: 100%;
        }
        #VisitColumnsShell
        {
            height: 400px;
            border: solid 2px #dddddd;
            border-left: none;
            background-color: #ffffff;
        }
        #TimelineTabDiv_Imaging
        {
            height: 22px;
            width: 500px;
            overflow: hidden;
            white-space: nowrap;
            float: left;
            z-index: 19000;
        }
        .TimelineTabTD_Imaging
        {
            background-image: url(images/TimelineTab_Imaging.png);
            background-position: 10px 0px;
            background-repeat: no-repeat;
            width: 98px;
            height: 22px;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
            color: #000000;
        }
        .TimelineTabTD_Imaging:hover
        {
            background-image: url(images/TimelineTab_Imaging_hover.png);
            color: #8d2a2c;
        }
        .TimelineTabTD_ImagingBaseline
        {
            background-image: url(images/TimelineTab_ImagingBaseline.png);
            background-position: 10px 0px;
            background-repeat: no-repeat;
            width: 98px;
            height: 22px;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
            color: #000000;
        }
        .TimelineTabTD_ImagingBaseline:hover
        {
            background-image: url(images/TimelineTab_ImagingBaseline_hover.png);
            color: #8d2a2c;
        }
        .TimelineTabTD_Imaging a.TimelineTab_ImagingDateLink
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            font-weight: bold;
            cursor: pointer;
            display: block;
            text-decoration: underline;
        }
        .TimelineTabTD_ImagingBaseline a.TimelineTab_ImagingDateLink
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            font-weight: bold;
            cursor: pointer;
            display: block;
            text-decoration: underline;
        }
        .TimelineTabTD_AddNew
        {
            display: none;
            background-image: url(images/TimelineTab_Imaging_AddTab.png);
            background-position: 10px 0px;
            background-repeat: no-repeat;
            width: 39px;
            min-width: 39px;
            max-width: 39px;
            cursor: pointer;
        }
        .TimelineTabTD_AddNew:hover
        {
            background-image: url(images/TimelineTab_Imaging_AddTab_hover.png);
        }
        .TimelineTab_AddNew_Docked
        {
            /*		position: absolute;  */
            width: 70px;
            background-color: #ffffff;
            z-index: 19000;
            float: right;
            text-align: center;
            float: right;
            display: none;
        }
        .TimelineTab_AddNew_Docked img
        {
            background-image: url(images/TimelineTab_Imaging_AddTab.png);
            background-repeat: no-repeat;
            width: 29px;
            height: 22px;
            cursor: pointer;
        }
        .TimelineTab_AddNew_Docked:hover img
        {
            background-image: url(images/TimelineTab_Imaging_AddTab_hover.png);
        }
        .TimelineImaging_A
        {
            width: 98px;
            height: 50px;
            background-color: #E0EBF1;
            text-align: center;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1C3B68;
        }
        .TimelineImaging_B
        {
            width: 98px;
            height: 50px;
            background-color: #F8FAFC;
            text-align: center;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1C3B68;
        }
        .TimelineColSizer_Imaging
        {
            width: 98px;
            height: 1px;
        }
        .TimelineEditTable
        {
            width: auto;
            margin: auto;
        }
        .TimelineEditTable thead > tr > th
        {
            font-weight: bold;
            font-size: 9px;
        }
        .TimelineClickableValue
        {
            /*      background-image: url(images/TimelineClickableValueBG.png);*/
            background-repeat: repeat-x;
            font-size: 12px;
            color: #333333;
            border: solid 1px #dfdfdf;
            padding: 3px;
            padding-left: 10px;
            padding-right: 10px; /*       cursor: pointer;*/
            width: 15px;
            display: inline-block;
        }
        INPUT.TimelineClickableValue:hover
        {
            /*        background-image: url(images/TimelineClickableValueBG.png);*/
            background-repeat: repeat-x;
            font-size: 12px;
            color: #8d2a2c;
            border: solid 1px #8d2a2c;
            padding: 3px;
            padding-left: 10px;
            padding-right: 10px; /*        cursor: pointer;*/
        }
        .TimelineTabContentsTable
        {
            width: 166px;
        }
        tr.TimelineActiveRow > td
        {
            background-color: #d6c2c1;
            color: #000000;
        }
        .OnStudyDateSizer
        {
            width: 52px;
            height: 1px;
            margin-bottom: 6px;
        }
        #LesionMainDiv
        {
            height: 350px;
            width: 700px;
            overflow: auto;
        }
        .TimelineSizerCell
        {
            height: 1px;
        }
        .TimelineTabNameTitleEntryField
        {
            width: 132px;
            height: 15px;
            font-size: 14px;
            color: #111111;
            border: solid 1px #cccccc;
            text-align: center;
        }
        .WeekText
        {
            font-size: 11px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-weight: bold;
            line-height: 11px;
            cursor: pointer;
        }
        .BufferText
        {
            font-size: 11px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-weight: normal;
            line-height: 11px;
            cursor: pointer;
        }
        .VisitDescriptionText
        {
            font-size: 10px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-weight: bold;
            line-height: 10px;
            cursor: pointer;
        }
        .TimelineTabLayer_PreStudy
        {
            position: absolute;
            z-index: 99;
            overflow: hidden;
            width: 172px;
            height: 285px;
            background-image: url(images/TimelineTabLayerBG_PreStudy.png);
            background-position: -3px 0px;
            background-repeat: no-repeat;
            visibility: hidden;
        }
        .TimelineTabLayer_OnStudy
        {
            position: absolute;
            z-index: 99;
            overflow: hidden;
            width: 172px;
            height: 285px;
            background-image: url(images/TimelineTabLayerBG_OnStudy.png);
            background-position: -3px 0px;
            background-repeat: no-repeat;
            visibility: hidden;
        }
        .WeekDataEntryField
        {
            width: 40px;
            border: solid 1px #cccccc;
        }
        .BufferDataEntryField
        {
            width: 20px;
            border: solid 1px #cccccc;
        }
        .TimelineTabLayerOptionsRow
        {
            padding-left: 18px;
            font-size: 12px;
            text-align: left;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #111111;
            font-weight: bold;
        }
        #LesionHeaderTable
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            color: #000000;
            text-align: center;
            font-weight: bold;
            margin-left: 12px;
            width: 270px;
        }
        .ResponseSubtitle
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
        }
        .HeaderLineDiv
        {
            background-image: url(images/TimelineTab_HorizontalLine.gif);
            background-position: 0px 10px;
            background-repeat: repeat-x;
            text-align: center;
            display: block;
            margin-left: 12px;
            width: 92%;
        }
        .TimelineFooter
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #333333;
            font-size: 11px;
            padding-top: 8px;
            padding-left: 20px;
            padding-right: 40px;
        }
        .TimelineFieldSelector
        {
            display: block;
            margin: auto;
            width: 170px;
        }
        .smallPopup
        {
            background-image: url(images/SmallPopupBG.png);
            background-repeat: no-repeat;
        }
        .scanSmallField
        {
            width: 65px;
        }
        .Diagnostic_PET_Fields td
        {
            vertical-align: top;
        }
        .Diagnostic_PET_Fields input[type="text"], .Diagnostic_PET_Fields select
        {
            width: 100px;
        }
    </style>
    <style type="text/css">
        #AddDiagnosticLayer
        {
            display: none; /*position: absolute;
            top: 0px;
            left: 0px;
            width: 302px;
            height: 326px;
            padding: 10px;
            z-index: 10000;
            background-image: url(images/SmallPopupBG_216High.png);
            background-repeat: no-repeat;*/
        }
        .EditDiagnosticLayer
        {
            position: absolute;
            top: 0px;
            left: 0px;
            display: inline-block;
            max-width: 608px;
            min-width: 350px;
            min-height: 326px; /* max-height: 400px;
            overflow: auto;*/
            z-index: 10001; /*
            padding: 10px;
            background-image: url(images/SmallPopupBG.png);
            background-repeat: no-repeat;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 5px;*/
        }
        .EditDiagnosticTopContainer
        {
            position: static;
            background-image: url(images/SmallPopupBG_Top_Left.png);
            background-repeat: no-repeat;
            background-position: left top;
            font-size: 1px;
            line-height: 1px;
            padding-left: 8px; /*width: 100%;*/
        }
        .EditDiagnosticTop
        {
            position: static;
            background-image: url(images/SmallPopupBG_Top_Right.png);
            background-repeat: no-repeat;
            background-position: right top;
            font-size: 1px;
            line-height: 1px;
            height: 8px;
            width: 600px;
            min-width: 350px;
        }
        .EditDiagnosticContentContainer
        {
            background-image: url(images/SmallPopupBG_Bottom_Left.png);
            background-repeat: no-repeat;
            background-position: left bottom;
            font-size: 1px;
            line-height: 1px;
            padding-left: 8px;
        }
        .EditDiagnosticContent
        {
            background-image: url(images/SmallPopupBG_Bottom_Right.png);
            background-repeat: no-repeat;
            background-position: right bottom;
            padding: 8px 8px 8px 0px;
            line-height: 11px;
            font-size: 11px;
            padding-left: 8px;
        }
        #AddLesionLayer
        {
            display: none;
            position: absolute;
            top: 0px;
            left: 50%;
            margin-left: -151px;
            width: 302px;
            height: 326px;
            padding: 10px;
            z-index: 20000;
           /* background-image: url(images/SmallPopupBG_236High.png);
            background-repeat: no-repeat;*/
        }
        #AddLesionLayerTable
        {
            table-layout: fixed;
            margin-top: 10px;
            width: 90%;
        }
        .MainDataEntryField
        {
            border: 1px solid #999999;
        }
        .EditLesionLayer
        {
            display: none;
            position: absolute;
            top: 0px;
            left: 50%;
            margin-left: -151px;
            width: 302px;
            height: 326px;
            padding: 10px;
            z-index: 20000;
            background-image: url(images/SmallPopupBG.png);
            background-repeat: no-repeat;
        }
        .EditLesionRecord
        {
            table-layout: fixed;
            width: auto;
        }
        .EditLesionRecord td
        {
            font-size: 12px;
            padding: 4px 0px 4px 0px;
        }
        .EditLesionRecord label
        {
            margin: 2px;
        }
        .EditLesionRecord fieldset > table
        {
            margin: 8px auto 2px 0px;
        }
        .BoneScanPopupTable td
        {
            font-size: 12px;
            height: 26px;
        }
        .LesionTable
        {
        }
        .LesionTable td
        {
            font-size: 12px;
            padding: 4px 0px 4px 0px;
        }
        .dataGrid
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="DataEntryFieldType" />
    <div id="LesionTableLayer" style="width: 100%;">
        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="margin-left: auto;
            margin-right: auto;">
            <tr>
                <td class="ResponseSubtitle" style="width: 282px;">
                    Lesions
                </td>
                <td style="vertical-align: bottom;">
                    <div class="HeaderLineDiv">
                        <div style="margin: auto; background-color: #ffffff; width: 265px; color: #000000;
                            font-size: 12px;">
                            <asp:DropDownList runat="server" ID="FieldSelectionsList" CssClass="TimelineFieldSelector"
                                AutoPostBack="true" OnSelectedIndexChanged="ChangeImageField" Visible="false">
                                <asp:ListItem Text="Lesion Length (cm)" Value="ImgFindLength"></asp:ListItem>
                                <asp:ListItem Text="SUV MAX" Value="ImgFindSUV"></asp:ListItem>
                            </asp:DropDownList>
                            <%-- Display MAIN DATA ENTRY FIELD --%>
                            <strong>
                                <%= FieldSelectionsList.SelectedItem.Text %></strong>, as measured by <strong>
                                    <%= string.Join("&#47;", ImageTypes)%></strong>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="TimelineImagingTopLeftBG">
                    <table id="LesionHeaderTable" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td style="width: 20%">
                                Lesion&nbsp;
                            </td>
                            <td style="width: 20%">
                                Target<sup style="font-size: 10px;">*</sup>
                            </td>
                            <td style="width: 30%">
                                Site<sup style="font-size: 10px;">*</sup>
                            </td>
                            <td style="width: 30%">
                                Subsite<sup style="font-size: 10px;">*</sup>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="vertical-align: bottom; padding-left: 2px;">
                    <div id="TimelineTab_AddNew_Docked" class="TimelineTab_AddNew_Docked">
                        <img src="images/shim.gif" style="cursor: pointer;" onclick="showAddDiagnostic();" /></div>
                    <div id="TimelineTabDiv_Imaging">

                        <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

                        <table id="LesionHeader" cellpadding="0" cellspacing="0">
                            <tr>
                                <asp:Repeater runat="server" ID="DiagnosticsHeaderRptr" OnItemDataBound="SetScanSpecificFields"
                                    OnItemCreated="TrackDirtyDiagnoticFields">
                                    <ItemTemplate>
                                        <td class="TimelineTabTD_Imaging<%# IsBaselineColumn(Container.DataItem) ? "Baseline": ""  %>"
                                            onclick="editDiagnostic(<%# Container.ItemIndex %>);" title="<%# IsBaselineColumn(Container.DataItem) ? "Click to View/Edit Baseline Scan": "Click to View/Edit Scan Details"  %>">
                                            <cic:CaisisHidden runat="server" ID="DiagnosticIdField" Value='<%# Eval("DiagnosticId")%>' />
                                            <img src="images/shim.gif" class="TimelineColSizer_Imaging" /><br />
                                            <a id="<%# GetInputControlClientId(Container, "DxDateText") %>_DateDisplay" class="TimelineTab_ImagingDateLink">
                                                <%# !string.IsNullOrEmpty(Eval("DxDate","{0:d}"))? Eval("DxDate","{0:d}") : "&nbsp;" %></a>
                                            <%-- Diagnostic Data Entry Layer (DOM removed from container and inserted into main DIV at runtime)--%>
                                            <div id="EditDiagnostic_<%# Container.ItemIndex %>" class="EditDiagnosticLayer" style="display: none;">
                                                <div class="EditDiagnosticTopContainer">
                                                    <div class="EditDiagnosticTop">
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                </div>
                                                <div class="EditDiagnosticContentContainer">
                                                    <div class="EditDiagnosticContent">
                                                        <span style="cursor: pointer; float: right; margin-right: -2px; margin-top: -3px;">
                                                            <img alt="Close" title="Close" src="images/Close_white.gif" onclick="return closeDiagnostic(<%# Container.ItemIndex %>);" /></span><span
                                                                class="SectionTitle">Edit Scan on
                                                                <%# Eval("DxDate", "{0:d}") %></span>
                                                        <div>
                                                            <%-- SHARED Fields --%>
                                                            <asp:PlaceHolder runat="server" ID="SHARED_Fields"></asp:PlaceHolder>
                                                            <%-- CT/MRN Specific Fields --%>
                                                            <asp:PlaceHolder runat="server" ID="CTMRI_Fields" Visible="true">
                                                                <table class="LesionTable" style="margin: 0px auto 0px auto;">
                                                                    <tr>
                                                                        <td style="width: 100px;">
                                                                            <asp:Label runat="server" ID="CTMRI_DxType_Label" AssociatedControlID="CTMRI_DxType">Type</asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisComboBox runat="server" ID="CTMRI_DxType" ShowLabel="false" Table="Diagnostics"
                                                                                Field="DxType" LookupCode="DxType" Value='<%# Eval("DxType") %>'>
                                                                            </cic:CaisisComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="CTMRI_ImgBaseline_Label" AssociatedControlID="CTMRI_ImgBaseline">Baseline</asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisCheckBox runat="server" ID="CTMRI_ImgBaseline" ShowLabel="false" Table="Diagnostics"
                                                                                Field="ImgBaseline" Value='<%# Eval("ImgBaseline") %>'></cic:CaisisCheckBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="CTMRI_DxDateText_Label" AssociatedControlID="CTMRI_DxDateText">Date</asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisTextBox runat="server" ID="CTMRI_DxDateText" ShowLabel="false" Table="Diagnostics"
                                                                                Field="DxDateText" ShowCalendar="true" CalcDate="true" Value='<%# Eval("DxDateText") %>'>
                                                                            </cic:CaisisTextBox>
                                                                            <cic:CaisisHidden runat="server" ID="CTMRI_DxDate" ShowLabel="false" ShowSpacer="false"
                                                                                Table="Diagnostics" Field="DxDate" DisplayCalculatedDate="true" Value='<%# Eval("DxDate") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="CTMRI_DxResult_Label" AssociatedControlID="CTMRI_DxResult">Result</asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisComboBox runat="server" ID="CTMRI_DxResult" ShowLabel="false" Table="Diagnostics"
                                                                                Field="DxResult" LookupCode="DiagnosticResult" Value='<%# Eval("DxResult") %>'></cic:CaisisComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="CTMRI_ImgCompared_Label" AssociatedControlID="CTMRI_ImgCompared">Compared To</asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisSelect runat="server" ID="CTMRI_ImgCompared" ShowLabel="false" Table="Diagnostics"
                                                                                Field="ImgCompared" ShowEmptyListItem="true" DataTextField="DiagnosticText" DataValueField="DiagnosticId"></cic:CaisisSelect>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:PlaceHolder>
                                                            <%-- PET Specific Fields --%>
                                                            <asp:PlaceHolder runat="server" ID="PET_Fields" Visible="false">
                                                                <table id="EditDiagnostic_<%# Container.ItemIndex %>_Main" class="Diagnostic_PET_Fields">
                                                                    <tr>
                                                                        <td style="width: 48%;">
                                                                            <table class="LesionTable">
                                                                                <tr>
                                                                                    <td style="width: 125px;">
                                                                                        <asp:Label runat="server" ID="PET_DxType_Label" AssociatedControlID="PET_DxType">Type</asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <cic:CaisisComboBox runat="server" ID="PET_DxType" ShowLabel="false" Table="Diagnostics"
                                                                                            Field="DxType" LookupCode="DxType" Value='<%# Eval("DxType") %>'>
                                                                                        </cic:CaisisComboBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label runat="server" ID="PET_ImgBaseline_Label" AssociatedControlID="PET_ImgBaseline">Baseline</asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <cic:CaisisCheckBox runat="server" ID="PET_ImgBaseline" ShowLabel="false" Table="Diagnostics"
                                                                                            Field="ImgBaseline" Value='<%# Eval("ImgBaseline") %>'></cic:CaisisCheckBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="vertical-align: top;">
                                                                                        <asp:Label runat="server" ID="PET_DxDateText_Label" AssociatedControlID="PET_DxDateText">Date</asp:Label>
                                                                                    </td>
                                                                                    <td style="vertical-align: top;">
                                                                                        <cic:CaisisTextBox runat="server" ID="PET_DxDateText" ShowLabel="false" Table="Diagnostics"
                                                                                            Field="DxDateText" ShowCalendar="true" CalcDate="true" Value='<%# Eval("DxDateText") %>'>
                                                                                        </cic:CaisisTextBox><br />
                                                                                        <cic:CaisisHidden runat="server" ID="PET_DxDate" ShowLabel="false" ShowSpacer="false"
                                                                                            Table="Diagnostics" Field="DxDate" DisplayCalculatedDate="true" Value='<%# Eval("DxDate") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                                <%--  <tr>
                                                                            <td>
                                                                                <asp:Label runat="server" ID="PET_DxPending_Label" AssociatedControlID="PET_DxPending">Pending</asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <cic:CaisisCheckBox runat="server" ID="PET_DxPending" ShowLabel="false" Table="Diagnostics"
                                                                                    Field="DxPending" Value='<%# Eval("DxPending") %>'></cic:CaisisCheckBox>
                                                                            </td>
                                                                        </tr>--%>
                                                                                <%--<tr>
                                                                            <td>
                                                                                <asp:Label runat="server" ID="PET_DxDisease_Label" AssociatedControlID="PET_DxDisease">Disease</asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <cic:CaisisComboBox runat="server" ID="PET_DxDisease" ShowLabel="false" Table="Diagnostics"
                                                                                    Field="DxDisease" LookupCode="Disease" Value='<%# Eval("DxDisease") %>'></cic:CaisisComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label runat="server" ID="PET_DxSide_Label" AssociatedControlID="PET_DxSide">Side</asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <cic:CaisisComboBox runat="server" ID="PET_DxSide" ShowLabel="false" Table="Diagnostics"
                                                                                    Field="DxSide" LookupCode="FindSide" Value='<%# Eval("DxSide") %>'></cic:CaisisComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label runat="server" ID="PET_DxTarget_Label" AssociatedControlID="PET_DxTarget">Target</asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <cic:CaisisTextBox runat="server" ID="PET_DxTarget" ShowLabel="false" Table="Diagnostics"
                                                                                    Field="DxTarget" Value='<%# Eval("DxTarget") %>'></cic:CaisisTextBox>
                                                                            </td>
                                                                        </tr>--%>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label runat="server" ID="PET_DxResult_Label" AssociatedControlID="PET_DxResult">Tracer Uptake?</asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <cic:CaisisSelect runat="server" ID="PET_DxResult" ShowLabel="false" Table="Diagnostics"
                                                                                            Field="DxResult" Value='<%# Eval("DxResult") %>'>
                                                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                                            <asp:ListItem Text="Tracer related to metastasis" Value="1"></asp:ListItem>
                                                                                            <asp:ListItem Text="Tracer unrelated to metastasis" Value="0"></asp:ListItem>
                                                                                        </cic:CaisisSelect>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="EditDiagnostic_<%# Container.ItemIndex %>_Baseline">
                                                                                    <td>
                                                                                        <asp:Label runat="server" ID="PET_DxSummary_Label" AssociatedControlID="PET_DxSummary">Clinical Impression</asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <cic:CaisisSelect runat="server" ID="PET_DxSummary" ShowLabel="false" Table="Diagnostics"
                                                                                            Field="DxSummary" LookupCode="Impression">
                                                                                        </cic:CaisisSelect>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td>
                                                                            <table class="EditLesionRecord" cellspacing="0" style="width: 100%;">
                                                                                <%-- Special Finding 1 --%>
                                                                                <asp:PlaceHolder runat="server" ID="PET_Fields_Finding0">
                                                                                    <tr>
                                                                                        <td colspan="2">
                                                                                            <fieldset>
                                                                                                <legend>Bone Lesions</legend>
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <cic:CaisisHidden runat="server" ID="DxImageFindingId0" Table="DxImageFindings" Field="DxImageFindingId" />
                                                                                                            <asp:Label runat="server" ID="PET_ImgFindResult0_Label" AssociatedControlID="PET_ImgFindResult0">Total</asp:Label>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <cic:CaisisSelect runat="server" ID="PET_ImgFindResult0" ShowLabel="false" Table="DxImageFindings"
                                                                                                                Field="ImgFindResult" CssClass="scanSmallField" Width="55px">
                                                                                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                                                                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                                                                <asp:ListItem Text="2-4" Value="2-4"></asp:ListItem>
                                                                                                                <asp:ListItem Text="5-9" Value="5-9"></asp:ListItem>
                                                                                                                <asp:ListItem Text="10-20" Value="10-20"></asp:ListItem>
                                                                                                                <asp:ListItem Text=">20" Value=">20"></asp:ListItem>
                                                                                                            </cic:CaisisSelect>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:Label runat="server" ID="PET_ImgFindSite0_Label" AssociatedControlID="PET_ImgFindSite0">Locations</asp:Label>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <cic:CaisisCheckBoxList runat="server" ID="PET_ImgFindSite0" ShowLabel="false" Table="DxImageFindings"
                                                                                                                Field="ImgFindSite" AppendDataBoundItems="false" ShowOther="false" DropDown="true"
                                                                                                                RepeatLayout="Table" RepeatColumns="3" RepeatDirection="Horizontal" LookupCode="DxImageFindSite_Bone">
                                                                                                            </cic:CaisisCheckBoxList>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </fieldset>
                                                                                        </td>
                                                                                    </tr>
                                                                                </asp:PlaceHolder>
                                                                                <%-- Special Finding 3 --%>
                                                                                <asp:PlaceHolder runat="server" ID="PET_Fields_Finding2">
                                                                                    <tr>
                                                                                        <td colspan="2">
                                                                                            <fieldset>
                                                                                                <legend>Lymph Node Lesions</legend>
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <cic:CaisisHidden runat="server" ID="DxImageFindingId2" Table="DxImageFindings" Field="DxImageFindingId" />
                                                                                                            <asp:Label runat="server" ID="PET_ImgFindResult2_Label" AssociatedControlID="PET_ImgFindResult2">Total</asp:Label>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <cic:CaisisSelect runat="server" ID="PET_ImgFindResult2" ShowLabel="false" Table="DxImageFindings"
                                                                                                                Field="ImgFindResult" CssClass="scanSmallField" Width="55px">
                                                                                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                                                                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                                                                <asp:ListItem Text="2-4" Value="2-4"></asp:ListItem>
                                                                                                                <asp:ListItem Text="5-9" Value="5-9"></asp:ListItem>
                                                                                                                <asp:ListItem Text="10-20" Value="10-20"></asp:ListItem>
                                                                                                                <asp:ListItem Text=">20" Value=">20"></asp:ListItem>
                                                                                                            </cic:CaisisSelect>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:Label runat="server" ID="PET_ImgFindSite2_Label" AssociatedControlID="PET_ImgFindSite2">Locations</asp:Label>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <cic:CaisisCheckBoxList runat="server" ID="PET_ImgFindSite2" ShowLabel="false" Table="DxImageFindings"
                                                                                                                Field="ImgFindSite" AppendDataBoundItems="false" ShowOther="true" DropDown="true"
                                                                                                                RepeatLayout="Table" RepeatColumns="3" RepeatDirection="Horizontal" LookupCode="DxImageFindSite_LymphNode">
                                                                                                            </cic:CaisisCheckBoxList>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </fieldset>
                                                                                        </td>
                                                                                    </tr>                                                                                    
                                                                                </asp:PlaceHolder>
                                                                                <%-- Special Finding 2 --%>
                                                                                <asp:PlaceHolder runat="server" ID="PET_Fields_Finding1">
                                                                                    <tr>
                                                                                        <td colspan="2">
                                                                                            <fieldset>
                                                                                                <legend>Soft Tissue Lesions</legend>
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <cic:CaisisHidden runat="server" ID="DxImageFindingId1" Table="DxImageFindings" Field="DxImageFindingId" />
                                                                                                            <asp:Label runat="server" ID="PET_ImgFindResult1_Label" AssociatedControlID="PET_ImgFindResult1">Total</asp:Label>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <cic:CaisisSelect runat="server" ID="PET_ImgFindResult1" ShowLabel="false" Table="DxImageFindings"
                                                                                                                Field="ImgFindResult" CssClass="scanSmallField" Width="55px">
                                                                                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                                                                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                                                                <asp:ListItem Text="2-4" Value="2-4"></asp:ListItem>
                                                                                                                <asp:ListItem Text="5-9" Value="5-9"></asp:ListItem>
                                                                                                                <asp:ListItem Text="10-20" Value="10-20"></asp:ListItem>
                                                                                                                <asp:ListItem Text=">20" Value=">20"></asp:ListItem>
                                                                                                            </cic:CaisisSelect>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:Label runat="server" ID="PET_ImgFindSite1_Label" AssociatedControlID="PET_ImgFindSite1">Locations</asp:Label>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <cic:CaisisCheckBoxList runat="server" ID="PET_ImgFindSite1" ShowLabel="false" Table="DxImageFindings"
                                                                                                                Field="ImgFindSite" AppendDataBoundItems="false" ShowOther="true" DropDown="true"
                                                                                                                RepeatLayout="Table" RepeatColumns="3" RepeatDirection="Horizontal" LookupCode="DxImageFindSite_SoftTissue">
                                                                                                            </cic:CaisisCheckBoxList>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </fieldset>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="2">
                                                                                            <fieldset>
                                                                                                <legend>New Lesions</legend>
                                                                                                <table style="width: 100%;">
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <label>
                                                                                                                Total
                                                                                                                <cic:CaisisSelect runat="server" ID="PET_DxNumNewTumors" ShowLabel="false" Table="Diagnostics"
                                                                                                                    Field="DxNumNewTumors" RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="5"
                                                                                                                    CssClass="scanSmallField" Value='<%# Eval("DxNumNewTumors") %>' Width="55px">
                                                                                                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                                                                                    <asp:ListItem Text=">5" Value=">5"></asp:ListItem>
                                                                                                                </cic:CaisisSelect>
                                                                                                            </label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </fieldset>
                                                                                        </td>
                                                                                    </tr>
                                                                                </asp:PlaceHolder>                                                                            
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:PlaceHolder>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <td id="TimelineTabTD_AddNew" class="TimelineTabTD_AddNew" onclick="showAddDiagnostic();">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="TimelineImagingMidLeftBG">
                    <div id="LesionShell">
                        <div id="LesionDiv">
                            <table id="LesionRows" border="0" cellspacing="0" cellpadding="0" class="schemaItemsTable">
                                <tr>
                                    <td style="width: 20%;">
                                        <img src="images/shim.gif" style="width: 2px; height: 2px" />
                                    </td>
                                    <td style="width: 20%;">
                                        <img src="images/shim.gif" style="width: 2px; height: 2px" />
                                    </td>
                                    <td style="width: 30%;">
                                        <img src="images/shim.gif" style="width: 2px; height: 2px" />
                                    </td>
                                    <td style="width: 30%;">
                                        <img src="images/shim.gif" style="width: 2px; height: 2px" />
                                    </td>
                                </tr>
                                <%-- LEFT COLUMN, DISTINCT IMG GROUP NUM --%>
                                <asp:Repeater runat="server" ID="DxImageFindingsGroupsRptr" OnItemDataBound="SetGroupNumTitles">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="<%# Container.ItemIndex %2 == 0 ? "TimelineImaging_A" : "TimelineImaging_B" %>">
                                                <%# Container.ItemIndex + 1 %>
                                            </td>
                                            <td class="<%# Container.ItemIndex %2 == 0 ? "TimelineImaging_A" : "TimelineImaging_B" %>">
                                                <asp:Image runat="server" ID="ImgFindTarget" ImageUrl="Images/icon_check.png" Width="12"
                                                    Height="14" AlternateText="Target" ToolTip="Target" />
                                            </td>
                                            <td class="<%# Container.ItemIndex %2 == 0 ? "TimelineImaging_A" : "TimelineImaging_B" %>">
                                                <asp:Label runat="server" ID="ImgFindSite"></asp:Label>
                                            </td>
                                            <td class="<%# Container.ItemIndex %2 == 0 ? "TimelineImaging_A" : "TimelineImaging_B" %>">
                                                <asp:Label runat="server" ID="ImgFindSubsite"></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
                </td>
                <td class="TimelineTopRightBG">
                    <div id="VisitColumnsShell">
                        <div id="LesionMainDiv">
                            <table id="LesionCells" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 2px;">
                                        <img src="images/shim.gif" class="TimelineColSizer_Imaging" style="width: 2px; height: 2px" />
                                    </td>
                                    <%-- Spacer Columns for Main Matrix --%>
                                    <asp:Repeater runat="server" ID="DxImageFindingGroupRowsHeaderRptr">
                                        <ItemTemplate>
                                            <td>
                                                <img src="images/shim.gif" class="TimelineColSizer_Imaging" />
                                            </td>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tr>
                                <asp:Repeater runat="server" ID="DxImageFindingGroupRowsRptr" OnItemDataBound="BuildGroupRowColumns">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Repeater runat="server" ID="ImageFindingsRowCellsRptr" OnItemDataBound="PopulateImagingCell"
                                                OnItemCreated="TrackDirtyImageFindingFields">
                                                <HeaderTemplate>
                                                    <td class="<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex %2 == 0 ? "TimelineImaging_A" : "TimelineImaging_B" %>"
                                                        style="width: 2px;">
                                                        <img src="images/shim.gif" style="width: 1px; height: 1px" />
                                                    </td>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <td class="<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex %2 == 0 ? "TimelineImaging_A" : "TimelineImaging_B" %>">
                                                            <table class="TimelineEditTable" cellpadding="1" cellspacing="0">
                                                                <asp:PlaceHolder runat="server" ID="CTMRI_TimelineHeader" Visible="false">
                                                                    <thead>
                                                                        <tr>                                                                            
                                                                            <th title="Longest Diameter">
                                                                                LD
                                                                            </th>
                                                                            <th title="Shortest Diameter">
                                                                                SD
                                                                            </th>
                                                                            <th>
                                                                                &nbsp;
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                </asp:PlaceHolder>
                                                                <tbody>
                                                                    <tr>                                                                       
                                                                        <td>
                                                                            <asp:TextBox runat="server" ID="MainDataEntryFieldLabel" CssClass="TimelineClickableValue TimelinePrimaryValue"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox runat="server" ID="SecondaryDataEntryFieldLabel" CssClass="TimelineClickableValue TimelineSecondaryValue"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <span class="LesionEditBtn" style="float: left; cursor: pointer; width: 10px;">
                                                                                <img alt="Edit" src="images/Icon_Expand_highlight.png" style="margin-left: 1px;" title="More About This Lesion Measurement" /></span>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>                                                        
                                                        <%-- 
                                            DATA ENTRY LAYER for each DxImageFinding 
                                            ICaisisInputControls should have ID == Field, i.,e. ID="ImgFindTarget" Field="ImgFindTarget"
                                            --%>
                                                        <div class="EditLesionLayer" id="LesionLayer_<%# Container.ItemIndex %>_<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex %>">
                                                            <span style="cursor: pointer; float: right; margin-right: 20px;" class="CloseLesionBtn" id="LesionLayer_<%# Container.ItemIndex %>_<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex %>_Close">
                                                                <img src="images/Close_white.gif" /></span><span class="SectionTitle">Lesion
                                                                    <%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex + 1 %>
                                                                    on
                                                                    <%# Eval("DxDate","{0:d}") %>
                                                                </span>
                                                            <%-- SHARED Fields --%>
                                                            <asp:PlaceHolder runat="server" ID="SHARED_Fields">
                                                                <cic:CaisisHidden runat="server" ID="ImageFindingId" Table="DxImageFindings" Field="DxImageFindingId" />
                                                                <cic:CaisisHidden runat="server" ID="ImgFindGroupNum" Table="DxImageFindings" Field="ImgFindGroupNum" />
                                                            </asp:PlaceHolder>
                                                            <%-- CT/MRN Fields --%>
                                                            <asp:PlaceHolder runat="server" ID="CTMRI_Fields">
                                                                <table class="EditLesionRecord" cellspacing="0">
                                                                    <tr>
                                                                        <td style="width: 100px;">
                                                                            <asp:Label runat="server" ID="CTMRI_ImgFindTarget_Label" Text="Target" AssociatedControlID="CTMRI_ImgFindTarget"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisSelect ID="CTMRI_ImgFindTarget" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindTarget" ShowLabel="false">
                                                                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                                    <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="no"></asp:ListItem>
                                                                            </cic:CaisisSelect>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="CTMRI_ImgFindSliceNum_Label" Text="Slice #" AssociatedControlID="CTMRI_ImgFindSliceNum"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisTextBox ID="CTMRI_ImgFindSliceNum" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindSliceNum" ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="CTMRI_ImgFindSeriesNum_Label" Text="Series #" AssociatedControlID="CTMRI_ImgFindSeriesNum"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisTextBox ID="CTMRI_ImgFindSeriesNum" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindSeriesNum" ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="CTMRI_ImgFindSite_Label" Text="Site" AssociatedControlID="CTMRI_ImgFindSite"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisComboBox ID="CTMRI_ImgFindSite" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindSite" ShowLabel="false" LookupCode="ImgFindSite">
                                                                            </cic:CaisisComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="CTMRI_ImgFindSubsite_Label" Text="Subsite" AssociatedControlID="CTMRI_ImgFindSubsite"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisComboBox ID="CTMRI_ImgFindSubsite" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindSubsite" ShowLabel="false" LookupCode="ImgFindSubsite">
                                                                            </cic:CaisisComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="CTMRI_ImgFindLength_Label" Text="Length - Longest Diameter (cm)" AssociatedControlID="CTMRI_ImgFindLength"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisTextBox ID="CTMRI_ImgFindLength" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindLength" ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="CTMRI_ImgFindWidth_Label" Text="Width - Shortest Diameter (cm)" AssociatedControlID="CTMRI_ImgFindWidth"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisTextBox ID="CTMRI_ImgFindWidth" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindWidth" ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:PlaceHolder>
                                                            <%-- PET Fields --%>
                                                            <asp:PlaceHolder runat="server" ID="PET_Fields">
                                                                <table class="EditLesionRecord" cellspacing="0">
                                                                    <tr>
                                                                        <td style="width: 100px;">
                                                                            <asp:Label runat="server" ID="PET_ImgFindTarget_Label" Text="Target" AssociatedControlID="PET_ImgFindTarget"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisSelect ID="PET_ImgFindTarget" runat="server" Table="DxImageFindings" Field="ImgFindTarget"
                                                                                ShowLabel="false">
                                                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                                <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                                                                                <asp:ListItem Text="No" Value="no"></asp:ListItem>
                                                                            </cic:CaisisSelect>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="PET_ImgFindSeriesNum_Label" Text="Series #" AssociatedControlID="PET_ImgFindSeriesNum"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisTextBox ID="PET_ImgFindSeriesNum" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindSeriesNum" ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="PET_ImgFindSliceNum_Label" Text="Slice #" AssociatedControlID="PET_ImgFindSliceNum"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisTextBox ID="PET_ImgFindSliceNum" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindSliceNum" ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="PET_ImgFindSite_Label" Text="Site" AssociatedControlID="PET_ImgFindSite"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisComboBox ID="PET_ImgFindSite" runat="server" Table="DxImageFindings" Field="ImgFindSite"
                                                                                ShowLabel="false" LookupCode="DxImageFindSite_SoftTissue">
                                                                            </cic:CaisisComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="PET_ImgFindSide_Label" Text="Side" AssociatedControlID="PET_ImgFindSide"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisComboBox ID="PET_ImgFindSide" runat="server" Table="DxImageFindings" Field="ImgFindSide"
                                                                                ShowLabel="false" LookupCode="FindSide">
                                                                            </cic:CaisisComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="PET_ImgFindSubsite_Label" Text="Subsite" AssociatedControlID="PET_ImgFindSubsite"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisComboBox ID="PET_ImgFindSubsite" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindSubsite" ShowLabel="false" LookupCode="ImgFindSubsite">
                                                                            </cic:CaisisComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <%--<tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="PET_ImgFindLength_Label" Text="Length" AssociatedControlID="PET_ImgFindLength"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisTextBox ID="PET_ImgFindLength" runat="server" Table="DxImageFindings"
                                                                                Field="ImgFindLength" ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="PET_ImgFindWidth_Label" Text="Width" AssociatedControlID="PET_ImgFindWidth"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisTextBox ID="PET_ImgFindWidth" runat="server" Table="DxImageFindings" Field="ImgFindWidth"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>--%>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label runat="server" ID="PET_ImgFindSUV_Label" Text="SUV" AssociatedControlID="PET_ImgFindSUV"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <cic:CaisisTextBox ID="PET_ImgFindSUV" runat="server" Table="DxImageFindings" Field="ImgFindSUV"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:PlaceHolder>
                                                        </div>
                                                    </td>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="TimelineBottomLeftBG">
                    <asp:ImageButton runat="server" ID="AddNewLesionBtn" ImageUrl="images/Button_AddNewLesion_red.png"
                        AlternateText="Add New Lesion" OnClientClick="return showAddNewLesion();" Width="107"
                        Height="25" Style="margin: 4px 0px 6px 60px; cursor: pointer;" />
                </td>
                <td class="TimelineBottomRightBG">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" class="TimelineFooter">
                    <asp:ImageButton runat="server" ID="SaveBtn" Width="71" Height="25" ImageUrl="Images/Button_Save.png"
                        ToolTip="Save" OnClick="MainSaveBtnClick" Style="float: right;" />
                    <img src="Images/Button_CancelChanges.png" alt="Cancel Changes" title="Cancel Changes"
                        width="97" height="25" style="margin-right: 70px; float: right; cursor: pointer;"
                        onclick="return resetLesionFields();" />
                    <sup style="font-size: 10px; font-weight: bold; color: #000000;">*</sup>Values for
                    Target, Site, &amp; Subsite listed here are from the most recent scan of the applicable
                    lesion.<br />
                    A scan date tinted in <span style="color: #004256; font-weight: bold; font-size: 12px;">
                        Blue</span> denotes the baseline scan.
                </td>
            </tr>
        </table>
    </div>
    <%-- Add New Diagnostic --%>
    <asp:PlaceHolder runat="server" ID="NewDiagnosticPanel">
        <div id="AddDiagnosticLayer" class="EditDiagnosticLayer">
            <cic:CaisisHidden runat="server" ID="DiagnosticIdField" Value="" />
            <div class="EditDiagnosticTopContainer">
                <div class="EditDiagnosticTop">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </div>
            <div class="EditDiagnosticContentContainer">
                <div class="EditDiagnosticContent">
                    <span style="cursor: pointer; float: right; margin-right: 20px;">
                        <img src="images/Close_white.gif" onclick="return hideAddDiagnostic();" /></span><span
                            class="SectionTitle">Add New Scan</span>
                    <div>
                        <%-- SHARED Fields --%>
                        <asp:PlaceHolder runat="server" ID="SHARED_Fields"></asp:PlaceHolder>
                        <%-- CT/MRN Specific Fields --%>
                        <asp:PlaceHolder runat="server" ID="CTMRI_Fields">
                            <table class="LesionTable" style="margin: 0px auto 0px auto;">
                                <tr>
                                    <td style="width: 100px;">
                                        <asp:Label runat="server" ID="CTMRI_DxType_Label" AssociatedControlID="CTMRI_DxType">Type</asp:Label>
                                    </td>
                                    <td>
                                        <cic:CaisisComboBox runat="server" ID="CTMRI_DxType" ShowLabel="false" Table="Diagnostics"
                                            Field="DxType" LookupCode="DxType">
                                        </cic:CaisisComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="CTMRI_ImgBaseline_Label" AssociatedControlID="CTMRI_ImgBaseline">Baseline</asp:Label>
                                    </td>
                                    <td>
                                        <cic:CaisisCheckBox runat="server" ID="CTMRI_ImgBaseline" ShowLabel="false" Table="Diagnostics"
                                            Field="ImgBaseline"></cic:CaisisCheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="CTMRI_DxDateText_Label" AssociatedControlID="CTMRI_DxDateText">Date</asp:Label>
                                    </td>
                                    <td>
                                        <cic:CaisisTextBox runat="server" ID="CTMRI_DxDateText" ShowLabel="false" Table="Diagnostics"
                                            Field="DxDateText" ShowCalendar="true" CalcDate="true">
                                        </cic:CaisisTextBox>
                                        <cic:CaisisHidden runat="server" ID="CTMRI_DxDate" ShowLabel="false" ShowSpacer="false"
                                            Table="Diagnostics" Field="DxDate" DisplayCalculatedDate="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="CTMRI_DxResult_Label" AssociatedControlID="CTMRI_DxResult">Result</asp:Label>
                                    </td>
                                    <td>
                                        <cic:CaisisComboBox runat="server" ID="CTMRI_DxResult" ShowLabel="false" Table="Diagnostics"
                                            Field="DxResult" LookupCode="DiagnosticResult"></cic:CaisisComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="CTMRI_ImgCompared_Label" AssociatedControlID="CTMRI_ImgCompared">Compared To</asp:Label>
                                    </td>
                                    <td>
                                        <cic:CaisisSelect runat="server" ID="CTMRI_ImgCompared" ShowLabel="false" Table="Diagnostics"
                                            Field="ImgCompared" ShowEmptyListItem="true" DataTextField="DiagnosticText" DataValueField="DiagnosticId"></cic:CaisisSelect>
                                    </td>
                                </tr>
                            </table>
                        </asp:PlaceHolder>
                        <%-- PET Specific Fields --%>
                        <asp:PlaceHolder runat="server" ID="PET_Fields">
                            <table id="EditDiagnostic_New_Main" class="Diagnostic_PET_Fields">
                                <tr>
                                    <td style="width: 48%;">
                                        <table class="LesionTable">
                                            <tr>
                                                <td style="width: 125px;">
                                                    <asp:Label runat="server" ID="PET_DxType_Label" AssociatedControlID="PET_DxType">Type</asp:Label>
                                                </td>
                                                <td>
                                                    <cic:CaisisComboBox runat="server" ID="PET_DxType" ShowLabel="false" Table="Diagnostics"
                                                        Field="DxType" LookupCode="DxType">
                                                    </cic:CaisisComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" ID="PET_ImgBaseline_Label" AssociatedControlID="PET_ImgBaseline">Baseline</asp:Label>
                                                </td>
                                                <td>
                                                    <cic:CaisisCheckBox runat="server" ID="PET_ImgBaseline" ShowLabel="false" Table="Diagnostics"
                                                        Field="ImgBaseline" onclick="toggleBaselineFields('EditDiagnostic_New_Baseline',this.checked);">
                                                    </cic:CaisisCheckBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align: top;">
                                                    <asp:Label runat="server" ID="PET_DxDateText_Label" AssociatedControlID="PET_DxDateText">Date</asp:Label>
                                                </td>
                                                <td style="vertical-align: top;">
                                                    <cic:CaisisTextBox runat="server" ID="PET_DxDateText" ShowLabel="false" Table="Diagnostics"
                                                        Field="DxDateText" ShowCalendar="true" CalcDate="true">
                                                    </cic:CaisisTextBox><br />
                                                    <cic:CaisisHidden runat="server" ID="PET_DxDate" ShowLabel="false" ShowSpacer="false"
                                                        Table="Diagnostics" Field="DxDate" DisplayCalculatedDate="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" ID="PET_DxResult_Label" AssociatedControlID="PET_DxResult">Tracer Uptake?</asp:Label>
                                                </td>
                                                <td>
                                                    <cic:CaisisSelect runat="server" ID="PET_DxResult" ShowLabel="false" Table="Diagnostics"
                                                        Field="DxResult">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        <asp:ListItem Text="Tracer related to metastasis" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Tracer unrelated to metastasis" Value="0"></asp:ListItem>
                                                    </cic:CaisisSelect>
                                                </td>
                                            </tr>
                                            <tr id="EditDiagnostic_New_Baseline">
                                                <td>
                                                    <asp:Label runat="server" ID="PET_DxSummary_Label" AssociatedControlID="PET_DxSummary">Clinical Impression</asp:Label>
                                                </td>
                                                <td>
                                                    <cic:CaisisSelect runat="server" ID="PET_DxSummary" ShowLabel="false" Table="Diagnostics"
                                                        Field="DxSummary" LookupCode="Impression">
                                                    </cic:CaisisSelect>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table class="EditLesionRecord" cellspacing="0" style="width: 100%;">
                                            <%-- Special Finding 1 --%>
                                            <asp:PlaceHolder runat="server" ID="PET_Fields_Finding0">
                                                <tr>
                                                    <td colspan="2">
                                                        <fieldset>
                                                            <legend>Bone Lesions</legend>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <cic:CaisisHidden runat="server" ID="DxImageFindingId0" Table="DxImageFindings" Field="DxImageFindingId" />
                                                                        <asp:Label runat="server" ID="PET_ImgFindResult0_Label" AssociatedControlID="PET_ImgFindResult0">Total</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <cic:CaisisSelect runat="server" ID="PET_ImgFindResult0" ShowLabel="false" Table="DxImageFindings"
                                                                            Field="ImgFindResult" CssClass="scanSmallField" Width="55px">
                                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="2-4" Value="2-4"></asp:ListItem>
                                                                            <asp:ListItem Text="5-9" Value="5-9"></asp:ListItem>
                                                                            <asp:ListItem Text="10-20" Value="10-20"></asp:ListItem>
                                                                            <asp:ListItem Text=">20" Value=">20"></asp:ListItem>
                                                                        </cic:CaisisSelect>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="PET_ImgFindSite0_Label" AssociatedControlID="PET_ImgFindSite0">Locations</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <cic:CaisisCheckBoxList runat="server" ID="PET_ImgFindSite0" ShowLabel="false" Table="DxImageFindings"
                                                                            Field="ImgFindSite" AppendDataBoundItems="false" ShowOther="false" DropDown="true"
                                                                            RepeatLayout="Table" RepeatColumns="3" RepeatDirection="Horizontal" LookupCode="DxImageFindSite_Bone">
                                                                        </cic:CaisisCheckBoxList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>
                                            </asp:PlaceHolder>
                                                                                        <%-- Special Finding 3 --%>
                                            <asp:PlaceHolder runat="server" ID="PET_Fields_Finding2">
                                                <tr>
                                                    <td colspan="2">
                                                        <fieldset>
                                                            <legend>Lymph Node Lesions</legend>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <cic:CaisisHidden runat="server" ID="DxImageFindingId2" Table="DxImageFindings" Field="DxImageFindingId" />
                                                                        <asp:Label runat="server" ID="PET_ImgFindResult2_Label" AssociatedControlID="PET_ImgFindResult2">Total</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <cic:CaisisSelect runat="server" ID="PET_ImgFindResult2" ShowLabel="false" Table="DxImageFindings"
                                                                            Field="ImgFindResult" CssClass="scanSmallField" Width="55px">
                                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="2-4" Value="2-4"></asp:ListItem>
                                                                            <asp:ListItem Text="5-9" Value="5-9"></asp:ListItem>
                                                                            <asp:ListItem Text="10-20" Value="10-20"></asp:ListItem>
                                                                            <asp:ListItem Text=">20" Value=">20"></asp:ListItem>
                                                                        </cic:CaisisSelect>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="PET_ImgFindSite2_Label" AssociatedControlID="PET_ImgFindSite2">Locations</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <cic:CaisisCheckBoxList runat="server" ID="PET_ImgFindSite2" ShowLabel="false" Table="DxImageFindings"
                                                                            Field="ImgFindSite" AppendDataBoundItems="false" ShowOther="false" DropDown="true"
                                                                            RepeatLayout="Table" RepeatColumns="3" RepeatDirection="Horizontal" LookupCode="DxImageFindSite_LymphNode">
                                                                        </cic:CaisisCheckBoxList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>
                                            </asp:PlaceHolder>
                                            <%-- Special Finding 2 --%>
                                            <asp:PlaceHolder runat="server" ID="PET_Fields_Finding1">
                                                <tr>
                                                    <td colspan="2">
                                                        <fieldset>
                                                            <legend>Soft Tissue Lesions</legend>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <cic:CaisisHidden runat="server" ID="DxImageFindingId1" Table="DxImageFindings" Field="DxImageFindingId" />
                                                                        <asp:Label runat="server" ID="PET_ImgFindResult1_Label" AssociatedControlID="PET_ImgFindResult1">Total</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <cic:CaisisSelect runat="server" ID="PET_ImgFindResult1" ShowLabel="false" Table="DxImageFindings"
                                                                            Field="ImgFindResult" CssClass="scanSmallField" Width="55px">
                                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="2-4" Value="2-4"></asp:ListItem>
                                                                            <asp:ListItem Text="5-9" Value="5-9"></asp:ListItem>
                                                                            <asp:ListItem Text="10-20" Value="10-20"></asp:ListItem>
                                                                            <asp:ListItem Text=">20" Value=">20"></asp:ListItem>
                                                                        </cic:CaisisSelect>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="PET_ImgFindSite1_Label" AssociatedControlID="PET_ImgFindSite1">Locations</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <cic:CaisisCheckBoxList runat="server" ID="PET_ImgFindSite1" ShowLabel="false" Table="DxImageFindings"
                                                                            Field="ImgFindSite" AppendDataBoundItems="false" ShowOther="true" DropDown="true"
                                                                            RepeatLayout="Table" RepeatColumns="3" RepeatDirection="Horizontal" LookupCode="DxImageFindSite_SoftTissue">
                                                                        </cic:CaisisCheckBoxList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <fieldset>
                                                            <legend>New Lesions</legend>
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 100px;">
                                                                        <label>
                                                                            Yes
                                                                            <input type="radio" id="NewLesionsGroup_New_Hottest" name="NewLesionsGroup_New" value="Hottest"
                                                                                onclick="toggleEnterLesionsButtons('New' , 'New');" /></label>
                                                                        <label>
                                                                            No
                                                                            <input type="radio" id="NewLesionsGroup_New_New" name="NewLesionsGroup_New" value="New"
                                                                                onclick="toggleEnterLesionsButtons('New' , 'Hottest');" /></label>
                                                                        <input type="hidden" id="NewLesionsGroup_Type" name="NewLesionsGroup_Type" value="" />
                                                                    </td>
                                                                    <td>
                                                                        <label id="EnterLesions_New_NewTotal" style="display: none;">
                                                                            Total
                                                                            <cic:CaisisSelect runat="server" ID="PET_DxNumNewTumors" ShowLabel="false" Table="Diagnostics"
                                                                                Field="DxNumNewTumors" RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="5"
                                                                                CssClass="scanSmallField" Width="55px">
                                                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                                                <asp:ListItem Text=">5" Value=">5"></asp:ListItem>
                                                                            </cic:CaisisSelect>
                                                                        </label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <span id="EnterLesions_New_Hottest" class="dataEntryButtonRed" style="display: none;"
                                                                            onclick="toggleEnterLesions('New' , 'Hottest');">Enter Hottest Lesions</span>
                                                                        <span id="EnterLesions_New_New" class="dataEntryButtonRed" style="display: none;"
                                                                            onclick="toggleEnterLesions('New' , 'New');">Enter New Lesions</span>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>
                                            </asp:PlaceHolder>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <%-- New Lesions --%>
                            <div id="EditDiagnostic_New_NewLesions" style="display: none;">
                                <a href="#" onclick="return showAddDiagnostic();" style=" position: absolute; top: 18px; right: 50px; ">back to scan</a>
                                <table class="Diagnostic_PET_Fields" style="position: relative;">
                                    <tr>
                                        <td>
                                            <cic:ExtendedGridView runat="server" ID="DxGrid2" AutoGenerateColumns="false" TableName="DxImageFindings"
                                                GridLines="None" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA"
                                                AlternatingRowStyle-CssClass="dataGridItemRowB" BlankRows="3" VisibleBlankRows="3"
                                                AutoGenerateDeleteButton="false">
                                                <Columns>
                                                    <cic:ExtendedTemplateField HeaderText="New Lesion" HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                                        ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <span style="white-space: nowrap;">#
                                                                <%# Container.DataItemIndex + 1 %></span>
                                                            <cic:CaisisHidden runat="server" ID="ImgFindGroupNum" Table="DxImageFindings" Field="ImgFindGroupNum" />
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="Series" ControlStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <cic:CaisisTextBox ID="ImgFindSeriesNum" runat="server" ShowLabel="false" Table="DxImageFindings"
                                                                Field="ImgFindSeriesNum"></cic:CaisisTextBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="Slice" ControlStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <cic:CaisisTextBox ID="ImgFindSliceNum" runat="server" ShowLabel="false" Table="DxImageFindings"
                                                                Field="ImgFindSliceNum"></cic:CaisisTextBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="Site" ControlStyle-Width="75px">
                                                        <ItemTemplate>
                                                            <cic:CaisisComboBox ID="ImgFindSite" runat="server" LookupCode="ImgFindSite" ShowLabel="false"
                                                                Table="DxImageFindings" Field="ImgFindSite"></cic:CaisisComboBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="Side" ControlStyle-Width="75px">
                                                        <ItemTemplate>
                                                            <cic:CaisisComboBox ID="ImgFindSide" runat="server" LookupCode="FindSide" ShowLabel="false"
                                                                Table="DxImageFindings" Field="ImgFindSide"></cic:CaisisComboBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="Sub Site">
                                                        <ItemTemplate>
                                                            <cic:CaisisComboBox ID="ImgFindSubsite" runat="server" LookupCode="ImgFindSubsite"
                                                                ShowLabel="false" Table="DxImageFindings" Field="ImgFindSubsite"></cic:CaisisComboBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="SUV Max" ControlStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <cic:CaisisTextBox ID="ImgFindSUV" runat="server" ShowLabel="false" Table="DxImageFindings"
                                                                Field="ImgFindSUV"></cic:CaisisTextBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                </Columns>
                                            </cic:ExtendedGridView>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <%-- Hottest Lesions --%>
                            <div id="EditDiagnostic_New_HottestLesions" style="display: none;">
                                <a href="#" onclick="return showAddDiagnostic();" style="position: absolute; top: 18px;
                                    right: 50px;">back to scan</a>
                                <table class="Diagnostic_PET_Fields" style="position: relative;">
                                    <tr>
                                        <td>
                                            <cic:ExtendedGridView runat="server" ID="DxGrid1" AutoGenerateColumns="false" TableName="DxImageFindings"
                                                BlankRows="5" VisibleBlankRows="5" AutoGenerateDeleteButton="false" GridLines="None"
                                                CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA"
                                                AlternatingRowStyle-CssClass="dataGridItemRowB">
                                                <Columns>
                                                    <cic:ExtendedTemplateField HeaderText="Hottest Lesion" HeaderStyle-Width="100px"
                                                        ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <span style="white-space: nowrap;">#
                                                                <%# Container.DataItemIndex + 1 %></span>
                                                            <cic:CaisisHidden runat="server" ID="ImgFindGroupNum" Table="DxImageFindings" Field="ImgFindGroupNum" />
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="Series" ControlStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <cic:CaisisTextBox ID="ImgFindSeriesNum" runat="server" ShowLabel="false" Table="DxImageFindings"
                                                                Field="ImgFindSeriesNum"></cic:CaisisTextBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="Slice" ControlStyle-Width="50px">
                                                        <ItemTemplate>
                                                            <cic:CaisisTextBox ID="ImgFindSliceNum" runat="server" ShowLabel="false" Table="DxImageFindings"
                                                                Field="ImgFindSliceNum"></cic:CaisisTextBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="Site" ControlStyle-Width="75px">
                                                        <ItemTemplate>
                                                            <cic:CaisisComboBox ID="ImgFindSite" runat="server" LookupCode="ImgFindSite" ShowLabel="false"
                                                                Table="DxImageFindings" Field="ImgFindSite"></cic:CaisisComboBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="Side" ControlStyle-Width="75px">
                                                        <ItemTemplate>
                                                            <cic:CaisisComboBox ID="ImgFindSide" runat="server" LookupCode="FindSide" ShowLabel="false"
                                                                Table="DxImageFindings" Field="ImgFindSide"></cic:CaisisComboBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="Sub Site">
                                                        <ItemTemplate>
                                                            <cic:CaisisComboBox ID="ImgFindSubsite" runat="server" LookupCode="ImgFindSubsite"
                                                                ShowLabel="false" Table="DxImageFindings" Field="ImgFindSubsite"></cic:CaisisComboBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                    <cic:ExtendedTemplateField HeaderText="SUV Max" ControlStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <cic:CaisisTextBox ID="ImgFindSUV" runat="server" ShowLabel="false" Table="DxImageFindings"
                                                                Field="ImgFindSUV"></cic:CaisisTextBox>
                                                        </ItemTemplate>
                                                    </cic:ExtendedTemplateField>
                                                </Columns>
                                            </cic:ExtendedGridView>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="text-align: center;">
                                <button class="dataEntryButtonGray" onclick="return hideAddDiagnostic();" style="cursor: pointer;
                                    margin-right: 25px; vertical-align: middle;">
                                    Cancel</button>
                                <asp:Button runat="server" ID="AddDiagnosticBtn" CssClass="dataEntryButtonRed" Text="Add New Diagnostic"
                                    OnClick="AddNewDiagnosticClick" Style="margin-left: 25px; vertical-align: middle;" />
                            </div>
                        </asp:PlaceHolder>
                    </div>
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
    <%-- Add New DxImageFinding --%>
    <asp:PlaceHolder runat="server" ID="NewDxImageFindingPanel">
        <div id="AddLesionLayer" class="EditLesionLayer">
            <span style="cursor: pointer; float: right; margin-right: 20px;">
                <img src="images/Close_white.gif" onclick="return hideAddNewLesion();" /></span><span
                    class="SectionTitle">Add New Lesion</span>
            <%-- SHARED Fields --%>
            <asp:PlaceHolder runat="server" ID="DX_SHARED_Fields"></asp:PlaceHolder>
            <%-- CT/MRN Fields --%>
            <asp:PlaceHolder runat="server" ID="DX_CTMRI_Fields">
                <table class="EditLesionRecord" cellspacing="0">
                  <tr>
                      <td style="width: 100px;">
                          <label for="CTMRI_ExistingDiagnostics">
                              Diagnostic Date
                          </label>
                      </td>
                      <td>
                          <cic:CaisisSelect runat="server" ID="CTMRI_ExistingDiagnostics" ShowLabel="false" Table="DxImageFindings"
                              Field="DiagnosticId" DataTextField="DxDate" DataTextFormatString="{0:d}" DataValueField="DiagnosticId">
                          </cic:CaisisSelect>
                      </td>
                  </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="CTMRI_ImgFindTarget_Label" Text="Target" AssociatedControlID="CTMRI_ImgFindTarget"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisSelect ID="CTMRI_ImgFindTarget" runat="server" Table="DxImageFindings"
                                Field="ImgFindTarget" ShowLabel="false">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="no"></asp:ListItem>
                            </cic:CaisisSelect>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="CTMRI_ImgFindSliceNum_Label" Text="Slice #" AssociatedControlID="CTMRI_ImgFindSliceNum"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisTextBox ID="CTMRI_ImgFindSliceNum" runat="server" Table="DxImageFindings"
                                Field="ImgFindSliceNum" ShowLabel="false"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="CTMRI_ImgFindSeriesNum_Label" Text="Series #" AssociatedControlID="CTMRI_ImgFindSeriesNum"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisTextBox ID="CTMRI_ImgFindSeriesNum" runat="server" Table="DxImageFindings"
                                Field="ImgFindSeriesNum" ShowLabel="false"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="CTMRI_ImgFindSite_Label" Text="Site" AssociatedControlID="CTMRI_ImgFindSite"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisComboBox ID="CTMRI_ImgFindSite" runat="server" Table="DxImageFindings"
                                Field="ImgFindSite" ShowLabel="false" LookupCode="ImgFindSite">
                            </cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="CTMRI_ImgFindSubsite_Label" Text="Subsite" AssociatedControlID="CTMRI_ImgFindSubsite"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisComboBox ID="CTMRI_ImgFindSubsite" runat="server" Table="DxImageFindings"
                                Field="ImgFindSubsite" ShowLabel="false" LookupCode="ImgFindSubsite">
                            </cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="CTMRI_ImgFindLength_Label" Text="Length - Longest Diameter (cm)" AssociatedControlID="CTMRI_ImgFindLength"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisTextBox ID="CTMRI_ImgFindLength" runat="server" Table="DxImageFindings"
                                Field="ImgFindLength" ShowLabel="false"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="CTMRI_ImgFindWidth_Label" Text="Width - Shortest Diameter (cm)" AssociatedControlID="CTMRI_ImgFindWidth"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisTextBox ID="CTMRI_ImgFindWidth" runat="server" Table="DxImageFindings"
                                Field="ImgFindWidth" ShowLabel="false"></cic:CaisisTextBox>
                        </td>
                    </tr>
                </table>
            </asp:PlaceHolder>
            <%-- PET Fields --%>
            <asp:PlaceHolder runat="server" ID="DX_PET_Fields">
                <table class="EditLesionRecord" cellspacing="0">
                 <tr>
                      <td style="width: 100px;">
                          <label for="PET_ExistingDiagnostics">
                              Diagnostic Date
                          </label>
                      </td>
                      <td>
                          <cic:CaisisSelect runat="server" ID="PET_ExistingDiagnostics" ShowLabel="false" Table="DxImageFindings"
                              Field="DiagnosticId" DataTextField="DxDate" DataTextFormatString="{0:d}" DataValueField="DiagnosticId">
                          </cic:CaisisSelect>
                      </td>
                  </tr>
                    <tr>
                        <td style="width: 100px;">
                            <asp:Label runat="server" ID="PET_ImgFindTarget_Label" Text="Target" AssociatedControlID="PET_ImgFindTarget"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisSelect ID="PET_ImgFindTarget" runat="server" Table="DxImageFindings" Field="ImgFindTarget"
                                ShowLabel="false">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="no"></asp:ListItem>
                            </cic:CaisisSelect>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="PET_ImgFindSeriesNum_Label" Text="Series #" AssociatedControlID="PET_ImgFindSeriesNum"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisTextBox ID="PET_ImgFindSeriesNum" runat="server" Table="DxImageFindings"
                                Field="ImgFindSeriesNum" ShowLabel="false"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="PET_ImgFindSliceNum_Label" Text="Slice #" AssociatedControlID="PET_ImgFindSliceNum"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisTextBox ID="PET_ImgFindSliceNum" runat="server" Table="DxImageFindings"
                                Field="ImgFindSliceNum" ShowLabel="false"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="PET_ImgFindSite_Label" Text="Site" AssociatedControlID="PET_ImgFindSite"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisComboBox ID="PET_ImgFindSite" runat="server" Table="DxImageFindings" Field="ImgFindSite"
                                ShowLabel="false" LookupCode="DxImageFindSite_SoftTissue">
                            </cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="PET_ImgFindSide_Label" Text="Side" AssociatedControlID="PET_ImgFindSide"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisComboBox ID="PET_ImgFindSide" runat="server" Table="DxImageFindings" Field="ImgFindSide"
                                ShowLabel="false" LookupCode="FindSide">
                            </cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="PET_ImgFindSubsite_Label" Text="Subsite" AssociatedControlID="PET_ImgFindSubsite"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisComboBox ID="PET_ImgFindSubsite" runat="server" Table="DxImageFindings"
                                Field="ImgFindSubsite" ShowLabel="false" LookupCode="ImgFindSubsite">
                            </cic:CaisisComboBox>
                        </td>
                    </tr>                   
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="PET_ImgFindSUV_Label" Text="SUV" AssociatedControlID="PET_ImgFindSUV"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisTextBox ID="PET_ImgFindSUV" runat="server" Table="DxImageFindings" Field="ImgFindSUV"
                                ShowLabel="false"></cic:CaisisTextBox>
                        </td>
                    </tr>
                </table>
            </asp:PlaceHolder>
            <div style=" margin: auto; text-align: center;">
                <button class="dataEntryButtonGray" title="Cancel" style="cursor: pointer; vertical-align: middle;
                    margin: 5px 10px; width: 85px;" onclick="return hideAddNewLesion();">Cancel</button> 
                <asp:Button runat="server" ID="AddNewLesionBtnSave" CssClass="dataEntryButtonRed"
                    Text="Add Lesion" ToolTip="Add Lesion" ImageUrl="Images/Button_Save.png" OnClick="AddLesionClick"
                    Style="vertical-align: middle; margin: 5px 10px; width: 85px;" />
            </div>
        </div>
    </asp:PlaceHolder>
    </form>

    <script type="text/javascript">
        function setNewLesionButtonPosition() {
            var LesionHeader = document.getElementById('LesionHeader');
            var LesionHeaderContainer = document.getElementById('TimelineTabDiv_Imaging');
            var TimelineTab_AddNew_Docked = document.getElementById('TimelineTab_AddNew_Docked');
            var TimelineTabTD_AddNew = document.getElementById('TimelineTabTD_AddNew');
            //	alert('LesionHeader.offsetWidth = ' + LesionHeader.offsetWidth);
            //	alert('LesionHeaderContainer.offsetWidth = ' + LesionHeaderContainer.offsetWidth);

            if (LesionHeader.offsetWidth > LesionHeaderContainer.offsetWidth) {
                TimelineTabTD_AddNew.style.display = 'none';
                TimelineTab_AddNew_Docked.style.display = 'block';
            }
        }
        var t = setTimeout('setNewLesionButtonPosition()', 500);
        //setNewLesionButtonPosition();
    </script>

</body>
</html>
