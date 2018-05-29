var activeField = null;
var activeSection = null;
var SELECTED_FIELD_CSS = 'SelectedField';
var UNSELECTED_FIELD_CSS = 'UnselectedField';
var SELECTED_SEC_CSS = 'SelectedSection';
var UNSELECTED_SEC_CSS = 'UnselectedSection';
var HELP_LAYER_TITLE_ID; // Will be set in help layer

// Overwrite utility variable to ignore TABLE elements in finding node left and top positions
IGNORE_TABLE_OFFSET = true;

// PROJECT WIZARD
function setActiveField(field)
{
    if(activeField!=field) 
    {  
        if(activeField) { activeField.className = UNSELECTED_FIELD_CSS; }
        (activeField = field).className = SELECTED_FIELD_CSS; 
    } 
}

// Hilights the active node by changing class Names
function setActiveHelpSection(fieldName)
{
    var sectionKey = fieldName + 'Desc';
    var sectionTitleKey = fieldName + 'Title';
    var section = $(sectionKey);
    var sectionTitle = $(sectionTitleKey);
    var helpLayerTitle = $(HELP_LAYER_TITLE_ID);
    
    if(helpLayerTitle) 
    { 
        if(sectionTitle && sectionTitle.innerHTML.replace(' ' ,'').length>0)
        {
            helpLayerTitle.innerHTML = sectionTitle.innerHTML.replace(' ' ,''); 
        }
        else
        {
            helpLayerTitle.innerHTML = fieldName; 
        }
    }
    
    if(section)
    {
        if(activeSection!=section) 
        {  
            if(activeSection) { activeSection.className = UNSELECTED_SEC_CSS; }
            (activeSection = section).className = SELECTED_SEC_CSS; 
        }
    }
    else
    {
        if(activeSection) { activeSection.className = UNSELECTED_SEC_CSS; }
    }
}

    
function showFieldDescription(field,fieldName)
{
//    alert(fieldName);
//    setActiveHelpSection(fieldName);
//    setActiveField(field);
//    return true;
}

// PROJECT NAVIGATION
function setActiveNavLink(link) 
{ 
    var menu = $(document).tag('TABLE.ProjectNav');
    if(menu.length>0)
    {
        menu = menu[0];
        $(menu).tag('A').foreach(function(a) { a.css(a==$(link)? 'SelectedNavigation' : ''); }); 
    }
}

var ROW_HOVER_CLASS = 'dataGridItemHover';
var ROW_CLICK_CLASS = 'datGridItemClick';

// GRID STYLE HELPERS
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

function handleRowClick(grid,node,evt) 
{ 
    if(node.className != ROW_CLICK_CLASS)
    {
        var activeItem = grid.activeItem;
        if(activeItem && activeItem!=node)
        {
            // if acivte item has no ref class, use sibling class name
            if(activeItem.refClass == null)
            {
                var prev = activeItem.previousSibling;
                var next = activeItem.nextSibling;
                activeItem.refClass = (next && next.nextSibling) ? next.nextSibling.className : (prev && prev.previousSibling ? prev && prev.previousSibling.className : '');
            }
            grid.activeItem.className = activeItem.refClass;
                
        }
        grid.activeItem = node;
        grid.activeItem.className = ROW_CLICK_CLASS;
    }
}
function wireRowOverEvents(id)
{
    var grid = $(id);
    if(grid)
    {
        // Check for active item if set on server or hardcoded
        var activeItems = grid.tag('TR.' + ROW_CLICK_CLASS);
        if(activeItems.length>0) { grid.activeItem = activeItems[0]; }
        // Loop throws rows and add hover events
        grid.foreach('rows',function(row,i)
        {
            row.addEvent('mouseover',curry(handleRowOver,row));
            row.addEvent('mouseout',curry(handleRowOut,row));
            row.addEvent('click',curry(handleRowClick,grid,row));
            
        });
    }
}

var HoverGrids = new Array();
function addHoverToGrid(gridId)
{
    // If a grid exist, wire hover events
    if($(gridId)) { wireRowOverEvents(gridId); }
    else { HoverGrids.push(gridId); }
    
}

function wireHoverEventsForGrid(){ $(window.document).tag('TABLE.ProjectGrid').foreach(wireRowOverEvents); }

// When window loads, find all grids with className 'ProjectGrid', and wire hover events
if (window.addEvent)
    window.addEvent('load',wireHoverEventsForGrid);

