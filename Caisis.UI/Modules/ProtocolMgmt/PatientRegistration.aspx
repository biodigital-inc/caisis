<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientRegistration.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientRegistration" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PatientRegistration</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <link href="../../StyleSheets/EFormStyles.css" rel="stylesheet" type="text/css" />

    

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>
    
    <script type="text/javascript">
        /* <![CDATA[ */

        var CHECK_DATE_EVENTS = ['click', 'focus', 'blur', 'keyup'];
        var activePanel;
        var activeTab;
        var DO_VALIDATION = true;

        // get a list of distinct protocol statuses
        var STATUS_LIST = ['<%= string.Join("', '",Caisis.UI.Modules.ProtocolMgmt.PatientProtocolController.PatientStatusSequence)  %>']

        function initFormScripts() {
             $("form1").addEvent("submit", function(e) {
                if(!validateForm(e)) {
                    stopBubble(e);
                    return false;
                }
            });
        }

        function initActivePanel(panelPrefix, panelSubIndex) {
            if ($(panelPrefix + 'Tab')) {
                setActivePanel(panelPrefix);
                // set sub tab
                if(panelSubIndex!=null) {
                    showSubTab(panelPrefix, panelSubIndex);
                }
            }
            else {
                setActivePanel('Screening');
            }
        }

        function setActivePanel(status) {
            // update hidden field for tracking fields during posts
            $('<%= ActiveStatusField.ClientID %>').value = status;
            var tabId = status + 'Tab';
            var panelId = status + 'StatusFields';
            
            var tab = $(tabId);
            // set tab as active
            if (activeTab && activeTab != tab) {
                activeTab.className = 'itemListRow';
            }
            activeTab = tab;
            activeTab.className = 'itemListRow_on';

            // show panel
            var panel = $(panelId);
            if (activePanel) { activePanel.style.display = 'none'; }
            activePanel = panel;
            activePanel.style.display = 'block';
        }

        // reloads the page with optional client message
        function reloadRegistration(a, b, c, status, subIndex, message) {
            // controls if page should be reloaded from outside frame to re-init all variables
            var safeReload = true;
            if (message && message != '') {
                safeReload = true;
                alert(message);
            }
            // call function in ProtocolIndex
            if (safeReload && window.parent && window.parent.parent.patientAssigned) {
                window.parent.parent.patientAssigned(a, b, c, status, subIndex);
            }
            else {
                // reload page
                window.location = window.location;
            }
        }

        // validate that if checking registration fields on right are not empty
        function validateRegistration() {
            var isValid = true;
            var regCheck = $('RegisteredStatus');
            // check registration is checked and not disabled
            if (regCheck.checked && !regCheck.disabled) {
                // validate registration fields on right completed
                isValid = $('RegisteredByField').value != '' && $('PhysicialField').value != '' && $('AuthSigned').checked && $('PrivatePractice').checked;
            }
            if (!isValid) {
                alert('Verify you have completed all of the Registration fields on the right.');
            }
            return isValid;
        }

        function validateStartTreatment() {

        }

        function validateOffStudyDate() {
            var isValid = true;
            var offCheck = $('OffStudyStatus');
            // validate that off study date entered
            if (offCheck.checked && !offCheck.disabled) {
                var dateField = $('OffStudyStatusDate');
                if (dateField.value == '') {
                    isValid = false;
                    alert('Please enter a valid Off Study Date.');
                }
            }
            return isValid;
        }

        function validateForm(e) {
            // allow for auto postbacks
            if (!DO_VALIDATION) { return true; }
            
            if (!validateRegistration()) {
                return false;
            }
            if (!validateOffStudyDate()) {
                return false;
            }
            var fields = ['ConsentedStatus', 'EligibleStatus', 'RegisteredStatus', 'OffStudyStatus'];
            var valid = new Array();
            // validate deletion of status records
            for (var i = 0; i < fields.length; i++) {
                var field = $(fields[i]);
                if (!field.checked && field.defaultChecked) {
                    valid.push(field.id.replace('Status', ''));
                }
            }
            // validate dates
            var statuses = fields.concat(['ScreenedStatus', 'OnStudyStatus', 'OffTreatmentStatus']);
            var emptyDates = [];
            var invalidDates = [];
            for (var i = 0; i < statuses.length; i++) {
                var status = statuses[i];
                var statusMessage = "- " + status.replace("Status",""); 
                var cb = $(status);
                var date = $(status + 'DateText');
                if (cb && date && cb.checked && !date.disabled) {
                    var dateValue = date.value;
                    // ok
                    if(dateValue == date.defaultValue) {
                    }
                    else if(dateValue == '') {
                        emptyDates.push(statusMessage);
                    }
                    else if(isFutureDate(new Date(dateValue))) {
                        invalidDates.push(statusMessage);
                    }
                }
            }
            // check empty dates
            if(emptyDates.length > 0) {
                var message = ["Please enter a date for the following field(s)."].concat(emptyDates).join("\n");
                alert(message)
                return false;
            }
            if(invalidDates.length > 0) {
                var message = ["The following field(s) have a future date.\ Are you sure you would like to proceed?"].concat(invalidDates).join("\n");
                return confirm(message)
            }
            // check off treatment | off study : validate delete
            var offStudyStatuses = ['OffStudyStatus', 'OffTreatmentStatus'];
            for (var i = 0; i < offStudyStatuses.length; i++) {
                var status = offStudyStatuses[i];
                var cb = $(status);
                var date = $(status + 'DateText');
                var statusText = getStatusText(status);
                var dateText = date.value;
                var defaultDateText = date.defaultValue;
                if(!cb.disabled && dateText != '' && dateText != defaultDateText) {
                    var ok = confirm("Placing the patient '" + statusText + "' will hide all non-dependent visits on or after '" + dateText + "'. Are you sure you would like to continue?");
                    // validate next
                    if(ok)
                        continue;
                    // cancel delete
                    else
                        return false;
                }
            }
            // check future dates
            if (valid.length == 0) {
                // validate on study
                if($('OnStudyStatus').checked) {
                    var onStudyValid = true; 
                    var onStudyErrorMessage = "Please enter a valid 'On Study' date. Cannot be greater than today's date.";     
                    var statusDateText = $('OnStudyStatusDate').value;            
                    if (statusDateText == '') {
                        onStudyValid = false;
                    }
                    else if(!$('OnStudyStatus').disabled) {
                        var today = new Date();
                        var checkDate = new Date(statusDateText);
                        // don't allow dates > today
                        onStudyValid = !isFutureDate(checkDate);
                    }
                    if(!onStudyValid) {
                        alert(onStudyErrorMessage);
                        return false;
                    }
                }
                return true;
            }
            else {
                return confirm('Are you sure you want to delete the following Status' + (valid.length > 1 ? 'es' : '') + '.\n' + valid.join('\n') + '.');
            }
        }

        function checkStatusDateEntered(cb, date) { if (date.value != '') { cb.checked = true; } }

        // check box when date values entered
        $(window).addEvent('load', function(e) {
            $(document).tag('INPUT.ItemDateField').foreach(function(date) {
                var cb = $(date.id.replace('DateText', ''));
                if (cb && !date.disabled) {
                    for (var j = 0; j < CHECK_DATE_EVENTS.length; j++) {
                        date.addEvent(CHECK_DATE_EVENTS[j], curry(checkStatusDateEntered, cb, date));
                    }
                }
            });
        });

        function loadEligibility() {
            parent.setActiveTab('PatientEligibility');
            return false;
        }

        function loadBaseline() {
            parent.setActiveTab('PatientBaseline');
            return false;
        }
   

	function showSubTab(prefix, index) {
	    for (var i = 0; i < 3; i++) {
	        var btn = $(prefix + 'Button_' + i);
	        var tab = $(prefix + 'Tab_' + i);
            if(btn && tab) {
	            if (i == index) {
	                btn.className = 'dataEntryButtonRed';
	                tab.style.display = 'block';
	            }
	            else {
	                btn.className = 'dataEntryButtonGray';
	                tab.style.display = 'none';
	            }
            }
	    }
        // update current subtab index
        $('<%= ActiveSubTabIndex.ClientID %>').value = index + "";

	    return false;
	}

	// udpates child data entry forms
	function updateChildDataEntry() {
	    var frame = window.frames['RandomizationFrame'];
	    if (frame && frame.doSavePage && window.isPageDirty) {
	        // only save inner frame if fields changed
	        if (isPageDirty(frame)) {
	            frame.doSavePage();
	            return false;
	        }
	    }
	    return true;
	}
	 
    function getStatusText(status) {
        var statusText = status.replace("Status","").replace(/([A-Z])/g, ' $1');
        return statusText;
    }

        /* ]]> */
    </script>

    <style type="text/css">
        #ConsentedTo
        {
            overflow: auto;
            height: 175px;
            width: 350px;
        }
        #ConsentedTo label
        {
        }
        td
        {
            vertical-align: top;
        }
        #ConsentPanel
        {
            float: left;
        }
        #RegistrationPanel
        {
            float: right;
        }
        #RegistrationFieldsTable tr > td
        {
            padding-top: 2px;
            padding-left: 15px;
        }
        #RegistrationFieldsTable tr > td:first-child
        {
            padding-left: 0;
        }
        #RegistrationFieldsTable input
        {
            margin-left: 0;
        }
        .registrationLabel
        {
            font-size: 12px;
            color: #222222;
        }
        .DataEntryPatientPanel
        {
            display: none;
            width: 450px;
        }
        .PatientPanelSection
        {
            width: 49%;
        }
        #StatusTable label
        {
            font-weight: bold;
            text-decoration: underline;
            cursor: pointer;
        }
        body
        {
            padding: 0px;
            margin: 0px;
            background-color: #ffffff;
        }
        .PatientPortalBody
        {
            background-image: url(images/PatientLayer_TopBorderWithTabBG.png);
            background-position: 0px -10px;
            background-repeat: repeat-x;
            vertical-align: top;
        }
        .PatientPortalBody_miniTabs
        {
            background-image: url(images/PatientLayer_TopBorderWithMiniTabBG.png);
            background-position: 0px -10px;
            background-repeat: repeat-x;
            vertical-align: top;
        }
        .PatientTitleBar
        {
            margin: 0px;
            color: #ffffff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            padding-left: 15px;
            margin-top: 7px;
            white-space: nowrap;
        }
        .PatientTabBar
        {
            margin: 0px;
            margin-top: 8px;
        }
        .PatientMiniTabBar
        {
            margin: 0px;
            margin-top: 7px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #000000;
            font-weight: bold;
            height: 30px;
        }
        .PatientTitleBarLabel
        {
            background-image: url(images/PatientTitleBarSeparatorLine.gif);
            background-position: 12px 2px;
            background-repeat: no-repeat;
            padding-left: 25px;
            padding-top: 4px;
            padding-bottom: 4px;
            color: #EDE3E2;
        }
        .PatientTabImage
        {
            margin: auto;
        }
        .dataEntryArea_Main
        {
            background-image: url(images/DataEntryAreaBG_TopLeft.gif);
            background-repeat: no-repeat;
        }
        .dataEntryArea_TopRight
        {
            background-image: url(images/DataEntryAreaBG_TopRight.gif);
            background-repeat: no-repeat;
            width: 9px;
        }
        .itemListRow
        {
            border: solid 1px #dddddd;
            background-color: #f9f9f9;
            border-bottom: none; /*          border-right: none;   */
            height: 40px;
            cursor: pointer;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #222222;
            font-weight: bold;
            vertical-align: middle;
            padding-left: 8px;
        }
        .itemListRow_on
        {
            border: solid 1px #979797;
            background-color: #ffffff;
            background-image: url(images/DataEntryItemRow_on.gif);
            background-repeat: no-repeat;
            border-bottom: none;
            border-right: none;
            height: 40px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #000000;
            font-weight: bold;
            vertical-align: middle;
            padding-left: 8px;
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
        .dataEntryBox
        {
            border: solid 1px #dddddd;
            background-color: #f9f9f9;
            padding: 13px 16px 23px 16px;
            margin-top: 10px;
            width: 70%;
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
        .ItemDateField
        {
            width: 100px;
            border: 1px solid #cccccc;
        }
        .StatusDateFields
        {
            display: inline;
            float: right;
            margin-right: 55px;
        }
        .StatusDescription
        {
            font-size: 14px;
            color: #444444;
            display: inline-block;
            margin-bottom: 5px;
        }
        #DataEntryPanels
        {
            width: 100%;
            height: 250px;
            padding: 20px;
            padding-left: 40px;
        }
        strong
        {
            color: #000000;
        }
        .StatusWarning
        {
            display: block;
            font-weight: bold;
            font-size: 13px;
            margin-top: 8px;
            margin-bottom: 8px;
            color: #8d282c;
        }
        #SchemaSelectPanel
        {
            overflow: auto;
            overflow-x: hidden;
            max-height: 150px;
            border: solid 1px #dddddd;
            background-color: #f8fafc;
        }
        .BatchPrintTable td
        {
            vertical-align: top;
            padding-top: 8px;
            padding-bottom: 8px;
            line-height: 11px;
        }
        .EligibiltyButtons
        {
             margin: 0px;
             padding: 0px;
             text-align: left;
        }
        .EligibiltyButtons li
        { 
            display: list-item;
            list-style-type: none;            
        }
        ol.EligibiltyButtons li
        {
            list-style-type: decimal;
            list-style-position:inside;
        }
        .EligibiltyButtons .dataEntryButtonGray,
        .EligibiltyButtons .dataEntryButtonRed
        {
            font-size: 11px;
            padding: 5px 2px;
            height: 15px;
            vertical-align: middle;
            /*margin: auto 5px;*/
            float: left;
            border-bottom: none;
            border-left-width: 0px;
            border-bottom-left-radius: 0px;
            border-bottom-right-radius: 0px;
            background-image: none;
            background-color: #eee;
            width: 140px;
        }
        .EligibiltyButtons li:first-child
        {
            border-left-width: 1px;
            width: 141px;
        }
        .EligibiltyButtons .dataEntryButtonGray
        {
            font-weight: normal;
            color: #444444;
        }
        .EligibiltyButtons .dataEntryButtonRed
        {
            font-weight: normal;
            /*background-color: #F9F9F9;*/
            background-color: #F9F9F9;
            color: #000000;
        }
        #UpdateBtn
        {
            display: block;
            margin: 15px auto auto 315px;
        }
        ul#ScheamaListReadOnly
        {
            margin: 2px 10px;
            padding: 0px 8px;
            list-style-type: circle;
        }
        ul#ScheamaListReadOnly li
        {
            font-weight: bold;
            color: #222;
        }
        .eligibiltyTab
        {
            display: none;
            background-color: #F9F9F9;
            border: 1px solid #bbb;
            padding: 10px;
            margin: 0px;
            width: 415px;
            height: 200px;
            clear: both;
        }
        #RandomizationBtn
        {
            display: block;
            width: 50%;
            margin: 5px auto;
            font-weight: bold;
        }
    </style>
</head>
<body onload="initFormScripts();">
    <form id="form1" runat="server">
    <cic:CaisisHidden runat="server" ID="PatientProtocolRegistrationIdField" />
    <cic:CaisisHidden runat="server" ID="SchemaIdField" />
    <asp:HiddenField runat="server" ID="ActiveStatusField" />
    <asp:HiddenField runat="server" ID="ActiveSubTabIndex" />
    <div style="margin: auto; width: 885px; padding-top: 5px; vertical-align: top;">
        <span style="font-size: 15px; display: inline;">&nbsp;Patient Status</span>
        <div style="display: inline; margin-left: 100px; font-weight: bold;">
            Date</div>
        <table id="Tabs" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 6px;">
            <tr>
                <td id="ScreeningTab" class="itemListRow" onclick="setActivePanel('Screening');">
                    <span class="StatusDateFields">
                        <cic:CaisisTextBox runat="server" ID="ScreenedStatusDateText" CssClass="ItemDateField"
                            ShowLabel="false" ShowCalendar="true" CalcDate="true" Table="PatientProtocolStatus"
                            Field="PtProtocolStatusDateText"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="ScreenedStatusDate" Table="PatientProtocolStatus"
                            Field="PtProtocolStatusDate" DisplayCalculatedDate="false" ShowLabel="true" ShowSpacer="false" />
                    </span>
                    <cic:CaisisHidden runat="server" ID="ScreeningStatusId" Table="PatientProtocolStatus"
                        Field="PatientProtocolStatusId" />
                    <cic:CaisisCheckBox runat="server" ID="ScreenedStatus" ShowLabel="false" Table="PatientProtocolStatus"
                        Field="PtProtocolStatus" />
                    Screened
                </td>
                <td rowspan="7" style="border-left: none; width: 521px; background-color: #ffffff;
                    border-bottom: solid 1px #dddddd; border-top: solid 1px #cccccc;" class="dataEntryArea_Main">
                    <%-- Data Entry Layers --%>
                    <div id="DataEntryPanels" style="position: relative;">
                        <div id="ScreeningStatusFields" class="DataEntryPatientPanel">
                            <span class="StatusDescription">A status of Screened denotes that the patient's medical
                                history has been reviewed to see if it is applicable to the study in question.</span>
                            <table id="ScreeningOptionsTable" style="margin-top: 12px; margin-bottom: 20px;">
                                <tr>
                                    <td style="width: 20px;">
                                        <asp:RadioButton GroupName="ScreeningOptionsGroup" ID="OptionPassed" runat="server" />
                                    </td>
                                    <td style="color: #222222; font-size: 12px; padding-bottom: 5px;">
                                        <label for="OptionPassed">
                                            Passed</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton GroupName="ScreeningOptionsGroup" ID="OptionFailed" runat="server" />
                                    </td>
                                    <td style="color: #222222; font-size: 12px;">
                                        <label for="OptionFailed">
                                            Failed</label>
                                        <div id="FailedReasonPanel" style="display: inline; font-weight: normal; padding-left: 20px;">
                                            <label for="OptionFailedReason">
                                                Reason</label>
                                            <cic:CaisisTextBox ID="OptionFailedReason" runat="server" Table="PatientProtocolStatus"
                                                Field="PtProtocolStatusReason" ShowLabel="false" Style="border: solid 1px #cccccc;
                                                width: 230px;"></cic:CaisisTextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color: #222222; font-size: 12px; font-weight: bold; padding-top: 20px;">
                                        <label for="ScreeningNotes" style="vertical-align: bottom;">
                                            Notes</label><br />
                                        <cic:CaisisTextArea ID="ScreeningNotes" ShowLabel="false" runat="server" ShowTextEditor="false"
                                            Width="90%" Height="100px" Style="border: solid 1px #cccccc;"></cic:CaisisTextArea>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="ConsentedStatusFields" class="DataEntryPatientPanel">
                            <span class="StatusDescription">A patient should be marked as Consented only if he or
                                she has signed the forms necessary to consent to this protocol.</span>
                            <table style="height: 100%; width: 99%;  margin-top: 10px;">
                                <tr>
                                    <td class="registrationLabel" style="width: 100px;">
                                        <label for="ConsentedByField">
                                            Consented by</label>
                                    </td>
                                    <td style="padding-bottom: 18px;">
                                        <cic:CaisisComboBox runat="server" ID="ConsentedByField" Table="PatientProtocolRegistration"
                                            Field="ConsentedBy" ShowLabel="false" LookupCode="Physician"></cic:CaisisComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="registrationLabel">
                                        Consented to
                                    </td>
                                    <td style="padding-bottom: 16px;">
                                        <div id="ConsentedTo">
                                            <cic:CaisisCheckBoxList runat="server" ID="ConsentOptions" Table="PatientProtocolRegistration"
                                                Field="ConsentedTo" ShowLabel="false" ShowOther="true" LookupCode="ProtocolMgmt_ConsentOptions">
                                            </cic:CaisisCheckBoxList>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="RegistrationPendingFields" class="DataEntryPatientPanel">
                            <span class="StatusDescription">Registration Pending</span>
                        </div>
                        <div id="EligibleStatusFields" class="DataEntryPatientPanel">
                            
                                    
                                    
                                    
                                  
                            <!-- Ramdomization -->
                            <ul id="EligibiltyButtons" class="EligibiltyButtons">
                                <li id="EligibiltyButton_0" class="dataEntryButtonRed" onclick="return showSubTab('Eligibilty', 0);">Eligibility Questionnaire</li>
                                <li id="EligibiltyButton_1" class="dataEntryButtonGray" onclick="return showSubTab('Eligibilty', 1);">Baseline EForm</li>
                            </ul>
                            <div id="EligibiltyTab_0" class="eligibiltyTab" style=" display: block;">
                                <asp:PlaceHolder runat="server" ID="EligibiltyCurrentStatus" Visible="true">
                                    <div>
                                        <span class="boldText">Current Status:</span>
                                        <asp:Label runat="server" ID="CurrentEligibilityStatus" Style="color: #8D2A2C;"></asp:Label>
                                    </div>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="EligibiltyIncomplete" Visible="true">
                                <span class="StatusDescription" style="font-size: 14px; font-weight: normal;">A patient
                                    is to be marked as Eligible when he/she fulfills both the test criteria and <a href="#"
                                        onclick="return loadEligibility();" style="color: #8d2a2c; text-decoration: underline;
                                        cursor: pointer;">Eligibility Questionnaire</a> for this protocol.</span>
                               </asp:PlaceHolder>
                               <asp:PlaceHolder runat="server" ID="EligibiltyComplete" Visible="false">
                                 <span class="StatusDescription" style="font-size: 14px; font-weight: normal;"><a href="#"
                                        onclick="return loadEligibility();" style="color: #8d2a2c; text-decoration: underline;
                                        cursor: pointer;">Eligibility Questionnaire Completed</a></span>
                               </asp:PlaceHolder>
                            </div>
                            <div id="EligibiltyTab_1" class="eligibiltyTab" style="text-align: center;">
                                <span class="dataEntryButtonGray" onclick="return loadBaseline();">Go To Baseline Form</span>
                            </div>
                           
                        </div>
                        <div id="RegisteredStatusFields" class="DataEntryPatientPanel">
                            <!-- Registration Tabs -->
                            <ol id="RegisteredButtons" class="EligibiltyButtons">
                                <li id="RegisteredButton_0" runat="server" class="dataEntryButtonRed" onclick="return showSubTab('Registered', 0);">
                                    Baseline Data</li>
                                <li id="RegisteredButton_1" runat="server" class="dataEntryButtonGray" onclick="return showSubTab('Registered', 1);">
                                    Registration Details</li>
                                <li id="RegisteredButton_2" runat="server" class="dataEntryButtonGray" onclick="return showSubTab('Registered', 2);">
                                    Schema Registration</li>
                            </ol>                            
                            <!-- Randomization Details (optional) -->
                            <div runat="server" id="RegisteredTab_0" class="eligibiltyTab" style="display: block;">
                                <iframe id="RandomizationFrame" name="RandomizationFrame" src="<%= GetQueryString("PatientRandomization.aspx") %>" frameborder="0"
                                    style="width: 100%; height: 100%; display: block; overflow: hidden;"></iframe>
                            </div>
                            <!-- Registration Details -->
                            <div  runat="server" id="RegisteredTab_1" class="eligibiltyTab">
                                <table cellpadding="5" cellspacing="0" border="0">
                                <tr>
                                    <td>
                                        <table id="RegistrationFieldsTable" cellpadding="1" cellspacing="0">
                                            <tr>
                                                <td class="registrationLabel">
                                                    <label for="PtRegistrationAge">
                                                        Patient Age at Registration</label>
                                                </td>
                                                <td>
                                                    <cic:CaisisTextBox runat="server" ID="PtRegistrationAge" Table="PatientProtocolRegistration"
                                                        Field="PtRegistrationAge" ShowLabel="false" CssClass="ProtocolMgmtTitleSmall"
                                                        Width="50px"></cic:CaisisTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="registrationLabel">
                                                    <label for="RegisteredByField">
                                                        Registered By</label>
                                                </td>
                                                <td>
                                                    <cic:CaisisComboBox runat="server" ID="RegisteredByField" Table="PatientProtocolRegistration"
                                                        Field="RegisteredBy" LookupCode="Physician" ShowLabel="false"></cic:CaisisComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="registrationLabel">
                                                    <label for="PhysicialField">
                                                        Physician Of Record</label>
                                                </td>
                                                <td>
                                                    <cic:CaisisComboBox runat="server" ID="PhysicialField" Table="PatientProtocolRegistration"
                                                        Field="PhysicianOfRecord" LookupCode="Physician" ShowLabel="false"></cic:CaisisComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="registrationLabel">
                                                    <label for="AuthSigned">
                                                        Research Authorization Signed</label>
                                                </td>
                                                <td>
                                                    <cic:CaisisCheckBox runat="server" ID="AuthSigned" Table="PatientProtocolRegistration"
                                                        Field="ResearchAuthorizationSigned" ShowLabel="false" CssClass="ProtocolMgmtTitleSmall"
                                                        TextAlign="Right"></cic:CaisisCheckBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="registrationLabel">
                                                    <label for="PrivatePractice">
                                                        Private Practice Notice Signed</label>
                                                </td>
                                                <td>
                                                    <cic:CaisisCheckBox runat="server" ID="PrivatePractice" Table="PatientProtocolRegistration"
                                                        Field="PrivacyPracticeNoticeVerified" ShowLabel="false" CssClass="ProtocolMgmtTitleSmall"
                                                        TextAlign="Right"></cic:CaisisCheckBox>
                                                </td>
                                            </tr>                                           
                                            <tr>
                                                <td colspan="2">
                                                    <asp:RangeValidator ID="AgeAtScreeningValidator" runat="server" ControlToValidate="PtRegistrationAge"
                                                        MinimumValue="0" MaximumValue="500" Type="Integer" Display="Dynamic" EnableClientScript="true"
                                                        ErrorMessage="Please enter a valid age."></asp:RangeValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <asp:Button runat="server" ID="SaveRequiredRegistionBtn" CssClass="dataEntryButtonGray" Text="Next Step" OnClick="UpdateRegistrationClick" OnClientClick="showSubTab('Registered', 2);" />
                            </div>
                            <div runat="server" id="RegisteredTab_2" class="eligibiltyTab">
                                <asp:Panel runat="server" ID="StandardTreatmentPanel" style="margin-bottom: 5px;">
                                    <label for="TreatmentArm" class="boldText">
                                        Treatment Arm:
                                    </label>
                                    <asp:Label runat="server" ID="SelectedSchema" CssClass="ProtocolMgmtTitleSmall" OnPreRender="SetSelectedSchema"></asp:Label>
                                    <asp:CheckBox runat="server" ID="RandomizeCheckBox" Text="Randomize" OnCheckedChanged="SetRandomTrail"
                                      AutoPostBack="true" onclick="DO_VALIDATION = false;" />
<%--                                    <asp:Button runat="server" ID="RandomizeBtn" Text="Randomize" CssClass="dataEntryButtonGray"
                                        OnClick="SetRandomTrail" style="display: none;" />
--%>                                </asp:Panel>
                                <!-- custom randomization -->
                                <asp:Panel ID="CustomRandomizationPanel" runat="server" Visible="false">
                                    <span class="boldText">Stratum:
                                        <asp:Label runat="server" ID="RandomizationText" CssClass="boldText"></asp:Label></span>
                                    <asp:Button runat="server" ID="RandomizationBtn" OnClick="SetRandomTrial" Text="Get Randomized Schema"
                                        CssClass="dataEntryButtonGray" />
                                </asp:Panel>
                                <asp:Label runat="server" ID="CustomizedRandomText" Visible="false" CssClass="smallPrint boldText"></asp:Label>
                                <asp:Panel runat="server" ID="SchemaSelectPanel">
                                    <cic:CaisisRadioButtonList runat="server" ID="ScheamaList" ShowLabel="false" ShowEmptyListItem="false"
                                        DataTextField="ProtocolArmDescription" DataValueField="ProtocolSchemaId" RepeatLayout="Table"
                                        RepeatColumns="1" Style="width: 420px">
                                    </cic:CaisisRadioButtonList>
                                    <asp:Repeater runat="server" ID="ScheamaListReadOnly" Visible="false">
                                        <HeaderTemplate>
                                            <ul id="ScheamaListReadOnly">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <li>
                                                <%# Eval("SchemaDescription")%> (v<%# Eval("VersionNum")%>)
                                            </li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </asp:Panel>
                            </div>
                        </div>
                        <div id="OnStudyStatusFields" class="DataEntryPatientPanel">
                            <span class="StatusDescription">The On Study date refers to the day begins the protocol.
                                When this status is assigned to the patient, the system will calculate the anticipated
                                schedule for the patient based upon the schema outlined in the study.<br />
                            </span>
                            <asp:Label runat="server" ID="OnStudyNoRegistrationWarning" OnPreRender="SetOnStudyWarning"
                                CssClass="StatusWarning">
                            This Patient must be "Registered" before going "On Study".
                            </asp:Label>
                            <asp:Label runat="server" ID="OnStudyNoQuestionnaireWarning" OnPreRender="SetOnStudyWarning"
                                CssClass="StatusWarning">
                            The <a href="#" onclick="return loadEligibility();" style="color: #8d2a2c; text-decoration: underline;
                                    cursor: pointer;">Eligibility Questionnaire</a> must be completed before going "On Study".
                            </asp:Label>
                        </div>
                        <div id="OffTreatmentStatusFields" class="DataEntryPatientPanel">
                            <span class="StatusDescription">This status is assigned when the patient goes off treatment
                                for any reason.<br />
                                Please specify the reason below.</span>
                            <table>
                                <tr>
                                    <td style="height: 34px; color: #222222; font-size: 12px;">
                                        <label for="OffTreatmentStatusReason">
                                            Reason</label>
                                    </td>
                                    <td style="padding-left: 6px;">
                                        <cic:CaisisComboBox runat="server" ID="OffTreatmentStatusReason" ShowLabel="false" Table="PatientProtocolStatus"
                                            Field="PtProtocolStatusReason" LookupCode="ProtStatusReason"></cic:CaisisComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="OffStudyStatusFields" class="DataEntryPatientPanel">
                            <span class="StatusDescription">This status is assigned when the patient goes off study
                                for any reason.<br />
                                Please specify the reason below.</span>
                            <table>
                                <tr>
                                    <td style="height: 34px; color: #222222; font-size: 12px;">
                                        <label for="OffStudyReason">
                                            Reason</label>
                                    </td>
                                    <td style="padding-left: 6px;">
                                        <cic:CaisisComboBox runat="server" ID="OffStudyStatusReason" ShowLabel="false" Table="PatientProtocolStatus"
                                            Field="PtProtocolStatusReason" LookupCode="ProtStatusReason"></cic:CaisisComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
                <td rowspan="7" class="dataEntryArea_TopRight" style="background-color: #ffffff;
                    border-bottom: solid 1px #dddddd; border-right: solid 1px #cccccc; border-top: solid 1px #cccccc;">
                    <img src="images/shim.gif" style="width: 9px; height: 1px;">
                </td>
            </tr>
            <tr>
                <td id="ConsentedTab" class="itemListRow" onclick="setActivePanel('Consented');">
                    <span class="StatusDateFields">
                        <cic:CaisisTextBox runat="server" ID="ConsentedStatusDateText" ShowLabel="false"
                            Table="PatientProtocolStatus" Field="PtProtocolStatusDateText" CssClass="ItemDateField"
                            ShowCalendar="true" CalcDate="true"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="ConsentedStatusDate" Table="PatientProtocolStatus"
                            Field="PtProtocolStatusDate" DisplayCalculatedDate="false" ShowLabel="true" ShowSpacer="false" />
                    </span>
                    <cic:CaisisHidden runat="server" ID="ConsentedStatusId" Table="PatientProtocolStatus"
                        Field="PatientProtocolStatusId" />
                    <cic:CaisisCheckBox runat="server" ID="ConsentedStatus" ShowLabel="false" Table="PatientProtocolStatus"
                        Field="PtProtocolStatus" OnCheckedChanged="DeleteStatusOnUncheck" />
                    Consented
                </td>
            </tr>
            <tr>
                <td id="EligibleTab" class="itemListRow" onclick="setActivePanel('Eligible');">
                    <span class="StatusDateFields">
                        <cic:CaisisTextBox runat="server" ID="EligibleStatusDateText" ShowLabel="false" Table="PatientProtocolStatus"
                            Field="PtProtocolStatusDateText" CssClass="ItemDateField" ShowCalendar="true"
                            CalcDate="true"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="EligibleStatusDate" Table="PatientProtocolStatus"
                            Field="PtProtocolStatusDate" DisplayCalculatedDate="false" ShowLabel="true" ShowSpacer="false" />
                    </span>
                    <cic:CaisisHidden runat="server" ID="EligibleStatusId" Table="PatientProtocolStatus"
                        Field="PatientProtocolStatusId" />
                    <cic:CaisisCheckBox runat="server" ID="EligibleStatus" ShowLabel="false" Table="PatientProtocolStatus"
                        Field="PtProtocolStatus" OnCheckedChanged="DeleteStatusOnUncheck" />
                    Eligible
                </td>
            </tr>
            <tr>
                <td id="RegisteredTab" class="itemListRow" onclick="setActivePanel('Registered');">
                    <span class="StatusDateFields">
                        <cic:CaisisTextBox runat="server" ID="RegisteredStatusDateText" ShowLabel="false"
                            Table="PatientProtocolStatus" Field="PtProtocolStatusDateText" ShowCalendar="true"
                            CssClass="ItemDateField" CalcDate="true"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="RegisteredStatusDate" Table="PatientProtocolRegistration"
                            Field="PtProtocolStatusDate" DisplayCalculatedDate="false" ShowLabel="false"
                            ShowSpacer="false" />
                    </span>
                    <cic:CaisisHidden runat="server" ID="RegisteredStatusId" Table="PatientProtocolStatus"
                        Field="PatientProtocolStatusId" />
                    <cic:CaisisCheckBox runat="server" ID="RegisteredStatus" ShowLabel="false" Table="PatientProtocolStatus"
                        Field="PtProtocolStatus" OnCheckedChanged="DeleteStatusOnUncheck" />
                    Registered&nbsp;
                    <img title="Registration for the protocol denotes the formal inclusion of the patient in the study. The treatment arm and authorization details must be logged." alt="Registration Info" src="../../Images/icon_info.png" class="infoIcon" />
                </td>
            </tr>
            <tr>
                <td id="OnStudyTab" class="itemListRow" onclick="setActivePanel('OnStudy');">
                    <span class="StatusDateFields">
                        <cic:CaisisTextBox runat="server" ID="OnStudyStatusDateText" ShowLabel="false" CssClass="ItemDateField"
                            ShowCalendar="true" CalcDate="true" Table="PatientProtocolStatus" Field="PtProtocolStatusDateText" OnValueChanged="TrackOnStudyDateChange" Enabled="false"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="OnStudyStatusDate" Table="PatientProtocolStatus"
                            Field="PtProtocolStatusDate" DisplayCalculatedDate="false" ShowLabel="false"
                            ShowSpacer="false" />
                    </span>
                    <cic:CaisisHidden runat="server" ID="OnStudyStatusId" Table="PatientProtocolStatus"
                        Field="PatientProtocolStatusId" />
                    <cic:CaisisCheckBox runat="server" ID="OnStudyStatus" ShowLabel="false" Table="PatientProtocolStatus"
                        Field="PtProtocolStatus" Enabled="false" />
                    On Study
                </td>
            </tr>
            <tr>
                <td id="OffTreatmentTab" class="itemListRow" onclick="setActivePanel('OffTreatment');">
                    <span class="StatusDateFields">
                        <cic:CaisisTextBox runat="server" ID="OffTreatmentStatusDateText" ShowLabel="false"
                            Table="PatientProtocolStatus" Field="PtProtocolStatusDateText" ShowCalendar="true"
                            CssClass="ItemDateField" CalcDate="true"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="OffTreatmentStatusDate" Table="PatientProtocolStatus"
                            Field="PtProtocolStatusDate" DisplayCalculatedDate="false" ShowLabel="false"
                            ShowSpacer="false" />
                    </span>
                    <cic:CaisisHidden runat="server" ID="OffTreatmentStatusId" Table="PatientProtocolStatus"
                        Field="PatientProtocolStatusId" />
                    <cic:CaisisCheckBox runat="server" ID="OffTreatmentStatus" ShowLabel="false" Table="PatientProtocolStatus"
                        Field="PtProtocolStatus" OnCheckedChanged="DeleteStatusOnUncheck" />
                    Off Treatment
                </td>
            </tr>
            <tr>
                <td id="OffStudyTab" class="itemListRow" onclick="setActivePanel('OffStudy');">
                    <span class="StatusDateFields">
                        <cic:CaisisTextBox runat="server" ID="OffStudyStatusDateText" ShowLabel="false" Table="PatientProtocolStatus"
                            Field="PtProtocolStatusDateText" ShowCalendar="true" CssClass="ItemDateField"
                            CalcDate="true"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="OffStudyStatusDate" Table="PatientProtocolStatus"
                            Field="PtProtocolStatusDate" DisplayCalculatedDate="false" ShowLabel="false"
                            ShowSpacer="false" />
                    </span>
                    <cic:CaisisHidden runat="server" ID="OffStudyStatusId" Table="PatientProtocolStatus"
                        Field="PatientProtocolStatusId" />
                    <cic:CaisisCheckBox runat="server" ID="OffStudyStatus" ShowLabel="false" Table="PatientProtocolStatus"
                        Field="PtProtocolStatus" OnCheckedChanged="DeleteStatusOnUncheck" />
                    Off Study
                </td>
            </tr>
        </table>
        <asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="Images/Button_Save.png"
            OnClick="UpdateRegistrationClick" OnClientClick="return updateChildDataEntry();" />
        <asp:Button runat="server" ID="UpdatePostBtn" OnClick="UpdateRegistrationClick" style="display: none;" />
    </div>
    </form>
</body>
</html>
