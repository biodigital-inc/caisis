<%@ Control EnableViewState="true" Language="C#" AutoEventWireup="true" CodeFile="SpecimenLocationControl.ascx.cs"
    Inherits="Caisis.UI.Plugins.SpecimenLocation.SpecimenLocationControl" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>

<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

<script type="text/javascript" language="javascript">

// Define function to stop deletion of Specimens with children in the grid
function onRowDelete(row)
{
    var mySpecId = row.Keys['SpecimenId'];
    if(mySpecId!=null && window.SpecimensWithChildren != null && SpecimensWithChildren.length > 0)
    {
        for(var i=0;i<SpecimensWithChildren.length;i++)
        {
            var specWithChild = SpecimensWithChildren[i];
            if(specWithChild==mySpecId)
            {
                alert('This Specimen cannot be deleted, unless all Child Specimens are deleted.');
                // Return false to signal the record to not delete
                return false;
            }
        }
    }
    // Otherwise ask user if they want to delete
    return confirmDelete();
}

// Stop validation
var cache = new Object();
if (window.disIsDirty) { disIsDirty(); }
var onPositionChosen;// = function() { alert('value updated'); };
function setOnPositionChosen(fun) { onPositionChosen = fun; }

var speimenCacheEnabled = true;
function showGrid()
{
    var subLayer = $('specimenPickerLayer');
    MM_showHideLayers('specimenPickerLayer','','show');
    subLayer.style.display = '';
}

var isBoxFull = false;
var BoxStructure;
var SpecCount;
var RowCount;
var ColCount;
var maxPosition;

var refSiteName;
var refStorageName;
var refContainerName;
var refBoxId;
var refBoxName;
var refPositionId;
var refPositionName;

var BoxMatrix;
var SpecimenChooserLayer;
var SpecimenCache = { Sites:new Object(),Storages:new Object(),Containers:new Object(),Boxes:new Object(),BoxMatrix:new Object() };

function centerSpecimenBox()
{
    var subLayer = $('specimenPickerLayer');
    // First, we will remove our specimen layer and position
    // from any nested container, and place it directly under the body
    // node (as a child), so centering and positioning can be relative to
    // the page, not the container.
    // Only needs to be executed once.
    if(!subLayer.insertedIntoBody)
    {
        var lParent = subLayer.parentNode;
        lParent.removeChild(subLayer);
        document.body.appendChild(subLayer);
        subLayer.insertedIntoBody = true;   
    }
        
    if(subLayer)
    {
        var layerW = subLayer.offsetWidth && subLayer.offsetWidth>0 ? subLayer.offsetWidth : 450;
        var layerH = subLayer.offsetHeight && subLayer.offsetHeight>0 ? subLayer.offsetHeight : 600;
        var w = getWidth(window);
        var h = getHeight(window);
        var l = layerW<=w ? ((w-layerW)/2) : 0;
        var t = 50; //layerH<=h ? ((h-layerH)/2) : 0;
        subLayer.style.left = l + 'px';
        subLayer.style.top = t + 'px';
        // If Iframe Helper, also center it
        if(subLayer.coverLayer) 
        { 
            subLayer.coverLayer.style.left = l + 'px'; 
            subLayer.coverLayer.style.top = t + 'px';
        }
    }
}

function setRefFieldValues(siteName,storageName,containerName,boxId,positionId,boxName,positionName)
{
    if(refBoxId) { setDirtyTrackerField(refBoxId); refBoxId.value = boxId; }
    //if(refBoxId) { refPositionId; }
    if(refBoxName) { refBoxName.value = boxName; }
    if(refPositionName) { refPositionName.value = positionName; }
    
    // Set Box Path
    if(refSiteName) { refSiteName.value = siteName; }
    if(refStorageName) { refStorageName.value = storageName; }
    if(refContainerName) { refContainerName.value = containerName; }
    
    // If this event handler is set, it will fire after the ref field values have updated
    if(onPositionChosen) { onPositionChosen(); }
}

// Sets a hidden field value to 1 indicating a save needed for this row.
function setDirtyTrackerField(refBoxId)
{
    var key = refBoxId.id + 'Tracker';
    var node = $(key);
    if(node) { node.value = '1'; }
}