// When window loads wire hover events to grids
if (window.addEvent)
    window.addEvent('load',function() { ForEach(HoverGrids,wireRowOverEvents,this); } );

// Loads the details view of a record in a modal window for editing
function showEditDetailsInModal(url,title,width,height)
{
    var origin = window;
    // use inline widths, else defaults to 85% of width/height
    var w = width ? width + 'px' : '85%';
    var h = height ? height + 'px' : '85%';
    top.showModalWithConfig(url,title, { width: w, height: h, context: origin });
    return false;
}


var DETAILS_VIEW_CLASSNAME = 'ProjectDetailsFrame';
// Can be called from within a modal window to update the calling page
// or in the case of a list/details view, the list page.
// qs: optional query string to be passed to calling page (must include '?')
// Ex: updateMainPage('?projectId=-1')
// NOTE: if modal was opened from a details page (i.e. frame with class == DETAILS_VIEW_CLASSNAME)
//       then this frames parent must be a list page, and thus will be the page reloaded
function updateMainPage(qs)
{
    // Verify that the modal was loaded and its calling window path
    if(top.modal && top.modal.path!=null && top.modal.path !='')
    {
        // Get a reference to the calling window, use eval, as it will get the
        // true reference to the window object, rather than an old reference
        var win = eval(top.modal.path);
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

// var isListPage = true; should be registered in all list pages
// Resizes list and details pages when loaded
if(window.addEvent)
{
    window.addEvent('load',function(e)
    {
        // Pages with this variable will resize and resize child frames
        if(window.isListPage)
        {
            Browser.ResizeElement({ nodeId: 'MainTable', heightOffset: 275, context: window, wait: false });
            Browser.ResizeElement({ nodeId: 'InnerTable', heightOffset: 300, context: window, wait: false });  
        }
    });

}

// Details pages will be child frame of List Page (signaled by variable isListPage)
// and will show themselves after loaded.
if(window.parent.isListPage)
{
    var myFrame = $(getIframeByWindow(window));
    var detailsContainer = window.parent.document.getElementById('ProjectDetailsContainer');
    // Need to show form if non shown (i.e. display="none") and details in not active (On)
    if(myFrame && detailsContainer && detailsContainer.className != 'ProjectDetailsContainerOn')
    {
        window.addEvent('load',function() 
        { 
            detailsContainer.className = 'ProjectDetailsContainerOn';
            myFrame.show(''); 
        }
        );
    }
}

// COLOR PICKER
var PICKER_ROWS = 12;
var PICKER_COLS = 18;
var colorPicker;
var h;
var pickerField;
var pickerBox;

var colorHash = ['#000000','#003300','#006600','#009900','#00cc00','#00ff00','#330000','#333300','#336600','#339900','#33cc00','#33ff00','#660000','#663300','#666600','#669900','#66cc00','#66ff00','#000033','#003333','#006633','#009933','#00cc33','#00ff33','#330033','#333333','#336633','#339933','#33cc33','#33ff33','#660033','#663333','#666633','#669933','#66cc33','#66ff33','#000066','#003366','#006666','#009966','#00cc66','#00ff66','#330066','#333366','#336666','#339966','#33cc66','#33ff66','#660066','#663366','#666666','#669966','#66cc66','#66ff66','#000099','#003399','#006699','#009999','#00cc99','#00ff99','#330099','#333399','#336699','#339999','#33cc99','#33ff99','#660099','#663399','#666699','#669999','#66cc99','#66ff99','#0000cc','#0033cc','#0066cc','#0099cc','#00cccc','#00ffcc','#3300cc','#3333cc','#3366cc','#3399cc','#33cccc','#33ffcc','#6600cc','#6633cc','#6666cc','#6699cc','#66cccc','#66ffcc','#0000ff','#0033ff','#0066ff','#0099ff','#00ccff','#00ffff','#3300ff','#3333ff','#3366ff','#3399ff','#33ccff','#33ffff','#6600ff','#6633ff','#6666ff','#6699ff','#66ccff','#66ffff','#990000','#993300','#996600','#999900','#99cc00','#99ff00','#cc0000','#cc3300','#cc6600','#cc9900','#cccc00','#ccff00','#ff0000','#ff3300','#ff6600','#ff9900','#ffcc00','#ffff00','#990033','#993333','#996633','#999933','#99cc33','#99ff33','#cc0033','#cc3333','#cc6633','#cc9933','#cccc33','#ccff33','#ff0033','#ff3333','#ff6633','#ff9933','#ffcc33','#ffff33','#990066','#993366','#996666','#999966','#99cc66','#99ff66','#cc0066','#cc3366','#cc6666','#cc9966','#cccc66','#ccff66','#ff0066','#ff3366','#ff6666','#ff9966','#ffcc66','#ffff66','#990099','#993399','#996699','#999999','#99cc99','#99ff99','#cc0099','#cc3399','#cc6699','#cc9999','#cccc99','#ccff99','#ff0099','#ff3399','#ff6699','#ff9999','#ffcc99','#ffff99','#9900cc','#9933cc','#9966cc','#9999cc','#99cccc','#99ffcc','#cc00cc','#cc33cc','#cc66cc','#cc99cc','#cccccc','#ccffcc','#ff00cc','#ff33cc','#ff66cc','#ff99cc','#ffcccc','#ffffcc','#9900ff','#9933ff','#9966ff','#9999ff','#99ccff','#99ffff','#cc00ff','#cc33ff','#cc66ff','#cc99ff','#ccccff','#ccffff','#ff00ff','#ff33ff','#ff66ff','#ff99ff','#ffccff','#ffffff'];

function showColorPicker(targetFieldId,pickerElement,e)
{
    pickerField = $(targetFieldId);
    showPicker(pickerElement,e);
}

function showPicker(ele,e)
{
    // Get refrence to picker table
    colorPicker = colorPicker ? colorPicker : initPicker();
    colorPicker.show('');
    colorPicker.pickerDisplayBox.show('');
    
    colorPickerPointer.show('');
    if(ele)
    {
        pickerBox = $(ele);
        var left = getLeftPos(pickerBox);
        var top = getTopPos(pickerBox);
        var w = pickerBox.offsetWidth;
        var h = pickerBox.offsetHeight;
        colorPicker.style.top = e.clientY + 'px';
        colorPicker.style.left = e.clientX + 'px';
        colorPickerPointer.style.top = top + h + 'px';
        colorPickerPointer.style.left = left + 'px';
        
        colorPicker.pickerDisplayBox.style.top = e.clientY - (colorPicker.pickerDisplayBox.offsetHeight) + 'px';
        colorPicker.pickerDisplayBox.style.left = e.clientX + 'px';
    }
}

function hidePicker() 
{ 
    if(colorPicker) { colorPicker.hide('none'); colorPicker.pickerDisplayBox.hide('none'); } 
    if(colorPickerPointer) { colorPickerPointer.hide('none'); } 
}

function hidePickerOnEsc(e) { if(e.keyCode==27) { hidePicker(); } }

function initPicker()
{
    if(colorPicker && colorPicker.init){ return; }
    else
    {
        // Create TABLE element used to hold color cells
        colorPicker  = $(document.createElement('TABLE'));
        colorPicker.className = 'ColorPicker';
        colorPicker.cellPadding = 0;
        colorPicker.cellSpacing = 0;
        colorPicker.border = 0;
        
         // TESTING
        bob  = $(document.createElement('TABLE'));
        bob.cellPadding = 0;
        bob.cellSpacing = 0;
        bob.border = 0;
        bob.className = 'ColorPickerHeader';
        var bobTBody =  document.createElement('TBODY');
         bob.appendChild(bobTBody);
         
        var tr = bobTBody.insertRow(0);
        var c1 = tr.insertCell(0);
        var activeColorBox = document.createElement('DIV');
        c1.style.width = '75px';

        c1.appendChild(activeColorBox);
        
        //activeColorBox.setColor = function(c) { c1.style.backgroundColor = color; }
        
        activeColorBox.innerHTML = '#ccc000';
        var c2 = tr.insertCell(1);
       
        var c3 = $(tr.insertCell(2));
        c3.style.width = '20px';
        c3.innerHTML = '<a href="#" onclick="return false;">X</a>';
        c3.addEvent('click',hidePicker);
        

          window.document.body.appendChild(bob);
       
         colorPicker.colorBox = activeColorBox;
         colorPicker.pickerDisplayBox = bob;
         

        // Create Table BODY
        var tBody = document.createElement('TBODY');
        colorPicker.appendChild(tBody);
        
        for(var i=0,colorIndex=0;i<PICKER_ROWS;i++)
        {
            var row = tBody.insertRow(i);
            for(var j=0;j<PICKER_COLS;j++,colorIndex++)
            {
                var cell = $(row.insertCell(j));
                cell.className = 'ColorPickerField';
                var color = colorHash[colorIndex];
                cell.style.backgroundColor = color;
                cell.colorIndex = colorIndex;
                color.title = color;
                cell.color = color;
                // Determine if color is a light or dark color
                cell.isLight = colorIndex%6<3;
    
                // Attach event to cells
                cell.addEvent('click',curry(setActiveColorPickerField,color));
                cell.addEvent('click',hidePicker);
                cell.addEvent('mouseover',curry(handleColorMouseOver,cell,color));
                 cell.addEvent('mouseover',curry(setPickerDisplayBox,cell));
            }
        }
        // Create Color Droplet/Picker
        colorPickerPointer = $(document.createElement('DIV'));
        colorPickerPointer.className = 'ColorPickerPointer';
        colorPickerPointer.addEvent('click',setColor);
        
        // Add nodes to body element
        window.document.body.appendChild(colorPicker);
        window.document.body.appendChild(colorPickerPointer);
        $(document.body).addEvent('keypress',hidePickerOnEsc);

        colorPicker.init = true;
        return colorPicker;
    }
}

function setPickerDisplayBox(cell)
{
    var color = cell.color;
    var isLight = cell.isLight;
    colorPicker.colorBox.style.backgroundColor = color;
    colorPicker.colorBox.innerHTML = color.toUpperCase();
    var light = '#ffffff';
    var dark = '#000000';   
    var textColor = isLight ? light : dark;
    var textBorder = '1px solid ' + textColor;
    
    colorPicker.colorBox.style.color = textColor;
}

function setColor()
{
    setActiveColorPickerField(colorPickerPointer.color);
    hidePicker();
}

function setActiveColorPickerField(color)
{
    if(pickerField) { pickerField.value = color; }
    if(pickerBox)
    {
        pickerBox.style.backgroundColor = color;
        pickerBox.title = 'Color: ' + color;
    }
}

function handleColorMouseOver(cell,color)
{
    var left = getLeftPos(cell);
    var top = getTopPos(cell);
    colorPickerPointer.style.left = left + 'px';
    colorPickerPointer.style.top = top + 'px'
    colorPickerPointer.style.width = (cell.offsetWidth * 1.25) + 'px';
    colorPickerPointer.style.height = (cell.offsetHeight * 1.25) + 'px';
    colorPickerPointer.style.backgroundColor = color;
    colorPickerPointer.color = color;
    colorPickerPointer.title = color;
}
/* search filters */

// init search filter (requires jQuery)
if (window.addEvent && window.jQuery) {
    jQuery.noConflict();
    jQuery(document).ready(function () {
        var defaultText = "Type to filter...";
        var input = jQuery("#List_Filter");
        var table = jQuery("#List_Filter_Container table").first();
        // init
        input.attr("autocomplete", "off");
        input.val(defaultText);
        // add helper image
        var img = jQuery("<img />");
        img.attr("src", "../../images/Header/SearchBoxBG_Cancel.png");
        img.attr("title", "Reset").attr("alt", "Reset");
        input.after(img);
        img.css({
            "cursor": "pointer",
            "position": "absolute",
            "left": input.position().left + input.width() - 8 + "px",
            "top": input.position().top + input.height() - 5 + "px"
        });
        var search = function () {
            var value = input.val().toLocaleLowerCase();
            var rows = table.find("tbody > tr");
            rows.each(function () {
                var row = jQuery(this);
                var found = false || value == "";
                if (!found) {
                    // search first cell only ???
                    var cell = row.find("td:first-child");
                    var span = cell.find("span");
                    var searchDOM = span.size() > 0 ? span.first() : cell;
                    var text = searchDOM.text().toLowerCase();
                    var title = searchDOM.attr("title").toLowerCase();
                    found = text.indexOf(value) > -1 || title.indexOf(value) > -1;
                }
                // show on found
                if (found)
                    row.show();
                // else hide
                else
                    row.hide();
            });
        };
        input.keypress(function (event) {
            if (event.keyCode == 13) {
                search();
                event.stopPropagation();
                return false;
            }
        });
        // throttle search
        var searchQueue = null;
        input.keyup(function (e) {
            if (searchQueue) {
                clearTimeout(searchQueue);
            }
            searchQueue = setTimeout(search, 500);
        });
        input.focus(function () {
            if (input.val() == defaultText) {
                input.val("");
            }
        });
        input.blur(function () {
            if (input.val() == "") {
                input.val(defaultText);
            }
        });
        img.click(function () {
            input.val("");
            search();
            input.val(defaultText);
            return false;
        });
    });
}