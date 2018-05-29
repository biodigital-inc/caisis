/*
// MODAL (require jQuery & jQuery UI library)
// - contains functionatlity for loading page into modal iframe url
// - must be placed in top level page
*/

/* CONSTANTS */

var MIN_MODAL_HEIGHT = 100;
var MIN_MODAL_WIDTH = 100;

// deprecated: track only window path
var CURRENT_MODAL_CALLER;

var CURRENT_MODAL_CALLER_PATH;
var CURRENT_MODAL_CONFIG;

// events
// windows calling show modal can subscribe to modal event, by defining methods to handle events
// i.e. function onModalClose(modalCaller, modalFrame) { ... }
var EVENT_MODAL_LOADED = 'onModalLoaded';
var EVENT_MODAL_PRINT = 'onModalPrint';
var EVENT_MODAL_SHOW = 'onModalShow';
var EVENT_MODAL_CLOSE = 'onModalClose';
 
// A configurate object used to configure various default aspects of a modal window
function ModalConfig() {
    // default modal background color
    this.color = '#000000';
    this.level = '25';
    this.width = '900px';
    this.height = '500px';
    this.context = null;
    this.showPrint = true;
    this.showClose = true;
    this.openHandler = null;
    this.closeHandler = null;
    this.printHandler = null;    
}

/* MODAL METHODS */

// show a modal with default configuration
function showModal(url, title, context) { showModalWithConfig(url, title, { context: context }); }

// Show a modal with user configured values, such as widht, height, etc..
// ex: showModalWithConfig('Index.aspx','My Main Page', { width: '200px', height: '80%' } );
// @url: the url to load into the modal ifram
// @title: the title to set for modal window
// @config: optional configuration options as object, { height: '200px', showPrint: true }
// @_context(LEGACY): optional window object representing the window initiating the modal call
function showModalWithConfig(url, title, config, _context) {

    // IMPORTANT: ensure modal initilized
    initModalWindow();
    
    title = title ? title : '';
    // Create a new instance of the default configuration
    var baseConfig = new ModalConfig();
    // Copy configurations if user supplied configuration
    if (config) {
        for (var k in config) {
            // dont copy null values
            if (config[k] != null) {
                baseConfig[k] = config[k];
            }
        }
    }
	// LEGACY: legacy calls with extra context, moved to object config
	if(_context) { baseConfig.context = _context; }
	
	
    // Assign new reference to modal
    // Browser.modal = new Modal(Browser,baseConfig);
    var context = baseConfig.context;
    CURRENT_MODAL_CALLER = context ? context : null;
    CURRENT_MODAL_CALLER_PATH = context ? getWindowPath(context) : null;
    CURRENT_MODAL_CONFIG = baseConfig;

    // set modal opacity
    setModalOpacityByConfig(baseConfig);
    // set title
    setModalTitle(title);
    // show window
    _showHideModal(true);
    
    // set iframe url
    var modalFrame = jQuery('#modalFrame');
    modalFrame.attr('src', url);

    setModalSize(baseConfig.width, baseConfig.height);

    // set print button
    var modalPrintBtn = jQuery('#ModalPrintButton');
    if (baseConfig.showPrint) {
        modalPrintBtn.show();
    }
    else {
        modalPrintBtn.hide();
    }

    // set close button
    var modalCloseBtn = jQuery('#ModalCloseButton');
    if (baseConfig.showClose) {
        modalCloseBtn.show();
    }
    else {
        modalCloseBtn.hide();
    }

    // signal open event
    _onModalShow();
    
    return false;
}

// hides the modal windows
function hideModal() {
    // signal close event
    var returnValue = _onModalClose();
    if (returnValue == false) {
        return false;
    }
    else {
        // hide modal
        _showHideModal(false);
        // reset active callers
        CURRENT_MODAL_CALLER = null;
        CURRENT_MODAL_CALLER_PATH = null;
        CURRENT_MODAL_CONFIG = null;
        // reset src
        jQuery('#modalFrame').attr('src','');
        
        return false;
    }
}

