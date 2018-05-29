<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProject.aspx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.EditProject" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<%@ Register TagPrefix="custom" TagName="AdminNav" Src="Controls/ProjectViewAdminNav.ascx" %>
<%@ Register TagPrefix="custom" TagName="OrgNav" Src="Controls/ProjectViewOrgNav.ascx" %>
<%@ Register TagPrefix="custom" TagName="Gant" Src="~/Core/Utilities/GantChartControl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit A Project</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    /* <![CDATA[ */
        
    Browser.ResizeElement( { nodeId: 'ContentPage', heightOffset: 175 } );
        
    // Shows/Hides the timeline
    function showHideTimeline()
    {
        var dock = $('TimeLineDock');
        var timeline = $('TimeLine');
        var timelineTab = $('TimeLineTab');
        var isOpen;
        if(timeline.isHidden()) 
        { 
            showTimeline();
            isOpen = true;
        }
        else 
        { 
            hideTimeline();
            isOpen = false;   
        }
        // Set Tab Text
        timelineTab.title = timelineTab.title.replace(isOpen?'Show':'Hide',isOpen?'Hide':'Show');
        timelineTab.alt = timelineTab.title;
        return false;
    }
    
    // Shows timeline by displaying it and setting dock bottom
    function showTimeline()
    {
        var dock = $('TimeLineDock');
        var timeline = $('TimeLine');
        timeline.show();
        dock.style.bottom = '0px';
        
        // Adjust labels in child frame
        var gantFrame = window.frames['MainGantFrame'];
        gantFrame.adjustLabelsColumn.call(gantFrame);
    }
    
    // Hides timeline by dynamically lower timeline to only show tab
    function hideTimeline()
    {
        var dock = $('TimeLineDock');
        var timeline = $('TimeLine');
        var timelineTab = $('TimeLineTab');
        timeline.hide();
        // Calculate height of dock - height of tab
        dock.style.bottom = '-' + (dock.offsetHeight - timelineTab.offsetHeight) + 'px'; 
    }
       
    // Makes a call to show a child gant in the popup layer
    function loadChildGant(bar,e,tableName,priKey,color)
    {
        getBar(tableName,priKey,color);
    }
    
    // Reloads main gant chart
    function reloadMainGant()
    {
        var gantWin = window.frames['MainGantFrame'];
        gantWin.location = gantWin.location;
    }
    
    // Calls the server to show child gant, else use a cahced copy
    function getBar(tableName,priKey,color)
    {  
        // Set url of iframe
        var params = new Param();
        params.add('projectId','<%= ProjectId %>');
        params.add('tableName',tableName);
        params.add('priKey',priKey);
        params.add('color',color);
        var qs = 'AjaxGantLoader.aspx?' + params.toQueryString();
        $('AjaxGant').src = qs;
        
        // Show popup layer
        var toolTip = $('GantToolTip');
        toolTip.show('');
        toolTip.center('');
    }

    function moveToolTip(e)
    {
       
    }
    
    function closeGantToolTip()
    {
        $('GantToolTip').hide('none');
        $('CoverLayer').hide('none');
        return false;
    }
        
    function goToView(sel)
    {
        var orgId = sel.options[sel.selectedIndex].value;
        var url = 'EditProject.aspx?projectId=<%= ProjectId %>&organizationId=' + orgId;  
        window.location = url;
    }
    
    // Sets the active item selected
    // Ex: setNavLink('Contacts');
    function setNavLink(linkName)
    {
        var link = $(linkName);
        if(link) { setActiveNavLink(link); }
    }
    
    // Sets active link in stages submenu
    function setStagesLink(stage)
    {
        var expr = 'stage.title==stageName';
        var stageToVisit;
        // stage is either name of stage, or id
       if(parseInt(''+stage) != parseInt('x'))
       {
            var id = 'StageLink' + stage;
            stageToVisit = $(id);
       }
       else
       {
            $(document).tag('a.StageLink').foreach(function(stage) { if(eval(expr)) { stageToVisit = stage; } });;
       }
       // Load page into content frame
       if(stageToVisit)
       {
            setActiveNavLink(stageToVisit);
       }
    }
    
    // Reloads page and loads manuscripts into details page
    function refreshList(projectId, organizationId)
    {
        var url = 'EditProject.aspx?projectId=' + projectId + '&organizationId=' + organizationId;
        window.location = url;
    }
    
    // shows/hides print btn 
    function printContentPage()
    {
        var printFrame = window.frames['ContentPage'];
        printFrame.focus(); 
        printFrame.print(); 
    }
    
    function displayPrintButton(show)
    {
        var printBtn = $('printButton');
        if(show) { printBtn.show(''); } else { printBtn.hide(''); }
    }
    
    window.addEvent('load',hideTimeline);
    
    /* ]]> */
    </script>

    <style type="text/css">
    body 
    {
        background-color: #eeeff0;
    }
    a
    {	
		line-height: 20px;
		padding-left: 10px;
		border: 1px solid #eeeff0;
     	margin-bottom: 8px;
        text-decoration: none;
        color: #000000;
        font-size: 12px;
        font-weight: bold;
        display: block;
    }
    td
    {
        border-collapse: collapse;
    }
    #Header td 
    { 
        background-color: #cccccc;
        color: #ffffff;
     }
    #navContainerDiv
    {
        overflow: auto;
        height: 500px;
        width: 100%
    }
    .HeaderBtnCol
    {
        vertical-align: top;
        text-align: right;
    }
     /* Gant Related Styles */
     #TimeLineDock
     {
        width: 98%;
        margin: auto;
        position: absolute; 
        left: 1%; 
        bottom: -252px;
        z-index: 100;
     }
    #TimeLine
    {
        margin: 0px; 
        padding: 0px;
        overflow: auto;
    }
    #MainGantFrame
    {
        width: 100%;
        height: 250px;
    }
    #GantToolTip
    {
        width: 700px;
        border: 3px solid #666666;
        background-color: white;
        position: absolute;
        top: 0px;
        left: 0px;
        z-index: 1000;
    }
    #AjaxGant
    {
        width: 100%;
        height: 270px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="CoverLayer" style="position: absolute; background-color: #000000; display: none;
            width: 100%; height: 100%; z-index: 95;">
        </div>
        <table cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td style="vertical-align: top;" class="ProjMgrHeader">
                    <table cellpadding="0" cellspacing="0" style="table-layout: fixed; width: 100%; border: none;">
                        <tr>
                            <td style="height: 41px; vertical-align: top; padding-left: 31px; padding-right: 20px;
                                background-image: url(Images/ProjMgr_HeaderWidget.gif); background-repeat: no-repeat;
                                background-position: 19px 5px;">
                                <div style="width: 100%; height: 40px; overflow: hidden;">
                                    <asp:Label runat="server" ID="ProjectTitle" CssClass="projectTitle"></asp:Label></div>
                            </td>
                            <td class="HeaderBtnCol" style="width: 155px;">
                                <project:ProjectMgmtButton runat="server" ID="ReturnToMultiOrgLink" ImageUrl="Images/ReturnToMultiOrgView_blue.png"
                                    CssClass="headerLink" ToolTip="Return to Multi-Organization View" ProjectContext="Organization"
                                    Style="width: 142px; height: 24px; border-style: none; margin-right: 10px;" />
                            </td>
                            <td class="HeaderBtnCol" style="width: 105px; padding-right: 30px;">
                                <a href="ProjectsList.aspx" title="Exit Project" class="headerLink">
                                    <img src="Images/Button_ExitProject_onBlue.png" alt="Exit Project" style="width: 73px;
                                        height: 24px; border-style: none;" /></a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <img src="Images/ProjMgr_HeaderCurveRight.gif" style="float: right;" /><img src="Images/ProjMgr_HeaderCurveLeft.gif" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table align="center" cellpadding="0" cellspacing="0" style="width: 95%;">
            <tr>
                <td style="width: 143px; vertical-align: top; padding-top: 10px;">
                    <div id="navContainerDiv">
                        <!-- Consortium Level Menu -->
                        <custom:AdminNav runat="server" ID="AdminNavigation" Visible="true" />
                        <!-- Institution Level Menu -->
                        <custom:OrgNav runat="server" ID="OrganizationNavigation" Visible="true" />
                        <img src="Images/Print.gif" id="printButton" onclick="printContentPage()" style="cursor: pointer;
                            float: right; margin-right: 60px; display: none;" alt="Print" title="Print" />
                    </div>
                </td>
                <td style="padding-top: 6px; padding-left: 4px; vertical-align: top;">
                    <!-- Editing Frame -->
                    <iframe id="ContentPage" name="ContentPage" src="ProjectSummary.aspx?projectId=<%= ProjectId %>&amp;organizationId=<%= OrganizationId %>"
                        class="ContentPage" frameborder="0"></iframe>
                </td>
            </tr>
        </table>
        <!-- Main Gant Chart -->
        <div id="TimeLineDock">
            <img id="TimeLineTab" onclick="showHideTimeline();" src="Images/TimelineTab.gif"
                style="padding: 0px; margin: 0px; border-style: none; cursor: pointer; display: block;"
                alt="ShowGant Chart" title="Show Gant Chart" />
            <div id="TimeLine" style="display: none; border: 1px solid #999999;">
                <iframe runat="server" id="MainGantFrame" name="MainGantFrame" frameborder="0" scrolling="no">
                </iframe>
            </div>
        </div>
        <!-- Popup Gant Chart Layer -->
        <div id="GantToolTip" style="display: none;">
            <img src="../../Images/Calendar/close.gif" alt="Close Chart" title="Close Chart"
                style="position: absolute; top: 3px; right: 3px; cursor: pointer; z-index: 1000;"
                onclick="closeGantToolTip();" />
            <iframe id="AjaxGant" frameborder="0" style="overflow: hidden; z-index: 999;" scrolling="no">
            </iframe>
        </div>
    </form>
</body>
</html>
