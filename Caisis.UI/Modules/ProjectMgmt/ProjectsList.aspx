<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" CodeFile="ProjectsList.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectsList" %>
<%@ Register TagPrefix="ajax" Namespace="Caisis.UI.ClientScript.Ajax" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="~/Core/Help/helpToolTip.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Projects List</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../Modules/ProjectMgmt/ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/Help.js" type="text/javascript"></script>

    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    /* <![CDATA[ */
    
    // Set nodes to resize when page loads and window resizes
    Browser.ResizeElement( { nodeId: 'PDFormDiv', heightOffset: 125} ); 
    Browser.ResizeElement( { nodeId: 'ContentTableHolder', heightOffset: 285} );    
    
    var DEFAULT_SEARCH_TEXT = '<%= ProjectSearchField.Value %>';
    var SEARCH_THROTTLE = 1; // in ms
    var lock = new Lock();
    var delayedSearch;
    
    // Makes a call to the server based on query type
    function doProjectListSearch(val) 
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
                var delayedSearchFunc = curry(doSearchCallback,sType,val);
                delayedSearch = setTimeout(delayedSearchFunc,SEARCH_THROTTLE);
            }
            else
            {
                $('ProjectsTable').show();
                $('FilteredListHolder').hide();
                $('RecordCount').innerHTML = $('ProjectsTable').rows.length + ' Projects';
            }
        }
        return false; 
    }
    
    // initiate a project search call back to the server
    function doSearchCallback(type,val)
    {
        lock.lock();
        var p = new Param();
        p.add('SearchType',type);
        p.add('SearchValue',val);
        doCaisisCallback(p);
    }
    
    // Gets called when call returns from server
    function onCaisisCallback(val, valObj)
    {
        lock.unlock();
        // dom will contain table inside DIV
        var dom = valObj.dom;

        var originalTable = $('ProjectsTable');
        originalTable.hide();
        
        var filteredList = $('FilteredListHolder');
        filteredList.show();
        filteredList.innerHTML = '';

        var filterdTable = dom.getElementsByTagName('TABLE').length > 0 ? dom.getElementsByTagName('TABLE')[0] : dom;
        filteredList.appendChild(filterdTable);
        addHoverToGrid(filterdTable);
        
        var recordCounter = $('RecordCount');
        recordCounter.innerHTML = filterdTable.rows.length + ' Projects';
        return;          
        
    }
    
    function handleSearchKeyPress(field,e)
    {
        if(field.value!='') {  $('SearchIcon').show(); $('ClearIcon').hide(); } 
        return e.keyCode==13 ? doProjectListSearch(field.value) : true;
    }
    
    function handleClearClick()
    {
        // Swap icons
        $('ClearIcon').hide();
        $('SearchIcon').show();
        
        // Clear search, and initiate empty search (i.e. clear list)
        $('ProjectSearchField').value = '';
        doProjectListSearch('');

        return false;
    }
    
    // clear out value when foucsed
    function handleSearchFocus(tb) 
    {
        if(tb.value==DEFAULT_SEARCH_TEXT) { tb.value = ''; tb.className = 'ActiveSearchField'; } 
    }
    
    // Sets default text when blurring (if empty text present)
    function handleSearchBlur(tb) 
    { 
        if(tb.value=='') 
        { 
            tb.value = DEFAULT_SEARCH_TEXT;
            doProjectListSearch('');
            tb.className = 'DefaultSearchField';
            $('SearchIcon').show();
            $('ClearIcon').hide(); 
        }
    }
    
    // Navigate to a Project's Summary Page
    function goToProject(id){ window.location.href = 'EditProject.aspx?projectId=' + id; }

    // Adds hover styles to grid when page loads
    addHoverToGrid('ProjectsTable');
    
    /* ]]> */
    </script>

    <style type="text/css">
    
    .HeaderTable
    {
        margin: auto;
        table-layout: fixed;
        width: 100%;
        border: 1px solid #cccccc;
    }
    .HeaderTable td
    {
        background-color: #336699;
    }
    .HeaderTable span
    {
        font-weight: bold;
        font-size: 13px;
        margin: 7px;
        display: block;
        color: #ffffff;
        text-align: left;
    }
    #ContentTableHolder
    {
        margin: auto;
        overflow: auto;
		overflow-x: hidden;
		width: 99%;
		border-left: solid 3px #dddddd;
		border-right: solid 3px #dddddd;
		border-bottom: solid 2px #dddddd;
        background-color: #ffffff;
    }
    .ProjectTable
    {
        margin: auto;
        table-layout: fixed;
        width: 98%;
        cursor: pointer;
        background-color: #ffffff;
		border-right: solid 1px #cccccc;
		border-left: solid 1px #cccccc;

    }
	.ProjectTable td
	{
		border-bottom: solid 1px #cccccc;
	}
    .dataGridItemHover
    {
            background-color: #EEDFE0;
            height: 25px;
            background-image: url(../../Images/rowMouseoverBG.gif);
            background-position: right bottom;
            background-repeat: no-repeat;
    }
     .dataGridItemHover td
     {
            color: #000000;
            border-bottom: solid 1px #bebebe;
     }
     /* Overwrite .css based values */
     #PDFormDiv
     {
        margin: 20px auto auto auto; 
        width: 95%; 
        height: 600px; 
        background-color: #eeeff0; 
        border: none;
     }
     #HeaderSection
     {
        width: 90%; 
        margin: auto; 
        height: 40px;
     }
	 #ProjectsTable tr
	 {
	    text-align: left;
	 }
	 .SectionTitle
	 {
	    font-size: 14px;
	 }
	 .HeaderItem
	 {
	    font-weight: bold;
	 }
	 .AdminProjectBtn
	 {
	    float: right; 
	    display: block; 
	    border-style: none;
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
	 #ProjectSearchLayer
	 {
	    padding: 4px; 
	    border: 1px solid #cccccc;
        background-color: #ffffff; 
        width: 200px;
	 }
	 #ProjectSearchLayer input
	 {
	    float: left; 
	    display: block;
	    border-style: none; 
	    border: 0px; 
	    width: 175px;
	 }
	 #ProjectSearchLayer img
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
	    display: block;
	    width: 125px;
	    margin: auto;
	    text-align: center;
	    color: #004256;
        font-size: 11px;
        font-weight: bold;
        margin-top: 4px;
    }
	
	.dataGridItemRowA:hover
	{
		background-color: #ffffff;
		height: 25px;
	}
	
	.BoldItalics
	{
	    font-weight: bold;
	    font-style: italic;
	}
	
    </style>
