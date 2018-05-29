/* START COMBO BOX */
var isPDE = window.location.href.indexOf("PatientDataEntryContainer.aspx")>-1 ? true : false;
var keyCodes = { up:38, down:40, left:37, right:39, enter:13, esc:27, backspace:8, tab:9 };
var LookupRegistry = new Array(),ComboReg = new Array(); 
var throttleSpeed = 100; // ms
var currentCombo;
var ComboMaxCharLength = 30;  // this is used by the function below; in rare situations its value is changed.
var maxComboDropDownWidth = 300;

// Initalizes combo box helper functions
function initalizeComboBox(dropDown,searchField)
{
    if(!dropDown.init)
    {
        dropDown.parentField = searchField;
        dropDown.currentNode = null;
        dropDown.selectNext = function()
        {
            if (this.childNodes != null) 
            { 
                if (this.currentNode) 
                { 
                    this.currentNode.className = "ComboFieldOff";
                    if (this.currentNode.nextSibling) { this.currentNode = this.currentNode.nextSibling; }
                }
                else { this.currentNode = this.firstChild; }
                if (this.currentNode && this.style.visibility == "visible") { this.currentNode.className = "ComboFieldOn"; this.currentNode.focus();  }
                this.scrollToCurrent("down");
            }
        }
        dropDown.selectPrevious = function()
        {
            if (this.childNodes != null) 
            { 
                if (this.currentNode) 
                { 
                    this.currentNode.className = "ComboFieldOff";
                    if (this.currentNode.previousSibling) { this.currentNode = this.currentNode.previousSibling; }
                }
                else { this.currentNode = this.lastChild; }
                if (this.currentNode && this.style.visibility == "visible") { this.currentNode.className = "ComboFieldOn"; this.currentNode.focus(); }
                this.scrollToCurrent("up");
            }
        }
        dropDown.show = function()
        {
            if(!this.helper)
            {
                // Only add iframe helper if browser is IE6 or less
                if(isIE && !isIE7)
                {
                    this.helper = document.createElement("iframe");
                    this.helper.hide = function() { this.style.visibility = 'hidden'; }
                    this.helper.show = function() {  this.style.visibility = 'visible'; }
                    this.helper.className = "ComboBoxResultsFrame";
                    this.helper.style.zIndex = "999";
                    this.parentNode.appendChild(this.helper);
                }
            }
            
            /* START - COMBO BOX FORMATTING */
            // Variables to help in placing combo
            var disToPageLeft = getLeftPos(this.parentField);
            var disToPageTop = getTopPos(this.parentField);
            var comboWidth = this.offsetWidth;
            var fieldWidth = this.parentField.offsetWidth;
            var totalWidth = fieldWidth + disToPageLeft;
            var comboLeft = disToPageLeft;
            if(isPDE)
            {
                var containerWidth = document.getElementById("PDFormDiv").offsetWidth;
                if(comboWidth + disToPageLeft > containerWidth)
                {
                    comboLeft = totalWidth - comboWidth;
                }
            }
            // Set styles on combo boxes (div)
            this.style.left = comboLeft + "px";
            this.style.top = disToPageTop + 19 + "px";
            this.style.visibility = "visible";
            
            // Set styles on iframe helper (IE), match parent div (combobox)
            if(this.helper)
            {
                this.helper.show();
                // These values are set inline or inhetited from style sheet
                // otherwise may need offsetWidth
                this.helper.style.width = this.offsetWidth + "px"; 
                this.helper.style.height = this.offsetHeight + "px"; 
                this.helper.style.left = this.style.left;
                this.helper.style.top = this.style.top;
            }
            
            /* END - COMBO BOX FORMATTING */
            
            var inList = false;
            for(var c in ComboReg)
            {
                if (ComboReg[c] == this)
                {
                    inList = true;
                }
            }
            if (!inList) { ComboReg.push(this); }         
        }
        dropDown.hide = function()
        {
            if(this.helper) { this.helper.hide(); }
            this.style.visibility = "hidden";
        }
        dropDown.scrollToCurrent = function(dir)       
        {
            if (this.currentNode)
            {
                var nodeIndex = this.currentNode.index;
                if(nodeIndex>10)
                {
                    // Adjust for wrap-around nodes
                    var adjust = this.currentNode.innerHTML.length > 35 ? 2 : 1;
                    this.scrollTop = nodeIndex == 13 ? 110 : (dir == "down" ? this.scrollTop + 14*adjust : this.scrollTop - 14*adjust);
                }
                else
                {
                    this.scrollTop = 0;
                }
            }
        }
        dropDown.onmouseout = function(e) { if (isMouseLeave(this,e ? e : event)) { this.hide(); }; }
        dropDown.init = true;
    }
}

