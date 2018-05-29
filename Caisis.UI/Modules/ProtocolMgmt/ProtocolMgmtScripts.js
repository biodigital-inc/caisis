// JScript File

/* jQuery check */
if (window.jQuery)
    window.jQuery.noConflict();

// Ensures correct tab is selected when page loaded, 
// only fires for pages loaded into Patient Portal Content Frame.
// The HTML <title> node is used as lookup key for Tab
if(parent.setActiveTab) 
{
    var setTabInParent = function() { parent.setActiveTab(window.document.title); }
    // Set tab
    setTabInParent();
    // Also set tab onload if Tabs object not yet constructed
    $(window).addEvent('load',setTabInParent);
}

// MOVE TO utilities.js
// Gets if a form's input fields have changed from server response
// isPageDirty: window object(defaults to 1st form object) or form object
function isPageDirty(w)
{
    var form;
    if(w && w.document) { form = w.document.forms[0]; }
    else if(w && w.elements) { form = w; }
    else { form = window.forms[0]; }
    if(form)
    {
        var fields = form.elements;
        return Map(fields,isFieldDirty).toBool('||');
    }
    else { return false; }
}

function checkOnFocus(id) { if($(id)) $(id).checked = true; }

var ROW_HOVER_CLASS = 'dataGridItemHover';
var ROW_CLICK_CLASS = 'datGridItemClick';

var HoverGrids = new Array();
function addHoverToGrid(gridId)
{
    // If a grid exist, wire hover events
    if($(gridId)) { wireRowOverEvents(gridId); }
    else { HoverGrids.push(gridId); }
    
}

function wireRowOverEvents(id)
{
    var grid = $(id);
    if(grid)
    {
        wireRowOverEventsForTable(grid, '_tr_');
        var innerTbs = grid.getElementsByTagName('table');

        for (i = 0; i < innerTbs.length; i++)
        {
            wireRowOverEventsForTable($(innerTbs[i].id), '_sub_tr_schema');
        }
    }
}

function wireRowOverEventsForTable(grid, rowName)
{
    // Loop throws rows and add hover events
    grid.foreach('rows',function(row,i)
    {
        if (row.id.length >= rowName.length && row.id.substring(0, rowName.length) == rowName)
        {
            row.addEvent('mouseover',curry(handleRowOver,row));
            row.addEvent('mouseout',curry(handleRowOut,row));
            //if (row.id.substring(0,14) == '_sub_tr_schema')
                row.addEvent('click',curry(handleRowClick,grid,row));
        }
        
    });
}

function wireHoverEventsForGrid(){ $(window.document).tag('TABLE.ProjectGrid').foreach(wireRowOverEvents); }

// When window loads, find all grids with className 'ProjectGrid', and wire hover events
if (window.addEvent)
    window.addEvent('load',wireHoverEventsForGrid);

// When window loads wire hover events to grids
if (window.addEvent)
    window.addEvent('load',function() { ForEach(HoverGrids,wireRowOverEvents,this); } );


function handleRowOver(node,evt) 
{
    if(isMouseEnter(node,evt) && node.className!=ROW_CLICK_CLASS)
    {
        node.refClass = node.refClass ? node.refClass : node.className;
        node.className = ROW_HOVER_CLASS;
    }
}

function handleRowOut(node,evt) 
{  
    if(isMouseLeave(node,evt) && node.className!=ROW_CLICK_CLASS && node.refClass)
    { 
        node.className = node.refClass; 
    } 
}

// Makes a call to the server based on column
function doMainListSort(val, col) 
{
    if(!lock.isLocked())
    {
        var SortOrder;
        if ($('HiddenSortColumn').value == col)
        {
            if ($('HiddenSortOrder').value == 'DESC')
                SortOrder = 'ASC';
            else
                SortOrder = 'DESC';
        }
        else
        {
            SortOrder = 'ASC';
        }
        
        $('HiddenSortColumn').value = col;
        $('HiddenSortOrder').value = SortOrder;
        
        var sType = $('SearchType').value;

        if (val == DEFAULT_SEARCH_TEXT)
            val = '';
        if(delayedSearch) { clearTimeout(delayedSearch); }
        var delayedSearchFunc = curry(doSearchCallback,sType,val, 'Sort', col + ' ' + SortOrder);
        delayedSearch = setTimeout(delayedSearchFunc,SEARCH_THROTTLE);
        
        if ($('FilteredListHolder').style.height > $('ContentTableHolder').style.height)
            $('FilteredListHolder').style.height = $('ContentTableHolder').style.height;
            
        if ($('RecordCount'))
            $('RecordCount').innerHTML = 'Sorting...';
    }
    return false; 
}

