<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminTimeline.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminTimeline" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SchemaTimeline</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>

    <script type="text/javascript">
    /* <![CDATA[ */

    // supress conflict with Caisis $ function
    jQuery.noConflict();
    
    /* START INIT: when DOM ready, initalize event handlers */
    jQuery(document).ready(function()
    {
        // GLOBAL: applies to all data entry types (pre-study and on-study)
        
        // popup data entry layers
        var popupLayerContainer = jQuery("#TimelineTabPopupDiv");
        // a list of all header tabs
        var dataEntryTabs  = jQuery(".TimelineTab");
        // a list of all popup data entry layers
        var dataEntryPopupLayers = jQuery(".TimelineTabLayer");
        // a list of all close buttons in popup layers
        var dataEntryCloseBtns = jQuery(".DataEntryCloseBtn");
        
        // CLOSE LAYERS:
        
        var closeAllDataEntryPopups = function() {
        // close popup
            dataEntryPopupLayers.hide();
            // hide scroller helper
            popupLayerContainer.hide();
        }
        
        // when clicking on close button, should close data entry layer
        dataEntryCloseBtns.click(function(e) {
            closeAllDataEntryPopups();
        });
        
        dataEntryTabs.each(function(index, tab) {
            var displayTextLink = jQuery(tab).find("bufferDisplay");
        });
         
        /*
        * For each On Study layer, initilize data entry helpers
        */
        jQuery(".TimelineTab_OnStudy").each(function(index,layer)
        {
            var dependentRow = jQuery(this).find(".IntervalTypeDependant");
            var recurringRow = jQuery(this).find(".IntervalTypeRecurring");
            var recurringLayer = jQuery(this).find(".RepeatVisitLayer");
            var dataEntryLayer = jQuery(this).find(".TimelineTabLayer_OnStudy");

            /*
            * SHOW, HIDE DATA ENTRY
            * Shows and hides the main data enrty downdown layer when clicking on visit label
            */
            
            /*
            * LABELS, INTERVAL AND BUFFER
            * When data entry fields are updated in popup layer,
            * updated assocaited header display text or input field.
            *
            * <span id="TimelineTabLayer_1_DisplayField" />
            * <input id="...VisitLabel..." class="VisitLabel" />
            */
            var fields = ['VisitLabel','DisplayUnitName','NumberOfUnits','BufferNumberOfUnitsPlus','BufferNumberOfUnitsMinus','BufferUnitName'];
            // for each of the specified fields, create update handler
            jQuery.each(fields, function(i, name)
            {
                // display field has special naming convention
                var displayField = jQuery(layer).find('#TimelineTabLayer_' + index + '_' + name);
                // input field has CSSClass = Field name
                var inputField = jQuery(layer).find(':input.' + name);
                // for input fields on the UI not saved, update real fields             
                if(displayField.is(':input')){
                    // set real field when display field updates
                    displayField.change(function(e) {
                        inputField.val(displayField.val());
                    });
                    // set display field when input updated
                    inputField.change(function(e) {
                        displayField.val(inputField.val());
                    });
                }
                else{
                     // when input field changes value, update header display text 
                    inputField.change(function(e) {
                        var inputFieldValue = jQuery(this).val();
                        // update display text (span,etc...)
                        displayField.text(inputFieldValue);
                        // if multiple fields, update fields
                        inputField.val(inputFieldValue);
                    });
                }
            });

            // CHOOSE INTERVAL TYPE
            
            // closes the advanced layer
            var doCloseAdvancedLayer = function() {
                recurringLayer.hide();
            };
            
            var doIntervalAdjust = function() {
                // hide all exisitng pop ups
                //jQuery(".RepeatVisitLayer").hide();
                // show layer
               recurringLayer.show();
               
  /*             
               var position = recurringLayer.offset();
               alert(position.left);
               if (position.left > 400)
               {
                    recurringLayer.addClass("RepeatVisitLayerFlipped");
                    dataEntryLayer.offset({ top: 0, left: 0 });
               }
//               recurringLayer.offset({ top: 0, left: -0 });
               
//              dataEntryLayer.offset({ top: 0, left: -0 });
   */            
                           
            };
                        
            // ADVANCED OPTIONS
            
            // the text in popup layer and visit layer giving description of full advanced scheduling
            var advancedSchedulingText = jQuery(this).find(".advancedSchedulingText");
            
            // DEPENDENT
            // reference to list of visits to depend upon
            var dependentVisit = jQuery(this).find(".DependantVisistsSelect");
            var dependentItem = jQuery(this).find(".DependentVisitItems");
            var dependentPatientStatus = jQuery(this).find(".PatientStatusesDropDown");
            
            var dependentStatusUnitName = jQuery(this).find(".DependentVisitDisplayUnitName");
            var dependentStatusNumUnits = jQuery(this).find(".DependentVisitNumberOfUnits");
            
            // remove recurring visit matching this visit (visit doesn't depend on itself)
            //dependentSelect.find('option:eq(' + index + ')').remove();

            // RECURRING LAYER
            var displayUnitName = jQuery(this).find(":input.DisplayUnitName");
            
            var recurringInterval = jQuery(this).find(".RecurringIntervalType");
            var recurringIntervalText = jQuery(this).find(".RecurringIntervalText");
            var recurringEvery = jQuery(recurringLayer).find(":input.RecurringVisitsEvery");
            var repeatFor = jQuery(recurringLayer).find(":input.RecurringIntervalFor");
            var recurringUnitSet = jQuery(this).find(":input.DisplayUnitName");//.add(recurringInterval);
            
            // the number of units in popup layer (anchor unit for depdent/recurring dates)
            var recurringWhen = jQuery(recurringLayer).find(":input.NumberOfUnits");
            // all fields which represent the number of units
            var recurringIntervalSet = jQuery(this).find(":input.NumberOfUnits");
            
            // SYNC UNITS
            var selectedDisplayUnit = displayUnitName.find("option:selected").val();
            recurringInterval.val(selectedDisplayUnit);
            recurringInterval.change(function(e)
            {
                var selectedRecurringUnit = recurringInterval.find("option:selected").val();
                displayUnitName.val(selectedRecurringUnit);
            });
            
            /* CURRENT/PREVIOUS RADIO
            /  represents if visits will repeat after current visit (current)
            /  or if visits will repeat only after previous visit completed (previous)
            */
            var radioCurrent = jQuery(layer).find(".RepeatIntervalCurrent").find(":radio");
            var radioPrevious = jQuery(layer).find(".RepeatIntervalPrevious").find(":radio");
            
            /* ADVANCED OPTIONS
            *  Clicking on advance options checkbox or text
            *  brings up layer for repeat and dependent visit options.
            */
            
            var advancedOptionsCheckbox = jQuery(this).find(".AdvancedOptions").find(":checkbox");
            var advancedOptionsText = jQuery(this).find(".AdvancedOptionsText");
            
            
            // set advanced tab view
            var setAdvancedTabView = function(showAdvanced) {
                if(showAdvanced) {
                    dataEntryLayer.addClass("TimelineTabLayer_OnStudy_Advanced");
                    // hide all exisitng pop ups
                    //jQuery(".RepeatVisitLayer").hide();
                    // show layer
                    recurringLayer.show();
                }
                else {
                    dataEntryLayer.removeClass("TimelineTabLayer_OnStudy_Advanced");
                    recurringLayer.hide();
                }
            };                    
            
            // when checking checkbox show layer
            advancedOptionsCheckbox.click(function(e) {
                var isCheked = isRadioChecked(this);
                // if uncheck triggerd by checkbox, uncheck repeat/dependent
                if(!isCheked) {
                    showHideRepeat(false);
                    showHideDependent(false);
                }
                adjustAdvancedOptions(isCheked);                
            });
            
            // clicking on text always checks box and opens layer
            advancedOptionsText.click(function(e) {                
                adjustAdvancedOptions(true);
            });
            
            // rows which represent previous visit selector
            var dependentLayerRows = jQuery(this).find(".DependentLayerRow");
            // rows which represent recurring logic (selects)
            var repeatLayerRows = jQuery(layer).find(".RepeatLayerRow");
            
            var dependentLayerRowsNormal = jQuery(this).find(".DependentLayerRowNormal");
            var dependentLayerRowsStatus = jQuery(this).find(".DependentLayerRowStatus");
            
            // !! IMPORTANT: the way .NET renders checkbox/radio, css applied to <label>, not <input>
            // checkbox representing if a visit repeats
            var repeatsCheckbox = jQuery(layer).find(".RepeatsCheckBox").find(":checkbox");
            // checkbox representing if a visit is depdendent
            var dependentCheckbox = jQuery(layer).find(".DependentCheckBox").find(":checkbox");
            // radio representing if the visit is dependent on a previous visit item
            var dependentCheckboxNormal = jQuery(layer).find(".DependentCheckBoxNormal").find(":radio");
            // radio representing if the visit is dependent on a patient status
            var dependentCheckboxStatus = jQuery(layer).find(".DependentCheckBoxStatus").find(":radio");
            
            var validateIntervalSelection = function()
            {
                // how often visit repeats (i.e., "Every 2 Weeks")
                var repeatsEvery = parseInt(recurringEvery.val());
                // how long to repeat cycle (i.e., "For 8 Weeks")
                var repeatsHowLong = parseInt(repeatFor.val());
                // create # of dropdown items based on inital server list length
                if(repeatFor.data("intervalLength")==null) {
                    var intervalLength = repeatFor.find("option").size();
                    repeatFor.data("intervalLength", intervalLength);
                }
                var intervals = repeatFor.data("intervalLength");
                // clear drop down
                //repeatFor.html('');
                // generate a new dropdown list varying by multiples of repeatEvery
                for(var i=1;i<=intervals;i++){
                    var multiple = repeatsEvery * i;
                    //repeatFor.append('<option value="' + multiple + '">' + multiple + '</option>')
                }
                // selected value of new dropdown is index 0, if old value was a multiple, choose
                if(repeatsHowLong%repeatsEvery==0) {
                    repeatFor.val(repeatsHowLong.toString());
                }
            };
            
            var showHideRepeat = function(isRepeat) {
                // show repeat layer
                if(isRepeat) {
                    repeatsCheckbox.attr("checked", "checked");
                    repeatLayerRows.show();
                }
                // hide repeat layer
                else {
                    repeatsCheckbox.removeAttr("checked");
                    repeatLayerRows.hide();
                }
            };
            var showHideNormalOrStatusDependent = function()
            {
                var isNormalDependency = isRadioChecked(dependentCheckboxNormal);
                // show normal visit selection
                if(isNormalDependency) {
                    dependentLayerRowsNormal.show();
                    dependentLayerRowsStatus.hide();
                }
                // show status selection
                else {
                    dependentLayerRowsNormal.hide();
                    dependentLayerRowsStatus.show();
                }
            };
            
            var showHideDependent = function(isDependent) {
                // show dependent layer
                if(isDependent) {
                    dependentCheckbox.attr("checked", "checked");
                    dependentLayerRows.show();
                }
                // hide dependent layer
                else {
                    dependentCheckbox.removeAttr("checked");
                    dependentLayerRows.hide();
                }
                showHideNormalOrStatusDependent();
            };
            
            // when checking checkbox show layer
            var adjustAdvancedOptions = function(isAdvanced) {
                if(isAdvanced) {
                    advancedOptionsCheckbox.attr("checked", "checked");
                    doIntervalAdjust();
                }
                else {
                    advancedOptionsCheckbox.removeAttr("checked");
                    doCloseAdvancedLayer();
                    // uncheck repeat and dependent
                    showHideRepeat(false);
                    showHideDependent(false);
                }
                setAdvancedTabView(isAdvanced);
                syncRepeatDependentFields();      
            };
            
            // For the selected visit, filter available list of visit items
            var doAvilableItemFilter = function() {
                // cache html for visit list (will add/remove items as needed)
                if(dependentItem.data("_itemCache") == null) {
                    dependentItem.data("_itemCache", dependentItem.html());
                };
                
                // get reference to main matrix
                var mainTimeline = jQuery("#TimelineMainDiv");
                var cellIndex = dependentVisit[0].selectedIndex;                
                var lookup = {};
                // search thorugh matrix rows,locating checkboxes by selected index
                mainTimeline.find(".TimelineStudySchemaItemRow").each(function(rowIndex, row) {
                    var cell = jQuery(row).find(".TimelineStudySchemaItemCell").eq(cellIndex);
                    var cb = cell.find(":checkbox");
                    if(isRadioChecked(cb)) {
                        lookup[rowIndex] = true;
                    }
                });
                
                // rebuild list of available items from cache
                var cacheHTML = dependentItem.data("_itemCache");
                dependentItem.html(cacheHTML);
                
                // now remove items not which aren't checked in matrix                   
                var visitItems = dependentItem.find("option");
                jQuery(visitItems).each(function(index, option) {
                    var item = jQuery(option);
                    // if no entry exists in look, remove item
                    if(lookup[index]==null) {
                        item.remove();
                    }
                });         
            };
            // when changing visit, update list of available items
            dependentVisit.change(doAvilableItemFilter);
            
            // run inital audit for availale visits
            doAvilableItemFilter();
            
            // set advanced options check state based on repeat and dependent checkboxes 
            var setAdvancedOptionsCheckbox = function() {
                var isAdvanced = isRadioChecked(repeatsCheckbox) || isRadioChecked(dependentCheckbox);               
                adjustAdvancedOptions(isAdvanced);
            };
            
            // click repeat selection toggles repeat layer
            repeatsCheckbox.click(function(e) {
                var checked = isRadioChecked(this);
                showHideRepeat(checked);
                //setAdvancedOptionsCheckbox();
            });
            // click dependent selection toggles dependent layer
            dependentCheckbox.click(function(e) {
                var checked = isRadioChecked(this);
                showHideDependent(checked);
                //setAdvancedOptionsCheckbox()
            });
            // click dependent normal shows previous visit selection
            dependentCheckboxNormal.click(showHideNormalOrStatusDependent);
            // click dependent status shows status section
            dependentCheckboxStatus.click(showHideNormalOrStatusDependent);
            // when dependent on status, default interval (num units) to 0
            dependentCheckboxStatus.click(function(e) {
                if(dependentStatusNumUnits.data('_defaulted') != true) {
                    dependentStatusNumUnits.val(0);
                    dependentStatusNumUnits.data('_defaulted', true);
                }
            });
                      
            // main function to show/hide repeat/dependent options,
            // sync various selects, checkboxes and display text
            var syncRepeatDependentFields = function(e)
            {                
                validateIntervalSelection();
                // get raw selected interval value (i.e., "Day")
                var selectedUnit = jQuery(recurringUnitSet).find("option:selected").val();
                
                // if interval section drop down triggered event, use selected value to sync all interval selects
                var srcElement = e && e.target ? e.target : null;
                if(srcElement != null) {
                    if(jQuery(srcElement).hasClass("DisplayUnitName")) {
                        selectedUnit = jQuery(srcElement).find("option:selected").val();
                    }
                }     
                // sync drop downs
                recurringUnitSet.val(selectedUnit);
                // sync interval
                var intervalValue = recurringWhen.val();
                if(intervalValue != "") {
                    recurringIntervalSet.val(intervalValue);
                }
                           
                // get display text (i.e., "Daily")
                var selectedUnitText = jQuery(recurringUnitSet).find("option:selected").text();

                // set every and for interval text
                recurringIntervalText.text(selectedUnit + "(s)");
                              
                // important: keep track of check state, but have independent value fields
                var isRepeatChecked = repeatsCheckbox.is(":checked");
                var isRepeat = isRepeatChecked;
                var isDependentChecked = dependentCheckbox.is(":checked");
                var isDependent = isDependentChecked;
                
                // advanced display text: the text to display full summary of advanced scheduling
                var advancedText = "";
                
                // advanced visit interval values
                var advancedUnitName = dependentStatusUnitName.val();
                var advancedNumUnits = dependentStatusNumUnits.val();
                var advancedStartDateText = getNormalizeUnitText(advancedUnitName, advancedNumUnits);
                var advancedStartDateFullText = advancedNumUnits==0? "when ": advancedStartDateText + " after ";
                
                // repeating visits interval values
                var repeatsEvery = recurringEvery.val();
                var repeatsEveryText = getNormalizeUnitText(selectedUnit,repeatsEvery);
                var repeatsHowLong = repeatFor.val();
                var repeatsHowLongText= getNormalizeUnitText(selectedUnit,repeatsHowLong);

                // dependent on visit values
               
                // determine if normal or by status
                var isNormalDependency = isRadioChecked(dependentCheckboxNormal);
                var normalDependencyVisit = dependentVisit.find("option:selected").text();
                var normalDependencyItem = dependentItem.find("option:selected").text();
                // dependent on status values
                var statusDependencyValue = dependentPatientStatus.val();
                
                // validate repeat and dependency fields
                // do not uncheck box/hide selection, as user may still choose values
                if(isDependent) {
                    if(isNormalDependency) {
                        isDependent = normalDependencyVisit != "" && normalDependencyItem != "";
                    }
                    else {
                        isDependent = statusDependencyValue != "";
                    }
                }
                if(isRepeat) {
                    isRepeat  = repeatsEvery != "" && repeatsHowLong != "";
                }
                
                // create summary of advanced scheduling section
 
                // dependent visit
                if(isDependent) {
                    
                    // dependent repeating visit
                    if(isRepeat) {
                        var baseRepeatText = "This visit will occur every " + repeatsEveryText + " for " + repeatsHowLongText + " starting " + advancedStartDateFullText;
                        
                        // dependent on previous visit and repeats
                        if(isNormalDependency) {
                            advancedText = baseRepeatText + normalDependencyVisit + "'s " + normalDependencyItem + " is Performed";
                        }
                        // dependent on patient status and repeats
                        else {
                            advancedText = baseRepeatText + "Patient goes " + statusDependencyValue;
                        }
                    }
                    // only dependent visit
                    else {
                        // dependent on previous visit
                        if(isNormalDependency) {
                            advancedText = "This visit will occurs " + advancedStartDateFullText + " " + normalDependencyVisit + "'s " + normalDependencyItem + " is Performed";
                        }
                        // dependent on patient status
                        else {
                            advancedText = "This visit will occurs " +  advancedStartDateFullText + " Patient goes " + statusDependencyValue;
                        }
                    }
                }
                // only repeat visit
                else if(isRepeat) {
                    advancedText = "This visit will repeat every " + repeatsEveryText + " for " + repeatsHowLongText;
                }
                // no advanced scheduing
                else {
                    advancedText = "";
                }
                
                // set advanced text summary and toolip
                advancedSchedulingText.text(advancedText);
                advancedSchedulingText.attr("title", advancedText);
                
                // adjust advanced layers
                showHideRepeat(isRepeatChecked);    
                showHideDependent(isDependentChecked);                         
            };
            
            // each input field in popup layer should call sync operation on change
            jQuery(layer).find(":input").change(syncRepeatDependentFields);
            
            // initalize inital sync events            
            var isCurrentRepeat = isRadioChecked(repeatsCheckbox);
            var isCurrentDependent = isRadioChecked(dependentCheckbox);
            adjustAdvancedOptions(isCurrentRepeat||isCurrentDependent);
            showHideRepeat(isCurrentRepeat);
            showHideDependent(isCurrentDependent);
            syncRepeatDependentFields();
            //setAdvancedOptionsCheckbox();      
        });
        
        // for each visit label input (either display or actual value), update text in depdent visit layer
        jQuery(":input.VisitLabel").each(function(visitIndex,label)
        {
            // when updating visit label, for each recurring visit drop down, update recurring visit text at visit index
            jQuery(label).keyup(function(e)
            {
                var visit = jQuery(this).val();
                jQuery(":input.DependantVisistsSelect").find('option:eq(' + visitIndex + ')').text(visit);
            });          
        });
        // for each repeat visit drop down, adjust pre-study items if supressed
        var validatePreStudyVisits = function(e)
        {
            // adjust dependent visits for pre-study items
            var isPreStudy = jQuery("#<%= ShowHidePreStudy.ClientID %>").is(":checked");
            jQuery(".DependantVisistsSelect").each(function(visitIndex,dependentVisit)
            {
                jQuery(dependentVisit).find("option").each(function(index,option)
                {
                    // if visit drop down item is pre-study, adjust text
                    if(index < <%= PreStudyCount %>){
                        jQuery(option).text(isPreStudy ? "Pre-Study": "");
                    }
                });
            });
        };
        
        // adjust pre-study when toggling
        jQuery("#<%= ShowHidePreStudy.ClientID %>").click(validatePreStudyVisits);
        
        // run inital sync
        validatePreStudyVisits();
        
        /* ADJUST DOM:
        *  After the layers and events have been initalized
        *  move data entry popup layers into main popup container for better positioning
        */
        popupLayerContainer.append(dataEntryPopupLayers);       
    });
    /* END INIT */
    
    // returns if the radio/checkbox is "checked"
    // @radio: a radio/checkbox DOM or selector
    function isRadioChecked(radio) {
        return jQuery(radio).is(":checked");
    }
    
    // normalizes unit text to '1 Day' or '5 Days'
    // @unitName: 'Day','Week', 'Month'
    // @unitAmount: 0-n
    function getNormalizeUnitText(unitName, unitAmount)
    {
        if(unitAmount != null && unitAmount != '') {
            var parseAmount = parseInt(unitAmount.toString());
            return parseAmount + ' ' + unitName + (parseAmount==1 ? '' : 's');
        }
        else{
            return unitName;
        }
  
    }
    
    // Controls if editing Timeline
    var EDIT_TIMELINE_MODE = <%=TimelinePanel.Visible.ToString().ToLower() %>;
    var RECURRING_LOOKUP = new Array();
   
    function goToPrevStep()
    {
        parent.setActiveTab('SchemaItems');
    }
    
    function loadVisits()
    {
        var count = $('SetIntervalTextBox').value;
        var includePreStudy = $('IncludePreStudy').checked;
        var defaultIntervalType = $('DefaultIntervalType').options[$('DefaultIntervalType').selectedIndex].value;
        window.location = '<%= GetQueryString("AdminTimeline.aspx") %>&VisitCount=' + count + '&IncludePreStudy=' + includePreStudy + '&DefaultIntervalType=' + defaultIntervalType;
        return false;
    }

    // Object for containing refernce to active data entry cell/column and popup layer
    var ACTIVE = null;
    var HEIGHT_OFFSET = 235;
    
    // Registers via server at runtime
    // Client Ids list in form of [[],[],...]
    // [['field1_0','field1_1'],['field1_2','field1_2']...]
    var PRE_VISIT_LABEL_LIST = [<%= PRE_VISIT_LABEL_LIST %>];
    var ON_VISIT_LABEL_LIST = [<%= ON_VISIT_LABEL_LIST %>];
    var LAYER_LEFT_DOCK = 0;

    /* START INITIALIZATION
         During initialization (page load), iterate through the list of columns for PRE and ON
         Study Items, and setup client UI events, such as popup data entry layer, and syncing of values
         from data entry layer and header layer.
    */
    function initDataEntry(e)
    {
        initDataEntryList(PRE_VISIT_LABEL_LIST,'TimelineTabLayer_Pre_');
        initDataEntryList(ON_VISIT_LABEL_LIST,'TimelineTabLayer_');
    }
    
    function initDataEntryList(list,prefix)
    {
        for(var i=0;i<list.length;i++)
        {
            var id = prefix + i;
            
            // data entry layer fields which are used for storing Timeline record info
            var dLayer = $(id);
                       
            // extract layer from header cells and move to data entry popup layer
//            dLayer.parentNode.removeChild(dLayer);
//            $('TimelineTabPopupDiv').appendChild(dLayer);
            
            var dVisit = $(list[i][0]);
            var dUnitName = $(list[i][1]);
            var dNumUnits = $(list[i][2]);
            var dBuffUnitName = $(list[i][3]);
            var dBuffUnitPlus = $(list[i][4]);
            var dBuffUnitMinus = $(list[i][5]);
            
            var dCloseBtn = $(id + '_CloseBtn');
            var dDayNum = $(id + '_DDayNum');
            var dDayText = $(id + '_DDayText'); 
                                   
            // header cell and UI elements, used for display, not recorded
            // elements in header are named based on the id of the dataentry layer + field
            var hCell = $(id + '_Cell');
            var hVisit = $(id + '_VisitLabel');
            var hUnitName = $(id + '_DisplayUnitName');
            var hNumUnits = $(id + '_NumberOfUnits');
            var hBuffUnitName = $(id + '_BufferUnitName');
            var hBuffUnitPlus = $(id + '_BufferNumberOfUnitsPlus');
            var hBuffUnitMinus = $(id + '_BufferNumberOfUnitsMinus');
            var hDayNum = $(id + '_HDayNum');
            var hDayText = $(id + '_HDayText');
            var hDayAfter = $(id + '_HDayAfter');
            
            // recurring visits
            var dRecurringLayer = $(id + '_RecurringLayer');
            var dRecurringIntervalType = $(id + '_RecurringIntervalType');
            var dRecurringForInterval = $(id + '_RecurringForInterval');
            
            if(dRecurringLayer && dRecurringIntervalType && dRecurringForInterval)
            {
                // recurring layer captured to lookup later on
                RECURRING_LOOKUP.push(dRecurringLayer);
                
                // recurring check box
                var doRecurringVisits = curry(updatedRecurringText, dUnitName,dRecurringLayer, dRecurringIntervalType,dRecurringForInterval);
                doRecurringVisits();
                dUnitName.addEvent('change',doRecurringVisits);
            }
            
            // The html table which when clicked on, will launch data entry layer
            var hCellLauncher = $(id + '_Cell_Launcher');
            
            var getInvoker = function()
            {
                var args = arguments;
                return function(f) { f.apply(this,args); }
            }
            var invoker = getInvoker(dLayer,dVisit,dUnitName,dNumUnits,dBuffUnitName,dBuffUnitPlus,dBuffUnitMinus,dDayNum,dDayText,hCell,hVisit,hUnitName,hNumUnits,hBuffUnitName,hBuffUnitPlus,hBuffUnitMinus,hDayNum,hDayText,hDayAfter);
            
            // ADD EVENT HANDLERS
            
            // Values on the header input need to be synced with data entry layer
            var syncInputFields = curry(invoker,syncDataEntryLayer);
            hVisit.addEvent('keypress',syncInputFields);
            hVisit.addEvent('focus',syncInputFields);
            hVisit.addEvent('blur',syncInputFields);

            // Launch data entry when clicking on launcher <TABLE>
            var dataEntryLauncher = curry(invoker,showTabLayer);
            hCellLauncher.addEvent('click',dataEntryLauncher);
            
            // Close data entry layer when clicking close btn in popup
            var dataEntryCloser = curry(invoker,hideTabLayer);
            dCloseBtn.addEvent('click',dataEntryCloser);
            
            hVisit.hideTabLayer = dataEntryCloser;
        }
    }
    /* END INITIALIZATION */
   
    function validateNumber(field,e)
    {
        var v = field.value;
        if(v != '' && parseInt(v).toString()=='NaN')
        {
            alert('Please enter a valid number.');
            field.focus();
        }
    }
    
   // when checking/unchecking recurring, show/hide layer
   function handleRecurringClick(cb,index)
   {
        if(RECURRING_LOOKUP && RECURRING_LOOKUP[index]) 
        { 
            var layer = RECURRING_LOOKUP[index];
            var doShow = cb.checked;
            layer.style.display = doShow ? '' : 'none';
        }
   }
   
    // updates the recurring visit labels when unit name changed
    function updatedRecurringText(dUnitName,dRecurringLayer, dRecurringInterval, dRecurringForInterval, e)
    {
        // get selected interval type and pad label
        var intervalType = dUnitName.options[dUnitName.selectedIndex].value;
        intervalType = intervalType && intervalType!='' ? (intervalType + 's') : '';
        // update text labels
        dRecurringInterval.innerHTML = intervalType;
        dRecurringForInterval.innerHTML = intervalType;
    }
   
    // Shows popup layer based on id of popup layer
    function showTabLayer(dLayer,dVisit,dUnitName,dNumUnits,dBuffUnitName,dBuffUnitPlus,dBuffUnitMinus,dDayNum,dDayText,hCell,hVisit,hUnitName,hNumUnits,hBuffUnitName,hBuffUnitPlus,hBuffUnitMinus,hDayNum,hDayText,hDayAfter)
    {       
        // Overflow container for popup data entry layers
        var popupContainer = $('TimelineTabPopupDiv');
               
        // handle active item
        if(ACTIVE) { $(ACTIVE.LAYER).style.display = 'none';  }
        ACTIVE = { LAYER: dLayer, CELL: hCell} 
        
        // show data entry container and data entry layer
        $(popupContainer).style.display = 'block';
        $(dLayer).style.display = 'block';
        
        // adjust clipping of data entry layer
        adjustDataEntryClip();
    }

    // Hides the popup data entry layer
    function hideTabLayer(dLayer,dVisit,dUnitName,dNumUnits,dBuffUnitName,dBuffUnitPlus,dBuffUnitMinus,dDayNum,dDayText,hCell,hVisit,hUnitName,hNumUnits,hBuffUnitName,hBuffUnitPlus,hBuffUnitMinus,hDayNum,hDayText,hDayAfter)
    {
        // values from the data-entry layer are copied into their coresponding UI elements
        $(hVisit).value = getValue(dVisit);
        $(hUnitName).innerHTML = getValue(dUnitName);
        $(hNumUnits).innerHTML = getValue(dNumUnits);
        $(hBuffUnitName).innerHTML = getValue(dBuffUnitName);
        $(hBuffUnitPlus).innerHTML = getValue(dBuffUnitPlus);
        $(hBuffUnitMinus).innerHTML = getValue(dBuffUnitMinus);
        if(dDayNum!=null)
        {
            $(hDayNum).innerHTML = getValue(dDayNum);
            $(hDayText).innerHTML = getValue(dDayText);
        }
        
        // hide the data entry popup layer
        $(dLayer).style.display = 'none';
        $('TimelineTabPopupDiv').style.display = 'none';
        
        ACTIVE = null;
    }
    
    function syncDataEntryLayer(dLayer,dVisit,dUnitName,dNumUnits,dBuffUnitName,dBuffUnitPlus,dBuffUnitMinus,dDayNum,dDayText,hCell,hVisit,hUnitName,hNumUnits,hBuffUnitName,hBuffUnitPlus,hBuffUnitMinus,hDayNum,hDayText)
    {
        $(dVisit).value = $(hVisit).value;
    }
    
    /* SCROLLING DIVs */
    function scrollNodeTop(a,b,e) { $(b).scrollTop = $(a).scrollTop; }
    function scrollNodeLeft(a,b,e) { $(b).scrollLeft = $(a).scrollLeft; }

    function adjustDataEntryLayer(scrollLayer,dataEntryLayer,e)
    {
        // scroll header to match checkbox layer
        scrollNodeLeft(scrollLayer,dataEntryLayer,e);
        // adjust data entry layer
        adjustDataEntryClip();
    }
    
    // Clips popup layer to allow user click of other items
    function adjustDataEntryClip()
    {
        // container for data entry layers
        var popupLayer = $('TimelineTabPopupDiv');
        // scrolling header layer
        var headerLayer = $('TimelineTabDiv');
        // only make adjustment if visible
        if(popupLayer.style.display != 'none')
        {
            if(ACTIVE)
            {
                var layerClipHeight = 400;
                var containerWidth = headerLayer.offsetWidth;
                var cellWidth = ACTIVE.CELL.offsetWidth;
                var cellLeft = getLeftPos(ACTIVE.CELL);
                
                var calculatedLeft = (containerWidth - headerLayer.scrollLeft) -  containerWidth + cellLeft;
                var fullCalculatedLeft = (LAYER_LEFT_DOCK + containerWidth - headerLayer.scrollLeft) -  containerWidth + cellLeft;
                popupLayer.style.left = fullCalculatedLeft + - 7 + 'px';
                // clip right
                if( (cellWidth + calculatedLeft) > containerWidth)
                {
                    var clipAmount = fullCalculatedLeft - containerWidth;
                    var newWidth = cellWidth - clipAmount;
//                    popupLayer.style.clip = 'rect(0px ' + newWidth  + 'px ' + layerClipHeight + 'px 0px)';
                    //popupLayer.style.width = newWidth + 'px';
                }
                // clip left
                else if(fullCalculatedLeft < LAYER_LEFT_DOCK)
                {
                    var clipAmount = LAYER_LEFT_DOCK - fullCalculatedLeft;
                    var newWidth = cellWidth - clipAmount;
//                    popupLayer.style.clip = 'rect(0px ' + cellWidth + 'px ' + layerClipHeight + 'px ' + clipAmount + 'px)';
                    //popupLayer.style.width = newWidth + 'px';
                }
                else
                {
 //                   popupLayer.style.clip = 'rect(0px ' + cellWidth + 'px ' + layerClipHeight + 'px ' + 0 + 'px)';
                 //   popupLayer.style.width = '166px';
                }
               // popupLayer.style.width = '200px';
               // popupLayer.style.clip = 'rect(0px ' + clipRight + 'px 280px ' + clipLeft + 'px)';
            }
        }
    }
    
    function showHidePreStudy(cb)
    {
        var showPreStudy = cb.checked;
        // if unchecking box, confirm to clear and remove pre-study column
        if(!showPreStudy)
        {
            var doClear = confirm('Are you sure you want to change the remove the Pre-Study Items?');
            if(doClear)
            {
                // clear and hide pre-study
            }
            // keep layer shown and checkbox checked
            else
            {
                showPreStudy = true;
                cb.checked = true;
            }
        }
        
        var showStyle = showPreStudy ? '' : 'none';
        // show/hide header cell and popup data entry
        var preStudyDataEntry = $('TimelineTabLayer_Pre_0');
        var preStudyHeader = $('TimelineTabLayer_Pre_0_Cell');
        preStudyHeader.style.display = showStyle;
        preStudyDataEntry.style.display = showStyle;
        
        if(!showPreStudy)
        {
            resetInputFields(preStudyHeader);
            resetInputFields(preStudyDataEntry);
            var hVisit = $('TimelineTabLayer_Pre_0_VisitLabel');
            hVisit.hideTabLayer();
        }
        // iterate through each row of pre-study checkboxes, and set display
        var table = $('TimelineMainDiv').tag('TABLE')[0];
        for(var i=0;i<table.rows.length;i++)
        {
            var row = table.rows[i];
            row.cells[1].style.display = showStyle;
            if(!showPreStudy)
            {
                resetInputFields(row);
            }
        }
    }
    
    
    function notifyNoItems()
    {
        var message = 'You have not yet created any Items.\n';
        message += 'You will be redirected to add Items before continuing.';
        alert(message);
        goToPrevStep();
    }
    
    function notifyPatientsScheduled()
    {
        var message = 'Patients have already been assigned to this timeline. Only new items may be added to this schema.';
        var messageElement = $('AssignedPatientsMessage');
        messageElement.innerHTML = message;
        //alert(message);
    }
   
    // Adjusts the height and width of various container to fit on page
    function adjustOverflowContent(e)
    {
//        // Adjust popup layer filler to grow to fill space of positioned items
//        var scrolledHeaderWidth = $('TimelineTabDiv').scrollWidth;
//        $('TimelineTabDivFiller').style.width = scrolledHeaderWidth + 'px';
        // Position scrolling popup data entry layer
        LAYER_LEFT_DOCK = getLeftPos($('TimelineTabDiv'));
        $('TimelineTabPopupDiv').style.left = LAYER_LEFT_DOCK + 'px';
        
        // Determine width for overflow items on right (header, header popup, and checkbox layer)
        var shellWidth = $('schemaItemsShell').offsetWidth;
        var pageWidth = getWidth(window);
        var adjustedWidth = pageWidth - shellWidth - 30  + 'px';
        
        // Adjust various overflow containers
        $('TimelineTabDiv').style.width = adjustedWidth;
        //$('TimelineTabPopupDiv').style.width = adjustedWidth;
        $('TimelineMainDiv').style.width = adjustedWidth;

        // Grow Schema and Items Shell to hold content
        var adjustedHeight = getHeight(window) - HEIGHT_OFFSET;
        $('TimelineMainDiv').style.height = adjustedHeight + 'px';
        $('schemaItemsDiv').style.height =  adjustedHeight + 'px';
    }
    
    // Adds handlers to scroll containers to match up with check-box matrix
    function initScrollers(e)
    {
        var headerLayer = $('TimelineTabDiv');
        var headerPopupLayer = $('TimelineTabPopupDiv');
        var schemaItems = $('schemaItemsDiv');
        var checkBoxLayer = $('TimelineMainDiv');
        var adjustTop = curry(scrollNodeTop,checkBoxLayer,schemaItems);
        var adjustLeft = curry(scrollNodeLeft,checkBoxLayer,headerLayer);
        var adjustPopupLayer = curry(adjustDataEntryLayer,checkBoxLayer,headerPopupLayer);
        
        // Add scrolling event handlers
        checkBoxLayer.addEvent('mousemove',adjustTop);
        checkBoxLayer.addEvent('mousemove',adjustLeft);
        checkBoxLayer.addEvent('mousemove',adjustPopupLayer);
        
        // some browser, i.e., IE doesn't track movement on scrollbars, but handle scroll event
        if(typeof(document.body.scroll))
        {
            checkBoxLayer.addEvent('scroll',adjustTop);
            checkBoxLayer.addEvent('scroll',adjustLeft);
            checkBoxLayer.addEvent('scroll',adjustPopupLayer);
        }
    }
    
    //
    if(EDIT_TIMELINE_MODE)
    {
        // Adjust various containers on load and resize
        Browser.ResizeElement( { customResizer: adjustOverflowContent });
    
        // Events which fire during load
        window.addEvent('load',adjustOverflowContent);
        window.addEvent('load',initScrollers);
        window.addEvent('load',initDataEntry);
    }
    
    function saveAndFinish()
    {
        parent.parent.hideSchemaPortalAndReload();
    }
    
    /* ]]> */
    </script>

    <style type="text/css">
        html
        {
            height: 100%;
        }
        body
        {
            min-height: 100%;
            padding: 0px;
            margin: 0px;
            background-color: #ffffff;
        }
        #SetIntervalPanel
        {
            font-size: 12px;
        }
        .TimelineTopLeftBG
        {
            background-image: url(Images/Timeline_TopLeftBG.png);
            background-position: bottom;
            background-repeat: no-repeat;
            width: 157px;
            height: 90px;
            text-align: center;
            vertical-align: top;
        }
        .TimelineTopRightBG
        {
            background-image: url(Images/Timeline_TopRightBG.gif);
            background-position: right top;
            background-repeat: no-repeat;
            vertical-align: top;
            padding-top: 5px;
            padding-right: 12px;
        }
        .TimelineMidLeftBG
        {
            background-color: #efefef;
            vertical-align: top;
            padding-top: 5px;
            padding-left: 12px;
        }
        .TimelineBottomLeftBG
        {
            background-image: url(Images/Timeline_BottomLeftBG.gif);
            background-position: bottom left;
            background-repeat: no-repeat;
            height: 13px;
        }
        .TimelineBottomRightBG
        {
            background-image: url(Images/Timeline_BottomRightBG.gif);
            background-position: bottom right;
            background-repeat: no-repeat;
            height: 13px;
        }
        #schemaItemsShell
        {
            border: solid 2px #dddddd;
            border-right: solid 1px #dddddd;
            background-color: #ffffff;
        }
        .schemaItemsTable
        {
            width: 100%;
        }
        #VisitColumnsShell
        {
            border: solid 2px #dddddd;
            border-left: none;
            background-color: #ffffff;
        }
        #TimelineTabDiv
        {
            height: 78px;
            width: 970px;
            overflow: hidden;
        }
        .TimelineTab_PreStudy
        {
            background-image: url(Images/TimelineTab_PreStudy.gif);
            background-position: 4px 0px;
            background-repeat: no-repeat;
            width: 166px;
            height: 78px;
            text-align: center;
            vertical-align: top;
            padding-top: 7px;
        }
        .TimelineTab_OnStudy
        {
            background-image: url(Images/TimelineTab_OnStudy.gif);
            background-position: 0px 0px;
            background-repeat: no-repeat;
            width: 166px;
            height: 78px;
            text-align: center;
            vertical-align: top;
            padding-top: 7px;

        }
        .TimelineTab_OnStudyMarker
        {
            background-image: url(Images/Timeline_OnStudyDateMarker.gif);
            background-position: 4px 49px;
            background-repeat: no-repeat;
            width: 52px;
            height: 78px;
        }
        .TimelineOnStudy_A
        {
            width: 166px;
            height: 32px;
            background-color: #E0EBF1;
            text-align: center;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1C3B68;
        }
        .TimelineOnStudy_B
        {
            width: 166px;
            height: 32px;
            background-color: #F8FAFC;
            text-align: center;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1C3B68;
        }
        .TimelinePreStudy_A
        {
            width: 166px;
            height: 32px;
            background-color: #D8E3E9;
            text-align: center;
            vertical-align: middle;
        }
        .TimelinePreStudy_B
        {
            width: 166px;
            height: 32px;
            background-color: #F6F8FA;
            text-align: center;
            vertical-align: middle;
        }
        .TimelineOnStudyDateDividerA
        {
            background-image: url(Images/Timeline_OnStudyDateDividerA.png);
            background-position: center center;
            background-repeat: repeat-y;
            width: 52px;
            height: 32px;
        }
        .TimelineOnStudyDateDividerB
        {
            background-image: url(Images/Timeline_OnStudyDateDividerB.png);
            background-position: center center;
            background-repeat: repeat-y;
            width: 52px;
            height: 32px;
        }
        .TimelineColSizer
        {
            width: 166px;
            height: 1px;
        }
        .TimelineTabContentsTable
        {
            width: 155px;
            margin-top: 5px;
            margin-bottom: 5px;

        }
        .OnStudyDateSizer
        {
            width: 52px;
            height: 1px;
            margin-bottom: 6px;
        }
        #TimelineMainDiv
        {
            height: 400px;
            width: 802px;
            overflow: auto;
        }
        #TimelineMainDiv * label
        {
            display: block;
        }
        .TimelineSizerCell
        {
            height: 1px;
        }
        #schemaItemsDiv
        {
            height: 400px;
            overflow: hidden;
        }
        .TimelineTabNameTitleEntryField
        {
            width: 132px;
            height: 15px;
            font-size: 14px;
            color: #111111;
            border: solid 1px #cccccc;
            text-align: center;
        }
        .DataEntrySelect
        {
            width: 80px;
            vertical-align: middle;
        }
        .WeekText
        {
            font-size: 11px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-weight: bold;
            line-height: 11px;
            cursor: pointer;
        }
        .BufferText
        {
            font-size: 11px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-weight: normal;
            line-height: 11px;
            cursor: pointer;
        }
        .VisitDescriptionText
        {
            font-size: 10px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-weight: bold;
            line-height: 10px;
            cursor: pointer;
        }
        #TimelineTabPopupDiv
        {
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 10;
            width: 436px;
            height: 400px; 
            overflow: visible;
            
            /* 
        width: 970px; 
        height: 280px; 
         */
            overflow: hidden;
        }
        .TimelineTabLayer_PreStudy
        {
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 99;
            overflow: hidden;
            width: 179px;
            height: 285px;
            background-image: url(Images/TimelineTabLayerBG_PreStudy_short.png);
            background-position: 0px 0px;
            background-repeat: no-repeat;
            display: none;
            margin-left: 1px;
            margin-top: 12px;
        }
        .TimelineTabLayer_OnStudy
        {
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 99;
            overflow: visible;
            width: 179px;
            height: 500px;
            background-image: url(Images/TimelineTabLayerBG_OnStudy_short.png);
            background-position: 0px 0px;
            background-repeat: no-repeat;
            display: none;
            margin-left: 1px;
            margin-top: 12px;
        }
        .TimelineTabLayer_OnStudy_Advanced
        {
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 99;
            overflow: visible;
            width: 436px;
            height: 500px;
            background-image: url(Images/TimelineTabLayerBG_OnStudy_Large2.png);
            background-position: 2px 0px;
            background-repeat: no-repeat;
            display: none;
            margin-left: 1px;
            margin-top: 12px;
        }
        .WeekDataEntryField
        {
            width: 40px;
            border: solid 1px #cccccc;
        }
        .BufferDataEntryField
        {
            width: 20px;
            border: solid 1px #cccccc;
        }
        .TimelineTabLayerOptionsRow
        {
            font-size: 12px;
            text-align: left;
            font-size: 12px;
            padding-top: 10px;
            font-family: Arial, Helvetica, sans-serif;
            color: #111111;
            font-weight: bold;
            cursor: pointer;
        }
        .IntervalLabel
        {
            display: block;
            width: auto;
            margin: 5px auto 5px auto;
        }
        .bufferDisplay:hover span
        {
            text-decoration: underline;
        }
        .RepeatVisitLayer
        {
            width: 436px;
            height: 500px;
 /*           background-image: url(Images/TimelineTabLayerBG_OnStudy_Large2.png); */
            background-position: 3px -94px;
            background-repeat: no-repeat;
            display: none;
         }
        .RepeatVisitLayerFlipped
        {
            background-image: url(Images/TimelineTabLayerBG_OnStudy_Large2Flipped.png);
            background-position: 3px -94px;
         }
        .RepeatIntervalPreviousLayer
        {
            display: none;
        }
        .dependentRecurringVisitText
        {
            display: block;
            font-size: 10px;
        }
        .DependentTable
        {
            table-layout: fixed;
            width: 100%;
            text-align: left;
        }
    </style>
