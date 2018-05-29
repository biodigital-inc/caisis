<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="RelocateSpecimens.aspx.cs"
    Inherits="Caisis.UI.Modules.SpecimenMgmt.RelocateSpecimens" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="plugin" TagName="PickerPlugin" Src="~/Plugins/SpecimenLocation/SpecimenLocationControl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Relocate Specimens</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script type="text/javascript">  
    /* <![CDATA[ */
    
    // IMPORTANT - CHECK CLASS NAMES ON ALL POSITIONS WHERE TRANSFER POSITIONS ARE EMPTY
        function submitItem(id)
	    {
	        document.Form1.CollectionId.value = id;
	        document.Form1.submit();
	    }
       
        function RelocateSaveState(srcBoxId,srcPos,destBoxId,destPos)
        {
            this.srcBoxId = srcBoxId;
            this.srcPos = srcPos;
            this.destBoxId = destBoxId;
            this.destPos = destPos;
        }
        
        var CurrentBoxMatrix;
        var NewBoxMatrix;
        var LastTransferSave;
        
        var originBoxMatrix;
        var ajaxQueue = new Array();
        var lock = new Lock();
        
        function runAjaxCallBack(fun)
        {
            ajaxQueue.push(fun);
            checkQueue();
        }
        function checkQueue()
        {
            if(ajaxQueue.length>0 && !lock.isLocked())
            {
                var fp = ajaxQueue.shift();
                lock.lock();
                fp();
            }   
        }
        
        setInterval(checkQueue,500);
        
	    
	    function buildOriginBoxMatrix(boxId,matrix,r,c,max,allPositions,transferPositions)
        {
            matrix.clear();
            var tBody = document.createElement('TBODY');
            matrix.appendChild(tBody);
            
            var allPos = new HelperArray(allPositions);
            var transPos = transferPositions ? new HelperArray(transferPositions) : null;
            var nIndex = 1;
            for(var i=0;i<r;i++)
            {
                var row = tBody.insertRow(i);
                for(var j=0;j<c;j++,nIndex++)
                {
                    var cell = row.insertCell(j);
                    cell.boxId = boxId;
                    cell.position = nIndex;
                    
                    // Working with transfer (current) box
                    if(transPos)
                    {
                        if(allPos.contains(nIndex) && transPos.contains(nIndex)) { cell.className = matrix.activeClassName; }
                        else if(allPos.contains(nIndex)) { cell.className = 'FilledPosition'; }
                        else if(nIndex>max) { cell.className = 'UnavailablePosition'; }                        
                        else { cell.className = 'AvailablePosition'; }
                    }
                    // Working with new (available) box
                    else
                    {
                        if(allPos.contains(nIndex)) { cell.className = 'FilledPosition'; }
                        else if(nIndex>max) { cell.className = 'UnavailablePosition'; } 
                        else { cell.className = matrix.activeClassName; }
                    }
                    // Attach cell click event
                    var cellOnClick  = getCellOnClick(cell,matrix);
                    Event.Register('click',cell,cellOnClick,false);
                    setNodeText(cell,nIndex);
                }
            }
        }
        
        // Returns a function which sets the active cell for each Matrix
        function getCellOnClick(cell,matrix)
        {
            // This function sets the active cell for a Matrix
            // by updating the className on the clicked cell.
            return function()
            {
                if(cell.className==matrix.activeClassName)
                {
                    if(matrix.activePosition)
                    {
                        matrix.activePosition.className = matrix.activeClassName;
                    }
                    cell.className = matrix.activeSelectedClassName;
                    matrix.activePosition = cell;
                    if(matrix == CurrentBoxMatrix)
                    {
                        updateCurrentBoxFields(cell.boxId,cell.position);
                    }
                    else
                    {
                        updateNewBoxFields(cell.boxId,cell.position);
                        saveTransfer();
                    }
                }
                else if(cell.className != matrix.activeSelectedClassName)
                {
                    alert('This is not a valid selection for a transfer.');
                }
            }
        }
        
        function updateCurrentBoxFields(bId,pos)
        {
            getDOM('CurrentBoxId').value = bId;
            getDOM('CurrentPosition').value = pos;
        }
        
        function updateNewBoxFields(bId,pos)
        {
            getDOM('NewBoxId').value = bId;
            getDOM('NewPosition').value = pos;
        }
             
        var DropDownHash = new Object();
        var SpecimenCallBackPath = '<%= Caisis.UI.Core.Classes.PageUtil.GetBasePath(this.Request) + "/Plugins/SpecimenLocation/SpecimenBoxCallBack.aspx" %>';

        function getDOM(id) { return document.getElementById(id); }
        
        function wireSelectsOnPageLoad()
        {
            var currentBoxSel = getDOM('Boxes');
            if(currentBoxSel==null) { return; }
            else if(currentBoxSel.options.length == 0) { return; }
            
            // Set gloabal refrences to our html tables (matrix)
            CurrentBoxMatrix = getDOM('CurrentBoxMatrix');
            NewBoxMatrix = getDOM('NewBoxMatrix');
            
            // Add helper functions to tables to clear contents and to reset clicked items
            var resetMatrixHelper = function(m) { return function() { resetMatrix(m); } };
            var clearMatrixHelper = function(m) { return function() { clearChildren(m); } };
            CurrentBoxMatrix.reset = resetMatrixHelper(CurrentBoxMatrix);
            NewBoxMatrix.reset = resetMatrixHelper(NewBoxMatrix);
            CurrentBoxMatrix.clear = clearMatrixHelper(CurrentBoxMatrix);
            NewBoxMatrix.clear = clearMatrixHelper(NewBoxMatrix);
            
            // Set class names for selectable positions and selected positions
            CurrentBoxMatrix.activeClassName = 'TransferablePosition';
            CurrentBoxMatrix.activeSelectedClassName = 'TransferableSelectedPosition';
            NewBoxMatrix.activeClassName = 'AcceptablePosition';
            NewBoxMatrix.activeSelectedClassName = 'AcceptableSelectedPosition';
            
            var listOfCurrentIds = ['Sites','Storages','Containers','Boxes'];

            wireListOfSelects(listOfCurrentIds,['Sites','Storages','Containers','Boxes'],CurrentBoxMatrix);
            
            var listOfNewIds = ['NewSite','NewStorage','NewContainer','NewBox'];
            
            //wireListOfSelects(listOfNewIds,['Sites','Storages','Containers','Boxes'],NewBoxMatrix);
            //To disable Box selection
            wireListOfSelects(listOfNewIds,['Sites','Storages','Containers'],NewBoxMatrix);

            doBoxCallBack(currentBoxSel);
        }
        
        function resetMatrix(matrix)
        {
            if (matrix.activePosition) { matrix.activePosition.className = matrix.activeClassName; }
            if(matrix == CurrentBoxMatrix) { updateCurrentBoxFields('',''); } else { updateNewBoxFields('',''); }
            matrix.activePosition = null;
        }
        
        
        function resetCurrentAndNewBoxMatrix()
        {
            CurrentBoxMatrix.reset();
            NewBoxMatrix.reset();
        }        
        
        function wireListOfSelects(list,typeList,parentMatrix)
        {
            
            while(list.length>0)
            {
                // Remove first id, and child list is now contains list-1 ids
                var selId = list.shift();
                var type = typeList.shift();
                var nextType = typeList[0];
                // Get node ref
                var selDOM = getDOM(selId);
                // Wire helper functions
                selDOM.parentMatrix = parentMatrix;
                wireSelectHelpers(selDOM,list,type,nextType); 
                // Handle Sites, Storages, Containers
                if(list.length>0)
                {
                    var doCallBack = function(s) { return function() { doSelectCallBack(s); } }
                    Event.Register('change',selDOM,doCallBack(selDOM),false);
                }
                // Handle Box
                else
                {
                    var doCallBack = function(s) { return function() { doBoxCallBack(s); } }
                    Event.Register('change',selDOM,doCallBack(selDOM),false);
                    doCallBack(selDOM); // Fire when page loads
                }
                
            }
        }

        function wireSelectHelpers(select,l,type,nextType)
        {
            var list = Map(l,getDOM,this);
            var helper = function(fx,l) { return function() { ForEach(l,fx,this); } }  
            
            // Attach Helper functions to select to enable/disable related tables
            select.locationType = type;
            select.nextLocationType = nextType;
            select.NextChildTable = list.length>0?list[0]:[];
            select.clearChildTables = helper(clearChildren,list);
            select.disableChildTables = helper(disableField,list);
            select.enableChildTables = helper(enableField,list);
            select.enableNextChildTable = helper(enableField,select.NextChildTable);
            
            // Disable next select, as user needs to choose a value for current select           
            //select.disableChildTables();
        }
    