// Makes a call to the server based on query type
function doProtocolListSearch(val, tableName) 
{
    if(!lock.isLocked())
    {
        var sType = $('SearchType').value;
        if(val!='')
        {
            $('ClearIcon').show();
            $('SearchIcon').hide();
            $('RecordCount').innerHTML = 'Searching...';

            if(delayedSearch) { clearTimeout(delayedSearch); }
            var delayedSearchFunc = curry(doSearchCallback,sType,val, 'Search', '');
            delayedSearch = setTimeout(delayedSearchFunc,SEARCH_THROTTLE);
        }
        else
        {
            $('MainTableHolder').show();
            $('SecondaryTableHolder').hide();
            $('RecordCount').innerHTML = 'Showing ' + $(tableName).rows.length + ' of ' + (window.PROTOCOL_COUNT != null ? window.PROTOCOL_COUNT : '') + ' Protocols';
            if(setActivePage) { setActivePage(0); }
        }
    }
    return false; 
}

function handleSearchKeyPress(field,e,tableName)
{
    if(field.value!='') {  $('SearchIcon').show(); $('ClearIcon').hide(); } 
    return e.keyCode==13 ? doProtocolListSearch(field.value, tableName) : true;
}

function handleClearClick(tableName)
{
    // Swap icons
    $('ClearIcon').hide();
    $('SearchIcon').show();
    
    // Clear search, and initiate empty search (i.e. clear list)
    $('listSearchField').value = '';
    doProtocolListSearch('', tableName);

    return false;
}

// clear out value when foucsed
function handleSearchFocus(tb) 
{
    if(tb.value==DEFAULT_SEARCH_TEXT) { tb.value = ''; tb.className = 'ActiveSearchField'; } 
}

// Sets default text when blurring (if empty text present)
function handleSearchBlur(tb, tableName) 
{ 
    if(tb.value=='') 
    { 
        tb.value = DEFAULT_SEARCH_TEXT;
        doProtocolListSearch('', tableName);
        tb.className = 'DefaultSearchField';
        $('SearchIcon').show();
        $('ClearIcon').hide(); 
    }
}

// Loads the details view of a record in a modal window for editing
function showEditDetailsInModal(url,title,width,height)
{
    var origin = window;
    // use inline widths, else defaults to 90% of width/height
    var w = width ? width + 'px' : '90%';
    var h = height ? height + 'px' : '90%';
    top.showModalWithConfig(url,title, { width: w, height: h, context: origin }, origin);
    return false;
}

var DETAILS_VIEW_CLASSNAME = 'ProtocolDetailsFrame';
// Can be called from within a modal window to update the calling page
// or in the case of a list/details view, the list page.
// qs: optional query string to be passed to calling page (must include '?')
// Ex: updateMainPage('?projectId=-1')
// NOTE: if modal was opened from a details page (i.e. frame with class == DETAILS_VIEW_CLASSNAME)
//       then this frames parent must be a list page, and thus will be the page reloaded
function updateMainPage(qs)
{
    // Verify that the modal was loaded and its calling window path
    var callerWindow = top.getModalCallingWindow ? top.getModalCallingWindow() : null;
    if (callerWindow)
    {
        var win = callerWindow;
        if(win)
        {
            var iFrame = getIframeByWindow(win);
            // If the calling window is an iframe and it's class name indicates its a details view,
            // then we need to use its parent to reload
            var updateWin = iFrame && iFrame.className==DETAILS_VIEW_CLASSNAME ? win.parent : win;
            if(updateWin) 
            {   
                // Append, optional query string to url path
                var navUrl = qs ? (updateWin.location.pathname + qs) : updateWin.location;
                updateWin.location = navUrl; 
            }
        }
    }
    // If called from child frame
    else
    {
        var iFrame = getIframeByWindow(window);
        if(iFrame && iFrame.className==DETAILS_VIEW_CLASSNAME)
        {
            window.parent.location = qs ? (window.parent.location.pathname + qs) : window.parent.location;
        }
    }
}

//
function setGridRowState(hiddenId,val)
{
    if ($(hiddenId) != null)
        $(hiddenId).value = val;
}

