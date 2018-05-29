/*
// EXTEND NATIVE OBJECTS
*/
function handleCase(s,c) { return (c!=null?c:true) ? s : s.toLowerCase() }
String.prototype.equals = function()
{
    var expr = false;
    for(var i=0;i<arguments.length;i++) { expr = expr || (this==arguments[i]); }
    return expr;
}
String.prototype.startsWith = function(s,c) { return handleCase(this,c).indexOf(handleCase(s,c),0)==0; }
String.prototype.endsWith = function(s,c) { return handleCase(this,c).lastIndexOf(handleCase(s,c))==(this.length-s.length); }
String.prototype.contains = function(s,c) { return handleCase(this,c).indexOf(handleCase(s,c))>-1; }

/*
// ESSENTIALS
*/

// Provide and empty function used in vaious places to initalize objects and
function EMPTY() { }

// Currying function used for creating closures
// sample:  function add(a,b) { return a+b; }
// curried: var add3 = curry(add,3); -> function(b) { return 3+b; }
//          var answer = add3(4); // answer = 7
function curry(f)
{
    var curried = new Array();
    for(var i=1;i<arguments.length;i++) { curried.push(arguments[i]); }
    return function() 
    {            
        var args = new Array();
        for(var i=0;i<curried.length;i++) { args.push(curried[i]); }
        for(var i=0;i<arguments.length;i++) { args.push(arguments[i]); } 
        return f.apply(null,args);
    }
}

/*
// GLOABALS
*/
var ErrorLog = 
{
    log : new String(), 
    write : function(val) { this.log+=val; },
    view : function() { alert(this.log); }
}
self.onerror = function() { return true; }
var isIE = (window.attachEvent && document.all)!=null;
var isIE7 = isIE && document.documentElement && typeof(document.documentElement.style.maxHeight)!="undefined";
var isDOM = !isIE && !isIE7 && (window.XMLHttpRequest!=null);

// BROWSER (i.e., top most window)
var Browser = window.top;
Browser.Resize = function(x,y) { Browser.resizeTo(x,y); }
// Resize an element
Browser.ResizeElement = function(list)
{
    for(var i=0;i<arguments.length;i++)
    {
        var config = arguments[i];
        // Context will default to current window object, unless specified
        var ctx = config.context ? config.context : window;
        if(!ctx.ResizeQueue)
        {
            ctx.ResizeQueue = new Array();
            ctx.ResizeQueue.Execute = function() { ForEach(this,function(x){x();},this); }
        }
        // Base configuration for resizing events
        var configBase = { context: ctx, nodeId: null, node: null, wait: null, onload: true, onresize: true, width: null, height: null, widthOffset: null, heightOffset: null, customResizer: null  }
        // Copy values from user config
        for(var k in config) { configBase[k] = config[k]; }
        // Create a closed function for executing resizing
        var closedFun = function(win,k)
        {
            return function()
            {
                var w = getWidth(Browser);
                var h = getHeight(Browser);
                var n = k.node || k.nodeId ?  $(k.node ?  k.node : k.nodeId,win) : null;
                if(k.customResizer) { k.customResizer.call(win,w,h); }
                else
                {
                    if(k.width && n) { n.setWidth(k.width); }
                    else if(k.widthOffset && n) { n.setWidth(w - k.widthOffset); }
                    if(k.height && n) { n.setHeight(k.height); }
                    else if(k.heightOffset && n) { n.setHeight(h - k.heightOffset); }
                }
            }
        }
        var fp = closedFun(ctx,configBase);
        // Choose to resize elements when it is loaded
        if(configBase['onload'] || configBase['wait']) 
        { 
            // When page loaded resize elements
            Event.Register('load',ctx,fp,false);
            // Wait for page to load unless wait property specified
            configBase['wait'] = configBase['wait']==null ? true : configBase['wait'];
        }
        // Event will fire when browser is resized (i.e., will fire event for each window/frame)
        if(configBase['onresize']){ ctx.ResizeQueue.push(fp); }
        // If wait is false or null, attempt to execute resizing immediately
        if(!configBase['wait']) { try { fp(); } catch (e) { ErrorLog.write(e); } }
    }
}
// Resize an iframe/window
Browser.ResizeFrame = function(config)
{
    var context = config.context ? config.context : window;
    var frame;
    if(context.parent!=context)
    {
        var frames = context.parent.document.getElementsByTagName('iframe');
        for(var j=0;j<frames.length;j++) { if(frames[j].contentWindow == context) { frame = frames[j]; break; } }
    }
    if(frame)
    {
        config.context = context;
        config.node = frame;
        Browser.ResizeElement(config); 
    }
}
// Runs the list of items to be resized, called automatically on browser resize
Browser.RunResizeQueue = function(win)
{
    win = win.frames ? win : Browser;
    if(win.ResizeQueue) { win.ResizeQueue.Execute(); }
    if(win.frames) { ForEach(win.frames,Browser.RunResizeQueue,win); }
}

// Takes a window object and returns the reference to iframe object containing window, else null
function getIframeByWindow(win)
{
    var iframeNode = null;
    var iframes = win.parent.document.getElementsByTagName('IFRAME');
    for(var i=0;i<iframes.length;i++)
    {
        if(win==iframes[i].contentWindow) { iframeNode = iframes[i]; break; }
    }
    return iframeNode;
}

// returns a string representation of the full path to the window (@win) object from top level window (window.top)
// ex: getWindowPath(innerWindow) -> 'window.frames[0].frames[1]'
// @win: a window object
function getWindowPath(win) {
    var path = new Array();
    while (win != window.top) {
        var p = win.parent;
        for (var i = 0; i < p.frames.length; i++) {
            if (p.frames[i] == win) {
                path.unshift('.frames[' + i + ']');
                win = p;
                break;
            }
        }
    }
    var windowPath = 'window.top' + path.join('');
    return windowPath;
}

// temp fix
function showHideHelper() { }

/*
// MASTER FUNCTION
// Wraps a node with various helper functions
// n: dom node,dom node id, window object, document object
// c: optional context, i.e.,window object, defaults to current window object
*/
function $(n,c) 
{
    // Return object if already wrapped with helper functions
    var creator = curry(createNode);
    if(n && n.nodeName && n.document==null && n.nodeName!= 'IFRAME' && n._wraperInit && false) { return n; }
    else if(n==null)
    {
        var o = new Object();
        o.create = creator;
        return o;
    }
    var w = c && typeof(c) != typeof('') && c.document ? c : window;
    n = typeof(n)==typeof('') ? w.document.getElementById(n) : n;
    if(n==null) { return n; }
    var nn=n.nodeName;
    var o=n.options;
    n.create = creator;
    // Enable/Disable
    n.enable = curry(enableField,n);
    n.disable = curry(disableField,n);
    n.hasProp = function(props) { for(var i=0;i<arguments.length;i++) { if(n[arguments[i]]==null) return false; } return true; }
    n.set = function(field,list) { for(var key in list) {alert(field + ' ' + key + ' ' + list[key]); n[field][key] = list[key]; } }
    // Style Based Properties
    if(n.style)
    {
        n.css = function()
        {
            var a = arguments;
            if(a.length==0) 
            {
                var clsName = new String(n.className);
                return clsName; 
            }
            else if(a.length==1) 
            {
                if(typeof(a[0])==typeof(new Object())) { for(var k in a[0]) { n.css(k,a[0][k]); } }
                else { n.className = a[0]; }
            }
            else if (a.length==2) { n.style[a[0]]=a[1]; }
        }
        n.css.swap = function(a1,a2,a3) 
        { 
            if(arguments.length==2) { n.css(n.css().equals(a1)?a2:a1); }
            else if(arguments.length==3) { n.css(a1,n.style[a2]?a3:a2); }
        }
        // Centers node in center of window or optional container
        n.centerWidth = curry(centerNodeHorizontally,n);
        n.centerHeight = curry(centerNodeVertically,n);
        n.center = curry(centerNode,n);
        n.setStyle = function(k,v) { n.css(k,v); };
        n.setWidth = function(v) { if(v>-1) { n.css('width',v+'px'); } };
        n.setHeight = function(v) { if(v>-1) { n.css('height',v+'px'); } };
        n.show = curry(setNodeVisibility,n,'visible','');
        n.hide = curry(setNodeVisibility,n,'hidden','none');
        n.display = function(d) { n.css('display',d); }
        n.isVisible = curry(isNodeVisible,n);
        n.isHidden = curry(isNodeHidden,n);
    }
    // Visibility Helpers
    n.setText = curry(setNodeText,n);
    n.resize = function(w,h) { if(w && w>=0) { n.setWidth(w); } if(h && h>=0) { n.setHeight(h); } };
    n.setTransparency = curry(setNodeTransparency,n);
    try {
        if (n.clear == null) {
            n.clear = curry(clearChildren, n);
        }
    }
    catch (ex) {
    }
    n.append = function(l) { for(var i=0;i<arguments.length;i++) { n.appendChild(arguments[i]); } };
    
    // Handle case for input fields
    n._isFieldDirty = curry(isFieldDirty,n);
    n.foreach = function(enu,fun,ctx) { enu = typeof(enu)==typeof('') ? n[enu] : enu; ForEach(enu,fun,ctx); }
    n.getByTag = function(tag) { return $$(tag,n); }
    n.tag = function(t) { return $$(t,n); }
    
    // Event Wrappers
    n.addEvent = curry(addEventToNode,n);
    n.addEvents = function(e,l,b) { ForEach(l,function(f) { n.addEvent(e,f,b); } ); }
    n.removeEvent = curry(removeEventFromNode,n);
    n.removeEvents = function(e,l,c) { ForEach(l,function(f) { n.removeEvent(e,f,c); } ); }
    n.mouseEnter = curry(isMouseEnter,n);
    n.mouseLeave = curry(isMouseLeave, n);
    n.isTarget = function(e) { return e.srcElement || e.target;  } 
    
    n._wraperInit = true;
    return n; 
}
// Returns a list of elements filtered by tag and optional selectors
// $$('TABLE',document) - get all table elements in document
// $$('>TABLE',document) - all table elements which are direct children of the document(body)
// $$('*TABLE',document) - get all grandchildren(not child) table elements in document
function $$(tag,node) 
{
    // Strip out >,*,.(class selctor)
    var sel = tag.replace('> ','').replace('* ','').substr(0,( tag.indexOf('.')>-1?tag.indexOf('.') : tag.length)).toUpperCase();
    var list = (node?node:document).getElementsByTagName(sel);
    var returnList = new Array();
    var expr = tag.split(".")[1] ? (".className=='" + tag.split('.')[1]+ "'") : null;
    expr = expr == null ? ( tag.startsWith('>') ? '.parentNode==node' : (tag.startsWith('*') ? '.parentNode!=node' : null) ) : expr;
    expr = expr ? ('item' + expr) : 'true';
    for(var i=0;i<list.length;i++)
    {
        var item = list[i];
        if(eval(expr)) { returnList.push(item); }
    }
    returnList.foreach = function(f,c) { ForEach(returnList,f,c||this); } 
    returnList.map = function(f,c,n) { return Map(returnList,f,c||this,n); } 
    returnList.foreach(function(n) { n = $(n); } );
    return returnList;
}
function getNodesHelper(container) { return function(tag) { return container.getElementsByTagName(tag); } }
function getNodesByTag(tag) { return $$(tag); }
function clearChildren(n) { while(n.childNodes.length > 0) n.removeChild(n.firstChild); }

