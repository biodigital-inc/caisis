self.onerror = function() { return true; }

//do not remove- used by tabs on brachytherapy page
var brachyTabHolder = 'schedule';

//document.oncontextmenu = DisableRightClick;
function DisableRightClick() {       
    		return false;
}

function popupAboutBox() {
	window.open('../Utilities/About.aspx', 'AboutCaisis', 'toolbars=no,resize=no,scrollbars=no,width=440,height=400,left=300,top=200');
}

function popupEmailUser(userName) {
	var EmailUserPath = '../Utilities/EmailUser.aspx?toUser=' + userName;
	window.open(EmailUserPath, 'ContactUser', 'toolbars=no,resize=no,scrollbars=no,width=500,height=400,left=300,top=200');
}


function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc)x.oSrc=x.src; x.src=a[i+2];}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_showHideLayers() { //v6.0  //altered 11.17.2011 to set display:none in addition to visibility:hidden  -jf
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  var d = '';
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v;  d=(v=='hidden')?'none':''; }
    obj.visibility=v; obj.display=d;}
}

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}

function confirmNarrativeLoss(url)
{
	if (confirm("If you move back to this step in the process, all changes\nyou have made to the narrative will be lost.\n\nClick OK to continue, or cancel to stay on this page.\n")) 
	{
		document.location = url;
	}
}

// to user header search from splash screen pop up layers
function submitenter(myfield,e)
{
			var keycode;
			if (window.event) keycode = window.event.keyCode;
			else if (e) keycode = e.which;
			else return true;
			if (keycode == 13)
			{
				if (splashSearchWords.value != '')
				{

					top.setFind(splashSearchWords.value, SearchTarget.value);
				} 
				else 
				{
					alert('Please enter the name or MRN of the patient.');
				}
				return false;
			}
			else return true;
}
function CheckIsIE() 
{ 
    if  (navigator.appName.toUpperCase() == 'MICROSOFT INTERNET EXPLORER')
		{ return true;} 
    else { return false; } 
}

// SEARCH FEATURE

// Search Variables
// searchCallBackURL = path set via runtime in Header Control
var currentSearchFilter;
var currentSearchType;
var minSearchLength = 1;
var maxSearchCount = 500;

var SearchLock;

// Occurs when the server returns our search results
function patientSearchCallBack(txt,xml)
{
    // Unlock search lock
    SearchLock.unlock();
    // Get a reference to the table containing the results
    // as well as the record count
    var recordCount = getNodeValue(xml.getElementsByTagName('span')[0]);
    // epid for a single patient found (empty for 0 || > 1)
    var singleResultsPatientId = getNodeValue(xml.getElementsByTagName('span')[1]);
    var resultsTable = xml.getElementsByTagName('table')[0];

    setSearchTypeHeader(recordCount + ' Results (by ' + getSearchTypeDesc(currentSearchType) + ')');
    
    if(recordCount==0)
    {
        showSearchResults();
        setSearchStatus('No Patients Match Your Search Criteria');
        showSearchStatus();
    }
    else if(recordCount>maxSearchCount)
    {
        showSearchResults();
        setSearchStatus('Your search returned ' + recordCount + ' results, please refine your search.');
        showSearchStatus();
    }
    else
    {
        // Import XML 'table' results node into our document's DOM
        var resultsList = getResultsList();
        var importedTableObj = getImportedXmlNode(resultsTable,resultsList.ownerDocument);
        populateResults(resultsList,importedTableObj);
        // single patient, go to patient
        if (recordCount == 1) {
             // load patient as normal
            navigateToPatient(singleResultsPatientId, true);
        }
        else
        {
            hideSearchStatus();
            showSearchResults();
        }
    }
}


// START Search Helpers
function findPatients(searchFilter,searchType)
{
    // Initalize search lock
    SearchLock = SearchLock!=null ? SearchLock : new Lock();
    hideSearchOptions();
    if(searchFilter.length<minSearchLength) {  alert('Your search term is too broad, please narrow.'); }
    else if(SearchLock.isLocked()) { alert('Your last search is still being processed...'); }
    else
    {
        currentSearchFilter = searchFilter;
        currentSearchType = searchType; 
        requestSearch(searchType , searchFilter);
    }
    
    
 }

