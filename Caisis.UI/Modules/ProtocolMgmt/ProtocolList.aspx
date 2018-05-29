<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolList.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolList" %>
<%@ Register TagPrefix="ajax" Namespace="Caisis.UI.ClientScript.Ajax" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="~/Core/Help/helpToolTip.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocols List</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/Help.js" type="text/javascript"></script>

    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    /* <![CDATA[ */
    
    // Set nodes to resize when page loads and window resizes
    Browser.ResizeElement( { nodeId: 'PDFormDiv', heightOffset: 85} ); 
    Browser.ResizeElement( { nodeId: 'ContentTableHolder', heightOffset: 265} );    
    Browser.ResizeElement( { nodeId: 'FilteredListHolder', heightOffset: 265} ); 
    
    var PROTOCOL_COUNT = <%= PROTOCOL_COUNT %>
    var TABLE_NAME = 'ProtocolsTable';
    var DEFAULT_SEARCH_TEXT = '<%= listSearchField.Value %>';
    var SEARCH_THROTTLE = 1; // in ms
    var lock = new Lock();
    var delayedSearch;
	var activeProtocolListPage;
	var activePageIndex;
	var LAST_PAGE_INDEX = <%= LAST_PAGE_INDEX %>;
	var activeType = 'ProtocolNum';
	var activeSortCol = 'ProtocolNum ASC';
	
	function handleRowClick(grid,node,evt) 
    {
        var protocolId = '-1';
        var protocolIdStart = node.id.search('_tr_');

        if (protocolIdStart != -1)
        {
            protocolId = node.id.substring(protocolIdStart + 4);
            window.location = "ProtocolIndex.aspx?prid=" + protocolId;
        }
        else
            return;
    }

    // return a list of protocols in range, by index
    // i.e., index=0,and PROTOCOL_LIST_PAGE_SIZE=25,start=0,end=24,return upto first 25 records
    function doSearchByPage(index) {
        var start = index * <%= PROTOCOL_LIST_PAGE_SIZE %>;
        var end = ((index+1) * <%= PROTOCOL_LIST_PAGE_SIZE %>) - 1;
        doSearchCallback(activeType, '', 'Sort', activeSortCol, start, end);
        setActivePage(index);
        return false;
    }
    
    // sets the active page selection
    function setActivePage(i)
    {
        if(PROTOCOL_COUNT != 0)
        {
            var pager = $('ProtocolPager');
            var page = pager.getElementsByTagName('A')[i];
            clearActivePage();
            activeProtocolListPage = page;
            activeProtocolListPage.className = 'active';
            activePageIndex = i;
            pager.style.visibility = 'visible';
        }
    }
    
    // clears the active page selection
    function clearActivePage()
    {
        if(activeProtocolListPage) 
        { 
            activeProtocolListPage.className = ''; 
            activeProtocolListPage = null; 
            activePageIndex = null;
            var pager = $('ProtocolPager');
            pager.style.visibility = 'hidden';
        }
    }
   
    // initiate a protocol search call back to the server
    function doSearchCallback(type, val, callbackType, callbackSortCol, startIndex, endIndex)
    {
        lock.lock();
        activeSortCol = callbackSortCol;
        activeType = type;
        
        var p = new Param();
        p.add('SearchType',type);
        p.add('SearchValue',val);
        p.add('CallbackType',callbackType);
        p.add('CallbackSortCol', callbackSortCol);
        // paging
        if (startIndex != null && endIndex != null) {
            p.add('CallbackStartIndex', startIndex.toString());
            p.add('CallbackEndIndex', endIndex.toString());
        }
        // otherwise, reset page number
        else
        {
            // when sorting all records, set first or last as active depending on direction or sort column
            if(callbackType=='Sort' && val=='')
            {
                var isASC = callbackSortCol.indexOf(' ASC') > -1;
                setActivePage(isASC ? 0: LAST_PAGE_INDEX);
            }
            // otherwise, searching, no page should be selected
            else
            {
                clearActivePage();
            }
        }
        doCaisisCallback(p);
    }
    
    // Gets called when call returns from server
    function onCaisisCallback(val,valObj)
    {
        lock.unlock();
        // dom will contain table inside DIV
        var dom = valObj.dom;

        var originalTable = $('MainTableHolder');
        originalTable.hide();
        
        var filteredTable = $('SecondaryTableHolder');
        filteredTable.show();
        
        var filteredList = $('FilteredListHolder');
        filteredList.clear();

        // table should be inside main dom DIV
        var filterdTable = dom.getElementsByTagName('TABLE').length>0 ? dom.getElementsByTagName('TABLE')[0] : dom;
        filterdTable.id = 'FilteredProtocolsTable'
        filteredList.appendChild(filterdTable);
        addHoverToGrid('FilteredProtocolsTable');
        
        // set title
        var recordCount = filterdTable.rows.length;
        var recordCounter = $('RecordCount');
        var recordCounterTitle = '';
        // paged title
        if(activePageIndex!= null)
        {
            recordCounterTitle = 'Showing ' + recordCount + ' of <%= PROTOCOL_COUNT %> Protocols';
        }
        // search results title
        else
        {
            recordCounterTitle = recordCount + ' protocols meet the search criteria';
        }   
        recordCounter.innerHTML = recordCounterTitle;
        return;          
        
    }
    
    function refreshPage()
    {
        window.location.href = window.location.href;
    }

    function addNewProtocol()
    {
        window.location = 'AdminProtocol.aspx';
        return false;
//        var url = '<%= GetQueryString(Page.ResolveUrl("AddEditProtocols.aspx")) %>';
//        return showEditDetailsInModal( url,'Add Edit Protocols',900,700);
    }

    // Adds hover styles to grid when page loads
    addHoverToGrid('ProtocolsTable');
    
    window.addEvent('load',function() { setActivePage(0); });
    
    /* ]]> */
    </script>

    <style type="text/css">
        #FilteredListHolder
        {
            margin: auto;
            overflow: auto;
            width: 99%;
            border-left: solid 3px #dddddd;
            border-right: solid 3px #dddddd;
            border-bottom: solid 2px #dddddd;
            background-color: #ffffff;
        }
        #ContentTableHolder
        {
            margin: auto;
            overflow: auto;
            width: 99%;
            border-left: solid 3px #dddddd;
            border-right: solid 3px #dddddd;
            border-bottom: solid 2px #dddddd;
            background-color: #ffffff;
        }
        .ProtocolTable
        {
            margin: auto;
            table-layout: fixed;
            width: 98%;
            cursor: pointer;
            background-color: #ffffff;
        }
        /* Overwrite .css based values */#PDFormDiv
        {
            margin: 20px auto auto auto;
            width: 95%;
            height: 600px;
            background-color: inherit;
            border: none;
        }
        #HeaderSection
        {
            width: 90%;
            margin: auto auto auto auto;
            padding-bottom: 10px;
        }        
        #ProtocolsTable
        {
            border-left: solid 1px #cccccc;
            border-right:  solid 1px #cccccc;
        }
        #ProtocolsTable tr
        {
            text-align: left;
        }
        #ProtocolsTable td
        {
            border-bottom: solid 1px #cccccc;
        }
         
        .SectionTitle
        {
            font-size: 14px;
        }
        .HeaderItem
        {
            font-weight: bold;
        }
        .SelectedOption
        {
            background-color: #333333;
            font-weight: bold;
            color: #ffffff;
        }
        .DefaultSearchField
        {
            font-style: italic;
            font-weight: normal;
            color: #333333;
        }
        .ActiveSeachField
        {
            font-style: normal;
            color: #000000;
        }
        #ProtocolSearchLayer
        {
            padding: 4px;
            border: 1px solid #cccccc;
            background-color: #ffffff;
            width: 200px;
        }
        #ProtocolSearchLayer input
        {
            float: left;
            display: block;
            border-style: none;
            border: 0px;
            width: 175px;
        }
        #ProtocolSearchLayer img
        {
            float: right;
            display: block;
            margin-right: 4px;
            cursor: pointer;
        }
        .FoundText
        {
            font-style: italic;
            font-weight: bold;
            background-color: #336699;
            color: #ffffff;
        }
        #RecordCount
        {
            margin: auto;
            text-align: center;
            color: #004256;
            font-size: 12px;
            font-weight: bold;
            margin-top: 4px;
        }
        .BlueListBarTable
        {
            table-layout: fixed;
            width: 100%;
            color: #ffffff;
        }
        .BlueListBar
        {
            background-image: url(Images/HeaderBarBlueBG.gif);
            background-repeat: repeat-x;
            height: 35px;
            font-weight: bold;
            color: #ffffff;
        }
        .BlueListBar img
        {
            margin: 0px;
            width: 6px;
            height: 35px;
        }
        .BlueListBar a
        {
            color: #ffffff;
            text-decoration: none;
        }
        .BlueListBar a:hover
        {
            text-decoration: underline;
        }
        .dataGridItemHover
        {
            height: 25px;

        	background-color: #EEDFE0;
        }
        .dataGridItemHover td
        {
            color: #000000;
            
            border-bottom: solid 1px #bebebe;
            
            *filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */

            background-image: -webkit-gradient(
	            linear,
	            left top,
	            left bottom,
	            color-stop(0, #D0C9D1),
	            color-stop(0.47, #DBA5B2),
	            color-stop(1, #EED2D9)
            );
            background-image: -moz-linear-gradient(
	            center top,
	            #D0C9D1 0%,
	            #DBA5B2 47%,
	            #EED2D9 100%
            );
        }
        .datGridItemClick
        {
            cursor: pointer;
            background-color: #8d2a2c;
            height: 25px;
        }
        .datGridItemClick td
        {
            color: #ffffff;
        }
    </style>
</head>
<body style="padding: 0px;">
    <form id="form1" runat="server">
        <ajax:CaisisAjaxHelper runat="server" OnProcessCallback="DoProtocolSearch"></ajax:CaisisAjaxHelper>
        <!-- Main Content Holder -->
        <div id="PDFormDiv" style="background-color: #ffffff;">
            <!-- Tool Tip Layer -->
            <uc1:helpToolTip ID="HelpToolTipLayer" runat="server" />
            <!-- Header Section -->
            <div id="HeaderSection">
                <div style="padding: auto auto auto 10px; float: left;" class="SectionTitle">
                    Please select the protocol you would like to manage.</div>
                

                <div id="ProtocolSearchLayer" style="float: right;">
                
                
                
                
                
                    <input runat="server" id="listSearchField" type="text" title="Search By Protocol Name or Number"
                        onfocus="handleSearchFocus(this);" onblur="handleSearchBlur(this,TABLE_NAME);" class="DefaultSearchField"
                        onkeypress="return handleSearchKeyPress(this,event,TABLE_NAME);" value="Search By Protocol Name or Number" />
                    <img id="SearchIcon" src="Images/search_icon.gif" alt="Search Protocol List" title="Search Protocol List"
                        onclick="return doProtocolListSearch($('listSearchField').value, TABLE_NAME);" />
                    <img id="ClearIcon" src="Images/search_clear_icon.gif" alt="Clear Search" title="Clear Search"
                        onclick="return handleClearClick(TABLE_NAME);" style="display: none;" />
                    <input id="SearchType" type="hidden" value="Title" />
                    <!-- Clear search field -->

                    <script type="text/javascript">
                        $('listSearchField').value = DEFAULT_SEARCH_TEXT;
                    </script>

                </div>
                <div runat="server" id="AdminPanel" visible="false" style="margin: auto 20px auto auto; float: right;">
                    <asp:CheckBox ID="ShowAllProtocolCheck" runat="server" Text="Show All Protocols"
                        ToolTip="Available to Admins only" CssClass="dataEntryButtonGray" Checked="false"
                        OnCheckedChanged="InitPage" AutoPostBack="true" />
                    <asp:ImageButton ID="ImageButtonAddNewProtocol" ImageUrl="Images/Button_AddNewProtocol.png" runat="server" AlternateText="Add New Protocol"
                        OnClientClick="return addNewProtocol();" ToolTip="Add New Protocol" />
                </div>
            </div>
            <div id="ProtocolPager" class="pager" style="width: 90%;">
                <span class="boldText">Pages </span>
                <%-- Pagin Indexed at 0, but UI starts at 1 --%>
                <asp:Repeater runat="server" ID="ProtocolPageRptr">
                    <ItemTemplate>
                        <a href="#" onclick="return doSearchByPage(<%# Container.DataItem %>);"
                            title="<%# ((int)Container.DataItem  * PROTOCOL_LIST_PAGE_SIZE) + 1 %> to <%# ((int)Container.DataItem + 1) * PROTOCOL_LIST_PAGE_SIZE %>">
                            <%# ((int)Container.DataItem + 1).ToString() %></a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <!-- Protocol Listings Header -->
            <div id="MainTableHolder" style="margin-top: 10px; clear: left;">
            <table cellpadding="0" cellspacing="0" border="0" style="width: 90%; margin: auto;">
                <tr class="BlueListBar">
                    <td class="BlueListBar" style="width: 5%;">
                        <img src="Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;"
                            alt="Protocol List" /></td>
                    <td class="BlueListBar" style="width: 20%;">
                        <asp:LinkButton CssClass="HeaderItem" ID="LinkButtonNumber" runat="server" Text="Number" OnClientClick="return doMainListSort($('listSearchField').value, 'ProtocolNum');" 
                            ToolTip="Protocol Number" /></td>
                    <td class="BlueListBar" style="width: 55%;">
                        <asp:LinkButton CssClass="HeaderItem" ID="LinkButtonName" runat="server" Text="Protocol Name" OnClientClick="return doMainListSort($('listSearchField').value, 'ProtocolTitle');"  
                            ToolTip="Protocol Title" /></td>
                    <td class="BlueListBar" style="width: 15%;">
                        <asp:LinkButton CssClass="HeaderItem" ID="LinkButtonSchemas" runat="server" Text="Schemas" OnClientClick="return doMainListSort($('listSearchField').value, 'SchemaCount');" 
                            ToolTip="Schemas" /></td>
                    <td class="BlueListBar" style="width: 5%; text-align: right;">
                        <img src="Images/HeaderBarBlueRight.gif" width="6" height="35" alt="Protocol List" /></td>
                </tr>
                <tr>
                    <td colspan="5" align="center">
                        <div runat="server" id="ContentTableHolder">
                            <!-- Table Containing Protocols, ability to overflow -->
                            <table id="ProtocolsTable" class="ProtocolTable" cellpadding="0" cellspacing="0" border="0">

                                    <asp:Repeater runat="server" ID="ProtocolsListRptr" OnItemDataBound="HilightFoundText">
                                        <ItemTemplate>
                                            <tr id="_tr_<%# Eval("ProtocolId") %>" class="dataGridItemRowA" >
                                                <td style="width: 5%; background-position: left bottom;">&nbsp;
                                                    <input type="hidden" id="_tr_<%# Eval("ProtocolId") %>_scCount" value="<%# Eval("SchemaCount")%>" />
                                                </td>
                                                <td style="width: 20%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <span>
                                                        <asp:Label runat="server" ID="ProtocolNumField" Style="display: block;" Text='<%# Eval("ProtocolNum") %>'>
                                                        </asp:Label><asp:Label runat="server" ID="ProtocolNumPre"></asp:Label><asp:Label runat="server"
                                                            ID="ProtocolNumMatch" CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="ProtocolNumPost"></asp:Label>
                                                    </span>
                                                </td>
                                                <td style="width: 55%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <asp:Label runat="server" ID="ProtocolTitleField" Style="display: block;" Text='<%# Eval("ProtocolTitle") %>'>
                                                    </asp:Label><asp:Label runat="server" ID="ProtocolTitlePre"></asp:Label><asp:Label runat="server"
                                                        ID="ProtocolTitleMatch" CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="ProtocolTitlePost"></asp:Label>
                                                </td>
                                                <td style="width: 15%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <span>
                                                        <%# Eval("SchemaCount")%>
                                                    </span>
                                                </td>
                                                <td style="width: 5%;">&nbsp;
                                                    
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr id="_tr_<%# Eval("ProtocolId") %>" class="dataGridItemRowB" >
                                                <td style="width: 5%; background-position: left bottom;">&nbsp;
                                                    <input type="hidden" id="_tr_<%# Eval("ProtocolId") %>_scCount" value="<%# Eval("SchemaCount")%>" />
                                                </td>
                                                <td style="width: 20%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <span>
                                                        <asp:Label runat="server" ID="ProtocolNumField" Style="display: block;" Text='<%# Eval("ProtocolNum") %>'>
                                                        </asp:Label><asp:Label runat="server" ID="ProtocolNumPre"></asp:Label><asp:Label
                                                            runat="server" ID="ProtocolNumMatch" CssClass="FoundText"></asp:Label><asp:Label
                                                                runat="server" ID="ProtocolNumPost"></asp:Label>
                                                    </span>
                                                </td>
                                                <td style="width: 55%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <asp:Label runat="server" ID="ProtocolTitleField" Style="display: block;" Text='<%# Eval("ProtocolTitle") %>'>
                                                    </asp:Label><asp:Label runat="server" ID="ProtocolTitlePre"></asp:Label><asp:Label runat="server"
                                                        ID="ProtocolTitleMatch" CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="ProtocolTitlePost"></asp:Label>
                                                </td>
                                                <td style="width: 15%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <span>
                                                        <%# Eval("SchemaCount")%>
                                                    </span>
                                                </td>
                                                <td style="width: 5%;">&nbsp;
                                                    
                                                </td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                    </asp:Repeater>

                            </table>
                        </div>
                        <input runat="server" id="HiddenSortOrder" type="hidden" value="ASC" />
                        <input runat="server" id="HiddenSortColumn" type="hidden" value="ProtocolNum" />
                    </td>
                </tr>
            </table>
            </div>
            <!-- Container for dynamically inserted filterd results table -->
            <div id="SecondaryTableHolder" style="display:none; margin-top: 10px; clear: left;">
                <table cellpadding="0" cellspacing="0" border="0" width="90%" style="margin: auto;">
                    <tr class="BlueListBar">
                        <td class="BlueListBar" style="width: 5%;">
                            <img src="Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;"
                                alt="Protocol List" /></td>
                        <td class="BlueListBar" style="width: 20%;">
                            <asp:LinkButton CssClass="HeaderItem" ID="LinkButton1" runat="server" Text="Number" OnClientClick="return doMainListSort($('listSearchField').value, 'ProtocolNum');"
                                ToolTip="Protocol Number" />
                        <td class="BlueListBar" style="width: 55%;">
                            <asp:LinkButton CssClass="HeaderItem" ID="LinkButton2" runat="server" Text="Protocol Name" OnClientClick="return doMainListSort($('listSearchField').value, 'ProtocolTitle');"
                                ToolTip="Protocol Title" />
                        <td class="BlueListBar" style="width: 15%;">
                            <asp:LinkButton CssClass="HeaderItem" ID="LinkButton3" runat="server" Text="Schemas" OnClientClick="return doMainListSort($('listSearchField').value, 'SchemaCount');"
                                ToolTip="Schemas" />
                        <td class="BlueListBar" style="width: 5%; text-align: right;">
                            <img src="Images/HeaderBarBlueRight.gif" width="6" height="35" alt="Protocol List" /></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <div id="FilteredListHolder" style="overflow: auto; height:70%;">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="text-align: center; margin-top: 6px; font-size: 12px;"><span id="RecordCount">Showing <%= recordCount %> of <%= PROTOCOL_COUNT %> Protocols</span></div>
        </div>
    </form>
</body>
</html>
