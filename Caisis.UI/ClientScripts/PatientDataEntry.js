// Handles communication between interfaces and events in the PatientData Module.
self.onerror = function() { return true; }
var DE_EXPANDED_WIDTH = "95%";
var DE_REGULAR_WIDTH = "625px";
var WORKFLOW_ACTIVE = false;

// Helper Function
function getThisScreenHeight() { return getHeight(window.top); }
function getChronListFrame() { return top.frames['ChronListFrame']; }
function getChronListDOM() { return getChronListFrame()?top.document.getElementById('ChronListFrame'):null; }
function getDataEntryFrame() { return top.frames['DataEntryFrame']; }
function getDataEntryDOM() { return getDataEntryFrame()?top.document.getElementById('DataEntryFrame'):null; }

// handles onclick event of chron list item
function loadDataEntryForm(tableName, primKey, parentKey)
{
    var dataEntryFrame = getDataEntryFrame();
	dataEntryFrame.location = 'PatientDataEntryContainer.aspx?tableName='+tableName+'&primKey='+primKey+'&parentKey='+parentKey;
}
// refresh the Chronological List
function refreshChronList(view)
{
    var chronFrame = getChronListFrame();
    if(view != null && view != "") { chronFrame.loadChronlist(view); }
    else { chronFrame.location = chronFrame.location; }
}

// Patient Data Resizing Functions
function checkIfPdExpanded(){ if (top.pdIsExpanded) { MM_swapImage('ExpandPatientDataButton','','../../Images/buttonReturn.gif',1); } }

function expandPatientDataFrame()
{
    getChronListDOM().style.width = top.pdIsExpanded ? 1 + "px" : 370 + "px";
    getDataEntryDOM().style.width = top.pdIsExpanded ? DE_EXPANDED_WIDTH : DE_REGULAR_WIDTH;
}
function expandPatientData()
{
    var swapImg = top.pdIsExpanded ? '../../Images/buttonExpand.gif' : '../../Images/buttonReturn.gif';
	MM_swapImage('ExpandPatientDataButton','',swapImg,1);
	top.pdIsExpanded = !top.pdIsExpanded;
	expandPatientDataFrame();
}


// message constants
var IsDirtyMessage = "You have made changes that have NOT been saved. Do you want to save the form?";
var MozIsDirtyMessage = "You have made changes that have NOT been saved. Click OK to discard changes, or click CANCEL to Save modifications.";
var RequiredFieldsMessage = "Fields denoted below are required."
/*** Is Dirty Functions ****/
function confirmDelete() { return confirm("Are you sure you want to delete this record from the database?"); }
var isBubble = false;
var isDirtyEnabled = true;
function disIsDirty() { isDirtyEnabled = false; }

function isDirty(e) {
    if (isDirtyEnabled && !top.isBubble) {
        var modified = isFormDirty();
        if (modified && !top.isBubble) {
            if (isIE) {
                stopBubble(e || event);
                if (confirm(IsDirtyMessage)) {
                    top.isBubble = true;
                    //document.getElementById('SaveBtn').click();
                    saveAndReload();
                    return false;
                }
                else { return false; }
            }
            else if(e.returnValue) {
                e.returnValue = MozIsDirtyMessage;
            }
            else { return MozIsDirtyMessage; }
        }
    }
    else { top.isBubble = false; }
}

// saves the current data entry form
// epid: optional epid to load next patient
function saveAndReload(nextEPID) {
    if (window._doSaveClick) {
        // set hidden next epid if applicable
        var nextEPIDField = document.getElementById('nextEPID');
        if (nextEPIDField && nextEPID && nextEPID != '') {
            nextEPIDField.value = nextEPID;
        }
        // supress dirty functionality
        disIsDirty();
        // invoke client postback
        window._doSaveClick();        
    }
}

var SubSectionReg = new Array();

function showHideSubForm(sectionId,clickImageDOM)
{
    var section = document.getElementById(sectionId);
    if(section)
    {
        var hideSection = section.style.display != 'none';
        if(hideSection){ SubSectionReg.push([sectionId,clickImageDOM]); }
        section.style.display = hideSection ? "none" : '';
        clickImageDOM.src = hideSection ? "../../Images/icon_plus.gif" : "../../Images/icon_minus.gif";
    }
}

