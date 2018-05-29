<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientScreening.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientScreening" %>

<%@ Register TagPrefix="ajax" Namespace="Caisis.UI.ClientScript.Ajax" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PatientScreening</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        
        jQuery.noConflict();

        // on load
        jQuery(document).ready(function() {
            var datasetInstitution = jQuery("#NewPatientInstitutionSelect");
            var orgStudyIdsField = jQuery("#OrganizationStudyIds");
            var studyIdField = jQuery("#StudyID");
            var updateStudyId = function() {
             var studyId = orgStudyIdsField.val();
                studyIdField.val(studyId);
            };
            // update study id when organization selected
            orgStudyIdsField.change(updateStudyId);
            // when selecting dataset institution, sync study id organization
            datasetInstitution.change(function() {
                var institution = jQuery.trim(jQuery(this).find(":selected").text());
                var foundOrganization = orgStudyIdsField.find("option").filter(function() {
                    var organization =  jQuery(this).text();
                    return jQuery.trim(organization) == institution;
                });
                if(foundOrganization.size()>0) {
                    foundOrganization.attr("selected", "selected");
                    updateStudyId();
                }
            });

            initFormScripts();
        });

        function initFormScripts() {
             $("form1").addEvent("submit", function(e) {
                if(!validatePatient(e)) {
                    stopBubble(e);
                    return false;
                }
            });
        }
        
        var PATIENT_AJAX_SEARCH = '<%= GetQueryString("ProtocolPatientCallbacks.aspx") %>';
        var SCREENING_HEIGHT_OFFSET = 140;
        var INITAL_PARTICIPANT_ID = '<%= ParticipantIdField.Text %>';

        function onWindowResize() {
            var winHeight = getHeight(window);
            //           $('PatientPanel').style.height = Math.max(winHeight - SCREENING_HEIGHT_OFFSET, 100) + 'px';
            $('contentContainer').style.height = Math.max(winHeight - SCREENING_HEIGHT_OFFSET, 200) + 'px';


        }

        function saveAndClose() {
            parent.reloadListAndCalendar();
            parent.hidePatientPortal();
        }

        function doSearch(e) {
            choosePatient('', '', '', '');
            var searchTerm = $('FindPatientSearch').value;
            // min search length
            if (searchTerm.length >= 1) {
                populatePatientSearch(searchTerm);
            }
            // otherwise cancel user event to prevent post, i.e., click
            if (e) { stopBubble(e); }
            return false;
        }

        function closeSearchResults() {
            var searchLayer = jQuery('#SearchResults');
            var searchLayerContent = jQuery('#SearchResultsContent');
            searchLayerContent.empty();
            searchLayer.css('display', 'none');
            return false;
        }

        function showSelectedPatient(show) {
            var ptSelectedPanel = jQuery('#PtSelectedPanel');
            if (show) ptSelectedPanel.css('display', 'block');
            else ptSelectedPanel.css('display', 'none');
        }

        function activatePanel(a, b) {
            enableInputFields($(a));
            deactivatePanel($(b));
        }

        function deactivatePanel(p) {
            if ($(p)) disableInputFields($(p));
        }

        function choosePatient(pid, name, dob, mrn) {
            $('epid').value = pid;
            if (pid != '') {
                // make call to server to get patient's participation id
                populateParticipantId(pid);
            }

            // set fields
            setCurrentPatient(name, dob, mrn, false);
            if (pid != '') showSelectedPatient(true);
            else showSelectedPatient(false);
            closeSearchResults();
            return false;
        }

        function setCurrentPatient(name, dob, mrn, isNew) {
            var ptNameSelect = jQuery('#PtNameSelect');
            ptNameSelect.text(name);
            var ptDOBSelect = jQuery('#PtDOBSelect');
            ptDOBSelect.text(dob);
            var ptMRNSelect = jQuery('#PtMRNSelect');
            ptMRNSelect.text(mrn);
            var ptSelectPanel = jQuery('#PtSelectedPanel');
            ptSelectPanel.show();
        }

        function setDeidentifiedFields(disable) {
            $('DeidentifiedCheck').checked = disable;
            $('NewFirstName').disabled = disable;
            $('NewLastName').disabled = disable;
            $('NewMRN').disabled = disable;
            if (disable) { resetNewPatientFields(); }
        }

        function resetNewPatientFields() {
            jQuery('#NewFirstName').val('');
            jQuery('#NewLastName').val('');
            jQuery('#NewMRN').val('');
        }

        function setClinicPatient(sel) {
            clearFoundPatient();
            var pat = getSelectText(sel);
            var epid = getSelectValue(sel);
            if (epid != '') {
                jQuery('#FindPatientSearch').val(pat);
                doSearch();
                //choosePatient(epid, pat, '', '');
            }
        }

        // invoke a remote search with form params, invoke callback when data return
        // @clientParams: object representing key value pairs to post to server
        // @callback: function(data) { } ... function which receives remote data
        function _doPatientAjaxCallback(clientParams, callback) {
            // make ajax call
            jQuery.post(PATIENT_AJAX_SEARCH, clientParams, function(data) {
                // invoke callback
                if (callback) {
                    callback(data);
                }
            });
        }
        
        function populatePatientSearch(searchTerm) {
            var searchType = $('<%= SeachTypeParticipantID.ClientID %>') != null && $('<%= SeachTypeParticipantID.ClientID %>').checked ? '<%= PROTOCOL_PARTICIPANT_ID_CODE %>' : '';
            var searchParams = 
            {
                'methodName' : 'PatientSearch',
                'searchType' : searchType,
                'searchTerm' : searchTerm
            };
            _doPatientAjaxCallback(searchParams, function(data) {
                var searchLayer = jQuery('#SearchResults');
                var searchLayerContent = jQuery('#SearchResultsContent');
                var remoteResultsGrid = jQuery(data).find('#PatientResults');
                var remoteSingleResult = jQuery(data).find('#PatientResults_Single').val();
                var remoteRecordCount = remoteResultsGrid.find('tr').size();
                if (remoteSingleResult != '') {
                    eval(remoteSingleResult);
                    showSelectedPatient(true);
                }
                else {
                    showSelectedPatient(false);
                    // clear search results, and fill with remote results
                    searchLayerContent.empty();
                    searchLayerContent.append(remoteResultsGrid);
                    if (remoteRecordCount == 0) {
                        alert('No Patient Found.');
                    }
                    else {
                        searchLayer.css('display', 'block');
                        //searchLayer.center();
                    }
                }
            });
        }

        function populateClinicPatients(sel) {
            // clear current clinic list
            var clinicListSelect = jQuery('#ClinicPatientList');
            clinicListSelect.empty();
            var clinicName = jQuery(sel).val();
            if (clinicName != '') {
                var clientParams =
                {
                    'methodName': 'GetClinicPatients',
                    'clinicName': clinicName
                };
                // make ajax call to fill clinic list
                _doPatientAjaxCallback(clientParams, function(data) {
                    var remoteResults = jQuery(data).find('#ClinicPatients');
                    var clinicListItems = remoteResults.find('option');
                    // populate with new remote list (plus empty item)
                    clinicListSelect.append('<option value=""></option>');
                    clinicListSelect.append(clinicListItems);
                    clinicListSelect.val('');
                });
            }
        }
        
        function populateParticipantId(epid) {
            var clientParams = 
            {
                'methodName' : 'GetParticipantId',
                'patientId' : epid
            };
            _doPatientAjaxCallback(clientParams, function(data) {
                var pid = jQuery(data).find('#ParticipantId').val(); ;
                var pidText = '';
                if (pid && pid != '') {
                    pidText = pid;
                }
                else {
                    pidText = INITAL_PARTICIPANT_ID + ' (anticipated)';
                }
                jQuery('#<%= ParticipantIdField.ClientID %>').text(pidText);
            });
        }

        // clean found patient text fields and search box
        function clearFoundPatient() {
            choosePatient('', '', '', '');
            jQuery('#FindPatientSearch').val('');
        }

        // Validates that a patient has been choosen
        function validatePatient(e) {
            var invalid = new Array();

            // validate new patient
            var newPatient = jQuery("#AddNewPatient");
            var isNewPatient = newPatient.is(":checked");
            if(isNewPatient) {
                var selection = jQuery("#NewPatientInstitutionSelect");
                // if Institution selection is valid, validate
                if(selection.size() > 0) {
                    var selecedInstitution = selection.val();
                    if(selecedInstitution == null || selecedInstitution == "") {
                        invalid.push("An Institution is required for adding a patient.");
                    }
                }
            }

            // Validate pass/fail
            var checkStudyId = false;
            if (!$('ScreeningPassed').checked && !$('ScreeningFailed').checked) {
                invalid.push('Please select PASSED or FAILED.');
            }
            else if ($('ScreeningPassed').checked) {
                checkStudyId = true;
                if ($('FindExistingPatient') && $('FindExistingPatient').checked) {
                    if ($('epid').value == '') {
                        invalid.push('Please search for an existing patient.');
                    }
                }
            }
            // validate study id
            if (checkStudyId && !validateStudyId($('<%= StudyID.ClientID %>'))) {
                invalid.push('Please enter a valid Study ID.');
            }
            // validate screen date
            if  ($("ScreeningDate").value == '') {
                invalid.push('Please enter a valid screening date.');
            }

            // if user not validated, prompt with reason, stop form submit
            if (invalid.length > 0) {
                alert('- ' + invalid.join('\n- ')); return false;
            }
            // otherwise, ok to submit
            else {
                return true;
            }
        }

        function choosePassed() {
            jQuery('#PassedPanel').css('display', '');
            jQuery('#ContinueBtn').show();
            jQuery('#FailedPanel').hide();
            jQuery('#ReasonFailedPanel').css('display', 'none');
            //jQuery('#ageIDHolder').css('display', '');
            jQuery('#studyIDHolder').css('display', '');
        }

        function chooseFailed() {
            jQuery('#PassedPanel').hide();
            jQuery('#ContinueBtn').hide();
            jQuery('#FailedPanel').css('display', '');
            jQuery('#ReasonFailedPanel').css('display', '');
            //jQuery('#ageIDHolder').css('display', 'none');
            jQuery('#studyIDHolder').css('display', 'none');
        }

        function chooseNewPatient() {
            jQuery('#NewPatientPanel').show();
            jQuery('#FindExistingPanel').hide();
        }

        function chooseFindPatient() {
            jQuery('#NewPatientPanel').hide();
            jQuery('#FindExistingPanel').show();
            choosePatient('', '', '', '');
        }

        function initScriptEvents(e) {
            var screenPassedRadio = $('ScreeningPassed');
            var screenFailedRadio = $('ScreeningFailed');
            var newPatientRadio = $('AddNewPatient');
            var findPatientRadio = $('FindExistingPatient');

            if (screenPassedRadio.checked) {
                choosePassed();
                if (newPatientRadio && newPatientRadio.checked) {
                    chooseNewPatient();
                } else if (findPatientRadio && findPatientRadio.checked) {
                    chooseFindPatient();
                }
            }
            else if (screenFailedRadio.checked) {
                chooseFailed();
            }
            // Add click events to sync display fields
            screenPassedRadio.addEvent('click', choosePassed);
            screenFailedRadio.addEvent('click', chooseFailed);
            if (newPatientRadio) {
                newPatientRadio.addEvent('click', chooseNewPatient);
            }
            if (findPatientRadio) {
                findPatientRadio.addEvent('click', chooseFindPatient);
            }
        }
        
        function validateStudyId(field, showAlert) {
            var value = field.value;
            var studyId = value;// parseInt(value, 10).toString();
            if (value.length == 0) { // || studyId == 'NaN') {
                if (showAlert)
                    alert('Please enter a valid Study Id');
                return false;
            }
            else {
                field.value = studyId;
                return true;
            }
        }

        // setup events for various radiobuttons
        window.addEvent('load', initScriptEvents);
        /* ]]> */
    </script>

    <style type="text/css">
        .PatientPanelSection
        {
            width: 100%;
            margin: auto;
        }
        .PatientPanel
        {
            /*            height: 280px;
*/
            margin: auto;
            padding: 10px;
        }
        #SchemaPanel
        {
            height: 25px;
            margin: auto auto 5px auto;
        }
        #ScreeningOptionsTable td
        {
            padding-top: 5px;
            vertical-align: top;
        }
        #UpdateBtn
        {
            float: right;
            margin-top: 5px;
        }
        #SearchResults
        {
            margin: auto;
            z-index: 10;
            cursor: pointer;
            margin-top: 0px;
            overflow: auto;
            overflow-x: hidden;
        }
        #SearchResultsContent
        {
            border: 1px solid #aaaaaa;
            width: 99%;
            overflow: auto;
            overflow-x: hidden;
            overflow-y: scroll;
            max-height: 96px;
        }
        h1
        {
            font-size: 15px;
            color: #222222;
            margin: 0px;
            line-height: 15px;
            font-weight: bold;
        }
        .dataGridItemRowA:hover
        {
            background-color: #E3CFCF;
        }
        .dataGridItemRowA:hover td
        {
            color: #000000;
        }
        .dataGridItemRowB:hover
        {
            background-color: #E3CFCF;
        }
        .dataGridItemRowB:hover td
        {
            color: #000000;
        }
        .disabledFields
        {
            background-color: #eeeeee;
        }
        #selectedPatientTable
        {
            background-color: #efefef;
            border: 1px solid #8d2a2c;
        }
        #selectedPatientTable td
        {
            border-bottom: solid 1px #e6e6e6;
        }
        .redText
        {
            color: #8d2a2c;
            font-size: 12px;
            font-weight: bold;
        }
        .infoIcon
        {
            cursor: pointer;
            vertical-align: middle;
        }
    </style>
