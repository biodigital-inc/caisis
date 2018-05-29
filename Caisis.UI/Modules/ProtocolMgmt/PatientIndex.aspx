<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientIndex.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientIndex" %>

<%@ Register TagPrefix="pat" TagName="PatientHeader" Src="ProtocolPatientTitleBar.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Index</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
    /* <![CDATA[ */
   
    // ensure right and left header tabs are large to match tab heights
    if(parent.setPortalHeaderLarge) { parent.setPortalHeaderLarge(); }
   
    // controls if visit related tabs are disabled, i.e., when not in context of schema
    var DISABLE_VISIT_TABS = <%= PatientTreatmentStarted.ToString().ToLower() %>;

    // Resize functionality
    function onWindowResize()
    {
         var newHeight = getHeight(window) - 75;
         $('PatientPortalContent').style.height = newHeight + 'px';
    }
    
    // Simple tab lookup object to return DOM img
    var Tabs = { currentTab: null }

    // returns tab based on lookup key or DOM object
    function getTab(tab) { return typeof(tab)==typeof('') ? Tabs[tab] : tab; } 
    
    // Sets the "Active" tab in the Portal Header
    // @tab = lookup key (i.e., 'PatientEligibility') or tab's DOM IMG node
    // @supressLoad = supress loading tab url
    function setActiveTab(tab,supressLoad)
    {
        tab = getTab(tab);
        if(tab)
        {
            if(Tabs.currentTab) { Tabs.currentTab.src = Tabs.currentTab.offImage; }
            Tabs.currentTab = tab;
            Tabs.currentTab.src = Tabs.currentTab.onImage;
            Tabs.currentTab.adjustLayer();
            // verify current tab matches frame title
            if(tab.alt!=window.frames['PatientPortalContent'].document.title && !supressLoad)
            {
                $('PatientPortalContent').src = Tabs.currentTab.link.href;
            }
        }
    } 
   
    // Initalize helper functions to handle UI events, clicks, resieze
    function initalizeTabs() 
    {
        // A tab is an image in the PatientTabBar
        $('PatientTabBar').tag('IMG').foreach(initalizeTab);
        // get tab from query string
        var queryTab = '<%= DefaultTab %>';
        var defaultURL = '<%= DefaultURL %>';
        // if query tab is set and exists in Tabs list, load tab
        if(queryTab != '' && defaultURL != '' && Tabs[queryTab]) 
        {
            setActiveTab(queryTab,true);
            $('PatientPortalContent').src = defaultURL;
        }
        // otherwise, load summary by default
        else { setActiveTab('PatientSummary'); }
    }

    // adds events and helper properties to tab DOM reference
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

        // Get image extension
        var imgSrc = new String(tab.src);
        var ext = imgSrc.substr(imgSrc.lastIndexOf('.'), imgSrc.length - imgSrc.lastIndexOf('.'));
        
        // Set on and off image src
        tab.offImage = tab.src;
        tab.onImage = tab.src.replace(ext,'_on' + ext);
        tab.disabledImage = tab.src.replace(ext,'_disabled' + ext);
        
        // Resize by class name : SmallTabPage = resize small, LargeTabPage = resize large
        tab.adjustLayer = function() 
        {
            if(tab.className=='SmallTabPage') { parent.resizePatientPortalSmall(); }
            else { parent.resizePatientPortalLarge(); }
            onWindowResize();
        };
        
        // Event Handler will be attached to parent hyperlink
        
        // supress visit tabs if needed
        if(DISABLE_VISIT_TABS && (lookup=='ProtocolPatientCalendar' || lookup=='PatientVisit'))
        {
            tab.src = tab.disabledImage;
            $(link).addEvent('click',curry(onDisabledTabClick,tab));
        }
        // otherwise normal click
        else
        {
            $(link).addEvent('click',curry(onTabClick,tab));
        }
    }
    
    // function which fires when tab is clicked
    function onTabClick(tab,e) 
    { 
        if(checkContentPageDirty()) { setActiveTab(tab); }
        else if(e) { stopBubble(e); }
    }
    
    // when disabled tab clicked, do noting, return
    function onDisabledTabClick(tab,e)
    {
        var doReg = confirm('This patient must be on study before viewing Visits. Would you like to go to the Registration page?');
        stopBubble(e);
        if(doReg)
        {
            // go to registration tab with OnStudy panel active
            parent.patientAssigned('<%= BaseProtocolId %>', '<%= BaseSchemaId %>', '<%= BasePatientId %>', 'OnStudy');
        }
    }

    // Determines if patient content page isDirty (i.e. form fields values changed before post-back)
    function checkContentPageDirty()
    {
        if(isPageDirty(window.frames['PatientPortalContent']))
        {
            return confirm('You have made changes to the form, would you like to leave?');
        }
        else
        {
            return true;
        }
    }
    
    // Loads Visit interface with relevant src tab
    function loadPatientItem(patientItemId,tab) {
        var url = '<%= GetQueryString("PatientVisitDataEntryContainer.aspx") %>&patientItemId=' + patientItemId + '&tab=' + (tab ? tab : '');
        window.location = url;
    }
    
    function resizePatientContent(e) {
        var patientFrame = window.frames['PatientPortalContent'];
        var winHeight = getHeight(patientFrame);
        var winWidth = getWidth(patientFrame);    
        var frameURL = patientFrame.location + '';
        // resize edit eform container
        if(frameURL.indexOf('EditEFormContainer.aspx') > -1) {
            // call resize function with current patient portal height
            if(patientFrame.setEFormEditDataHeights) {            
                patientFrame.setEFormEditDataHeights(winWidth, winHeight + 100);
                patientFrame.winWidth = winWidth;
                patientFrame.setEformNav(false);
            }
        }
        // resize approve step
        else if(frameURL.indexOf('ReviewEFormContainer.aspx') > -1 || frameURL.indexOf('ApproveEFormContainer') > -1) {
            // resize function
            if(patientFrame.setEFormNarrativeHeights) {
                patientFrame.setEFormNarrativeHeights(winWidth, winHeight + 100);
            }
            else if(patientFrame.setEFormApprovalHeights) {
                patientFrame.setEFormApprovalHeights(winWidth, winHeight + 100);
            }
            var reviewDataFrame = patientFrame.frames['ReviewDataFrame'];
            if(reviewDataFrame) {
                var theNarrative = reviewDataFrame.document.getElementById('theNarrative');
                if(theNarrative) {
                    theNarrative.style.height = winHeight - 150 + 'px';
                }
            }
        }
    }

    // Reload the patient portal
    // @tab = the optional tab to select
    function reloadPatientPortal(tab) {
        var url = '<%= GetQueryString("PatientIndex.aspx") %>&tab=' + (tab || '');
        window.location = url;
    }

    function validateUserAccess() {
        if(window.ENABLE_PROTOCOL_SPECIMENS)
        {
            var frameLocation = window.frames["PatientPortalContent"].location + "";
            if(frameLocation.indexOf("PatientSpecimensIndex.aspx") == -1) {
                setActiveTab("PatientSpecimens", false);
            }
        }
     }
   
    /* ]]> */
    </script>