function showSpecimenPicker(siteName,storageName,containerName,boxId,positionId,boxName,positionName)
{
    refBoxId = $(boxId);
    //refPositionId = $(positionId);
    refBoxName = $(boxName);
    refPositionName = $(positionName);
    
    refSiteName = $(siteName);
    refStorageName = $(storageName);
    refContainerName = $(containerName);

    // Set BoxId  (i.e., the record for the box)
    BoxMatrix.boxId = refBoxId ? (refBoxId.value!='' ? refBoxId.value : null ) : null;
    //Set BoxName (i.e., the display name of the box record)
    BoxMatrix.boxName = refBoxName ? (refBoxName.value!='' ? refBoxName.value :null ): null;
    // Set PositionName (i.e. position of the specimen in the box)
    BoxMatrix.positionName = refPositionName ? (refPositionName.value!='' ? refPositionName.value : null ): null;
    // If we have a boxId, we need to get matrix for the boxid
    if(BoxMatrix.boxId) 
    { 
        doBoxCallBack(BoxMatrix.boxId,BoxMatrix.boxName,BoxMatrix.positionName,true); 
    }
    // Else we will callback the server for Storages
    else 
    { 
        doSelectCallBack('Sites','Storages'); 
    }
    
    // Show Pop Up Specimen Chooser Layer
    showSpecimenChooserLayer();
}

function closePicker()
{
    // Close Specimen Chooser Layer
    hideSpecimenChooserLayer();
}

function showSpecimenChooserLayer()
{
    SpecimenChooserLayer.style.display = '';
    if (isIE && !isIE7 && !SpecimenChooserLayer.coverLayer)
    {
        var parent = SpecimenChooserLayer.parentNode;;
        cover = document.createElement('IFRAME');
        var coverW = SpecimenChooserLayer.offsetWidth;
        var coverH = SpecimenChooserLayer.offsetHeight;
        cover.style.position = 'absolute';
        cover.style.zIndex = '10';
        cover.style.left = SpecimenChooserLayer.style.left;
        cover.style.top = SpecimenChooserLayer.style.top;
        cover.style.width = coverW + 'px';
        cover.style.height = coverH + 'px'
        SpecimenChooserLayer.coverLayer = cover;
        parent.appendChild(cover);
    }
    if(SpecimenChooserLayer.coverLayer)
    {
        SpecimenChooserLayer.coverLayer.style.display = '';
    }
    centerSpecimenBox();
}

function hideSpecimenChooserLayer()
{
    SpecimenChooserLayer.style.display = 'none';
    // Handle pre IE7 bleeding select boxes, hide iframe helper
    if(SpecimenChooserLayer.coverLayer) { SpecimenChooserLayer.coverLayer.style.display = 'none'; }
}

var sitesClientId = '<%= Sites.ClientID %>';
var storagesClientId = '<%= Storages.ClientID %>';
var containersClientId = '<%= Containers.ClientID %>';
var boxesClientId = '<%= Boxes.ClientID %>';
var showChooseBtnId = '<%= ChooseBoxbtn.ClientID %>';

var StorageManager;
var targetSelect;
var specimenCallBack = '<%= Caisis.UI.Core.Classes.PageUtil.GetBasePath(this.Request) + "/Plugins/SpecimenLocation/SpecimenBoxCallBack.aspx" %>';
var positionPickerSrc = '<%= Caisis.UI.Core.Classes.PageUtil.GetBasePath(this.Request) + "/Images/icon_SpecimenAccessions.png" %>';