/* CHRON LIST */
var CHRON_ACTIVE_ROW_CLASS = 'ItemRow_Click';
var CHRON_HOVER_ROW_CLASS = 'ItemRow_Hover';

// init row highlighting and click events for chron lists
// tableId: the DOM id of the html table containing the data entry rows
// defaultKey: (optional) the id of the default row to select
// clickCallback: (optional) a "function(row) { }" which executes when a row is clicked
function initDataEntryChronList(tableId,defaultRowId,clickCallback)
{
    var chronTable = $(tableId);
    if(chronTable.chronInit) { return; }
    // table will have a reference to an active row
    chronTable.activeChronRow = null;
    var chronRows = chronTable.rows;
    for(var i=0;i<chronRows.length;i++)
    {
        var row = $(chronRows[i]);
        // track original class name for row
        row.refClass = row.className;
        // add hover event
        var onHover = function(a,b,c,e) { if(a(b,e) && b.className!=CHRON_ACTIVE_ROW_CLASS) { b.className = c; } };  
        row.addEvent('mouseover',curry(onHover,isMouseEnter,row,CHRON_HOVER_ROW_CLASS));
        row.addEvent('mouseout',curry(onHover,isMouseLeave,row,row.refClass));
        // add a click handler to css change class when selected
        var setActiveFunction = curry(setDataEntryChronRow,chronTable,row);
        row.addEvent('click',setActiveFunction);
        // invoke optional event handler when row clicked
        if(clickCallback) { row.addEvent('click',curry(clickCallback,row)); }
        // set default row if passed as parameter
        if(defaultRowId && defaultRowId != '' && $(defaultRowId) && row == $(defaultRowId)) {  setActiveFunction();  }
    }
    // prevent double init if needed
    chronTable.chronInit = true;
}

// sets the active item selected in chron list
function setDataEntryChronRow(table,row)
{
    if(table.activeChronRow)
    {
        // reset current active row
        if(table.activeChronRow != row) { table.activeChronRow.className =  table.activeChronRow.refClass; }
        // if updating current, no need to reset class
        else { return; }
    }
    table.activeChronRow = row;
    table.activeChronRow.className = CHRON_ACTIVE_ROW_CLASS;
}

function checkBoxSelectionChanged(tbName, checkedIndex, selectedCb)
{
    var bEnabled = false;
    
    var cb = $(selectedCb);
    
    if (!cb)
        return;

    if (cb.checked)
        bEnabled = true;
    else
        bEnabled = false;
        
    tb = document.getElementById(tbName);   
    
    if (tb)
    {
        // starting with third row should have the controls
        for (i = 0; i < tb.rows.length; i++)
        {
            if (tb.rows[i].className == 'ChildTableRow')
            {
                allControls = tb.rows[i].cells[checkedIndex+1].getElementsByTagName('*');
                for (j = 0; j < allControls.length; j++)
                {
                    if (allControls[j].tagName.toLowerCase() == 'span'
                        || allControls[j].tagName.toLowerCase() == 'input'
                        || allControls[j].tagName.toLowerCase() == 'select'
                        ||  allControls[j].tagName.toLowerCase() == 'textarea')
                    {
                        if (!bEnabled)
                        {
                            allControls[j].disabled = true;
                            allControls[j].refClass = allControls[j].className;
                            allControls[j].className = 'UnEditable';
                        }
                        else
                        {
                            allControls[j].removeAttribute('disabled');
                            allControls[j].className = allControls[j].refClass;
                            allControls[j].removeAttribute('refClass');
                        }
                    }
                }
            }
        }
    }
}

/* SCROLLING DIVs */
function scrollNodeTop(a,b,e) { $(b).scrollTop = $(a).scrollTop; }
function scrollNodeLeft(a,b,e) { $(b).scrollLeft = $(a).scrollLeft; }

function initFrozenPane(layer,topLayer,leftLayer,e)
{
    var scrollLayer = $(layer);
    var frozenLayerTop = $(topLayer);
    var frozenLayerLeft = $(leftLayer);

    // top frozen layer scrolls left and right right
    var adjustScrollLeftRight = curry(scrollNodeLeft,scrollLayer,frozenLayerTop);
    // left frozen layer scrolls up and down
    var adjustScrollUpDown = curry(scrollNodeTop,scrollLayer,frozenLayerLeft);

    // Add scrolling event handlers
    scrollLayer.addEvent('mousemove',adjustScrollLeftRight);
    scrollLayer.addEvent('mousemove',adjustScrollUpDown);

    // some browser, i.e., IE doesn't track movement on scrollbars, but handle scroll event
    if(typeof(document.body.scroll))
    {
        scrollLayer.addEvent('scroll',adjustScrollLeftRight);
        scrollLayer.addEvent('scroll',adjustScrollUpDown);
    }
}


