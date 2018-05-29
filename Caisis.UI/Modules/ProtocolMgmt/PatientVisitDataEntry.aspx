<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientVisitDataEntry.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientVisitDataEntry" %>
<%@ Reference Control="~/Modules/ProtocolMgmt/PatientItemEntry.ascx" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="plugin" TagName="survey" Src="~/Plugins/SurveyPlugin/SurveyControl.ascx" %>
<%@ Register TagPrefix="plugin" TagName="ctcae" Src="~/Plugins/CTCAEWizard/CTCAEWizardControl.ascx" %>
<%@ Register TagPrefix="unp" TagName="AddUnplannedEvent" Src="AddUnplannedEvent.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Patient Visit Data Entry</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>
    
    <script type="text/javascript">
    /* <![CDATA[ */
    
        var patientItemId = '<%= QueryPatientItemId %>';

        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            var doCompliance = jQuery("#<%= MedTxComplianceBit.ClientID %>").length > 0;
            if (doCompliance)
                initMedTxCompliance();
            var doToxSAE = jQuery("#<%= ToxSAEBit.ClientID %>").length > 0;
            if(doToxSAE)
                initToxSAE();
           initMedTxCopyValues();    
        });

        function getInputFieldNameMap(container, fieldNames) {
            var context = jQuery(container);
            var inputFieldMap = {};
            jQuery.each(fieldNames, function(index, fieldName) {
                inputFieldMap[fieldName] = context.find("[name*='" + fieldName + "']"); 
            });
            return inputFieldMap;
        }

        // for MedTxAdmin datagrid, copy values from first row (template) to other rows
        function initMedTxCopyValues() {
            var MED_TX_COPY_FIELDS = ["MedTxAdminAgent","MedTxAdminType","MedTxAdminDose","MedTxAdminUnits","MedTxAdminRoute","MedTxAdminSchedule"];
            var grid = jQuery("table[id*='MedTxAdministration']");
            var rows = grid.find("> tbody > tr");
            var headerRow = rows.filter(".dataGridHeader");
            var dataRows = rows.not(headerRow);
            // map of first row of fields
            var srcFields = null;
            // builld header
            var th = jQuery("<th class='dataGridHeader'>Copy Values</th>");
            headerRow.prepend(th);
            // build data rows
            dataRows.each(function(index) {                
                var row = jQuery(this);
                // add widget cell
                var td = jQuery("<td></td>");
                td.css("text-align", "center");            
                row.prepend(td);
                // get pri key
                var medTxId = row.find("input[name*='MedicalTherapyId']").val();
                // build field map
                var fieldMap = getInputFieldNameMap(row, MED_TX_COPY_FIELDS);
                // set inital map
                if(index == 0)
                    srcFields = fieldMap;
                 // add button: greater than first row or medTxId == null
                 if(index > 0 && (!medTxId || medTxId=="")) {
                    var btn = jQuery("<span class='dataEntryButtonRed smallButton'>Copy</span>");
                    td.append(btn);
                    // on copy click
                    btn.click(function() {
                        // copy values from source
                        jQuery.each(fieldMap, function(fieldName, targetField) {
                            var srcField = srcFields[fieldName];
                            targetField.val(srcField.val());
                        });
                    });
                }
           });
        }

        function initToxSAE() {
            var TOX_FIELDS = ["ToxicityId","ToxDateText","ToxDate","ToxName","ToxScale","ToxClass","ToxCategory","ToxGrade","ToxGradeCriteria","ToxRelatedTo","ToxProbability","ToxIntervention","ToxStopDateText","ToxStopDate","ToxExpected","ToxDiscontinueTherapy","ToxBaseLine","ToxSAE","ToxNotes","ToxDataSource","ToxQuality"];
            var grid = jQuery("table[id*='Toxicities']");
            grid.find("> tbody > tr").each(function(index) { 
                var row = jQuery(this);
                var fieldMap = getInputFieldNameMap(row, TOX_FIELDS);
                var toxIdField = fieldMap["ToxicityId"];
                var toxSAEField = fieldMap["ToxSAE"];
                // validate
                if(toxIdField.length==0 || toxSAEField.length == 0 || !toxSAEField.is(":checkbox"))
                    return;
                var fieldHaveChanged = function() {
                    var valid = false;
                    jQuery.each(fieldMap, function(fieldName, field) {
                        if(fieldName != "ToxSAE" && field.length > 0 && isFieldDirty(field[0])) {
                            return (valid=true);
                        }
                    });
                    return valid;
                };
                // add popup button
                var toxBtn = jQuery("<span class='smallButton'>SAE</span>");
                // set css class
                if(toxIdField.val() != "") {
                    toxBtn.addClass("dataEntryButtonRed");
                }
                else {
                    toxBtn.addClass("dataEntryButtonGray");
                }
                toxSAEField.after(toxBtn);
                // on change, show button
                toxSAEField.change(function(e) {
                    if(toxSAEField.is(":checked")) {
                        toxBtn.show();
                    }
                    else {
                        toxBtn.hide();
                    }
                });
                // on click, launch tox sae editor
                toxBtn.click(function(e) {
                    if(toxSAEField.is(":checked")) {
                        var toxId = toxIdField.val();
                        var fieldsChanged = fieldHaveChanged();
                        if(toxId=="" || patientItemId == "" || fieldsChanged) {
                            alert("Please save the record before continuing.");
                        }
                        else {
                            window.scrollTo(0,0)
                            loadToxicitiesSAE(patientItemId, toxId);
                        }
                    }
                });

                // inital
                toxSAEField.change();
            });
        }

    function initMedTxCompliance() {
        var grid = jQuery("table[id*='MedicalTherapy']");
        var trs = grid.find("tr");
        var headerTR = trs.first();
        var bodyTR = trs.not(headerTR);
        var addCompliance = false;
        bodyTR.each(function (index, tr) {
            var _tr = jQuery(tr);
            var _start = _tr.find("input[name*='MedTxDateText']");
            var _stop = _tr.find("input[name*='MedTxStopDateText']");
            var _total = _tr.find("input[name*='MedTxTotalDose']");
            var _route = _tr.find("input[name*='MedTxRoute']");
            if (_start.length > 0 && _stop.length > 0 && _total.length > 0) {
                // trigger compliance
                addCompliance = true;
                // build <td>
                var _compliance = jQuery("<td class='compliance'></td>");
                _tr.prepend(_compliance);
                // calcualte function
                var doCalculateCompliance = function (evt) {
                    if (_start.val() != "" && _stop.val() != "" && _total.val() != "") {
                        var s = new Date(_start.val());
                        var e = new Date(_stop.val());
                        var d = parseInt(_total.val(), 10);
                        // warn if total dose entered
                        var w = evt && evt.target == _total[0];
                        var compliance = calculateCompliance(s, e, d, w);
                        _compliance.text(compliance + "%");
                    }
                    else {
                        _compliance.html("&nbsp;");
                    }
                };
                // on blur of fields calculate
                _start.add(_stop).add(_total).blur(doCalculateCompliance);
                // run inital compliance check
                doCalculateCompliance();
            }
        });
        // build <th>
        if(addCompliance)
            headerTR.prepend("<th class='compliance'>Compliance</th>");
    }

    function calculateCompliance(start, end, totalDose, warn) {
        var timeDiff = Math.abs(end.getTime() - start.getTime());
        var days = Math.ceil(timeDiff / (1000 * 3600 * 24));
        var compliance = 0;
        if (days == 0)
            compliance = 0;
        else
        //compliance = ((days * 8) / totalDose) * 100;
            compliance = (totalDose / (days * 8)) * 100
        // warning
        if (warn==true && (compliance < 0 || compliance > 100))
            alert("Please check Total Dose, it may be out of range.");
        // range: 0 - 100
        compliance = Math.round(Math.max(0, Math.min(compliance, 100)));
        return compliance;
    }


        /* Unplanned Events callbacks */

         // notify parnet page that record has been updated
        function onUnplannedUpdated(isDelete) {
            alert('The SAE form has been updated.');
        }

        var DATA_ENTRY_TABLE_NAMES = [<%= DATA_ENTRY_TABLE_NAMES %>];

        var firstAnticipatedDate = <%= FirstAnticipatedClientDate %>;
        var lastAnticipatedDate = <%= LastAnticipatedClientDate %>;
        
        // a list of client date fields which are normal data entry fields
        var standardDateFields = [<%= CLIENT_STANDARD_PERFORMED_DATE_TEXT_FIELDS %>];
        
        // a list of client date  fields which are embedd in a grid
        var gridDateFields = [<%= CLIENT_GRID_PERFORMED_DATE_TEXT_FIELDS %>];

        var fieldValidationList = new Array();
        var gridValidationList = new Array();
        
        function validateFields() {
            for (i = 0; i < fieldValidationList.length; i++) {
                var id = fieldValidationList[i];
                var val = $(id).value;

                if (!val || val == '')
                    return false;
            }

            return true;
        }

        function validateGrids() {
            for (j = 0; j < gridValidationList.length; j++) {
                var id = gridValidationList[j];
                var grid = $(id);

                if (grid.validate && !grid.validate())
                    return false;
            }

            return true;
        }

        function validateRequiredControls() {
            var valid = true;
            // only need to validate controls if page controls are "dirty"
            if (isPageDirty(window)) {
                if (!validateFields()) {
                    alert('Please enter data for each required field.');
                    valid = false;
                }

                if (!validateGrids())
                    valid = false;
            }
            return valid;
        }
        
        function setDataEntryFieldsDirty() {
            var dataEntryContainer = $('<%= dataEntryContainer.ClientID %>');
            var inputFieldsByType = getInputFieldsInContainer(dataEntryContainer);
            var dataEntryFieldsDirty = false;
            for(var i=0;i<inputFieldsByType.length;i++)
            {
                var inputFields = inputFieldsByType[i];
                for(var j=0;j<inputFields.length;j++) {
                    var field = inputFields[j];
                    if(isFieldDirty(field)) {
                        $('DataEntryFieldsDirty').value = 'true';
                        return;
                    }
                }
            } 
        }

        function showMedications() {
            $('MedicationsLayer').style.display = 'block';
        }

        function hideMedications() {
            $('MedicationsLayer').style.display = 'none';
        }
        
    /* ]]> */
    </script>

    <script type="text/javascript">
    /* <![CDATA[ */
    
    // At runtime, two scripts are registered on startup/load to trigger server events
    // DO_ITEM_SAVE_SCRIPT = function which will trigger a save and load next ItemId
    // DO_ITEM_SAVE_RELOAD_SCRIPT = function which will trigger a save and call parent page script to go to Patient Portal
    
    // saves the current data entry item
    function saveCurrentDataEntry() {
        var validated = validateRequiredControls();
		if (validated) {
            if(window.<%= DO_ITEM_SAVE_SCRIPT %>) {
                window.<%= DO_ITEM_SAVE_SCRIPT %>();
            }
        }
        return false;
    }
    
    // saves current data entry and advances to next logical visit item
    function saveCurrentAndAdvance() {
        var validated = validateRequiredControls();
		if (validated) {
            if(window.<%= DO_ITEM_SAVE_ADVANCE_SCRIPT %>) {
                window.<%= DO_ITEM_SAVE_ADVANCE_SCRIPT %>();
            }
        }
        return false;
    }
    
    // saves the form, and reloads next item
    function saveAndLoadItem(encryptedItemId)
    {
        var validated = validateRequiredControls();
		if (validated)
		{
            $('Loading').show('');
	        $('NextItemId').value = encryptedItemId;

		    if(isPageDirty(window))
		    {
			    if(window.<%= DO_ITEM_SAVE_SCRIPT %>)
			    {
				    window.<%= DO_ITEM_SAVE_SCRIPT %>();
			    }
			}
			else if(window.<%= DO_ITEM_CANCEL_SCRIPT %>)
		    {
			    window.<%= DO_ITEM_CANCEL_SCRIPT %>();
		    }
        }
        return validated;
    }
    
    // saves the form, and goes to patient portal
    function saveAndGoToPortal()
    {
        var validated = validateRequiredControls();
		if (validated)
		{
			if(window.<%= DO_ITEM_SAVE_RELOAD_SCRIPT %>)
			{
				window.<%= DO_ITEM_SAVE_RELOAD_SCRIPT %>();
			}
			else if(window.<%= DO_ITEM_CANCEL_RELOAD_SCRIPT %>)
		    {
			    window.<%= DO_ITEM_CANCEL_RELOAD_SCRIPT %>();
		    }
        }
        return validated;
    }
    
    // calls parent function to reload PatientPortal
    function goToPortal()
    {
        if(parent.reloadPatientPortal) { parent.reloadPatientPortal(); }
    }
    
    function showStatusPicker(pickerIMG,e)
    {
        // show and position picker layer
        var pickerLayer = $('selectorLayer');
        pickerLayer.show('block');
        pickerLayer.style.left = getLeftPos(pickerIMG) + 'px';
    }
    
    function hideStatusPicker()
    {
        // show and position picker layer
        var pickerLayer = $('selectorLayer');
        pickerLayer.hide('none');
    }
    
    function setStatus(status)
    {
        $('StatusSelector').src = 'Images/ItemStatusSelector_' + status.replace(' ','') + '.png';
        $('StatusSelector').alt = 'Item Status: ' + status
        $('StatusField').value = status;
        // set date text
        $('ScheduledDateLabel').innerHTML = status == 'Performed' ? 'on' : 'for';
        hideStatusPicker();
        updateOnPerformed();
        return false;
    }
    
    // when survey updated, trigged postback and updated new survey association
    function onSurveySave(surveyId)
    {
        $('<%= SurveyIdField.ClientID %>').value = surveyId;
        if(window.<%= DO_SURVEY_SAVE_SCRIPT %>)
		{
			window.<%= DO_SURVEY_SAVE_SCRIPT %>();
		}
		return true;
    }
    
     // for date fields, auto-populate values when visit 'Performed'
     // @e: optional event argument
    function updateOnPerformed(e) {
        var statusDateField = $('<%= ScheduledDate.ClientID %>');
        var statusDateValue = statusDateField.value;
        var validate = validateScheduledDate(statusDateField, firstAnticipatedDate, lastAnticipatedDate, true, e);
        if(!validate) {
            return;
        }
        updateOnPerformedByList(standardDateFields);
        //updateOnPerformedByList(gridDateFields, true);
     }
     
     // for date fields in list, auto-populate values when visit 'Performed'
     // @fields: an array of client ids/DOM elements to set date
     // @checkEmpty: optional (indicate whether check field and supress populating on non-empty fields)
     function updateOnPerformedByList(fields, checkEmpty) {
        var fieldCount = fields.length;
        if(fieldCount > 0) {
            // for each date field, set field value to match selected status date
            for(var i=0;i<fieldCount;i++) {
                var field = $(fields[i]); // DOM field
                setDefaultVisitDate(field, checkEmpty);                    
            }
        }
     }
     
     // checks if visit performed, and sets field to performed date
     // also updates assocaited hidden field
     // @field: the DOM date field to update on visit 'Performed'
     // @checkEmpty: optional (default=false), if true, will not only replace on empty values 
     function setDefaultVisitDate(field, checkEmpty) {
        // validate special tables
        var validTableName = jQuery.inArray('MedicalTherapy', DATA_ENTRY_TABLE_NAMES) == -1;    
        if(!validTableName)
            return;
        // check current status
        if(field.type == 'text') {
            if(checkEmpty==true && field.value!='') {
                return;
            }
            var status = $('StatusField').value;
            var pDate = $('<%= ScheduledDate.ClientID %>').value;
            if(status=='Performed' && pDate != '') {
                field.value = pDate;
                if(window.UpdateAssociatedDate) {
                    UpdateAssociatedDate(field);
                }
            }                        
        }
    } 
    
    // add event handlers to set grid date fields on blur
    $(window).addEvent('load', function(e) {
        var fieldCount = gridDateFields.length;
        for(var i=0;i<fieldCount;i++) {
            var field = $(gridDateFields[i]); // DOM field
            field.addEvent('focus', curry(setDefaultVisitDate, field, true));
        }
    });
    
    /* ]]> */
    </script>
    
    <style type="text/css">
    #Loading
    {
        display: none; 
        width: 100%; 
        height: 100%; 
        background-color: #000000;
        opacity: .50;
        filter: alpha(opacity=50); 
        position: absolute; 
        top: 0px;
        left: 0px;
    }
    .Hidden
    {
        display: none;
    }
    .ScheduledDateInput
    {
        border-style: none;
        background-color: #ffffff;
        font-weight: bold;
        cursor: pointer;
        font-size: 9px;
        width: 66px;
    }