var SpecimenLocationRefList;
function setStorageManager()
{
    var sitesSel = $(sitesClientId);
    var storagesSel = $(storagesClientId);
    var containersSel = $(containersClientId);
    var boxSel = $(boxesClientId);
    
    var onSelChange = function(a,b) { return function() { doSelectCallBack(a,b); } };
    var onBoxChange = function(n) { return function() { doBoxCallBack(getValue(n) , n.options[n.selectedIndex].text ); } };
    // Set change event handlers to selects will retrieve values for next select
    Event.Register('change',sitesSel,onSelChange('Sites','Storages'),false);
    Event.Register('change',storagesSel,onSelChange('Storages','Containers'),false);
    Event.Register('change',containersSel,onSelChange('Containers','Boxes'),false);
    // Box Select needs to fire a different fuction, needs to call server to get
    // box dimensions, and then build matrix
    Event.Register('change',boxSel,onBoxChange(boxSel),false);
    
    StorageManager = 
    {
        'Sites': getStorageHelper(sitesSel,[storagesClientId,containersClientId,boxesClientId]),
        'Storages': getStorageHelper(storagesSel,[containersClientId,boxesClientId]),
        'Containers': getStorageHelper(containersSel,[boxesClientId]),
        'Boxes': getStorageHelper(boxSel,[])
    };
    
    // Set global reference to table holding matrix of cells
    BoxMatrix = $('BoxMatrix');
   
    SpecimenChooserLayer = $('specimenPickerLayer');
    
    // This Controls wiring of startup items
    if(SpecimenLocationRefList)
    {
        var refList = SpecimenLocationRefList;
        var prevRefBoxId,prevRefBoxName,prevRefPosName;
        var isIE = window.attachEvent && document.all;
        var f = function(prevBoxId,prevBoxName,prevPosName)
        {
            return function(l)
            {
            var refSubList = l;
            
            var siteName = 'SiteName';
            var storageName = 'StorageName';
            var containerName = 'ContainerName';
            var bId = refSubList[0];
            var pId = refSubList[1];
            var bName = refSubList[2];
            var pName = refSubList[3];
            
            
            
            var boxIdDOM = $(bId);
            // Temp fix, when specimens are deleted, their associated boxes are still
            // around
            if(boxIdDOM == null) { return; }
            var boxIdCell = boxIdDOM.parentNode;
                        
            // TESTING
            var divHelper = document.createElement('DIV');
            
            var nodeMargin = 'auto 5px auto 5px';
            
            var bNameDOM = $(bName);
            bNameDOM.style.width = '50px';
            bNameDOM.style.display = '';
            bNameDOM.style.margin = nodeMargin;
            bNameDOM.style.backgroundColor = '#ffffff';
            bNameDOM.style.color = '#999999';
            bNameDOM.disabled = disablePickerControls!=null ? disablePickerControls : false;

            var pNameDOM = $(pName);
            pNameDOM.style.width = '50px';
            pNameDOM.style.display = '';
            pNameDOM.style.margin = nodeMargin;
            pNameDOM.style.backgroundColor = '#ffffff';
            pNameDOM.style.color = '#999999';

            pNameDOM.disabled = disablePickerControls!=null ? disablePickerControls : false;
            
            var boxNameOldParent = bNameDOM.parentNode;
            var tableCell = boxIdCell;
            var tableRow = tableCell.parentNode;
            var table = tableRow.parentNode.parentNode;
            var colIndex;
            for(var i=0;i<tableRow.cells.length;i++)
            {
                var cell = tableRow.cells[i];
                if(cell==tableCell)
                {
                    colIndex = i;
                    break;
                }
            }
            
            tableCell.style.display = '';
            if(colIndex!=null && !table.boxNameSet)
            {
                var headerCell = table.getElementsByTagName('th')[colIndex];
                headerCell.style.display = '';
                setNodeText(headerCell,' Box  :  Position');
                table.boxNameSet = true;
            }
            
            // Create Image to insert into DOM
            var positionPickerImg = new Image();
            positionPickerImg.src = positionPickerSrc;
            positionPickerImg.style.cursor = 'pointer';
            positionPickerImg.style.margin = nodeMargin;
            positionPickerImg.style.verticalAlign = 'middle';
            if(prevBoxId!=null && prevBoxName != null && prevPosName != null)
            {
                positionPickerImg.prevBoxId = prevBoxId;
                positionPickerImg.prevBoxName = prevBoxName;
                positionPickerImg.prevPosName = prevPosName;
            }
            prevBoxId = bId;
            prevBoxName = bName;
            prevPosName = pName;
            
            // DOM I/O
            // Remove Box Name and Position Text Boxes From Old Container
            boxNameOldParent.removeChild(bNameDOM);
            boxNameOldParent.removeChild(pNameDOM);
            // Insert the Box Name and Position Text Boxes (plus labels) into
            // BoxId holder (i.e., the table cell containing the BoxId hidden field)
            boxIdCell.appendChild(positionPickerImg);
            boxIdCell.appendChild(bNameDOM);  
            boxIdCell.appendChild(pNameDOM);
                        
            // Add click event to picker image
            if(disablePickerControls==null || disablePickerControls==false)
            {
                var clickEvent= function(p,a,b,c,d,e,f,g) 
                { 
                    return function() 
                    { 
                        if(p.prevBoxId && p.prevBoxName && p.prevPosName) 
                        { 
                            // Check Previous Position And if its available
                            var prevBoxId = $(p.prevBoxId);
                            var prevBoxIdValue = prevBoxId.value;
                            var prevPosNameDOM = $(p.prevPosName);
                            var currentPosNameDOM = $(pName);
                            var prevPosValue = prevPosNameDOM.value;
                            var currentPosValue = currentPosNameDOM.value;
                            if(prevPosValue!='' && currentPosValue=='')
                            {
                                var prevPosValueInt = parseInt(prevPosValue);
                                if(prevBoxIdValue!='')
                                {
                                    var prevBoxIdValueInt = parseInt(prevBoxIdValue);
                                    var cItem;
                                    if((cItem=cache[''+prevBoxIdValueInt]))
                                    {
                                        //currentPosNameDOM.value = prevPosValueInt+1;
                                    }
                                }
                            }
                            var refBoxIdValue = $(p.prevBoxId).value;
                            //var refPosNameValue = $(p.prevPosName).value;
                            if(getValue($(d))=='')
                            {
                                $(d).value = refBoxIdValue;
                                //$(g).value = refPosNameValue;
                            }
                        } 
                        showSpecimenPicker(a,b,c,d,e,f,g); } 
                    }
                var closedFun = clickEvent(positionPickerImg,siteName,storageName,containerName,bId,pId,bName,pName);
                Event.Register('click',positionPickerImg,closedFun,false);
                
                // Add handler to when user focuses on conttrol, it blurs, as they should not be able to set
                // values in these fields manually
                var handleOnFocus = function(n) { return function() { n.blur(); } };
                Event.Register('focus',bNameDOM,handleOnFocus(bNameDOM),false);
                Event.Register('focus',pNameDOM,handleOnFocus(pNameDOM),false);
            }
            
            // Handle Dirty Functionality For BoxName and PositionName
            // Locate reset link on page and use helper functions defined in PDE client scripts
            var links = tableRow.getElementsByTagName('a');
            for(var i=0;i<links.length;i++)
            {
                var link = links[i];
                if(link.className == 'ResetGridRowLink' && showResetLinkHelper)
                {
                    var handleControlDirty = showResetLinkHelper(link,table,tableRow,tableCell);
                    Event.Register('change',bNameDOM,handleControlDirty,false);
                    Event.Register('change',pNameDOM,handleControlDirty,false);
                    break;
                }
            }
            
            }
        }
        var funtionOnList = f(prevRefBoxId,prevRefBoxName,prevRefPosName);
        ForEach(refList,funtionOnList,this);
    } 
}