function fetchResults(evt,searchFieldId,lkpCode,isDistinct,alwaysDynamic, showDesc, dataSource)
{  
    var search = document.getElementById(searchFieldId);
    var results = document.getElementById(searchFieldId + 'drop_down');
    var searchTerm = search.value;
    initalizeComboBox(results,search);
    
    // set optional static data source
    if(dataSource && results.DS == null) {
        updateResults(dataSource, search, results, showDesc);
        currentCombo = results;
    }
    
    if (currentCombo != results) { currentCombo = results; results.DS = null; }
    switch (evt.keyCode)
    {
        case keyCodes.down: 
        {
            if(results.DS) { results.show(); results.selectNext(); search.focus(); }
            else { getSearchResults(search,results,lkpCode,isDistinct); }
            break; 
        }
        case keyCodes.up: 
        { 
            if(results.DS) { results.show(); results.selectPrevious(); search.focus(); }
            else { getSearchResults(search,results,lkpCode,isDistinct); }
            break; 
         }
        case keyCodes.esc: { results.hide(); break; }
        case keyCodes.tab: { break;}
        case keyCodes.enter:
        {
            if (results.currentNode != null) 
            { 
                search.value = results.currentNode.code;
                //if(results.currentNode.desc) { setTherapyType(results.currentNode.desc); }
            }
            results.hide();
            stopBubble(evt);
            return false;
            break;
        }
               
        default:
        {
            getSearchResults(search,results,lkpCode,isDistinct);
            results.currentNode = null;
            break;
        }
    }    
}

function getSearchResults(searchDOM,resultsDOM,lkpCode,isDistinct,alwaysDynamic)
{
    var searchTerm = searchDOM.value;
    var staticResultsFp = curry(getStaticResults,resultsDOM,searchTerm);
    var dynamicResultsFp = curry(getDynamicResults,searchDOM,resultsDOM,lkpCode,isDistinct);
    if (resultsDOM.lastRequest) { clearTimeout(resultsDOM.lastRequest); }
    if (resultsDOM.DS && !alwaysDynamic) { resultsDOM.lastRequest = setTimeout(staticResultsFp,throttleSpeed); }
    else if(searchTerm.length<2) { resultsDOM.lastRequest = setTimeout(dynamicResultsFp,throttleSpeed); }
}

// Handle tab, enter, and esc cases
function handleSpecialKeys(evt,searchId)
{
    var results = document.getElementById(searchId + 'drop_down');
    var search = document.getElementById(searchId);
    initalizeComboBox(results,search);
    if (evt.keyCode == keyCodes.tab) { results.hide(); }
    if (evt.keyCode == keyCodes.enter || evt.keyCode == keyCodes.esc) {  stopBubble(evt); }
}