//This code is deprecaed in version 4.0, but still used where PDLabels are used with reqiured property
function validateRequiredFields()
{
	var submitForm = true;
	var imageName = '';
	if (requiredFieldArray)
	{
		for(var i=0; i < requiredFieldArray.length; i++)
		{
		    var ele = document.forms[0].elements(requiredFieldArray[i]);
			if (ele)
			{	
				if(ele.value == '')
				{	
					submitForm = false;
					imageName = requiredFieldArray[i]+"_PdLabel_image";
				
					if(document.images[imageName])
					{
						document.images[imageName].src = '../../Images/requiredFieldMarkerAlert.gif';
					}
				}
			}
		}
	}
	if(submitForm == false)
	{
		alert('One or more required fields are blank.\n\nPlease enter data into the fields marked in red.');
	}
	return submitForm;
}

// NEW v 4.0 code for client-side validation
function checkRequiredFields()
{
    var isValid = true;
    // Open up all the SubSections
    while(SubSectionReg.length>0)
    {
        var subSection = SubSectionReg.pop();
        showHideSubForm(subSection[0],subSection[1]);
    }
    if(requiredFields) // Registered by PDE code behind
    {
        for(var i in requiredFields)
        {
            var id = requiredFields[i][0];
            var field = requiredFields[i][1];
            var table = requiredFields[i][2];
            var dom = document.getElementById(id);
            var label = dom.previousSibling;
            var domValue = getValue(dom);
            if(domValue == '' && label)
            {
                isValid = false;
                // insert required icon
                if(dom._requiredIcon==null)
                {
                    var img = new Image();
                    img = new Image();
                    img.src = (top.APP_PATH ? top.APP_PATH + 'Images/' : '../../Images/') + 'icon_flashingError.gif';
                    img.width = '17';
                    img.height = '12';
                    // insert required icon into label
                    dom._requiredIcon = img;
                    label.appendChild(img);
                }
            }
            // remove required icon
            else if(dom._requiredIcon && label)
            {
                label.removeChild(dom._requiredIcon);
                dom._requiredIcon = null;
            }           
        }
        if(!isValid)
        {
            var err = document.getElementById("ClientErrorMessage");
            var message = RequiredFieldsMessage;
            while(err.childNodes.length>0) { err.removeChild(err.firstChild); }
            err.appendChild(document.createTextNode(message));
            var pde = document.getElementById('PDFormDiv');
            if(pde) { pde.scrollTop = 0; }
        }
        return isValid;
    }
    else
    {
        return isValid;
    }
}

// Section Helpers
function sectionIsEmpty(sectionId)
{
	var section = document.getElementById(sectionId);
	if (!section) { return false; }
	var selects = section.getElementsByTagName('SELECT');
	var inputs = section.getElementsByTagName('INPUT');
	var textareas = section.getElementsByTagName('TEXTAREA');
	for (var i = 0; i < selects.length; i++) { if (selects[i].selectedIndex > 0) return false; }
	
	for (var j = 0; j < inputs.length; j++) 
	{
		var ipt = inputs[j];
		var type = ipt.getAttribute('type');
		if (type == 'checkbox' || type == 'radio') { if (ipt.checked) return false; }
        else if (type != 'hidden') { if (ipt.value != null && ipt.value != '') return false; }
	}
	for (var i=0;i<textareas.length;i++) { if (textareas[i].value != '') return false; }
	return true;
}

function oneSectionIsEmpty() {
    // datagrid fix on static forms
    var section = document.getElementById(sectionIdList[0]);
    if (section) {
        var tables = section.getElementsByTagName('TABLE');
        for (var i = 0; i < tables.length; i++) {
            if (tables[i].className == 'dataGrid') { return false; }
        }
    }
    // return check as normal
    return sectionIsEmpty(sectionIdList[0]);
}

function checkSections()
{
    if (sectionIdList && oneSectionIsEmpty()) 
    {
	    var err = document.getElementById("ClientErrorMessage");
        err.innerHTML = sectionIdList.length < 2 ? "Please enter some data." : "You must enter data in the parent section.";
	    var pde = document.getElementById('PDFormDiv');
        if(pde) { pde.scrollTop = 0; }
	    return false;
    }
	return true;
}