function handlebtnClick()
{   
        //this code is moved here to retain the count of specimens from selected box
        // unstructured box and above max limit
        if ((BoxStructure == "Unstructured") && (SpecCount >= maxPosition)) 
        {
            isBoxFull = true;
        }
        // structured box and full
        else if((BoxStructure == "Structured") && (SpecCount >= (RowCount * ColCount) || (SpecCount >= maxPosition)))
        {
            isBoxFull = true;
        }


    //to check whther Box is full or not, if specimens are added into box without positions
    if(isBoxFull)
    {
        alert('This box is full. Please select another box!');
    }
    else
    {
        var BoxId = $('<%=Boxes.ClientID %>').value;    
        var BoxName = getSelectText($('<%=Boxes.ClientID %>'));
        //var BoxName=onBoxChange.options[onBoxChange.selectedIndex].text;
        
        var siteName = getSelectText($('<%=Sites.ClientID %>'));
        var storageName = getSelectText($('<%=Storages.ClientID %>'));
        var containerName = getSelectText($('<%=Containers.ClientID %>'));

        setRefFieldValues(siteName,storageName,containerName,BoxId,'',BoxName,'');
        closePicker();
    }
}

function getStorageHelper(select,l)
{
    var list = Map(l,$,this);
    var helper = function(fx,l) { return function() { ForEach(l,fx,this); } }  
    
    // Attach Helper functions to select to enable/disable related tables
    select.clearChildTables = helper(clearChildren,list);
    select.disableChildTables = helper(disableField,list);
    select.enableChildTables = helper(enableField,list);
    select.enableNextChildTable = helper(enableField,list.length>0?list[0]:[]);
    
    // Disable next select, as user needs to choose a value for current select
    
    select.disableChildTables();
    return select;
}
// CALLBACK FUNCTIONS
// Called by Site, Storage and Container Select
function doSelectCallBack(srcType,targetType)
{
    var src = StorageManager[srcType];
    var target = StorageManager[targetType];
    
    src.disableChildTables();
    src.clearChildTables();
    
    var arg = getValue(src);
    
    if(arg!='')
    {
        var callback = getSelectCallBack(target,targetType,arg);
        var cache = speimenCacheEnabled ? SpecimenCache[targetType][arg] : null;
        // If caching is enabled and item is value, invoke callback with cached xml doc
        if(cache) { callback(null,cache); }
        // Else run server callback
        else
        {
            var params = new Param();
            params.add("methodName","get" + targetType);
            params.add(srcType + "Id",arg);
            AjaxManager.MakeRequest('POST',specimenCallBack,params,callback,true);
        }
    }

    // Need to reset matrix, as we're search for a new path
    clearMatrix();
    handleShowChooseBox();
}

