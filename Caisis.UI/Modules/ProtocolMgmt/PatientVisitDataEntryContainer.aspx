<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientVisitDataEntryContainer.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientVisitDataEntryContainer" %>
<%@ Register TagPrefix="ajax" Namespace="Caisis.UI.ClientScript.Ajax" %>
<%@ Register TagPrefix="pat" TagName="PatientHeader" Src="ProtocolPatientTitleBar.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Visit Data Entry</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        var PORTAL_RETURN_TAB = '<%= QueryTab %>';
        
        var GO_TO_DATE = '';

        if (parent.setPortalHeaderSmall) { parent.setPortalHeaderSmall(); }

        var DEFAULT_ITEM_CLASS = 'itemListRow';
        var ACTIVE_ITEM_CLASS = 'itemListRow_on';

        var activeLink;
        var Items = {}

        function onWindowResize() {
            var winHeight = getHeight(window) - 125;
            $('DataEntryFrame').style.height = winHeight + 'px';
            $('NavOverflow').style.height = winHeight - 100 + 'px';
        }

        // saves the current data entry form
        function saveCurrentDataEntry() {
            // call save on inner frame
            var dataEntryFrame = window.frames['DataEntryFrame'];
            // save the current item and stay on item
            if (dataEntryFrame.saveCurrentDataEntry) {
                dataEntryFrame.saveCurrentDataEntry();
            }
            return false;
        }

        // saves the current data entry form and advances to the next item
        function saveCurrentDataEntryAndAdvance() {
            // call save on inner frame
            var dataEntryFrame = window.frames['DataEntryFrame'];
            // saves the current and move to next
            if (dataEntryFrame.saveCurrentAndAdvance) {
                dataEntryFrame.saveCurrentAndAdvance();
            }
            return false;
        }

        // call data entry frame to save current form and load next item
        function saveAndLoadItem(item, encryptedItemId) {
            // if clicking on active item, no need to save and reload
            if (item.isActiveItem()) {
                return false;
            }
            else {
                // call save on item and only set active on success
                var saved = saveItem(encryptedItemId);
                if (saved) {
                    item.setAsActive();
                }
                return false;
            }
        }

        function saveAndGoToPortal() {
            var dataEntryFrame = window.frames['DataEntryFrame'];
            if (dataEntryFrame.saveAndGoToPortal) {
                dataEntryFrame.saveAndGoToPortal();
            }
            return false;
        }

        function saveItem(encryptedItemId) {
            var saveSuccess = false;
            var dataEntryFrame = window.frames['DataEntryFrame'];
            if (dataEntryFrame.saveAndLoadItem) {
                var sVal = dataEntryFrame.saveAndLoadItem(encryptedItemId);
                saveSuccess = sVal != null ? sVal : false;
            }
            return saveSuccess;
        }

        function checkDataEntry() {
            var dataEntryFrame = window.frames['DataEntryFrame'];
            var isDirty = isPageDirty(dataEntryFrame);
            if (isDirty) {
                var doSaveAndReturn = confirm('You have made changes to the page, would you like to save the current page before returning?');
                if (doSaveAndReturn) {
                    saveAndGoToPortal();
                }
                return !doSaveAndReturn;
            }
            else {
                return true;
            }
        }

        function reloadPatientPortal() {
            if (checkDataEntry()) {
                // important, optional query string params need to be encoded before passing along
                var escapedExtraDateParam = escape('&SetCalendarDate=' + GO_TO_DATE);                
                window.location = '<%= PatientPortalURL %>' + escapedExtraDateParam;
            }
            return false;
        }

        // adjusts the item's status to active
        function syncNavigation(encryptedItemId, status) {
            // verify item is active item
            var item = Items[encryptedItemId];
            if (item) {
                item.setAsActive();
                item.setStatus(status);
            }
        }

        // set the specified item as active
        function setActivePatientItem(encryptedItemId) {
            var item = Items[encryptedItemId];
            if (item) {
                setActiveLink(item);
            }
        }

        // set the specified UI item as active
        function setActiveLink(item) {
            if (activeLink && activeLink != item) { activeLink.className = DEFAULT_ITEM_CLASS; }
            activeLink = item;
            activeLink.className = ACTIVE_ITEM_CLASS;
            // if item is last, adjust buttons
            var dataEntryItems = $('VisitItems').tag('TD');
            var saveAdvanceBtn = $('SaveAdvanceBtn');
            // if editing last/single item, hide advance to next button
            if (dataEntryItems[dataEntryItems.length - 1] == activeLink) {
                saveAdvanceBtn.style.display = 'none';
            }
            else {
                saveAdvanceBtn.style.display = '';
            }
        }

        function isItemActive(item) { return item.className == ACTIVE_ITEM_CLASS; }

        function setItemStatus(item, status) {
            item.status = status;
            item.statusImage.src = 'Images/Icon_' + status.replace(' ', '') + '.png';
            //item.statusText.innerHTML = status;
        }

        function addEventsToDataEntryItems(e) {
            var dataEntryItems = $('VisitItems').tag('TD');
            dataEntryItems.foreach(addEventsToDataEntryItem);

            // retrieve latest status for each visit item
            syncMainNavigation();
        }

        // updates the main navigation
        function setNavigationItems(returnValue, returnObj) {
            var list = eval(returnValue);
            if (list.length > 0) {
                // for each visit item, update status
                for (var i = 0; i < list.length; i++) {
                    var encryptedItemId = list[i][0];
                    var itemStatus = list[i][1];
                    var item = Items[encryptedItemId];
                    if (item) {
                        setItemStatus(item, itemStatus);
                    }
                }
            }
        }

        // add helper functions to visit items
        // item = table row's cell
        function addEventsToDataEntryItem(item) {
            // provide a lookup based on enc pat item id
            Items[item.title] = item;
            item.title = '';
            item.statusImage = item.tag('IMG')[0];
            item.statusText = item.tag('SPAN')[0];
            // set helper functions on node
            item.isActiveItem = curry(isItemActive, item);
            item.setAsActive = curry(setActiveLink, item);
            item.setStatus = curry(setItemStatus, item);
            // set as active item if needed
            if (item.isActiveItem()) { item.setAsActive(); }
        }

        //window.addEvent('load',addEventsToDataEntryItems);

        /* ]]> */
    </script>

    <style type="text/css">
    body
    {
	    padding: 0px;
	    margin: 0px;
	    background-color: #ffffff;
    }
    .dataEntryArea_Main
    {
	    background-image:url(Images/DataEntryAreaBG_TopLeft.gif);
	    background-repeat: no-repeat;
    	
    }
    .dataEntryArea_TopRight
    {
	    background-image:url(Images/DataEntryAreaBG_TopRight.gif);
	    background-repeat: no-repeat;
	    width: 9px;
    }
    #NavOverflow
    {
        width: 100%; 
        height: 450px;
        overflow: auto;
        vertical-align: top;
        overflow-x: hidden;
    }
    #VisitItems
    {
        border-bottom: solid 1px #cccccc;
    }
    .itemListRow
    {
	    border: solid 1px #dddddd;
	    background-color: #f9f9f9;
	    border-bottom: none;
	    border-right: none;
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
	    background-image: url(Images/DataEntryItemRow_on.gif);
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
    .visitDataEntryButton
    {
        float: right;
        margin-right: 20px;
        margin-top: 8px;
        cursor: pointer;
    }
</style>
</head>
<body class="PatientPortalBody_miniTabs">
    <form id="form1" runat="server">
        <%-- Ajax Helper to fetch visit status --%>
        <ajax:CaisisAjaxHelper ID="RefreshNavigationAjax" runat="server" OnCallbackScript="setNavigationItems"
            OnProcessCallback="GetLatestItemStatuses" DoCallbackScript="syncMainNavigation">
        </ajax:CaisisAjaxHelper>
        <pat:PatientHeader runat="server" ID="PatientTitleHeader" />
        <div class="PatientMiniTabBar">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="padding-left: 25px;">
                        Enter Data for
                        <asp:Label runat="server" ID="VisitTitle"></asp:Label>
                    </td>
                    <td style="padding-left: 25px;">
                        <img src="Images/Button_GoBackShowTabs.png" alt="Return to Visits" style="float: right; margin-right: 40px; border-style: none; cursor: pointer;"
                            onclick="return reloadPatientPortal();" />
                    </td>
                </tr>
            </table>
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="width: 122px; vertical-align: top;">
                    <div id="NavOverflow">
                        <!-- Visit Items Navigation -->
                        <table id="VisitItems" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <asp:Repeater runat="server" ID="PatientVisitsRptr">
                                <ItemTemplate>
                                    <tr>
                                        <td title="<%# EncryptValue(Eval("PatientItemId").ToString()) %>" class="itemListRow<%# EncryptValue(Eval("PatientItemId").ToString()) == QueryPatientItem ? "_on" : "" %>"
                                            onclick="return saveAndLoadItem(this,'<%# EncryptValue(Eval("PatientItemId").ToString()) %>');">
                                            <img src="Images/Icon_<%# GetItemStatus(Container.DataItem).Replace(" ","") %>.png"
                                                width="9" height="9" style="margin-right: 8px;">
                                            <span>
                                                <%# Eval("ItemDescription") %>
                                            </span>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                    <img src="Images/ItemStatusLegend.png" alt="Item Status Legend" style="margin: 30px 0px 0px 10px;" />
                </td>
                <td>
                    <table width="98%" border="0" cellspacing="0" cellpadding="0" style="border: solid 1px #cccccc;">
                        <tr>
                            <td class="dataEntryArea_Main">
                                <iframe id="DataEntryFrame" name="DataEntryFrame" style="margin-top: 17px; margin-left: 22px;
                                    width: 97%; height: 600px;" frameborder="0" src="<%= GetQueryString("PatientVisitDataEntry.aspx") + "&patientItemId=" + QueryPatientItem %>">
                                </iframe>
                            </td>
                            <td class="dataEntryArea_TopRight" style="width: 9px; height: 1px;">
                            </td>
                        </tr>
                    </table>
                    <%-- data entry buttons --%>                    
                    <img runat="server" id="SaveReturnCalendarBtn" class="visitDataEntryButton" src="Images/Button_ReturnToCalendar.png" alt="Save and Return to Calendar"
                        title="Save and Return to Calendar" onclick="return saveAndGoToPortal();" />
                    <img runat="server" id="SaveReturnListBtn" class="visitDataEntryButton" src="Images/Button_ReturnToVisitList.png" alt="Save and Return to Visit List"
                        title="Save and Return to Visit List" onclick="return saveAndGoToPortal();" />
                    <img id="SaveAdvanceBtn"  class="visitDataEntryButton" src="Images/Button_SaveAndContinue.png" alt="Save and Continue" title="Save and Continue"
                        onclick="return saveCurrentDataEntryAndAdvance();" />
                    <img id="SaveBtn" class="visitDataEntryButton" src="Images/Button_Save.png" alt="Save"
                        title="Save" onclick="return saveCurrentDataEntry();" />
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        /* <![CDATA[ */

        // init click events
        addEventsToDataEntryItems();

        /* ]]> */
    </script>
</body>
</html>
