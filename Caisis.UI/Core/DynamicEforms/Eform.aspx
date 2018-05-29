<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Eform.aspx.cs" Inherits="Caisis.UI.Core.DynamicEforms.Eform" EnableViewState="false" %>
<%@ Reference Control="~/Core/DynamicEforms/EformPage.ascx" %>
<%@ Reference Control="~/Core/DynamicEforms/EformSection.ascx" %>
<%@ Reference Control="~/Core/DynamicEforms/EformPageTitleListItem.ascx" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="../Help/helpToolTip.ascx" %>
<%@ Register TagPrefix="plugin" TagName="survey" Src="~/Plugins/SurveyPlugin/SurveyControl.ascx" %>
<%@ Register TagPrefix="plugin" TagName="ctcae" Src="~/Plugins/CTCAEWizard/CTCAEWizardControl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="../../Modules/ProtocolMgmt/StyleSheets/ProtocolMgmtStyles.css" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
	<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/Help.js" type="text/javascript"></script>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>


    <script type="text/javascript">
        /* <![CDATA[ */       
        
        // supress conflict with caisis specific $ object
        jQuery.noConflict();

        var PD_DIV_OFFSET = 185;

        function onWindowResize() {
            var height = getHeight(window);
            var adjustedHeight = Math.max(100, height - PD_DIV_OFFSET);
            $('PDFormDiv').style.height = adjustedHeight + 'px';
        }


        function goToSection(section) {
            var sectionId = section + 'Section';
            document.getElementById('PDFormDiv').scrollTop = document.getElementById(sectionId).offsetTop;
        }
        
        /* ]]> */
    </script>
    

    <script type="text/javascript">
        /* <![CDATA[ */

        var fieldValidationList = new Array();
        var gridValidationList = new Array();

        // Returns if data entry if valid for all normal secitons (i.e., List sections)
        // 1. true if all fields have no data
        // 2. true, if at least 1 field has data with no required fields
        // 3. false, if any required field doesn't have a value
        function validateFields() {
            var validated = true;
            // for each list section, check if there is data, if so validate required fields
            jQuery('div.ListContainer').each(function(index, section) {
                var isSectionValid = true;
                var inputs = jQuery(section).find(':input');
                var isDirty = false;
                // check input fields in section which are required
                inputs.each(function(i, field) {
                    if (isFieldDirty(field)) {
                        isDirty = true;
                    }
                });
                // if section is "dirty", validate required fields
                if (isDirty) {
                    inputs.each(function(i, field) {
                        var inputField = jQuery(field);
                        var fieldId = jQuery(field).attr('id');
                        // required fields must have non empty values on "dirty sections"
                        jQuery.each(fieldValidationList, function(j, requiredId) {
                            // invalidate on empty required values
                            if (fieldId == requiredId && !isRequiredInputFieldValid(field)) {
                                isSectionValid = false;
                                // scroll to position of invalid field
                                var fieldTop = inputField.position().top;
                                jQuery('#PDFormDiv').scrollTop(fieldTop);
                            }
                        });
                    });
                }
                // one invalid section = invalidate
                validated = validated && isSectionValid;
            });
            return validated;
        }

        // returns if the input field had a valid value
        // @field: the DOM field to validate
        function isRequiredInputFieldValid(field) {
            var inputField = jQuery(field);
            if (inputField.is(":checkbox")) {
                return inputField.is(":checked")
            }
            else {
                return inputField.val() != '';
            }
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

            if (!validateFields()) {
                alert('Please enter data for each required field.');
                valid = false;
            }

            if (!validateGrids())
                valid = false;

            return valid;
        }

        // occurs when new survey entered through wizard
        function onSurveySave(sId) {
            alert('You have just entered a survey.');
            return true;
        }

        /* IMPORTANT : overwrite utilities position helper on page */
        function posHelper(obj, dir) {
            // signals if to account for table nesting
            var ignore = IGNORE_TABLE_OFFSET != null ? IGNORE_TABLE_OFFSET : false;
            var endloop = false, tablePos = 0, tableCount = 0, pos = 0;
            if (obj.offsetParent) {
                pos = dir == 'top' ? obj.offsetTop : obj.offsetLeft;
                while ((obj = obj.offsetParent) && !endloop) {
                    if (obj.nodeName == "BODY") { endloop = true; break; }
                    if (obj.style.position != 'relative') { pos += dir == 'top' ? obj.offsetTop : obj.offsetLeft; }
                }
            }
            return pos;
        }

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
			width: 85%;
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
			margin-top: 20px;
		}
		.dataEntrControlCell
		{
			vertical-align: top;
			font-family: Arial, Helvetica, sans-serif;
			color: #000000;
			font-size: 12px;
			padding-top: 6px;
			padding-bottom: 0px;
			padding-left: 0px;
			margin-bottom: 40px;
 
		}


		#PDFormDiv
		{
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
			font-size: 14px;
		}
		.EFormPageTitle
		{
			
			font-size: 16px;
			font-weight: bold;
			<%= IsPatientData ? "color: #8d2a2c;padding-left: 1px;" : "color: #111111;padding-left: 0px;" %>
		}
		.PDSectionHeader
		{
			border-bottom: none;
		}
		div > span.pdFormFieldLabel
		{
			font-size: 12px;
			text-align: left;
			width: auto;
			min-width: 90px;
		}
		div > span.pdFormFieldLabelRequired
		{
			font-size: 12px;
			text-align: left;
			width: auto;
			min-width: 90px;
		}
		#PageTitles
		{
		    <%= IsPatientData ? "" : "margin-top: 10px;" %>
		}
		.dataGrid
		{
		    margin-top: 0px;
		    margin-left: 0px;
		    border: solid 1px #cccccc;
		    background-color: #E0EBF1;
		}
		.dataGridHeader
		{
		    background-color: Transparent;
		    color: #111111;
		    font-size: 11px;
		    font-weight: bold;
		    border-bottom: solid 1px #cccccc;
		}
		.dataGridHeaderRequired
		{
		    background-color: Transparent;
		    border: none;
		    font-size: 11px;
		    border-bottom: solid 1px #cccccc;
		}
        .dataGridItemRowA
        {
            background-color: #F2F6F9;
            height: 25px;
            padding-left: 10px;
            padding-right: 10px;
        }
        .dataGridItemRowB
        {
            background-color: #ffffff;
            height: 25px;
            padding-left: 10px;
            padding-right: 10px;
        }
        .dataGridItemRowA td
        {
            vertical-align: top;
        }
        .dataGridItemRowB td
        {
            vertical-align: top;
        }
        .eformNavLink
        {
            cursor: pointer;
            border: solid 1px #cccccc;
            background-color: #ffffff;
            padding: 4px;
            font-size: 11px;
            color: #004256;
            font-weight: bold;
            
            <%= IsPatientData ? "display: block; margin-top: 5px; width: 136px;" : "margin-right: 6px;" %>
        }
        .eformNavLink:hover
        {
            cursor: pointer;
            border: solid 1px #8d2a2c;
            background-color: #ffffff;
            color: #8d2a2c;
        }
        .dataGridImageButton
        {
            margin-top: 1px;
        }
		
        input[type='text'],input.text {border: solid 1px #dddddd;}

		.ListContainer
		{
			border: solid 1px #cccccc;
			background-color: #ffffff;
			padding: 10px 10px 10px 10px;
			margin-bottom: 40px;
			width: 93%;
			max-width: 800px;
		}

		.ListContainer div.dataEntrControlCell
		{
			vertical-align: top;
			font-family: Arial, Helvetica, sans-serif;
			color: #000000;
			font-size: 12px;
			padding-top: 6px;
			padding-bottom: 0px;
			padding-left: 0px;
			margin-bottom: 5px;
		}
		
		.ListContainer table
		{
			width: 100%;
		}

        #DataEntryNav
        {
            <%= IsPatientData ? "float: left; z-index: 3; position: absolute;" : "width: 100%; display: table-cell;" %>
        }
        #MainDataEntry
        {
            <%= IsPatientData ? "width: 80%; float: right; margin-top: 23px;" : "width: 95%; margin-top: 10px;" %>
        }
        .DateDisplay
        {
            display: none;
        }
    </style>
</head>
<body style="padding-left: 20px; background-color: <%= IsPatientData ? "#f8fafc" : "#ffffff" %>;">
    <form id="form1" runat="server">
    <plugin:ctcae runat="server" ID="CTCAEPlugin" />
    <plugin:survey runat="server" ID="SurveyPlugin" ShowNextToField="true" />
    <div>
        <div id="DataEntryNav">
            <asp:Panel ID="PageTitles" runat="server">
            </asp:Panel>
        </div>
        <div id="MainDataEntry" class="dataEntryBox">
            <div style="width: 100%; margin: 0px 0px 0px 0px;">
                <div id="PDFormDiv" style="height: 300px; width: 100%; overflow: auto; position: relative;
                    padding-bottom: 20px;">
                    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
                    <uc1:helpToolTip id="HelpToolTipLayer" runat="server" />
                    <asp:Panel ID="PagePanel" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <div style="text-align: right; margin-top: 0px; clear: both;">
        <asp:ImageButton ID="SaveButton" ImageUrl="../../Modules/ProtocolMgmt/Images/Button_Save.png"
            OnClick="SaveButton_Click" OnClientClick="return validateRequiredControls();" Text="Save" runat="server" Style="margin-right: 7%;" />
    </div>
    </form>
</body>
</html>