function doBoxCallBack(boxId,boxName,curPos,needPath)
{
    if(refBoxId && refBoxId.value==boxId && !curPos && refPositionName)
    {
        curPos = refPositionName.value;
    }
    if(boxId!='')
    {
        var callback = getBoxCallBack(boxId,boxName,curPos,needPath);
        var cache =  speimenCacheEnabled ? SpecimenCache['BoxMatrix'][boxId] : null;
        // If cahce enabled and item in cache, do call back with cached xml doc
        if(cache) { callback(null,cache); }
        // Call Server
        else 
        {
            var params = new Param();
            params.add("methodName","getBoxMatrix");
            params.add("BoxId",''+boxId); // need to pass as string
            if(needPath) { params.add("NeedPath",'true'); }
            AjaxManager.MakeRequest('POST',specimenCallBack,params,callback,true);
        }
    }
    else
    {
        // Need to reset matrix, as we're search for a new path
        clearMatrix();
    }
    handleShowChooseBox();
}
// END CALLBACK FUNCTIONS

// CALL BACK HANDLERS
// Gets the callback function for populating select boxes
function getSelectCallBack(sel,type,val)
{
    return function(t,x)
    {
        // If caching enabled, cache xml doc
        if(speimenCacheEnabled) { SpecimenCache[type][val] = x; }
        var src = x.getElementsByTagName('select')[0];
        populateDropDown(sel,src);
    }
}

function populateDropDown(sel,srcDropDown)
{
    var imported = getImportedXmlNode(srcDropDown,sel.ownerDocument);
    clearChildren(sel);
    if(imported.childNodes.length>0)
    {
        enableField(sel);
        sel.enableNextChildTable();
        for(var i=0;i<imported.childNodes.length;i++)
        {
            var opt = imported.childNodes[i].cloneNode(true);
            sel.appendChild(opt);
        }
        // Set newly populated select to match imported selected index
        sel.selectedIndex = imported.selectedIndex;
    }
    else
    {
        sel.clearChildTables();
        sel.disableChildTables();
    }
    handleShowChooseBox();
}

//function to show or hide "Choose Box" button
function handleShowChooseBox()
{
    var boxSel = $(boxesClientId);
    var chooseBtn = $(showChooseBtnId);
    chooseBtn.style.visibility = boxSel.selectedIndex > 0 ?  'visible' : 'hidden';
}