/* LISTS */
// Returns a special array which can be iterated
// a: an array of items
// fx: a function to apply to each item in array "a"
// sc: (optional) the scope of execution, default "this"
// useNull: (optional) if null values from function "fx" are returned, default true
function Map(a,fx,sc,useNull) 
{ 
    var map = new Array(),scope=sc||this;
    map.toBool = function(expr) { return eval(this.join(expr)); }
    map.foreach = curry(Map,map);
    for(var i=0;i<a.length;i++) 
    {
        var item = a[i].ownerDocument ? $(a[i]) : a[i];
        var returnVal = fx.call(scope,item,i);
        if(returnVal != null || (useNull==true || useNull == null)) { map.push(returnVal); }
    }  
    return map;
}

// Same as Map, without explicit return map/array 
var ForEach = Map;

function HelperArray(arr)
{
    this._a = arr || new Array();
    this.getLength = function() { return this._a.length; }
    this.add = function(v){ this._a.push(v); };
    this.remove = function(v){ var i; if((i=this.find(v))>-1) { this._a.splice(i,1); } };
    this.find = function(v){ for(var i=0;i<this._a.length;i++) { if(this._a[i]==v) return i; } return -1; };
    this.contains = function(v) { return this.find(v)>-1; }
    this.isEmpty = function() { return this._a.length==0; }
    this.clear = function() { while(this._a.shift()); };
    this.foreach = function(f) { ForEach(this._a,f,this); };
    this.map = function(f) { return Map(this._a,f,this); };
}

function Lock()
{
    this._lockState = false;
    this.lock = function() { this._lockState = true; };
    this.unlock = function() { this._lockState = false; };
    this.isLocked = function() { return this._lockState; };
}

/* EVENTS */

// Note: In Internet Explore, 'this' used in event hadler refers to window object, not attaching object
function addEventToNode(node,en,eh,doBubble)
{
    doBubble=doBubble!=null?doBubble:false;
    var eHandler;
    var sHandler = en=='mouseleave' ? ['mouseout',isMouseLeave] : (en=='mouseenter' ? ['mouseover',isMouseEnter] : null);
    if(sHandler)
    {
        var anon = function(f,e) { if(f(node,e)) { eh(e); } }
        en = sHandler[0];
        eHandler = curry(anon,sHandler[1]);
        
    }
    else
    {
        eHandler = eh;
    }
    node.attachEvent ? node.attachEvent('on'+en,eHandler) : node.addEventListener(en,eHandler,doBubble); 
}
function removeEventFromNode(n,en,eh,c)
{
    c=c!=null?c:false; 
    n.detachEvent ? n.detachEvent('on'+en,eh) : n.removeEventListener(en,eh,c);
}
function stopBubble(e)
{ 
    e = e || event;
   if(window.attachEvent) { e.cancelBubble = true; e.returnValue = false; } else { e.stopPropagation(); if(e.preventDefault) e.preventDefault(); } 
}
function isChild(node,child) { return node==null||child==null?false:node==child?true:child.parentNode?isChild(node,child.parentNode):false; }
function isParent(node,parent) { return isChild(parent,node); }
function isMouseLeave(ele,evt) { return ele.contains && evt.toElement ? !ele.contains(evt.toElement) : !isChild(ele,evt.relatedTarget); }
function isMouseEnter(ele,evt) { return ele.contains && evt.fromElement ? !ele.contains(evt.fromElement) : !isChild(ele,evt.relatedTarget);  }
function isMouseClick(ele,evt) { return isMouseLeave(ele,evt); } // Same concept as mouse leave, src is the element

// Event Object - OO encapsulation of event helpers
var Event =
{
    Register: function(en,n,eh,b) { addEventToNode(n,en,eh,b); },
    Detach: function(en,n,eh,c) { removeEventFromNode(n,en,eh,c); },
    RegisterToList: function(e,l,eh,b) { for(var i=0;i<l.length;i++) this.Register(e,l[i],eh,b); },
    CancelBubble: function(e) { stopBubble(e); },
    // DOM READY FUNCTIONALITY //
    // Queue of functions to be executed
    DomQueue: new Array(), DomQueueWait: null,
    // Starts and Stop Executing of Queue items
    StartDomQueue: function() { Event.EndDomQueue(); Event.DomQueueWait = setInterval(Event.CheckDomQueue,100); },
    EndDomQueue: function() { if(Event.DomQueueWait) clearInterval(Event.DomQueueWait); },
    // Run through items in the queue, and if node is ready, execute associated function.
    CheckDomQueue: function()
    {
        for(var i=0;i<Event.DomQueue.length;i++) { Event.DomQueue[i](); Event.DomQueue.splice(i,1); }
        if(Event.DomQueue.length==0) { Event.EndDomQueue(); }
    },
    // Function called to initiate a check if a node(s) is ready to be used (i.e., part of DOM)
    // Usage: Event.OnDomReady(function() { }, 'id1','id2',...)
    OnDomReady: function(fun,idList) 
    { 
        if(Event.DomQueue.length==0) { Event.StartDomQueue(); }
        var args = arguments;
        var fp = function() 
        {
            for(var i=1;i<args.length;i++) { if(!$(args[i])) return; }
            fun(); 
        }
        Event.DomQueue.push(fp);
    }
}

/* NODE */
function getComputedCSS(domElem, styleKey) {
    // get DOM
    var dom = $(domElem);
    // normalize style key
    var jsStyleKey = new String(styleKey);
    var d = styleKey.indexOf('-');
    if (d > -1) {
        jsStyleKey = styleKey.substring(0, d) + styleKey.substring(d + 1, d + 2).toUpperCase() + styleKey.substring(d + 2, styleKey.length);
    }
    if (dom.currentStyle) {
        return dom.currentStyle[jsStyleKey];
    }
    else if (window.getComputedStyle) {
        return document.defaultView.getComputedStyle(dom, null).getPropertyValue(styleKey);
    }
    else {
        return dom.style[jsStyleKey];
    }
}

function createNode(nodeName,optStyles,optParent)
{
    var creator = optParent ? optParent : window;
    var n = creator.document.createElement(nodeName);
    if(optStyles) { Node.SetStyles(n,optStyles); }
    return $(n,creator);
}
function setNodeText(node,txt,append)
{
    var n = node.nodeName ? node : document.getElementById(node);
    if(n.firstChild) { n.firstChild.nodeValue = txt; }
    else if(append) { n.appendChild(document.createTextNode(txt));}
}
// Node Object -  OO encapsulation of event helpers
var Node = 
{ 
    Create: function(nodeName,optStyles,optParent) { return createNode(nodeName,optStyles,optParent); },
    SetStyles: function(node,listOfStyles) { for(var k in listOfStyles) { node.style[k]=listOfStyles[k]; } },
    CreateText: function(txt,optParent) { return (optParent?optParent.document:document).createTextNode(txt); },
    SetText: function(n,txt)
    {
        if(n.firstChild) { if(n.firstChild.nodeType == 3) { n.firstChild.nodeValue = txt; } }
    },
    Append: function(n,l) { for(var i=0;i<l.length;i++) { n.appendChild(l[i]); } },
    InsertAfter: function(node, referenceNode){ return referenceNode.parentNode.insertBefore(node, referenceNode.nextSibling); }
}

// String Helpers
function formatString(input,array)
{
    for(var i=0;i<array.length;i++) { input = eval("input.replace(/\\{" + i + "\\}/g,array[i])"); }
    return input;
}

/* INPUT FIELDS */
function getInputFields(container,tag) { container.getElementsByTagName(tag); }
function getInputFieldsInContainer(container)
{
    container = container || document;
    var inputTypes = ['INPUT','TEXTAREA','SELECT'];
    var fp = getNodesHelper(container);
    var mappedResults = Map(inputTypes,fp,this);
    return mappedResults;
}
function _funOnFields(f) { return function(l) { ForEach(l,f,this); } }
function _funOnContainerFields(f) { return function(c) { ForEach(getInputFieldsInContainer(c),f,this); } }

// Sets a fields value to empty, unchecked, first item
function clearField(n)
{
    var t=n.type,nn=n.nodeName,hash;
    if(t) { hash = t?(t=='checkbox'||t=='radio' ? ['checked',false] : t=='text'||nn=='TEXTAREA' ? ['value',''] : (t=='select-one' ? ['selectedIndex',0]:null)) : null; }
    if(hash) { n[hash[0]]=hash[1]; }
}
// Clears a list of fields
var clearFields = _funOnFields(clearField);
// Clears a list of fields in container
var clearInputFields = _funOnContainerFields(clearFields);
// Resets a field's value to its default value
function resetField(n)
{
    var t=n.type,nn=n.nodeName,hash;
    if(t) { hash = t?(t=='checkbox'||t=='radio' ? ['checked','defaultChecked'] : t=='text'||nn=='TEXTAREA' ? ['value','defaultValue'] : null) : null; }
    if(t=='select-one') { for(var i=0;i<n.options.length;i++) { n.options[i].selected = n.options[i].defaultSelected; } }
    if(hash) { n[hash[0]]=n[hash[1]]; }
}
// Resets a list of fields
var resetFields = _funOnFields(resetField);
// Resets all fields in container
var resetInputFields = _funOnContainerFields(resetFields);
// Enables a field
function enableField(n) { n.disabled = false; }
// Enables a list of fields
var enableFields = _funOnFields(enableField);
// Enable all fields in container
var enableInputFields = _funOnContainerFields(enableFields);
// Disables a field
function disableField(n) { n.disabled = true; }
// Disables a list of fields
var disableFields = _funOnFields(disableField);
// Disables all fields in container
var disableInputFields = _funOnContainerFields(disableFields);

// gets value from input field/select
// @dom: a DOM input field
function getValue(dom)
{
    var val = '';
    if(dom.nodeName=='INPUT'||dom.nodeName=='TEXTAREA') { val = dom.value; }
    else if (dom.nodeName == 'SELECT') { val = dom.options.length > 0 ? dom.options[dom.selectedIndex].value : null; }
    return val;
}

// sets the DOM node value (textbox, textarea, select)
// @dom: a DOM input field
// @val: the value to check for the selected field
// @textField: (optional: default false) true|false if to use SELECT option text insetad of value
function setValue(dom, val, textField) {
    if (dom.nodeName == 'INPUT' || dom.nodeName == 'TEXTAREA') { dom.value = val; }
    else if (dom.nodeName == 'SELECT') {
        for (var i = 0; i < dom.options.length; i++) {
            var option = dom.options[i];
            // by default, compare to value field, unless text explicity checked
            if (textField != null && textField ? option.text == val : option.value == val) {
                option.selected = true;
            }
        }
    }
}

function getSelectValue(sel) { return sel.options.length ? val = sel.options[sel.selectedIndex].value : null; }
function getSelectText(sel) { return sel.options.length ? val = sel.options[sel.selectedIndex].text : ''; }

// Populates a dropdown from an array
function popualteSelectFromArray(sel,list,addEmpty)
{
    var baseOpt = document.createElement('OPTION');
    if(addEmpty)
    {
        var empty = baseOpt.cloneNode(true);
        empty.text = '';
        empty.value = '';
        empty.innerHTML = '';
        sel.appendChild(empty);
    }
    for(var i=0;i<list.length;i++)
    {
        var opt = baseOpt.cloneNode(true);
        var aText = list[i][0];
        var aVal = list[i][1];
        opt.text = aText;
        if(aVal)
        {
            opt.value = aVal;
        }
        opt.innerHTML = aText;
        sel.appendChild(opt);
    }
}

// Returns bool indicating if node's current value is same as default value (value sent from server)
function isFieldDirty(field)
{
    var isDirty = false;
    if(field.nodeName == 'SELECT') { isDirty = field.options.length>0 ? field.options[field.selectedIndex].defaultSelected!=true : false; }
    else if(field.nodeName=='TEXTAREA') { isDirty = field.value != field.defaultValue; }
    else if(field.nodeName=='INPUT')
    {
        var type = field.type;
        if(type=='checkbox'||type=='radio'){ isDirty = field.defaultChecked != field.checked; }
        else if(type=='text'||type=='text-area') { isDirty = field.value != field.defaultValue; }
    }
    return isDirty;
}

