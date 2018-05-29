<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolSpecimens.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolSpecimens" %>


<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Protocol Specimens</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>
    <script type="text/javascript">

        // ensure right and left header tabs are large to match tab heights
        if (parent.setPortalHeaderLarge) { parent.setPortalHeaderLarge(); }

        Browser.ResizeElement({ nodeId: "Manage_Frame", heightOffset: 150 });

        // CONSTANTS

        // a list of statuses for editing specimen sequencing data
        var SEQUENCING_STATUSES = [<%= "'" + string.Join("','", GetSequencingStatuses()) + "'" %>];

        jQuery.noConflict();

        jQuery(document).ready(function (e) {
            // check all
            var checkAllBtn = jQuery("#checkall-checkbox");
            var checkboxes = jQuery("#SpecimenInventory input[type='checkbox']").not(":disabled");
            checkAllBtn.click(function () {
                var isChecked = jQuery(this).is(":checked");
                if (isChecked)
                    checkboxes.attr("checked", "checked");
                else
                    checkboxes.removeAttr("checked");
                // trigger change
                checkboxes.change();
            });
            checkboxes.change(function (e) {
                var cb = jQuery(this);
                var tr = cb.parents("TR").first();
                if (cb.is(":checked")) {
                    if (!tr.hasClass("ItemRow_Hover"))
                        tr.addClass("ItemRow_Hover");
                }
                else {
                    tr.removeClass("ItemRow_Hover")
                }
            });
            // trigger change
            checkboxes.change();

            var checkAll;
            var uncheckAll;

            jQuery("#SearchSelection").change(function (e) {
                var searchFilters = jQuery(".searchFilter");
                var emptyFilter = jQuery("#Empty_Layer");
                var selectedOption = jQuery(this).find("option:selected").val();
                if (selectedOption && selectedOption != "") {
                    var selectedFilter = jQuery("#" + selectedOption + "_Layer");
                    searchFilters.hide();
                    emptyFilter.hide();
                    selectedFilter.show();
                }
                else {
                    searchFilters.hide();
                    emptyFilter.show();
                }
            });
            jQuery("#SearchSelection").change();
            adjustOnResize();

            var transferFrame = jQuery("#TransferSlip_Frame");
            transferFrame.hide();
            jQuery("#TransferSlip_Frame").bind("load", function (e) {
                transferFrame.show();
            });
        });

        // get a list of selected SpecimenIds
        function _getSelectedSpecimens() {
            return jQuery("#SpecimenInventory input[type='checkbox']:checked");
        }

        function getSelectedSpecimens() {
            var checkboxes = _getSelectedSpecimens();
            var selectedSpecimenIds = checkboxes.map(function (i, c) { return jQuery(c).val(); }).toArray();
            return selectedSpecimenIds;
        }

        function validateSelectedSpecimens() {
            var checkboxes = _getSelectedSpecimens();
            var valid = true;
            checkboxes.each(function () {
                var cb = jQuery(this);
                if (cb.attr("data-disabled") == "true") {
                    valid = false;
                    return false;
                }
            });
            return valid;
        }

        function initSpecimenConditions(conditions) {
            var queue = {};
            var conditionCombos = jQuery("#SpecimenInventory input[name*='SpecimenConditionNotes']");
            conditionCombos.blur(function (e) {
                var field = jQuery(this);
                var specimenId = field.parents("tr").find("input[name='specimens']").val();
                var condition = field.val();
                if (queue[specimenId])
                    return;
                queue[specimenId] = setTimeout(function () {
                    setReceivedCondition(specimenId, condition);
                    queue[specimenId] = null;
                },
                1000);
            });
        }

        var CALLBACK_URL = '<%= GetQueryString("ProtocolSpecimens.aspx") %>';

        function doAjaxCallback(method, params, callback) {
            params = params || {};
            params["ajax"] = true;
            params["method"] = method;
            jQuery.get(CALLBACK_URL, params, callback);
        }

        function adjustOnResize() {
            // adjust table headers to data cells
            var th = jQuery("#MainHeader table:first-child thead th");
            var td = jQuery("#MainOverflow table:first-child tbody tr:first-child td");
            var adjustCount = th.size();// - 1;
            var widthProperty = '<%= QueryView %>' == 'transfer' ? 'outerWidth' : 'width';
            for (var i = 0; i < adjustCount; i++) {
                var thWidth = th.eq(i)[widthProperty]();
                td.eq(i).width(thWidth);
            }
            // adjust overflow
            jQuery("#MainOverflow").css("max-height", jQuery(window).height() - 250 + "px");
        }

        function setReceivedCondition(specimenId, condition) {
            ProtocolSpecimenService.UpdateSpecimenCondition({
                data: {
                    specimenId: specimenId,
                    condition: condition
                },
                success: function (response) {
                    _field.removeAttr("disabled");
                }
            });
        }

        var TRANSFER_URL = '<%= GetQueryString("ProtocolSpecimensTransfer.aspx") %>';
        var SEQUENCE_URL = '<%= GetQueryString("ProtocolSpecimensSequencing.aspx") %>';

        function showTransferSpecimens(mode, status, btnText) {
            // udpate count
            var selectedSpecimenIds = getSelectedSpecimens();
            if (selectedSpecimenIds.length == 0) {
                alert("Please select at least 1 specimen before continuing.");
            }
            else {
                var valid = validateSelectedSpecimens();
                if (valid) {
                    var form = jQuery("#SpecimensForm");
                    var targetSpecimens = jQuery("#transfer_specimens");
                    var formSpecimenIds = selectedSpecimenIds.join(",");
                    targetSpecimens.val(formSpecimenIds);
                    postTransferForm({ action: "create", mode: mode, status: status, btnText: btnText });
                }
                else {
                    alert('Some of the selected specimens are not eligible for transfer, please check your selection.');
                }
            }
            return false;
        }

        function showEditSpecimenSequence() {
            // get selected specimens
            var checkboxes = _getSelectedSpecimens();
            if (checkboxes.length == 0) {
                alert("Please select at least 1 specimen before continuing.");
            }
            else {
                // validation
                var selectedSpecimenIds = [];
                checkboxes.each(function () {
                    var cb = jQuery(this);
                    var tr = cb.parents("tr");
                    var specimenId = cb.val();
                    var eligible = tr.hasClass("editSequenceRow");
                    if (eligible) {
                        selectedSpecimenIds.push(specimenId);
                    }
                });
                // validation, selected checkboxes should match eligible rows
                if (selectedSpecimenIds.length !== checkboxes.length) {
                    var message = "Selected specimen(s) must have one of the following statuses before editing.\n" + '"' + SEQUENCING_STATUSES.join('"\n"') + '".';
                    alert(message);
                    return false;
                }
                var mode = '<%= QueryMode %>';
                var bulk = selectedSpecimenIds.length > 1;
                var form = jQuery("#SpecimensForm");
                var targetSpecimens = jQuery("#sequence_specimens");
                var formSpecimenIds = selectedSpecimenIds.join(",");
                targetSpecimens.val(formSpecimenIds);
                postEditSequenceForm({ mode: mode, bulk: bulk });
            }
            return false;
        }
        
        function editExistingTransfer(action, requestId, distributionId, collectionId, mode, status, btnText, e) {
            jQuery("#transfer_specimens").val("");
            postTransferForm({
                action: action,
                mode: mode ? mode : "request",
                status: status ? status : "",
                requestId: requestId,
                distributionId: distributionId,
                collectionId: collectionId,
                btnText: btnText ? btnText : ""
            });
            stopBubble(e);
            return false;
        }

        function postTransferForm(params) {
            postPopupForm("TransferForm", TRANSFER_URL, params);
        }

        function postEditSequenceForm(params) {
            postPopupForm("EditSequenceForm", SEQUENCE_URL, params);
        }

        function postPopupForm(formId, url, params) {
            // hide frame
            var transferFrame = jQuery("#TransferSlip_Frame");
            transferFrame.hide();

            var form = jQuery("#" + formId);
            // build query string
            var queryParams = [];
            for (var key in params)
                queryParams.push(key + "=" + encodeURI(params[key]));
            var targetURL = url + "&" + queryParams.join("&");
            form.attr("action", targetURL);
            form.submit();

            // todo: always show transfer layer
            hideTransferSpecimens();
            showSpecimenPopup(1000, 400);
        }

        function showSpecimenPopup(width, height) {
            var overlay = jQuery("#Transfer_Overlay");
            var slip = jQuery("#TransferSlip");
            overlay.show();
            slip.show();
            slip.css({
                "width": width + "px",
                "height": height + "px",
                "margin-left": "-" + (width / 2) + "px",
                "margin-top": "-" + (height / 2) + "px"
            });
        }

        function hideTransferSpecimens() {
            jQuery("#Transfer_Overlay,#TransferSlip").hide();
            return false;
        }

        function doTransferUpdated() {
            // close layer and refresh page
            hideTransferSpecimens();
            // re-run search ???
            if (window.doSearchClick) {
                doSearchClick();
            }
            else {
                var form = jQuery("#SpecimensForm");
                var reload = jQuery("#reload");
                reload.val("true");
                form.submit();
                //window.location = window.location;
            }
        }

        function toggleTransferListing(id, index, collectionId) {
            var protocolId = '<%= BaseProtocolId %>';
            var table = jQuery("#" + id);
            var accordianHeaders = table.find("tr.accordianHeader");
            var accordians = table.find("tr.accordian");
            var selectedAccordianHeaders = accordianHeaders.eq(index);
            var selectedAccordian = accordians.eq(index);
            var selectedAccordianLayer = jQuery("#AjaxSpecimens_" + index);
            var isVisible = !selectedAccordian.is(":hidden");
            var hasContent = selectedAccordianLayer.data("hasContent") == true;
            // hide all layers
            accordianHeaders.removeClass("opened");
            accordians.hide().removeClass("opened");
            // show selected if hidden
            if (!isVisible) {
                selectedAccordianHeaders.addClass("opened");
                selectedAccordian.show();
                // fill layer with ajax content (first time)
                if (!hasContent) {
                    doAjaxCallback("getTransferSpecimens", { protocolId: protocolId , collectionId: collectionId }, function (response) {
                        var results = jQuery(response).find("#Specimens_Results");
                        selectedAccordianLayer.empty().append(results).data("hasContent", true);
                    });
                }
            }
        }

        function editSpecimenSequence(row, specimenId, status, e) {
            var canEdit = jQuery(row).hasClass("editSequenceRow");
            if (e && (e.target || e.srcElement || {}).id == "specimens")
                return true;
            // allow special interface on sequencing on special statuses
            var mode = '<%= QueryMode %>';
            if (canEdit) {
                /*
                var transferFrame = jQuery("#TransferSlip_Frame");
                transferFrame.attr("src", "ProtocolSpecimensSequencing.aspx?specimenId=" + specimenId + '&mode=' + mode);
                showSpecimenPopup(480, 320);
                */
                return showEditSpecimenSequence();
            }
            // return false;
        }

        function validateSearch(fieldId) {
            var field = jQuery("#" + fieldId);
            if (field.val() == "") {
                alert('Please enter a value before searching.');
                field.focus();
                return false;
            }
            else {
                return true;
            }
        }

        function showProtocolSpecimenReport(url) {
            showEditDetailsInModal(url, "Specimen Report");
            return false;
        }

        function markcBIOReportGenerated() {
            var selectedSpecimenIds = getSelectedSpecimens();
            if (selectedSpecimenIds.length == 0) {
                alert("Please select at least 1 specimen before continuing.");
            }
            else {
                var valid = validateSelectedSpecimens();
                if (valid) {
                    return true;
                }
                else {
                    alert("Only specimens which are 'Pending cBIO Portal Review' are eligible. Please check your selection(s).");
                }
            }
            return false;
        }

    </script>
    <style type="text/css">
        h3
        {
            margin: 2px auto;
            font-size: 12px;
        }
        .dataEntryNavToggle
        {
            margin: auto;
        }
        .dataEntryNavToggle a
        {
            min-width: 125px;
            margin: 0;
        }
        .CheckBoxListLayerContainer
        {
            max-width: 150px;
            width: 150px;
            max-height: 225px;
        }
        .searchTable
        {
            table-layout: fixed;
            width: 100%;
            margin: 0;
        }
        .searchTable th a
        {
            font-weight: bold;
            text-decoration: underline;
        }
        .searchTable th, .searchTable td
        {
            width: auto;
            vertical-align: top;
            padding: 2px 3px;
            white-space: normal;
        }
        .searchTable th:first-child label, .searchTable td:first-child label
        {
            display: block;
            text-align: center;
        }
        .searchFilter
        {
            display: none;
        }
        .searchFilter label, .searchFilter input, .searchFilter select
        {
            display: inline-block;
            width: 100px;
        }
        .dataEntryLayoutTable td
        {
            vertical-align: top;
        }
        .dataGridHeader a
        {
            color: #bbbbbb;
        }
        .dataGrid td
        {
            white-space: normal;
        }
        #SearchBtn
        {
            width: 100px;
        }
        #RecordCount
        {
            display: block;
            text-align: center;
            margin: 5px auto;
        }
        #SpeicmenInventory_Options
        {
            display: block;
            text-align: center;
            width: auto;
        }
        .SpecimenDataEntryPanel
        {
            margin: auto 5px;
        }
        #MainContainer
        {

        }
        #ReportBtn
        {
            position: absolute;
            top: 80px;
            right: 5px;
        }
        #Transfer_Overlay
        {
            display: block;
            position: absolute;
            top: 25px;
            right: 0;
            bottom: 0;
            left: 0;
            background-color: #444444;
            opacity: 0.5;
            filter: alpha(opacity = 50);
            z-index: 1001;
        }
        .Transfer_OverlayLayer
        {
            display: block;
            position: absolute;
            top: 50%;
            left: 50%;
            width: 900px;
            margin-left: -450px;
            height: 400px;
            margin-top: -200px;
            max-height: 480px;
            border: 1px solid #bbbbbb;
            border-radius: 3px;
            background-color: #ffffff;
            z-index: 1002;
        }
        .Transfer_OverlayLayer iframe
        {
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            margin: 0;
            z-index: 100;
        }
        .Transfer_OverlayLayer img.closeBtn
        {
            cursor: pointer;
             z-index: 101;
        }
        .Transfer_OverlayLayerOverflow
        {
            background-color: #dddddd;
            margin: 15px 5px;
            min-height: 100px;
            max-height: 350px;
            overflow: auto;
        }
        .Transfer_OverlayLayer .closeBtn
        {
            position: absolute;
            top: 5px;
            right: 5px;
        }
        .transferButtons
        {
            display: inline-block;
            text-align: center;
            margin: 2px 5px;
        }
        .transferButtons .dataEntryButtonGray, .transferButtons .dataEntryButtonRed
        {
            display: inline-block;
            min-width: 100px;
            width: auto;
            margin: 5px auto;
        }
        .dataEntryButtonGray
        {
            white-space: normal;
        }
        tr.accordian
        {
            display: none;
        }
        tr.accordian td > div
        {
            background-color: #eeeeee;
            max-height: 200px;
            overflow: auto;
        }
        tr .expand-icon, tr.closed .expand-icon
        {
            display: inline-block;
            border: none;
            width: 9px;
            height: 9px;
            margin: auto 5px;
            vertical-align: middle;
            background-image: url('../../Images/Icon_Plus.gif');
        }
        tr.opened .expand-icon
        {
            background-image: url('../../Images/Icon_Minus.gif');
        }
        .noTransferRow > td:first-child,
        .noTransferCell 
        {
            color: #000000;
            background-color: #EBDFDF;
        }
        .editSequenceRow > td:first-child,
        .editSequenceCell
        {
            background-color: #E1E1EB;
        }
        #Legend
        {
            position: absolute;
            table-layout: fixed;
            border: 1px solid #eeeeee;
        }
        #Legend td
        {
            font-size: 10px;
            text-align: center;
            min-width: 65px;
            padding: 2px 5px;
        }
    </style>