// Gets the callback function for populating the box matrix
function getBoxCallBack(boxId,boxName,curPos,needPath)
{
    // Function gets executed when call returns from server
    return function(txt, xml) {
        // Cache returned xml doc if caching enabled
        if (speimenCacheEnabled) { SpecimenCache['BoxMatrix'][boxId] = xml; }
        var results = xml.getElementsByTagName('span')[0].firstChild.nodeValue;
        var array = eval(results);
        var rows = array[0], cols = array[1];
        var max = array[2];
        var positions = array[3];
        var siteName = array[4];
        var storageName = array[5];
        var containerName = array[6];
        var specimenCount = array[7];
        boxName = array[8];
        var isStructuredBox = array[9];
        
        
        BoxStructure = isStructuredBox;
        SpecCount = specimenCount;
        RowCount = rows;
        ColCount = cols;
        maxPosition = max;
        
        BoxMatrix.boxId = boxId;
        BoxMatrix.boxName = boxName;
        BoxMatrix.positionName = curPos;
        buildMatrix(rows, cols, max, positions, curPos, siteName, storageName, containerName);

        if (needPath) {
            // Populate drop downs
            var srcStorages = xml.getElementsByTagName('select')[1];
            populateDropDown(StorageManager['Storages'], srcStorages);
            var srcContainers = xml.getElementsByTagName('select')[2];
            populateDropDown(StorageManager['Containers'], srcContainers);
            var srcBoxes = xml.getElementsByTagName('select')[3];
            populateDropDown(StorageManager['Boxes'], srcBoxes);
            var siteId = xml.getElementsByTagName('span')[1].firstChild.nodeValue;
            setSelectValueByValue(StorageManager['Sites'], siteId);
        }
    }
}

function setSelectValueByValue(sel,siteId)
{
    var opts=sel.options;
    for(var i=0;i<opts.length;i++)
    {
        var o = opts[i];
        if(o.value==siteId) { o.selected = true; }
    }
}
// END CALLBACK HANDLERS

// Box Matrix Helpers
function buildMatrix(r,c,max,posList,cPos,siteName,storageName,containerName)
{
    var cachedBoxList;   
    if(BoxMatrix.boxId && BoxMatrix.boxId!='')
    {
        cachedBoxList = cache[BoxMatrix.boxId] ? cache[BoxMatrix.boxId] : new Object();
    }
    clearMatrix();
    var pos = new HelperArray(posList);
    var nIndex=1;
    var tBody = document.createElement('TBODY');
    BoxMatrix.appendChild(tBody);
    for(var i=0;i<r;i++)
    {
        var row = tBody.insertRow(i);
        for(var j=0;j<c;j++,nIndex++)
        {
            var cell = row.insertCell(j);
            
            cell.siteName = siteName;
            cell.storageName = storageName;
            cell.containerName = containerName;
            
            cell.position = nIndex;
            cell.boxId = BoxMatrix.boxId;
            cell.boxName = BoxMatrix.boxName;
           
            setNodeText(cell,' ');
            // Set CSS classes to help identify cells
            if(cachedBoxList) { cachedBoxList['' + nIndex] = true; }
            if(nIndex==BoxMatrix.positionName) { setMatrixActiveCell(cell); }
            else if(pos.contains(nIndex)) { cell.className = 'FilledPosition'; cell.filled = true; }
            else if(nIndex>max) { cell.className = 'UnavailablePosition'; cell.isUnavailable = true; }
            else 
            { 
                if(cachedBoxList) { cachedBoxList['' + nIndex] = null; }
                cell.className = 'AvailablePosition'; 
            }
            cell.refClass = cell.className;
            cell.resetClass = resetClassName(cell,cell.refClass);
            
            // Register events handler for UI events
            Event.Register('click',cell,handleCellOnClick(BoxMatrix,cell),false);
            // Set Classes on mouse events
            Event.Register('mouseover',cell,cellMouseOver(cell),false);
            Event.Register('mouseout',cell,cellMouseOut(cell),false);
            // Set Text on Mouse Over and Mouse Out
            Event.Register('mouseover',cell,cellMouseOverSetText(cell),false);
            Event.Register('mouseout',cell,cellMouseOutSetText(cell),false);
        }
    }
}

function resetMatrix()
{
    if(BoxMatrix)
    {
        var fp = function(r)
        {
            var fpp = function(c) { c.resetClass(); }
            ForEach(r.cells,fpp,r);
        }
        ForEach(BoxMatrix.rows,fp,BoxMatrix);
    }
    BoxMatrix.currentPositionCell = null;
}

function clearMatrix() 
{ 
    resetMatrix();
    clearChildren(BoxMatrix);
}