// Make request to the Server
function requestSearch(searchType,filter)
{
    SearchLock.lock();
    clearSearchResults();
    
    // change icon
    if ($('searchBtn') != null) $('searchBtn').className = 'HeaderSearchButtonCancel';

    // Search is loading ...
    showSearchStatus();
    setSearchStatus('... Loading ...');

    // Fill parameters
    var p = new Param();
    p.add("methodName","SearchForPatients");
    p.add("searchTypeValue",searchType);
    p.add("searchFilter",filter);
    p.add("fields","PatientId,PtFirstName,PtLastName,PtBirthDateText,Identifier");
    AjaxManager.MakeRequest("POST",searchCallBackURL,p,patientSearchCallBack,true);
    
    // Timeout period of 2 sec
    setTimeout(SearchLock.unlock,2000);
    setTimeout(showSearchResults,500);
    
}

// Populate Results List DOM with Table Node
function populateResults(resultsList,resultsTable)
{
    clearSearchResults();
    resultsList.appendChild(resultsTable);
}

function getResultsList() { return document.getElementById('resultsList'); }

function navigateToPatient(epid, validateDirtyForm) {
    if (validateDirtyForm) {
        // validate date entry progress
        var dataEntryFrame = window.frames['DataEntryFrame'];
        if (dataEntryFrame != null) {
            if (dataEntryFrame.isFormDirty) {
                var isDirty = dataEntryFrame.isFormDirty();
                // check for save method
                if (isDirty && dataEntryFrame.saveAndReload) {
                    var doSave = confirm('You have made changes that have NOT been saved. Do you want to save the form before loading the new patient?');
                    if (doSave) {
                        if(dataEntryFrame.disIsDirty) {
                            dataEntryFrame.disIsDirty();
                        }
                        dataEntryFrame.saveAndReload(epid);
                        return;
                    }
                    // supress any dirty functionality for redirect
                    else if (dataEntryFrame.disIsDirty) {
                        dataEntryFrame.disIsDirty();
                    }
                }
            }
        }
    }
    // If url already contains query params, append extra params
    if(new String(patientRedirectPath).indexOf('?')>-1){ window.top.location = patientRedirectPath + '&findClicked=true&epid=' + epid; }
    // Else create params
    else { window.top.location = patientRedirectPath + '?findClicked=true&epid=' + epid; }
}
// END Search Helpers

// GENERAL HELPERS
function clearChildNodes(nodeId)
{
    var d = document.getElementById(nodeId);
    while(d.childNodes.length>0) { d.removeChild(d.firstChild); }
}

function showHideNode(nodeId,doShow)
{ 
    var n = document.getElementById(nodeId);
    var v = n.style.visibility;
    var p = v=='visible'||v=='hidden'?'visibility':'display';
    if(v==''){ n.style[p]=doShow?'':'none'; } 
    else { n.style[p]=doShow?'visible':'hidden'; }
}
function showFindBubble()
{
    setNodeText('findPatientHelpDesc','Searching by ' + getSearchTypeDesc(getSearchType()));
    showHideNode('FindPatientHelpLayer',true);
}
function hideFindBubble()
{
    showHideNode('FindPatientHelpLayer',false);
}

// Search Results Helpers
function showSearchResults() 
{ 
    showHideNode(resultsBoxId,true);
    // If IE, show helper layer to stop bleeding of selects
 //   if(document.all && window.attachEvent) { showHideNode('SearchCoverLayer',true); }
}

function hideSearchResults() 
{ 
    showHideNode(resultsBoxId,false); 
    // If IE, hide helper layer to stop bleeding of selects
//    if(document.all && window.attachEvent) { showHideNode('SearchCoverLayer',false); }
    
    if ($('searchBtn') != null) $('searchBtn').className = 'HeaderSearchButton';
}

function clearSearchResults() { clearChildNodes('resultsList'); }

//  Search Status Helpers
function setSearchTypeHeader(txt) { setNodeText('searchType',txt); }
function setSearchStatus(txt) { setNodeText('searchStatusText',txt); }
function showSearchStatus(){ showHideNode('searchStatusText',true); }
function hideSearchStatus(){ showHideNode('searchStatusText',false); }