</head>
<body class="PatientPortalBody_miniTabs">
    <form id="form1" runat="server">
    <div id="PatientPortalHeaderBar" class="PatientTitleBar" style="height: 60px; margin-top: 6px;">
        Screen / Assign Patient
    </div>
    <div id="contentContainer" style="max-width: 900px; margin: auto; padding: 5px 50px 5px 50px; height: 350px; overflow: auto; overflow-x: hidden; position: relative;">
        <asp:Label runat="server" ID="ErrorMessage" CssClass="redText"></asp:Label>
        
        
        <div id="DeIdentifiedNotice" runat="server" visible="false" style="color: #8d2a2c;
            font-size: 12px; margin: 15px 0px 25px 0px;">
            Note:&nbsp;&nbsp;All patients have been de-identified. To track this patient after
            screening, please note the patient's identity along with the Screening ID and Study
            ID.
        </div>
        <div id="IdentityPanel" runat="server" style="display: block;">
            <table cellpadding="4" cellspacing="0" width="100%">
                <tr>
                    <td class="ProtocolMgmtTitle">
                        1. Select Patient
                    </td>
                </tr>
            </table>
            <div class="PatientPanel" style="width: 100%;">
                <div runat="server" id="FindPatientFields" style="width: 100%;">
                    <table cellpadding="4" cellspacing="0" width="100%">
                        <tr>
                            <td style="width: 85px; padding-top: 8px; font-weight: bold; padding-left: 0px;">Patient is a(n)</td>
                            <td style="padding-top: 6px;">
                                <cic:CaisisRadioButton runat="server" ID="FindExistingPatient" ShowLabel="false"
                                    GroupName="ChoosePatient" Checked="true" Text="Existing Patient" CssClass="boldText" />
                                <cic:CaisisRadioButton runat="server" ID="AddNewPatient" ShowLabel="false" GroupName="ChoosePatient"
                                    Text="New Patient" CssClass="boldText" />
                            </td>
                        </tr>
                    </table>
                    <div id="NewPatientPanel" style="display: none; margin-top: 14px; padding-left: 0px;">
                        <span style="font-weight: bold;">
                            New Patient Information</span>
                            <table id="NewPatientFields" cellspacing="0" cellpadding="4" style="width: 400px;
                                margin-top: 10px; border: solid 1px #efefef; background-color: #FBFCFD;">
                                <asp:PlaceHolder runat="server" ID="NewPatientSection"><tr>
                                    <td style="width: 125px;">
                                        <label for="NewFirstName">
                                            First Name
                                        </label>
                                    </td>
                                    <td>
                                        <cic:CaisisTextBox ShowLabel="false" ID="NewFirstName" runat="server" Style="width: 240px;"></cic:CaisisTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="NewLastName">
                                            Last Name
                                        </label>
                                    </td>
                                    <td>
                                        <cic:CaisisTextBox ShowLabel="false" ID="NewLastName" runat="server" Style="width: 240px;"></cic:CaisisTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="NewMRN">
                                            MRN
                                        </label>
                                    </td>
                                    <td>
                                        <cic:CaisisTextBox ShowLabel="false" ID="NewMRN" runat="server"></cic:CaisisTextBox>
                                    </td>
                                </tr></asp:PlaceHolder>
                                <tr runat="server" id="NewPatientInstitution" visible="false">
                                    <td>
                                        <label for="NewPatientInstitutionSelect">
                                            Institution * (required)
                                        </label>
                                    </td>
                                    <td>
                                        <cic:CaisisSelect runat="server" ID="NewPatientInstitutionSelect" ShowLabel="false"
                                            DataTextField="Text" DataValueField="Value">
                                        </cic:CaisisSelect>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                           <%= PROTOCOL_PARTICIPANT_ID_CODE %>
                                        <img class="infoIcon" src="../../Images/icon_info.png" alt="<%= PROTOCOL_PARTICIPANT_ID_CODE %>"
                                            title="A system generated  Id assigned to a patient one time to uniquely identify them across multiple studies." />
                                    </td>
                                    <td>
                                        
                                        <span id="NewParticipantIDDisplay">
                                            <%= ParticipantIdField.Text %></span>
                                    </td>
                                </tr>
                            </table>
                    </div>
                    <div id="FindExistingPanel" style="margin-top: 14px;">
                        <span style="font-weight: bold;">Select Existing Patient</span>
                        <table cellpadding="0" cellspacing="4" style="margin-top: 10px; border: solid 1px #efefef;
                            background-color: #FBFCFD;">
                            <tr><asp:PlaceHolder runat="server" ID="SearchByClinicSection">
                                <td style="padding-left: 12px; padding-right: 12px; border-right: solid 1px #efefef;">
                                    <span style="font-weight: bold;">
                                        Search by clinic</span>
                                        <table style="width: 100%; margin-top: 11px;" cellspacing="0" cellpadding="2">
                                            <tr>
                                                <td style="width: 65px;">
                                                    <label for="FindPatientClinic">
                                                        Clinic
                                                    </label>
                                                </td>
                                                <td>
                                                    <cic:CaisisSelect runat="server" ID="FindPatientClinic" ShowLabel="false" DataTextField="ApptPhysician"
                                                        DataValueField="ApptPhysician" Width="200" onchange="populateClinicPatients(this);">
                                                    </cic:CaisisSelect>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="ClinicPatientList">
                                                        Patients
                                                    </label>
                                                </td>
                                                <td id="FoundClinicPatients">
                                                    <cic:CaisisSelect runat="server" ID="ClinicPatientList" ShowLabel="false" Width="200"
                                                        DataTextField="ApptName" DataValueField="ApptEncryptedPatientId" onchange="setClinicPatient(this);">
                                                    </cic:CaisisSelect>
                                                </td>
                                            </tr>                                           
                                        </table>
                                    
                                </td></asp:PlaceHolder>
                                <td style="padding-left: 12px; padding-right: 12px;">
                                    <table style="margin-top: 11px; width: 100%;">
                                        <tr>
                                            <td style="font-weight: bold;">
                                                <label for="FindPatientSearch">
                                                    Search by</label>
                                                <asp:RadioButton runat="server" ID="SeachTypeMRN" Text="Name or MRN" GroupName="SearchType" style="margin-left: 8px;" />
                                                <asp:RadioButton runat="server" ID="SeachTypeParticipantID" 
                                                    GroupName="SearchType"  style="margin-left: 8px;"  />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="text" id="FindPatientSearch" onkeypress="if(event.keyCode==13) { return doSearch(event); }"
                                                    style="width: 200px;" />
                                                <input type="image" alt="Find an Existing Patient" id="FindPatientSearchBtn" src="<%= Page.ResolveUrl("~/Images/Search_small.gif") %>"
                                                    onkeypress="if(event.keyCode==13) { return doSearch(event); }" onclick="return doSearch(event);"
                                                    style="cursor: pointer; vertical-align: middle;" />
                                                <!-- Layer containing multiple results for search -->
                                                <div id="SearchResults" style="display: none;">
                                                    <div id="SearchResultsContent">
                                                        <%-- Dynamic Remote Results --%>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div id="PtSelectedPanel" style="display: none; width: 260px; margin-left: auto;
                            margin-right: auto; margin-top: 12px;">
                            <span style="color: #8d2a2c; font-weight: bold;">Selected Patient</span>
                            <cic:CaisisHidden runat="server" ID="epid">
                            </cic:CaisisHidden>
                            <table cellspacing="0" id="selectedPatientTable">
                                <tr >
                                    <td style="width: 80px;">
                                        <strong>Name</strong>
                                    </td>
                                    <td>
                                        <span id="PtNameSelect" style="font-size: 11px; font-weight: bold;">No Patient Selected</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>DOB</strong>
                                    </td>
                                    <td>
                                        <span id="PtDOBSelect"></span>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>MRN</strong>
                                    </td>
                                    <td>
                                        <span id="PtMRNSelect"></span>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong><%= PROTOCOL_PARTICIPANT_ID_CODE %></strong>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="ParticipantIdField"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 20px; position: relative;">
        
            <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

            <table cellpadding="4" cellspacing="0" width="100%">
                <tr>
                    <td class="ProtocolMgmtTitle" style="width: 50%;">
                        <asp:Literal ID="StepTwoTitle" runat="server">2. Enter Screening Result</asp:Literal>
                    </td>
                </tr>                
            </table>
            <div class="PatientPanel" style="width: 100%;">
                <table cellpadding="4" cellspacing="0" width="100%">
                    <tr>
                        <td style="width: 85px;">
                            <label for="ScreeningID">
                                Screening ID</label>
                            <img class="infoIcon" src="../../Images/icon_info.png" alt="Screening Id" title="A system generated  Id assigned to the patient at screening. It is generated in sequence per study." />
                        </td>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="ScreeningID" ShowLabel="false" Enabled="false"
                                Width="50px" Style="background-color: Transparent; border: none; vertical-align: top;"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ScreeningDate">
                                Date</label>
                        </td>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="ScreeningDate" ShowLabel="false" ShowCalendar="true" Width="110px"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 4px;">
                            Result
                        </td>
                        <td>
                            <cic:CaisisRadioButton runat="server" ID="ScreeningPassed" ShowLabel="false" GroupName="ScreeningOptions" /><label
                                for="ScreeningPassed" style="margin-right: 10px; font-weight: bold;">Passed</label>
                            <cic:CaisisRadioButton runat="server" ID="ScreeningFailed" ShowLabel="false" GroupName="ScreeningOptions" /><label
                                for="ScreeningFailed" style="font-weight: bold;">Failed</label>                           
                        </td>
                    </tr>
                    <!-- PASS -->
                    <tr id="studyIDHolder" style="display: none;">
                        <td>
                            <label for="StudyID">
                                Study ID</label>
                            <img runat="server" id="StudyIdTooltip" src="../../Images/icon_info.png" alt="Study Id"
                                title="Please enter a Study Id (numeric values only)" class="infoIcon" />
                        </td>
                        <td>
                            <%--custom selection of site id by lead site --%>
                            <cic:CaisisSelect runat="server" ID="OrganizationStudyIds" ShowLabel="false" ShowEmptyListItem="true" DataTextField="OrganizationName"
                                DataValueField="OrganizationStudyId" Visible="false">
                            </cic:CaisisSelect>
                            <cic:CaisisTextBox runat="server" ID="StudyID" ShowLabel="false" Width="110px" Style="background-color: Transparent;"
                                onblur="validateStudyId(this, true);"></cic:CaisisTextBox>
                            <img runat="server" id="StudyIdError" src="../../Images/ExclamationPoint.gif" visible="false"
                                alt="Error" title="Error auto-generating Study Id" style="vertical-align: middle;
                                width: 12px; height: 12px; border-radius: 3px; border: 1px solid #999;" />
                        </td>
                    </tr>
                    <!-- FAIL -->
                    <tr id="ReasonFailedPanel" style="display: none;">
                        <td>
                            <label for="ReasonFailed">
                                Reason Failed</label>
                        </td>
                        <td>
                            <cic:CaisisComboBox runat="server" ID="ReasonFailed" ShowLabel="false" Width="250px"
                                LookupCode="PtProtocolStatus"></cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr id="PassedPanel" style="display: none;">
                        <td style="padding-top: 4px;">
                            <label for="StudyNodes">
                                Notes</label>
                        </td>
                        <td>
                            <cic:CaisisTextArea runat="server" ID="StudyNodes" ShowLabel="false" Style="width: 600px;
                                height: 34px;"></cic:CaisisTextArea>
                        </td>
                    </tr>                                      
                    <tr id="FailedPanel" style="display: none;">
                        <td style="padding-top: 4px;">
                            <label for="ReasonFailedNotes">
                                Notes</label>
                        </td>
                        <td>
                            <cic:CaisisTextArea runat="server" ID="ReasonFailedNotes" ShowLabel="false" Style="width: 600px;
                                height: 34px;"></cic:CaisisTextArea>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div style="max-width: 900px; padding-top: 10px; margin: auto; text-align: right; clear: both;">
        
        <asp:ImageButton ID="SaveBtn" runat="server" ImageUrl="Images/Button_Save.png" OnClick="DoSave"
            ToolTip="Save &amp; Close" Style="float: right;" />
        <img src="Images/Button_Cancel.png" alt="Cancel" title="Cancel" style="cursor: pointer;
            float: right; padding-left: 15px; padding-right: 15px;" onclick="parent.hidePatientPortal();" />
        <asp:ImageButton ImageUrl="Images/Button_SaveAndContinueToRegistration.png" ID="ContinueBtn"
            runat="server" Text="Save &amp; Continue to Registration" ToolTip="Save &amp; Continue to Registration"
            OnClick="DoSave" Style="display: none;" />
    </div>

    </form>
</body>
</html>