function setMaxHeight(objectId, maxHeight) {
    if ($(objectId)) {
        var objHeight = $(objectId).offsetHeight;
        if (objHeight > maxHeight) $(objectId).style.height = (maxHeight + 'px');
    }
}

function setMinHeight(objectId, minHeight)
{
    var objHeight = $(objectId).offsetHeight;
    if (objHeight < minHeight) $(objectId).style.height = (minHeight + 'px');
}

function setHeight(objectId, Height)
{
    $(objectId).style.height = (Height + 'px');
}

function handleRequiredSchemaItemCheck(cb) {
    cb.checked = true;
    alert('This is a required field and cannot be unchecked.');
    return false;
}

// validates that the date field is in the range between first and last anticipated dates
// @statusDateField: the DOM input field of the scheduled date
// @firstAnticipatedDate: first anticipated Date object (or null)
// @lastAnticipatedDate: first anticipated Date object (or null)
// @useDefaultDate: true if to revert to default form value if not validated
// @e: option event object
// @return: true if the date field is empty or in the range of first to last anticipated dates
function validateScheduledDate(statusDateField, firstAnticipatedDate, lastAnticipatedDate, useDefaultDate, e) {
    var statusDateValue = statusDateField.value;
    if (statusDateValue != '') {
        var statusDate = new Date(statusDateValue);
        // detmerine if in range between first and date anticipated dates
        if (firstAnticipatedDate != null && lastAnticipatedDate != null) {
            // ok if dates are the same
            if (firstAnticipatedDate.toString() == lastAnticipatedDate.toString() == statusDate.toString()) {
                // ok
            }
            else if (statusDate < firstAnticipatedDate || statusDate > lastAnticipatedDate) {
                // revert to default form value
                if (false) { //useDefaultDate) {
                    var revertDate = statusDateField.defaultValue;
                    statusDateField.value = statusDateField.defaultValue;
                }
                if (firstAnticipatedDate.toString() == lastAnticipatedDate.toString()) {
                    alert('Please ensure this date is set to the scheduled date.\nSCHEDULED: ' + firstAnticipatedDate.toLocaleDateString() + '\nSELECTED: ' + statusDate.toLocaleDateString());
                }
                else {
                    alert('Please ensure your selected date is within the specified range.\nRANGE: ' + firstAnticipatedDate.toLocaleDateString() + ' - ' + lastAnticipatedDate.toLocaleDateString() + '.\nSELECTED: ' + statusDate.toLocaleDateString());
                }
                return false;
            }
        }
    }
    return true;
}

/* Date Validation */
function validateDateField(field) {
    var value = field.value;
    // OK values
    if (value == null || value == "" || value.toLowerCase().indexOf("unknown") > -1) {
        return true;
    }
    // else, parse to hard date
    else {
        var date = new Date(value);
        var dateText = document.createElement("input");
        dateText.type = 'hidden';
        dateText.value = value;
        var dateVal = document.createElement("input");
        dateVal.type = 'hidden';
        fuzzyDate(dateText, dateVal)
        // parsed to hard date, copy to field
        if (dateVal.value != "") {
            field.value = dateVal.value;
            return true;
        }
        // else, warn user and revert date
        else {
            var dateFormat = isUSDate() ? "mm/dd/yyyy" : (isBigEndianDate() ? "yyyy/mm/dd" : "dd/mm/yyyy");
            alert("Please enter a valid date in the format '" + dateFormat.toUpperCase() + "' or 'unknown'.");
            // revert value
            field.value = field.defaultValue;
            return false;
        }
    }
}

function validateNumericField(field) {
    var value = field.value;
    if (value == null || value == "" || isNumericValue(value)) {
        return true;
    }
    else {
        alert("Please enter a valid numeric value.");
        // revert value
        field.value = field.defaultValue;
        return false;
    }
}

function isNumericValue(value) {
    return value != null && value != "" && parseFloat(value).toString() === value;
}

/* WEB SERVICE */
var ProtocolSpecimenService = defineCaisisService({
    url: "Services/ProtocolSpecimenService.asmx",
    methods: ["GetAutoSpecimenIds", "UpdateSpecimenCondition"]
});