function showResultsDropDown(evt,searchFieldId,lkpField,isDistinct,alwaysDynamic, showDesc, dataSource)
{
    var search = document.getElementById(searchFieldId);
    var results = document.getElementById(searchFieldId + "drop_down");
    
    // Signal that field is simulated readonly combo if dropdown image is certain class
    var srcElement = evt.srcElement || evt.target;
    var dropDownImage = srcElement.tagName == 'IMG' ? srcElement : srcElement.nextSibling;
    if(dropDownImage.src.indexOf('icon_select.png') > -1) { search.isReadOnly = true; }
    if(search.disabled) { return false; } // no need to do anything is field is disabled
    if (search.isReadOnly && !search.readOnlyInit) {
        $(search).addEvent('keydown', function(e) {
            // tab out
            if (e.keyCode == keyCodes.tab) {
                HandleComboClose();
            }
            // default key press
            else {
                stopBubble(e);
                return false;
            }
        });
        search.readOnlyInit = true;
    }
    HandleComboClose();
    stopBubble(evt);
    initalizeComboBox(results,search);
    
    // set optional static data source
    if(dataSource) {
        updateResults(dataSource, search, results, showDesc);
        results.style.visibility = "hidden";
    }
    
    search.focus();

    if (results.style.visibility != "visible")
    {
        if(results.DS && results.innerHTML != "" && !alwaysDynamic)
        {
            getStaticResults(results,"");
        }
        else
        {
            var delayfun = curry(getDynamicResults,search,results,lkpField,isDistinct, showDesc);
            results.lastRequest = setTimeout(delayfun,1);
        }
    }
    else
    {
        results.hide();
    }
}
function getComboCallBack(searchDOM,resultsDOM,lkpCode, showDesc)
{
    return function(x)
    {
        if(x != null && x != "")
        {
            eval("var list = " + x + ";");
            if(list.length>0)
            {
                LookupRegistry[lkpCode] = list;
                updateResults(list,searchDOM,resultsDOM, showDesc);
            }
        }  
    }
}
function doComboCallBack(searchDOM,resultsDOM,filter,lkpCode,isDistinct,showDesc)
{
    var callBack = getComboCallBack(searchDOM,resultsDOM,lkpCode,showDesc);
    var isDistinct = isDistinct ? "true" : null;
    var p = new Param();
    p.add("field",lkpCode);
    p.add("search","");
    p.add("isDistinct",isDistinct);
    p.add("methodName","GetLookupCodes");
    AjaxManager.MakeRequest('POST',LOOKCODES_CALLBACK_PATH,p,callBack,true);
}
function getDynamicResults(searchDOM,resultsDOM,lkpCode,isDistinct,showDesc)
{
    var cachedResults = LookupRegistry[lkpCode];
    if(cachedResults) { updateResults(cachedResults,searchDOM,resultsDOM,showDesc); }
    else { doComboCallBack(searchDOM,resultsDOM,"",lkpCode,isDistinct,showDesc); }
}

// NOTE: Need to fix this. Don't need to clear elements, just hide/show.
// Don't always get live results.
// filter current results with filter expression
function getStaticResults(resultsDOM,filter)
{
    if (resultsDOM.DS)
    {
        while(resultsDOM.childNodes.length > 0)
        {
            resultsDOM.removeChild(resultsDOM.firstChild);
        }
        var resultsArr;
        var filteredData = new Array();
        resultsArr = resultsDOM.DS;
        var i = 0;
        while (i < resultsArr.length)
        {   
            var linkNode = resultsArr[i];
            var recordVal = new String(linkNode.innerHTML);
            var recordFilter = new String(filter);
            recordVal = recordVal.toLowerCase();
            recordFilter = recordFilter.toLowerCase();
            if (recordVal.indexOf(recordFilter,0) == 0)
            {
                resultsDOM.appendChild(linkNode);
            }
            i++;
        }
        resultsDOM.show();
    }
}

