<%@ Control EnableViewState="false" AutoEventWireup="true" Language="c#" Inherits="Caisis.UI.Core.Header.PageHeader"
    CodeFile="PageHeader.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseControl" %>
<%@ Reference Control="~/Core/Header/FindResults.ascx" %>
<%@ Reference Control="~/Core/Header/CurrentList.ascx" %>
<%@ Register TagPrefix="val" TagName="CommonTasks" Src="CommonTasks.ascx" %>
<%@ Register TagPrefix="val" TagName="CurrentList" Src="CurrentList.ascx" %>
<%@ Register TagPrefix="val" TagName="FindResults" Src="FindResults.ascx" %>
<%@ Register TagPrefix="val" TagName="Modal" Src="Modal.ascx" %>

<val:CurrentList ID="currentList" runat="server"></val:CurrentList>
<val:CommonTasks ID="CommonTasks1" runat="server"></val:CommonTasks>

<!-- Register Modal javascript for use anywhere in application -->
<script type="text/javascript" src="<%= Page.ResolveUrl("~/ClientScripts/jquery.js") %>"></script>
<script type="text/javascript" src="<%= Page.ResolveUrl("~/ClientScripts/jquery-ui.js") %>"></script>

<script type="text/javascript">
/* <![CDATA[ */
        
jQuery.noConflict();
// Reflects the absolute path to the root of the application with trailing "/" (i.e. http://myhost:port/caisisroot/)
var APP_PATH = '<%= Caisis.UI.Core.Classes.PageUtil.GetAbsoluteUrl(Page, "~/") %>';

// Culture Specific variables
var culture = '<%= GetCulture() %>';
var MONTH_NAMES = [<%= GetMonthNames() %>];

// Client Ids
var fNameId = '<%= fName.ClientID %>';
var lNameId = '<%= lName.ClientID %>';
var mrnId = '<%= idTypeField.ClientID %>';
var dobId = '<%= dob.ClientID %>';

var searchWordsJsPath = '<%= searchWords.ClientID %>';
var searchFormJsPath = 'searchForm';
var EMPTY_PATIENT_DATA = '------------ ';

// Updates the name and dob text for patient in header
function changePatientInHeader(newFirstName, newLastName, newMrn, newDOB, epid, isDeceased)
{
    // old logic: toggle on patient in session variable when setting new patient in session, if setting non empty values
    //if( (newFirstName && newFirstName!='') || (newLastName && newLastName!='') || (newMrn && newMrn!=''))
    //{
    //  BL_PATIENT_IN_SESSION = true;
    //}
        
    // new logic: toggle patient in session variable based on epid
    if(epid && epid != '') {
        BL_PATIENT_IN_SESSION = true;
    }
    else {
        BL_PATIENT_IN_SESSION = false;
    }
    // adjust summary report
    setViewPatientSummaryReport(BL_PATIENT_IN_SESSION);

    var maxNameLength = 14;
    var trimmedFirstName = newFirstName;
    var trimmedLastName = newLastName;
    
    if (trimmedFirstName.length > maxNameLength) trimmedFirstName = trimmedFirstName.substr(0,maxNameLength) + '...';
    if (trimmedLastName.length > maxNameLength) trimmedLastName = trimmedLastName.substr(0,maxNameLength) + '...';
	
	// SET DEFAULTS
	trimmedFirstName = trimmedFirstName!='' ? trimmedFirstName : EMPTY_PATIENT_DATA;
	trimmedLastName = trimmedLastName!='' ? trimmedLastName : EMPTY_PATIENT_DATA;
	newMrn = newMrn != null && newMrn != '' ? newMrn : EMPTY_PATIENT_DATA;
	newDOB = newDOB != null && newDOB !='' ? newDOB : EMPTY_PATIENT_DATA;
	
	document.getElementById(fNameId).innerHTML = trimmedFirstName;
	document.getElementById(lNameId).innerHTML = trimmedLastName;
	document.getElementById(mrnId).innerHTML = newMrn;
	if(isDeceased)
	{
	    document.getElementById(dobId).innerHTML = newDOB + " <span class=\"deceasedText\">(DECEASED)</span>";
	}
	else
	{
	    document.getElementById(dobId).innerHTML = newDOB;
	}
}

