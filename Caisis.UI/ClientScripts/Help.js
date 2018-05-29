followCursor=false
var hideTimer

var bubbleDirection = "down";
var flipY = 100;

var pathString = document.location.pathname;
var isWorkflowPage = pathString.indexOf("Workflows")	
	if (isWorkflowPage >= 0)
	{
		flipY = 180;
	}

function checkBrowser(){
	this.ver=navigator.appVersion;
	this.userAgent=navigator.userAgent;
	this.dom=document.getElementById?1:0
	this.ie5=(this.ver.indexOf("MSIE 5")>-1 && this.dom)?1:0;
	this.ie6=(this.ver.indexOf("MSIE 6")>-1 && this.dom)?1:0;
	this.ie7=(this.ver.indexOf("MSIE 7")>-1 && this.dom)?1:0;
	this.ie8=(this.ver.indexOf("MSIE 8")>-1 && this.dom)?1:0;
	this.ie4=(document.all && !this.dom)?1:0;
	this.ns5=(this.dom && parseInt(this.ver) >= 5) ?1:0;
	this.ns4=(document.layers && !this.dom)?1:0;
	this.bw=(this.ie5 || this.ie4 || this.ns4 || this.ns5)
	this.mozilla=(this.userAgent.indexOf("Mozilla")>-1 && this.dom)?1:0;
	return this
}

bw=new checkBrowser()
fromLeft=-108; // div distance from left
fromTop=-235;// div distance from top
if (bw.ie4 || bw.ie5 || bw.ie6 || bw.ie7 || bw.ie8)
{
	fromLeft=-108;
	fromTop=-205;
}
	
var sPath = window.location.pathname;
var sPage = sPath.substring(sPath.lastIndexOf('\\') + 1);
//var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);

// check and see if the current page is in the workflow section or not.  
// if so, adjust position of the help bubble.  clean this up later.
var isClinicFormWorkflow = sPage.indexOf('WorkFlowContainer',0);
var isRptWorkflow = sPage.indexOf('RPT',0);
var isAddPhysician = sPage.indexOf('Physician',0);
var isAddPatient = sPage.indexOf('AddNewPatients',0);
var isAddProtocol = sPage.indexOf('AddAProtocol',0);
var isEditAProtocol = sPage.indexOf('EditAProtocol',0);
var isFormsContainer = sPage.indexOf('FormsContainer',0);
var isReportContainer = sPage.indexOf('ReportsContainer',0);
var isSeedInventoryContainer = sPage.indexOf('SeedInventoryContainer',0);
var isAddOnModule = sPath.indexOf('/Modules/',0);
var isProtocolMgrBuildItem = sPath.indexOf('ProtocolMgr/BuildItem',0);
var isEForm = sPath.indexOf('Core/Eforms',0);
var isPatientListContent = sPath.indexOf('PatListContent',0);


if (isClinicFormWorkflow != -1)
	{
		fromLeft=-570;
		fromTop=-305;
	}
	else if (isProtocolMgrBuildItem != -1)
	{
		fromLeft=-85;
		fromTop=-100;
	}
	else if (isPatientListContent != -1)
	{
		fromLeft = fromLeft -190;
		fromTop = fromTop - 120;
	}	
	
	
	
function cursorInit(){
	oCursor=new makeCursorObj('helpLayer')
	scrolled="document.getElementById('PDFormDiv').scrollTop"
	//if(bw.ns4)document.captureEvents(Event.MOUSEMOVE)
	//document.onmousemove = move;
	if (window.document.addEventListener) {
	    window.document.addEventListener('mousemove', move, true);
	}
	else if (window.document.attachEvent) {
	    window.document.attachEvent('onmousemove', move);
	}
}

function makeCursorObj(obj,nest){
	nest=(!nest) ? '':'document.'+nest+'.'										
   	this.css=bw.dom? document.getElementById(obj).style:bw.ie4?document.all[obj].style:bw.ns4?eval(nest+"document.layers." +obj):0;														
	this.moveIt=b_moveIt; 																	
	return this
}
function b_moveIt(x,y){this.x=x; this.y=y; this.css.left=(this.x + 'px'); this.css.top=(this.y + 'px')}

function move(e) {
    var pdDiv = document.getElementById('PDFormDiv');
    x = e.pageX != null ? e.pageX : event.x
    y = e.pageY != null ? e.pageY : event.y

    // adjust top/down and left/right scrolling
    if (pdDiv) {
        y = y + pdDiv.scrollTop;
        x = x + pdDiv.scrollLeft + 100;
    }
    //if statement active when cursor is close to the top
    if (y < flipY) {
        y = y + 220;
        pointBubbleDown();
    }
    else {
        pointBubbleUp();
        if (overSubform)
        {
            y = y + jQuery('.PatientDataSubformTabContainer').first().position().top + 40;
            x = x + jQuery('.PatientDataSubformTabContainer').first().position().left;
            
//          if (bw.mozilla){y = y - 200;}
            
        }
        y = y + 90;
    }

    if (followCursor == true) oCursor.moveIt(x + fromLeft, y + fromTop)
}
onload=cursorInit;


function setHelpText(fieldName) {
	document.getElementById('helpShortDesc').innerHTML=helpArray[fieldName];
}


function showToolTip(fieldName) {
	clearTimeout(hideTimer);
	followCursor=true;
	setHelpText(fieldName);
	MM_showHideLayers('helpLayer','','show');
}

function showToolTipMessage(msg) {
    if (msg.length > 0) {
	    clearTimeout(hideTimer);
	    followCursor=true;
	    document.getElementById('helpShortDesc').innerHTML = msg;
	    MM_showHideLayers('helpLayer','','show');
	}
}

function hideToolTip(){
	followCursor=false;
  	MM_showHideLayers('helpLayer','','hide');
// 	hideTimer=setTimeout("MM_showHideLayers('helpLayer','','hide')", 2000);
	oCursor.moveIt(-300,-300)
}


function pointBubbleDown()
{
	if (bubbleDirection == 'up')
	{
	    document.getElementById('helpLayerInnerContainer').className = '';
		document.getElementById('helpBubbleTopContainer').className = 'HelpBubbleTopPointer';
		document.getElementById('helpBubbleBottomContainer').className = 'HelpBubbleBottom';
		bubbleDirection = 'down';
	}
}

function pointBubbleUp()
{
	if (bubbleDirection == 'down')
	{
	    document.getElementById('helpLayerInnerContainer').className = 'flipped';
		document.getElementById('helpBubbleTopContainer').className = 'HelpBubbleTop';
		document.getElementById('helpBubbleBottomContainer').className = 'HelpBubbleBottomPointer';
		bubbleDirection = 'up';
	}

}



// subform compensation
var overSubform = false;