// returns true or false if any input fields in the document have been modified
function isFormDirty() {
    var dirtyFields = getFormDirtyFields();
    return dirtyFields.length > 0;
}

// returns an array of dirty fields in the current document
function getFormDirtyFields() {
    var docDirtyFields = new Array();
    for (var i = 0; i < document.forms.length; i++) {
        var form = document.forms[i];
        for (var j = 0; j < form.elements.length; j++) {
            var field = form.elements[j];
            if (isFieldDirty(field)) {
                docDirtyFields.push(field);
            }
        }
    }
    return docDirtyFields;
}

function setListValueOnEnhancedList(listId,destIndex,val)
{
    var list = document.getElementById(listId).getElementsByTagName('input');
    list[destIndex].value = val;
}

// OPTIONAL FIELDS
var VIEW_DETAILS_TEXT = 'View Optional Fields';
var HIDE_DETAILS_TEXT = 'Hide Optional Fields';

// Show hide/contents of a container
function showHideOptionalFields(srcImg,container,viewImgSrc,hideImgSrc,viewText,hideText)
{
    var img = srcImg? $(srcImg) : null;
    var con = container ? $(container) : null;
    if(con)
    {
        if(con.isHidden())
        {
            con.show('');
            showHideOptionalSwap(img,viewImgSrc,hideImgSrc,viewText,hideText,true);
        }
        else
        {
            con.hide('none');
            showHideOptionalSwap(img,viewImgSrc,hideImgSrc,viewText,hideText,false)
        }
    }
}

function showHideOptionalSwap(img,viewImgSrc,hideImgSrc,viewText,hideText,doShow)
{
    if(img)
    {
        var title = doShow ? (hideText ? hideText : HIDE_DETAILS_TEXT) : (viewText ? viewText : VIEW_DETAILS_TEXT);
        if(img.alt!=null) { img.alt = title; }
        if(img.title!=null) { img.title = title; }
        if(img.nodeName=='IMG' || (img.nodeName=='INPUT' && img.type=='image'))
        {
            // Determine image path
            var base = img.src.substr(0, img.src.lastIndexOf('/') + 1);
            if(doShow){  img.src = base + (hideImgSrc ? hideImgSrc : 'HideOptionalFields.gif'); }
            else { img.src = base + (viewImgSrc ? viewImgSrc : 'ViewOptionalFields.gif'); }
        }
    }
}


// Generic function to return if a user wants to delete a record
function confirmDelete(message) { return confirm(message ? message : 'Are you sure you want to delete this record from the database?'); }

// AJAX based functions

// Returns a function which will invoke a client callback function
// with parameters from the server
function _getAjaxCallback(serverCallback)
{
    return function(arg,content) { serverCallback(arg,context); }
}

function _getAjaxProcessor(callback)
{
    return function(arg)
    {
        var obj = eval('(' + arg + ')');
        // Attempts to parse html into a DOM object
        if(obj.html && obj.html != '')
        {
            var _domContainer = document.createElement('DIV');
            _domContainer.innerHTML = obj.html;
            // No content
            if(_domContainer.childNodes.length == 0) { obj.dom = null; }
            // Evaluates to single node
            else if(_domContainer.childNodes.length == 1) { obj.dom = _domContainer.firstChild; }
            // Otherwise evalues to node set
            else { obj.dom = _domContainer.childNodes; }
        }
        var clientString = obj.returnValue;
        var clientObject = obj;
        // invoke callback function with raw return string and parsed object
        callback(clientString,clientObject);
    }
}
    
function Param() 
{ 
    this._obj = new Object();
    this.add = function(key,val) { this._obj[key] = val; }
    this.remove = function(key) { delete this._obj[key]; }
    this.formatParams = function(type)
    {
        var buffer = new Array();
        for(var key in this._obj) 
        {
            var val = this._obj[key] ? encodeURIComponent(this._obj[key].toString()) : '';
            if(type=='xml') { buffer.push('<' + key + '>' + val + '</' + key + '>'); }
            else { buffer.push(key + '=' + val); }
        }
        var delim = type=='xml'? '' : '&';
        return buffer.join(delim);   
    }
    this.toXml = function() { return this.formatParams('xml'); }  
    this.toQueryString = function() { return this.formatParams('query'); }
    // Default to string
    this.toString = function() { return this.toQueryString(); } 
}

var RequestType = { SOAP: 'SOAP', HTTP: 'HTTP' }
var RequestMethod = { GET: 'GET', POST: 'POST' }
var AjaxManager = 
{
    _xmlR: null,
    _httpReq: new XmlRequest(),
    GetHttpRequest: function(type)
    {
        if(this.HttpRequest==null){ this.HttpRequest = window.XMLHttpRequest ? new XMLHttpRequest() : window.ActiveXObject ? new ActiveXObject("Msxml2.XMLHTTP") : new ActiveXObject("Microsoft.XMLHTTP"); }
        return this.HttpRequest;
    },
    MakeRequest: function(method,url,params,callback,async) { this._httpReq._open.apply(this._httpReq,arguments); }
}

function XmlRequest()
{
    this._requestObj = window.XMLHttpRequest ? new XMLHttpRequest() : window.ActiveXObject ? new ActiveXObject("Msxml2.XMLHTTP") : new ActiveXObject("Microsoft.XMLHTTP");
    this._openRequest = function(method,url,async) { this._requestObj.open(method,url,async); }
    this._setHeader = function(key,val) { this._requestObj.setRequestHeader(key,val); },
    this._setGETMethodHeaders = function(method,content)
    {
        var c = content==null?"":content;
        this._requestObj.setRequestHeader('Content-Length',c);
    },
    this._setPOSTMethodHeaders = function(content)
    {
        var c = content==null?"":content;
        this._requestObj.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        this._requestObj.setRequestHeader('Content-Length',c);
    }
    this._setCallBack = function(callback)
    {
        var fp = function(x,cb)
        {
            return function()
            {
                if(x.readyState==4 && x.status==200) { cb(x.responseText,x.responseXML); }
            }
        }
        var cb = fp(this._requestObj,callback);
        this._requestObj.onreadystatechange = cb;
    }
    this._open = function(method,url,params,callback,async)
    {
        var isPost = method.toLowerCase() == "post";
        method = isPost ? RequestMethod.POST : RequestMethod.GET;
        var content = params==null?null:params.toQueryString();
        this._openRequest(method,url,async);
        // Set Headers
        if(isPost) { this._setPOSTMethodHeaders(content); } else { this._setGETMethodHeaders(content); }
        this._setCallBack(callback);
        this._send(content);
    }
    this._send = function(content){ this._requestObj.send(content); }
}
/*** END DOM HELPERS ***/

// Enhanced list (radiobutton/checkbox) helpers
function getEnhancedCheckBoxListValue(hiddenId)
{
    var hid = document.getElementById(hiddenId);
    return hid ? hid.value : '';
}
function getEnhancedRadioButtonListValue(cId,tId)
{
    var v='';
    var container = document.getElementById(cId);
    var tBox = document.getElementById(tId);
    var radios = container.getElementsByTagName('INPUT');
    for(var i=0;i<radios.length;i++)
    {
        if(radios[i].checked)
        {
            var r = radios[i];
            if(r.checked) { v=i==radios.length-1&&tBox?tBox.value:r.value; }
        }
    }
    return v;
}

function showEnhancedCheckBoxList(cbLayerId, cbLabelId, e) {
    var layer = $(cbLayerId);
    var layerContainer = layer.parentNode;
    var label = $(cbLabelId);
    var left = getLeftPos(label);
    var top = label.offsetHeight + getTopPos(label);
    // position layer over label
    layerContainer.style.left = left + 'px';
    layerContainer.style.top = top + 'px';
    layerContainer.style.display = 'inline-block';
    // adjust max-width and max-height
    var mapping = { 'width': 'max-width', 'height': 'max-height' };
    // i.e., set max-height -> static height if tall enough
    var adjustWidth = true;
    var widthBuffer = 30;
    // ignore css fix, if != IE
    if(!window.attachEvent)
        return;
    for (var staticCSS in mapping) {
        // i.e., height -> max-height
        var dynamicCSS = mapping[staticCSS];
        // i.e., Height
        var propName = staticCSS.substring(0, 1).toUpperCase() + staticCSS.substring(1);
        // i.e., offsetHeight
        var currentStatic = layer['offset' + propName];
        var currentStaticMax = getComputedCSS(layerContainer, dynamicCSS);
        if (currentStatic != '' && currentStaticMax != '') {
            var maxDynamic = parseInt(currentStaticMax, 10);
            if (maxDynamic != 'NaN' && currentStatic > maxDynamic) {
                // special case
                if (staticCSS == 'width') {
                    layerContainer.style[staticCSS] = maxDynamic + widthBuffer + 'px';
                    adjustWidth = false;
                }
                else {
                    layerContainer.style[staticCSS] = maxDynamic + 'px';
                }
                layerContainer.style[dynamicCSS] = "";
            }
        }
    }
    // static fix
    if (adjustWidth) {
        layerContainer.style.width = layer.offsetWidth + widthBuffer + 'px';
    }
}

function hideEnhancedCheckBoxList(cbLayerId, cbLabelId, e) {
    var layer = $(cbLayerId);
    var layerContainer = layer.parentNode;
    if (isMouseLeave(layerContainer, e)) {
        layerContainer.style.display = 'none';
    }
}

// sets the hidden value and label for the csv list of checked checkboxes
// @cId: the id of the checkbox list
// @tId: the id of the other textbox (optional/null), can be null
// @hId: the id of the hidden field containing the full CSV list of selected value
// @cbLabelId: the id of the DOM node which contains the display csv list of values (optional/null)
// @hash: a javascript array of arrays containing a map of checkbox text/value pairs [['Text 1','Value 1'],['Text 2','Value 2']]
// @maxLength: The max length of the value field can hold (optional/null)
function updateEnhancedCheckBoxList(cId, tId, hId, cbLabelId, hash, maxLength) {
    var cbList = $(cId);
    var otherTextBox = $(tId);
    var hiddenValue = $(hId);
    var checkBoxes = cbList.getElementsByTagName('INPUT');
    var labels = cbList.getElementsByTagName('LABEL');
    var cbDisplayLabel = $(cbLabelId);
    // create and array to capture selcted values
    var csv = new Array();
    // for each checkbox, if checked, append value to csv
    for (var i = 0; i < checkBoxes.length; i++) {
        var cb = checkBoxes[i];
        // if input is checkbox and checked
        if (cb.type == 'checkbox' && cb.checked) {
            var foundValue = null;
            // locate matching label
            for (var j = 0; j < labels.length; j++) {
                var label = labels[j];
                // ensure label is for current checkbox
                if (label.htmlFor == cb.id) {
                    // value is label
                    var labelValue = getNodeValue(label);
                    for (var k = 0; k < hash.length; k++) {
                        var key = hash[k][0];
                        var value = hash[k][1];
                        // handle 'Other' item, use textbox value
                        if (key == 'Other' && otherTextBox != null) {
                            csv.push(otherTextBox.value);
                            break;
                        }
                        // if <label> text = hash key, use value
                        else if (labelValue == key) {
                            csv.push(value);
                            break;
                        }
                    }
                    break;
                }
            }
        }
    }
    // create CSV value representing list of selected values
    var csvValue = csv.join(',');
    // validate maxLength before setting hidden value
    if (maxLength != null && maxLength > 0 && csvValue.length > maxLength) {
        // alert user that the last value will be unselected
        alert('Note: the length of the data you have selected has exceeded the maximum number of characters for this field (' + maxLength + ').\nThe last item you selected has been unchecked.');
        // return false which will cancel check event and end setting labels and hidden values
        return false;
    }
    // set hidden field as csv list of selected values
    hiddenValue.value = csvValue;
    // set cb display label if applicable
    if (cbDisplayLabel) {
        cbDisplayLabel.title = csvValue;
        cbDisplayLabel.value = csvValue;
    }
    // return true to continue checkbox checking
    return true;
}