.dateSelector
{
	background-image:url(images/ItemDateSelectorBG.png);
	background-repeat: no-repeat;
	width: 119px;
	height: 26px;
	vertical-align: middle;
	cursor: pointer;
}
.itemListHeader
{
	font-family: Arial, Helvetica, sans-serif;
	color: #000000;
	font-size: 12px;
	font-weight: bold;
	text-align: center;

} 
.itemEntryTitleTable
{
	font-family: Arial, Helvetica, sans-serif;
	color: #222222;
	font-size: 12px;
	font-weight: bold;
}
.itemEntryTitle
{
	font-family: Arial, Helvetica, sans-serif;
	color: #000000;
	font-size: 15px;
	font-weight: bold;
	padding-right: 26px;
	white-space: nowrap;
}
.dataEntryBox
{
	border: solid 1px #dddddd;
	background-color: #f9f9f9;
	padding: 13px 16px 23px 16px;
	margin-top: 10px;
	width: 90%;
	margin-bottom: 4px;
}
.dataEntryLabelCell
{
	vertical-align: top;
	font-family: Arial, Helvetica, sans-serif;
	color: #000000;
	font-size: 12px;
	font-weight: bold;
	width: 70px;
	padding-top: 13px;
	padding-bottom: 10px;
}
.dataEntrControlCell
{
	vertical-align: top;
	font-family: Arial, Helvetica, sans-serif;
	color: #000000;
	font-size: 12px;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 5px;
}