function setNodeText(n,t)
{
    if(n.firstChild) { Node.SetText(n,t); }
    else { n.appendChild(Node.CreateText(t)); }
}

function enableDisableImage(img,disable,onSrc,offSrc)
{
    img.disabled = disable;
    img.src = disable ? offSrc : onSrc;
}

// CALLBACK FUNCTIONS
// Called by Site, Storage and Container Select
function doSelectCallBack(sel)
{
    var src = sel;
    var target = sel.NextChildTable
    var moveBtn = getDOM('MoveBoxButton');
    if(src == getDOM('NewContainer'))
    {
        var disabled = getValue(getDOM('NewContainer'))=='';
        enableDisableImage(moveBtn,disabled,'../../Images/MoveEntireBox.gif','../../Images/MoveEntireBox_Off.gif');
    }
    else 
    { 
        enableDisableImage(moveBtn,true,'../../Images/MoveEntireBox.gif','../../Images/MoveEntireBox_Off.gif');
    }
    
    
    src.disableChildTables();
    src.clearChildTables();
    
    // Reset Parent Matirx
    sel.parentMatrix.reset();
    sel.parentMatrix.clear();
    
    var srcKey = getValue(src);
    
    if(srcKey && srcKey!='')
    {
        var callback = getSelectCallBack(target);
        var methodName = 'get' + sel.nextLocationType;
        var methodIdKey = sel.locationType + 'ID'
        var methodIdValue = srcKey;
        var params = new Param();
        params.add("methodName",methodName);
        params.add(methodIdKey,methodIdValue);
        var fp = function() { AjaxManager.MakeRequest('POST',SpecimenCallBackPath,params,callback,true); }
        runAjaxCallBack(fp);
    }

    // Need to reset matrix, as we're search for a new path
    //clearMatrix();
}