// Builds Results and Adds Event Handlers
function updateResults(list,searchDOM,resultsDOM,showDesc)
{
	var results = resultsDOM;
	var typed = searchDOM;
	if(list.length > 0)
	{
        resultsDOM.DS = new Array();
        while(results.childNodes.length>0) { results.removeChild(results.firstChild); }
        var linkBase = document.createElement('a');
        var max = ComboMaxCharLength;
        // If we're using dynamic combos, i.e. read only, we need a link to reset the value
        // of the text box, as user's aren't allowed to type or remove values
        // In this case, we will add an empty elment at the top to simulate regular select
        if(typed.isReadOnly)
        {
            var emptyItem = document.createElement('A');
            var emptyTextNode = document.createTextNode('\u00a0');
            emptyItem.appendChild(emptyTextNode);
            emptyItem.onclick = function() {  typed.value = ''; };
            results.appendChild(emptyItem);
            resultsDOM.DS.push(emptyItem);
        }
             
	    for(var i=0;i<list.length;i++) 
	    {   
	        var lkpCodeVal = list[i][0];
	        var lkpDesc = showDesc==true && list[i].length>1 ? list[i][1] : "";
	        var link = linkBase.cloneNode(false);
	        link.index = i;
	        link.code = lkpCodeVal;
	        link.desc = lkpDesc;
	        var txtNode;
	        if(lkpDesc && (lkpDesc != lkpCodeVal)) { txtNode = document.createTextNode(lkpCodeVal + " : " + lkpDesc); }
	        else { txtNode = document.createTextNode(lkpCodeVal); }
	        link.appendChild(txtNode);
	        results.appendChild(link);
           
            link.onmouseover = function() { this.className = "ComboFieldOn"; }
            link.onmouseout = function() { this.className = "ComboFieldOff"; }
            link.onclick = function(event) 
            { 
                if (results.currentNode != null) { results.currentNode.className = "ComboFieldOff"; }
                typed.focus();
                results.currentNode = this;
                results.currentNode.className = "ComboFieldOn";
                typed.value = this.code;
                results.hide();
                //if(this.desc) { setTherapyType(this.desc); }
            }
            link.ondblclick = function(event) 
            { 
                typed.focus();
                results.currentNode = this;
                typed.value = this.code;
                results.hide();
                //if(this.desc) { setTherapyType(this.desc); }
            }
           max = max>txtNode.length ? max : txtNode.length
           resultsDOM.DS.push(link);     
        }
        max = Math.min(max*5,maxComboDropDownWidth);
        if(!results.checkWidth)
        {
            results.inlineWidthSet = results.style.width!='';
            results.checkWidth = true;
        }
        if(!results.inlineWidthSet) { results.style.width= max + "px"; }
        results.show();
    }
    else {  results.hide(); }
}
/* END COMBO BOX */

// NUMBER PAD
var fieldName = "";
var origClientX = 0;
var origClientY = 0;

var padOut	 = "<div onmouseout=\"if (isMouseLeave(this,event)) { closePad('X'); }\"  id=\"numberPad\" style=\"cursor: pointer; visibility:hidden; z-index:+999;position:absolute;\"><table cellpadding=3 cellspacing=1 bgcolor=#CDD4DA >";
//CLOSE BUTTON : padOut		+= "<tr bgcolor=#ffffff><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('1', this);\">&nbsp;1&nbsp;</td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('2', this);\">&nbsp;2&nbsp;</td><td onclick=\"putNum('3', this);\" onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\">&nbsp;3&nbsp;</td><td onclick=\"closePad('X');\" title=\"close number pad\"><IMG height=\"11\" hspace=\"4\" src=\"../../Images/Header/SmallCloseButton.gif\" width=\"11\" border=\"0\"></td></tr>";
padOut		+= "<tr bgcolor=#ffffff><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('1', this);\">&nbsp;1&nbsp;</td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('2', this);\">&nbsp;2&nbsp;</td><td onclick=\"putNum('3', this);\" onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\">&nbsp;3&nbsp;</td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('bs', this);\" title=\"back space\">&nbsp;C&nbsp;</td></tr>";
padOut		+= "<tr bgcolor=#ffffff><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('4', this);\">&nbsp;4</td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('5', this);\">&nbsp;5</td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('6', this);\">&nbsp;6</td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\"  onclick=\"putNum('>', this);\">&nbsp;&gt;&nbsp;</td></tr>";
padOut		+= "<tr bgcolor=#ffffff><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('7', this);\">&nbsp;7</td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('8', this);\">&nbsp;8</td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('9', this);\">&nbsp;9</td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\"  onclick=\"putNum('<', this);\">&nbsp;&lt;&nbsp;</td></tr>";
padOut		+= "<tr bgcolor=#ffffff><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('.', this);\">&nbsp;<strong>.</strong></td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum('0', this);\">&nbsp;0</td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\" onclick=\"putNum(':', this);\">&nbsp;<strong>:</strong></td><td  onmousedown=\"buttonFlash(this, true);\" onmouseup=\"buttonFlash(this, false);\" onmouseout=\"buttonFlash(this, false);\"  onclick=\"putNum('/', this);\">&nbsp;/</td></tr></table></div>";