// Clears the patient name and dob in the header
function clearPatientInHeader() { changePatientInHeader('','','','','',false); }

function setSubmitReason()
{
	document.getElementById('<%= submitReason.ClientID %>').value = 'toggleHelpBubbles';
	document.forms[0].submit();
}
function setDiseaseView(diseaseSelection)
{
	document.getElementById('<%= diseaseSelect.ClientID %>').value = diseaseSelection;
	document.forms[0].submit();
}

	
//opens page level help with query string variable carrying current section
function popupHelpWindow()
{
	window.open('../Help/HelpPage.aspx?helpSection=<asp:Literal ID="helpSection" Runat="server" />', 'CaisisHelp', 'toolbars=no,resize=no,scrollbars=no,width=620,height=445,left=300,top=200');
}
//opens window to email admin
function popupAdminEmailWindow()
{
	window.open('../Utilities/EmailAdmin.aspx','EmailAdmin', 'toolbars=no,resize=no,scrollbars=no,width=500,height=400,left=300,top=200');
}

BL_PATIENT_IN_SESSION = false;

function noPatientInSessionRedirect()
{
	if (BL_PATIENT_IN_SESSION)
	{
		window.location = '../DataEntryForms/index.aspx';
		return true;
	}
	else
	{
		var pathString = document.location.pathname;
		var onPatientList = pathString.indexOf("PatientListPage")	
		if (onPatientList >= 0)
		{
			alert('You must select a patient before attempting to perform that function.');
		}
		else
		{
			var confirmValue = confirm('You must select a patient before attempting to perform that function.\n\nWould you like to select a patient from the Patient Lists page?\n\n');
			if (confirmValue == true)
			{
				window.location = '../PatientLists/PatientListPage.aspx';
				return true;
			}
		}
	}
}

function setFind(findStr, searchTargetString)
{
	window.document.getElementById(searchWordsJsPath).value = findStr;
	window.document.getElementById('HeaderSearchTarget').value = searchTargetString;
	window.document.getElementById(searchFormJsPath).submit();
}

function showHideSearchOptions()
{
    var searchOptions = document.getElementById('SearchOptions');
    if(searchOptions.style.display!='none') {
        hideSearchOptions();
    }
    else {
        showSearchOptions();
    }
}

function runBasicPatientSearch(searchValue)
{
    // set search field value
    document.getElementById('<%= searchWords.ClientID %>').value = searchValue;
	// Set search Type as Last Name MRN in header
    setSearchType('LastNameMRN');
    // Call Search in Header
    findPatients(searchValue,'LastNameMRN');
}

// gets the text to display currenly selected search type
function getSearchFieldDisplayText()
{
    var displayText = '< by ' + getSelectedSearchText() + ' >';
    return displayText;
}

// displays the current search by type in search box
function setSearchFieldTextOn()
{
    var displayText = getSearchFieldDisplayText();
    var search = document.getElementById('<%= searchWords.ClientID %>');
    search.title = displayText;
    // if value is empty, or starts with 'By', set special text
    if(search.value=='' || search.value.indexOf('< by ')==0)
    {
        search.value = displayText;
        // set special style
        search.style.color = '#a8a8a8';
//        search.style.fontSize = '10px';
    }
}

// removes displaying of current search type in text box
function setSearchFieldTextOff()
{
    var displayText = getSearchFieldDisplayText();
    var search = document.getElementById('<%= searchWords.ClientID %>');
    search.title = displayText;
    // if value currently contains 'Search By', remove to allow user entry
    if(search.value.indexOf('< by ')==0)
    {
        search.value = '';
        // reset style
        search.style.color = '#333333';
//        search.style.fontSize = '';
    }
}
// gets the currently selected search by radio button value
function getSelectSearchValue()
{
    var option = _getSelectedSearchOption();
    return option ? option.value : '';
}

// gets the currently selected search by radio button text
function getSelectedSearchText()
{
    var option = _getSelectedSearchOption();
    if(option) { return option.title; }
    return '';
}