function checkAndValidateSections()
{
    return checkRequiredFields() ? checkSections() : false;
}

/********* DATA GRID HELPERS *********/
var NoChangesToGrid = 'You have not made any changes to the grid, please use empty rows.';
var SetRequiredFields = 'Please select a value for the required fields highlighted in red.';
var SaveBeforeAddingNew = 'The form needs to be saved before adding new rows. \nWould you like to save it now?';
var RequiredHeaderCellClass = 'dataGridHeaderRequired';
var HiddenGridRowClass = 'dataGridBlankRowHidden';
var VisibleGridRowClass = 'dataGridBlankRowVisible';
var ResetRowLinkClass = 'ResetGridRowLink';
var ClearRowLinkClass = 'ClearGridRowLink';
var GridViewList = new HelperArray();
function highlightGrid(grid) { grid.dirtyRows.foreach(highlightRow); }
function unHighlightGrid(grid) { grid.dirtyRows.foreach(unHighlightRow); }
function highlightRow(row) { row.dirtyCells.foreach(highlightCell);  }
function unHighlightRow(row) { row.dirtyCells.foreach(unHighlightCell);  }
function highlightCell(cell) { cell.highlight(); }
function unHighlightCell(cell) { cell.unhighlight(); }
function validateGrids() 
{ 
    var rObj = { value: true };
    var f = function(r) { return function(g) { r.value=r.value&&g.validate(); } };
    GridViewList.foreach(f(rObj));
    return rObj.value;
}

// closures for reset button and input onchange events
function onResetClickHelper(a,g,r) { return function() { g.resetGridRow(r);  a.hide(); }  }
function showResetLinkHelper(a,g,r,c) 
{ 
    return function(e) 
    {
        var node = e.srcElement || e.target;
        var nodeValue = node.value;
        var isDirty = isFieldDirty(node);
        //isDirty = c.required ? (isDirty && nodeValue=='') : isDirty;
        if(isDirty)
        {
            if(!r.dirtyCells.contains(c)) { r.dirtyCells.add(c); }
            if(!g.dirtyRows.contains(r)) { g.dirtyRows.add(r);  }
        }
        else { r.dirtyCells.removeCell(c); }
        if(r.dirtyCells.isEmpty()) { a.hide(); g.dirtyRows.remove(r); } 
        else { a.show(); }
    }
}