// check 'Other' list item value
// @cbListId: the DOM id of the check box list
// @hash;
// @field: the DOM refernce of other textbox
function checkOtherItem(cbListId, hash, field, e) {
    var checkBoxes = $(cbListId).getElementsByTagName('INPUT');
    var labels = $(cbListId).getElementsByTagName('LABEL');
    for (var i = 0; i < checkBoxes.length; i++) {
        var cb = checkBoxes[i];
        // if input is checkbox and checked
        if (cb.type == 'checkbox' || cb.type == 'radio') {
            var foundValue = null;
            // locate matching label
            for (var j = 0; j < labels.length; j++) {
                var label = labels[j];
                // ensure label is for current checkbox
                if (label.htmlFor == cb.id) {
                    // value is label
                    var labelValue = getNodeValue(label);
                    for (var k = 0; k < hash.length; k++) {
                        var key = hash[k][0];
                        var value = hash[k][1];
                        // if last label/checkbox is 'Other' item, use textbox value
                        if (key == 'Other' && labelValue == 'Other' && field != null) {
                            cb.checked = true;
                            break;
                        }
                    }
                    break;
                }
            }
        }
    }
}

// handles field max length by signal max length and prevent extra text
// @fieldId: the client DOM id of the input field or input field DOM reference
// @maxLength: the field max length
// @e: event object
function handleFieldMaxLength(fieldId, maxLength, e) {
    // textbox and textarea
    var field = $(fieldId);
    // SPECIAL CASE: supress native textbox handling by remove attribute
    if (field.nodeName == 'INPUT' && field.type == 'text' && field._noMaxLength != true) {
        field.removeAttribute('maxLength');
        field._noMaxLength = true;
    }
    if (!(field.value.length <= maxLength || (e.keyCode == 8 || e.keyCode == 46 || (e.keyCode >= 35 && e.keyCode <= 40)))) {
        field.value = field.value.substr(0, maxLength);
        field.style.backgroundColor = '#FFF64C';
        alert('Note: the data you have entered has exceeded the maximum number of characters for this field (' + maxLength + ').');
        stopBubble(e);
        return false;
    }
    else {
        field.style.backgroundColor = '';
        return true;
    }
}

// when checking checkbox item, unselect other items (enforce mutally exclusive)
function handleMutalCheckBoxList(listId, e) {
    var target = e.srcElement || e.target;
    if (target && target.nodeName == 'INPUT' && target.type == 'checkbox' && target.checked) 
    {
        $(listId).tag('INPUT').foreach(function(cb) { if (cb != target) cb.checked = false; });
    }
}

// makes a radio button uncheckable
// @radio: the DOM reference of the clicked radio button
// e: event object
function handleUncheckableControl(radio, e) {
    // ._bit will track state of check/uncheck
    radio._bit = radio.checked ? (radio._bit == null ? 1 : (radio._bit == 0 ? 1 : 0)) : 0;
    radio.checked = radio._bit == 1;
    var listName = radio.name;
    // if radio is part of list, get all items with same name
    if (listName && listName != '') {
        var radioList = document.getElementsByName(listName);
        for (var i = 0; i < radioList.length; i++) {
            var radioItem = radioList[i];
            // verify only radio buttons
            if (radioItem.type == 'radio') {
                // reset bit only for radios != clicked radio
                if (radio != radioItem) {
                    radioItem._bit = 0;
                }
            }
        }
    }
    return radio.checked;
}

//****** do not go to the last page when user clicks backspace! 
function cancelBackOnBackspace(e)
{
    e = e || event;
    var isEditor = (e.srcElement||e.target ? e.srcElement||e.target : {}).isNotesEditor;
    if(isEditor) { return; } 
    var k=e.keyCode,alt=e.altKey,srcEle=e.srcElement||e.target;
	if ((k == 8 && (srcEle==null || srcEle.form == null || srcEle.isTextEdit == false)) || k == 37 && alt || k == 39 && alt)
    { stopBubble(e); return false; }
}

// ***************************************************interpreted date functions******************************************
// globalization
// defaults to US if not present (mm/dd/yyyy)
// culture variable should be set in web.config: Australia use en-AU, England en-GB etc. (dd/mm/yyyy)

// defaults to us if not present.
function getCulture() { return top.culture || "en-US"; }
function getDateFormat(){ return isUSDate() ? "mmddyyyy" : "ddmmyyyy"; }
function isUSDate() { return getCulture().toLowerCase().indexOf("us") > -1;  }

// returns if the specified "date" is in the future (i.e., greater than today)
// @date: the date to check
function isFutureDate(date) {
    var today = new Date();
    return normalizeDate(date) > normalizeDate(today);
}

// returns a new Date with normalized time (midnight)
// @date: the date to normalize
function normalizeDate(date) {
    var normalDate = new Date(date.getFullYear(), date.getMonth() , date.getDate() , 0, 0, 0, 0);
    return normalDate;
}

var dateCulture = getCulture();
var fullDateFormat = getDateFormat();
var minDate = new Date(1890, 0, 1);

// accounts for UTF and ASCII characters
function validateLetters(testValue) {
  var testCase  = /^[A-Za-z\u00C0-\u00ff]+$/;
  return testCase.test(testValue);
}


function fuzzyDate(dateText, dateVal) {
    // validate fields
    if (dateText == null || dateVal == null) {
        return;
    }
    
	var fullDateFormat = getDateFormat();
	
	dateVal.value = '';
	var dText = dateText.value;
	var origDText = dText;
	var wordCount = origDText.split(' ').length;
	var validateDateText = dText.length > 0;
	dText = dText.replace(/[ \.\\-]+/g, '/');
	var pattern = /(\d+)(\/*)(\d*)(\/*)(\d*)/;
	/* comment */
	
	// MONTH_NAMES array will be registerd at runtime by Header
	var arrMonths = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
	var startMonth = false;
	for(i=0;i<arrMonths.length;i++)
	{
		sMnth = new String(arrMonths[i]);
		sLngRegEx = sMnth;
		sShtRegEx = sMnth.substr(0,3);
		if(validateDateText)
		{
		    if(origDText.substr(0,4)==sShtRegEx + ' ' || origDText.substr(0,sLngRegEx.length + 1)==sLngRegEx + ' ')
		    {
		        startMonth = true;
		    }
		}
		dText = dText.replace(sLngRegEx,i+1);
		dText = dText.replace(sShtRegEx,i+1);
	}
	
	

	
	// if first letter is a character and not a month, don't parse
	if(validateDateText)
	{
	    var firstChart = origDText.charAt(0);
	    if(validateLetters(firstChart) && !startMonth)
	    {
	        dateVal.value = '';
	        return;
	    }
	}
	// validate word length
    if(wordCount > 3)
    {
        dateVal.value = '';
        return;
    }
    
	var result  = dText.match(pattern);
	
	if(result != null) {
		var day;
		var month;
		var year;
		var format = "";
		
		if(result[5] != "" ) {
			
			//globalization
			//if(dateCulture == "en-AU" || dateCulture == "en-GB")
			if(isUSDate() == true)
			{
				month = result[1];
				day = result[3];
			}
			else
			{
				month = result[3];
				day = result[1];
			}
			year = result[5];
			format = fullDateFormat;
		}
		else if(result[3] != "") {
			month = result[1];
			year = result[3];
			day = 15;
			format = "mmyyyy";
		}
		else if(result[0] != "" && result[0].length == 4){
			year = result[0];
			month = 7;
			day = 1;
			format = "yyyy";
		}
		else {
			return;
		}
		
		//if(month > 12 || day < 1 || day > 31)
			//return;
			
		var oldYear = year;
		if(year.length <= 2) {
			year = parseInt(year, 10) + 2000;
		}
		var today = new Date();
		var oneYearFromNow = new Date(today.getFullYear()+1, today.getMonth(), today.getDate());
		var theDate = new Date(year, parseInt(month,10)-1, day);
		
		if(theDate.valueOf() > oneYearFromNow.valueOf() && oldYear.length <= 2) {
			theDate.setFullYear(year - 100);
		}
		/*	else if(theDate.valueOf() > today.valueOf()) {
			var todayString = today.getMonth()+1 + "/" + today.getDate() + "/" + today.getFullYear();
			alert("Please enter a date on or before " + todayString + "."); 
			return;
		}
		*/
		else if(year.length > 4) {
			alert("Please enter a valid year of less than four digits."); 
			return;
		}
		else if(theDate.valueOf() < minDate.valueOf()) {
			var minDateStr= minDate.getMonth()+1 + "/" + minDate.getDate() + "/" + minDate.getFullYear();
			alert("Please enter a date on or after " + minDateStr + "."); 
			return;
		}
		if(theDate.getDate() != day || theDate.getMonth()+1 != month) {
			//debug: alert("day:" + day + " month:" + month);
			alert("This date may be incorrect. Please check and re-enter if necessary.");
			return;
		}
		
		var dispMonth = String(theDate.getMonth() +1);
		var dispDay = String(theDate.getDate());
		
		if(dispMonth.length == 1) {
			dispMonth = '0' + dispMonth;
		}
		if(dispDay.length == 1) {
			dispDay = '0' + dispDay;
		}
		
		if(format == "mmddyyyy") {
			dateText.value = dispMonth + '/' + dispDay + '/' + theDate.getFullYear();			
		}
		//European/Australian date format
		else if(format == "ddmmyyyy"){
			dateText.value = dispDay + '/' + dispMonth + '/' + theDate.getFullYear();
		}	
		else if(format == "mmyyyy") {
			dateText.value = dispMonth + '/' + theDate.getFullYear();
		}
		else if (format == "yyyy") {
			dateText.value = theDate.getFullYear();
		}
		//display interpreted date
		
		if(isUSDate())
		{	
			// US date format
			dateVal.value =  dispMonth + '/' + dispDay + '/' + theDate.getFullYear() ;
		}
		else //dateCulture == "en-AU" || dateCulture == "en-GB")
		{
			// Euro/AU date format
			dateVal.value =  dispDay + '/' + dispMonth + '/' + theDate.getFullYear() ;
		}	
	}
}
/******** DHTML date validation script *************************************************/

var dtCh= "/";
var minYear=1900;
var maxYear=2100;

function isInteger(s)
{
    for (var i=0;i < s.length; i++)
    {   
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    return true;
}

function stripCharsInBag(s, bag)
{
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (var i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

// February has 29 days in any year evenly divisible by four,
// EXCEPT for centurial years which are not also divisible by 400.
function daysInFebruary (year) {  return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 ); }
function DaysArray(n) 
{
	for (var i = 1; i <= n; i++) 
	{
		this[i] = 31;
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) { this[i] = 29 }
   } 
   return this;
}

function isDate(dtStr)
{
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	// US date format day in pos1, Euro day in pos 2
	//if(dateCulture == "en-AU" || dateCulture == "en-GB"){
	if(isUSDate())
	{
		var strMonth=dtStr.substring(0,pos1)
		var strDay=dtStr.substring(pos1+1,pos2)	
	}
	else
	{
		var strDay=dtStr.substring(0,pos1)
		var strMonth=dtStr.substring(pos1+1,pos2)
	}
	
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		if(isUSDate()){
			alert("The date format should be : mm/dd/yyyy");
		}else{
			alert("The date format should be : dd/mm/yyyy");
		}
		return false;
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false;
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false;
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		return false;
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false;
	}
	return true;
}

// KY Added these two functions. 
// Basically the same as isDate, but doesn't complain when the date is empty
 function trimAll(sString)
{
    while (sString.substring(0,1) == ' ') { sString = sString.substring(1, sString.length);  }
    while (sString.substring(sString.length-1, sString.length) == ' ') { sString = sString.substring(0,sString.length-1); }
    return sString;
}

function isDateAndNotEmpty(theid, dtStr)
{
    dtStr = trimAll(dtStr)
    //alert(dtStr.length.toString())
                
    if(dtStr.length > 0)
    {
        obj = document.getElementById(theid)
        var daysInMonth = DaysArray(12)
        var pos1=dtStr.indexOf(dtCh)
        var pos2=dtStr.indexOf(dtCh,pos1+1)
        // US date format day in pos1, Euro day in pos 2
        //if(dateCulture == "en-AU" || dateCulture == "en-GB"){
        if(isUSDate())
        {
            var strMonth=dtStr.substring(0,pos1)
            var strDay=dtStr.substring(pos1+1,pos2)	
        }
        else
        {
            var strDay=dtStr.substring(0,pos1)
            var strMonth=dtStr.substring(pos1+1,pos2)
        }
    	
        var strYear=dtStr.substring(pos2+1)
        strYr=strYear
        if (strDay.charAt(0)=="0" && strDay.length>1)
        {
            strDay=strDay.substring(1)
        }
        if (strMonth.charAt(0)=="0" && strMonth.length>1) 
        {
            strMonth=strMonth.substring(1)
        }
        for (var i = 1; i <= 3; i++) 
        {
            if (strYr.charAt(0)=="0" && strYr.length>1) 
            {
                strYr=strYr.substring(1)
            }
        }
        month=parseInt(strMonth)
        day=parseInt(strDay)
        year=parseInt(strYr)
        if (pos1==-1 || pos2==-1)
        {
            if(isUSDate())
            {   
	            alert("The date format should be : mm/dd/yyyy")
            }
            else
            {
	            alert("The date format should be : dd/mm/yyyy")
            }
            obj.value = ""
            obj.focus()
            return false
        }
        if (strMonth.length<1 || month<1 || month>12)
        {
            alert("Please enter a valid month")
            obj.focus()
            return false
        }
        if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month])
        {
            alert("Please enter a valid day")
            obj.focus()
            return false
        }
        if (strYear.length != 4 || year==0 || year<minYear || year>maxYear)
        {
            alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
            obj.focus()
            return false
        }
        if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false)
        {
            alert("Please enter a valid date")
            obj.value = ""
            obj.focus()
            return false
        }
        return true
    }
}
// end