// Search Options Helpers
function showSearchOptions() {
    var searchOptions = document.getElementById('SearchOptions');
    var searchList = document.getElementById('SearchOptionsList');
    var searchListWrapper = document.getElementById('SearchOptionsListWrapper');
    // show options
    showHideNode('SearchOptions', true);
    // adjust height (if needed)
    if (searchList && searchListWrapper) {
        var maxHeight = Math.round(getHeight(window.top) * .75);
        var currentHeight = searchList.offsetHeight;
        var targetHeight = Math.min(currentHeight, maxHeight);
        searchListWrapper.style.height = currentHeight > targetHeight || currentHeight < targetHeight ? targetHeight + 'px' : 'auto';
    }
}
function hideSearchOptions() { showHideNode('SearchOptions',false); }
function getSearchType()
{
    var searchTypeValue = "LastName";
    var l = document.getElementById('SearchOptions').getElementsByTagName('INPUT');
    for(var i=0;i<l.length;i++)
    {
        if(l[i].checked && l[i].name == 'SearchTypeValue'){  return l[i].value; }
    }
    return '';
}
function setSearchType(type)
{
    var l = document.getElementById('SearchOptions').getElementsByTagName('INPUT');
    for(var i=0;i<l.length;i++) 
    {
        if (l[i].value == type) {
            l[i].checked = true;
            if (window.setSearchFieldTextOn) {
                setSearchFieldTextOn();
            }
        }
//        setDescription(getSearchTypeDesc(type));
    }
}
function getSearchTypeDesc(type)
{
    var l = document.getElementById('SearchOptions').getElementsByTagName('INPUT');
    for(var i=0;i<l.length;i++) 
    { 
        if(l[i].value==type) { return l[i].title; }
    }
    return '';
}

function setDescription(txt)
{
    var desc = document.getElementById('SearchOptionDescription');
    desc.firstChild.nodeValue = txt;
}
function setSearchTypeAndDescription(type,desc)
{
    //alert(type + " " + desc);
}

var searchOptionsHash = new Array();

function attachEventsToSearchOptions()
{
    var searchOptions = document.getElementById('SearchOptions');
    if(searchOptions)
    {
        var options = searchOptions.getElementsByTagName('A');
        var mouseOver = function(n) { return function() { n.className='chronListHilighted'; } }
        var mouseOut = function(n) { return function() { n.className=''; } }
        var clickEvent = function(n,r,t,d) 
        { 
            return function() 
            { 
                r.checked = true;
                setSearchTypeAndDescription(t,d); 
            } 
        };
        for(var i=0;i<options.length;i++)
        {
            var option = options[i];
            var radio = option.getElementsByTagName('INPUT')[0];
            var optionText = radio.value;
            var optionDesc = option.title;
            Event.Register('mouseover',option,mouseOver(option),false);
            Event.Register('mouseout',option,mouseOut(option),false);
            Event.Register('click',option,clickEvent(option,radio,optionText,optionDesc),false);
        }
    }
    
}
//Event.Register('load',window,attachEventsToSearchOptions,false);


// HEADER SEARCH from child frame
// Helpers to get and set the textbox used for searching
function setSearchWord(searchId,val) { document.getElementById(searchId).value = val; }
function getSearchWord(searchId) { return document.getElementById(searchId).value; }
        
// Run patient search in header, takes in the search box id, as well as an optional layer to close
// when search completes
function findPatientInHeader(searchId,searchLayer)
{
    var searchFieldValue = getSearchWord(searchId);
    if(searchFieldValue.length>0)
    {
        // Run basic search function registered in header control (Index page)
        //top.runBasicPatientSearch(searchFieldValue);
        // run search by current type
        top.findPatients(searchFieldValue, top.getSearchType());
        // Hide Search Layer
        hideSearchLayer(searchLayer);
        setSearchWord(searchId,'');
    }
    else
    {
        // User cannot enter no value for search
        alert('Please enter a value for the search...');
    }
}

// Hide search layer and signal top search results to hide
function cancelSearch(searchId,searchLayerId)
{
    setSearchWord(searchId,'');
    if(searchLayerId) { hideSearchLayer(searchLayerId); }
    top.hideSearchResults();
}
// Hides optional search Layer after search executed
function hideSearchLayer(searchLayerId) { MM_showHideLayers(searchLayerId,'','hide'); SearchTarget.value = ''; }