// ENd Closures
function initalizeGrid(grid)
{
    grid.requiredCellIndexes = new HelperArray();
    grid.dirtyRows = new HelperArray();
    // Initalize Header - Build required fields indexes
    var headerCells=grid.rows[0].cells;
    for(var i=0,c;(c=headerCells[i]);i++) { if(c.className==RequiredHeaderCellClass) { grid.requiredCellIndexes.add(i); } }
    // Initalize Data (rows of data), i.e. row indexes 1-n
    for(var j=1;j<grid.rows.length;j++) {  initalizeGridRow(grid,grid.rows[j]); } 
    grid.resetGridRow = function(r)
    {
        resetInputFields(r);
        r.dirtyCells.foreach(unHighlightCell);
        r.requiredCells.foreach(unHighlightCell);
        r.dirtyCells.clear();
        this.dirtyRows.remove(r);  
    }
    grid.clearGridRow = function(r)
    {
        this.resetGridRow(r);
        clearInputFields(r);
    }
    grid.resetRow = function(i) { this.resetGridRow(this.rows[i]); }
    grid.clearRow = function(i) { this.clearGridRow(this.rows[i]); }
    grid.showNextRow = function()
    {
        if(this.rows[this.rows.length-1].className==VisibleGridRowClass) 
        { 
            if(this.dirtyRows.isEmpty())
            {
                alert(NoChangesToGrid);
                return false;
            }
            else { return this.save(); }
        }
        else
        {
            for(var i=0;i<this.rows.length;i++)
            {
                var row = this.rows[i];
                if(row.className==HiddenGridRowClass) 
                { 
                    row.className = VisibleGridRowClass;
                    return false;
                }
            }
            return false;
        }
    }
    grid.save = function()
    {
        if(this.validate() && checkAndValidateSections())
        {
            var trySave = confirm(SaveBeforeAddingNew);
            if(trySave)
            {
                if (checkSections) 
                { 
                    if (checkSections()) {  disIsDirty(); } else { trySave = false; } 
                } 
                else  {  disIsDirty(); }
            }
            return trySave;
        }
        else { return false; }
    }
    grid.validate = function()
    {
        if(this.dirtyRows.isEmpty()) { return true; }
        else
        {
            var returnObj = { value: true, reqCount: 0 };
            var fp = function(rObj)
            {
                return function(row)
                {
                    var ifp = function(dirtyCells)
                    {
                        return function(cell)
                        {
                            var v = cell.required?(cell.requiredField?cell.requiredField.value!='':false):true;
                            if(!v) 
                            { 
                                rObj.reqCount++;
                                cell.highlight();
                            }
                            rObj.value = rObj.value&&v;
                        }
                    }
                    row.requiredCells.foreach(ifp(row.dirtyCells));
                }
            }
            this.dirtyRows.foreach(fp(returnObj));
            if(!returnObj.value) 
            {
                var d = this.dirtyRows.getLength();
                var c = returnObj.reqCount;
                alert('You have made changes to ' + d + (d==1? ' record':' records') + ' , but you are missing ' + c + ' required ' + (c==1?'field':'fields') + '. \n');
                var pde = document.getElementById('PDFormDiv');
                if(pde) { pde.scrollTop = getTopPos(this); }
                //SetRequiredFields 
            }
            return returnObj.value;
        }
    }
    // Add grid to our list of Grids
    if(!GridViewList.contains(grid)) { GridViewList.add(grid); }
}

// Initalizes the controls in each row to respond to UI events
// such as value changes and click events
function initalizeGridRow(grid,row)
{
    // Initalize default properties
    row.dirtyCells = new HelperArray();
    row.dirtyCells.removeCell = function(c) { this.remove(c); c.unhighlight(); }
    row.requiredCells = new HelperArray();
    var resetBtn;
    var clearBtn;
    for(var i=0,link;(link = row.getElementsByTagName('A')[i]);i++)
    {
        if(link.className == ResetRowLinkClass)
        {
            resetBtn = link;
        }
        else if(link.className == ClearRowLinkClass)
        {
            clearBtn = link;
        }
    }
    if (resetBtn) {
        // Link Properties
        resetBtn.show = function() { this.style.visibility = 'visible'; }
        resetBtn.hide = function() { this.style.visibility = 'hidden'; }
    }
    if (clearBtn) {
        clearBtn.show = function() { this.style.visibility = 'visible'; }
        clearBtn.clearBtn = function() { this.style.visibility = 'hidden'; }
    }
    // Loop through each cell
    for (var j = 0, cell; (cell = row.cells[j]); j++) { initalizeCell(grid, row, cell, j, resetBtn, clearBtn); }
}

function initalizeCell(grid,row,cell,cIndex,resetBtn, clearBtn)
{
    // Get fields (selects,textboxes,textareas, etc) in each cell
    var list = Map(['INPUT','SELECT','TEXTAREA'],getNodesHelper(cell),cell);
    // Setup Required
    cell.required = grid.requiredCellIndexes.find(cIndex)>-1;
    cell.highlight = function() { this.style.backgroundColor = '#cc0000'; }
    cell.unhighlight = function() { this.style.backgroundColor = ''; }
    
    if(cell.required)
    {
        row.requiredCells.add(cell);
        cell.requiredField = list[0][0]||list[1][0]||list[2][0];
    }
    // Create a function pointer used to register events to controls
    var onResetClick = onResetClickHelper(resetBtn,grid,row,cell);
    var showResetLink = showResetLinkHelper(resetBtn,grid,row,cell);

    // Wire events to notify when a control's value changes
    if (resetBtn) {
        Event.Register('click', resetBtn, onResetClick, false);
        var reg = function(t, f) { return function(l) { Event.RegisterToList(t, l, f, false); } }
        ForEach(list, reg('change', showResetLink), this);
        ForEach(list, reg('focus', showResetLink), this);
    }
    if (clearBtn) {
        // clear values on the row
        var onClearClick = curry(function(g, r, e) { g.clearGridRow(r); }, grid, row);
        Event.Register('click', clearBtn, onClearClick, false);
    }
}
// wire grids on page load
var initGridsOnPageLoad = function()
{
    for(var i=0,grid;(grid = document.getElementsByTagName('TABLE')[i]);i++)
    {
        if(grid.className == 'dataGrid') { initalizeGrid(grid); }
    }
}