// prints the contents of the modal window
function printModal() {
    // signal print event
    var returnValue = _onModalPrint();
    if (returnValue == false) {
        return false;
    }
    else {
    
        var callingPage = getModalCallingWindow();
        if (callingPage != null)
        {
            if (callingPage.location.toString().indexOf('EFormList') > -1 && jQuery(top.window).width() > 1024 && jQuery.browser.msie)
            {
                top.window.resizeTo(1024,jQuery(top.window).height());
                
                // if window is still too big, then confirm with user, probably has multiple tabs open
                if (callingPage.location.toString().indexOf('EFormList') > -1 && jQuery(top.window).width() > 1024)
                {
                    var multipleTabMsg = 'You have multiple tabs open. To ensure the form prints correctly, please cancel';
                       multipleTabMsg += '\nand close any additional tabs in Internet Explorer prior to printing again.';
                       multipleTabMsg += '\n\nClick OK to print or Cancel to stop printing.';
                    
                    var printAnyway = confirm(multipleTabMsg);
                    if (printAnyway == false) return;
                }
            }
        }
    
        var modalFrame = window.top.frames['modalFrame'];
        modalFrame.focus();
        modalFrame.print();
    }
}

// shows or hides modal window and opaque background
// @doShow: true or false if to show modal window
function _showHideModal(doShow) {
    // ensure modal initilized
    initModalWindow();
    
    var doAction = doShow ? 'show' : 'hide';
    // background opacity
    jQuery('#ModalContainerOpacity')[doAction]();
    // modal containment
    jQuery('#ModalContainment')[doAction]();
    // modal layer
    jQuery('#ModalContainer')[doAction]().draggable({ containment: '#ModalContainment' });
    // IE fix
    if (doShow) { doModalIEFix(); }
    
    return false;
}

/* SETTERS */

// sets the title in the modal window
// @title: the modal title text
function setModalTitle(title) {
    jQuery('#modalTitle').text(title);
    return false;
}

// sets the width and height of modal frame
// @width: the width as an int
// @height: the height as an int
function setModalSize(width,height)
{
    var modalFrame = jQuery('#modalFrame');
    // normalize widths and heights into ints
    height = height.toString();
    width = width.toString();
    if (height.indexOf('%') > -1) {
        height = parseInt(height) / 100;
        height = jQuery(window.top).height() * height;
        height = Math.max(MIN_MODAL_HEIGHT, height);
    }
    else {
        height = parseInt(height);
    }
    if (width.indexOf('%') > -1) {
        width = parseInt(width) / 100;
        width = jQuery(window.top).width() * width;
        width = Math.max(MIN_MODAL_WIDTH, width);
    }
    else {
        width = parseInt(width);
    }
    // modal frame should be within bounds of containment, i.e., modal should stretch off screen
    var buffer = 50;
    var containment = jQuery('#ModalContainment');
    if (height + buffer >= containment.height()) {
        height = height - (buffer * 2);
    }
    if (width + buffer >= containment.width()) {
        width = width - (buffer * 2);
    }
    
    // set modal width and height as 'px'  
    modalFrame.height(height + 'px');
    modalFrame.width(width + 'px');
    
    // center modal
    setModalCenter();
    // IE-fix
    doModalIEFix();

    return false;
}

// centers modal window in page
function setModalCenter() {
    var modalContainer = jQuery('#ModalContainer');
    modalContainer.css("top", (jQuery(window).height() - modalContainer.height()) / 2 + jQuery(window).scrollTop() + "px");
    modalContainer.css("left", (jQuery(window).width() - modalContainer.width()) / 2 + jQuery(window).scrollLeft() + "px");
}

// sets the modal window background opacity level
// @config: modal config object
function setModalOpacityByConfig(config) {
    var cfg = config ? config : new ModalConfig();
    setModalOpacity(cfg.color, cfg.level);
}

// sets the modal window background opacity level
// @color: the modal color
// @opacity: 1 - 100
function setModalOpacity(color, opacity) {
    var modalOpacityDOM = jQuery('#ModalContainerOpacity');
    var cssOpacity = opacity / 100; // generate a decimal, i.e., 25 -> 0.25 ->25 % opacity
    if (color && color != '') {
        modalOpacityDOM.css('background-color', color);
    }
    if (cssOpacity && cssOpacity != 'NaN') {
        modalOpacityDOM.css('opacity', cssOpacity);
    }
}

/* GETTERS */

// gets the modal window title
function getModalTitle() {
    return jQuery('#modalTitle').text();
}

// gets the current path of the modal iframe
function getModalPath() {
    return jQuery('#modalFrame').attr('src');
}

