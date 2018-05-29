<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddUnplannedEvent.ascx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AddUnplannedEvent" %>

<script type="text/javascript">
    /* <![CDATA[ */

    // a list of generic unplanned events
    var UNPLANNED_EVENTS_TABLES =
    {
        'ProtocolMgr_PatientDeviations': '<%= GetClientTableTitle("ProtocolMgr_PatientDeviations", "Protocol Deviation") %>',
        'Toxicities': '<%= GetClientTableTitle("Toxicities", "Toxicity") %>',
        'Surveys': '<%= GetClientTableTitle("Surveys", "Survey") %>',
        'LabTests': '<%= GetClientTableTitle("LabTests", "LabTests") %>',
        'Diagnostics': '<%= GetClientTableTitle("Diagnostics", "Diagnostics") %>',
        'Encounters': '<%= GetClientTableTitle("Encounters", "Encounters") %>',
        'Actions': '<%= GetClientTableTitle("Actions", "Actions") %>'
    };

    // loads an unplanned item to edit returns true|false if item was loaded into data entry
    // @patientItemId: the patient item id for the unplanned item
    // @deviationTable: the table of the unplanned visit
    // @deviationKey: the pri key of the unplanned table
    function loadUnplannedVisistItem(patientItemId, deviationTable, deviationKey) {
        if (deviationTable == 'ProtocolMgr_PatientDeviations') {
            loadDeviation(patientItemId, deviationKey);
            return true;
        }
        else if (deviationTable == 'Toxicities') {
            loadToxicities(patientItemId, deviationKey);
            return true;
        }
        else if (deviationTable == 'Surveys') {
            loadUnplannedSurvey(patientItemId, deviationKey);
            return true;
        }
        // generic case
        else {
            // validate in list of generic tables
            if (UNPLANNED_EVENTS_TABLES[deviationTable]) {
                loadUnplannedEvent(patientItemId, deviationTable, deviationKey);
                return true;
            }
        }
        return false;
    }

    // loads the edit patient deviation data entry interface
    // @patientItemId: the patient item id mapping to the unplanned event
    // @surveyId: the optional Deviation Id of the data entry form
    function loadDeviation(patientItemId, deviationId) {
        setTitle(patientItemId, UNPLANNED_EVENTS_TABLES['ProtocolMgr_PatientDeviations']);
        loadDeviationPage('<%= GetQueryString("PatientDeviations.aspx") %>&deviationId=' + deviationId, patientItemId);
    }

    // loads the edit toxicity data entry interface
    // @patientItemId: the patient item id mapping to the unplanned event
    // @surveyId: the optional Toxicity Id of the data entry form
    function loadToxicities(patientItemId, toxicityId) {
        setTitle(patientItemId, UNPLANNED_EVENTS_TABLES['Toxicities']);
        loadDeviationPage('<%= GetQueryString("PatientToxicitiesSAE.aspx") %>&sae=false&toxicityId=' + toxicityId, patientItemId);
    }

    // loads the edit toxicity and sae data entry interface
    // @patientItemId: the patient item id mapping to the unplanned event
    // @surveyId: the optional Toxicity Id of the data entry form
    function loadToxicitiesSAE(patientItemId, toxicityId) {
        setTitle(patientItemId, 'Serious Adverse Event');
        loadDeviationPage('<%= GetQueryString("PatientToxicitiesSAE.aspx") %>&sae=true&toxicityId=' + toxicityId, patientItemId);
    }

    // loads the edit survey data entry interface
    // @patientItemId: the patient item id mapping to the unplanned event
    // @surveyId: the optional Survey Id of the data entry form
    function loadUnplannedSurvey(patientItemId, surveyId) {
        setTitle(patientItemId, UNPLANNED_EVENTS_TABLES['Surveys']);
        loadDeviationPage('<%= GetQueryString("PatientUnplannedSurvey.aspx") %>&surveyId=' + surveyId, patientItemId);
    }

    // loads and unplanned event by tablename into data entry layer
    // @patientItemId: the patient item id mapping to the unplanned event
    // @table: the data entry table
    // @priKey: the optional pri key of the data entry table
    function loadUnplannedEvent(patientItemId, table, priKey) {
        setTitle(patientItemId, UNPLANNED_EVENTS_TABLES[table]);
        loadDeviationPage('<%= GetQueryString("PatientUnplannedEvent.aspx") %>&table=' + table + '&priKey=' + priKey, patientItemId);
    }

    // loads the specified page into the edit deviation layer
    // @page: the url of the data entry interface
    // @patientItemId: the patient item id mapping to the unplanned event
    function loadDeviationPage(page, patientItemId) {
        $('DeviationFrame').src = page + '&patientItemId=' + patientItemId;
        showDeviation();
    }

    // shows the popup unplanned event layer
    function showDeviation() {
        var frame = $('DeviationFrame');
        var bglayer = $('BGLayer');
        bglayer.show('block');
        var layer = $('DeviationLayer');
        layer.show('block');
        layer.center();
    }

    // hides the popup unplanned event layer
    function hideDeviation() {
        var bglayer = $('BGLayer');
        bglayer.hide('none');
        var layer = $('DeviationLayer');
        layer.hide('none');
    }

    // sets the title of the popup unplanned event layer
    function setTitle(pItemId, title) {
        title = (pItemId && pItemId != '' ? 'Edit' : 'Add') + ' ' + title;
        var popupTitle = $('Level2PopupTitle');
        popupTitle.clear();
        popupTitle.appendChild(document.createTextNode(title));
    }

    // when deviation signals update/delete, reload form
    // @isDelete: if the record was deleted
    function notifyUnplannedEventUpdate(isDelete) {
        var onClientUpdate = '<%= OnUpdateScript %>';
        hideDeviation();
        if(onClientUpdate && onClientUpdate != '' && window[onClientUpdate]) {
            window[onClientUpdate](isDelete);
        }
        else {
            window.location = window.location;
        }
    }

    // shows the dropdown layer
    function showMoreTabsMenu() {
        var menu = $('LayoutMenu');
        menu.style.visibility = 'visible';
    }

    // hides the dropdown layer
    function hideMoreTabsMenu(element, evt) {
        if (isMouseLeave(element, evt)) {
            $('LayoutMenu').style.visibility = 'hidden';
        }
    }

    /* ]]> */