function dateGreaterThan(firstDate, secondDate) { return new Date(firstDate) > new Date(secondDate); }
function alertStartStopDate(startDateTextField, stopDateTextField, stopDateField)
{
	if (dateGreaterThan(startDateTextField.value, stopDateTextField.value))
	{
		alert('Stop date is before start date.');
		stopDateTextField.value = '';
		stopDateField.value = '';
	}
}
/* TIME */

// returns if the specified value is a valid time format
// i.e., true: 13:25 == 1:25 PM, false: twelve thirty
// @value: the time componenet to test
// @isTwentyFourFormat: true if to validate against a 24-hour format, else 12-hour format
function validateTimeFormat(value, isTwentyFourFormat) {
    var time = value + "";
    var format = isTwentyFourFormat ? "^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" : "^([0-9]|0[0-9]|1[0-9]):[0-5][0-9]$";
    var match = new RegExp(format).test(time);
    return match;
}

/********************* CALCULATION SCRIPTS **************************/

function calcElementAvgDimension(dimensionEl, lengthEl, widthEl, heightEl)
{
    dimensionEl.value = calcAvgDimension(lengthEl.value, widthEl.value, heightEl.value);
}

//
// scripts to calculate prostate avg dimensions and volumes
//
function calcAvgDimension(length, width, height)
{		
	var n1 = parseFloat(length);
	var n2 = parseFloat(width);
	var n3 = parseFloat(height);
	var avg = (n1 + n2 + n3)/3;
	
	var result = Math.round(avg*100)/100;
	return isNaN(result)==1 ? "" : result;//empty avg dim field if invalid params entered
}

function calcElementProstateVolume(volumeEl, lengthEl, widthEl, heightEl)
{
    volumeEl.value = calcProstateVolume(lengthEl.value, widthEl.value, heightEl.value);
}

//calculate prostate volume according to ellipsoid volume formula
function calcProstateVolume(length, width, height)
{	
	//old
	// CalcVolume = CSng(pi / 6 * (vLength * vWidth * vHeight)) : from PRDB
	var PI = 3.141592654;///Math.PI; //3.141592654;
	len = parseFloat(length);
	wid = parseFloat(width);
	hei = parseFloat(height);
	//var volumeEllipse = ((4/3 * PI) * (wid/2) * (len/2) * (hei/2));
	var volumeEllipse  = ((PI/6) * wid * len * hei);	
	//round and pad with zeros to three places
	var result = perRound(volumeEllipse, 3);
	return isNaN(result)==1 ? "" : result; //empty volume field if invalid params entered
} 

function perRound(num, precision) {
	var precision = 3; //default value if not passed from caller, change if desired
	// remark if passed from caller
	precision = parseInt(precision); // make certain the decimal precision is an integer
    var result1 = num * Math.pow(10, precision);
    var result2 = Math.round(result1);
    var result3 = result2 / Math.pow(10, precision);
    return zerosPad(result3, precision);
}
function zerosPad(rndVal, decPlaces) {
    var valStrg = rndVal.toString(); // Convert the number to a string
    var decLoc = valStrg.indexOf("."); // Locate the decimal point
    // check for a decimal 
    if (decLoc == -1) {
        decPartLen = 0; // If no decimal, then all decimal places will be padded with 0s
        // If decPlaces is greater than zero, add a decimal point
        valStrg += decPlaces > 0 ? "." : "";
    }
    else {
        decPartLen = valStrg.length - decLoc - 1; // If there is a decimal already, only the needed decimal places will be padded with 0s
    }
     var totalPad = decPlaces - decPartLen;    // Calculate the number of decimal places that need to be padded with 0s
    if (totalPad > 0) {
        // Pad the string with 0s
        for (var cntrVal = 1; cntrVal <= totalPad; cntrVal++) 
            valStrg += "0";
        }
    return valStrg;
}

// functions to center Eform iframe layer on page
function centerLayer(layerName, widthOfLayer, heightOfLayer) 
{
	var browserHeight = getHeight();
	var browserWidth = getWidth();
	document.getElementById(layerName).style.left = (browserWidth - widthOfLayer) / 2;
	document.getElementById(layerName).style.top = (browserHeight - heightOfLayer) / 2;
}
function getWidth(optWin) 
{
    win = optWin || window;
    return win.innerWidth || win.document.documentElement.clientWidth || win.document.body.clientWidth; 
}
function getHeight(optWin) 
{
    win = optWin || window;
    return win.innerHeight || win.document.documentElement.clientHeight || win.document.body.clientHeight; 
}

// returns a reference to the topmost window object
function getTopWindow() { var t=window; while((t=t.top)!=t); return t; }

// script to calculate Body Mass Index
//
//			Weight in Kilograms
// BMI = ----------------------------  x 10,000
//		 Height in cm * Height in cm
function calculateElementBMI(bmiElement, heightElement, weightElement)
{
    bmiElement.value = calculateBMI(heightElement.value, weightElement.value);
}

// TODO: do we need try/catch action to handle parsing stuff
function calculateBMI(height, weight)
{		
	ht = parseFloat(height);
	wt = parseFloat(weight);
	var bmi = (wt/(ht * ht)) * 10000;
	var result = Math.round(bmi*100)/100;
	return isNaN(result)==1 ? "" : result; //empty avg dim field if invalid params entered
}

function calculateElementBSA(bsaElement, heightElement, weightElement)
{
    bsaElement.value = calculateBSA(heightElement.value, weightElement.value);
}

// script to calculate Body Surface Area
//
// The Mosteller Formula
// BSA (m²) = ( [Height(cm) x Weight(kg) ]/ 3600 )^½ 
// or
// BSA (m²) = ( [Height(in) x Weight(lbs) ]/ 3131 )^½
//
// The DuBois Formula
// BSA (m²) = 0.20247 x Height(m)^0.725 x Weight(kg)^0.425
function calculateBSA(height, weight)
{		
	ht = parseFloat(height)//cm;
	wt = parseFloat(weight)//kg;
	var bsa	= 0.007184 * Math.pow(ht, 0.725) * Math.pow(wt, 0.425);
	//var bsa =  Math.pow( ((ht * wt)/3600), .5); Mosteller
	var result = Math.round(bsa*100)/100;
	return isNaN(result)==1 ? "" : result;//empty avg dim field if invalid params entered
}

function calculateBSAandBMI(bsaElement, bmiElement, heightElement, weightElement)
{
    bsaElement.value = calculateBSA(heightElement.value, weightElement.value);
    bmiElement.value = calculateBMI(heightElement.value, weightElement.value);
}

function validateGleason(primGleason, secGleason, gleasonSum, sumInput) 
{
	var pgNum = parseInt(primGleason.value);
	var sgNum = parseInt(secGleason.value);
	if(sumInput) 
	{
		var sumG = parseInt(gleasonSum.value);
		if(!isNaN(sumG) && sumG != pgNum + sgNum && sumG <= 10 && sumG >= 2 && !isNaN(pgNum) && !isNaN(sgNum)) 
		{
			primGleason.value = "";
			secGleason.value = "";
		}
		else 
		{
			validateGleason(primGleason, secGleason, gleasonSum, false);
		}
	}
	else if (!isNaN(pgNum) && !isNaN(sgNum) && sgNum <=5 && sgNum >=1 && pgNum <=5 && pgNum >=1)
	{
	    gleasonSum.value = pgNum + sgNum;
	}
}

function calcResult(ggs, resultID) 
{
    
    var resBox = document.getElementById(resultID);
	var resVal = "";

	if(ggs.value <2) { return; }

    //should match lookup code values
	else if(ggs.value <= 4) {resVal = "Well"; }
	else if(ggs.value <= 7) {resVal = "Mod"; }
	else if(ggs.value <= 10){resVal = "Poor"; }
    
    resBox.value = resVal;
    
//	for(var i=0	; i<$(resBox).options.length; i++) 
//	{
//    	if($(resBox).options[i].text == resVal) {v$(resBox).selectedIndex = i; break; }
//	}
}