</head>
<body style="padding: 0px;">
    <form id="form1" runat="server">
        <ajax:CaisisAjaxHelper ID="CaisisAjaxHelper1" runat="server" OnProcessCallback="DoProjectSearch"></ajax:CaisisAjaxHelper>
        <div class="MenuContainter" style="height: 12px; width: 100%; display: block; border: none;
            margin: 0px;">
        </div>
        <!-- Main Content Holder -->
        <div id="PDFormDiv">
            <!-- Tool Tip Layer -->
            <uc1:helpToolTip ID="HelpToolTipLayer" runat="server" />
            <!-- Header Section -->
            <div id="HeaderSection">
                <div style="padding: auto auto auto 10px; float: left;" class="SectionTitle" title="Please select the project you would like to manage.">
                    Please select the project you would like to manage.</div>
                <project:ProjectMgmtButton runat="server" CssClass="AdminProjectBtn" ID="AdminCreateProjectBtn"
                    ImageUrl="Images/Button_CreateNewProject.gif" ToolTip="Create New Project" PostBackUrl="Admin/AdminCreateProject.aspx" />
                <project:ProjectMgmtButton runat="server" CssClass="AdminProjectBtn" ID="AdminOptionsBtn"
                    ImageUrl="Images/Button_Options.gif" ToolTip="Options" PostBackUrl="ProjectManagerSplash.aspx"
                    Style="margin-right: 15px; margin-left: 15px;" />
                <div id="ProjectSearchLayer" style="float: right;">
                    <input runat="server" id="ProjectSearchField" type="text" title="Search By Title or Notes"
                        onfocus="handleSearchFocus(this);" onblur="handleSearchBlur(this);" class="DefaultSearchField"
                        onkeypress="return handleSearchKeyPress(this,event);" value="Search By Title or Notes" />
                    <img id="SearchIcon" src="Images/search_icon.gif" alt="Search Project List" title="Search Project List"
                        onclick="return doProjectListSearch($('ProjectSearchField').value);" />
                    <img id="ClearIcon" src="Images/search_clear_icon.gif" alt="Clear Search" title="Clear Search"
                        onclick="return handleClearClick();" style="display: none;" />
                    <input id="SearchType" type="hidden" value="Title" />
                    <!-- Clear search field -->

                    <script type="text/javascript">
                        $('ProjectSearchField').value = DEFAULT_SEARCH_TEXT;
                    </script>

                </div>
            </div>
            <!-- Project Listings Header -->
            <table cellpadding="0" cellspacing="0" border="0" width="90%" style="margin: auto;">
                <tr class="BlueListBar">
                    <td class="BlueListBar" style="width: 5%;">
                        <img src="Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;"
                            alt="Project List" /></td>
                    <td class="BlueListBar" style="width: 10%;">
                        <span class="HeaderItem" title="Protocol #"><a href="?sortName=Description">Protocol #</a></span></td>
                    <td class="BlueListBar" style="width: 35%;">
                        <span class="HeaderItem" title="Project Title"><a href="?sortName=Title">Project Name</a>
                        </span>
                    </td>
                    <td class="BlueListBar" style="width: 15%;">
                        <span class="HeaderItem" title="Short Name"><a href="?sortName=ShortName">Short Name</a>
                        </span>
                    </td>
                    <td class="BlueListBar" style="width: 10%;">
                        <span class="HeaderItem" title="Project Status"><a href="?sortName=Status">Status</a></span></td>
                    <td class="BlueListBar" style="width: 10%;">
                        <span class="HeaderItem" title="Project Priority"><a href="?sortName=Priority">Priority</a></span></td>
                    <td class="BlueListBar" style="width: 10%;">
                        <span class="HeaderItem" title="Project Notes">Notes</span></td>
                    <td class="BlueListBar" style="width: 5%; text-align: right;">
                        <img src="Images/HeaderBarBlueRight.gif" width="6" height="35" alt="Project List" /></td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <div runat="server" id="ContentTableHolder">
                            <!-- Table Containing Projects, ability to overflow -->
                            <table id="ProjectsTable" class="ProjectTable" cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <asp:Repeater runat="server" ID="ProjectsListRptr" OnItemDataBound="HilightFoundText">
                                        <ItemTemplate>
                                            <tr id="<%# Eval("ProjectId") %>" class="dataGridItemRowA" onclick="goToProject('<%# Eval("ProjectId") %>');"
                                                onmouseover="showToolTipMessage('<%# Caisis.UI.Core.Classes.PageUtil.EscapeSingleQuotes(Eval("Description").ToString()) %>');"
                                                onmouseout="hideToolTip();">
                                                <td style="width: 5%; background-position: left bottom;">&nbsp;                                                </td>
                                                <td style="width: 10%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <asp:Label runat="server" ID="DescriptionField" Style="display: block;" Text='<%# Eval("Description") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="DescriptionPre"></asp:Label><asp:Label runat="server"
                                                        ID="DescriptionMatch" CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="DescriptionPost"></asp:Label>                                                </td>
                                                <td style="width: 35%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <asp:Label runat="server" ID="TitleField" Style="display: block;" Text='<%# Eval("Title") %>'>                                                    </asp:Label>
                                                    <asp:Label runat="server" ID="TitlePre"></asp:Label><asp:Label runat="server"
                                                        ID="TitleMatch" CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="TitlePost"></asp:Label>                                             </td>
                                                <td style="width: 15%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;
                                                    background-position: center bottom;" class="BoldItalics">
                                                    <asp:Label runat="server" ID="ShortNameField" Style="display: block;" Text='<%# Eval("ShortName") %>'>                                                    </asp:Label>
                                                    <asp:Label runat="server" ID="ShortNamePre"></asp:Label><asp:Label runat="server" ID="ShortNameMatch"
                                                        CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="ShortNamePost"></asp:Label>
                                                </td>
                                                <td style="width: 10%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <span><%# Eval("Status") %>&nbsp;</span>                                                </td>
                                                <td style="width: 10%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <span><%# Eval("Priority") %>&nbsp;</span></td>
                                                <td style="width: 10%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <asp:Label runat="server" ID="NotesField" Style="display: block;" Text='<%# Eval("Notes") %>'>                                                    </asp:Label><asp:Label runat="server" ID="NotesPre"></asp:Label><asp:Label runat="server"
                                                        ID="NotesMatch" CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="NotesPost"></asp:Label>                                                </td>
                                                <td style="width: 5%;">&nbsp;                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr id="<%# Eval("ProjectId") %>" class="dataGridItemRowB" onclick="goToProject('<%# Eval("ProjectId") %>');"
                                                onmouseover="showToolTipMessage('<%# Caisis.UI.Core.Classes.PageUtil.EscapeSingleQuotes(Eval("Description").ToString()) %>');"
                                                onmouseout="hideToolTip();">
                                                <td style="width: 5%; background-position: left bottom;">&nbsp;                                                </td>
                                                <td style="width: 10%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <span><%# Eval("Description")%></span></td>
                                                <td style="width: 35%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <asp:Label runat="server" ID="TitleField" Style="display: block;" Text='<%# Eval("Title") %>'>                                                    </asp:Label><asp:Label runat="server" ID="TitlePre"></asp:Label><asp:Label runat="server"
                                                        ID="TitleMatch" CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="TitlePost"></asp:Label>                                                </td>
                                                <td style="width: 15%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;
                                                    background-position: center bottom;" class="BoldItalics">
                                                    <asp:Label runat="server" ID="ShortNameField" Style="display: block;" Text='<%# Eval("ShortName") %>'>                                                    </asp:Label>
                                                    <asp:Label runat="server" ID="ShortNamePre"></asp:Label><asp:Label runat="server" ID="ShortNameMatch"
                                                        CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="ShortNamePost"></asp:Label>
                                                </td>                                                                                                                                                    
                                                <td style="width: 10%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <span><%# Eval("Status") %></span>&nbsp;</td>
                                                <td style="width: 10%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <span><%# Eval("Priority") %></span>&nbsp;</td>
                                                <td style="width: 10%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; background-position: center bottom;">
                                                    <asp:Label runat="server" ID="NotesField" Style="display: block;" Text='<%# Eval("Notes") %>'>                                                    </asp:Label><asp:Label runat="server" ID="NotesPre"></asp:Label><asp:Label runat="server"
                                                        ID="NotesMatch" CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="NotesPost"></asp:Label>                                                </td>
                                                <td style="width: 5%;">&nbsp;                                                </td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                            <!-- Container for dynamically inserted filterd results table -->
                            <div id="FilteredListHolder">
                            </div>
                        </div>
                        <h3 id="RecordCount">
                            <%= recordCount %>
                            Projects </h3>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