</script>

<style type="text/css">
    .MenuLayer
    {
        position: absolute;
        visibility: hidden;
    }
    .MenuLayerRow
    {
        vertical-align: top;
        height: 16px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 12px;
        color: #000000;
        cursor: pointer;
    }
    .DeviationItem
    {
        font-weight: bold;
    }
    .SelectMenuTop
    {
        font-size: 1px;
        line-height: 1px;
        height: 29px;
        background-repeat: no-repeat;
    }
    .SelectMenuRow
    {
        background-image: url(Images/SelectMenuBG_155Wide.png);
        background-repeat: repeat-y;
        color: #333333;
        font-size: 12px;
        line-height: 12px;
        font-weight: bold;
        font-family: Arial, Helvetica, sans-serif;
        vertical-align: top;
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 12px;
        cursor: pointer;
        text-align: left;
    }
    .SelectMenuRow:hover
    {
        background-image: url(Images/SelectMenuBGHover_155Wide.png);
        background-repeat: repeat-y;
        color: #000000;
        font-size: 12px;
        line-height: 12px;
        font-weight: bold;
        font-family: Arial, Helvetica, sans-serif;
        vertical-align: top;
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 12px;
        cursor: pointer;
        text-align: left;
    }
    .SelectMenuBottom
    {
        font-size: 1px;
        line-height: 1px;
        height: 11px;
        background-image: url(Images/SelectMenuBG_155Wide_Bottom.png);
        background-repeat: no-repeat;
    }
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
    .fullScreenLayer
    {
        width: 100%;
        height: 97%;
    }
    .fullScreenLayerBG
    {
        opacity: 0.6;
        -moz-opacity: 0.6;
        filter: alpha(opacity=60);
        background-color: #333333;
        border: #000000;
        display: none;
    }
    .Level2PopupDiv
    {
        position: absolute;
        width: 700px;
        height: 446px;
        z-index: 10002;
        margin: auto auto auto auto;
        display: none;
    }
    .Level2PopupTopLeft
    {
        background-image: url(images/Level2PopupBG_TopLeft.png);
        background-repeat: no-repeat;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 17px;
        color: #8d2a2c;
        padding-left: 21px;
        padding-top: 12px;
    }
    .Level2PopupTopRight
    {
        background-image: url(images/Level2PopupBG_TopRight.png);
        background-repeat: no-repeat;
        background-position: top right;
        width: 28px;
    }
    .Level2PopupMidRight
    {
        background-image: url(images/Level2PopupBG_MidRight.png);
        background-repeat: repeat-y;
        background-position: right;
    }
    .Level2PopupBottomRight
    {
        background-image: url(images/Level2PopupBG_BottomRight.png);
        background-repeat: no-repeat;
        background-position: bottom right;
    }
    .Level2PopupBottomLeft
    {
        background-image: url(images/Level2PopupBG_BottomLeft.png);
        background-repeat: no-repeat;
        background-position: bottom left;
    }
    .Level2PopupBottomMid
    {
        background-image: url(images/Level2PopupBG_BottomMid.png);
        background-repeat: repeat-x;
        background-position: bottom left;
    }