// START NOTES EDITOR
var NotesEditor = 
{ 
    enabled: true,
    active: false,
    editor: null,
    onOpen: function() { },
    onClose: function(f) { },
    currentField: null,
    // The following variables can be override on pages using editor, as these values
    // aren't used until editor is clicked to open, 
    //i.e.(NodesEditor.editorWidth = 700; will makes editor 700 pixes wide on page)
    editorContainer: 'PDFormDiv', // specifies the default container in which to center editor, else center in body
    editorWidth: 400, // specifies the static width to the editor
    editorHeight: 200, // specifies the static height to the editor
    init: function()
    {
        if(!this.active) // Becomes active when inserted into DOM
        {           
            // START MAIN TABLE
            var textAreaTable = $(document.createElement('TABLE'));
            textAreaTable.className = 'NotesEditorTable miniPopupLayer';
            textAreaTable.style.zIndex = 1000;
            textAreaTable.cellPadding = 0;
            textAreaTable.cellSpacing = 0;
            textAreaTable.border = 0;
            document.body.appendChild(textAreaTable);
            var textAreaTableBody = $(document.createElement('TBODY'));
            textAreaTable.appendChild(textAreaTableBody);

            /* HEADER SECTION (Title, char counter, Close Button) */
            var headerRow = textAreaTableBody.insertRow(0);
            headerRow.className = 'NotesEditorHeader miniPopupHeader';
            var titleCell = headerRow.insertCell(0);
            var titleTextSpan = $(document.createElement('SPAN'));
            var titleText = document.createTextNode('Edit Text');
            titleTextSpan.appendChild(titleText);
            titleCell.appendChild(titleTextSpan);
            var charCell = headerRow.insertCell(1);
            charCell.className = 'NotesEditorCell';
            var charCounter = $(document.createElement('SPAN'));
            var charCounterText = document.createTextNode('count:');
            charCounter.appendChild(charCounterText);
            charCell.appendChild(charCounter);
            var closeCell = headerRow.insertCell(2);
            closeCell.className  = 'NotesEditorCell';
            var closeImg = $(document.createElement('IMG'));
            closeImg.src = (top.APP_PATH ? top.APP_PATH : '../../') + 'Images/CloseSmall.gif';
            closeImg.className = 'PDButtonOn';
            closeImg.alt = 'close';
            closeImg.title = 'close';
            closeImg.addEvent('click',function() { NotesEditor.close(); } );
            closeCell.appendChild(closeImg);
            
            

            /* END - HEADER SECTION (Title, Close Button) */
            
            // Create Content Row (i.e., textarea)
            var contentRow = textAreaTableBody.insertRow(1);
            var contentCell = contentRow.insertCell(0);
            contentCell.colSpan = 3;
            contentCell.className = 'miniPopupContent';
            var textArea = $(document.createElement('TEXTAREA'));
            textArea.className = 'NotesEditor';
            textArea.style.width = this.editorWidth + 'px';
            textArea.style.height = this.editorHeight + 'px';
             // SET TEXTAREA EVENTS

            // Capture default enter (which will reset or submit form in some browsers)
            textArea.addEvent('keydown', function(evt) { evt = evt || event; if (evt.keyCode == 27 || handleFieldMaxLength(textArea, NotesEditor.currentField.maxLength, evt) == false) { stopBubble(evt); } });
            // As user types into textarea, update ref field and char counter
            textArea.addEvent('keyup', function() 
            {
                 var notesEditorText = textArea.value;
                 NotesEditor.currentField.value = notesEditorText;
                 var updatedText = 'count: ' + notesEditorText.length + '/' + NotesEditor.currentField.maxLength;
                 NotesEditor.editor.charCounter.innerHTML = updatedText;
            });
            
            // Set properties to prevent handling of backspaces
            textArea.isNotesEditor = true;
            
            // Append TextArea to content cell
            contentCell.appendChild(textArea);
            
            // create helper iframe to prevent bleeding in earlier browsers
            if(isIE && !isIE7)
            {
                var helperLayer = $(document.createElement('IFRAME'));
                helperLayer.className = 'NotesEditorTable';
                helperLayer.style.zIndex = 999;
                helperLayer.frameBorder = 0;
                document.body.appendChild(helperLayer);
                textAreaTable.helper = helperLayer;
            }
           
            // Assign helper references
            textAreaTable.titleTextSpan = titleTextSpan;
            textAreaTable.charCounter = charCounter;
            textAreaTable.txt = textArea;

            // Assign Helper function
            textAreaTable.open = function() 
            { 
                textAreaTable.show('');
                if(textAreaTable.helper) { textAreaTable.helper.show(''); }
                NotesEditor.adjustPosAndSize();

                textAreaTable.txt.value = NotesEditor.currentField.value;
                textAreaTable.txt.defaultValue = textAreaTable.txt.value;
                if (NotesEditor.currentField.previousSibling && NotesEditor.currentField.previousSibling.innerHTML)
                {
                    titleTextSpan.innerHTML = NotesEditor.currentField.previousSibling.innerHTML;
                }
                else
                {
                    titleTextSpan.innerHTML = 'Notes';
                }
                if(!NotesEditor.currentField.disabled) { textAreaTable.txt.focus(); }
            }
            
            // If in pde section, center when expanding
            var resizer = document.getElementById('ExpandPatientDataButton');
            if(resizer) 
            {
                resizer = $(resizer);
                var resizeHandler = function() { setTimeout(function() { NotesEditor.adjustPosAndSize(); },1); };
                resizer.addEvent('click',resizeHandler);
            }
            
            // Signal that DOM was constructed and inserted
            this.editor = textAreaTable;
            this.active = true;
        }
    },
    show: function(fieldId,maxLen) 
    {
        if(!NotesEditor.active) { NotesEditor.init(); }
        if(NotesEditor.onOpen) { NotesEditor.onOpen(fieldId,maxLen); }
        var field = document.getElementById(fieldId);
        field.maxLength = maxLen;
        NotesEditor.currentField = field;
        NotesEditor.editor.txt.readOnly = field.disabled;
        NotesEditor.editor.charCounter.innerHTML = "count: " + field.value.length + "/" + maxLen;
        NotesEditor.editor.open(); 
    },
    close: function() 
    { 
        if(NotesEditor.onClose) { NotesEditor.onClose(NotesEditor.currentField); }
        var charCount = NotesEditor.editor.txt.value.length;
        var maxCharCount = NotesEditor.currentField.maxLength;
        if(charCount > maxCharCount)
        {            
            NotesEditor.editor.charCounter.innerHTML = "count:: " + NotesEditor.editor.txt.value.length + "/" + NotesEditor.currentField.maxLength;
            alert("You have exceeded the maximum character length.\nPlease make adjustments.\n\nCharacter MAX :  " + maxCharCount + "\nCharacters ENTERED: " + charCount); 
            return;
        }
        NotesEditor.currentField.value = NotesEditor.editor.txt.value;
        NotesEditor.editor.hide('none');
        if(NotesEditor.editor.helper) { NotesEditor.editor.helper.hide('none'); }
    },
    adjustPosAndSize: function()
    {
        if(NotesEditor.editor.display != 'none')
        {
            if(NotesEditor.editor.helper)
            {
                var editorWidth = NotesEditor.editor.offsetWidth -  16;
                var editorHeight = NotesEditor.editor.offsetHeight - 16;
                NotesEditor.editor.helper.style.width = editorWidth + 'px';
                NotesEditor.editor.helper.style.height = editorHeight + 'px';
                
                var editorLeft = getLeftPos(NotesEditor.editor);;
                var editorTop = getTopPos(NotesEditor.editor);
                NotesEditor.editor.helper.style.left = editorLeft + 'px';
                NotesEditor.editor.helper.style.top = editorTop + 'px';
                NotesEditor.editor.helper.center();
            }
            NotesEditor.editor.center();
        }
    }
};

// END NOTES EDITOR

// ICD Editor
var ICDEditor = 
{ 
    enabled: true,
    active: false,
    URL: top.APP_PATH +  'Core/Utilities/ICDWizard.aspx', // APP_PATH Registered in the header
    editor: null,
    onOpen: function() { },
    onClose: function(f) { },
    currentField: null,
    // The following variables can be override on pages using editor, as these values
    // aren't used until editor is clicked to open, 
    //i.e.(NodesEditor.editorWidth = 700; will makes editor 700 pixes wide on page)
    editorContainer: 'PDFormDiv', // specifies the default container in which to center editor, else center in body
    editorWidth: 400, // specifies the static width to the editor
    editorHeight: 235, // specifies the static height to the editor
    init: function()
    {
        if(!this.active) // Becomes active when inserted into DOM
        {
            var nc=Node.Create,nt=Node.CreateText,na=Node.Append;
            /* CONTAINER w/ IFrame Helper */
            var divStyles = {position:"absolute",top:"100px",zIndex:"100",border:"none",display:"none" };
            var div = nc("DIV",divStyles);
            divStyles["zIndex"]="99";
            var helper = nc("IFRAME",divStyles);
            div.helper = helper;
            /* END CONTAINER */ 
       
            var textAreaTableStyles = { width:'430px',backgroundColor:'#ffffff',border:'solid 1px #333333',cellSpacing:'0' };
            var textAreaTable = nc("TABLE",textAreaTableStyles);
            
            textAreaTable.cellPadding = '0';
            textAreaTable.cellSpacing = '0';
            
            var textAreaTableBody = nc("TBODY");

            /* HEADER SECTION (Title, Close Button) */
            var headerRow = nc("TR");
            var headerStyles = { backgroundColor: '#8d2a2c', color: '#ffffff', padding:'4px',fontSize:'12px',fontWeight: '600' };
            var headerCell = nc("TD",headerStyles);
             
            var closeImgStyle = { marginTop:'3px',marginRight:'2px' };
            var CloseImg = nc('IMG',closeImgStyle);
            // APP_PATH registered in Header
            CloseImg.src = (top.APP_PATH ? top.APP_PATH : '../../') + 'Images/CloseSmall.gif';
            CloseImg.alt = 'close';
            CloseImg.className = 'PDButtonOn';
            CloseImg.align = 'right';
            var closeHandler = function() { ICDEditor.close(); }
            Event.Register('click',CloseImg,closeHandler,false);

            var titleTextSpan = nc("SPAN");
            var titleText = nt('ICD Wizard');
            var charStyles =  { paddingLeft: "250px",fontWeight : "normal", fontSize : '10px', color : '#dddddd' };
            var charCounter = nc("SPAN",charStyles);
            div.charCounter = charCounter;
            
            na(titleTextSpan,[titleText])
            na(headerCell,[CloseImg,titleTextSpan,charCounter]);
            na(headerRow,[headerCell]);
            na(textAreaTableBody,[headerRow]);
            /* END - HEADER SECTION (Title, Close Button) */
            
            /* TEXT AREA */
            var contentRow = nc("TR");
            var contentCell = nc("TD");
            // Sets the width and height of editor, defaults  to 500x200
            var eWidth = this.editorWidth + 'px';
            var eHeight = this.editorHeight + 'px';
            var textAreaStyles = { width: eWidth ,height: eHeight, margin:"3px", border:"0px" };
            var textarea = nc("IFRAME",textAreaStyles);
            textarea.src = this.URL;
            
            na(contentCell,[textarea]);
            na(contentRow,[contentCell]);
            na(textAreaTableBody,[contentRow]);
            na(textAreaTable,[textAreaTableBody]);
            /* END TEXT AREA */

            div.open = function() 
            { 
                this.style.display = ""; 
                this.helper.style.display = "";
                ICDEditor.adjustPosAndSize();
               // if(!ICDEditor.currentField.disabled) { this.txt.focus(); }
            }
            
            var holder,resizer,resizeEvent,resizeEventHandler;
            holder = (holder=document.getElementById(this.editorContainer)) ? holder : document.body;
            evtHandler = function() { setTimeout(function() { ICDEditor.adjustPosAndSize(); },1); };
            resizer=document.getElementById('ExpandPatientDataButton');
            if(resizer) 
            {
                resizer.attachEvent ? resizer.attachEvent('onclick',evtHandler) : resizer.addEventListener('click',evtHandler,false);
            }
            div.container = holder;
            na(div,[textAreaTable]);
            na(holder,[div,helper]);
            this.editor = div;
            this.active = true;
        }
    },
    show: function(fieldId,maxLen) 
    {
        if(!this.active) { this.init(); }
        if(this.onOpen) { this.onOpen(fieldId); }
        var field = document.getElementById(fieldId);
        this.currentField = field;
        this.editor.open(); 
    },
    setFieldValue: function(val)
    {
        if(this.currentField)
        {
            this.currentField.value = val;
        }
    },
    setAnyFieldValue: function(fieldId, val)
    {
        if(document.getElementById(fieldId))
        {
            var field = document.getElementById(fieldId);
            field.value = val;
        }
    },
    findAnyFieldBySubString: function(fieldName, val)
    {
        // tries to find a match with any text or select box by a substring of the id (not case sensitive)
        for(i=0; i<document.forms[0].elements.length; i++)
        {       
            var type = document.forms[0].elements[i].type.toLowerCase();
            if(type == "text" || type == "select" || type=="hidden")
            {
                var idName = document.forms[0].elements[i].id.toLowerCase();
                var instanceFound = idName.indexOf(fieldName.toLowerCase());
                if(instanceFound > -1) // we found it
                {
                    document.forms[0].elements[i].value = val;
                    
                    if(type == 'hidden') // there could be corresponding label to show the data
                    {
                        var spanArray = document.getElementsByTagName("span");

                        for(j=0; j<spanArray.length; j++)
                        {  
                            var displayIdName = idName + "Display";
                            var elementName = spanArray[j].id.toLowerCase();
                            var displayInstanceFound = elementName.indexOf(displayIdName.toLowerCase());
                            if(displayInstanceFound > -1)
                            {
                                spanArray[j].innerHTML = val;
                            }
                        }
                    }
                }
            }
        }
    },
    close: function() 
    { 
        if(this.onClose) { this.onClose(this.currentField); }
        this.editor.style.display = 'none'; 
        this.editor.helper.style.display = 'none';
    },
    adjustPosAndSize: function()
    {
        if(this.editor.display != 'none')
        {
            var d = this.editor;
            var h = this.editor.helper;
            var container = this.editor.container;   
            var eWidth = this.editorWidth;
            var left = eWidth > container.offsetWidth ? 0 : ( (container.offsetWidth-eWidth)/2 );
            var top = getTopPos(this.currentField);
            if(top - 150 >0)
            {
                d.style.top = top - 150 + 'px';
                h.style.top = top - 150 + 'px';
            }
            Node.SetStyles(h,{width: d.offsetWidth + 'px',height:d.offsetHeight + 'px',left: left + 'px'});
            Node.SetStyles(d,{left: left + 'px'});
        }
    }
};
// END ICD10 EDITOR




