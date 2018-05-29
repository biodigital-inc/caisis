<%@ Page Language="c#" EnableViewState="true" CodeFile="SpecimenQueryResults.aspx.cs" AutoEventWireup="True" Inherits="Caisis.UI.Modules.SpecimenMgmt.SpecimenQueryResults" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="val" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Specimen Query Results</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/Modal.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    Browser.ResizeElement( { nodeId: 'PDFormDiv', heightOffset: 275 } );   
    Browser.ResizeElement( { nodeId: 'AllFieldsPanel', heightOffset: 235 } ); 
    Browser.ResizeElement( { nodeId: 'AllFieldsSpecsDiv', heightOffset: 293 } );

        function getSpecimenCount()
        {
            var specTable = document.getElementById('specimensTable');
            var specimenCount = 0;
	        for(var i=0;i<specTable.rows.length;i++)
	        {
	            var row = specTable.rows[i];
	            if(row.getElementsByTagName('input').length>0)
	            {
                    var rowCheckBox =  row.getElementsByTagName('input')[3];
                    if(rowCheckBox.checked && !rowCheckBox.disabled)
                    {
                        specimenCount++;
                    }
                }
	        }
			document.getElementById("specimenCount").innerHTML = '&nbsp;' + specimenCount + '&nbsp;'; 	
        }
        
        function checkCheckBoxAndUpdateCount(cell, evt)
        {
            //alert('clicked td area, not checkbox');
            stopBubble(evt);
            checkBox = cell.getElementsByTagName('input')[3];
      
            if(!checkBox.checked && !checkBox.disabled){ checkBox.checked = true }
            else {checkBox.checked = false} //disabled specimens should always be unchecked
      
            getSpecimenCount();
        }
        
        // Returns if the cell fires the event and not the checkbox
	    function isCellClick(evt)
	    {   
	        //alert('td cell area clicked .. including checbox clicks');
	        var n = evt.srcElement||evt.target;
	        return n.nodeName=='INPUT'?false:true;
	    }
	    
        function CheckAll(checkAllBox)	
        {
            var specTable = document.getElementById('specimensTable');
	        for(var i=0;i<specTable.rows.length;i++)
	        {
	            var row = specTable.rows[i];
	            if(row.getElementsByTagName('input').length>0)
	            {
                    var rowCheckBox =  row.getElementsByTagName('input')[3];
                    if(!rowCheckBox.disabled)
                    {
                        rowCheckBox.checked = checkAllBox.checked;
                    }                    
                }
	        }
            getSpecimenCount();		
        }
        // create string of specimen IDs from checked checkboxes
        function GetCheckedSpecimenIds()
        {   
            var specimenIdList = new Array();
            var specTable = document.getElementById('specimensTable');
	        for(var i=0;i<specTable.rows.length;i++)
	        {
	            var row = specTable.rows[i];
	            if(row.getElementsByTagName('input').length>0)
	            {
                    var rowCheckBox =  row.getElementsByTagName('input')[3];
                    if(rowCheckBox.checked && !rowCheckBox.disabled)
                    {
                        var specId = row.getElementsByTagName('input')[0].value; /* was tableRow ... threw error */
                        specimenIdList.push(specId);
                    }
                }
	        }
		    return specimenIdList;
        }
        
        function selectByBox(tableRow)
	    {
	        var boxId = tableRow.getElementsByTagName('input')[1].value;
	        var checkBox = tableRow.getElementsByTagName('input')[3];
	        var specTable = document.getElementById('specimensTable');
	        var cbrowIndex = tableRow.rowIndex;
	        
	        if(checkBox.disabled)
	        {
	            return;
	        }

	        else
	        {
	            if(checkBox.checked)
	            {
	                // Logic: if the current checkbox is selected, we care about two of the possible scenarios
	                //  1. all checkboxes in this box are selected
	                //  2. not all the checkboxes in this box are selected
	                // NOW, if all checkboxes in a box are checked, that means that the specimen in the (specimen)rows 
	                // above or below and with the same boxId, are checked as well
	                // SO, it is sufficient to check the previous and the next specimen rows
	                // if these are not checked, then it means that it is scenario 2
	                var allChecked = true;
	                
	                var rowAboveIndex = cbrowIndex-2;
	                var rowBelowIndex = cbrowIndex+2;
	                
	                if(rowAboveIndex > 0)
	                {
	                    var isInSameBox = isSpecimenInSameBoxAndIsNotChecked(boxId, rowAboveIndex);
	                    if(isInSameBox){ allChecked = false; }
	                }
	                if(rowBelowIndex < specTable.rows.length)
	                {
	                    var isInSameBox = isSpecimenInSameBoxAndIsNotChecked(boxId, rowBelowIndex);
	                    if(isInSameBox){ allChecked = false; }
	                }
	              
                    //alert(allChecked + " " + rowAboveIndex + " " + rowBelowIndex);
                    
                    if(allChecked)
                    {
                         checked = !checkBox.checked;
	                    checkBox.checked = checked;
                    }
                    else
                    {
                        checked = checkBox.checked; //handle scenario 2
                    }
	            }
	            else
	            {
	                checked = !checkBox.checked;
	                checkBox.checked = checked;
	            }
	        }
	        
	        for(var i=0;i<specTable.rows.length;i++)
	        {
	            var row = specTable.rows[i];
	            if(row != tableRow && row.getElementsByTagName('input').length>0)
	            {
                    var rowBoxId = row.getElementsByTagName('input')[1].value;
                    var rowCheckBox =  row.getElementsByTagName('input')[3];
                    if(boxId==rowBoxId && boxId!='' && !rowCheckBox.disabled)
                    {
                        rowCheckBox.checked = checked;
                    }
                }
	        }
            getSpecimenCount();
	    }
	    
	    function isSpecimenInSameBoxAndIsNotChecked(boxId, index)
	    {
            var specTable = document.getElementById('specimensTable');
	        
	        var row = specTable.rows[index];
            var rowBoxId = row.getElementsByTagName('input')[1].value;
            var rowCheckBox =  row.getElementsByTagName('input')[3];
            if(rowBoxId==boxId && boxId!='' && !rowCheckBox.disabled && !rowCheckBox.checked)
            {
                return true;
            }
            else { return false; }
	    }
	    
	     // Returns if the row fires the event and not the checkbox
	    function isRowClick(evt)
	    {   
	        var n = evt.srcElement||evt.target;
	        return n.nodeName=='INPUT'?false:true;
	    }
	    	    
	    // returns true if the element firing the event was a checkbox
	    function isCheckboxClick(cb,evt)
	    {
	        return isMouseClick(cb,evt);
	    }
	    
	    // returns true if the element firing the event was an hyperlink (box ... selectByBox)
	    function isBoxSelectClick(box,evt)
	    {
	        stopBubble(evt); // stop table row from firing event
	        return isMouseClick(box,evt);
	    }
	    
	    function onmouseoutRowColor(row, parentid)
	    {
	        if (parentid=="")
            {
                row.style.background="#ffffff";
                row.title="Specimen";
            }
            else if(parentid!="")
            {
                row.style.background="#dfedf9";
                row.title="Sub-Specimen";
            }
	    }
	    
	    function showSpecimenInfo(row, id, parentid)
	    {
	        window.location.href = 'SpecimenDetails.aspx?specimenId=' + id + '&parentspecimenId='+ parentid;
        }
	    
	    // returns a helper function used to set the hidden field and values
	    function getSetBoxAndPositionHelper(argList)
	    {
            var setSpanVal = function(n,v) { if(n.firstChild==null) { n.appendChild(document.createTextNode(v)); } else { n.firstChild.nodeValue = v; } }
            return function(boxIdValue,referenceNumValue,typeValue,subTypeValue,statusValue,qtyValue,unitsValue,boxNameTextValue,positionNameTextValue)
            {
                var argValues = arguments;
                // BoxId is an input field, not span tag
                argList[0].value = argValues[0];
                // start looking through span fields and their associated values
                for(var i=1;i<argValues.length;i++)
                {
                    var argField = argList[i];
                    var argVal = argValues[i];
                    setSpanVal(argField,argVal);
                }
            }
	    }
	    
	    function getRefreshHelper()
	    {
	        var refreshIcon = document.getElementById('RefreshLayer');
	        return function()
	        {
	            refreshIcon.style.display = '';
	        }
	    }
	    
	    // Set help function to null to prevent others from using
	    function hideSpecimenInfo() 
	    { 
	        top.setBoxPositionHelper = null; 
	        top.showRefrshIcon = null;
	    }
        
	    function validateAddToCollection()
	    {
            var specimenIdList = GetCheckedSpecimenIds();        
	        if(specimenIdList.length>0) { return true; }
            else
	        {
	            alert('You have not selected any specimens to group within a collection');
	            return false;
	        }
	    }
	    
	    function confirmExport()
	    {
	        var response=confirm('Are you SURE you want to export results to excel that contains patient identifiers?');
	        if(response==true){return true;}
	        else{return false;}	        
	    }
	    
	    function reloadPage() { alert('we have to rebind the repeater .... called from collection.aspx'); }
	    function hideCollectionFields() { document.getElementById('CollectionFields').style.display = 'none'; }
    </script>

    <style type="text/css">
    td.ListManDataTableCell
    {
        text-align:center;
    }
    td.ListManDataTableCellBordered
    {
        border: 1px dotted #00668D;
        text-align:center;
    }
    td.ListManDataTableCellBorderedOn
    {
        border: 1px solid #00668D;
        text-align:center;
    }
    td.AllFieldsTableTop
    {
        background-color: #00668d;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 10px;
        color: #FFFFFF;
        text-align: center;
    }
    td.AllFieldsTableCell
    {
        text-align:center;
        font-size: 10px;
    }
    </style>
