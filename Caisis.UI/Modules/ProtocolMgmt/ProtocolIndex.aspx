<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolIndex.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolIndex" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocol Manager</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">  
    /* <![CDATA[ */
      
    // Variables for controlling size of Portal Popup layer
    // Offset is relative to this page
    var PORTAL_OFFSET_SMALL = 160; // offset for small pages
    var PORTAL_OFFSET_LARGE = 40; // offset for large pages
    var PORTAL_OFFSET = PORTAL_OFFSET_LARGE; // default offset
    var PORTAL_HEIGHT_MIN = 400; // minimum height of patient portal frame

    // resize helpers to keeping frames within window
    Browser.ResizeElement({ nodeId: 'ProtocolCalendarFrame', heightOffset: 193 });
    Browser.ResizeElement({ nodeId: 'ProtocolListFrame', heightOffset: 193 });   
    
    // Resize Main List Frame and Portal Frame on load and browser resize
    function onWindowResize(w, h) {
        resizePatientPortal(PORTAL_OFFSET);
    }

    // resizes the patient portal height
    // @offset: height offset
    function resizePatientPortal(offset) {
        // set active offset for managing resizes
        PORTAL_OFFSET = offset ? offset : PORTAL_OFFSET;

        if ($('PatientLayer').style.display == 'none') { return; }
        var currentHeight = $('PatientPortal').offsetHeight;
        var targetHeight = Math.max(getHeight(window) - PORTAL_OFFSET, PORTAL_HEIGHT_MIN);

        var ppFrame = $('PatientPortal');
        var ppStretch = $('PatientLayerLeft');
        var resizeStyle = targetHeight + 'px';
        ppFrame.style.height = resizeStyle;
        ppStretch.style.height = (targetHeight - 25) + 'px'; // -25 is a test adjustment - jf
    }
    
    // function to resize the patient portal to short
    var resizePatientPortalSmall = curry(resizePatientPortal, PORTAL_OFFSET_SMALL);
    // function to resize the patient portal to tall
    var resizePatientPortalLarge = curry(resizePatientPortal,PORTAL_OFFSET_LARGE);
    
    // Loads a page into the popup portal frame (optional offset size, i.e. PORTAL_OFFSET_SMALL,etc..)
    function loadPortalPage(page,offset)
    {
        $('PatientPortal').src = page;
        showPatientPortal(offset);
    }

    // Loads page into portal page with header bar (for pages with no header bars)
    function loadPortalPageMin(page)
    {
        loadPortalPage(page,PORTAL_OFFSET_SMALL);
    }

    // shows the patient popup portal
    // @offset: optional offset to adjust portal height (window height - offset)
    function showPatientPortal(offset) {
        $('CoverLayer').show('block');
        $('PatientLayer').show('');  
        if(offset) resizePatientPortal(offset);
    }
    
    // hides the patient popup portal
    function hidePatientPortal() {
        $('CoverLayer').hide('none'); 
        $('PatientLayer').hide('none'); 
    }

    // toggels the current patient view between list and calendar
    // @view: the view to set ("Calendar", "List")
    function toggleView(view) {     
        // the status filter specific to list view
        var statusFilter = $('<%= StatusFilterSection.ClientID %>');
        if (view == 'Calendar')
        {
            $('ProtocolListFrame').style.display = 'none';
            $('ProtocolCalendarFrame').style.display = '';
			$('ToggleImg_Calendar').src = 'Images/Toggle_CalendarView_On.png';
			$('ToggleImg_List').src = 'Images/Toggle_ListView.png';
			if (statusFilter) {
			    statusFilter.style.display = 'none';
			}
        }
        else
        {
            $('ProtocolCalendarFrame').style.display = 'none';
            $('ProtocolListFrame').style.display = '';
			$('ToggleImg_Calendar').src = 'Images/Toggle_CalendarView.png';
			$('ToggleImg_List').src = 'Images/Toggle_ListView_On.png';
			if (statusFilter) {
			    statusFilter.style.display = '';
			}
        }        
        return false; 
    }
    
    // shows the filter selctor to restrict lists by treatment arms
    function showFilterArms() {
        showHideFilter('TreatmentArmLayer');
    }

    // hides the status filter for list patients
    function showStatusFilter() {
        showHideFilter('StatusFilterLayer');
    }

    // toggles the visibility of the filter
    // @id: the id/DOM referene to the filter
    function showHideFilter(id) {
        if ($(id)) {
            var d = $(id).style.display;
            $(id).style.display = d == 'none' ? '' : 'none';
        }
    }

    // filters patients by treatment arms
    function doFilterArms() {
        UpdatePatientFrames();
        showHideFilter('TreatmentArmLayer');
    }

    // filters patients by treatment status
    function doFilterStatuses() {
        UpdatePatientFrames();
        showHideFilter('StatusFilterLayer');
    }

    // checks an item at the specified index in the arm filter, and uncheck 'all' item
    // @index: the index of the item to check
    function doUncheckSelectAllArms(index) {
        DoLayerUncheckSelectAll('TreatmentArmsTable', index);
        //UpdatePatientFrames();
    }

    // checks an item at the specified index in the status filter, and uncheck 'all' item
    // @index: the index of the item to check
    function doUncheckSelectAllStatuses(index) {
        DoLayerUncheckSelectAll('StatusFilterTable', index);
        //UpdatePatientFrames();
    }

    // loops though the checkbox layer, and if 'all' is selected, uncheck others
    // otherwise if any other is selected, uncheck 'all'
    // if nothing is checked, check 'all'
    // @id: the id of the DOM layer containing checkboxes
    function DoLayerUncheckSelectAll(id, index) {
        var cbList = GetLayerCheckBoxes(id);
        if (cbList.length > 0) {
            var checkAllCB = cbList[0];
            var isCheckAll = index == 0;
            var doCheckAll = true;
            // loop though other check boxes
            for (var i = 0; i < cbList.length; i++) {
                var cb = cbList[i];
                // if all was clicked, uncheck others
                if (isCheckAll) {
                    cb.checked = false;
                }
                // otherwise, if any other selected, uncheck all
                else if(cb.checked) {
                    doCheckAll = false;
                    break;
                }
            }
            checkAllCB.checked = doCheckAll;
        }
    }

    // returns a list of ALL checkboxes in specified layer
    // @id: the id of the DOM layer containing checkboxes
    function GetLayerCheckBoxes(id) {
        var found = [];
        if ($(id)) {
            var cbList = $(id).getElementsByTagName('INPUT');
            for (var i = 0; i < cbList.length; i++) {
                var cb = cbList[i];
                // special case: exlcude desceased patients
                if(cb.id=="StatusFilter_Deceased") {
                    continue;
                }
                else if (cb.type == 'checkbox') {
                    found.push(cb);
                }
            }
        }
        return found;
    }

    // returns a list of the selected treatment arms in filter list
    function getTreatmentArms() {
        return GetSelectedFilters('TreatmentArmsTable');
    }

    // returns a list of the selected statuses in filter list
    function getStatuses() {
        return GetSelectedFilters('StatusFilterTable');
    }

    // returns a list of selected checkbox values in specified layer (ignore ALL/index=0 checkbox)
    // @id: the id of the DOM layer containing checkboxes
    function GetSelectedFilters(id) {
        var found = [];       
        var cbList = GetLayerCheckBoxes(id);
        // ignore first item, 'all'
        for (i = 1; i < cbList.length; i++) {
            var cb = cbList[i];
            if (cb.checked) { 
                found.push(cb.value);
            }
        }
        return found;
    }

    // loads a patient into the Patient Portal for management
    function loadPatientInfo(prid, scid, paid, timelineId)
    {
        setPortalHeaderLarge();
        loadPortalPage('PatientIndex.aspx?prid=' + prid + '&scid=' + scid + '&paid=' + paid);
    }

    function loadPatientVisit(prid, scid, paid, timelineId) {
        var tab = 'PatientVisit';
        var qs = 'timelineId=' + timelineId;
        loadTabPage(prid, scid, paid, tab, qs);
    }

    // loads a page into patient portal with tab and optional query string
    function loadTabPage(prid, scid, paid, tabName, qs) {
        // qs query string parameters need to be url encoded when passing along to Portal
        var encodedQS = qs ? escape(qs) : '';
        var url = 'PatientIndex.aspx?prid=' + prid + '&scid=' + scid + '&paid=' + paid + '&tab=' + tabName + '&qs=' + encodedQS;
        loadPortalPage(url);
    }
    
    // opens layer to assign a patient to current protocol
    function assignPatient() {
        setPortalHeaderSmall();
        loadPortalPage('PatientScreening.aspx?prid=<%= BaseProtocolId %>', PORTAL_OFFSET_LARGE);
    }
    
    // Adjust patient portal left and right layer header sizes
    function setPortalHeader(cls)
    {
        var ppLeft = $('PatientLayerLeft');
        ppLeft.className = 'PatientLayerLeft' + cls;
        var ppRight = $('PatientLayerRight');
        ppRight.className = 'PatientLayerRight' + cls;
    }
    
    // sets the patient portal layer with small tabs
    function setPortalHeaderSmall() { setPortalHeader('_miniTabs'); }
    
    // sets the patient portal layer with large tabs
    function setPortalHeaderLarge() { setPortalHeader(''); }

    // signals if a patient was just assigned to protocol and if screen needs
    // to reload and reflect changes
    function patientAssigned(prid, scid, paid, panel, subIndex) {
        reloadListAndCalendar();
        loadTabPage(prid, scid, paid, 'PatientRegistration', panel && panel != '' ? 'panel=' + panel + '&subIndex=' + (subIndex!=null?subIndex:0) : '');
    }
    
    function loadDataEntryInterface(eItemId)
    {
        var url = '<%= GetQueryString("PatientVisitDataEntryContainer.aspx") %>&patientItemId=' + eItemId;
    }

    // updates the url in the patient frames (i.e., Calendar and List view)
    // causing a reload of updated patients, visits and statuses
    function UpdatePatientFrames() {
        // create csv list of arms
        var treatmentArms = getTreatmentArms().join(',');
        // create csv list of statuses
        var statusList = getStatuses().join(',');
        // determine if displaying deceased patients
        var includeDeceased = $("StatusFilter_Deceased").checked;
        // build query string parameters to append to base query string 
        var queryString = '&TreatmentArms=' + treatmentArms + '&statuses=' + statusList + "&includeDeceased=" + includeDeceased;
        // update calendar view frame
        $('ProtocolCalendarFrame').src = '<%= GetQueryString("ProtocolPatientCalendar.aspx") %>' + queryString;
        // update list view frame
        $('ProtocolListFrame').src = '<%= GetQueryString("ProtocolPatientList.aspx") %>' + queryString;
        
        updateFilterText();
    }

    // updates the labels controling filters
    function updateFilterText() {
        if ($('TreatmentArmDisplay')) {
            var arms = getTreatmentArms();
            $('TreatmentArmDisplay').innerHTML = arms.length == 0 ? 'Showing All Patients' : 'Showing ' + arms.length + ' ' + (arms.length == 1 ? 'Treatment Arm' : 'Treatment Arms'); 
        }
        if ($('StatusFilterDisplay')) {
            var statuses = getStatuses();
            $('StatusFilterDisplay').innerHTML = statuses.length == 0 ? 'Showing All Statuses' : 'Showing ' + statuses.length + ' ' + (statuses.length == 1 ? 'Status' : 'Statuses');
        }
    }

    // reloads calendar view and list view to reflect assigned patients
    function reloadListAndCalendar() {
        window.frames['ProtocolCalendarFrame'].location = window.frames['ProtocolCalendarFrame'].location;
        window.frames['ProtocolListFrame'].location = window.frames['ProtocolListFrame'].location;
    }

    function manageSpecimens() {
        setPortalHeaderSmall();
        loadPortalPage('ProtocolSpecimens.aspx?prid=<%= BaseProtocolId %>', PORTAL_OFFSET_LARGE);
        return false;
    }

    function editAccrualDetails() {
        setPortalHeaderSmall();
        loadPortalPage('PatientBulkScreening.aspx?prid=<%= BaseProtocolId %>', PORTAL_OFFSET_LARGE);
        return false;
    }

    
     /* ]]> */
    </script>

    <style type="text/css">         
        .fullScreenLayerBG
        {
            opacity: 0.40;
            filter: alpha(opacity=40);
            background-color: #333333;
            border: #000000;
            display: none;
            position: absolute;
            top: 0px;
            right: 0px;
            bottom: 0px;
            left: 0px;
        }
        .treatmentArmSelector_left
        {
            background-image: url(images/TreatmentArmSelector_BG_Left.png);
            background-repeat: no-repeat;
            vertical-align: top;
            height: 28px;
            padding-left: 10px;
            color: #3D556D;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 10px;
            font-weight: bold;
            padding-top: 7px;
        }
        .treatmentArmSelector_right
        {
            background-image: url(images/TreatmentArmSelector_BG_Right.png);
            background-repeat: no-repeat;
            vertical-align: top;
            height: 28px;
            width: 30px;
        }
        .BlueSelector_left
        {
            background-image: url(images/BlueSelector_BG_Left.png);
            background-repeat: no-repeat;
            vertical-align: top;
            height: 28px;
            padding-left: 10px;
            color: #ffffff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 10px;
            font-weight: bold;
            padding-top: 5px;
        }
        .BlueSelector_right
        {
            background-image: url(images/BlueSelector_BG_Right.png);
            background-repeat: no-repeat;
            vertical-align: top;
            height: 28px;
            width: 27px;
        }
        .treatmentArmMenu_top_left
        {
            background-image: url(images/PopUpMenu_Top_Left.png);
            background-repeat: no-repeat;
            vertical-align: bottom;
            color: #ffffff;
            padding-bottom: 3px;
            padding-left: 16px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: bold;
            height: 30px;
        }
        .treatmentArmMenu_top_right
        {
            background-image: url(images/PopUpMenu_Top_Right_withClose.png);
            background-repeat: no-repeat;
            vertical-align: top;
            height: 30px;
            width: 29px;
        }
        .treatmentArmMenu_mid_left
        {
            background-image: url(images/PopUpMenu_Middle_Left.png);
            background-repeat: repeat-y;
            vertical-align: top;
            padding-left: 16px;
            padding-top: 8px;
            width: 28px;
        }
        .treatmentArmMenu_mid_center
        {
            background-image: url(images/PopUpMenu_Middle_Left.png);
            background-repeat: repeat-y;
            background-position: -10px 0px;
            vertical-align: top;
            padding-top: 11px;
            color: #333333;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            width: 173px;
        }
        .treatmentArmMenu_mid_right
        {
            background-image: url(images/PopUpMenu_Middle_Right.png);
            background-repeat: no-repeat;
            width: 29px;
        }
        .treatmentArmMenu_bottom_left
        {
            background-image: url(images/PopUpMenu_Bottom_Left.png);
            background-repeat: no-repeat;
            height: 18px;
        }
        .treatmentArmMenu_bottom_right
        {
            background-image: url(images/PopUpMenu_Bottom_Right.png);
            background-repeat: no-repeat;
            height: 18px;
            width: 29px;
        }
    </style>