// gets the selected search radio button
function _getSelectedSearchOption()
{
    var ul = document.getElementById('SearchOptionsList');
    var options = ul.getElementsByTagName('INPUT');
    for(var i=0;i<options.length;i++)
    {
        if(options[i].checked) { return options[i]; }
    }
    return null;
}

		
var searchCallBackURL = '<%= Caisis.UI.Core.Classes.PageUtil.GetBasePath(this.Request) + "/Core/Utilities/AjaxCallBacks/PatientSearch.aspx" %>';

function showMoreTabsMenu()
{
    document.getElementById('<% = MoreModulesMenu.ClientID %>').style.visibility = 'visible';
}

function hideMoreTabsMenu(element, evt)
{
    if (isMouseLeave(element, evt))
    {
       element.style.visibility = 'hidden';
    }
}

function logoutUser()
{
    window.location = '<%= Page.ResolveUrl("~/Logout.aspx") %>';
}

var CAN_VIEW_SUMMARY = <%= (patientInSession && canViewSummary).ToString().ToLower() %>;
var VIEW_SUMMARY_URL = '<%= canViewSummary ? Page.ResolveUrl("~/Modules/All/Reports/PatientOverviewReport.aspx") : "" %>';

function setViewPatientSummaryReport(doShow) {
    CAN_VIEW_SUMMARY = doShow;
    // adjust styles of view summary button
    var viewSummaryLink = document.getElementById('<%= ViewPatientSummaryLink.ClientID %>');
    viewSummaryLink.src = doShow ? '<%= Page.ResolveUrl("~/Images/headerIcon_PatientReport.png") %>' : '<%= Page.ResolveUrl("~/Images/headerIcon_PatientReport_noPatient.png") %>';
    viewSummaryLink.className = doShow ? 'HeaderPatientSummaryButton' : 'HeaderPatientSummaryButtonOff';
    // show hide no patient link
    var noPatientLabel = document.getElementById('<%= noPatientLabel.ClientID %>');
    noPatientLabel.style.display = doShow ? 'none' : '';
}

// view the overview report for the current patient
function viewPatientSummaryReport() {
    if(CAN_VIEW_SUMMARY && VIEW_SUMMARY_URL && VIEW_SUMMARY_URL != '')
    {
        var lastName = document.getElementById('<%= lName.ClientID %>').innerHTML.replace(' ', '');
        var firstName = document.getElementById('<%= fName.ClientID %>').innerHTML.replace(' ', '');        
        var url = VIEW_SUMMARY_URL + '?chartLab=&nomogram=';
        var title = 'Summary for ' + firstName + ' ' + lastName;
        top.showModalWithConfig(url, title, { width: '850px', height: '650px' });
    }
    return false;
}

function showCurrentList()
{
MM_showHideLayers('currentList','','show','commonTasks','','hide','flashList','','hide');
}

function HeaderSearchButtonClick()
{
    if ($('searchBtn') != null && $('searchBtn').className == 'HeaderSearchButtonCancel')
    {
        $('<% = searchWords.ClientID %>').value = '';
        hideSearchResults();
    }
    else
    {
        $('searchBtn').className = 'HeaderSearchButtonCancel';
        findPatients(document.getElementById(searchWordsJsPath).value,getSearchType());
        return false;
    }
}


/* ]]> */
</script>