</head>
<body class="PatientPortalBody">
    <form id="form1" runat="server">
        <pat:PatientHeader runat="server" ID="PatientTitleHeader" />
        <div id="PatientTabBar" class="PatientTabBar">
            <%--
            ! IMPORTANT !
            Table containig list of "Tabs" represented by a html hyperlink and image
            HTML attributes define behavior of tabs
            MARKUP
            <a href="Page.aspx">
                <img alt="MyPage" class="SmallTabPage" src="Images/myImg.jpg" />
            </a>
            A:
                @href: path to page which loads on tab click
            IMG:
                @alt: the lookup key for easily accessing tab in query(tab=PatientSummary) (i.e., loading page and setting image)
                      NOTE: the name of @alt should match the @href aspx page,
                            href="PatientSummary.aspx" alt="PatientSummary"
                @class: SmallTabPage | LargeTabPage, defines if page which loads should resize patient portal to small or large
                @src: the path of the "off" version of a tab. assumes "on" version is named 'myImg.jpg' -> 'myImg_on.jpg' 
             --%>
            <table runat="server" id="PatientMenuTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="text-align: center;">
                        <a runat="server" href="PatientSummary.aspx" target="PatientPortalContent">
                            <img class="LargeTabPage" id="SummaryTab" src="Images/PatientPortalTabSummary.png"
                                alt="PatientSummary" title="View a summary for this patient, including current status and recent and upcoming items." /></a>
                    </td>
                    <td style="text-align: center;">
                        <a runat="server" href="PatientRegistration.aspx" target="PatientPortalContent">
                            <img class="LargeTabPage" id="RegistrationTab" src="Images/PatientPortalTabRegistration.png"
                                alt="PatientRegistration" title="View and edit information regarding patient screening, consent, and registration." /></a>
                    </td>
                    <td style="text-align: center;">
                        <a runat="server" href="PatientEligibility.aspx" target="PatientPortalContent">
                            <img class="LargeTabPage" id="EligibilityTab" src="Images/PatientPortalTabEligibility.png"
                                alt="PatientEligibility" title="Enter eligibility questionnaire for this patient." /></a>
                    </td>                    
                    <td style="text-align: center;">
                        <a runat="server" href="PatientDemographics.aspx" target="PatientPortalContent">
                            <img class="LargeTabPage" id="DemographicsTab" src="Images/PatientPortalTabDemographics.png"
                                alt="PatientDemographics" title="Enter patient demographic info." /></a>
                    </td>
                    <td style="text-align: center;">
                        <a runat="server" href="PatientBaseline.aspx" target="PatientPortalContent">
                            <img class="LargeTabPage" id="BaselineDataTab" src="Images/PatientPortalTabBaselineData.png"
                                alt="PatientBaseline" title="Enter baseline data for this patient." /></a>
                    </td>
                    <td style="text-align: center;">
                        <a runat="server" href="PatientDiseaseProgression.aspx" target="PatientPortalContent">
                            <img class="LargeTabPage" id="DiseaseProgressionTab" src="Images/PatientPortalTabDiseaseProgression.png"
                                alt="PatientDiseaseProgression" title="A patient's disease progression." /></a>
                    </td>
                    <td style="text-align: center;">
                        <a runat="server" href="ProtocolPatientCalendar.aspx" target="PatientPortalContent">
                            <img class="LargeTabPage" id="AllVisitsTab" src="Images/PatientPortalTabSchedule.png"
                                alt="ProtocolPatientCalendar" title="View scheduling calendar for this patient." /></a>
                    </td>
                    <td style="text-align: center;">
                        <a runat="server" href="PatientVisit.aspx" target="PatientPortalContent">
                            <img class="LargeTabPage" id="PatientVisitTab" src="Images/PatientPortalTabPatientVisit.png"
                                alt="PatientVisit" title="Update statuses and enter data for patient visits."
                                style="cursor: pointer;" /></a>
                    </td>
                     <td runat="server" id="SpecimensTabCell" style="text-align: center;" visible="false">
                        <a id="SpecimensTab" runat="server" href="PatientSpecimensIndex.aspx" target="PatientPortalContent">
                            <img class="LargeTabPage" id="PatientSpecimensTab" src="Images/PatientPortalTabPatientSpecimen.png"
                                alt="PatientSpecimens" title="Update patient specimen data."
                                style="cursor: pointer;" /></a>
                    </td>
                    <td style="text-align: center;">
                        <a runat="server" href="PatientOutcomes.aspx" target="PatientPortalContent">
                            <img class="LargeTabPage" id="OutcomesTab" src="Images/PatientPortalTabOutcomes.png"
                                alt="PatientOutcomes" title="Track patient response data for this patient." /></a>
                    </td>
                </tr>
            </table>
        </div>
        <iframe id="PatientPortalContent" name="PatientPortalContent" style="width: 100%;
            margin: 5px auto auto auto;" frameborder="0" src="" onload="validateUserAccess(); resizePatientContent(event);"></iframe>

        <script type="text/javascript">
            /* <![CDATA[ */
            initalizeTabs();
            /* ]]> */
            </script>

    </form>
</body>
</html>