</head>
<body class="PatientProtocolBody">
    <form id="form1" runat="server">              
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="ProtocolTitleBarLeft">
                &nbsp;
            </td>
            <td id="ProtocolNumberTd" runat="server" class="ProtocolTitleBarBG_ProtNum">
                <asp:Label runat="server" ID="ProtocolNumberLabel"></asp:Label>
            </td>
            <td class="ProtocolTitleBarBG_ProtTitle">
                <asp:Label runat="server" ID="ProtocolTitleLabel"></asp:Label>
            </td>
            <td class="ProtocolTitleBarBG_TreatmentArmSelector" id="TreatmentArmSection" runat="server">
                <%-- <asp:ImageButton ID="FilterArms" AlternateText="Filter Treatment Arms" ToolTip="Filter Treatment Arms"
                        OnClientClick="showFilterArms(); return false;" runat="server" />--%>
                <div id="TreatmentArmLayer" style="z-index: 100; position: absolute; width: 193px;
                    margin-top: 7px; margin-left: 5px; display: none;">
                    <table id="TreatmentArmsTable" width="230" border="0" cellspacing="0" cellpadding="0"
                        style="border-collapse: collapse;">
                        <asp:Repeater ID="TreatmentArms" runat="server">
                            <HeaderTemplate>
                                <tr>
                                    <td colspan="2" class="treatmentArmMenu_top_left" style="height: 27px">
                                        Filter Patients
                                    </td>
                                    <td class="treatmentArmMenu_top_right">
                                        <img src="images/shim.gif" width="16" height="16" style="margin-top: 6px; margin-left: 1px;
                                            cursor: pointer;" onclick="showFilterArms();" />
                                    </td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="treatmentArmMenu_mid_left">
                                        <input type="checkbox" name="TreatmentArms_<%# Container.ItemIndex %>" id="TreatmentArms_<%# Container.ItemIndex %>" onclick="doUncheckSelectAllArms(<%# Container.ItemIndex %>);"
                                            value="<%# Eval("ProtocolSchemaId")%>" <%# Container.ItemIndex==0 ? "checked=\"true\"" : string.Empty %> />
                                    </td>
                                    <td class="treatmentArmMenu_mid_center">
                                        <label for="TreatmentArms_<%# Container.ItemIndex %>" title="<%# Server.HtmlEncode(Eval("ProtocolArmDescription").ToString()) %>">
                                            <%# Caisis.UI.Core.Classes.PageUtil.GetTrimmedDescription(Eval("ProtocolArmDescription").ToString(), 80) %>
                                        </label>
                                    </td>
                                    <td class="treatmentArmMenu_mid_right">
                                        &nbsp;
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                <tr>
                                    <td class="treatmentArmMenu_mid_left">
                                        &nbsp;
                                    </td>
                                    <td class="treatmentArmMenu_mid_center" style="text-align: center; padding-right: 15px;">
                                        <span class="dataEntryButtonRed" title="Filter Patients by Treatment Arm" onclick="doFilterArms();"
                                            style="width: 125px;">Update Filter</span>
                                    </td>
                                    <td class="treatmentArmMenu_mid_right">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="treatmentArmMenu_bottom_left">
                                        &nbsp;
                                    </td>
                                    <td class="treatmentArmMenu_bottom_right">
                                        &nbsp;
                                    </td>
                                </tr>
                            </FooterTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <table id="TreatmentArmSelector" runat="server" border="0" cellspacing="0" cellpadding="0" style="cursor: pointer; height: 28px;" onclick="showFilterArms(); return false;">
                    <tr>
                        <td class="treatmentArmSelector_left">
                            <asp:Label ID="TreatmentArmDisplay" runat="server" Style="cursor: pointer; display: block;">Showing All Patients</asp:Label>
                        </td>
                        <td class="treatmentArmSelector_right">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
            <td class="ProtocolTitleBarBG_ExitButton">
                <a href="ProtocolList.aspx" title="Exit Protocol">
                    <img src="Images/Button_ExitProtocol.gif" alt="Exit Protocol" style="border-style: none;" /></a>
            </td>
            <td class="ProtocolTitleBarRight">
                &nbsp;
            </td>
        </tr>
    </table>
    <div id="CoverLayer" class="fullScreenLayerBG" style="z-index: 48;">
        &nbsp;
    </div>
    <div id="PatientLayer" style="z-index: 50; position: absolute; top: 0px; width: 100%;
        display: none;">
        <table style="width: 98%; border: none; margin-left: auto; margin-right: auto;" cellpadding="0"
            cellspacing="0" border="0">
            <tr>
                <td class="PatientLayerTopLeft" >&nbsp;</td>
                <td id="PatientLayerTop" rowspan="2" class="PatientLayerTop"><iframe id="PatientPortal" style="width: 100%;" frameborder="0" src="" scrolling="no"></iframe></td>
                <td class="PatientLayerTopRight" ><img onclick="hidePatientPortal();" src="Images/CloseWidget_Red.gif" alt="Close" style="margin-top: 7px; border: none; cursor: pointer; vertical-align: top;" /></td>
            </tr>
            <tr>
                <td id="PatientLayerLeft" class="PatientLayerLeft" style="height: 200px;" >&nbsp;</td>
                <td id="PatientLayerRight" class="PatientLayerRight">&nbsp;</td>
            </tr>
            <tr>
                <td class="PatientLayerBottomLeft">&nbsp;</td>
                <td class="PatientLayerBottom">&nbsp;</td>
                <td class="PatientLayerBottomRight">&nbsp;</td>
            </tr>
        </table>
    </div>
    <div style="width: 100%;">
        <table border="0" cellpadding="0" cellspacing="0" style="margin-left: auto; margin-right: auto;
            width: 909px;">
            <tr>
                <td style="width: 225px;">
                    <a href="<%= GetQueryString("ProtocolPatientCalendar.aspx") %>" target="ProtocolCalendarFrame"
                        onclick="return toggleView('Calendar');">
                        <img id="ToggleImg_Calendar" alt="Calendar View" title="Calendar View of Patients"
                            src="Images/Toggle_CalendarView_On.png" style="cursor: pointer; width: 120px;
                            height: 25px; border: none;" /></a><a href="<%= GetQueryString("ProtocolPatientList.aspx") %>"
                                target="ProtocolListFrame" onclick="return toggleView('List');"><img id="ToggleImg_List"
                                    alt="List View" title="List View of Patients" src="Images/Toggle_ListView.png"
                                    style="border-style: none; cursor: pointer; width: 88px; height: 25px; border-style: none;" /></a>
                </td>
                <td style="height: 35px;">
                <table style="float: right; margin-top: 5px;">
                <tr><td id="StatusFilterSection" runat="server">
                <div id="StatusFilterLayer" style="z-index: 100; position: absolute; width: 193px;
                    margin-top: 0px; margin-left: 0px; display: none;">
                    <table id="StatusFilterTable" width="230" border="0" cellspacing="0" cellpadding="0"
                        style="border-collapse: collapse;">
                        <asp:Repeater ID="StatusFilterRptr" runat="server">
                            <HeaderTemplate>
                                <tr>
                                    <td colspan="2" class="treatmentArmMenu_top_left" style="height: 27px">
                                        Filter By Latest Status
                                    </td>
                                    <td class="treatmentArmMenu_top_right">
                                        <img src="images/shim.gif" width="16" height="16" style="margin-top: 6px; margin-left: 1px;
                                            cursor: pointer;" onclick="showStatusFilter();" />
                                    </td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="treatmentArmMenu_mid_left">
                                        <input type="checkbox" name="StatusFilter_<%# Container.ItemIndex %>" id="StatusFilter_<%# Container.ItemIndex %>" onclick="doUncheckSelectAllStatuses(<%# Container.ItemIndex %>);"
                                            value="<%# Server.UrlEncode(Eval("PtProtocolStatus").ToString()) %>"
                                            <%# (int)Eval("DefaultCheck")==1 ? "checked=\"checked\"" : string.Empty %> />
                                    </td>
                                    <td class="treatmentArmMenu_mid_center">
                                        <label for="StatusFilter_<%# Container.ItemIndex %>">
                                            <%# Eval("PtProtocolStatus").ToString() %> (<%# Eval("PatientCount").ToString()%>)</label>
                                    </td>
                                    <td class="treatmentArmMenu_mid_right">
                                        &nbsp;
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                <!-- deceased filter -->
                                <tr>
                                    <td class="treatmentArmMenu_mid_left">
                                        &nbsp;
                                    </td>
                                    <td class="treatmentArmMenu_mid_center">
                                        <div style="border-top: 1px solid #dddddd; display:inline-block; height: 1px; width: 150px;"></div>
                                    </td>
                                    <td class="treatmentArmMenu_mid_right">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="treatmentArmMenu_mid_left">
                                        <input type="checkbox" name="StatusFilter_Deceased" id="StatusFilter_Deceased" checked="checked" />
                                    </td>
                                    <td class="treatmentArmMenu_mid_center">
                                        <label for="StatusFilter_Deceased">
                                            Include Deceased Patients</label>
                                    </td>
                                    <td class="treatmentArmMenu_mid_right">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="treatmentArmMenu_mid_left">
                                        &nbsp;
                                    </td>
                                    <td class="treatmentArmMenu_mid_center" style="text-align: center; padding-right: 15px;">
                                        <span class="dataEntryButtonRed" title="Filter Patients by Status" onclick="doFilterStatuses();"
                                            style="width: 125px;">Update Filter</span>
                                    </td>
                                    <td class="treatmentArmMenu_mid_right">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="treatmentArmMenu_bottom_left">
                                        &nbsp;
                                    </td>
                                    <td class="treatmentArmMenu_bottom_right">
                                        &nbsp;
                                    </td>
                                </tr>
                            </FooterTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <table id="StatusFilterSelector" runat="server" border="0" cellspacing="0" cellpadding="0" style="cursor: pointer; height: 28px;" onclick="showStatusFilter(); return false;">
                    <tr>
                        <td class="BlueSelector_left">
                            <asp:Label ID="StatusFilterDisplay" runat="server" Style="cursor: pointer; display: block;">Showing All Statuses</asp:Label>
                        </td>
                        <td class="BlueSelector_right">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td></tr>
                </table>                   
                           
                </td>
                <td style="text-align: right; width: 350px;">
                    <a runat="server" id="BtnAdminOptions" visible="false">
                        <img src="Images/Button_AdminOptions.gif" visible="false" alt="Admin Options" style="border-style: none;
                            cursor: pointer;" width="94" height="24" /></a>
                    <img runat="server" id="BtnAssignPatient" src="Images/ButtonAssignPatients.gif" alt="Assign Patients" style="cursor: pointer;
                        margin-left: 13px;" onclick="assignPatient();" visible="false" />
                    <a href="#" runat="server" id="BtnAccrualDetails" class="dataEntryButtonGray" onclick="return editAccrualDetails();" style="float: right; margin: auto 5px; height: 18px; line-height: 18px;" visible="false">Accrual Details</a>
                    <a href="#" runat="server" id="BtnSpecimens" visible="false" class="dataEntryButtonRed" onclick="return manageSpecimens();" style="float: right; margin: auto 5px; height: 18px; line-height: 18px;">Manage Specimens</a>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="padding-top: 5px;">
                    <iframe id="ProtocolCalendarFrame" runat="server" name="ProtocolCalendarFrame" style="width: 900px;
                        height: 800px; margin: auto; border-style: none; display: block;" frameborder="0">
                    </iframe>
                    <iframe id="ProtocolListFrame" runat="server" name="ProtocolListFrame" style="width: 900px;
                        height: 800px; margin: auto; border-style: none; display: none;" frameborder="0">
                    </iframe>
                    
                </td>
            </tr>
        </table>
    </div>
    </form>

    <script type="text/javascript">
        /* <![CDATA[ */

        // set default toggle view to Calendar
        toggleView('Calendar');
        
        /* ]]> */
    </script>
</body>
</html>