</head>
<body class="PatientPortalBody">
    <div id="PatientPortalHeaderBar" class="PatientTitleBar">
        <div id="CustomProtocolText" style="padding-top: 5px;">
            <b>Manage Specimen Inventory</b>
            <asp:Literal runat="server" ID="ImportantNotice" Visible="false">
            : Currently viewing Specimens across <b>ALL</b> patients on this trial.
            </asp:Literal>
        </div>
    </div>
    <div class="PatientTabBar" id="PatientTabBar" style="padding:0; margin-top: -1px;">
        <table width="100%" cellspacing="0" cellpadding="0" border="0" id="PatientMenuTable">
            <tbody>
                <tr>
                    <td style="text-align: center;">
                        <a runat="server" id="Collection_Link">
                            <img style="cursor: pointer;" title="Collection" alt="PatientSpecimens"
                                src="Images/PatientPortalTabSpecimenCollection<%= QueryMode=="collection" ? "_on" : "" %>.png" class="LargeTabPage"></a>
                    </td>
                    <td style="text-align: center;">
                        <a runat="server" id="Pathology_Link">
                            <img style="cursor: pointer;" title="Pathology" alt="PatientSpecimens"
                                src="Images/PatientPortalTabSpecimenPathology<%= QueryMode=="pathology" ? "_on" : "" %>.png" class="LargeTabPage"></a>
                    </td>
                     <td style="text-align: center;">
                        <a runat="server" id="Sequencing_Link">
                            <img style="cursor: pointer;" title="Sequencing" alt="PatientSpecimens"
                                src="Images/PatientPortalTabSpecimenSequencing<%= QueryMode=="sequencing" ? "_on" : "" %>.png" class="LargeTabPage"></a>
                    </td>
                   <td style="text-align: center;">
                        <a runat="server" id="Analysis_Link">
                            <img style="cursor: pointer;" title="Analysis" alt="PatientSpecimens"
                                src="Images/PatientPortalTabSpecimenAnalysis<%= QueryMode=="analysis" ? "_on" : "" %>.png" class="LargeTabPage"></a>
                    </td>
                  <td style="text-align: center;">
                        <a runat="server" id="cBIO_Link">
                            <img style="cursor: pointer;" title="cBIO" alt="PatientSpecimens"
                                src="Images/PatientPortalTabSpecimenCBIO<%= QueryMode=="cbio" ? "_on" : "" %>.png" class="LargeTabPage"></a>
                    </td>    
                     <td style="text-align: center;">
                        <a runat="server" id="Manage_Link">
                            <img style="cursor: pointer;" title="Manage Subject IDs" alt="PatientSpecimens"
                                src="Images/PatientPortalTabManageIDs<%= QueryMode=="manage" ? "_on" : "" %>.png" class="LargeTabPage"></a>
                    </td>           
                </tr>
            </tbody>
        </table>
    </div>
    <!-- Transfer Form -->
    <form id="TransferForm" name="TransferForm" action="" method="post" target="TransferSlip_Frame">
    <input type="hidden" id="transfer_specimens" name="specimens" value="" />
    </form>
    <!-- edit sequencing form -->
    <form id="EditSequenceForm" name="EditSequenceForm" action="" method="post" target="TransferSlip_Frame">
    <input type="hidden" id="sequence_specimens" name="specimens" value="" />
    </form>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <form id="SpecimensForm" runat="server">
    <!-- trigger reload -->
    <input type="hidden" id="reload" name="reload" value="" />
    <div id="MainContainer">
    <!-- view report -->
    <asp:HyperLink runat="server" ID="ReportBtn" 
        Target="_blank" onclick="return showProtocolSpecimenReport(this.href);" Text="View Report"
        CssClass="dataEntryButtonRed"></asp:HyperLink>
    <!-- view mode -->
    <div id="ViewModeToggle" class="dataEntryNavToggleContainer">
        <div class="dataEntryNavToggle">
            <a href="<%= GetQueryString("ProtocolSpecimens.aspx") %>&mode=<%= QueryMode %>&view=specimens"
                class="<%= QueryView == "" || QueryView == "specimens" ? "active" : "" %>">Specimens
            </a>
            <a href="<%= GetQueryString("ProtocolSpecimens.aspx") %>&mode=<%= QueryMode %>&view=transfer"
                class="<%= QueryView == "transfer" ? "active" : "" %>">
                Transfers</a>
        </div>
    </div>
    <!-- Transfer -->
    <div id="Transfer_Overlay" style="display: none;">
    </div>
    <div id="TransferSlip" style="display: none;" class="Transfer_OverlayLayer">
        <iframe id="TransferSlip_Frame" name="TransferSlip_Frame" src="" frameborder="0">
        </iframe>
        <img alt="Close" class="closeBtn" src="Images/Close_white.gif" onclick="hideTransferSpecimens();" />
    </div>
    <!-- Specimen Search Options -->
    <table runat="server" id="Specimen_Filters">
        <tr>
            <td>
                <label for="SearchSelection">
                    Search Type
                </label>
            </td>
            <td>
                <cic:CaisisSelect runat="server" ID="SearchSelection" ShowLabel="false" RepeatLayout="Table"
                    RepeatDirection="Horizontal" Width="100%">
                    <asp:ListItem Text="All" Value="" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Study ID" Value="PtProtocolStudyId"></asp:ListItem>
                    <asp:ListItem Text="Specimen ID" Value="SpecimenReferenceNumber"></asp:ListItem>
                    <asp:ListItem Text="Status" Value="SpecimenStatus"></asp:ListItem>
                    <asp:ListItem Text="Site" Value="SpecimenSite"></asp:ListItem>
                </cic:CaisisSelect>
            </td>
            <td>
                <!-- Filter Options -->
                <div id="Empty_Layer" class="searchFilter">
                    <input type="text" disabled="disabled" value="All Specimens" />
                </div>
                <div id="PtProtocolStudyId_Layer" class="searchFilter">
                    <cic:CaisisComboBox runat="server" ID="PtProtocolStudyId_Filter" ShowLabel="false">
                    </cic:CaisisComboBox>
                </div>
                <div id="SpecimenReferenceNumber_Layer" class="searchFilter">
                    <cic:CaisisTextBox runat="server" ID="SpecimenReferenceNumber_Filter" ShowLabel="false">
                    </cic:CaisisTextBox>
                </div>
                <div id="SpecimenStatus_Layer" class="searchFilter">
                    <cic:CaisisSelect runat="server" ID="SpecimenStatus_Filter" ShowLabel="false" DataTextField="FieldText"
                        DataValueField="FieldValue">
                    </cic:CaisisSelect>
                </div>
                <div id="SpecimenSite_Layer" class="searchFilter">
                    <cic:CaisisSelect runat="server" ID="SpecimenSite_Filter" ShowLabel="false" DataTextField="ShortName"
                        DataValueField="ShortName">
                    </cic:CaisisSelect>
                </div>
            </td>
            <td>
                <label for="ColumnSelection">
                    Display Columns</label>
            </td>
            <td>
                <cic:CaisisCheckBoxList runat="server" ID="ColumnSelection" ShowLabel="false" RepeatLayout="Table"
                    RepeatColumns="1" RepeatDirection="Horizontal" DataTextField="Value" DataValueField="Key"
                    ShowOther="false" DropDown="true" DropDownTextWidth="150px">
                </cic:CaisisCheckBoxList>
            </td>
            <td>
                <asp:CheckBox runat="server" ID="BankedSpecimensPreference" Text="Hide Banked Specimens?"  />
            </td>
            <td>
                <asp:Button runat="server" ID="SearchBtn" CssClass="dataEntryButtonRed" Text="Search"
                    OnClick="SearchSpecimensClick" />
            </td>
        </tr>
    </table>
    <!-- Transfer Options -->
    <table runat="server" id="Transfer_Filters">
        <tr>
            <td>
                <label for="Transfer_SearchSelection">
                    Search Type
                </label>
            </td>
            <td>
                <cic:CaisisSelect runat="server" ID="Transfer_SearchSelection" ShowLabel="false"
                    RepeatLayout="Table" RepeatDirection="Horizontal" Width="100%">
                    <asp:ListItem Text="Transfer ID" Value="RequestIdentifier" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Specimen ID" Value="SpecimenReferenceNumber"></asp:ListItem>
                </cic:CaisisSelect>
            </td>
            <td>
                <label for="Transfer_SearchValue">
                    Search Value</label>
            </td>
            <td>
                <cic:CaisisTextBox runat="server" ID="Transfer_SearchValue" ShowLabel="false"></cic:CaisisTextBox>
            </td>
            <td>
                <asp:Button runat="server" ID="SearchTransersBtn" CssClass="dataEntryButtonRed" Text="Search"
                    OnClick="SearchTransfersClick" OnClientClick="return validateSearch('Transfer_SearchValue');" />
            </td>
        </tr>
    </table>
    <!-- Sorting -->
    <asp:HiddenField runat="server" ID="SortColumn" />
    <asp:HiddenField runat="server" ID="SortDirection" />
    <div id="SpecimenInventory_Container">
        <div id="MainHeader">
            <!-- inventory header -->
            <asp:PlaceHolder runat="server" ID="SpecimenInventory_SectionHeader">
                <table id="SpecimenInventory_Header" class="searchTable">
                    <thead class="dataGridHeader">
                        <tr>
                            <th>
                                <label>
                                    <input type="checkbox" id="checkall-checkbox" />
                                    Select</label>
                            </th>
                            <asp:Repeater runat="server" ID="HeaderRptr" OnItemDataBound="SetSorting">
                                <ItemTemplate>
                                    <th style="<%# Container.DataItem.ToString().Contains("Date") ||  Container.DataItem.ToString().Contains("Time") ? "width: 65px;": "" %>">
                                        <asp:LinkButton runat="server" ID="SortLink" OnCommand="BuildOnSortClick"></asp:LinkButton>
                                    </th>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tr>
                    </thead>
                </table>
            </asp:PlaceHolder>
            <!-- Transfer Header -->
            <asp:PlaceHolder runat="server" ID="TransferListing_SectionHeader">
                <asp:PlaceHolder runat="server" ID="TransferListing_Header">
                    <table class="searchTable">
                        <thead>
                            <tr class="dataGridHeader">
                                <th>
                                    Specimens
                                </th>
                                <%-- <th>
                                Status
                            </th>--%>
                                <th>
                                    Transfer ID
                                </th>
                                <th>
                                    Dispatch Date
                                </th>
                                <th>
                                    Dispatched Contact
                                </th>
                                <th>
                                    Dispatched Institution
                                </th>
                                <th>
                                    Received Date
                                </th>
                                <th>
                                    Received Contact
                                </th>
                                <th>
                                    Received Institution
                                </th>
                                <th>
                                    Tracking #
                                </th>
                                <th>
                                    Action
                                </th>
                            </tr>
                        </thead>
                    </table>
                </asp:PlaceHolder>
                <!-- transfer search by specimen -->
                <asp:PlaceHolder runat="server" ID="TransferSpecimenListing_Header" Visible="false">
                    <table class="searchTable">
                        <thead>
                            <tr class="dataGridHeader">
                                <th>
                                    Specimen ID
                                </th>
                                <th>
                                    Transfers
                                </th>
                            </tr>
                        </thead>
                    </table>
                </asp:PlaceHolder>
            </asp:PlaceHolder>
        </div>
        <div id="MainOverflow" style="max-height: 500px; overflow: auto;">
            <!-- inventory listing -->
            <asp:PlaceHolder runat="server" ID="SpecimenInventory_Section">
                <table id="SpecimenInventory" class="searchTable dataGrid">
                    <tbody>
                        <asp:Repeater ID="SpecimenInventoryRows" runat="server" OnItemDataBound="BindSpecimenColumns">
                            <ItemTemplate>
                                <tr class="<%# Container.ItemIndex%2==0?"ItemRow_A":"ItemRow_B" %> <asp:Literal runat="server" ID="SequenceRowClass"></asp:Literal>">
                                    <td class="<%# (bool)Eval("TransferEnabled") ? "" : "noTransferCell" %>">
                                        <label>
                                            <input id="specimens" name="specimens" type="checkbox" value="<%# Eval("SpecimenId") %>" <%# (bool)Eval("TransferEnabled") ? "" : "data-disabled='true'" %> />
                                        </label>
                                    </td>
                                    <asp:Repeater runat="server" ID="SpecimenInventoryColumns">
                                        <ItemTemplate>
                                            <td>
                                                <%# Container.DataItem %>
                                            </td>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </asp:PlaceHolder>
            <!-- transfer listing -->
            <asp:PlaceHolder runat="server" ID="TransferListing_Section">
                <table id="TransferListing" class="dataGrid" cellpadding="0" cellspacing="0" border="0"
                    style="margin: 0; width: 100%;">
                    <asp:Repeater runat="server" ID="TransferListing_Rptr" OnItemDataBound="SetCurrentTransferClick">
                        <ItemTemplate>
                            <tr class="accordianHeader <%# Container.ItemIndex%2==0?"ItemRow_A":"ItemRow_B" %> closed"
                                onclick="toggleTransferListing('TransferListing', <%# Container.ItemIndex %>, '<%# Eval("CollectionId") %>');">
                                <td>
                                    <img src="../../Images/shim.gif" class="expand-icon" />
                                    <%# Eval("SpecimenCount") %>
                                </td>
                                <%--<td>
                                    <%# Eval("SpecimenStatus")%>
                                </td>--%>
                                <td>
                                    <%# Eval("RequestIdentifier")%>
                                </td>
                                <td>
                                    <%# Eval("DispatchedDate", "{0:d}")%>
                                </td>
                                <td>
                                    <%# Eval("DispatchedContact")%>
                                </td>
                                <td>
                                    <%# Eval("DispatchedInstitution")%>
                                </td>
                                 <td>
                                    <%# Eval("ReceivedDate", "{0:d}")%>
                                </td>
                                <td>
                                    <%# Eval("ReceivedContact")%>
                                </td>
                                <td>
                                    <%# Eval("ReceivedInstitution") %>
                                </td>
                                <td>
                                    <%# Eval("DispatchedTrackingNumber")%>
                                </td>
                                <td style="text-align: center;">
                                    <asp:Button runat="server" ID="ReceivedButton" CssClass="dataEntryButtonGray" Text="Mark as Received" />
                                </td>
                            </tr>
                            <!-- ajax populated list -->
                            <tr id="TransferSpecimens_<%# Container.ItemIndex %>" class="accordian closed">
                                <td colspan="11">
                                    <div id="AjaxSpecimens_<%# Container.ItemIndex %>">
                                        &nbsp;
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- transfer search by specimen -->
                    <asp:Repeater runat="server" ID="TransferSpecimenListing_Rptr" OnItemDataBound="BuildSpecimenTransfers">
                        <ItemTemplate>
                            <tr class="<%# Container.ItemIndex%2==0?"ItemRow_A":"ItemRow_B" %>">
                                <td>
                                    <%# Eval("SpecimenReferenceNumber")%>
                                </td>
                                <td>
                                    <asp:Repeater runat="server" ID="SpecimenTransfers_Rptr">
                                        <ItemTemplate>
                                            <%# Eval("RequestIdentifier")%>
                                        </ItemTemplate>
                                        <SeparatorTemplate>
                                            ,
                                        </SeparatorTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </asp:PlaceHolder>
            <!-- ajax transfer specimen list -->
            <asp:GridView runat="server" ID="Specimens_Results" GridLines="None" CssClass="dataGrid"
                HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="ItemRow_A" AlternatingRowStyle-CssClass="ItemRow_B"
                AutoGenerateColumns="false" Visible="false" Width="500px">
                <Columns>
                    <asp:BoundField DataField="SpecimenReferenceNumber" HeaderText="Specimen ID" />
                    <asp:BoundField DataField="SpecimenSubType" HeaderText="Specimen Type" />
                    <asp:BoundField DataField="SpecimenStatus" HeaderText="Current Status" />
                </Columns>
                <%--        specimenid accessionProcName identifier specimenReferenceNumber specimenType specimenSubType
        specimenStatus specimenOriginalQty specimenRemainingQty specimenUnits boxId boxName
        positionId--%>
            </asp:GridView>
        </div>
        <!-- results footer -->
        <table runat="server" id="Legend" visible="false">
            <tr>
                <td class="boldText">
                    Legend
                </td>
                <td class="editSequenceCell">
                    Edit Available
                </td>
                <td class="noTransferCell">
                    Transfer Not Available
                </td>
            </tr>
        </table>
        <!-- record count -->
        <asp:Label runat="server" ID="RecordCount" CssClass="boldText"></asp:Label>

        <asp:PlaceHolder runat="server" ID="SpecimenInventoryButton_Section">
            <div id="SpeicmenInventory_Options" class="SpecimenDataEntryPanel">
                <!-- Collection Fields -->
                <asp:Panel runat="server" ID="Collection_Panel" Visible="false" CssClass="transferButtons">
                    <h3>
                        Options:</h3>
                    <span onclick="return showTransferSpecimens('request', 'In Transit to Pathology', 'Transfer to Pathology');"
                        class="dataEntryButtonRed">Transfer Selected Specimens to Pathology</span>
                </asp:Panel>
                <asp:Panel runat="server" ID="Pathology_Panel" Visible="false" CssClass="transferButtons">
                    <h3>
                        Options:</h3>