document.write(padOut);

function showNumPad(evt,formFieldName)
{
	if(document.forms[0].elements[formFieldName] && document.forms[0].elements[formFieldName].disabled == false)
    { 
	    fieldName = formFieldName;
	    origClientX = evt.clientX - 5;
	    origClientY = evt.clientY - 5;
	    var numPad = document.getElementById('numberPad');
	    numPad.style.left = origClientX + "px";
	    numPad.style.top  = origClientY + "px";
	    numPad.style.visibility = 'visible';
	}
}
function closePad(x)
{
	document.getElementById('numberPad').style.visibility = 'hidden';
	var txtField = document.forms[0].elements[fieldName];
	txtField.focus();
	txtField.blur();
	//document.forms[0].elements[fieldName].focus();
	//document.forms[0].elements[fieldName].blur(); // blur to initiate certain JS methods -jf
}
function putNum(number, clickedTableCell)
{
    var txtField = document.forms[0].elements[fieldName];
	if(number == 'bs')
	{	
		var numberString = document.forms[0].elements[fieldName].value;
		var lastDigitIndex = numberString.length - 1;
		var returnString = numberString.substring(0,lastDigitIndex);
		txtField.value = returnString;
	}
	else { txtField.value += number; }
}
function buttonFlash(clickedTableCell, TurnOn) { clickedTableCell.className = TurnOn ? 'NumPadButtonDown' : 'NumPadButtonUp'; }
// END NUMBER PAD

// DATETEXT - DATE HANDLING
function UpdateAssociatedDate(dateTextElement)
{
    dateTextElementId = dateTextElement.id;
    dateFieldId = dateTextElementId.replace('DateText','Date');
    dateDisplayId = dateTextElementId.replace('DateText','DateDisplay');
    dateElement = document.getElementById(dateFieldId);
    dateDisplayElement = document.getElementById(dateDisplayId);
    fuzzyDate(dateTextElement, dateElement);
    if (dateElement && dateDisplayElement) { dateDisplayElement.innerHTML = dateElement.value; }
}
// END DATETEXT - DATE HANDLING

// FUNCTION EVALUATION
function Expand(caller, s)
{
    if (s == 'this') { return caller; }
    else if (s.charAt(0) != '$') { return eval(s); }
    else
    {
        // get the prefix of the caller
        prefix = caller.id.substr(0, caller.id.lastIndexOf('_') + 1);
        // expand s by retrieving the element
        if (s.charAt(1) == '$') { return document.getElementById(prefix + s.substr(2)); }
        // expand s by prepending the prefix to s[1..]
        else { return prefix + s.substr(1); }
    }
}
function Meta(caller, f)
{
    var a = new Array();
    var argsLength = arguments.length - 2;
    for (i = 0; i < argsLength; i++) { a[i] = Expand(caller, arguments[i + 2]); }
    return f.apply(this, a);
}
// END FUNCTION EVALUATION

var thpSel;
var therapyExists = true; // Prevents calling on pages without MedTxType

/* LEGACY (use cascadeParentByChildCode) */
function setTherapyType(t)
{
    if(!thpSel && therapyExists)
    {
        therapyExists = false;
        var dds = document.getElementsByTagName("select");
        for(var i=0;i<dds.length;i++)
        {
            if(dds[i].id) 
            { 
                if(dds[i].id.indexOf('MedTxType')>-1)
                {
                    thpSel = dds[i];
                    therapyExists = true;
                    break;
                }
            }
        }    
    }
    if(thpSel)
    {  
        for(var j=0;j<thpSel.options.length;j++) { thpSel[j].selected=thpSel[j].text==t?true:false; }
    }
}