// CLOSURES
function resetClassName(n,c) { return function(){n.className=c;} }
function handleCellOnClick(m,c)
{
    return function(e)
    {
        var currentOnClick = 'The position at ' + c.position + ' is the current position of the Specimen.';
        var filledOnClick = 'The position at ' + c.position + ' is currently filled.';
        var unavailableOnClick = 'The position at ' + c.position + ' is currently unavailable.';
        if(m.currentPositionCell == c) { alert(currentOnClick); }
        else if(c.filled) { alert(filledOnClick); }
        else if(c.isUnavailable) { alert(unavailableOnClick); }
        else
        {
            if(m.currentPositionCell) { m.currentPositionCell.className = m.currentPositionCell.refClass; }
            setRefFieldValues(c.siteName,c.storageName,c.containerName,c.boxId,null,c.boxName,c.position);
            setMatrixActiveCell(c);
            closePicker();
        }
    }
}
function _cme(c,f,c1,c2) { return function(e) { if(f(c,e)) { if(c.className==c1) { c.className=c2; } } } }
function cellMouseOver(c) { return _cme(c,isMouseEnter,'AvailablePosition','AvailablePositionHover'); }
function cellMouseOut(c) { return _cme(c,isMouseLeave,'AvailablePositionHover','AvailablePosition'); }
function _cmt(c,f,t) { return function(e) { if(f(c,e)&&c.className!='CurrentPosition') { setNodeText(c,t); } } }
function cellMouseOverSetText(c) { return _cmt(c,isMouseEnter,c.position); }
function cellMouseOutSetText(c) { return _cmt(c,isMouseLeave,' '); }

function setMatrixActiveCell(c) 
{
    var m = BoxMatrix;
    
    var cachedBoxList;   
    if(BoxMatrix.boxId && BoxMatrix.boxId!='')
    {
        cachedBoxList = cache[BoxMatrix.boxId] ? cache[BoxMatrix.boxId] : new Object();
    }
    
    if(m.currentPositionCell) 
    { 
        if(cachedBoxList) { cachedBoxList['' + m.currentPositionCell.position] = null; }
        m.currentPositionCell.className = 'AvailablePosition'; 
        m.currentPositionCell.refClass = 'AvailablePosition';
        setNodeText(m.currentPositionCell,' ');
    }
    m.currentPositionCell = c;
    m.currentPositionCell.className = 'CurrentPosition';
    setNodeText(m.currentPositionCell,m.currentPositionCell.position);
    if(cachedBoxList) { cachedBoxList['' + m.currentPositionCell.position] = true; }
}

function setNodeText(n,t)
{
    if(n.firstChild) { Node.SetText(n,t); }
    else { n.appendChild(Node.CreateText(t)); }
}

Event.Register('load',window,setStorageManager,false);
Event.Register('resize',window,centerSpecimenBox,false);
</script>