<%--                    <asp:Button runat="server" ID="Reviewed_Btn" Text="Mark Selected Specimens as Reviewed"
                        CssClass="dataEntryButtonGray" OnCommand="UpdateSpecimenStatusCommand" CommandArgument="Pathology Review Completed" />
--%>                    <span onclick="return showTransferSpecimens('request', 'In Transit to Sequencing', 'Transfer to Sequencing');"
                        class="dataEntryButtonRed">Transfer Selected Specimens to Sequencing</span>
                   
                </asp:Panel>
                <asp:Panel runat="server" ID="Sequencing_Panel" Visible="false" CssClass="transferButtons">
                    <h3>
                        Mark Selected Specimens as:</h3>
                    <%--                    <asp:Button runat="server" ID="TissueExtraction_Btn" Text="Tissue Extraction Successful"
                        CssClass="dataEntryButtonGray" OnCommand="UpdateSpecimenStatusCommand" CommandArgument="Tissue Extraction Successful" />
                    <asp:Button runat="server" ID="Sequenced_Btn" Text="Sequenced" CssClass="dataEntryButtonGray"
                        OnCommand="UpdateSpecimenStatusCommand" CommandArgument="Sequenced" />--%>
                    <span onclick="return showTransferSpecimens('request', 'In Transit to Analysis', 'Transfer to Analysis');"
                        class="dataEntryButtonRed">Transfer Selected Specimens to Analysis</span>
                 
                </asp:Panel>
                <asp:Panel runat="server" ID="Analysis_Panel" Visible="false" CssClass="transferButtons">