<form id="searchForm" name="searchForm" method="post">
    <val:Modal runat="server" />
    <!-- do not change the position of this hidden field in the forms array -->
    <input type="hidden" id="submitReason" name="submitReason" value="" runat="server" />
    <input type="hidden" id="diseaseSelect" name="diseaseSelect" value="" runat="server" />
    <table align="left" width="100%" height="70" border="0" cellpadding="0" cellspacing="0"
        class="headerBG" id="headerTable">
        <tr>
            <td width="3">
                <img src="../../Images/shim.gif" width="3" height="4" /></td>
            <td width="580">
                <img src="../../Images/shim.gif" width="580" height="4" /></td>
            <td>
                <img src="../../Images/shim.gif" width="10" height="4" /></td>
            <td width="200">
                <img src="../../Images/shim.gif" width="200" height="4" /></td>
        </tr>
        <tr>
            <td width="3">
                &nbsp;</td>
            <td align="left">
                <!-- Patient Header Table -->
                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 5px">
                            <img alt="Caisis" src="../../Images/Header/HeaderBarLeftEnd.gif" style="width: 5px;
                                height: 30px;" /></td>
                        <td style="white-space: nowrap; background-color: #8d2a2c; vertical-align: middle;"
                            class="HeaderPatientText">
                            <%--<span style="font-weight: bold; margin-right: 8px; font-size: 11px;">Current Patient:</span>--%>
                            
                                <img runat="server" id="ViewPatientSummaryLink" onclick="return viewPatientSummaryReport();" class="HeaderPatientSummaryButton" alt="View Patient Summary" title="View Patient Summary" src="~/Images/headerIcon_PatientReport.png"  /><span style="font-weight: bold;">
                                <asp:Label ID="noPatientLabel" runat="server" Style="margin-right: 9px; color: #C69596; cursor: pointer;" onclick="showCurrentList();">No Patient Selected</asp:Label>
                                <asp:Label ID="fName" runat="server" onclick="return viewPatientSummaryReport();" >------------</asp:Label> <asp:Label ID="lName" runat="server" Style="margin-right: 9px;" onclick="return viewPatientSummaryReport();">------------</asp:Label>
                                <asp:Label ID="idTypeField" runat="server" Style="margin-right: 12px;"></asp:Label>
                                <span ID="dobLabel" runat="server" style="font-size: 11px; margin-right: 2px;">DOB:</span>
                                <asp:Label ID="dob" runat="server" Style="margin-right: 12px;">----------</asp:Label>
                            </span><a href="javascript:;" onclick="showCurrentList();">
                                <img alt="Show Current List" src="../../Images/Header/DownWidgetBlueOnRed.gif" style="width: 13px;
                                    height: 13px; border: none; vertical-align: middle;" /></a>
                        </td>
                        <td class="HeaderPatientText" style="width: 400px; background-color: #8d2a2c;white-space: nowrap;">
                            <div style="float: right; z-index: 19; position: relative; height: 20px; visibility: visible;
                                right: 10px; white-space: nowrap;">
                                <label for="<%= searchWords.ClientID %>" id="FindPatientText" title="Find A Patient" style="color: #ffffff;
                                    font-weight: bold; font-size: 11px;">
                                    Find A Patient</label>
                                <!-- Help Bubble for Patient Search Type Description -->
                                
                                
                                <div id="FindPatientHelpLayer" style="z-index: 30; visibility: hidden; width: 201px;
                                    position: absolute; top: 20px; right: 86px;">
                                    <table width="120" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                                <img src="../../Images/shim.gif" width="15" height="1"></td>
                                            <td>
                                                <img src="../../Images/shim.gif" width="5" height="1"></td>
                                            <td>
                                                <img src="../../Images/shim.gif" width="93" height="1"></td>
                                            <td>
                                                <img src="../../Images/shim.gif" width="5" height="1"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" align="right" ><img id="helpBubbleTopPointer" src="../../Images/helpBubbleTopPointer.gif" width="105" height="18" style="margin: 0px;"></td>
                                        </tr>
                                        <tr>
                                            <td valign="top" class="helpLeftBG">
                                                &nbsp;</td>
                                            <td bgcolor="#fbfbef" class="helpLeftBG">
                                                &nbsp;</td>
                                            <td bgcolor="#fbfbef" class="helpText" height="35" >
                                                <span id="findPatientHelpDesc"></span>
                                                <br /><img src="../../Images/shim.gif" width="1" height="6"><br />
                                                Click to change search criteria.
                                            </td>
                                            <td bgcolor="#fbfbef" class="helpRightBG">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" align="right">
                                                <img id="helpBubbleBottom" src="../../Images/helpBubbleBottom.gif" width="105" height="3"></td>
                                        </tr>
                                    </table>
                                </div>
                                <!-- End Search Bubble -->
                                
                                <img src="../../Images/Header/DownWidgetBlueOnRed.gif" style="cursor: pointer; vertical-align: middle;
                                    margin: auto 2px auto 2px;" onclick="showHideSearchOptions();"  onmouseover="showFindBubble();" onmouseout="hideFindBubble();" />
                                <span class="HeaderSearchContainer">
                                <input type="text" id="searchWords" runat="server" tabindex="1" style="color: #333333;"
                                    maxlength="255" class="HeaderSearchField" onkeyup="if (event.keyCode==13) { findPatients(this.value,getSearchType()); }"
                                    onkeydown="if(event.keyCode==13) { return false; } else { $('searchBtn').className = 'HeaderSearchButton'; }" onclick="hideSearchOptions(); "
                                    autocomplete="off" onfocus="setSearchFieldTextOff();" onblur="setSearchFieldTextOn();" /><span id="searchBtn" class="HeaderSearchButton"  onclick="HeaderSearchButtonClick();" >&nbsp;</span>
                                </span>