// sets the value of the target field based on value of source field
// @srcField: the field to check the value againsts
// @targetField: the field to set it's value
// @valueLookup: an array of arrays of length 2 ([[2]]) (e.x., [['key1','value1'], ['key2','value2']]
// @e: (optional) event argument
function setDependentFieldValue(srcField, targetField, valueLookup, e) {
    // get value of source field
    var srcDOM = $(srcField);
    var targetDOM = $(targetField);
    if (srcDOM && targetDOM) {
        var srcValue = getValue(srcDOM);
        // loop though pairs of key/values and if src value == pair value, update target
        for (var i = 0; i < valueLookup.length; i++) {
            var pair = valueLookup[i];
            var key = pair[0];
            var value = pair[1];
            // ignore null and empty values
            if (key != null && key != '' && srcValue.toLowerCase() == key.toLowerCase()) {
                // set target control value from pair value
                setValue(targetDOM, value);
                // end call
                return;
            }
        }
    }
}

//  Fx([['ClinStageDisease','_ctrl1Id'],['ClinStageSystem','_ctrl2Id']],'StageClin_{0}_{n.1}_T') -> 'StageClin_Testis_02_T'
function getDynamicLookupCode(lkpCode,observedFieldIdList,lkpFormatString)
{
    // If a lookup format was provided, replace values in format string
    // with observerd fields values
    if(lkpFormatString.indexOf('{')>-1)
    {
        for(var index in observedFieldIdList)
        {
            var field = observedFieldIdList[index][0];
            var id = observedFieldIdList[index][1];
            var observedNode = document.getElementById(id);
            var observedValue = getValue(observedNode);
            if(lkpFormatString.indexOf("{" + index + "}")>-1)
            {
                lkpFormatString = lkpFormatString.replace("{" + index + "}",observedValue);
            }
            else if (lkpFormatString.indexOf("{n." + index + "}")>-1)
            {
                if(observedValue.length>2)
                {
                    var newVal = observedValue.substr(observedValue.length-2); // extract last 2 chars
                    lkpFormatString = lkpFormatString.replace("{n." + index + "}",newVal);
                }
            }
            else if (lkpFormatString.indexOf("{n." + index + ".extract") > -1) {
                // extract up to the specified length of characters of the observed value after last '_' character  (instead using just last 2 characters)
                //  i.e.  If disease = 'Esophagus', system = 'AJCC_AEGI'
                //        StageClin_{0}_{n.1.extract2}_T -> StageClin_Esophagus_GI_T
                //        StageClin_{0}_{n.1.extract4}_T -> StageClin_Esophagus_AEGI_T
                //        StageClin_{0}_{n.1.extract8}_T -> StageClin_Esophagus_AEGI_T
                var extractValue = lkpFormatString.substr(lkpFormatString.indexOf("extract") + 7);
                extractValue = extractValue.substr(0, extractValue.lastIndexOf("}"));
                var extractNum = parseInt(extractValue);
                if (!isNaN(extractNum)) {

                    var newVal;
                    var valueAfterLastUnderscore = observedValue.substr(observedValue.lastIndexOf("_") + 1, observedValue.length - observedValue.lastIndexOf("_"));

                    // if the valueAfterLastUnderscore is less than the extraction value, use the whole valueAfterLastUnderscore
                    if (valueAfterLastUnderscore.length < extractNum) {
                        newVal = valueAfterLastUnderscore;
                    }
                    // extract specified number of max chars
                    else {
                        newVal = valueAfterLastUnderscore.substr(valueAfterLastUnderscore.length - extractNum);
                    }
                    lkpFormatString = lkpFormatString.replace("{n." + index + ".extract" + extractNum + "}", newVal);
                }
            } 
        }
        lkpFormatString = lkpFormatString.replace(/ /g, "");
        return lkpFormatString;
    }
    // Otherwire, return a specially formatted lookupcode to be parsed on server
    else
    {
        // Single item should be in list if not using dynamic format string
        var field = observedFieldIdList[0][0];
        var id = observedFieldIdList[0][1];
        var observedNode = document.getElementById(id);
        var observedValue = getValue(observedNode);
        var spcLkpCode = lkpCode + ';' + lkpFormatString + ';' + observedValue;
        return spcLkpCode;
    }
}

