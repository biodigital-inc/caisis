<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSchema.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminSchema" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AdminSchema</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">  
    /* <![CDATA[ */
    
    var IsSchemaAdded = <%= HasSchemaBeenAdded.ToString().ToLower() %>;
    var HasSchemaItems = <%= HasSchemaItems.ToString().ToLower() %>;
    
    // Resize functionality
    Browser.ResizeElement( { customResizer: setSchemaFrameHeight } );
    function setSchemaFrameHeight()
    {
        var newHeight = Math.max(getHeight(window) - 15,100);
        $('SchemaPortalContent').style.height = newHeight + 'px';
    }
    
    // Simple tab lookup object to return DOM img
    var Tabs = { currentTab: null }

    function getTab(tab) { return typeof(tab)==typeof('') ? Tabs[tab] : tab; } 
    function setActiveTab(tab)
    {
        tab = getTab(tab);
        if(tab)
        {
            if(Tabs.currentTab) { Tabs.currentTab.src = Tabs.currentTab.offImage; }
            Tabs.currentTab = tab;
            Tabs.currentTab.src = Tabs.currentTab.onImage;
            Tabs.currentTab.adjustLayer();
            
            // verify current tab matches frame title
            if(tab.alt!=window.frames['SchemaPortalContent'].document.title)
            {
                $('SchemaPortalContent').src = Tabs.currentTab.link.href;
            }
        }
    } 
   
    // Initalize helper functions to handle UI events, clicks, resieze
    function initalizeTabs() 
    {
        // A tab is an image in the SchemaTabBar
        $('SchemaTabBar').tag('IMG').foreach(initalizeTab);
        // Set inital tab
        var defaultTab = '<%= QueryTab %>' != '' ? '<%= QueryTab %>' : 'SchemaName';
        setActiveTab(defaultTab);
    }

    // Add helper properties and methods to tab images
    function initalizeTab(tab) 
    { 
        // Provide fast object lookup of tab based on IMG alt
        var lookup = tab.alt;
        Tabs[lookup] = tab;
        // target url is href of parenrt hyperlink
        // 2-way access to <a> and <img>
        var link = tab.parentNode;
        link.tab = tab;
        tab.link = link;
        tab.hash = '#' + lookup;
        // Set on and off image src
        tab.offImage = tab.src;
        tab.onImage = tab.src.replace('.png','_on.png');
        
        // Resize by class name : SmallTabPage = resize small, LargeTabPage = resize large
        tab.adjustLayer = function() 
        {
            if(tab.className=='SmallTabPage') { parent.resizeSchemaPortalSmall(); }
            else { parent.resizeSchemaPortalLarge(); }
            setSchemaFrameHeight();
        };

        // check if schema record exists, otherwise disable timeline
        if(lookup=='SchemaItems' && !IsSchemaAdded)
        {
            tab.message = 'Please enter the Treatment Arm name before continuing.';
        }
        // check if schema items added, otherwise disable timeline
        else if(lookup=='SchemaTimeline' && (!IsSchemaAdded || !HasSchemaItems))
        {
            tab.message = 'Please add schema items before continuing to Timeline.';
        }
        // if an error message set
        if(tab.message)
        {
            tab.src = tab.src.replace('.png','_disabled.png');
        }
        // Event Handler will be attached to parent hyperlink
        $(link).addEvent('click',curry(onTabClick,tab));
    }

    function onTabClick(tab,e) 
    {           
        if(tab.message)
        {
            alert(tab.message);
        }
        else
        {
            if(checkContentPageDirty()) { setActiveTab(tab); }
        }
        if(e) { stopBubble(e); }
    }
    
    // enables a tab without reloading the page
    function setTabEnabled(tab)
    {
        tab = getTab(tab);
        tab.src = tab.src.replace('_disabled.png','.png');
        tab.message = null;
    }
     
    // Determines if patient content page isDirty (i.e. form fields values changed before post-back)
    function checkContentPageDirty()
    {
        // disable check
        return true;
        if(isPageDirty(window.frames['SchemaPortalContent']))
        {
            return confirm('You have made changes to the form, would you like to leave?');
        }
        else
        {
            return true;
        }
    }
    
    // refreshed main protocol version's schema list
    function reloadTreatmentArmsList()
    {    
        // no query string on default load
        if(parent.reloadTreatmentArms){
            parent.reloadTreatmentArms();
        }
    }
    
    function reloadAdminWizard(url)
    {
        window.location = url;
    }

    /* ]]> */
    </script>

</head>
<body class="PatientPortalBody">
    <form id="form1" runat="server">
    <div class="PatientTitleBar">
        <span id="PageTitle" style="font-weight: bold;">Add / Edit Treatment Arm Schema</span>
    </div>
    <div id="SchemaTabBar" class="PatientTabBar">
        <table width="50%" border="0" cellspacing="0" cellpadding="0" style="margin-left: auto;
            margin-right: auto;">
            <tr>
                <td style="text-align: center;">
                    <a href="<%= GetQueryStringWithVersion("AdminTreatmentInfo.aspx") %>" target="SchemaPortalContent">
                        <img id="SchemaNameTab" src="images/EditTreatmentArmTabName.png" alt="SchemaName"
                            height="49" style="border: none;" /></a>
                </td>
                <td style="text-align: center;">
                    <a href="<%=  GetQueryString("AdminTreatmentItems.aspx") %>" target="SchemaPortalContent">
                        <img id="SchemaItemsTab" src="images/EditTreatmentArmTabItems.png" alt="SchemaItems"
                            width="73" height="49" style="border: none;" /></a>
                </td>
                <td style="text-align: center;">
                    <a href="<%=  GetQueryString("AdminTimeline.aspx") %>" target="SchemaPortalContent">
                        <img id="ScheduleTimelineTab" src="images/EditTreatmentArmTabTimeline.png" alt="SchemaTimeline"
                            width="73" height="49" style="border: none;" /></a>
                </td>
            </tr>
        </table>
    </div>
    <iframe id="SchemaPortalContent" name="SchemaPortalContent" scrolling="no" style="width: 100%; height: 600px; overflow: hidden;" frameborder="0" src="<%= GetQueryStringWithVersion("AdminTreatmentInfo.aspx") %>">
    </iframe>

    <script type="text/javascript">
        /* <![CDATA[ */
        initalizeTabs();
        /* ]]> */
    </script>

    </form>
</body>
</html>