<%--                                    
                                <img src="<%= Page.ResolveUrl("~/Images/Header/SearchBoxBG.png") %>"
                                    ID="searchBtn" title="Search" Alt="Search" class="FilterSearchBoxIcon"  />--%>
                                <div id="SearchOptions" style="border: 1px solid #ffffcc; z-index: 31; width: 170px;
                                    position: absolute; background-color: #ffffff; display: none; border: 1px solid #cccccc;
                                    color: #000000; top: 25px; left: 15px; padding: 3px; padding-top: 6px; font-size: 11px;
                                    color: #333333;">
                                    <div style="color: #8d2a2c; font-weight: bold; font-size: 11px; text-align: left;
                                        border-bottom: 1px solid #8d282c; width: 100%; margin-bottom: 6px;">
                                        Select Search Criteria</div>
                                    <div id="SearchOptionsListWrapper" style="overflow: auto; height: auto;">
                                    <ul id="SearchOptionsList" class="HeaderNavList">
                                        <asp:Repeater ID="SearchOptionsDropdown" runat="server">
                                            <ItemTemplate>
                                                <li title="Search by <%# EscapeClientValue(Eval("DisplayName").ToString()) %>" onclick="setSearchType('<%# EscapeClientValue(Eval("LkpCode").ToString()) %>'); hideSearchOptions();"
                                                    onmouseout="this.className=''" onmouseover="this.className='chronListHilighted';">
                                                    <input id="SearchOption_<%# Container.ItemIndex %>" type="radio" name="SearchTypeValue" value="<%# Eval("LkpCode") %>"
                                                        title="<%# EscapeClientValue(Eval("DisplayName").ToString()) %>" />
                                                    <label id="SearchOption_<%# Container.ItemIndex %>_Label" for="SearchOption_<%# Container.ItemIndex %>" title="Search by <%# EscapeClientValue(Eval("DisplayName").ToString()) %>">
                                                        <%# Eval("DisplayName") %>
                                                    </label>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                    </div>
                                </div>
                                
                                
                                
                                
                                
                                
                            </div>
                            <!-- Set Default Search Type from Cookie -->




                                <script type="text/javascript">
                                /* <![CDATA[ */
                                    
                                // set default search
                                var allSearchOptions = document.getElementById('SearchOptions').getElementsByTagName('INPUT');
                                if (allSearchOptions.length > 0) { allSearchOptions[0].checked = true; }
                                // set search based on cookie
						        setSearchType('<%= Request.Cookies["DefaultSearchType"] != null ? Request.Cookies["DefaultSearchType"].Value : "" %>');
						       
                                /* ]]> */
                                </script>

                        </td>
                        <td style="width: 5px">
                            <img alt="Caisis" src="../../Images/Header/HeaderBarRightEnd.gif" style="width: 5px;
                                height: 30px" /></td>
                    </tr>
                </table>
            </td>
            <td style="width: 50px; vertical-align: top;">
                <val:FindResults ID="searchResult" runat="server"></val:FindResults>
            </td>
            <td style="width: 270px; vertical-align: top;" rowspan="3" class="rightHeaderBG">
                <!-- Help/Disease View Table -->
                <table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="5">
                            <img src="../../Images/Header/HelpLogoutBarLeftEnd.gif" width="5" height="30"></td>
                        <td align="middle" bgcolor="#3d556d" width="280">
                            <div id="HelpOptions" style="border-right: #000000 1px; border-top: #000000 1px;
                                z-index: 15; border-left: #000000 1px; width: 150px; border-bottom: #000000 1px;
                                position: absolute; visibility: hidden;">
                                <table width="120" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
                                    <tr>
                                        <td colspan="2" rowspan="2" bgcolor="#00668d">
                                            <img src="../../Images/Header/LayerCornerTopLeftWhite.gif" width="5" height="5"></td>
                                        <td height="1" class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="2" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="136" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="2" height="1"></td>
                                        <td colspan="2" rowspan="2" bgcolor="#00668d">
                                            <img src="../../Images/Header/LayerCornerTopRightBlue.gif" width="5" height="5"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="4">
                                            <img src="../../Images/shim.gif" width="1" height="4"></td>
                                    </tr>
                                    <tr>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="4" height="1" /></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1" /></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1" /></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1" /></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="4" height="1" /></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1" /></td>
                                    </tr>
                                    <tr>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td height="15" colspan="3" valign="top">
                                            <a href="javascript:;">
                                                <img src="../../Images/Header/SmallCloseButton.gif" alt="Close" title="Close" onclick="MM_showHideLayers('HelpOptions','','hide')"
                                                    width="11" height="11" hspace="4" border="0" align="right"></a><img src="../../Images/Header/HelpOptionsTitle.gif"
                                                        width="70" height="11" hspace="2" vspace="2"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                    <tr>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td colspan="3" bgcolor="#8d2a2c">
                                            <img src="../../Images/shim.gif" width="1" height="1"><img src="../../Images/shim.gif"
                                                width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                    <tr>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td valign="top" height="80">
                                            <ul id="HelpOptionsList" class="HeaderNavList" style="text-align: left;">
                                                <li style="border: solid 1px #ffffff;"><a class="commonTasksText" href="#" onclick="popupHelpWindow();MM_showHideLayers('HelpOptions','','hide')">Find Help for This Page</a></li>
                                                <li style="border: solid 1px #ffffff;"><a runat="server" id="ContactAdminLink" class="commonTasksText" href="#" onclick="popupAdminEmailWindow(); MM_showHideLayers('HelpOptions','','hide');return false;">Contact Admin</a></li>
                                                <li style="border: solid 1px #ffffff;"><a class="commonTasksText" href="#" onclick="popupAboutBox();MM_showHideLayers('HelpOptions','','hide');">About This Application</a></li>
                                            </ul>
                                        </td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                    <tr>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td valign="top">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" rowspan="2">
                                            <img src="../../Images/Header/LayerCornerBottomLeft.gif" width="5" height="5"></td>
                                        <td colspan="3" height="3">
                                            <img src="../../Images/shim.gif" width="1" height="4"></td>
                                        <td colspan="2" rowspan="2">
                                            <img src="../../Images/Header/LayerCornerTopBottomRi.gif" width="5" height="5"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="1" class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                </table>
                            </div>
                            <img src="../../Images/Header/HeaderHelp.gif" height="17" style="cursor:  pointer; margin-right: 30px; vertical-align: middle;" alt="Help" title="Help" onclick="MM_showHideLayers('HelpOptions','','show');MM_showHideLayers('DiseaseViewOptions','','hide');"><%-- <a href="../../Logout.aspx"><img
                                    src="../../Images/Header/HeaderLogOut.gif" width="70" height="17" border="0"
                                    title="log out of system"></a>--%><div id="logoutButton" onclick="logoutUser();">(<% =currentUsername %>)</div></td>
                        <td width="5">
                            <img src="../../Images/Header/HelpLogoutBarRightEnd.gif" width="5" height="30"></td>
                        <td width="10">
                            <img src="../../Images/shim.gif" width="10" height="8"></td>
                    </tr>
                    <tr>
                        <td width="5" bgcolor="ffffff">
                            <img src="../../Images/Header/DiseaseViewLeftEnd.gif" width="5" height="23"></td>
                        <td align="middle" width="190" valign="center" class="diseaseView">
                            <div id="DiseaseViewOptions" style="border-right: #000000 1px; border-top: #000000 1px;
                                z-index: 15; border-left: #000000 1px; width: 150px; border-bottom: #000000 1px;
                                position: absolute; visibility: hidden;">
                                <table width="150" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
                                    <tr>
                                        <td colspan="2" rowspan="2" bgcolor="#ffffff">
                                            <img src="../../Images/Header/LayerCornerTopLeftWhite.gif" width="5" height="5"></td>
                                        <td height="1" class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="2" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="136" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="2" height="1"></td>
                                        <td colspan="2" rowspan="2" bgcolor="#ffffff">
                                            <img src="../../Images/Header/LayerCornerTopRightBlue.gif" width="5" height="5"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="4">
                                            <img src="../../Images/shim.gif" width="1" height="4"></td>
                                    </tr>
                                    <tr>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="4" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="4" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                    <tr>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td height="15" colspan="3" valign="top">
                                            <a href="javascript:;">
                                                <img src="../../Images/Header/SmallCloseButton.gif" alt="Close" title="Close" onclick="MM_showHideLayers('DiseaseViewOptions','','hide')"
                                                    width="11" height="11" hspace="4" border="0" align="right"></a><img src="../../Images/Header/DiseaseViewTitle.gif"
                                                        width="74" height="8" hspace="2" vspace="2"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                    <tr>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td colspan="3" bgcolor="#8d2a2c">
                                            <img src="../../Images/shim.gif" width="1" height="1"><img src="../../Images/shim.gif"
                                                width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                    <tr>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td valign="top">
                                            <ul id="DiseaseViewList" class="HeaderNavList">
                                                <li><a class="diseaseView" title="All View" id="diseaseAll" onclick="setDiseaseView('All');"
                                                    href="#">All </a></li>
                                                <asp:Repeater ID="rptViewModes" runat="server">
                                                    <ItemTemplate>
                                                        <li><a href="#" onclick="setDiseaseView('<%# Eval("DiseaseName") %>');" id="disease<%# Eval("DiseaseName") %>" title="<%# Eval("DiseaseName") %> View"
                                                            class="diseaseView">
                                                            <%# Eval("DiseaseName") %>
                                                        </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                    <tr>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td valign="top">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td>
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                        <td class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" rowspan="2">
                                            <img src="../../Images/Header/LayerCornerBottomLeft.gif" width="5" height="5"></td>
                                        <td colspan="3" height="3">
                                            <img src="../../Images/shim.gif" width="1" height="4"></td>
                                        <td colspan="2" rowspan="2">
                                            <img src="../../Images/Header/LayerCornerTopBottomRi.gif" width="5" height="5"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="1" class="GlobalListBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                </table>
                            </div>
                            Disease View:&nbsp;&nbsp;&nbsp;<a href="javascript:;" onclick="MM_showHideLayers('DiseaseViewOptions','','show')"
                                class="diseaseView"><asp:Label ID="currentDiseaseView" runat="server"></asp:Label><img
                                    src="../../Images/Header/DownWidgetRedOnWhite.gif" alt="Select A Disease View" title="Select A Disease View" width="13" height="13" hspace="7"
                                    border="0" align="absMiddle"></a></td>
                        <td width="5">
                            <img src="../../Images/Header/DiseaseViewRightEnd.gif" width="5" height="23"></td>
                        <td width="10">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="10"><img src="../../Images/shim.gif" width="1" height="10"></td>
            <td colspan="2"><img src="../../Images/shim.gif" width="1" height="1"></td>
        </tr>
        <tr>
            <td style="background-image: url(../../Images/Header/HeaderBGLine.gif)">&nbsp;</td>
            <td style="background-image: url(../../Images/Header/HeaderBGLine.gif);">
            <div style="overflow: hidden;">
            
            
                <!-- Header Tabs Table -->
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="29"><img src="../../Images/Header/HeaderTabsLeftEndOff.gif" name="TabLeftEnd" id="TabLeftEnd" runat="server" width="29" height="26" /></td>
                        <td width="27" onclick="location='../Utilities/Dashboard.aspx';"><img src="../../Images/Header/HeaderTabsHomeOff.gif" name="TabHome" id="TabHome" runat="server" width="27" height="26" border="0" /></td>
                        
                        <asp:Repeater ID="rptHeaderTabs" runat="server" OnItemDataBound="HeaderTabsItemDataBound">
                            <ItemTemplate>
                                <td class="HeaderTabInBetweenBothOff" id="TabLeftTD" runat="server"><img src="../../Images/shim.gif" width="29" height="1"></td>
                                <td class="HeaderTabBG" id="TabCenterTD" runat="server" ><%# Eval("TabName") %></td>
                            </ItemTemplate>
                        </asp:Repeater>
                        <td width="28">
                        
                        <div id="MoreModulesMenu" runat="server" visible="false" style="z-index: 100; position: absolute; width: 193px; margin-top: 7px; margin-left: 5px; visibility: hidden;" onmouseout="hideMoreTabsMenu(this, event);">
                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                            <tr><td><img src="../../Images/Header/HeaderMoreTabsMenuTop.png" width="193" height="35" /></td></tr>
                            <asp:Repeater ID="MoreTabsRpt" runat="server"  OnItemDataBound="MoreTabsRptItemDataBound">
                                <ItemTemplate>
                                <tr><td onmouseover="this.className='moreTabsMenuTdOver';" onmouseout="this.className='moreTabsMenuTd';" id="MoreTabsMenuRow" runat="server" class="moreTabsMenuTd"><%# Eval("TabName") %></td></tr>
                                <tr><td class="moreTabsMenuTd" style="height: 6px; font-size: 1px; line-height: 1px; background-position: 0px -15px; cursor: default;">&nbsp;</td></tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <tr><td><img src="../../Images/Header/HeaderMoreTabsMenuBottom.png" width="193" height="15"  /></td></tr>
                        </table>
                        </div>                        
                            <img src="../../Images/Header/HeaderTabsRightEndOff.gif" name="TabLeftEnd" width="28"
                                height="26" id="TabRightEnd" runat="server" /></td>
                        <td width="*" style="vertical-align: bottom;">
                        <img src="../../Images/Header/HeaderTabsMoreMenuOff.gif" name="TabLeftEnd" width="89" height="18" id="MoreModulesTab" runat="server" visible="false" style="margin: 0px; vertical-align: bottom; cursor: pointer;" onclick="showMoreTabsMenu();" />&nbsp;
                        </td>
                    </tr>
                </table></div>
            </td>
            <td align="right" valign="top" background="../../Images/Header/HeaderBGLine.gif">
            </td>
        </tr>
    </table>
    <input type="hidden" id="HeaderSearchTarget" name="HeaderSearchTarget" value="" />
</form>

<script type="text/javascript">
    /* <![CDATA[ */
    
    // activate search helpers
    setSearchFieldTextOn();
    
    /* ]]> */
</script>
<!-- Loading Bar -->
<style type="text/css">
    #LoaderBar {
        display: none;
        position: absolute;
        top: 40%;
        left: 33%;
        text-align: center;
        font-size: 14px;
        background-color: #222222;
        background-color: rgba(0,0,0,0.7);
        padding: 10% 15% 10% 15%;
        border-radius: 4px;
        box-shadow: 0px 0px 6px #999999;
    }

        #LoaderBar img {
            vertical-align: middle;
            margin: 4px;
        }

        #LoaderBar span {
            font-size: 1.2em;
            color: #dddddd;
        }
</style>
<div id="LoaderBar" style="display: none;">
    <img src="<%= Page.ResolveUrl("~/Images/ajax-loader.gif") %>" alt="Loading..." />
    <span id="LoaderBarText">Loading...</span>
</div>
<script type="text/javascript">
    function showLoaderBar() {
        $("LoaderBar").show('block');
    }
    
    function hideLoaderBar() {
        $("LoaderBar").hide('none');
    }
</script>