#PDFormDiv
{
    height: auto;
    background-color: Transparent;
    border: none; 
    overflow: visible;
}

.PDSectionHeader div
{
    padding: 20px;
}
.DataEntryRow
{
    margin-top: 12px;
    margin-bottom: 12px;
    margin-left: 18px;
}
.SubFormSectionTitle
{
    color: #111111;
    padding-left: 0px;
    font-size: 13px;
}
.PDSectionHeader
{
    border-bottom: none;
}
div > span.pdFormFieldLabel
{
    font-size: 12px;
    text-align: left;
}
div > span.pdFormFieldLabelRequired
{
    font-size: 12px;
    text-align: left;
}
#MedicationsLayer
{
    position: absolute;
    left: 5%;
    width: 90%;
    min-height: 25%;
    max-height: 90%;
    padding: 10px;
    border: 1px solid #cccccc;
    border-radius: 3px;
    padding: 3px;
    z-index: 1001;
    background-color: #ffffff;
    overflow: auto;
}
    /* disabled controls */
    input[type="text"][disabled="disabled"],
    textarea[disabled="disabled"],
    select[disabled="disabled"]
    {
            background-color: #eeeeee;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server" onsubmit="setDataEntryFieldsDirty();">
        <%-- Hiiden field used to set next Item Id after update/save of current item --%>
        <asp:HiddenField runat="server" ID="NextItemId" />
        <%-- track dirty data entry fields --%>
        <input type="hidden" id="DataEntryFieldsDirty" name="DataEntryFieldsDirty" value="" />
        <%-- Plugins --%>
        <plugin:ctcae runat="server" ID="CTCAEPlugin" />
        <plugin:survey runat="server" ID="SurveyPlugin" ShowNextToField="true" />
        <!-- med compliance -->
        <asp:HiddenField runat="server" ID="MedTxComplianceBit" Visible="false" />
        <!-- tox sae logic -->
        <asp:HiddenField runat="server" ID="ToxSAEBit" Visible="false" />
        <!-- unplanned/toxicities -->
        <unp:AddUnplannedEvent runat="server" ID="AddUnplannedEvent" ShowDropDown="false" OnUpdateScript="onUnplannedUpdated" />

        <asp:HiddenField runat="server" ID="SurveyIdField" />
        <asp:Button runat="server" ID="TriggerSurveyUpdateBtn" OnClick="HandleSurveyUpdated"
            Visible="false" />
        <div id="Loading">
            LOADING</div>
        <div>
            <%-- Render calendar for formatting in container --%>

            <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

            <div id="selectorLayer" class="selectorLayer" style="z-index: 100; display: none;"
                onmouseout="if(isMouseLeave(this,event)) hideStatusPicker();">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="selectorLayerTop">
                            <a class="selectorLayerRowTd" href="#" onclick="return setStatus('Anticipated');"><span
                                class="AnticipatedText">
                                <img src="Images/Icon_Anticipated.png" alt="Anticipated" width="9" height="9" />Anticipated</span>
                            </a>
                            <a class="selectorLayerRowTd" href="#" onclick="return setStatus('Scheduled');">
                                <span class="ScheduledText">
                                    <img src="Images/Icon_Scheduled.png" alt="Scheduled" width="9" height="9" />Scheduled</span>
                            </a>
                            <a class="selectorLayerRowTd" href="#" onclick="return setStatus('Performed');">
                                <span class="PerformedText">
                                    <img src="Images/Icon_Performed.png" alt="Performed" width="9" height="9" />Performed</span>
                            </a>
                            <a class="selectorLayerRowTd" href="#" onclick="return setStatus('Missed');">
                                <span class="MissedText">
                                    <img src="Images/Icon_Missed.png" alt="Missed" width="9" height="9" />Missed</span>
                            </a>                            
                            <a class="selectorLayerRowTd" href="#" onclick="return setStatus('Not Applicable');">
                                <span class="NotApplicableText">
                                    <img src="Images/Icon_NotApplicable.png" alt="Not Applicable" width="9" height="9">Not Applicable</span>
                            </a>
                             <a class="selectorLayerRowTd" href="#" onclick="return setStatus('Refused');">
                                <span class="RefusedText">
                                    <img src="Images/Icon_Refused.png" alt="Refused" width="9" height="9">Refused</span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="selectorLayerBottom">
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
            <table border="0" cellspacing="0" cellpadding="0" class="itemEntryTitleTable">
                <tr>
                    <td class="itemEntryTitle" style="padding-right: 10px; color: #222222;">  <!-- remove this style attribute if we can get the title working properly -->
                        <asp:Label runat="server" ID="ItemLabel">Status:</asp:Label></td>
                    <td>
                        <cic:CaisisHidden runat="server" ID="StatusField" Table="ProtocolMgr_PatientItems" Field="Status" OnValueChanged="MarkFormDirty">
                        </cic:CaisisHidden>
                        <img id="StatusSelector" src="Images/ItemStatusSelector_<%= ItemStatus.Replace(" ","") %>.png" alt="Item Status: <%= ItemStatus %>"
                            width="105" height="26" style="margin-right: 4px; cursor: pointer;" onclick="showStatusPicker(this,event);" /></td>
                    <td class="dateSelector" style="padding-left: 7px;" onclick="showCal($('<%= ScheduledDate.ClientID %>'),$('<%= ScheduledDate.ClientID %>'));">
                        <span id="ScheduledDateLabel"></span>&nbsp;
                        <cic:CaisisTextBox runat="server" ID="ScheduledDate" Table="ProtocolMgr_PatientItems" Field="ScheduledDate" CssClass="ScheduledDateInput"
                            style="border: none;" ShowLabel="false" ShowCalendar="false" OnValueChanged="MarkFormDirty" onfocus="updateOnPerformed(event);" ></cic:CaisisTextBox>
                    </td>
                    <td>
                        Anticipated Visit Range: <asp:Label runat="server" ID="FirstAnticipatedDateText"></asp:Label>-
                        <asp:Label runat="server" ID="LastAnticipatedDateText"></asp:Label>
                    </td>
                    <td runat="server" id="MedicationsSection" visible="false" style="padding-left: 5px;">
                        <span class="dataEntryButtonGray"  onclick="showMedications();">View Current
                            Medications</span>
                        <div id="MedicationsLayer" onmouseout="if(isMouseLeave(this, event)) { hideMedications(); }"
                            style="display: none;">
                            <asp:GridView runat="server" ID="MedicationsGridView" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="ItemRow_A" AlternatingRowStyle-CssClass="ItemRow_B" EnableViewState="false" AutoGenerateColumns="true">
                            </asp:GridView>
                         </div>
                    </td>
                </tr>
            </table>
            <div class="dataEntryBox" id="dataEntryContainer" runat="server">
                <%--<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <%-- Data Entry Fields --%>
                    <%--<asp:Repeater runat="server" ID="SchemaItemFieldsRprt">
                        <ItemTemplate>
                            <tr>
                                <td class="dataEntryLabelCell">
                                    <asp:Label runat="server" AssociatedControlID="CICField"><%# Eval("FieldDisplayName")%></asp:Label>
                                </td>
                                <td class="dataEntrControlCell">
                                    <asp:TextBox runat="server" ID="CICField"></asp:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>--%>
                <%--</table>--%>
            </div>
<%--
<img src="Images/ViewMoreFields.gif" alt="View More Fields" style="float: right; margin-right: 29%; cursor: pointer;" />
--%>
            <%-- Data Entry Buttons, hiddem from interface (via css), used for triggering postback events  --%>
            <asp:Button runat="server" ID="SaveBtn" OnClick="SaveClick" CssClass="Hidden" Text="Save" />
            <asp:Button runat="server" ID="SaveAdvanceBtn" OnClick="SaveAndAdvanceClick" CssClass="Hidden" Text="Save And Advance" />            
            <asp:Button runat="server" ID="SaveReloadBtn" OnClick="SaveAndReloadClick" CssClass="Hidden"
                Text="Save And Go To Portal" />
            <asp:Button runat="server" ID="CancelBtn" OnClick="CancelClick" CssClass="Hidden" Text="Cancel" />
            <asp:Button runat="server" ID="CancelReloadBtn" OnClick="CancelClick" CssClass="Hidden" Text="Cancel And Go To Portal" />
        </div>
    </form>
</body>
</html>