<style type="text/css">
    .CurrentPosition {  background-color: #8d2a2c;  color: #ffffff; font-weight: bold; border: solid 2px #8d2a2c; border-collapse: separate; }
    .FilledPosition { background-color: #999999; cursor: default;  border: solid 2px #999999; border-collapse: separate;  color: #000000;}
    .UnavailablePosition { background-color: #666666; cursor: text; border: solid 2px #666666; border-collapse: separate;}
    .AvailablePosition { background-color: #e4e4e4; border: solid 2px #e4e4e4; border-collapse: separate; }
    .AvailablePositionHover { background-color: #e4e4e4; border: solid 2px #8d2a2c; border-collapse: separate; color: #8d2a2c;}
    .ActivePosition { background-color: #0066cc; border: solid 2px #0066cc; border-collapse: separate; }
    /*.BoxMatrix { border: 1px solid #666666; }*/
    .BoxMatrix td
    {
        text-align: center;
        vertical-align: middle;
        height: 12px;
        font-size: 9px;
        cursor: pointer;
    }
    .BoxMatrix
    {
        border: 1px solid #666666;
    }
    .SpecimenPositionSelectText { width: 100px; font-size: 11px; font-weight: bold; text-align: left;  }
    .BoxButton {width: 75px; font-size: 9px; font-weight: bold; text-align: center;}
    #SpecimenPositionSelectsLayer { width: 265px; float: left; text-align:left; }
    #SpecimenPositionSelectsLayer div { margin-left: 3px; }
    .SpecimenPositionDropDown
    {
        width: 150px;
        font-size: 10px;
    }
    #specimenPickerLayer
    {
        font-size: 8px;
    }
    #BoxMatrixHolder 
    {
        height: 200px;
        width: 250px;
        overflow: auto;
        clear: both;
        margin: 10px auto 10px auto;
    }
    .LocationLabel { font-size: 10px; font-weight: bold; text-align: right;  }
</style>
<img runat="server" id="SpecimenLocationImg" style="cursor: pointer;" alt="Choose Position"
    src="../../Images/icon_SpecimenAccessions.png" onclick="showSpecimenPicker('SiteName','StorageName','ContainerName','BoxId','PositionId','BoxName','PositionName');" />
    <asp:HiddenField ID="totalSpecimensinBox" runat="server"/>
<!-- display input controls and grid to choose specimen box and position-->
<div id="specimenPickerLayer" style="z-index: 11; border: 1px solid #666666; position: absolute;
    width: 280px; left: 25%; top: 100px; background-color: #ffffff; display: none;">
    <div style="width: 100%; background-color: #8d2a2c; color: #ffffff; font-weight: bold;
        font-size: 12px; vertical-align: middle; height: 15px;">
        <span style="float: left; display: block; margin-left: 2px;">Choose Specimen Position</span><span
            style="float: right; display: block; vertical-align: middle; margin-right: 2px;
            vertical-align: top;"><asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="closePicker(); return false;"
                ImageUrl="~/Images/CloseSmall.gif" AlternateText="Close Specimen Picker" ToolTip="Close Specimen Picker"
                ImageAlign="TextTop" /></span>
    </div>
    <div id="SpecimenPositionSelectsLayer" style="width: 280px">
        <table>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="LocationLabel">
                    Site</td>
                <td>
                    <cc:CaisisSelect CssClass="SpecimenPositionDropDown" TabIndex="10" ID="Sites" ShowLabel="false"
                        FieldLabel="Site" runat="server" LookupDistinct="SpecimenSites; SiteId; SiteName">
                    </cc:CaisisSelect>
                </td>
            </tr>
            <tr>
                <td class="LocationLabel">
                    Storage/Shelf</td>
                <td>
                    <cc:CaisisSelect CssClass="SpecimenPositionDropDown" TabIndex="11" ID="Storages"
                        ShowLabel="false" FieldLabel="Storage" runat="server">
                    </cc:CaisisSelect></td>
            </tr>
            <tr>
                <td class="LocationLabel">
                    Container/Rack</td>
                <td>
                    <cc:CaisisSelect CssClass="SpecimenPositionDropDown" TabIndex="12" ID="Containers"
                        ShowLabel="false" FieldLabel="Container" runat="server">
                    </cc:CaisisSelect></td>
            </tr>
            <tr>
                <td class="LocationLabel" style="height: 21px">
                    Box</td>
                <td style="height: 21px">
                    <cc:CaisisSelect CssClass="SpecimenPositionDropDown" TabIndex="13" ID="Boxes" ShowLabel="false"
                        FieldLabel="Box" runat="server">
                    </cc:CaisisSelect>
                    <input type="button" runat="server" id="ChooseBoxbtn" title="Select box only and no position" value="Select"
                            class="BoxButton" style="visibility: hidden; width: 40px;" onclick="handlebtnClick();" /></td>
            </tr>
        </table>
    </div>
    
    
    <div id="BoxMatrixLayer" style="clear: both; margin-top: 10px;">
        <div id="BoxMatrixHolder">
            <table id="BoxMatrix" class="BoxMatrix" cellpadding="0" cellspacing="1" style="table-layout: fixed;
                width: 90%; margin: auto; border-collapse: separate; height: 95%;">
            </table>
        </div>
    </div>
    <div style="text-align: right; padding-right: 22px; margin-top: 20px; display: none;">
        <button style="border: solid 1px #999999; width: 150px; background-color: #8d2a2c;
            color: #ffffff; font-weight: bold; margin: 5px auto 5px auto; cursor: pointer;"
            onclick="closePicker(); return false;">
            Close</button>
    </div>
    
    <div >
        <table style="width:250px">
            <tr>
                <td align="center" class="LocationLabel">
                    Current <span class="CurrentPosition" style="width: 15px; height: 15px;
                        border: solid 1px #cccccc; margin-right:10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    Filled <span class="FilledPosition"
                            style="width: 15px; height: 15px; border: solid 1px #cccccc; margin-right:10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    Available <span class="AvailablePosition" style="width: 15px;
                        height: 15px; border: solid 1px #cccccc;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </td>
            </tr>
        </table>
    </div>
    
</div>

<div id="LegendLayer">
  
</div>