// CTCAE Editor
var CTCAEEditor = 
{ 
    enabled: true,
    active: false,
    URL: top.APP_PATH +  'Core/Utilities/CTCAEWizard.aspx', // APP_PATH Registered in the header
    editor: null,
    onOpen: function() { },
    onClose: function(f) { },
    currentField: null,
    // The following variables can be override on pages using editor, as these values
    // aren't used until editor is clicked to open, 
    //i.e.(NodesEditor.editorWidth = 700; will makes editor 700 pixes wide on page)
    editorContainer: '',  //specifies the default container in which to center editor, else center in body
    editorWidth: 700, // specifies the static width to the editor
    editorHeight: 235, // specifies the static height to the editor
    init: function()
    {
        if(!this.active) // Becomes active when inserted into DOM
        {
            var nc=Node.Create,nt=Node.CreateText,na=Node.Append;
            /* CONTAINER w/ IFrame Helper */
            var divStyles = {position:"absolute",top:"100px",zIndex:"100",border:"none",display:"none" };
            var div = nc("DIV",divStyles);
            divStyles["zIndex"]="99";
            var helper = nc("IFRAME",divStyles);
            div.helper = helper;
            /* END CONTAINER */ 
       
            var textAreaTableStyles = { width:'430px',backgroundColor:'#ffffff',border:'solid 1px #333333',cellSpacing:'0' };
            var textAreaTable = nc("TABLE",textAreaTableStyles);
            
            textAreaTable.cellPadding = '0';
            textAreaTable.cellSpacing = '0';
            
            var textAreaTableBody = nc("TBODY");

            /* HEADER SECTION (Title, Close Button) */
            var headerRow = nc("TR");
            var headerStyles = { backgroundColor: '#8d2a2c', color: '#ffffff', padding:'4px',fontSize:'12px',fontWeight: '600' };
            var headerCell = nc("TD",headerStyles);
             
            var closeImgStyle = { marginTop:'3px',marginRight:'2px' };
            var CloseImg = nc('IMG',closeImgStyle);
            // APP_PATH registered in Header
            CloseImg.src = (top.APP_PATH ? top.APP_PATH : '../../') + 'Images/CloseSmall.gif';
            CloseImg.alt = 'close';
            CloseImg.className = 'PDButtonOn';
            CloseImg.align = 'right';
            var closeHandler = function() { ICDEditor.close(); }
            Event.Register('click',CloseImg,closeHandler,false);

            var titleTextSpan = nc("SPAN");
            var titleText = nt('ICD Wizard');
            var charStyles =  { paddingLeft: "250px",fontWeight : "normal", fontSize : '10px', color : '#dddddd' };
            var charCounter = nc("SPAN",charStyles);
            div.charCounter = charCounter;
            
            na(titleTextSpan,[titleText])
            na(headerCell,[CloseImg,titleTextSpan,charCounter]);
            na(headerRow,[headerCell]);
            na(textAreaTableBody,[headerRow]);
            /* END - HEADER SECTION (Title, Close Button) */
            
            /* TEXT AREA */
            var contentRow = nc("TR");
            var contentCell = nc("TD");
            // Sets the width and height of editor, defaults  to 500x200
            var eWidth = this.editorWidth + 'px';
            var eHeight = this.editorHeight + 'px';
            var textAreaStyles = { width: eWidth ,height: eHeight, margin:"3px", border:"0px" };
            var textarea = nc("IFRAME",textAreaStyles);
            textarea.src = this.URL;
            
            na(contentCell,[textarea]);
            na(contentRow,[contentCell]);
            na(textAreaTableBody,[contentRow]);
            na(textAreaTable,[textAreaTableBody]);
            /* END TEXT AREA */

            div.open = function() 
            { 
                this.style.display = ""; 
                this.helper.style.display = "";
                CTCAEEditor.adjustPosAndSize();
               // if(!ICDEditor.currentField.disabled) { this.txt.focus(); }
            }
            
            var holder,resizer,resizeEvent,resizeEventHandler;
            holder = (holder=document.getElementById(this.editorContainer)) ? holder : document.body;
            evtHandler = function() { setTimeout(function() { ICDEditor.adjustPosAndSize(); },1); };
            resizer=document.getElementById('ExpandPatientDataButton');
            if(resizer) 
            {
                resizer.attachEvent ? resizer.attachEvent('onclick',evtHandler) : resizer.addEventListener('click',evtHandler,false);
            }
            div.container = holder;
            na(div,[textAreaTable]);
            na(holder,[div,helper]);
            this.editor = div;
            this.active = true;
        }
    },
    show: function(fieldId,maxLen) 
    {
        if(!this.active) { this.init(); }
        if(this.onOpen) { this.onOpen(fieldId); }
        var field = document.getElementById(fieldId);
        this.currentField = field;
        this.editor.open(); 
    },
    setFieldValue: function(val)
    {
        if(this.currentField)
        {
            this.currentField.value = val;
        }
    },
    setAnyFieldValue: function(fieldId, val)
    {
        if(document.getElementById(fieldId))
        {
            var field = document.getElementById(fieldId);
            field.value = val;
        }
    },
    findAnyFieldBySubString: function(fieldName, val)
    {
        // tries to find a match with any text or select box by a substring of the id (not case sensitive)
        for(i=0; i<document.forms[0].elements.length; i++)
        {       
            var type = document.forms[0].elements[i].type.toLowerCase();
            if(type == "text" || type == "select" || type=="hidden")
            {
                var idName = document.forms[0].elements[i].id.toLowerCase();
                var instanceFound = idName.indexOf(fieldName.toLowerCase());
                if(instanceFound > -1) // we found it
                {
                    document.forms[0].elements[i].value = val;
                    
                    if(type == 'hidden') // there could be corresponding label to show the data
                    {
                        var spanArray = document.getElementsByTagName("span");

                        for(j=0; j<spanArray.length; j++)
                        {  
                            var displayIdName = idName + "Display";
                            var elementName = spanArray[j].id.toLowerCase();
                            var displayInstanceFound = elementName.indexOf(displayIdName.toLowerCase());
                            if(displayInstanceFound > -1)
                            {
                                spanArray[j].innerHTML = val;
                            }
                        }
                    }
                }
            }
        }
    },
    close: function() 
    { 
        if(this.onClose) { this.onClose(this.currentField); }
        this.editor.style.display = 'none'; 
        this.editor.helper.style.display = 'none';
    },
    adjustPosAndSize: function()
    {
        if(this.editor.display != 'none')
        {
            var d = this.editor;
            var h = this.editor.helper;
            var container = this.editor.container;   
            var eWidth = this.editorWidth;
            var left = eWidth > container.offsetWidth ? 0 : ( (container.offsetWidth-eWidth)/2 );
            var top = getTopPos(this.currentField);
            if(top - 150 >0)
            {
                d.style.top = top - 150 + 'px';
                h.style.top = top - 150 + 'px';
            }
            Node.SetStyles(h,{width: d.offsetWidth + 'px',height:d.offsetHeight + 'px',left: left + 'px'});
            Node.SetStyles(d,{left: left + 'px'});
        }
    }
};
// END ICD10 EDITOR


/*********************** End Calculation Scripts ****************************/


function executeEFormComboEvent(selVal, inputFieldName)
{
    if(this.executePageEventOnComboClick != null) { executePageEventOnComboClick(selVal, inputFieldName); }
}

/* DOM HELPERS */

// Xml Helper Method to extract value of XML Node
function getNodeValue(n) { return n?(n.nodeType == 1 ? getNodeValue(n.childNodes[0]) : n.nodeValue) : ''; }

// @nodeToImport: the external document's node to import (i.e., XML node)
// @ownerDoc: the ownerDocuemnt representing the internal node's document object (i.e., document.getElementById('domId').ownerDocument)
function getImportedXmlNode(nodeToImport, ownerDoc) {
    // W3C standard, but IE9 standards has issues (add exception)
    try {
        if (ownerDoc.importNode) {
            return ownerDoc.importNode(nodeToImport, true)
        }
    }
    catch (ex) {
    }

    // fallback method
    var div = ownerDoc.createElement('DIV');
    div.innerHTML = nodeToImport.xml;
    return div.firstChild;
}

/* 
// STYLE RELATED FUNCTIONS 
*/
function setNodeVisibility(n,v,d1,d2) { if(v!=null) n.style.visibility = v; if(d1!=null) n.style.display = d2 ? d2 : d1; }
function isNodeHidden(n) { return n.style.visibility == 'hidden' || n.style.display == 'none'; }
function isNodeVisible(n) { return !isNodeHidden(n); }
function setNodeTransparency(node,level)
{
    if(node.style.filter!=null) { node.style.filter = 'alpha(opacity=' + level + ')'; }
    else if(node.style.opacity!=null) { node.style.opacity = level/100.0; }
}
// POSITIONING
function getTopPos(obj) { return posHelper(obj,'top'); }
function getLeftPos(obj) { return posHelper(obj,'left'); }
function centerNode(node,container) { centerNodeHorizontally(node,container);  centerNodeVertically(node,container); }
function centerNodeHorizontally(node,container) { setNodePositioningHelper(node,container,'width','left','Width'); }
function centerNodeVertically(node,container) { setNodePositioningHelper(node,container,'height','top','Height'); }
// STYLE HELPERS
var IGNORE_TABLE_OFFSET = false;

function posHelper(obj,dir)
{
    // signals if to account for table nesting
    var ignore = IGNORE_TABLE_OFFSET != null ? IGNORE_TABLE_OFFSET : false;
    var endloop = false, tablePos = 0, tableCount = 0, pos = 0;
    if(obj.offsetParent)
    {
        pos  = dir == 'top' ? obj.offsetTop : obj.offsetLeft;
        while( (obj = obj.offsetParent) && !endloop )
        {
            if(obj.nodeName == "BODY") { endloop = true; break; }
            if(obj.style.position != 'relative') { pos+= dir == 'top' ? obj.offsetTop : obj.offsetLeft; }
            if(obj.tagName == "TABLE" && !ignore)
            {
                tablePos = pos;
                tableCount++;
                if(obj.parentNode.nodeName == "DIV") { return pos; }
            } 
        }
    }
    return !ignore && tableCount > 1 ? tablePos : pos;
}

