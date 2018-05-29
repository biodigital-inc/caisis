function isChild(node,child) { return node == null || child == null ? false : node == child ? true : child.parentNode ? isChild(node,child.parentNode) : false; }
function isMouseLeave(ele,evt) { return ele.contains && evt.toElement ? !ele.contains(evt.toElement) : !isChild(ele,evt.relatedTarget); }
function isMouseEnter(ele,evt) { return ele.contains && evt.fromElement ? !ele.contains(evt.fromElement) : !isChild(ele,evt.relatedTarget); }

var menuLoaded = false;
var isIE = window.attachEvent && document.all && !window.opera;
var navRoot;
var OpenIdReg = new Array();
var menuOpenDelay = 500;
var menuCloseDelay = 500;

InitMenu = function () 
{
    if ( (navRoot = document.getElementById("menu")) && !menuLoaded) 
    { 
        var menuItems = navRoot.getElementsByTagName('li'); // Get all li in "menu"
        if(menuItems.length>0) { addEventsToNodes(menuItems); }
        menuLoaded = true;
    }
}

function addEventsToNodes(menuItemList)
{ 
    for(var i=0;i<menuItemList.length;i++)
    {
        var item = menuItemList[i];
        var childMenu;
        if( (childMenu = item.getElementsByTagName('ul')[0]) || item.parentNode == navRoot)
        {
            item.myRefClass = item.parentNode == navRoot ? " top_item_hover" : " sub_item_hover";           
            item.open = openSlow;
            item.openMe = openFast;
            item.close = closeSlow;
            item.closeMe = closeFast;

            if(isIE)
            {
                item.onmouseenter = function() { this.open(); }
                item.onmouseleave = function() { if(isTopTarget(this,event)) this.closeMe(); else this.close(); }   
            }
            else
            {
                item.onmouseover = function(evt) { if(isMouseEnter(this,evt)) { this.open(); }  }
                item.onmouseout = function(evt) 
                { 
                    if(isMouseLeave(this,evt)) { if(isTopTarget(this,evt)) this.closeMe(); else  this.close(); }  
                }
            }
        }
    }     
}

// Returns if one of the top items is moused over
function isTopTarget(node,evt)
{
    var target = evt.relatedTarget || evt.toElement;
    if(target) {  return (target.parentNode == navRoot || target.parentNode.parentNode == navRoot); }
    else { true; }
}

function openSlow()
{
    while(OpenIdReg.length>0) { clearTimeout(OpenIdReg.shift()); }
    if(this.closeId)
    {
        clearTimeout(this.closeId);
        this.closeId = null;
    }
     var refNode = this;
     var delay = refNode.parentNode == navRoot ? 0 : menuOpenDelay;
     if(delay == 0)
     {
        this.openMe();
     }
     else
     {
        var openTimeoutId = setTimeout(function() { refNode.openMe(); },delay);
        this.openId = openTimeoutId;
        OpenIdReg.push(openTimeoutId);
     }
}

function openFast()
{
    this.className = this.myRefClass;
}

function closeSlow()
{
    var ref = this;
    if(this.openId) { clearTimeout(this.openId); this.openId = null; }
    this.closeId = setTimeout(function() { ref.closeMe(); } ,menuCloseDelay);
}

function closeFast()
{
    if(this.parentNode == navRoot)
    {
        var ul = this.getElementsByTagName('ul')[0];
        if(ul) { if(ul.subMenu) { ul.subMenu.clear(); ul.subMenu.hide(); } }
    }
    this.className = "";
}

function menuDisplayHelper(idx,dom,isOpen) 
{
    var c = dom.childNodes,i = dom.childNodes.length;
    while(i--) {  if (i == idx) { isOpen ? c[i].openMe() : c[i].closeMe(); break; }   }
} 
function showMenu(index,menuDOM){ menuDisplayHelper(index,menuDOM,true); }
function hideMenu(index,menuDOM) { menuDisplayHelper(index,menuDOM,false); }

if(window.attachEvent && document.all) { window.attachEvent("onload", InitMenu); } else { window.addEventListener("load",InitMenu,false); }
if(window.attachEvent && document.all) { window.attachEvent("onunload", InitMenu); } else { window.addEventListener("unload",InitMenu,false); }

function adjustMenuForBrowser()
{
    var b = navigator.userAgent.toUpperCase()
    if (b.indexOf("SAFARI") > -1) // necessary because Safari places events on the text of list items, and does not include the padding
    {
        document.write('<style>#menu li {padding-bottom: 0px;}</style>');
        
    }
    
}
adjustMenuForBrowser();