/* Cascade based on parent/child codes */

// selected the value of the parent field based on the selected child field value
// @childFieldId: the id or DOM refernce of the child field
// @parentFieldId: the id or DOM reference of the parent field
// @childLkpField: the lookup code name of the child field
// @parentLkpField: the lookup code name of the parent field
function cascadeParentByChildCode(childFieldId, parentFieldId, childLkpField, parentLkpField) {
    var childFieldDOM = $(childFieldId);
    var parentFieldDOM = $(parentFieldId);
    var childLkpCode = getValue(childFieldDOM);
    // get from cache (if it exists, use cache value)
    var cacheValue = getParentByChildCodeCache(childLkpField, childLkpCode, parentLkpField);
    if (cacheValue != null) {
        setValue(parentFieldDOM, cacheValue);
        return;
    }
    // callback function which fetches remote parent code
    var _doCascadeParentByChildCode = function() {
        // get live value
        var childLkpCode = getValue(childFieldDOM);
        // when call returns, set value based on return value
        var callBack = function(response) {
            // set cache
            setParentByChildCodeCache(childLkpField, childLkpCode, parentLkpField, response);
            // set parent field
            setValue(parentFieldDOM, response);
        };
        // make ajax request
        var ajaxParams = new Param();
        ajaxParams.add("childLkpField", childLkpField);
        ajaxParams.add("childLkpCode", childLkpCode);
        ajaxParams.add("parentLkpField", parentLkpField);
        ajaxParams.add("methodName", "GetParentCodeByChildCode");
        AjaxManager.MakeRequest('POST', LOOKCODES_CALLBACK_PATH, ajaxParams, callBack, true);
    };
    // if call invoked from blur event, delay call
    if (true) { // window.event && window.event.type == 'blur') {
        setTimeout(_doCascadeParentByChildCode, 250);
    }
    // otherwise call immediately
    else {
        _doCascadeParentByChildCode();
    }
}

/* PARENT/CHILD caching helpers */
var PARENT_CHILD_LOOKUP_CACHE = { };

function setParentByChildCodeCache(childLkpField, childLkpCode, parentLkpField, parentLkpCode) {
    if (PARENT_CHILD_LOOKUP_CACHE[parentLkpField] == null) {
        PARENT_CHILD_LOOKUP_CACHE[parentLkpField] = new Object();
    }
    var parentCache = PARENT_CHILD_LOOKUP_CACHE[parentLkpField];
    if (parentCache[childLkpField] == null) {
        parentCache[childLkpField] = new Object();
    }
    var childCache = parentCache[childLkpField];
    if (childCache[childLkpCode] == null) {
        childCache[childLkpCode] = parentLkpCode;
    }
}

function getParentByChildCodeCache(childLkpField, childLkpCode, parentLkpField) {
    if (PARENT_CHILD_LOOKUP_CACHE[parentLkpField]) {
        if (PARENT_CHILD_LOOKUP_CACHE[parentLkpField][childLkpField]) {
            if (PARENT_CHILD_LOOKUP_CACHE[parentLkpField][childLkpField][childLkpCode]) {
                return PARENT_CHILD_LOOKUP_CACHE[parentLkpField][childLkpField][childLkpCode];
            }
        }
    }
    return null;
}

function HandleComboClose() { for (var c in ComboReg) { ComboReg[c].hide(); } }
Event.Register('click',document.body,HandleComboClose,false);