Event.Register('load',window,initGridsOnPageLoad,false);
/********* END - DATA GRID HELPERS *********/

// v6

// lookup of tabs by ids { 'tab1': {}, 'tab2' : {} }
var DATA_ENTRY_TABS = {};

// toggles the active data entry tab
// @tabId: the id (prefix) of the tabs and links
// @index: the index of the active tab
function setActiveDataEntryTab(tabId, index, doFocus, e) {
    doFocus = doFocus == null ? false : doFocus;
    var i = 0;
    while (true) {
        var link = document.getElementById(tabId + '_Link_' + i);
        var text = document.getElementById(tabId + '_Text_' + i);
        var tab = document.getElementById(tabId + '_Tab_' + i);
        if (link && text && tab) {
            var isActive = i == index;
            var cls = link.className;
            if (isActive) {
                if(cls.indexOf('dataEntryTabDisabled') > -1) {
                    link.className = cls.replace('dataEntryTabDisabled','');
                }
                tab.style.display = 'block';
            }
            else {
                if(cls.indexOf('dataEntryTabDisabled') == -1) {
                    link.className = cls + ' dataEntryTabDisabled';
                }
                tab.style.display = 'none';
            }
            i++;
        }
        else {
            break;
        }
    }
   
    // add tab entry
    DATA_ENTRY_TABS[tabId] = true;
    
    if(doFocus) {
        scrollDataEntryTab(tabId);
    }
    // set persisted form index
    var tabIndexField = document.getElementById(tabId + '_Index');
    if (tabIndexField != null) {
        tabIndexField.value = index + '';
    }
}

// scroll to focus on tab in overflow interfaces
// @tabId: the id of the main tab container
function scrollDataEntryTab(tabId) {
    var tabDIV = $(tabId);
    // scroll to tab
    var tabOverflow = tabDIV;
    try {
        while((tabOverflow = tabOverflow.parentNode) != null && tabOverflow.nodeName!= 'BODY')
        {
            var parentOverflow = getComputedCSS(tabOverflow, 'overflow');   
            if(parentOverflow =='auto') {
                tabOverflow.scrollTop = Math.max(0, getTopPos(tabDIV) - 25);
                break;
            }
        }
    } catch(err) {}
    try {
        if (tabBar != null) returnTabToOrginalPos();
    } catch(err) {}
}

function showMoreDataEntryTabs(tabId, e) {
    var tab = $(tabId + '_MoreTab');
    var tabContent = $(tabId + '_MoreLayer');
    tabContent.style.display = 'block';
    // position content
    var tabLeft = getLeftPos(tab);
    var tabContentWidth = tabContent.offsetWidth - tab.offsetWidth;
    // validate left positioning
    var trueLeft = Math.max(tabLeft - tabContentWidth , 0);
    tabContent.style.left = trueLeft + 'px';
    var trueTop = tab.offsetHeight + tab.offsetTop - 2;
    tabContent.style.top = trueTop + 'px';
        
    // prevent bubbling
    stopBubble(e);

    // add tab entry
    DATA_ENTRY_TABS[tabId] = true;
    
    // focus on tabs
    scrollDataEntryTab(tabId);
}

function hideMoreDataEntryTabs(tabId, e) {
    var tabContent = $(tabId + '_MoreLayer');
    if(tabContent) {
        tabContent.style.display = 'none'; 
    }
}

// add close handler for layers
if (window.$) {
    $(window.document).addEvent('click', function(e) {
        for (var tabId in DATA_ENTRY_TABS) {
            hideMoreDataEntryTabs(tabId, e);
        }
    });
}