</head>

<body onload="getSpecimenCount();">
     <form id="Form1" action="" method="post" runat="server">
     
     <asp:HiddenField ID="endRecordNumber" runat="server" />
     <asp:HiddenField ID="startRecordNumber" runat="server" />
     <asp:HiddenField ID="HiddenOrderBy" runat="server" />
     
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#f8fafc; height:100%;">
            <tr>
                <td align="center">
                    <table id="SearchLayer" runat="server" width="820" border="0" cellspacing="0" cellpadding="0" style="z-index:69;">
                        <tr>
                            <td style="height:25px;" colspan="6"><img alt="shim" src="../../Images/shim.gif" width="1" height="1" /></td>
                                               
                        </tr>
                       
                       <!-- Page Title, Modify Query Icon and Add to Collection Select -->
                        <tr>
                            <td style="width: 1px;">&nbsp;</td>
                            <td colspan="4"  style="text-align: left; vertical-align: bottom;">
                                <div style="float: left; vertical-align: bottom; padding-top: 5px;">
                                    <!-- Page Title: "View All Specimens" or "Breast Search" or "BTC search" or "Prostate Search" -->
                                    <asp:Label ID="ResultsTitle" runat="server" CssClass="ListManTitle">Specimen Results</asp:Label>
                                      <span style="margin-left: 20px;">
                                         <asp:ImageButton ID="priorRecordsBtn" Visible="false" runat="server" ImageUrl="~/Images/Arrow_Previous_Red.gif" OnCommand="GetMoreRecords" CommandName="Previous"  />
                                        <asp:ImageButton ID="nextRecordsBtn" Visible="false" runat="server" ImageUrl="~/Images/Arrow_Next_Red.gif" OnCommand="GetMoreRecords" CommandName="Next" />
                                    </span>
                                    <span id="RefreshLayer" style="display: none; margin-left: 15px;">Changes were made<img style="vertical-align: middle;
                                        margin-left: 10px; cursor: pointer;" src="../../Images/icon_refresh_small.gif" alt="Refresh Results"
                                        title="Refresh Results" onclick="window.location = window.location;" /></span>
                                </div>
                                <!-- Modify Query and Add to Collection Select -->
                                <div class="ListManTitle" style="float: right; vertical-align: top; padding-bottom: 7px;
                                    font-size: 12px;">
                                   
                                    Add<span id="specimenCount">&nbsp;</span>specimen(s) to &nbsp;
                                    <cc:CaisisSelect ID="ddlCollectionName" runat="server" AppendDataBoundItems="true"
                                        Table="SpecimenCollections" Field="CollectionName" Width="250" ShowLabel="false"
                                        ShowEmptyListItem="false">
                                        <asp:ListItem Text="&lt;New Collection&gt;" Value="0">
                                        </asp:ListItem>
                                    </cc:CaisisSelect>
                                    &nbsp;
                                    <asp:ImageButton ID="addToCollectionBtn" runat="server" OnClientClick="return validateAddToCollection()"
                                        OnClick="AddSpecimensToCollection" ImageUrl="Images/AddToCollectionSmall.gif"
                                        ToolTip="Add Specimens to Collection" />
                                </div>
                            </td>
                            <td style="width: 5px;">&nbsp;</td>
                        </tr>
                        
                        <!-- Rounded Top Border -->
                        <tr>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5" /></td>
                            <td colspan="4" class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="10" height="5" /></td>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerTopRight.gif" width="5" height="5" /></td>
                        </tr>
                              
                        <!-- Message Total Specimens Returned by Search and Show Unavailable Specimens Checkbox -->
                        <tr>
                            <td class="ListManBGTableLeftSide" style="width: 1px;">
                                &nbsp;</td>
                            <td colspan="4" class="ListManBGTableBody" align="right" valign="middle" style="text-align: right;
                                padding-top: 5px; padding-bottom: 3px;">
                                <div style="float: left; padding-top: 3px;">
                                    <span class="TableNotes" style="margin-left: 7px;">
                                        <asp:Label ID="numOfRecordsMsg" runat="server"></asp:Label>
                                    </span>
                                    <span style="margin-left: 20px;">
                                         <asp:ImageButton ID="modifyQueryBtn" ImageUrl="Images/ModifyQuery.gif" runat="server" ToolTip="Modify Query" 
                                            OnClick="GoBackToSearchPage"  />
                                    </span>
                                    <span class="TableNotes">
                                        <span class="TableNotes" style="margin-right: 7px;">
                                        <cc:CaisisCheckBox ID="chkViewAll" runat="server" ShowLabel="false" AutoPostBack="true" 
                                            OnCheckedChanged="ViewAllCheckChanged" />Include Unavailable Specimens</span>
                                     
                                    </span>
                                </div>
                                
                                <div style="float: right; padding-right: 20px">
                                    <val:ExcelExportImageButton ID="ExcelBtn" runat="server" OnClientClick="return confirmExport();"
                                        OnClick="ExportToExcelClick" />
                                </div>
                            </td>
                            <td class="ListManBGTableRightSide" style="width: 5px;">
                                &nbsp;</td>
                        </tr>
                        
                        <!-- Specimens Panel -->
                        <tr style="background-color: #F1F7FC;">
                            <td class="ListManBGTableLeftSide" style="width: 1px;">&nbsp;</td>
                            <td colspan="4" align="center" style="padding-bottom:3px;">
                                <asp:Panel ID="specimensPanel" Visible="true" runat="server" style="position: relative; width: 780px;">
                                    <!-- Titles - Specimens "Grid" ... width is 780 to compensate for next div -->
                                    <table id="resultsTitles" width="780" border="0" cellpadding="1" cellspacing="0" class="ListManDataTableOuterBorder" runat="server">
                                        <tr>
                                            <td style="width: 20px;" class="ListManDataTableTop">
                                                <asp:CheckBox title="check/uncheck all specimens" ID="checkAll" onclick="CheckAll(this);"
                                                    runat="server" name="checkAll" /></td>
                                           
                                            <td style="width: 65px; text-align: center;" class="ListManDataTableTop">
                                                <asp:LinkButton ID="Ref" runat="server" Text="Ref. #" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="Ref" ToolTip="Ref#">
                                                </asp:LinkButton>
                                            </td>
                                             <td style="width: 90px;" class="ListManDataTableTop">
                                                 <asp:LinkButton ID="PtId" runat="server" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="PtId" ToolTip="TumorBank #">
                                                 </asp:LinkButton>
                                             </td>
                                             <td id="hdrMRN" runat="server" style="width: 50px;" class="ListManDataTableTop" visible="false">
                                                <asp:Label ID="PatientMRN" runat="server" ToolTip="MRN">MRN</asp:Label>
                                             </td>
                                            <%--<td style="width: 110px;" class="ListManDataTableTop">Collection Name</td>--%>
                                            <td title="The specimen tissue or blood type" style="width: 67px;" class="ListManDataTableTop">
                                                <asp:LinkButton ID="Type" runat="server" Text="Type" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="Type" ToolTip="Specimen Type">
                                                </asp:LinkButton>
                                            </td>
                                            <td style="width: 67px;" class="ListManDataTableTop">
                                                <asp:LinkButton ID="SubType" runat="server" Text="SubType" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="SubType"  ToolTip="Specimen SubType">
                                                </asp:LinkButton>
                                            </td>
                                            <td style="width: 100px;" class="ListManDataTableTop">
                                                <asp:LinkButton ID="Status" runat="server" Text="Status" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="Status" ToolTip="Specimen Status">
                                                </asp:LinkButton>
                                            </td>
                                            <td style="width: 50px;" class="ListManDataTableTop">Org Qty</td>
                                            <td style="width: 60px;" class="ListManDataTableTop">
                                                <asp:LinkButton ID="Box" runat="server" Text="Box" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="Box" ToolTip="Click to sort descending">
                                                </asp:LinkButton>
                                            </td>
                                            <td title="Position within the Box"  style="width: 50px;" class="ListManDataTableTop">Pstn</td>
                                            <td id="hdrPathology" runat="server" style="width: 90px;" class="ListManDataTableTop" visible="false">
                                                <asp:Label ID="specimenPath" runat="server" ToolTip="MRN">Pathology</asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    
                                    <!-- Content - Results Table -->
                                    <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 370px; width:780px ; border:solid 1px #999999; background-color:#ffffff;">
                                        <table id="specimensTable" width="760" cellspacing="0" cellpadding="1" border="0">
                                            <asp:Repeater ID="rptSpecimenResults" runat="server" OnItemDataBound="rptItemCreated">
                                               <ItemTemplate>
                                                        <tr id="listRow" class="ListManDataTableRow" align="center" 
                                                             style="vertical-align: middle;cursor: pointer;" onclick="if(isRowClick(event)) { showSpecimenInfo(this,'<%# Eval("SpecimenId") %>','<%#Eval("ParentSpecimenId") %>'); }" onmouseover="this.className='ListManDataTableRowOver';" onmouseout="this.className='ListManDataTableRow';" >
                                                        <td style="width: 20px;" class="ListManDataTableCell" 
                                                            onclick="if(isCellClick(event)) {checkCheckBoxAndUpdateCount(this, event);}">
                                                            <asp:HiddenField runat="server" ID="RowSpecimenId" Value='<%# Eval("SpecimenId") %>' />
                                                            <asp:HiddenField runat="server" ID="RowBoxId" Value='<%# Eval("BoxId") %>' />
                                                            <asp:HiddenField runat="server" ID="RowParentSpecimenId" 
                                                                Value='<%# Eval("ParentSpecimenId") %>' />
                                                            <input onclick="if(isCheckboxClick(this,event)) { getSpecimenCount(); }" type="checkbox"
                                                                runat="server" id="chkSpId" style="cursor: default;"  />
                                                        </td>
                                                        
                                                        <td style="width: 70px;" class="ListManDataTableCell" >
                                                            <span id="SpecimenReferenceNumber<%# Eval("SpecimenId") %>"><%# Eval("SpecimenReferenceNumber")%></span>
                                                        </td>
                                                        
                                                        <td style="width: 90px;" class="ListManDataTableCell" >
                                                            <span id="Identifier<%# Eval("SpecimenId") %>"><%# Eval("Identifier")%></span>
                                                        </td>
                                                        
                                                        <td id="dataMRN" style="width: 50px;" class="ListManDataTableCell" runat="server" visible="false" >
                                                            <span id="ptMRN<%# Eval("SpecimenId") %>"><%# Eval("MRN")%></span>
                                                        </td>
                                                       
                                                       <%-- <td style="width: 110px;" class="ListManDataTableCell" align="center">
                                                            <span id="CollectionName<%# Eval("SpecimenId") %>"><%# Eval("CollectionName") %></span>
                                                        </td> --%>
                                                        <td style="width: 70px;" class="ListManDataTableCell" >
                                                            <span id="SpecimenType<%# Eval("SpecimenId") %>"><%# Eval("SpecimenType") %></span>
                                                        </td>
                                                        <td style="width: 70px;" class="ListManDataTableCell" >
                                                            <span id="SpecimenSubType<%# Eval("SpecimenId") %>"><%# Eval("SpecimenSubType")%></span>
                                                        </td>  
                                                        <td style="width: 100px;" class="ListManDataTableCell" >
                                                            <span id="SpecimenStatus<%# Eval("SpecimenId") %>"><%# Eval("SpecimenStatus")%></span>
                                                        </td>
                                                        <td style="width: 50px;" class="ListManDataTableCell" >
                                                            <span id="SpecimenOriginalQty<%# Eval("SpecimenId") %>"><%# Eval("SpecimenOriginalQty")%></span><span id="SpecimenUnits<%# Eval("SpecimenId") %>"><%# Eval("SpecimenUnits")%></span>
                                                        </td>
                                                        <td runat="server" id="boxCell" onclick="if(isBoxSelectClick(this,event)) { selectByBox(this.parentNode); }" style="width: 60px; cursor: pointer;" align="center" class="ListManDataTableCellBordered" onmouseover="this.className='ListManDataTableCellBorderedOn'" onmouseout="this.className='ListManDataTableCellBordered'">
                                                            <a id="selectAllinBoxTitle" runat="server">
                                                                <span id="BoxName<%# Eval("SpecimenId") %>"><%# Eval("BoxName") %></span>
                                                            </a>
                                                        </td>
                                                        <td style="width: 40px;" class="ListManDataTableCell" >
                                                            <span id="PositionName<%# Eval("SpecimenId") %>"><%# Eval("Position") %></span>
                                                        </td>
                                                        <td id="dataPathology" style="width: 90px;" class="ListManDataTableCell" runat="server" visible="false" >
                                                            <asp:Label ID="BTCPath" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    <tr>
                                                        <td colspan="11" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                        </td>
                                                    </tr>
                                                </SeparatorTemplate>
                                                <FooterTemplate>
                                                    <tr>
                                                        <td colspan="11" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                        </td>
                                                    </tr>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            
                                            <!-- Message - Search Returns Empty -->
							                <tr id="noSpecimensRow" runat="server" class="ListManDataTableRow" valign="middle" visible="false" style="cursor: default;" > 
										        <td colspan="9" style="height: 325px; text-align: center; font-size: 13px; color: #8d2a2c;">
										            <asp:Label ID="noRecordsFound" runat="server">No Specimen Records Matched Your Search Criteria.</asp:Label>
										        </td>										        
									        </tr> 
                                        </table>
                                    </div>                                    
                                </asp:Panel>
                                
                                <!-- Specimens panel showing all fields -->
                                <asp:Panel ID="AllFieldsPanel" Visible="false" runat="server" style="position: relative; width: 920px; overflow-y: hidden; overflow-x: auto;">
                                    <table id="AllFieldsHdrTbl" width="1150px" border="0" cellpadding="1" cellspacing="0" class="ListManDataTableOuterBorder" runat="server">
                                        <tr>
                                            <td style="width: 20px;" class="AllFieldsTableTop">
                                                <asp:CheckBox title="check/uncheck all specimens" ID="HdrChkBx" onclick="CheckAll(this);"
                                                    runat="server" name="checkAll" /></td>                                           
                                             <td style="width: 60px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="RefHdr" runat="server" Text="Ref. #" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="Ref" ToolTip="Ref#"/>
                                             </td>
                                             <td style="width: 60px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="PtIdHdr" runat="server" Font-Underline="true" style="color:#FFFFFF"
                                                    OnCommand="SortRecords" CommandName="PtId" ToolTip="TumorBank #"/>
                                             </td>
                                             <td style="width: 55px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="PtMRNHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="PtMRN" ToolTip="MRN" Text="MRN" />
                                             </td>
                                             <td style="width: 90px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="PtNameHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="PtName" ToolTip="Pt Name" Text="Pt Name" />
                                             </td>
                                             <td style="width: 50px;" class="AllFieldsTableTop" title="The specimen tissue or blood type" >
                                                <asp:LinkButton ID="SpecTypeHdr" runat="server" Text="Type" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="Type" ToolTip="Specimen Type" style="color:#FFFFFF"/>
                                             </td>
                                             <td style="width: 50px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="SubTypeHdr" runat="server" Text="Sub Type" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="SubType"  ToolTip="Specimen SubType" style="color:#FFFFFF"/>
                                             </td>
                                             <td style="width: 40px;" class="AllFieldsTableTop">Blood</td>
                                             <td style="width: 65px;" class="AllFieldsTableTop">
                                             <asp:LinkButton ID="SpecStatusHdr" runat="server" Text="Status" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="Status" ToolTip="Specimen Status" style="color:#FFFFFF" />
                                            </td>
                                             <td style="width: 60px;" class="AllFieldsTableTop">Contact/ Purpose</td>
                                             <td style="width: 50px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="OrgQtyHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="OrgQty" ToolTip="Org Qty" Text="Org Qty" />
                                             </td>
                                             <td style="width: 50px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="RemQtyHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="RemQty" ToolTip="Rem Qty" Text="Rem Qty" />
                                             </td>
                                             <td style="width: 60px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="BoxHdr" runat="server" Text="Box" Font-Underline="true" style="color:#FFFFFF"
                                                    OnCommand="SortRecords" CommandName="Box" ToolTip="Click to sort descending" />
                                             </td>
                                             <td style="width: 60px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="DOSHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="DOS" ToolTip="DOS" Text="DOS" />
                                             </td>
                                             <td style="width: 50px;" class="AllFieldsTableTop">Surgeon</td>
                                             <td style="width: 120px;" class="AllFieldsTableTop">Pathology</td>
                                             <td style="width: 40px;" class="AllFieldsTableTop">Cytogenetics</td>
                                             <td style="width: 80px;" class="AllFieldsTableTop">Vital<br />Status</td>
                                             <td style="width: 85px;" class="AllFieldsTableTop">Test</td>
                                             <td style="width: 85px;" class="AllFieldsTableTop">Result</td>
                                             <td style="width: 85px;" class="AllFieldsTableTop">06-107</td>
                                        </tr>
                                    </table>
                                    <div id="AllFieldsSpecsDiv" style="overflow-y: auto; overflow-x:hidden; width:1160px ; border:solid 1px #999999; background-color:#ffffff;">
                                        <table id="specimensTable" width="1150px" cellspacing="0" cellpadding="1" border="0" >
                                            <asp:Repeater ID="AllFieldsSpecsRpt" runat="server" OnItemDataBound="AllFieldsRptItemCreated">
                                               <ItemTemplate>
                                                        <tr id="listRow" class="ListManDataTableRow" align="center" 
                                                             style="vertical-align: middle;cursor: pointer;" onclick="if(isRowClick(event)) { showSpecimenInfo(this,'<%# Eval("SpecimenId") %>','<%#Eval("ParentSpecimenId") %>'); }" onmouseover="this.className='ListManDataTableRowOver';" onmouseout="this.className='ListManDataTableRow';" >
                                                        <td style="width: 20px;" class="AllFieldsTableCell" 
                                                            onclick="if(isCellClick(event)) {checkCheckBoxAndUpdateCount(this, event);}">
                                                            <asp:HiddenField runat="server" ID="RowSpecimenId" Value='<%# Eval("SpecimenId") %>' />
                                                            <asp:HiddenField runat="server" ID="RowBoxId" Value='<%# Eval("BoxId") %>' />
                                                            <asp:HiddenField runat="server" ID="RowParentSpecimenId" 
                                                                Value='<%# Eval("ParentSpecimenId") %>' />
                                                            <input onclick="if(isCheckboxClick(this,event)) { getSpecimenCount(); }" type="checkbox"
                                                                runat="server" id="chkSpId" style="cursor: default;"  />
                                                        </td>
                                                        
                                                        <td style="width:60px;" class="AllFieldsTableCell">&nbsp;<%#Eval("SpecimenReferenceNumber")%></td>
                                                        <td style="width:60px;" class="AllFieldsTableCell">&nbsp;<%#Eval("Identifier")%></td>
                                                        <td style="width:55px;" class="AllFieldsTableCell">&nbsp;<%# Eval("MRN")%></td>
                                                        <td style="width:90px;" class="AllFieldsTableCell">&nbsp;<%# Eval("PtName")%></td>
                                                        <td style="width:50px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("SpecimenType") %></td>
                                                        <td style="width:50px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("SpecimenSubType") %></td> 
                                                        <td style="width:40px;" class="AllFieldsTableCell">
                                                            <asp:Label ID="BloodLbl" runat="server" Text="N" /></td> 
                                                        <td style="width:65px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("SpecimenStatus")%></td>
                                                        <td style="width:60px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("ContactPurpose")%></td>
                                                        <td style="width:50px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("SpecimenOriginalQty")%><%# Eval("SpecimenUnits") %></td>
                                                        <td style="width:50px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("SpecimenRemainingQty")%><%# Eval("SpecimenUnits") %></td>
                                                        <td runat="server" id="boxCell" onclick="if(isBoxSelectClick(this,event)) { selectByBox(this.parentNode); }" style="width: 60px; cursor: pointer;" align="center" class="ListManDataTableCellBordered" onmouseover="this.className='ListManDataTableCellBorderedOn'" onmouseout="this.className='ListManDataTableCellBordered'">
                                                            <a id="selectAllinBoxTitle" runat="server">&nbsp;<%# Eval("BoxName") %></a>
                                                        </td>
                                                        <td style="width: 50px;" class="AllFieldsTableCell">
                                                            &nbsp;<%# DataBinder.Eval(Container.DataItem, "OpDate", "{0:d}")%></td>
                                                        <td style="width: 50px;" class="AllFieldsTableCell">&nbsp;<%# Eval("OpCaseSurgeon")%></td>
                                                        <td style="width: 115px;" class="AllFieldsTableCell">&nbsp;<%# Eval("PathHistology") %></td>
                                                        <td style="width:40px;" class="AllFieldsTableCell">
                                                            <asp:Label ID="CytoRptLbl" runat="server" Text="N" /></td>
                                                        <td style="width: 80px;" class="AllFieldsTableCell">&nbsp;<%# Eval("VitalStatus") %> </td>
                                                        <td style="width: 90px; " class="AllFieldsTableCell">&nbsp;<%# Eval("EventType")%></td>
                                                        <td style="width: 90px; " class="AllFieldsTableCell">&nbsp;<%# Eval("EventResult")%></td>
                                                        <td style="width: 90px; " class="AllFieldsTableCell">&nbsp;<%# Eval("PtConsented")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    <tr>
                                                        <td colspan="21" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                        </td>
                                                    </tr>
                                                </SeparatorTemplate>
                                                <FooterTemplate>
                                                    <tr>
                                                        <td colspan="21" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                        </td>
                                                    </tr>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            
                                            <!-- Message - Search Returns Empty -->
							                <tr id="AllFieldsNoSpecsRow" runat="server" class="ListManDataTableRow" valign="middle" visible="false" style="cursor: default;" > 
										        <td colspan="9" style="height: 325px; text-align: center; font-size: 13px; color: #8d2a2c;">
										            <asp:Label ID="AllFieldsnoRecordsFound" runat="server">No Specimen Records Matched Your Search Criteria.</asp:Label>
										        </td>										        
									        </tr> 
                                        </table>
                                    </div>
                                </asp:Panel>
                                
                                <%--Prostate Specimen by Histology panel--%>
                                 <asp:Panel ID="ProsSpecHistologyPanel" Visible="false" runat="server" style="position: relative; width: 920px; overflow-y: hidden; overflow-x: auto;">
                                    <table id="ProsSpecHistologyHdrTbl" width="1160px" border="0" cellpadding="1" cellspacing="0" class="ListManDataTableOuterBorder" runat="server">
                                        <tr>
                                            <td style="width: 20px;" class="AllFieldsTableTop">
                                                <asp:CheckBox title="check/uncheck all specimens" ID="ProsSpecHistologyHdrChkBx" onclick="CheckAll(this);"
                                                    runat="server" name="checkAll" /></td>                                           
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecHistologyRefHdr" runat="server" Text="Reference_No" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="SpecimenReferenceNumber" ToolTip="Reference Number"/>
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecHistologyHdr" runat="server" Font-Underline="true" style="color:#FFFFFF"
                                                    OnCommand="SortRecords" CommandName="Histology" ToolTip="Histology" Text="Histology"/>
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecHistologySampleTypeHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="SpecimenType" ToolTip="Sample_Type" Text="Sample_Type" />
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecHistologySubTypeHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="SpecimenSubType" ToolTip="Specimen Sub Type" Text="SubType" />
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop" >
                                                <asp:LinkButton ID="LinkButton2" runat="server" Text="Status" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="SpecimenStatus" ToolTip="Specimen Status" style="color:#FFFFFF"/>
                                             </td>
                                              <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecHistologySiteHdr" runat="server" Text="Qty Remaining" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="Remaining_Quantity"  ToolTip="Remaining Quantity" style="color:#FFFFFF"/>
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop" >
                                                <asp:LinkButton ID="ProsSpecHistologyStatusHdr" runat="server" Text="Site" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="SiteName" ToolTip="Site Name" style="color:#FFFFFF"/>
                                             </td>
 
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                             <asp:LinkButton ID="ProsSpecHistologyFreezerHdr" runat="server" Text="Freezer" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="StorageName" ToolTip="Storage Name" style="color:#FFFFFF" />
                                            </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                             <asp:LinkButton ID="LinkButton1" runat="server" Text="Container" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="ContainerName" ToolTip="Container Name" style="color:#FFFFFF" />
                                            </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecHistologyBoxHdr" runat="server" Text="Box" Font-Underline="true" style="color:#FFFFFF"
                                                    OnCommand="SortRecords" CommandName="BoxName" ToolTip="Click to sort descending" />
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecHistologyPositionHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="Position" ToolTip="Position" Text="Position" />
                                             </td>

                                        </tr>
                                    </table>
                                    <div id="ProsSpecHistologyDiv" style="overflow-y: auto; overflow-x:hidden; width:1160px ; border:solid 1px #999999; background-color:#ffffff; padding-bottom: 20px;">
                                        <table id="specimensTable" width="1150px" cellspacing="0" cellpadding="1" border="0" >
                                            <asp:Repeater ID="ProsSpecHistologyRpt" runat="server" OnItemDataBound="ProsSpecHistologyRptItemCreated">
                                               <ItemTemplate>
                                                        <tr id="listRow" class="ListManDataTableRow" align="center" 
                                                             style="vertical-align: middle;cursor: pointer;" onclick="if(isRowClick(event)) { showSpecimenInfo(this,'<%# Eval("SpecimenId") %>','<%#Eval("ParentSpecimenId") %>'); }" onmouseover="this.className='ListManDataTableRowOver';" onmouseout="this.className='ListManDataTableRow';" >
                                                        <td style="width: 20px;" class="AllFieldsTableCell" 
                                                            onclick="if(isCellClick(event)) {checkCheckBoxAndUpdateCount(this, event);}">
                                                            <asp:HiddenField runat="server" ID="RowSpecimenId" Value='<%# Eval("SpecimenId") %>' />
                                                            <asp:HiddenField runat="server" ID="RowBoxId" Value='<%# Eval("BoxId") %>' />
                                                            <asp:HiddenField runat="server" ID="RowParentSpecimenId" 
                                                                Value='<%# Eval("ParentSpecimenId") %>' />
                                                            <input onclick="if(isCheckboxClick(this,event)) { getSpecimenCount(); }" type="checkbox"
                                                                runat="server" id="chkSpId" style="cursor: default;"  />
                                                        </td>
                                                        
                                                        <td style="width:100px;" class="AllFieldsTableCell">&nbsp;<%#Eval("specimenReferenceNumber")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell">&nbsp;<%#Eval("pathHistology")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell">&nbsp;<%# Eval("specimenType")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell">&nbsp;<%# Eval("specimenSubType")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("specimenStatus")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("specimenRemainingQty")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("siteName")%></td> 
                                                        <td style="width:100px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("storageName")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("containerName")%></td>
                                                        <td runat="server" id="boxCell" onclick="if(isBoxSelectClick(this,event)) { selectByBox(this.parentNode); }" style="width: 100px; cursor: pointer;" align="center" class="ListManDataTableCellBordered" onmouseover="this.className='ListManDataTableCellBorderedOn'" onmouseout="this.className='ListManDataTableCellBordered'">
                                                            <a id="selectAllinBoxTitle" runat="server">&nbsp;<%# Eval("boxName")%></a>
                                                        </td>
                                                        <td style="width: 100px;" class="AllFieldsTableCell">&nbsp;<%# Eval("position")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    <tr>
                                                        <td colspan="11" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                        </td>
                                                    </tr>
                                                </SeparatorTemplate>
                                                <FooterTemplate>
                                                    <tr>
                                                        <td colspan="11" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                        </td>
                                                    </tr>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            
                                            <!-- Message - Search Returns Empty -->
							                <tr id="ProsSpecHistologyNoSpecsRow" runat="server" class="ListManDataTableRow" valign="middle" visible="false" style="cursor: default;" > 
										        <td colspan="11" style="height: 325px; text-align: center; font-size: 13px; color: #8d2a2c;">
										            <asp:Label ID="ProsSpecHistologynoRecordsFound" runat="server">No Specimen Records Matched Your Search Criteria.</asp:Label>
										        </td>										        
									        </tr> 
                                        </table>
                                    </div>
                                </asp:Panel>


                                <%--Prostate Specimen by Reference Number panel--%>
                                 <asp:Panel ID="ProsSpecRefNumPanel" Visible="false" runat="server" style="position: relative; width: 920px; overflow-y: hidden; overflow-x: auto;">
                                    <table id="ProsSpecRefNumHdrTbl" width="1160px" border="0" cellpadding="1" cellspacing="0" class="ListManDataTableOuterBorder" runat="server">
                                        <tr>
                                            <td style="width: 20px;" class="AllFieldsTableTop">
                                                <asp:CheckBox title="check/uncheck all specimens" ID="ProsSpecRefNumHdrChkBx" onclick="CheckAll(this);"
                                                    runat="server" name="checkAll" /></td>                                           
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecRefNumRefHdr" runat="server" Text="Reference_No" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="SpecimenReferenceNumber" ToolTip="Reference Number"/>
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecRefNumHistologyHdr" runat="server" Font-Underline="true" style="color:#FFFFFF"
                                                    OnCommand="SortRecords" CommandName="Histology" ToolTip="Histology" Text="Histology"/>
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecRefNumSampleTypeHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="SpecimenType" ToolTip="Sample_Type" Text="Sample_Type" />
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecRefNumSubTypeHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="SpecimenSubType" ToolTip="Specimen Sub Type" Text="SubType" />
                                             </td>
                                              <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecRefNumAgeHdr" runat="server" Text="Age" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="Age"  ToolTip="Age" style="color:#FFFFFF"/>
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop" >
                                                <asp:LinkButton ID="ProsSpecRefNumGleasonScoreHdr" runat="server" Text="Gleason Score" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="PathGGS" ToolTip="Gleason Score" style="color:#FFFFFF"/>
                                             </td>
 
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                             <asp:LinkButton ID="ProsSpecRefNumStageGradeHdr" runat="server" Text="Stage Grade" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="PathGrade" ToolTip="Stage Grade" style="color:#FFFFFF" />
                                            </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                             <asp:LinkButton ID="ProsSpecRefNumStateGroupHdr" runat="server" Text="Stage_Group" Font-Underline="true" 
                                                    OnCommand="SortRecords" CommandName="PathStageGroup" ToolTip="Stage Group" style="color:#FFFFFF" />
                                            </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecRefNumLastPSADateHdr" runat="server" Text="Last PSA Date" Font-Underline="true" style="color:#FFFFFF"
                                                    OnCommand="SortRecords" CommandName="Last_PSA_Date" ToolTip="Last PSA Date" />
                                             </td>
                                             <td style="width: 100px;" class="AllFieldsTableTop">
                                                <asp:LinkButton ID="ProsSpecRefNumLastPSAResultHdr" runat="server" Font-Underline="true" style="color:#FFFFFF" 
                                                    OnCommand="SortRecords" CommandName="PSA_Result" ToolTip="PSA Result" Text="PSA Result" />
                                             </td>

                                        </tr>
                                    </table>
                                    <div id="ProsSpecRefNumDiv" style="overflow-y: auto; overflow-x:hidden; width:1160px ; border:solid 1px #999999; background-color:#ffffff; padding-bottom: 20px;">
                                        <table id="specimensTable" width="1150px" cellspacing="0" cellpadding="1" border="0" >
                                            <asp:Repeater ID="ProsSpecRefNumRpt" runat="server" OnItemDataBound="ProsSpecRefNumRptItemCreated">
                                               <ItemTemplate>
                                                        <tr id="listRow" class="ListManDataTableRow" align="center" 
                                                             style="vertical-align: middle;cursor: pointer;" onclick="if(isRowClick(event)) { showSpecimenInfo(this,'<%# Eval("SpecimenId") %>','<%#Eval("ParentSpecimenId") %>'); }" onmouseover="this.className='ListManDataTableRowOver';" onmouseout="this.className='ListManDataTableRow';" >
                                                        <td style="width: 20px;" class="AllFieldsTableCell" 
                                                            onclick="if(isCellClick(event)) {checkCheckBoxAndUpdateCount(this, event);}">
                                                            <asp:HiddenField runat="server" ID="RowSpecimenId" Value='<%# Eval("SpecimenId") %>' />
                                                            <asp:HiddenField runat="server" ID="RowBoxId" Value='<%# Eval("BoxId") %>' />
                                                            <asp:HiddenField runat="server" ID="RowParentSpecimenId" 
                                                                Value='<%# Eval("ParentSpecimenId") %>' />
                                                            <input onclick="if(isCheckboxClick(this,event)) { getSpecimenCount(); }" type="checkbox"
                                                                runat="server" id="chkSpId" style="cursor: default;"  />
                                                        </td>
                                                        
                                                        <td style="width:100px;" class="AllFieldsTableCell">&nbsp;<%#Eval("specimenReferenceNumber")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell">&nbsp;<%#Eval("pathHistology")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell">&nbsp;<%# Eval("specimenType")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell">&nbsp;<%# Eval("specimenSubType")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("Age")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("pathGGS")%></td> 
                                                        <td style="width:100px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("pathGrade")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("pathStageGroup")%></td>
                                                        <td style="width:100px;" class="AllFieldsTableCell" >&nbsp;<%# Eval("Last_PSA_Date")%></td>
                                                        <td style="width: 100px;" class="AllFieldsTableCell">&nbsp;<%# Eval("PSA_Result")%></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    <tr>
                                                        <td colspan="11" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                        </td>
                                                    </tr>
                                                </SeparatorTemplate>
                                                <FooterTemplate>
                                                    <tr>
                                                        <td colspan="11" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                        </td>
                                                    </tr>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            
                                            <!-- Message - Search Returns Empty -->
							                <tr id="ProsSpecRefNumNoSpecsRow" runat="server" class="ListManDataTableRow" valign="middle" visible="false" style="cursor: default;" > 
										        <td colspan="11" style="height: 325px; text-align: center; font-size: 13px; color: #8d2a2c;">
										            <asp:Label ID="ProsSpecRefNumnoRecordsFound" runat="server">No Specimen Records Matched Your Search Criteria.</asp:Label>
										        </td>										        
									        </tr> 
                                        </table>
                                    </div>
                                </asp:Panel>

                                
                            </td>
                            <td class="ListManBGTableRightSide" style="width: 5px;">&nbsp;</td>
                        </tr>
							        
                        <!-- Rounded Bottom Border -->
                        <tr>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5" /></td>
                            <td colspan="4" class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="5" /></td>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5" /></td>
                        </tr>
                        </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>