// gets a reference to the window which originally loaded the popup
// NOTES: hold on to path as string, rather the window object to prevent leaks
function getModalCallingWindow() {
    if (CURRENT_MODAL_CALLER_PATH && CURRENT_MODAL_CALLER_PATH != '') {
        // attempt to get reference of the calling window by path, i.e., window.top.frames[2]
        try {
            var currentModal = eval(CURRENT_MODAL_CALLER_PATH);
            return currentModal;
        }
        catch (e) {
            return null;
        }
    }
    return null;
}

// backward-compatible call
var getCallingWindow = getModalCallingWindow;

/* 
EVENTS 
event will fire on windows which load modal
can be triggered anytime
*/

// signal modal loaded
function _onModalLoaded() {
    return _invokeModalEvent(EVENT_MODAL_LOADED);
}

// signal modal showing
function _onModalShow() {
    return _invokeModalEvent(EVENT_MODAL_SHOW, 'openHandler');
}

// signam modal close
function _onModalClose() {
    return _invokeModalEvent(EVENT_MODAL_CLOSE, 'closeHandler');
}

// signal modal print
function _onModalPrint() {
    return _invokeModalEvent(EVENT_MODAL_PRINT, 'printHandler');
}

// invoke an event on modal calling window, such as function in opening window
// @eventName (string): the name of the modal event to execute
// @arguments: optional arguments which are passed to modal caller
// @optConfigHandler: optional config handler name
// ex: _invokeModalEvent('addNumbers',1,7);
//     function addNumbers(num1, num2) { ... }
function _invokeModalEvent(eventName, optConfigHandler) {
    // invoke on modal and calling windows
    var modalFrame = window.top.frames['modalFrame'];
    var caller = getModalCallingWindow();
    
    // INVOKE CONFIG HANDLERS: invoke handlers from show modal config
    if (CURRENT_MODAL_CONFIG && optConfigHandler && CURRENT_MODAL_CONFIG[optConfigHandler]) {
        // invoke with current context and modal
        var thisContext = caller ? caller : this;
        CURRENT_MODAL_CONFIG[optConfigHandler].call(thisContext, modalFrame, caller);
    }
    
    // pass along arguments to caller method
    var args = [caller, modalFrame];
    // for arguments passed to this method, excluding call and modalFrame args
    for (var i = 2; i < arguments.length; i++) { args.push(arguments[i]); }
    var returnValue = null;
    
    // INVOKE HANDLERS IN MODAL FRAME
    if (modalFrame[eventName]) {
        returnValue = modalFrame[eventName].apply(modalFrame, args);
    }
    
    // INVOKE HANDLERS ON CALLING WINDOW
    if (caller != null && caller[eventName]) {
        var invokeWindowValue = caller[eventName].apply(caller, args);
        // if popup returned false, honor return value, else check for invoke window
        if (returnValue != false && invokeWindowValue != null) {
            returnValue = invokeWindowValue;
        }
    }
    return returnValue;
}

// fixes IE-bug by statically setting height on modal opacity
function doModalIEFix() {
    // IE-fix to adjust modal height
    if (window.attachEvent) {
        // reset opacity fix
        setModalOpacityByConfig(CURRENT_MODAL_CONFIG);
    }
}

// adjust DOM of modal by moving background and modal layer
// directly under document BODY for better positioning
function adjustModalDOM() {
    var modalDOMList = ['ModalContainerOpacity', 'ModalContainer', 'ModalContainment'];
    for (var i = 0; i < modalDOMList.length; i++) {
        var node = document.getElementById(modalDOMList[i]);
        // extract node form parent and place under BODY
        document.body.appendChild(node.parentNode.removeChild(node));
    }
}

// initilizes required modal functionality
function initModalWindow() {
    // init adjust dom and add resize handler
    if (jQuery(window.top).data('ModalResizeInit') != true) {
        // adjust modal DOM
        adjustModalDOM();        
        // add resize handler, adjust based on current config if applicable
        jQuery(window).resize(function() {
            // adjust modal size based on current config/default config
            var config = CURRENT_MODAL_CONFIG ? CURRENT_MODAL_CONFIG : new ModalConfig();
            setModalSize(config.width, config.height);
        }).data('ModalResizeInit', true);        
    }
}