<%--                    <asp:Button runat="server" ID="AnalysisComplete_Btn" Text="Mark as Analysis Complete"
                        CssClass="dataEntryButtonGray" OnCommand="UpdateSpecimenStatusCommand" CommandArgument="Analysis Complete" />
--%>                    <span onclick="return showTransferSpecimens('request', 'In Transit to cBIO Portal', 'Transfer to cBIO Portal');"
                        class="dataEntryButtonRed">Transfer Selected Specimens to cBIO Portal</span>
                        </asp:Panel>
                <asp:Panel runat="server" ID="cBIO_Panel" Visible="false" CssClass="transferButtons">
                    <asp:Button runat="server" ID="cBIO_Report" Text="Mark as cBIO Report Generated"
                        CssClass="dataEntryButtonGray" OnCommand="UpdateSpecimenStatusCommand" CommandArgument="cBIO Report Generated" OnClientClick="return markcBIOReportGenerated();" />
                </asp:Panel>
                <asp:Panel runat="server" ID="EditSequencePanel" Visible="false" CssClass="transferButtons">
                    <!-- bulk edit -->
                    <span class="dataEntryButtonGray" onclick="return showEditSpecimenSequence();">Edit Selected Specimen(s)</span>
                </asp:Panel>
            </div>
        </asp:PlaceHolder>
    </div>
    </div>
    </form>
    <iframe runat="server" id="Manage_Frame" frameborder="0" visible="false" style=" display: block; width: 95%; margin: auto;"></iframe>
</body>
</html>