function doBoxCallBack(sel)
{
    var boxId = getValue(sel);
    var matrix = sel.parentMatrix;
    matrix.reset();
    matrix.clear();
    
    // Disable move button
    var moveBtn = getDOM('MoveBoxButton');
    var disable = boxId!='';
    enableDisableImage(moveBtn,disable,'../../Images/MoveEntireBox.gif','../../Images/MoveEntireBox_Off.gif');


    if(boxId && boxId!='')
    {
        var callback = getBoxCallBack(sel);
        var params = new Param();
        params.add("methodName","getBoxMatrix");
        params.add("BoxId",boxId);
        if(matrix.id == 'CurrentBoxMatrix')
        {
            params.add("getTransfers","true");
            var colId = getDOM('CollectionId').value;
            params.add("collectionId",colId);
            
        }
        var fp = function() { AjaxManager.MakeRequest('POST',SpecimenCallBackPath,params,callback,true); }
        runAjaxCallBack(fp);
    }
}
// END CALLBACK FUNCTIONS

// CALL BACK HANDLERS
// Gets the callback function for populating select boxes
function getSelectCallBack(sel)
{
    return function(t,x)
    {
        var src = x.getElementsByTagName('select')[0];
        populateDropDown(sel,src);
        lock.unlock();
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
}

// Gets the callback function for populating the box matrix
function getBoxCallBack(sel)
{
    // Function gets executed when call returns from server
    return function(txt,xml)
    {
        var results = xml.getElementsByTagName('span')[0].firstChild.nodeValue;
        var array = eval(results);
        var dim = array[0];
        var rows = dim[0],cols = dim[1];
        var max = array[1];
        var positions = array[2];
        var transferPositions = array[3];
        var matrix = sel.parentMatrix;
        var boxId = getValue(sel);
        buildOriginBoxMatrix(boxId,matrix,rows,cols,max,positions,transferPositions);
        lock.unlock();
    }
}
        // Saves Transfer
        function saveTransfer()
        {
            var srcBoxId = getDOM('CurrentBoxId').value;
            var srcPos = getDOM('CurrentPosition').value;
            var destBoxId = getDOM('NewBoxId').value;
            var destPos = getDOM('NewPosition').value;
            
            if(srcBoxId != '' && srcPos != '' && destBoxId != '' && destPos != '')
            {
                var newSaveState = new RelocateSaveState(srcBoxId,srcPos,destBoxId,destPos);
                // When rolling back save state, we need to reverse src and destination
                LastTransferSave = new RelocateSaveState(destBoxId,destPos,srcBoxId,srcPos);
                doSave(newSaveState);
            }
            else
            {
                alert('Please ensure that you have selected a Specimen and destination.');
                NewBoxMatrix.reset();
            }
        }
        
        function doSave(saveState)
        {
            var params = new Param();
            params.add('methodName','updateSpecimenLocation');
            var colId = getDOM('CollectionId').value;
            params.add('collectionId',colId);
            params.add('srcBoxId',saveState.srcBoxId);
            params.add('srcPosition',saveState.srcPos);
            params.add('destBoxId',saveState.destBoxId);
            params.add('destPosition',saveState.destPos);

            var fp = function() { AjaxManager.MakeRequest('POST',SpecimenCallBackPath,params,onSpecimenUpdated,true); }
            runAjaxCallBack(fp);
        }
        
        function rollbackLastTransaction()
        {
            if(LastTransferSave)
            {
                doSave(LastTransferSave);
                LastTransferSave = null;
            }
        }
        
        // Function which fires when server returns from saving
        function onSpecimenUpdated(txt,xml)
        {
            var rollBackButton = getDOM('RollbackButton');
            var disable = LastTransferSave==null;
            enableDisableImage(rollBackButton,disable,'../../Images/RollbackLastTransaction.gif','../../Images/RollbackLastTransaction_Off.gif');

            updateActiveCells();
            updateCurrentBoxFields('','');
            updateNewBoxFields('','');
            
            if(LastTransferSave==null)
            {
                doBoxCallBack(getDOM('Boxes'));
                doBoxCallBack(getDOM('NewBox'));
            }
            lock.unlock();
        }
        
        function updateActiveCells()
        {
            if(CurrentBoxMatrix.activePosition) 
            { 
                CurrentBoxMatrix.activePosition.className = 'AvailablePosition'; 
                CurrentBoxMatrix.activePosition = null;
            }
            if(NewBoxMatrix.activePosition) 
            { 
                NewBoxMatrix.activePosition.className = 'FilledPosition';
                NewBoxMatrix.activePosition = null;
            }
        }
        
        // Moves the currently selected box to a new parent container
        function moveBoxToNewContainer()
        {
            var response=confirm('Are you sure you want to move this entire box to another Container/Shelf ?');
            if(response==true)
            {
                var currentBox = getDOM('Boxes');
                var newContainer = getDOM('NewContainer');
                var showMessage = false;
                if(currentBox.options.length>0 && newContainer.options.length>0)
                {
                    var currentBoxId = getValue(currentBox);
                    var newContainerId =  getValue(newContainer);
                    
                    if(currentBoxId!='' && newContainerId!='')
                    {
                        var params = new Param();
                        params.add('methodName','moveBoxToNewContainer');
                        params.add('boxId',currentBoxId);
                        params.add('newContainerId',newContainerId);
                        var fp = function() { AjaxManager.MakeRequest('POST',SpecimenCallBackPath,params,onBoxMoved,true); }
                        runAjaxCallBack(fp);
                    }
                }
            }
        }
        
        // Fires when request to move box returns from server
        function onBoxMoved(txt,xml)
        {
            //Alert message as redirecting to new window
            var message='You will now be redirected to the new location of this box along with Specimen details.';
            // Alert user to changes
            alert(message);
            // Reload page to show new box location & specimen details
            gotoSpecimendeatails()
            
        }
        
        function gotoSpecimendeatails()
        {
            var baseURL = '<%= Caisis.UI.Core.Classes.PageUtil.GetAbsoluteUrl(Page, "SpecimenStorageBox.aspx") %>';
            
            var currentBox = getDOM('Boxes');
            var newContainer = getDOM('NewContainer');
            
            var currentBoxId = getValue(currentBox);
            var newContainerId =  getValue(newContainer);
            
            var url = baseURL + '?boxId=' + currentBoxId + '&containerId='+ newContainerId ;        
            var title = 'Specimen Box Details';
            
            top.showModal(url,title);     
        }

        Event.Register('load',window,wireSelectsOnPageLoad);
        
    </script>

    <style type="text/css">
        body
        {
            margin:0px;
        }
        .ListManSubTitle
        {
            font-size: 13px;
            font-weight: bold;
            text-align:center;
            margin-bottom:5px;
            padding-left:40px;
        }
        body
        {
            background-color:#f8fafc;
        }
        .DataEntryRow
        {
            width: 99%;
            margin: 5px 0px 5px 0px;
            white-space: nowrap;
        }

        .DataEntryRow select
        {
            width: 100px;
        }
        .label
        {
            text-align:right; 
            vertical-align:top;
            padding-right:2px;
            padding-top:5px;
            width:125px;
            color: #000000;
        }
        .leftAligned
        {
            text-align:left;
            padding-bottom:3px;
        }
        .boxSet
        {
            width:40%;
            text-align:left;
            vertical-align:top;
        }
        
        #BoxMatrixHolder
        {
            width: 700px;
            margin: auto auto auto auto;
        }
        
        #CurrentBoxMatrix
        {
            float: left;
            width: 325px;
            border: 1px solid black;
        }
        #NewBoxMatrix
        {
            float: right; 
            width: 325px;
            border: 1px solid black;
        }
        
    .CurrentPosition {  background-color: #8d2a2c; color: #ffffff; font-weight: bold; border: solid 2px #8d2a2c; border-collapse: separate; }
    .FilledPosition { background-color: #999999; color: #ffffff; cursor: default;  border: solid 2px #999999; border-collapse: separate;}
    .UnavailablePosition { background-color: #666666; color: #ffffff; cursor: text; border: solid 2px #666666; border-collapse: separate;}
    .AvailablePosition { background-color: #e4e4e4; color: #000000; border: solid 2px #e4e4e4; border-collapse: separate; }
    .AvailablePositionHover { background-color: #e4e4e4; color: #ffffff; border: solid 2px #8d2a2c; border-collapse: separate; color: #8d2a2c;}
    .ActivePosition { background-color: #0066cc; color: #ffffff; border: solid 2px #0066cc; border-collapse: separate; }
    .TransferablePosition { background-color: #f1f7fc; color: #00668d; border: solid 1px #666666; border-collapse: separate; }
    .TransferableSelectedPosition { background-color: #d8c4c5; color: #00668d; border: solid 1px #333333; border-collapse: separate; }
    .AcceptablePosition { background-color: #e4e4e4; color: #000000; border: solid 2px #e4e4e4; border-collapse: separate; }
    .AcceptableSelectedPosition { background-color: #d8c4c5; color: #00668d; border: solid 1px #333333; border-collapse: separate; }
    
    /*.BoxMatrix { border: 1px solid #666666; } e9d5d6*/
    .BoxMatrix td
    {
        text-align: center;
        vertical-align: middle;
        height: 12px;
        font-size: 10px;
        cursor: pointer;
    }
    
    .TransferLegend
    {
        background-color: #f9f9f9; 
        border: solid 1px #dddddd; 
        margin: 20px auto auto auto;
        table-layout: fixed;
        width: 95%;
        color: #333333; 
        font-size: 11px;
        text-align:left;
    }
    .LegendText
    {
        white-space: nowrap;
        float: left; 
        display: block; 
        margin-right: 20px;
    }
    .leftDivContainer
    {
        float:left;
        width:50%;
        vertical-align:top;
        text-align:center;
    }
    .rightDivContainer
    {
        float:right;
        width:50%;
        vertical-align:top;
    }
    .middleDivContainer
    {
        float:left;
        width:100px;
    }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
        <!-- Keep Track of Ids -->
        <asp:HiddenField ID="CollectionId" runat="server" />
        <div style="margin: 5px auto auto auto; width: auto; width: auto;" runat="server" id="ContentPanel">
            <span class="ListManTitle">Move Box: </span><span class="ListManTitle" id="boxNameLabel" runat="server"></span>
            <div style="margin-top: 5px;">
                <!-- Left Specimen Box Chooser and Matrix -->
                <div id="leftBoxSet" runat="server" class="leftDivContainer" style="width: 325px;">
                    <div class="ListManSubTitle">
                        Origin Box</div>
                    <table>
                        <tr >
                            <td style="text-align:right;"><cc:CaisisSelect Enabled="false" LabelClass="label" FieldLabel="Site" ID="Sites"
                                runat="server" LookupDistinct="SpecimenSites; SiteId; SiteName" Width="200">
                            </cc:CaisisSelect></td>
                        </tr>
                        <tr>
                            <td style="text-align:right;"> <cc:CaisisSelect Enabled="false" LabelClass="label" FieldLabel="Storage/Shelf" ID="Storages"
                                runat="server" DataTextField="StorageName" DataValueField="StorageId" Width="200">
                            </cc:CaisisSelect></td>
                        </tr>
                        <tr>
                            <td style="text-align:right;"> &nbsp;<cc:CaisisSelect Enabled="false" LabelClass="label" FieldLabel="Container/Rack" ID="Containers"
                                runat="server" DataTextField="ContainerName" DataValueField="ContainerId" Width="200">
                            </cc:CaisisSelect></td>
                        </tr>
                        <tr>
                            <td style="text-align:right;"><cc:CaisisSelect Enabled="false" LabelClass="label" FieldLabel="Box" ID="Boxes"
                                runat="server" DataTextField="BoxName" DataValueField="BoxId" Width="200">
                            </cc:CaisisSelect></td>
                        </tr>
                    </table>
                    
                    <div style="display: none;">
                    </div>
                </div>
                <%--<div id="leftUnboxed" runat="server" style="visibility: hidden; display: none;">
                    <div class="ListManSubTitle">
                        Specimens</div>
                    <asp:RadioButtonList ID="unboxedSpecList" runat="server" DataTextField="SpecimenReferenceNumber"
                        DataValueField="SpecimenId">
                    </asp:RadioButtonList>
                </div>--%>
                <!-- message displayed when moving entire box to new location -->
                <div class="middleDivContainer" style="margin: 75px auto auto 45px; padding-left:10px;">
                    <%--<button id="MoveBoxButton" disabled="disabled" onclick="moveBoxToNewContainer(); return false;">
                        Move Entire Box</button>--%>
                    <input id="MoveBoxButton" disabled="disabled" type="image" src="../../Images/MoveEntireBox_Off.gif"
                        alt="Move Entire Box" onclick="moveBoxToNewContainer(); return false;" />
                </div>
                <!-- Right Specimen Box Chooser and Matrix -->
                <div id="rightBoxSet" class="rightDivContainer" style="width: 300px; padding-right:35px;">
                    <div class="ListManSubTitle">
                        Destination Box</div>
                    <table>
                        <tr>
                            <td style="text-align:right;">  <cc:CaisisSelect LabelClass="label" FieldLabel="Site" ID="NewSite" runat="server"
                                LookupDistinct="SpecimenSites; SiteId; SiteName" Width="200">
                            </cc:CaisisSelect></td>
                        </tr>
                         <tr>
                            <td style="text-align:right;"> <cc:CaisisSelect LabelClass="label" FieldLabel="Storage/Shelf" ID="NewStorage" runat="server"
                                DataTextField="StorageName" DataValueField="StorageId" Width="200">
                            </cc:CaisisSelect></td>
                        </tr>
                         <tr>
                            <td style="text-align:right;"><cc:CaisisSelect LabelClass="label" FieldLabel="Container/Rack" ID="NewContainer" runat="server"
                                DataTextField="ContainerName" DataValueField="ContainerId" Width="200">
                            </cc:CaisisSelect></td>
                        </tr>
                         <tr>
                            <td style="text-align:right;"> <cc:CaisisSelect LabelClass="label" FieldLabel="Box" ID="NewBox" runat="server"
                                DataTextField="BoxName" DataValueField="BoxId" Width="200">
                            </cc:CaisisSelect></td>
                        </tr>
                    </table>
                   
                </div>
            </div>
            <!--Left & right Box matrix - should be same div & height=235 for formatting reasons -->
            <div style="clear: both; height: 235px; margin-top: 5px; padding-left:10px; padding-right:10px;">
                <table id="CurrentBoxMatrix" class="BoxMatrix" align="left"></table>
                <table id="NewBoxMatrix" class="BoxMatrix" align="right"></table>
            </div>
            
            <div style="clear: both;">
                <div class="leftDivContainer" style="width: 500px; position:relative;">
                    <!-- Legend for Transfer -->
                    <table class="TransferLegend" cellpadding="2">
                        <thead>
                            <tr>
                                <td>
                                    <span style="font-size: 12px; font-weight: bold">Legend</span></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <!-- TransferablePosition Key -->
                                    <span class="TransferablePosition" style="display: block; width: 15px; height: 15px;
                                        margin-right: 5px; border: solid 1px #cccccc; float: left;"></span><span class="LegendText">
                                            Transferable Specimens</span>
                                    <!-- FilledPosition Key -->
                                    <span class="FilledPosition" style="display: block; width: 15px; height: 15px; margin-left: 10px;
                                        margin-right: 5px; border: solid 1px #cccccc; float: left;"></span><span class="LegendText">
                                            Filled Positions</span>
                                    <!-- AcceptablePosition Key -->
                                    <span class="AcceptablePosition" style="display: block; width: 15px; height: 15px;
                                        margin-right: 5px; border: solid 1px #cccccc; float: left; display: block; margin-right: 20px;">
                                    </span><span class="LegendText">Empty Positions</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="rightDivContainer" style="width: auto; position:relative; padding-right:15px;">
                    <input type="image" src="../../Images/RollbackLastTransaction_Off.gif" disabled="disabled" id="RollbackButton" style="float: left;"
                        onclick="rollbackLastTransaction(); return false;" />
                </div>
            </div>
            <div style="clear: both;">
                <div style="clear: both;">
                    <input id="CurrentBoxId" type="hidden" />
                    <input id="CurrentPosition" type="hidden" />
                    <input id="NewBoxId" type="hidden" />
                    <input id="NewPosition" type="hidden" /></div>
            </div>
        </div>
    </form>
</body>
</html>