</head>
<body style="height: 100%;">

    <asp:Literal ID="SetIntervalVisitForm" runat="server">
        <div id="SetIntervalPanel" style="width: 450px; margin: 100px auto auto auto;">
            <strong style="font-size: 13px; color: #111111;">Please enter the number of Intervals
                (visits) in the trial.</strong>
            <div style="width: 100%; padding: 18px; margin-top: 6px; margin-bottom: 6px; text-align: center;
                border: solid 1px #cccccc; background-color: #f8fafc;">
                <label for="SetIntervalTextBox" class="IntervalLabel" title="Enter the number of Intervals (Visits)">
                    Number of Intervals
                <input type="text" id="SetIntervalTextBox" style="width: 40px; border: solid 1px #cccccc;"
                    tabindex="1" /></label>
                <label for="IncludePreStudy"  title="Include Pre-Study Item" >
                    <input type="checkbox" id="IncludePreStudy" />Include Pre-Study Item</label>
                <label for="DefaultIntervalType" class="IntervalLabel" title="Choose the default Interval Type for Visits">
                    Default Interval Type
                    <select id="DefaultIntervalType">
                    <option title="Days" value="Day">Days</option>
                    <option title="Weeks" value="Week">Weeks</option>
                    <option title="Months" value="Month">Months</option>
                    </select></label>
            </div>
            <img src="Images/Button_Next.png" onclick="return loadVisits();" alt="Set Intervals"
                        title="Set Intervals" style="cursor: pointer; float: right; margin-right: 0px;" />
        </div>
    </asp:Literal>
    <form id="form1" runat="server">
    <asp:Panel runat="server" ID="TimelinePanel">
        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="margin-left: auto;
            margin-right: auto;">
            <tr>
                <td class="TimelineTopLeftBG">
                    <asp:TextBox runat="server" ID="VisitCount" OnPreRender="SetVisitCountText" Style="height: 15px;
                        width: 36px; font-size: 14px; color: #111111; border: solid 1px #cccccc; margin-top: 10px;"></asp:TextBox>
                    <asp:ImageButton runat="server" ID="ChangeVisitBtn" ImageUrl="Images/Timeline_VisitsMarker.png"
                        Width="44" Height="19" OnClick="ChangeVisitNumberClick" Style="vertical-align: bottom;" />
                    <div>
                        <asp:CheckBox runat="server" ID="ShowHidePreStudy" onclick="showHidePreStudy(this);" />
                        <label for="ShowHidePreStudy" style="font-size: 10px; color: #666666; font-family: Arial, Helvetica, sans-serif;">
                            Include Pre-Study Items</label>
                    </div>
                    <img src="Images/shim.gif" style="width: 150px; height: 1px" />
                </td>
                <td style="vertical-align: bottom; padding-left: 2px;">
                    <div id="TimelineTabDiv" >
                        <%-- POPUP DATA-ENTRY LAYERS --%>
                        <div id="TimelineTabPopupDiv">
                        </div>
                        <%-- HEADER COLUMNS --%>
                        <table id="TimelineHeaderTable" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed; margin-right: 240px;">
                            <tr>
                                <%-- Pre-Study Items --%>
                                <asp:Repeater runat="server" ID="PreStudyItemsRptr" OnItemCreated="InitalizeTimelineEvents"
                                    OnItemDataBound="SetInputFieldValues">
                                    <ItemTemplate>
                                        <td style="display: <%= IncludePreStudyItems ? "": "none" %>" class="TimelineTab_PreStudy TimelineTab"
                                            id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_Cell">
                                            <table border="0" cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                <tr>
                                                    <td>
                                                        <input id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_VisitLabel" type="text"
                                                            class="TimelineTabNameTitleEntryField" value='<%# Eval("VisitLabel") %>' <%= ArePatientScheduled ? "disabled" : "" %> />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_Cell_Launcher" border="0"
                                                cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                <tr>
                                                    <td class="bufferDisplay">
                                                        <span class="WeekText"><span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_DisplayUnitName">
                                                            <%# Eval("DisplayUnitName")%>
                                                        </span><span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_NumberOfUnits">
                                                            <%#  Eval("NumberOfUnits") %>
                                                        </span></span><span class="BufferText">(+ <span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_BufferNumberOfUnitsPlus">
                                                            <%#  Eval("BufferNumberOfUnitsPlus")%>
                                                        </span>/- <span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_BufferNumberOfUnitsMinus">
                                                            <%#  Eval("BufferNumberOfUnitsMinus")%>
                                                        </span><span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_BufferUnitName">
                                                            <%#  Eval("BufferUnitName")%>
                                                        </span>) </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table width="120" border="0" cellspacing="0" cellpadding="1" style="margin-top: 4px;
                                                            margin-left: auto; margin-right: auto;">
                                                            <tr>
                                                                <td class="VisitDescriptionText">
                                                                    Pre-Study
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <%-- Data Entry Layer for Pre-Study --%>
                                            <div style="display: <%= IncludePreStudyItems ? "": "none" %>" class="TimelineTabLayer_PreStudy TimelineTabLayer"
                                                id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>">
                                                <cic:CaisisHidden runat="server" ID="TimelineIdField" Table="ProtocolMgr_Timeline"
                                                    Field="TimelineId" Value='<%# Eval("TimelineId") %>' />
                                                <table border="0" cellspacing="0" cellpadding="0" class="TimelineTabContentsTable" style="margin-top: 12px; margin-left: 20px;">
                                                    <tr>
                                                        <td>
                                                            <cic:CaisisTextBox runat="server" ID="VisitLabel" ShowLabel="false" CssClass="TimelineTabNameTitleEntryField"
                                                                Table="ProtocolMgr_Timeline" Field="VisitLabel" Value='<%# Eval("VisitLabel") %>'></cic:CaisisTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-top: 8px;">
                                                            <cic:CaisisSelect runat="server" ID="DisplayUnitName" ShowEmptyListItem="false" Table="ProtocolMgr_Timeline"
                                                                Field="DisplayUnitName" ShowLabel="false" CssClass="DataEntrySelect" Value='<%# Eval("DisplayUnitName") %>'>
                                                                <asp:ListItem Text="Day" Value="Day">
                                                                </asp:ListItem>
                                                                <asp:ListItem Text="Week" Value="Week">
                                                                </asp:ListItem>
                                                                <asp:ListItem Text="Month" Value="Month">
                                                                </asp:ListItem>
                                                            </cic:CaisisSelect>
                                                            <cic:CaisisTextBox runat="server" ID="NumberOfUnits" Table="ProtocolMgr_Timeline" Field="NumberOfUnits"
                                                                ShowLabel="false" CssClass="WeekDataEntryField NumberOfUnits" Value='<%# Eval("NumberOfUnits") %>'></cic:CaisisTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="VisitDescriptionText" style="padding-top: 17px; font-size: 11px;">
                                                            <strong style="display: block;">Allowed Buffer</strong>
                                                            +<cic:CaisisTextBox runat="server" ID="BufferNumberOfUnitsPlus" Table="ProtocolMgr_Timeline"
                                                                Field="BufferNumberOfUnitsPlus" ShowLabel="false" CssClass="BufferDataEntryField"
                                                                Value='<%# Eval("BufferNumberOfUnitsPlus") %>'></cic:CaisisTextBox>
                                                            &#47;<span style="cursor: pointer;">-</span>
                                                            <cic:CaisisTextBox runat="server" ID="BufferNumberOfUnitsMinus" Table="ProtocolMgr_Timeline"
                                                                Field="BufferNumberOfUnitsMinus" ShowLabel="false" CssClass="BufferDataEntryField"
                                                                Value='<%# Eval("BufferNumberOfUnitsMinus") %>'></cic:CaisisTextBox>
                                                            <cic:CaisisSelect runat="server" ID="BufferUnitName" ShowEmptyListItem="false" Table="ProtocolMgr_Timeline"
                                                                Field="BufferUnitName" ShowLabel="false" CssClass="DataEntrySelect" Width="70" Value='<%# Eval("BufferUnitName") %>'>
                                                                <asp:ListItem Text="Days" Value="Day">
                                                                </asp:ListItem>
                                                                <asp:ListItem Text="Weeks" Value="Week">
                                                                </asp:ListItem>
                                                                <asp:ListItem Text="Months" Value="Month">
                                                                </asp:ListItem>
                                                            </cic:CaisisSelect>
                                                            </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="TimelineTabLayerOptionsRow" style="padding-top: 30px; padding-left: 50px;">
                                                            <span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_CloseBtn"><img  src="Images/Button_CloseSmall.png" style="width: 40px; height: 18px;"  /></span>
                                                        </td>
                                                    </tr>
                                                    
                                                </table>
                                            </div>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <%--  On-Study Marker --%>
                                <td class="TimelineTab_OnStudyMarker">
                                    <img alt="On-Study Date" title="On-Study Date" src="Images/shim.gif" class="OnStudyDateSizer" />
                                </td>
                                <%--  On-Study Items --%>
                                <asp:Repeater runat="server" ID="OnStudyItemsRptr" OnItemCreated="InitalizeTimelineEvents"
                                    OnItemDataBound="SetInputFieldValues">
                                    <ItemTemplate>
                                        <td class="TimelineTab_OnStudy TimelineTab" id="TimelineTabLayer_<%# Container.ItemIndex %>_Cell">
                                            <table border="0" cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                <tr>
                                                    <td>
                                                        <input id="TimelineTabLayer_<%# Container.ItemIndex %>_VisitLabel" type="text" class="TimelineTabNameTitleEntryField"
                                                            value='<%# Eval("VisitLabel") %>' <%= ArePatientScheduled ? "disabled" : "" %>
                                                            onkeypress='<asp:Literal runat="server" ID="ClientArgList2" />' />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table id="TimelineTabLayer_<%# Container.ItemIndex %>_Cell_Launcher" border="0"
                                                cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                <tr>
                                                    <td class="bufferDisplay">
                                                        <%-- Recurring Visit Text --%>
                                                        <div class="standardVisitText">
                                                            <span class="WeekText"><span id="TimelineTabLayer_<%# Container.ItemIndex %>_DisplayUnitName">
                                                                <%# Eval("DisplayUnitName")%>
                                                            </span><span id="TimelineTabLayer_<%# Container.ItemIndex %>_NumberOfUnits">
                                                                <%#  Eval("NumberOfUnits") %>
                                                            </span></span><span class="BufferText">(+<span id="TimelineTabLayer_<%# Container.ItemIndex %>_BufferNumberOfUnitsPlus">
                                                                <%#  Eval("BufferNumberOfUnitsPlus")%>
                                                            </span>/ -<span id="TimelineTabLayer_<%# Container.ItemIndex %>_BufferNumberOfUnitsMinus"><%#  Eval("BufferNumberOfUnitsMinus")%></span>
                                                                <span id="TimelineTabLayer_<%# Container.ItemIndex %>_BufferUnitName">
                                                                    <%#  Eval("BufferUnitName")%></span>)</span>
                                                        </div>
                                                        <%-- Advanced Scheduling Text --%>
                                                        <span class="boldText advancedSchedulingText dependentRecurringVisitText"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table width="120" border="0" cellspacing="0" cellpadding="1" style="margin-top: 4px;
                                                            margin-left: auto; margin-right: auto; display: none;">
                                                            <tr>
                                                                <td style="vertical-align: top;">
                                                                    <img src="Images/TimelineIcon_Dependent.png" width="12" height="12" />
                                                                </td>
                                                                <td class="VisitDescriptionText" style="text-align: left;">
                                                                    Occurs <span id="TimelineTabLayer_<%# Container.ItemIndex %>_HDayNum">9</span> <span
                                                                        id="TimelineTabLayer_<%# Container.ItemIndex %>_HDayText">Days</span> after
                                                                    <span id="TimelineTabLayer_<%# Container.ItemIndex %>_HDayAfter"">Cycle 1, Week 1</span>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <%-- Data Entry Layer for On-Study --%>
                                            <div class="TimelineTabLayer_OnStudy TimelineTabLayer" id="TimelineTabLayer_<%# Container.ItemIndex %>">
                                                <cic:CaisisHidden runat="server" ID="TimelineIdField" Table="ProtocolMgr_Timeline"
                                                    Field="TimelineId" Value='<%# Eval("TimelineId") %>' />
                                                <table border="0" cellspacing="0" cellpadding="0" class="TimelineTabContentsTable"
                                                    style="margin-top: 12px; margin-left: 20px;">
                                                    <tr>
                                                        <td>
                                                            <cic:CaisisTextBox runat="server" ID="VisitLabel" ShowLabel="false" CssClass="TimelineTabNameTitleEntryField VisitLabel"
                                                                Table="ProtocolMgr_Timeline" Field="VisitLabel" Value='<%# Eval("VisitLabel") %>'></cic:CaisisTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-top: 8px;">
                                                            <cic:CaisisSelect runat="server" ID="DisplayUnitName" ShowEmptyListItem="false" Table="ProtocolMgr_Timeline"
                                                                Field="DisplayUnitName" ShowLabel="false" CssClass="DataEntrySelect DisplayUnitName"
                                                                Value='<%# Eval("DisplayUnitName") %>'>
                                                                <asp:ListItem Text="Day" Value="Day">
                                                                </asp:ListItem>
                                                                <asp:ListItem Text="Week" Value="Week">
                                                                </asp:ListItem>
                                                                <asp:ListItem Text="Month" Value="Month">
                                                                </asp:ListItem>
                                                            </cic:CaisisSelect>
                                                            <cic:CaisisTextBox runat="server" ID="NumberOfUnits" Table="ProtocolMgr_Timeline"
                                                                Field="NumberOfUnits" ShowLabel="false" CssClass="WeekDataEntryField NumberOfUnits"></cic:CaisisTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="VisitDescriptionText" style="padding-top: 17px; font-size: 11px;">
                                                            <strong style="display: block;">Allowed Buffer</strong> +<cic:CaisisTextBox runat="server"
                                                                ID="BufferNumberOfUnitsPlus" Table="ProtocolMgr_Timeline" Field="BufferNumberOfUnitsPlus"
                                                                ShowLabel="false" CssClass="BufferDataEntryField BufferNumberOfUnitsPlus" Value='<%# Eval("BufferNumberOfUnitsPlus") %>'></cic:CaisisTextBox>
                                                            &#47;<span style="cursor: pointer;">-</span>
                                                            <cic:CaisisTextBox runat="server" ID="BufferNumberOfUnitsMinus" Table="ProtocolMgr_Timeline"
                                                                Field="BufferNumberOfUnitsMinus" ShowLabel="false" CssClass="BufferDataEntryField BufferNumberOfUnitsMinus"
                                                                Value='<%# Eval("BufferNumberOfUnitsMinus") %>'></cic:CaisisTextBox>
                                                            <cic:CaisisSelect runat="server" ID="BufferUnitName" ShowEmptyListItem="false" Table="ProtocolMgr_Timeline"
                                                                Field="BufferUnitName" ShowLabel="false" CssClass="DataEntrySelect BufferUnitName"
                                                                Width="62" Value='<%# Eval("BufferUnitName") %>'>
                                                                <asp:ListItem Text="Days" Value="Day">
                                                                </asp:ListItem>
                                                                <asp:ListItem Text="Weeks" Value="Week">
                                                                </asp:ListItem>
                                                                <asp:ListItem Text="Months" Value="Month">
                                                                </asp:ListItem>
                                                            </cic:CaisisSelect>
                                                    </tr>
                                                    </table>
                                                    <table border="0" cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                    <tr>
                                                        <td class="TimelineTabLayerOptionsRow" style="padding-left: 17px;">
                                                            <asp:CheckBox runat="server" ID="AdvancedOptionsCheckBox" CssClass="AdvancedOptions" />
                                                            <label class="AdvancedOptionsText">
                                                                Advanced Options</label>
                                                        </td></tr>
                                                    
                                                    <tr>
                                                        <td>
                                                            <div id="RepeatLayer_<%# Container.ItemIndex %>" class="RepeatVisitLayer">
                                                            
                                                            
                                                            
                                                                <table style="width: 96%; table-layout: fixed; margin-left: 10px; margin-top: 0px;">
                                                                    <tr>
                                                                    <td style="vertical-align: top; border-right: solid 1px #cccccc; width: 200px;">
                                                                    <table cellspacing="0" style="width: 100%; table-layout: fixed;">
                                                                    <tr>
                                                                        <td colspan="2" style="font-weight: bold;padding-left: 4px;">
                                                                            <asp:CheckBox runat="server" ID="RepeatsCheckBox" CssClass="RepeatsCheckBox" Text="Repeats" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="RepeatLayerRow">
                                                                        <td colspan="2" >
                                                                            <table>
                                                                                <tr>
                                                                                    <td style="text-align: right;">
                                                                                        <label for="RecurringInterval_<%# Container.ItemIndex %>">
                                                                                            Repeats every
                                                                                        </label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <cic:CaisisTextBox ID="RecurringIntervalValue" runat="server" CssClass="RecurringVisitsEvery"
                                                                                            ShowEmptyListItem="false" Table="ProtocolMgr_Timeline" Field="RecurringVisitsEvery"
                                                                                            ShowLabel="false" Width="40px">
                                                                                        </cic:CaisisTextBox>
                                                                                        <select id="RecurringInterval_<%# Container.ItemIndex %>" class="RecurringIntervalType DisplayUnitName">
                                                                                            <option title="Day(s)" value="Day">Day(s)</option>
                                                                                            <option title="Week(s)" value="Week">Week(s)</option>
                                                                                            <option title="Month(s)" value="Month">Month(s)</option>
                                                                                        </select>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="padding-top: 6px; text-align: right;">
                                                                                        <label for="<%# Container.FindControl("RecurringIntervalFor").ClientID %>">
                                                                                            for</label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <cic:CaisisTextBox runat="server" ShowLabel="false" ID="RecurringIntervalFor" ShowEmptyListItem="false"
                                                                                            Table="ProtocolMgr_Timeline" Field="RecurringVisitsFor" CssClass="RecurringIntervalFor"
                                                                                            Width="40px">
                                                                                        </cic:CaisisTextBox>
                                                                                        &nbsp;<span class="RecurringIntervalText"></span>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr></table>
                                                                    </td>
                                                                    <td style="vertical-align: top;" style="padding-left: 14px;">
                                                                            <table style="width: 100%; table-layout: fixed;" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td  style="font-weight: bold;">
                                                                                    <asp:CheckBox runat="server" ID="DependentCheckBox" CssClass="DependentCheckBox"
                                                                                        Text="Dependent On" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="DependentLayerRow">
                                                                        <td >
                                                                            <table style="width: 100%;">
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <asp:RadioButton runat="server" ID="DependentCheckBoxNormal" CssClass="DependentCheckBoxNormal"
                                                                                            GroupName="DependentCheckBoxGroup" Text="Visit" Checked="true" />
                                                                                        <asp:RadioButton runat="server" ID="DependentCheckBoxStatus" CssClass="DependentCheckBoxStatus"
                                                                                            GroupName="DependentCheckBoxGroup" Text="Status" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <table cellspacing="0" cellpadding="0" class="DependentTable DependentLayerRowNormal">
                                                                                <tr>
                                                                                    <td style="text-align: right; width: 50px;">
                                                                                        <label for="DependantVisistsSelect_<%# Container.ItemIndex %>">
                                                                                            Visit
                                                                                        </label>&nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <cic:CaisisSelect runat="server" ID="DependantVisistsSelect" ShowLabel="false" ShowEmptyListItem="false"
                                                                                            DataTextField="VisitLabel" DataValueField="TimelineId" CssClass="DependantVisistsSelect"
                                                                                            Width="80%">
                                                                                        </cic:CaisisSelect>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <table cellspacing="0" cellpadding="0" class="DependentTable DependentLayerRowNormal">
                                                                                <tr>
                                                                                    <td style="text-align: right; width: 50px;">
                                                                                        <label for="<%# Container.FindControl("DependentVisitItems").ClientID %>">
                                                                                            Item
                                                                                        </label>&nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <cic:CaisisSelect runat="server" ID="DependentVisitItems" ShowLabel="false" ShowEmptyListItem="false"
                                                                                            DataTextField="ItemDescription" DataValueField="SchemaItemId" CssClass="DependentVisitItems"
                                                                                            Width="80%">
                                                                                        </cic:CaisisSelect>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <table cellspacing="0" cellpadding="0" class="DependentTable DependentLayerRowStatus">
                                                                                <tr>
                                                                                    <td>
                                                                                        <label for="<%# Container.FindControl("PatientStatusesDropDown").ClientID %>">
                                                                                            Status
                                                                                        </label>&nbsp;
                                                                                        <cic:CaisisSelect runat="server" ID="PatientStatusesDropDown" CssClass="PatientStatusesDropDown"
                                                                                            ShowLabel="false" ShowEmptyListItem="true">
                                                                                        </cic:CaisisSelect>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            <table style="width: 100%; margin-top: 2px;">
                                                                    <tr>
                                                                        <td>
                                                                            <span class="boldText">Dependency starts after: </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <cic:CaisisTextBox runat="server" ID="DependentVisitNumberOfUnits" ShowLabel="false" style="width: 50px;"
                                                                                CssClass="WeekDataEntryField NumberOfUnits DependentVisitNumberOfUnits" Value='<%# Eval("NumberOfUnits") %>'></cic:CaisisTextBox>

                                                                            <cic:CaisisSelect runat="server" ID="DependentVisitDisplayUnitName" ShowEmptyListItem="false"
                                                                                ShowLabel="false" CssClass="DataEntrySelect DisplayUnitName DependentVisitDisplayUnitName"
                                                                                Value='<%# Eval("DisplayUnitName") %>'  style="width: 80px;" >
                                                                                <asp:ListItem Text="Day(s)" Value="Day">
                                                                                </asp:ListItem>
                                                                                <asp:ListItem Text="Week(s)" Value="Week">
                                                                                </asp:ListItem>
                                                                                <asp:ListItem Text="Month(s)" Value="Month">
                                                                                </asp:ListItem>
                                                                            </cic:CaisisSelect>
                                                                        </td>
                                                                    </tr>

                                                                </table>
                                                                            
                                                                            
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                            </table>
                                                                    
                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="border-top: solid 1px #dedede; padding-top: 9px; vertical-align: top;">
                                                                    
                                                                    
                                                                    <span class="boldText advancedSchedulingText dependentRecurringVisitText" style="color: #8d2a2c;"></span>&nbsp;
                                                                    
                                                                    
                                                                  </td>  
                                                                    <td style="border-top: solid 1px #dedede; padding-top: 12px; vertical-align: top;">
                                                                            <span id="TimelineTabLayer_<%# Container.ItemIndex %>_CloseBtn2">
                                                                                <img class="DataEntryCloseBtn" src="Images/Button_CloseSmall.png" style="width: 40px; height: 18px; float: right; margin-right: 100px; margin-top: 4px; cursor: pointer;" /></span>
                                                                    
                                                                    </td>

                                                                </table>
                                                            
                                                                

                                                                    
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="TimelineTabLayerOptionsRow" style="padding-top: 21px; padding-left: 50px;">
                                                            <span id="TimelineTabLayer_<%# Container.ItemIndex %>_CloseBtn">
                                                                <img class="DataEntryCloseBtn" src="Images/Button_CloseSmall.png" style="width: 40px; height: 18px;" /></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                                
                                            </div>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="TimelineMidLeftBG">
                    <div id="schemaItemsShell">
                        <div id="schemaItemsDiv">
                            <%-- List of Schema Items --%>
                            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td>
                                        <img src="Images/shim.gif" style="width: 2px; height: 2px" />
                                    </td>
                                </tr>
                                <asp:Repeater runat="server" ID="SchemaItemsRptr">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="TimelineOnStudy_<%# Container.ItemIndex % 2==0 ? "A" : "B" %>" style="width: 100%">
                                                <%# Eval("ItemDescription") %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
                </td>
                <td class="TimelineTopRightBG">
                    <div id="VisitColumnsShell">
                        <div id="TimelineMainDiv" style="width: 970px; height: 100%;">
                            <table border="0" cellspacing="0" cellpadding="0" style="margin-right: 240px;" >
                                <asp:Repeater runat="server" ID="SchemaItemsTimelineItemRptr" OnItemCreated="BuildSchemaItemAndItemTimelineEvents">
                                    <%-- Header Sizing Columns --%>
                                    <HeaderTemplate>
                                        <tr>
                                            <td style="width: 2px;">
                                                <img src="Images/shim.gif" class="TimelineColSizer" style="width: 2px; height: 2px" />
                                            </td>
                                            <asp:Repeater runat="server" ID="PreStudyItems">
                                                <ItemTemplate>
                                                    <td style="display: <%= IncludePreStudyItems ? "": "none" %>">
                                                        <img src="Images/shim.gif" class="TimelineColSizer" />
                                                    </td>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <td>
                                                <img src="Images/shim.gif" class="TimelineColSizer" style="width: 52px;" />
                                            </td>
                                            <asp:Repeater runat="server" ID="OnStudyItems">
                                                <ItemTemplate>
                                                    <td>
                                                        <img src="Images/shim.gif" class="TimelineColSizer" />
                                                    </td>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tr>
                                    </HeaderTemplate>
                                    <%-- Rows of SchemaItems TimelineItems --%>
                                    <ItemTemplate>
                                        <tr class="TimelineStudySchemaItemRow">
                                            <td class="TimelineOnStudy_<%# Container.ItemIndex % 2==0 ? "A" : "B" %>" style="width: 2px;">
                                                &nbsp;
                                                <cic:CaisisHidden runat="server" ID="SchemaItemIdField" Value='<%# Eval("SchemaItemId") %>'>
                                                </cic:CaisisHidden>
                                            </td>
                                            <%-- List of Pre-Study Items --%>
                                            <asp:Repeater runat="server" ID="PreStudyItems">
                                                <ItemTemplate>
                                                    <td style="display: <%= IncludePreStudyItems ? "": "none" %>" class="TimelinePreStudy_<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex % 2==0 ? "A" : "B" %> TimelineStudySchemaItemCell">
                                                        <label for="<%# (Container.FindControl("ColCheckBox") as Control).ClientID %>" style="display: block;
                                                            text-align: center;">
                                                            <cic:CaisisHidden runat="server" ID="ItemTimelineIdField" Table="ProtocolMgr_ItemTimeline"
                                                                Field="ItemTimelineId" />
                                                            <cic:CaisisCheckBox runat="server" ID="ColCheckBox" Table="ProtocolMgr_ItemTimeline"
                                                                Field="ItemTimelineId" ShowLabel="false" />
                                                        </label>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <%-- On-Study Marker --%>
                                            <td class="TimelineOnStudyDateDivider<%# Container.ItemIndex % 2==0 ? "A" : "B" %>">
                                                &nbsp;
                                            </td>
                                            <%-- List of On-Study Items --%>
                                            <asp:Repeater runat="server" ID="OnStudyItems">
                                                <ItemTemplate>
                                                    <td class="TimelineOnStudy_<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex % 2==0 ? "A" : "B" %> TimelineStudySchemaItemCell">
                                                        <label for="<%# (Container.FindControl("ColCheckBox") as Control).ClientID %>" style="display: block;
                                                            text-align: center;">
                                                            <cic:CaisisHidden runat="server" ID="ItemTimelineIdField" Table="ProtocolMgr_ItemTimeline"
                                                                Field="ItemTimelineId" />
                                                            <cic:CaisisCheckBox runat="server" ID="ColCheckBox" Table="ProtocolMgr_ItemTimeline"
                                                                Field="ItemTimelineId" ShowLabel="false" />
                                                        </label>
                                                    </td>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="TimelineBottomLeftBG">
                    &nbsp;
                </td>
                <td class="TimelineBottomRightBG">
                    &nbsp;
                </td>
            </tr>
            <tr>
            </tr>
        </table>
        <asp:ImageButton runat="server" ID="SaveBtn" OnClick="SaveClick" AlternateText="Save"
            ImageUrl="Images/Button_Save.png" Style="float: right; margin-right: 20px;
            margin-top: 8px;" />
        <div id="AssignedPatientsMessage" class="redText" style="position: absolute; bottom: 100px;
            width: 80%; left: 10%; text-align: center;">
        </div>
        <asp:ImageButton runat="server" ID="PrevBtn" OnClick="PrevClick" AlternateText="Previous Screen"
            ImageUrl="Images/Button_Previous.png" CssClass="WizardPrevBtn" Style="float: left;
            margin-left: 20px; margin-top: 8px;" />
    </asp:Panel>
    </form>
</body>
</html>