</style>
<div style="position: relative; z-index: 30; text-align: right;">
    <div id="LayoutMenu" class="MenuLayer" style="width: 155px; height: auto; right: 0px;"
        onmouseout="hideMoreTabsMenu(this, event);">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="SelectMenuTop" style="background-image: url(Images/Button_AddUnplannedEvent_On.png);">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="SelectMenuBottom" style="background-image: url(Images/SelectMenuBG_155Wide.png);
                    height: 3px;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="SelectMenuRow" onclick="loadDeviation('','');">
                    Patient Deviation
                </td>
            </tr>
            <tr>
                <td class="SelectMenuRow" onclick="loadToxicities('','');">
                    Toxicity
                </td>
            </tr>
            <tr>
                <td class="SelectMenuRow" onclick="loadToxicitiesSAE('','');">
                    Serious Adverse Event
                </td>
            </tr>
            <tr>
                <td class="SelectMenuRow" onclick="loadUnplannedSurvey('','');">
                    Survey
                </td>
            </tr>
            <tr>
                <td class="SelectMenuRow" onclick="loadUnplannedEvent('','LabTests','');">
                    Lab Test
                </td>
            </tr>
            <tr>
                <td class="SelectMenuRow" onclick="loadUnplannedEvent('','Diagnostics','');">
                    Diagnostic
                </td>
            </tr>
            <tr>
                <td class="SelectMenuRow" onclick="loadUnplannedEvent('','Encounters','');">
                    Encounter
                </td>
            </tr>
            <tr>
                <td class="SelectMenuRow" onclick="loadUnplannedEvent('','Actions','');">
                    Action
                </td>
            </tr>
            <tr>
                <td class="SelectMenuBottom">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <img runat="server" id="AddUnplannedBtn" alt="Add an Unplanned Event" title="Add an Unplanned Event" src="Images/Button_AddUnplannedEvent.png"
        style="cursor: pointer;" onclick="return showMoreTabsMenu();" />
</div>
<div id="BGLayer" class="fullScreenLayer fullScreenLayerBG" style="position: absolute;
    z-index: 10001; top: 0px; left: 0px;">
    &nbsp;
</div>
<div id="DeviationLayer" class="Level2PopupDiv">
    <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
            <td class="Level2PopupTopLeft" style="white-space: nowrap; width: 300px; text-align: left;">
                <span id="Level2PopupTitle">Deviation</span>
            </td>
            <td class="Level2PopupTopLeft" style="white-space: nowrap; background-position: -30px 0px;">
                &nbsp;
            </td>
            <td class="Level2PopupTopRight" style="text-align: right; vertical-align: top;">
                <img onclick="hideDeviation();" alt="Close" src="Images/shim.gif" style="height: 16px;
                    width: 16px; margin-right: 6px; margin-top: 7px; cursor: pointer;" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="Level2PopupTopLeft" style="background-position: 0px -30px">
                <iframe id="DeviationFrame" name="DeviationFrame" src="" frameborder="0" style="height: 310px;
                    width: 100%; margin-top: 2px; margin-bottom: 14px;"></iframe>
            </td>
            <td class="Level2PopupMidRight">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="Level2PopupBottomLeft">
                &nbsp;
            </td>
            <td class="Level2PopupBottomMid">
                &nbsp;
            </td>
            <td class="Level2PopupBottomRight">
                &nbsp;
            </td>
        </tr>
    </table>
</div>