function setNodePositioningHelper(n,c,p1,p2,op)
{
    c = c || window;
    var propNum,isPerc,conSize,unit,newSize;
    // If using style property, extract number
    if(n.style[p1]!='')
    {
        var prop = n.style[p1];
        propNum = parseInt(prop);
        isPerc = prop.contains('%');
    }
    // else use node's offset size
    else
    {
        propNum = n['offset' + op];
    }           
    // If using %, left/top is based on (container - node) /2
    if(isPerc) { newSize = 100>propNum ? ( (100 - propNum) / 2 ) : 0; }
    // if container is window object, use getWidth/getHeight for dimension
    // else use offsetWidth/offsetHeight on node
    else
    {
        var winExpr = 'c.inner' + op + ' || c.document.documentElement.client' + op + ' || c.document.body.client' + op;
        var conExpr = "c['offset" + op + "']";
        conSize = eval(c.frames && c.top ? winExpr : conExpr);
        newSize = conSize > propNum ? ( (conSize - propNum) / 2 ) : 0;
        
    }
    // Determine if using % of px as dimension
    unit = isPerc ? '%' : 'px';
    // Finally set new size using style property
    n.style[p2] = newSize + unit;
}

function initListControlEvents(label,listId,charCount)
{
    var listLabel = $(label);
    if(listLabel.init == null)
    {
        var list = $(listId);
        list.tag('INPUT').foreach(curry(initListControlItem,listLabel,list));
        // close on mouse leave
        var leaveEvent = function(n,e) { if(isMouseLeave(n,e)) n.style.display = 'none'; }
        $(list).addEvent('mouseout',curry(leaveEvent,list));
        listLabel.init = true;
    }
}

function initListControlItem(label,table,input,index)
{
    var inputText = $(table).tag('LABEL')[index].innerHTML;
    var inputs = $(table).tag('INPUT');
    var labels = $(table).tag('LABEL');
    $(table).style.backgroundColor = 'White';
    $(table).style.boder = '1px solid #999999';
    $(input).addEvent('click', curry(setListLabel,label,inputs,labels));
    $(label).addEvent('click', function() 
    { 
        $(table).style.display = 'block';
        $(table).style.top = getTopPos(label) + 'px';
        $(table).style.left = getLeftPos(label) + 'px';
        var labelWidth = label.offsetWidth;
        var tableWidth = table.offsetWidth;
        if(labelWidth>tableWidth)
        {
            table.style.width = labelWidth + 'px';
        }
    });     
}

var WHITE_SPACE = '\u00a0';
function setListLabel(label,inputs,labels)
{
    var checkSelected = function(n,i) { return n.checked ? getNodeValue(labels[i]) : null; }
    var foundValues = inputs.map(checkSelected,this,false);
    var listLabelText = foundValues.join(', ');
    var originalText = listLabelText;
    
    var LABEL_CHAR_WIDTH = 25;
    var ELLIPSIS = '..';
       
    // trim label
    if(listLabelText.length>LABEL_CHAR_WIDTH)
    {
        listLabelText = listLabelText.substr(0,LABEL_CHAR_WIDTH - ELLIPSIS.length - 3) + ELLIPSIS;
    }
    var buff = new Array();
    buff.push(listLabelText);
    
    var blankSpacesNeeded = Math.max(LABEL_CHAR_WIDTH - listLabelText.length , 0);

    for(var i=0;i<blankSpacesNeeded;i++) { buff.push(' '); }
    var fullLabelText = buff.join('');
    var listLabelTextNode = document.createTextNode(fullLabelText);
    label.style.whiteSpace = 'normal';
    label.style.wordSpacing = 'normal';
    //$(label).clear();
    //$(label).appendChild(listLabelTextNode);
    label.value = fullLabelText;
    // set title
    label.title = originalText;
}

if(!Browser.queueInit)
{
    var onResize = function() 
    { 
        try { if(Browser.RunResizeQueue) { Browser.RunResizeQueue(Browser); }  }
        catch (e) { }
    }
    Event.Register('resize',Browser,onResize,false);
    Browser.queueInit = true;
}

// Wrap Browser, window and document objects for immediate use.
$.call(window,window);
$.call(window,document);
// Need to call in context of top as to prevent invalid function pointers in child frames
if (Browser != window) { $.call(top, Browser); }

// INPUT HELPER

// during load, wire special focused property for elements
function _initInputHasFocus(container) {
    var inputFields = getInputFieldsInContainer(container);
    if (container._hasFocusInit == true) {
        return;
    }
    // for each element in each form
    for (var i = 0; i < inputFields.length; i++) { 
    
    for (var j = 0; j < inputFields[i].length; j++){
    
        var input = inputFields[i][j];
        if(input.type != 'hidden') {
            // focused property
            //input.focused = false;
            // has focus method 
            input.hasFocus = function() {
                return this.focused;
            };
            // helper function which toggles focused state
            var setFocusState = function(element, isFocused, event) {
                element.focused = isFocused;
            };
            // add event handlers which toggle focus property
            $(input).addEvent('focus', curry(setFocusState, input, true));
            $(input).addEvent('blur', curry(setFocusState, input, false));
        }
    }}
    container._hasFocusInit = true;
}

// add data entry hover to fields
// @container: the id or DOM container reference
function addHoverToDataEntryFields(container) {
    if(window.attachEvent){ return; } // remove when testing done on IE8+
    var addHoverContainer = $(container);
    if (addHoverContainer) {
        var inputFields = getInputFieldsInContainer(addHoverContainer);
        Map(inputFields, function(fields) {
            Map(fields, function(field) {
                if (!field.disabled && field.parentNode && (field.parentNode.className == 'EditDataEntryField_Container' || (field.parentNode.parentNode && field.parentNode.parentNode.className == 'EditDataEntryField_Container'))) {
                    var parent = field.parentNode.className == 'EditDataEntryField_Container' ? field.parentNode : field.parentNode.parentNode;
                    $(field).addEvent('focus', function(ee) {
                        parent.className = 'EditDataEntryField_Container EditDataEntryField_Container_Active';
                    });
                    $(field).addEvent('blur', function(ee) {
                        parent.className = 'EditDataEntryField_Container';
                    });
                }
            });
        });
    }
}

// WINDOW(window) objects which define functions "onWindowLoad" or "onWindowResize" be notified
// when the current WINDOW(window) object has loaded, and when the BROWSER(window.top) has been resized
function _onWindowResize() { if(window.onWindowResize) { window.onWindowResize.apply(window,arguments); } }
function _onWindowLoad(e) { if(window.onWindowLoad) { window.onWindowLoad.apply(window,arguments); } }
Browser.ResizeElement( { customResizer: _onWindowResize });
$(window).addEvent('load', _onWindowLoad);
//$(window).addEvent('load', _initInputHasFocus);

// GRIDS

//// Shows the next hidden grid row
//// @gridId = the DOM id of the grid <TABLE>
//function showNextRow(gridId) {
//    var showSaveRecords = false;
//    var grid = $(gridId);
//    // search grid rows for blank rows
//    for (var i = 0; i < grid.rows.length; i++) {
//        var row = grid.rows[i];
//        // if row is hidden, show and end search
//        if (row.style.display == 'none') {
//            row.style.display = '';
//            showSaveRecords = true;
//            break;
//        }
//    }
//    // if no blank rows found, save to show blank rows
//    if (showSaveRecords) {
//        alert('Please save the form before adding new rows.');
//    }
//    return false;
//}

function getWebAppRoot() {
    var serverBase = window.location.protocol + "//" + window.location.hostname;
    var basePath = "";
    var baseScriptPath = "/ClientScripts/utilities.js";
    var scripts = document.getElementsByTagName("script");
    for (var index = 0; index < scripts.length; index++) {
        var script = scripts[index];
        var src = script.src + "";
        if (src.indexOf(baseScriptPath) > -1) {
            var indexOfUtilities = src.indexOf(baseScriptPath);
            if (indexOfUtilities > -1) {
                basePath = src.substring(0, indexOfUtilities);
                break;
            }
        }
    }
    return basePath + "/";
}

/* Web Services */
var WEB_APP_ROOT = getWebAppRoot();
var JQUERY_PATH = WEB_APP_ROOT + "ClientScripts/jquery.js";

// returns the JSON representation of the object, works on simple types (string, int, bool, array)
// ex:  var o = new Object();
//      o.Name = "James";
//      o.Age = 21;
//      serializeObject(0); => { "Name" : "James", "Age": "21" }
function serializeObject(instance) {
    var buff = new Array();
    for (var key in instance) {
        var value = instance[key];
        // if string, escape value
        if (typeof (value) == typeof ('') || typeof (value) == typeof (1) || typeof (value) == typeof (true)) {
            var escapedValue = value.toString().replace('"', '\\"');
            buff.push('"' + key + '" : "' + escapedValue + '"');
        }
        // if value is instance of Array, serialize array
        else if (value.constructor.toString().indexOf('Array') > -1) {
            var objects = new Array();
            for (var i = 0; i < value.length; i++) {
                objects.push(serializeObject(value[i]));
            }
            buff.push('"' + key + '" : [' + objects.join(',') + ']');
        }
    }
    var json = "{ " + buff.join(",") + " } ";
    return json;
}

// load jQuery library
function requirejQuery(callback) {
    var onComplete = function () {
        // prevent conflict
        jQuery.noConflict();
        // notify callback
        if (callback)
            callback(jQuery);
    };
    // library loaded, notify
    if (typeof jQuery === "function") {
        onComplete();
    }
    // load library, then notify
    else {
        var script = document.createElement("script");
        script.onload = onComplete;
        script.type = "text/javascript";
        script.src = JQUERY_PATH;
        var head = document.getElementsByTagName("head");
        if (head.length > 0)
            head[0].appendChild(script);
    }
}

function defineCaisisService(params) {
    var serviceURL =   params.url;
    var serviceMethods = params.methods;

    function defineMethod(method) {
        // get path to service (resolve full path)
        var pathToService = serviceURL.indexOf("/") == 0 ? WEB_APP_ROOT + serviceURL.substr(1) : serviceURL;
        // get path to method
        var pathToServiceMethod = pathToService + "/" + method;

        // return defined function
        return function (params) {
            // lazily load jQuery
            requirejQuery(function (jQuery) {                
                var _data = params.data;
                var _onSuccess = params.success;
                var _onError = params.error;
                jQuery.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: pathToServiceMethod,
                    //data: JSON.stringify(_data || {}),
                    data: serializeObject(_data || {}),
                    dataType: "json",
                    success: function (response) {
                        // .NET json "feature"
                        var serviceData = response.d != null ? response.d : response;
                        if (_onSuccess)
                            _onSuccess(serviceData);
                    },
                    error: function () {
                        if (_onError)
                            _onError();
                    }
                });
            });
        }
    }

    var _methods = {};
    for (var index in serviceMethods) {
        var methodName = serviceMethods[index];
        _methods[methodName] = defineMethod(methodName);
    }
    return _methods;
}

var PatientSearchService = defineCaisisService({
    url : "/Services/PatientSearchService.asmx",
    methods: ["Search"]
});

var LookupCodeService = defineCaisisService({
    url: "/Services/LookupCodeService.asmx",
    methods: ["GetLookupCodes", "GetLookupDistinct", "GetParentCodeByChildCode"]
});

var ContactService = defineCaisisService({
    url: "/Services/ContactService.asmx",
    methods: ["GetContactInfo"]
});

