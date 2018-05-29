<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEformBuilder.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminEformBuilder" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Caisis EForm Builder (ALPHA)</title>
    <link href="../../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="Styles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../../ClientScripts/jquery-ui.js"></script>

    <script type="text/javascript" src="../../ClientScripts/jquery.tablesorter.min.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        
        // supress conflict with caisis specific $ object
        jQuery.noConflict();

        // a list of existing Eforms
        var ACTIVE_EFORM_ARRAY = <%= ACTIVE_EFORM_ARRAY %>;

        // contains a map of table fields on the form
        var ACTIVE_FIELD_MAP = {};

        // A snapshot of the original loaded json eform data
        var ORIGINAL_EFORM_JSON = '';
        
        // controls how much of the window height - offset is alloted from workspace
        var WORKSPACE_HEIGHT_OFFSET = 160;

        // the callback path used by combo boxes
        var LOOKCODES_CALLBACK_PATH = '<%= Page.ResolveUrl("~/Core/Utilities/AjaxCallbacks/LookupCodesCallBack.aspx") %>';

        
        // returns if eform currently exists (by name)
        // @eformName = the name to check for in existing list
        function eformExists(eformName)
        {
            var exists = false;
            for(var i=0;i<ACTIVE_EFORM_ARRAY.length;i++)
            {
                if(eformName== ACTIVE_EFORM_ARRAY[i])
                {
                    exists = true;
                    break;
                }
            }
            return exists;
        }

        // adds an EformField from the map of active fields on eform
        // @li = the LI dom which represents the EformField
        function addItemToFieldMap(li) {
            var field = getEFormField(li);
            if (ACTIVE_FIELD_MAP[field.Table] == null) {
                ACTIVE_FIELD_MAP[field.Table] = {};
            }
            ACTIVE_FIELD_MAP[field.Table][field.Field] = 1;
        }

        // removes an EformField from the map of active fields on eform
        // @li = the LI dom which represents the EformField
        function removeItemFromFieldMap(li) {
            var field = getEFormField(li);
            if (ACTIVE_FIELD_MAP[field.Table] != null && ACTIVE_FIELD_MAP[field.Table][field.Field] != null) {
                ACTIVE_FIELD_MAP[field.Table][field.Field] = null;
            }
        }

        // MAIN DRAG DROP LIST CONFIGURATION
        // Controls UI events and elmenets when dragging and dropping items
        var SORTABLE_LIST_CONFIG =
        {
            placeholder: 'DragDropListItemsColumn',
            connectWith: 'ol',
            opacity: 0.7,
            helper: 'clone',
            cursor: 'move',
            over: function(event, ui) {
                //jQuery(this).sortable('cancel'); //('over');
            },
            // occurs when section receives focus but item (LI) hasn't been dropped yet
            activate: function(event, ui) {
                // update placeholder depending if dropping onto grid or column layout
                //                var sortableOL = jQuery(this);
                //                var isGrid = sortableOL.data('isGrid');
                //                var placeholderCSS = isGrid ? 'DragDropListItemsGrid' : 'DragDropListItemsColumn';
                //                sortableOL.sortable('option', 'placeholder', placeholderCSS);
            },
            drop: function(event, ui) {

            },
            // occurs when an item (LI) is dropped into a section
            update: function(event, ui) {
                // the OL onto which the LI was dropped
                var sortableOL = jQuery(this);
                // the LI dropped
                var droppedItem = ui.item;
                // if item is dragged onto grid, validate belongs to same field as existing fields
                var existingItems = sortableOL.find('li');
                if (sortableOL.data('isGrid') && existingItems.size() > 0) {
                    var firstExistingField = getEFormField(existingItems.first());
                    var fieldToInsert = getEFormField(droppedItem);
                    // if field to be dropped has same TableName as first item,
                    // ok to insert, otherwise not valid
                    if (firstExistingField.Table != fieldToInsert.Table) {
                        droppedItem.remove();
                        var gridFrieldlyTable = RULES_MAP[firstExistingField.Table].TableLabel;
                        alert('This grid can only accept fields from Table "' + gridFrieldlyTable + '".');
                        return;
                    }
                }

                // activate list
                activateList(sortableOL, droppedItem);
                // info about dropped LI (table, field, control type,etc...)
                addItemToFieldMap(droppedItem);
                // update toolbox state
                setToolboxItemsState();
            }
        };

        // controls list items which are draggable
        var DRAG_ITEM_CONFIG =
        {
            connectToSortable: '.DragDropList',
            helper: 'clone',
            revert: 'invalid'
        };

        /*
        // EFORM OBJECTS (Serializeable)
        */
        function getEFormSerializer(instance) { return function() { return serializeObject(instance); } }

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

        function Eform() {
            this.Name = '';
            this.Disease = '';
            this.VersionNumber = '';
            this.Pages = new Array();
            this.toString = getEFormSerializer(this);
        }

        function EformPage() {
            this.Title = '';
            this.VersionNumber = '';
            this.Sections = new Array();
            this.toString = getEFormSerializer(this);
        }

        function EformSection() {
            this.Title = '';
            this.ShowTitle = false;
            this.IsGrid = false;
            this.ChildSections = new Array();
            this.Fields = new Array();
            this.toString = getEFormSerializer(this);
        }

        function EformField() {
            this.Table = '';
            this.Field = '';
            this.ControlType = '';
            this.RowIndex = 0;
            this.ColIndex = 0;
            this.toString = getEFormSerializer(this);
        }

        // sets the status message text of the current EForm, i.e., save, not saved, etc...
        function setStatusMessage(message) {
            jQuery('#StatusMessage').text(message);
        }

        function loadTableFieldInToolbox() {
            // get selected table
            var table = jQuery('#TableList').val();
            var isValid = validateTableSelection(table);
            if (isValid) {
                // set loading
                jQuery('#fieldListInnerContainer').html('<img src="Images/LoadingFields.gif" style="margin: 20px 0px 0px 40px;" />');
                // fill toolbox list with remote list
                doSubmitEform('getItems', { 'table': table }, function(doc) {
                    var toolbox = jQuery(doc).find('.DragDropList').first();
                    var dom = toolbox[0];
                    // insert toolbox into DOM
                    jQuery('#fieldListInnerContainer').html('');
                    $('fieldListInnerContainer').appendChild(dom);
                    // make toolbox items (LI) draggable
                    // but disabled those which exist
                    toolbox.addClass('fieldList').find('LI').draggable(DRAG_ITEM_CONFIG);
//                    //.find('LI').each(function(index, li) {
//                        var jli = jQuery(li);
//                        // make draggable
//                        if (index % 2 == 0) {
//                            jli.draggable(DRAG_ITEM_CONFIG);
//                        }
//                        // otherwise disable
//                        else {
//                            jli.css('background-color', '#cccccc');
//                        }
//                    });
                    setToolboxItemsState();
                });
            }
            // otherwise select first item (empty) and clear toolbox
            else {
                //if (table != '') { jQuery('#TableList').val(''); }
                //jQuery('#fieldListInnerContainer').html('');
            }
        }

        // for each item in toolbox, disable if already on form
        function setToolboxItemsState() {
            jQuery('#fieldListInnerContainer').find('LI').each(function(index, li) {
                var jli = jQuery(li);
                var field = getEFormField(jli);
                // if a field exists in map, remove draggable, and disable
                if (ACTIVE_FIELD_MAP[field.Table] != null && ACTIVE_FIELD_MAP[field.Table][field.Field] != null) {
                    jli.draggable('disable');
                    //jli.css('background-color', '#cccccc');
                    jli.removeClass('ToolboxItem').removeClass('DragDropListItemsColumn').addClass('DisabledToolboxItem');
                }
                else {
                    jli.draggable('enable');
                    //jli.css('background-color', '#ffffff');
                    jli.removeClass('DisabledToolboxItem').addClass('ToolboxItem').addClass('DragDropListItemsColumn');
                }
            });
        }

        // validates that if a table has a parent (besides Patient),
        // that parent table needs to appear somewhere on the form
        function validateTableSelection(table) {
            var valid = false;
            if (table != '') {
                // get table info from lookup map
                var lookup = RULES_MAP[table];
                var pTable = lookup.ParentTableName;
                if (pTable == 'Patients') {
                    valid = true;
                }
                else {
                    // get current eform
                    var eform = getEForm();
                    for (var page in eform.Pages) {
                        for (var section in eform.Pages[page].Sections) {
                            for (var field in eform.Pages[page].Sections[section].Fields) {
                                var eField = eform.Pages[page].Sections[section].Fields[field];
                                if (eField.Table == pTable) {
                                    valid = true;
                                    break;
                                }
                            }
                        }

                    }
                    if (valid == false) {
                        // select parent table
                        jQuery('#TableList').val(pTable);
                        var noParentTableMessage = 'Table "' + lookup.TableLabel + '" requires a Parent "' + lookup.ParentTableLabel + '" record.';
                        alert(noParentTableMessage);
                    }
                }
            }
            return valid;
        }

        // add a new child section
        function addNewSection() {
            doSubmitEform('getSection', {}, initEForm);
            var mainWorkspace = $('mainWorkspace');
            setTimeout("mainWorkspace.scrollTop = mainWorkspace.scrollHeight",10);

        }


        // adds a child section to a parent section
        function addNewChildSection(container) {
            var div = document.createElement('DIV');
            div.className = 'EformChildSectionContainer';
            container.appendChild(div);
            addSectionToContainer(div, 'getSubSection');
            return false;
        }

        // insets a new section into the parent container
        function addSectionToContainer(dom, type) {
            // make ajax call to load a new section of type, when loaded initalize seciton
            var loadURL = 'GetEform.aspx?method=' + type;
            // load remote node when call returns
            var loadNodeId = '#EformSection';
            jQuery(dom).load(loadURL + ' ' + loadNodeId, function(doc) {
                //initEventOnSectionLoaded(dom);
            });
        }

        function moveSectionUp(parent, section) {
            // ?? USE jquery
            var prev = section.previousSibling;
            if (prev) {
                // remove from parent
                parent.removeChild(section);
                // insert back after prev sig
                parent.insertBefore(section, prev);
            }
        }

        function moveSectionDown(parent, section) {
            // ?? USE jquery
            var next = section.nextSibling;
            if (next) {
                parent.removeChild(section);
                if (next.nextSibling) {
                    // insert back after prev sig
                    parent.insertBefore(section, next.nextSibling);
                }
                else {
                    parent.appendChild(section);
                }
            }
        }

        // When section is loaded, attach events to allow dragging
        function initEventOnSectionLoaded(sectionDOM) {
            // get jQuery object for section DOM
            var sectionObject = jQuery(sectionDOM);
            

            // A list of OL representing columns and rows in a section
            var sortableOLs = sectionObject.find(".DragDropList");
            // add drag/drop/sorting to each OL in section
            sortableOLs.sortable(SORTABLE_LIST_CONFIG);

            // GET SECTION ROW with Layout
            var eformSectionRow = sectionObject.find('.sectionContents');
            // adjust section row to fit into cell
            eformSectionRow.width(eformSectionRow.parent().width() - 5);
            // GET CHILD SUB SECTION CONTAINER
            var eformSubSectionRow = sectionObject.find('.sectionChildContents').first()[0];
            // section's parent, page for sections, other sections for sub sections
            var parentContainer = sectionDOM.parentNode;

            // MOVE SECTION UP BUTTON
            sectionObject.find('.sectionUpBtn').click(function(event) {
                moveSectionUp(parentContainer, sectionDOM);
                event.preventDefault();
            });
            // MOVE SECTION DOWN BUTTON
            sectionObject.find('.sectionDownBtn').click(function(event) {
                moveSectionDown(parentContainer, sectionDOM);
                event.preventDefault();
            });
            // ADD SUB SECTION
            sectionObject.find('.addSubSectionBtn').click(function(event) {
                addNewChildSection(eformSubSectionRow);
                event.preventDefault();
            });
            // DELETE BUTTON - hide section
            sectionObject.find('.DeleteSectionBtn').click(function(event) {
                if (confirm('Are you sure you want to remove this section?')) {
                    // before removing section, remove fields from map
                    sectionObject.find('LI').each(function(index, li) { removeItemFromFieldMap(li); });
                    // remove seciton DOM
                    sectionObject.remove();
                    // update field map
                    setToolboxItemsState();
                }

                //eformSectionRow.hide('slow').data('deleted', true);
                //deleteBtn.hide('slow');
                //undoBtn.show('slow');
            });
            // UNDO DELETE BUTTON - show section
            sectionObject.find('.UndoDeleteSectionBtn').click(function(event) {
                eformSectionRow.show('slow').data('deleted', false);
                deleteBtn.show('slow');
                undoBtn.hide('slow');
            });

            // SET COLUMN/GRID LAYOUT AND IMG CLICK
            var singleImg = sectionObject.find('.ToggleOneColumnBtn')[0];
            var doubleImg = sectionObject.find('.ToggleTwoColumnBtn')[0];
            var gridImg = sectionObject.find('.ToggleGridBtn')[0];
            // Array of DOM images
            var layoutImgList = [singleImg, doubleImg, gridImg];
            // Array of column counts, must match img list
            var layoutColList = [1, 2, 0];
            // Function: when activated with event object will set approriate img states
            var setAllImgStates = curry(toggleAllSectionImages, layoutImgList);
            // sets list as grid
            var toggleGridOn = curry(setItemListAsGrid, sortableOLs, true);
            // removes grid layout
            var toggleGridOff = curry(setItemListAsGrid, sortableOLs, false);

            // for each img, add click handler to set img state
            for (var i = 0; i < layoutImgList.length; i++) {
                var img = jQuery(layoutImgList[i]);
                var colCount = layoutColList[i];
                // is col layout (turn off grid and set list)
                if (colCount > 0) {
                    var setColumnLayout = curry(setItemListAsColumns, sortableOLs, colCount);
                    img.click(toggleGridOff).click(setColumnLayout);
                    jQuery(img).click(setAllImgStates);
                }
                // is grid layout (turn on grid)
                else {
                    img.click(function(e) {
                        // before setting as grid, validate fields in section are from same table
                        var listoffields = sortableOLs.find('LI');
                        if (listoffields.size() > 0) {
                            var gridTable = getEFormField(listoffields.first()).Table;
                            var isValid = true;
                            listoffields.each(function(i, f) {
                                var eformField = getEFormField(f);
                                if (eformField.Table != gridTable) {
                                    isValid = false;
                                }
                            });
                            // if fields from other table found, warn user
                            if (!isValid) {
                                alert('Please verify the fields all belong to the same table before changing to grid layout.');
                                return false;
                            }
                        }
                        setAllImgStates(e);
                        toggleGridOn(e);
                    });
                }
            }

            // HANDLE LOADING EXISTING POPULATED SECTION

            // determine if currently a grid of column
            if (sortableOLs.first().hasClass('DragDrownListRow')) {
                setItemListAsGrid(sortableOLs, true);
                toggleGridOn();
                // set grid as active image
                setAllImgStates({ target: gridImg });
            }
            // DEAFULT SECTION TO 2 COLUMN LAYOUT
            else {
                setItemListAsColumns(sortableOLs, 2);
                // set 2 col as active image
                setAllImgStates({ target: doubleImg });
            }

            // INITALIZE EXISTING SECTION
            activateList(sortableOLs, sortableOLs);

            // UPDATE MAP WITH ALL ITEMS IN SECTIOn
            sectionObject.find('LI').each(function(index, li) {
                addItemToFieldMap(li);
            });
            setToolboxItemsState();
        }

        // Setup list style (row, column, etc...) and find all controls in content and ensures they are shown
        // @list = an OL representing a column/grid
        // @context =  i.e, a single LI or a list of LI
        function activateList(list, context) {
            setSingeItemList(list);
            jQuery(context).find('.fieldControlContainer').each(function(i, container) {
                jQuery(container).css('display', '');
            });
        }

        function toggleAllSectionImages(imgList, e) {
            for (var i = 0; i < imgList.length; i++) {
                var img = imgList[i];
                toggleListImage(img, e);
            }
        }

        // sets the image's on off state if it was clicked
        function toggleListImage(img, e) {
            // if image is one invoking click
            var isClick = img == e.target;
            setBtnOnOffState(jQuery(img), !isClick, '.png', '_on.png');
        }

        // sets the column layout, i.e., 1,2,3...etc
        // if colCount = 1, user is prompted if fields in other column will be moved to first
        // user can supress move, and column layout will not be changed
        // return: if user supressed rearranging of items
        function setItemListAsColumns(itemLists, colCount) {
            var userSupress = false;
            var firstList = jQuery(itemLists).first();
            if (colCount == 1) {
                // validate no items in other columns
                var itemsInOtherColumns = 0;
                jQuery(itemLists).each(function(i, item) {
                    if (i > 0) {
                        itemsInOtherColumns += jQuery(item).find('li').length;
                    }
                });
                var warning = 'You have items in the other column, would you like to move them to the first column?.';
                // ?? remove if
                if (false && itemsInOtherColumns > 0) {
                    userSupress = !confirm(warning);
                }
                if (itemsInOtherColumns == 0 || (itemsInOtherColumns > 0 && !userSupress)) {
                    //firstList.css('float', 'none');
                    // hide other OL besides first
                    jQuery(itemLists).each(function(i, item) {
                        if (i > 0) {
                            firstList.append(jQuery(item).find('li'));
                            jQuery(item).css('display', 'none');
                        }
                    });
                }
                // center single column
                //firstList.css('height', '200px');
                //firstList.css('width','50%').css('float', 'none').css('margin', 'auto');
            }
            else {
                // for each OL, reset styles
                jQuery(itemLists).css('display', '').each(function(colIndex, item) {
                    jQuery(item).css('width', 'auto').css('float', colIndex == 0 ? 'left' : 'right');
                });
            }
            return userSupress;
        }

        // Sets the section as a grid by setting each column as a row
        // @itemLists: a list of OL representing a row in the grid
        function setItemListAsGrid(itemLists, isGrid) {
            var supressed = setItemListAsColumns(itemLists, 1);
            if (!supressed) {
                itemLists.each(function(i, itemList) {
                    jQuery(itemList).data('isGrid', isGrid);
                    // signal update event for list
                    setSingeItemList(itemList);
                });
            }
        }

        // Adjust the list of section fields to column or grid layout
        // @itemList: OL containing a list of fields
        function setSingeItemList(itemList) {
            var section = jQuery(itemList);
            var isGrid = section.data('isGrid');
            // if layout is grid
            if (isGrid) {
                // set OL row
                section.removeClass('DragDropListColumn').addClass('DragDrownListRow');
                // set LI grid cell placeholder
                //section.sortable('option', 'placeholder', 'ToolboxItemHighlightCellGrid');
                var items = section.find('li');
                if (items.length > 0) {
                    // set LI to row cell
                    items.removeClass('DragDropListItemsColumn').addClass('DragDropListItemsGrid');
                    section.find('.EformFieldLabel').removeClass('EformFieldLabelColumn').addClass('EformFieldLabelGrid');
                    section.find('.fieldControlContainer').removeClass('fieldControlContainerColumn').addClass('fieldControlContainerGrid');

                    var buffer = 350;
                    var overflowWidth = (items.first().width() * (items.length + 1)) + buffer + 'px';
                    // set explicit width on OL
                    section.css('width', overflowWidth);
                }
            }
            else {
                // set OL to column
                section.removeClass('DragDrownListRow').addClass('DragDropListColumn'); //.css('width', '');
                // set LI column placeholder
                //section.sortable('option', 'placeholder', 'ToolboxItemHighlightCell');
                // set LI to column cell
                section.find('li').removeClass('DragDropListItemsGrid').addClass('DragDropListItemsColumn');
                // ensure label and control container classes
                section.find('.EformFieldLabel').removeClass('EformFieldLabelGrid').addClass('EformFieldLabelColumn');
                section.find('.fieldControlContainer').removeClass('fieldControlContainerGrid').addClass('fieldControlContainerColumn');
            }
        }

        // sets the active eformid, and updates UI
        function setEFormId(id) {
            jQuery('#EformId').val(id);
            setUpdatEFormButtons();
        }
        // gets the current eformid on page
        function getEFormId() { return jQuery('#EformId').val(); }

        function setUpdatEFormButtons() {
            var isActive = getEFormId() != '';
            setBtnOnOffState(jQuery('#PreviewEformBtn'), isActive, '.png', '_disabled.png');
            setBtnOnOffState(jQuery('#DeleteEformBtn'), isActive, '.png', '_disabled.png');
        }

        function setBtnOnOffState(btn, isOn, on, off) {
            var img = jQuery(btn);
            var base = img.attr('src').replace(off, on);
            img.attr('src', !isOn ? base.replace(on, off) : base);
        }

        // loads an eform into current page by eform id
        function loadEFormOnUpdate(eformId) {
            window.location = '?eformId=' + eformId;
        }

        function loadBlankEForm() {
            loadEFormOnUpdate('');
        }

        function saveEform() {
            // get EForm from DOM
            var eform = getEForm();
            // validate
            if (validateEform(eform)) {
                // output serialized eform
                var serializedEform = eform.toString();
                // POST serialized EForm to server
                doSubmitEform('save', { "eform": serializedEform }, function(doc, eformId, message) {
                    // if server signled update error
                    if (message != '') {
                        alert(message);
                    }
                    // otherwise if eform id is insered/updated, reload form
                    else if (eformId != '') {
                        loadEFormOnUpdate(eformId);
                    }
                });
            }
        }
        

        function deleteEform() {
            var activeEFormId = getEFormId();
            if (activeEFormId && activeEFormId != '') {
                var doDelete = confirm('Are you sure you want to delete this EForm?');
                if (doDelete) {
                    doSubmitEform('delete', {}, function(doc, eformId, message) {
                        if (message != '') {
                            alert(message);
                        }
                        // if no message from server, close form
                        else {
                            if (window.opener && window.opener.closeBuilderAndReload) {
                                window.opener.closeBuilderAndReload.call(window.opener);
                            }
                            else {
                                if (parent.showHideAdminNav) showHideAdminNav(false);
                                window.location = 'AdminEformList.aspx';
                            }
                        }
                    });
                }
            }
            else {
                alert('The current Eform is not been saved, and cannot be deleted.');
            }
        }

        // validate an eform be checking required fields, i.e, "Name", etc...
        function validateEform(eform) {
            var existingEformId = getEFormId();
            // collect a list of validation errors
            var validation = new Array();
            // validate name
            if (eform.Name == '') {
                validation.push('Please enter a title for this EForm before saving.');
            }
            // if name is valid, validate that isn't new eform which matches exisitng one
            else if(!validateEformName(true)) {
                validation.push('The Eform ' + eform.Name + ' already exists in the System.');   
            }
            // validate pages
            if (eform.Pages.length == 0) {
                validation.push('Please validate the EForm has pages.');
            }
            // validate sections
            else if (eform.Pages[0].Sections.length == 0) {
                validation.push('An EForm requires at least one Section before saving.');
            }

            var isValid = validation.length == 0;
            // if invalid, display validation message
            if (!isValid) {
                var validationMessage = validation.join('\n');
                alert(validationMessage);
            }

            return isValid;
        }
        
        // validates that on new eforms, another one doesn't exist by same name
        function validateEformName(supressWarning)
        {
            var eformId = getEFormId();
            var eformName = jQuery('#EformName').val().toLowerCase();
            var isValid = !(eformId =='' && eformExists(eformName));
            if(!isValid && (supressWarning == null || supressWarning == false))
            {
                alert('An Eform with the same name already exists in the system.');
            }
            return isValid;
        }

        // POSTs a REQUEST to the server to perform an action on an eform.
        // NOTE: EformId hidden value will always be sent as part of REQUEST
        // supplied data object will be serialized to POST key val pairs
        // i.e., { "name" : "John", "age" : "21", "eFormId" : "21" } => Request.Form["name"].....
        function doSubmitEform(method, data, callback) {
            // append eformId to data
            data.eFormId = data.eFormId ? data.eFormId : getEFormId();
            // make POST request to server
            jQuery.ajax({
                type: 'POST',
                url: 'GetEform.aspx?method=' + method,
                data: data,
                success: function(doc) {
                    // get eformid from returned document
                    var updatedEformId = jQuery(doc).find('#EFormId').val();
                    // get message from returned document
                    var message = jQuery(doc).find('#OperationMessage').val();
                    // set local eform hidden
                    setEFormId(updatedEformId);
                    // update status with message
                    setStatusMessage(message);

                    // invoke client callback with returned html document
                    if (callback) {
                        callback(doc, updatedEformId, message);
                    }
                },
                dataType: 'text/html'
            });
        }

        // PREVIEW EFORM

        // POST the current EForm for previewing
        function previewEForm() {
            //previewEFormLayout();
            var eformId = getEFormId();
            if (eformId != '') {
                if (isEformDirty()) {
                    alertEformDirty();
                }
                else {
                    previewDataEntryEForm();
                }
            }
            else {
                alert('You must save the EForm before previewing.');
            }
        }

        // loads the current "unsaved" eform for previewing layout
        function previewEFormLayout() {
            var eform = getEForm();
            jQuery('#preview_eform').val(eform);
            jQuery('#PreviewForm').submit();
        }

        // load the current "saved" eform into Dynamic Data Entry Container
        function previewDataEntryEForm() {
            var eformName = jQuery('#EformName').val();
            var eformPath = '<%= Page.ResolveUrl("~/Core/DynamicEforms/Eform.aspx") %>';
            var eformParams = '?paid=<%= EPID %>&eformName=' + escape(eformName) + '&preview=true';
            var dynamicEFormPath = eformPath + eformParams;
            window.open(dynamicEFormPath);
            return false;
        }

        // load eform by id
        function loadEForm(eformId) {
            doSubmitEform('load', {}, initEForm);
        }

        // 
        function initEForm(doc) {
            jQuery(doc).find('.EformPageContainer').each(initPage);
            // when initalizing eform for first time, take snapshot of serialized eform
            if (ORIGINAL_EFORM_JSON == '') {
                ORIGINAL_EFORM_JSON = getEForm();
            }
        }

        function initPage(index, page) {
            jQuery(page).find('.EformSectionContainer').each(initSection);
        }

        function initSection(index, section) {
            // insert into DOM
            $('mainWorkspace').appendChild(section);
            // initialize section scripts
            initEventOnSectionLoaded(section);
        }

        // EFORM FROM DOM

        // Returns an EForm object represented by the DOM
        function getEForm() {
            var eform = new Eform();
            eform.Name = jQuery('#EformName').val();
            eform.Disease = jQuery('#DiseaseList').val();
            var eFormPage = new EformPage();
            eFormPage.Title = eform.Name;  //jQuery('#EformPageTitle').val();
            eform.Pages.push(eFormPage);
            // for each top level section, collect fields
            jQuery('.EformSectionContainer > .eformSection').each(curry(traverseSection, eFormPage));
            return eform;
        }

        function traverseSection(eFormPage, sectionIndex, sectionDOM) {
            // new section
            var eFormSection = new EformSection();
            eFormSection.Title = getSectionTitle(sectionDOM);
            eFormSection.ShowTitle = getSectionShowTitle(sectionDOM);

            var sectionIsValid = false;
            // for each section, add fields
            jQuery(sectionDOM).find('.sectionContents').first().find('.DragDropList').each(function(colIndex, ol) {
                // for each field in column
                var isGrid = jQuery(ol).data('isGrid');
                isGrid = isGrid != null ? isGrid : false;
                eFormSection.IsGrid = isGrid;
                var sectionFields = jQuery(ol).find('li');
                // if section has fields, valild
                if (sectionFields.size() > 0) {
                    sectionIsValid = true;
                    sectionFields.each(curry(traverseFields, eFormSection, isGrid, colIndex));
                }
            });
            // only collection child sections if parent is valid
            if (sectionIsValid) {
                // now collect detatils for child sections
                var childSections = jQuery(sectionDOM).find('.EformChildSectionContainer');
                if (childSections.size() > 0) {
                    childSections.each(function(i, s) {
                        // creat a new child section
                        var eFormChildSection = new EformSection();
                        eFormChildSection.Title = getSectionTitle(s);
                        eFormChildSection.ShowTitle = getSectionShowTitle(s);
                        // add child section to parent
                        eFormSection.ChildSections.push(eFormChildSection);
                        // now collect fields for section
                        jQuery(s).find('.DragDropList').each(function(colIndex, domFieldList) {
                            // for each field in column
                            var isGrid = jQuery(domFieldList).data('isGrid');
                            isGrid = isGrid != null ? isGrid : false;
                            eFormChildSection.IsGrid = isGrid;
                            jQuery(domFieldList).find('li').each(curry(traverseFields, eFormChildSection, isGrid, colIndex));
                        });
                    });
                }

                // now add section to page, since it is valid
                eFormPage.Sections.push(eFormSection);
            }
        }

        function traverseFields(eFormSection, isGrid, colIndex, rowIndex, domLI) {
            // if grid, OL = rowIndex, LI = colIndex
            if (isGrid) {
                traverseFieldsGrid(eFormSection, colIndex, rowIndex, domLI);
            }
            // else table, OL = colIndex, LI = rowIndex
            else {
                traverseFieldsColumn(eFormSection, colIndex, rowIndex, domLI);
            }
        }

        // fields layout as table, columns and rows
        function traverseFieldsColumn(eFormSection, colIndex, rowIndex, domLI) {
            var field = getEFormField(domLI);
            field.ColIndex = colIndex;
            field.RowIndex = rowIndex;
            eFormSection.Fields.push(field);
        }

        // fields layout as grid
        function traverseFieldsGrid(eFormSection, rowIndex, colIndex, domLI) {
            var field = getEFormField(domLI);
            field.ColIndex = colIndex;
            field.RowIndex = rowIndex;
            eFormSection.Fields.push(field);
        }

        // Gets an EFormField object row represented by LI DOM
        function getEFormField(domLI) {
            var field = new EformField();
            // field into held in hidden fields
            field.Table = getFieldTable(domLI);
            field.Field = getFieldName(domLI);
            field.ControlType = getFieldControlType(domLI);
            return field;
        }

        // returns if the original Eform loaded matches current state of eform interface
        function isEformDirty() {
            // check if original JSON data matches existing JSON data
            var isDirty = ORIGINAL_EFORM_JSON != getEForm().toString();
            return isDirty;
        }

        function alertEformDirty() {
            var doSave = confirm('You have made changes to the Eform, would you like to save the current Eform?');
            if (doSave) {
                saveEform();
            }
            return doSave;
        }
        
        function closeEForm() {
            //previewEFormLayout();
            
            var eformId = getEFormId();
            if (eformId != '') {
                var isDirty = isEformDirty();
                // close if eform not dirty or is dirty and user did not save
                if (!isDirty || (isDirty && alertEformDirty() == false)) {
                    window.close();
                }
            }
            else { 
                var answer = confirm('Save changes before closing?  Click OK to save, click Cancel to close without saving.')
	            if (answer){
		            saveEform();
	            }
	            else{
		            window.close();
	            }
            }
        }

        // EForm Section Helpers
        function getSectionTitle(dom) { return getFieldValueByClass(dom, 'sectionTitle'); }
        function getSectionShowTitle(dom) { return jQuery(dom).find('.ShowSection').first().attr('checked'); }

        // EForm Field Helpers
        function getFieldTable(dom) { return getFieldValueByClass(dom, 'Field_TableName'); }
        function getFieldName(dom) { return getFieldValueByClass(dom, 'Field_FieldName'); }
        function getFieldControlType(dom) { return getFieldValueByClass(dom, 'Field_ControlType'); }

        function getFieldValueByClass(dom, cls) {
            var selector = '.' + cls;
            return jQuery(dom).find(selector).first().val();
        }

        /*
        // INITALIZATION EVENTS (add event handlers, prepare DOM, etc...)
        */
        jQuery(document).ready(function() {
            
            // add save click event
            jQuery('#SaveEformBtn,#SaveEformBtn2').click(function(event) {
                event.preventDefault();
                saveEform();
            });

            // delete eform click event
            jQuery('#DeleteEformBtn').click(function(event) {
                event.preventDefault();
                deleteEform();
            });

            // delete eform click event
            jQuery('#CloseEformBtn').click(function(event) {
                event.preventDefault();
                closeEForm();
            });


            // add new section click event
            jQuery('#AddNewSectionBtn,#AddNewSectionBtn2').click(function(event) {
                // supress submit
                event.preventDefault();
                addNewSection();
            });

            // preview button click event
            jQuery('#PreviewEformBtn').click(function(event) {
                // supress submit
                event.preventDefault();
                previewEForm();
            });

            // help button click event
            jQuery('#HelpBtn').click(function(event) {
                // supress submit
                event.preventDefault();
                showHelp();
            });

            // close help button click event
            jQuery('#CloseHelpBtn').click(function(event) {
                // supress submit
                event.preventDefault();
                hideHelp();
            });
            
            // validate eform name on new eform
            jQuery('#EformName').blur(function() 
            {
                var valid = validateEformName(false);
//                if(!valid) {
//                    jQuery(this).focus();
//                }
            });

            // add change event to toolbox
            jQuery('#TableList').change(loadTableFieldInToolbox);

            // init trash to capture LI
            jQuery('#Trash').sortable({
                placeholder: 'ToolboxItemHighlightCell',
                connectWith: 'ol',
                opacity: 0.1,
                helper: 'clone',
                cursor: 'move',
                tolerance: 'pointer',
                update: function(event, ui) {
                    // before trashing, update map by removing field
                    var li = ui.item;
                    removeItemFromFieldMap(li);
                    setToolboxItemsState();
                    // finally trash item
                    trashItem(li);
                }
            });

            // make help layer draggable
            jQuery('#HelpLayer').draggable();
            
            // DEFAULT: load first list of items in Toolbox
            loadTableFieldInToolbox();

            // DEFAULT: load eform
            var eformId = getEFormId();
            if (eformId != '') {
                loadEForm(eformId);
            }
            else {
                addNewSection();
            }

            // DEFAULT: Set buttons states
            setUpdatEFormButtons();

            // ADJUST WORKSPACE ON LOAD AND RESIZE
            adjustMainWorkspace();
            jQuery(window).resize(adjustMainWorkspace);
        });

        // trashes item(LI) (remove from DOM) and updated trash count
        function trashItem(item) {
            jQuery(item).attr('class', 'TrashItemDisposed').fadeOut('fast', function() { jQuery(this).remove(); });
        }

        function setTitleStyle(titleTextBox) {
            if (titleTextBox.value.length < 1) {titleTextBox.className = 'eformTitleEmpty'; titleTextBox.focus();}
            else titleTextBox.className = 'eformTitle';
        }

        // adjust the height of Main Work Space to prevent page from scolling
        function adjustMainWorkspace() {
            var winHeight = jQuery(window).height();
            var adjustHeight = Math.max(300, winHeight - WORKSPACE_HEIGHT_OFFSET);
            var list = jQuery('#fieldListInnerContainer');
            list.css('height', (adjustHeight - 140) + 'px');
            var workspace = jQuery('#mainWorkspace');
            workspace.css('height', adjustHeight + 'px');
        }

        function showHelp() {
            jQuery('#HelpLayer').show('fast');
        }
        function hideHelp() {
            jQuery('#HelpLayer').hide('fast');
        }
        

        /* ]]> */
    </script>

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <style type="text/css">
        body
        {
            min-height: 100%;
            margin: 0px 0px 0px 0px;
            background-color: #EEEFF0;
            padding: 0px 10px 0px 10px;
        }
        #eformBuilderLeftCol
        {
            width: 257px;
            vertical-align: top;
        }
        #eformTitle
        {
            margin: 19px 0px 0px 0px;
        }
        .eformTitle
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #8D2A2C;
            font-size: 15px;
            font-weight: bold;
            border: solid 1px #E4E4E5;
            background-color: #F3F4F5;
            width: 251px;
            padding-left: 3px;
        }
        .eformTitle:hover
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #8D2A2C;
            font-size: 15px;
            font-weight: bold;
            border: solid 1px #cccccc;
            background-color: #ffffff;
            width: 251px;
            padding-left: 3px;
        }
        .eformTitle:focus
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #8D2A2C;
            font-size: 15px;
            font-weight: bold;
            border: solid 1px #cccccc;
            background-color: #ffffff;
            width: 251px;
            padding-left: 3px;
        }
        .eformTitleEmpty
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #8D2A2C;
            font-size: 15px;
            font-weight: bold;
            border: solid 1px #8d2a2c;
            width: 251px;
            padding-left: 3px;
            background-image: url(Images/AdminImages/STARTByEnteringTheEFormTitleHere.gif);
            background-repeat: no-repeat;
            background-position: 6px 6px;
        }
        #fieldListOuterContainer
        {
            border: solid 1px #CCCCCC;
            background-color: #f7f7f7;
            padding: 10px 9px 10px 9px;
            margin: 3px 0px 0px 0px;
        }
        .sectionTitleText
        {
            font-family: Verdana, Geneva, sans-serif;
            color: #222222;
            font-size: 13px;
            font-weight: bold;
        }
        .smallHelpText
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #333333;
            font-size: 10px;
        }
        #tableSelectorContainer
        {
            font-family: Verdana, Geneva, sans-serif;
            color: #111111;
            font-size: 11px;
            font-weight: bold;
            white-space: nowrap;
            margin: 12px 0px 5px 0px;
        }
        #tableSelectorContainer select
        {
            font-family: Verdana, Geneva, sans-serif;
            color: #333333;
            font-size: 11px;
            font-weight: normal;
            width: 234px;
            margin: 0px 0px 0px 0px;
        }
        #fieldListInnerContainer
        {
            overflow: auto;
            overflow-x: hidden;
            background-color: #F8FAFC;
            border: solid 1px #cccccc;
        }
        .fieldList
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #333333;
            font-size: 13px;
            list-style-type: none;
            padding: 9px 3px 6px 3px;
            margin: 0px;
        }
        .fieldList li
        {
            border: solid 1px #cccccc; /* background-color: #ffffff; */
            margin: 0px 0px 3px 0px;
            padding: 4px;
            cursor: move;
        }
        #mainControlButtons
        {
            margin-top: 19px;
            margin-bottom: 3px;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap;
            color: #333333;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 15px;
            font-weight: bold;
        }
        #mainControlButtons img
        {
            margin-right: 17px;
            cursor: pointer;
        }
        #eformBuilderRightCol
        {
            padding-left: 15px;
            vertical-align: top;
        }
        #mainWorkspace
        {
            border: solid 1px #cccccc;
            background-color: #f7f7f7;
            overflow: auto;
            padding-bottom: 40px;
        }
        .eformSection
        {
            margin: 24px 13px 15px 6px;
            width: 94%;
        }
        .sectionSortButtonCol
        {
            width: 15px;
            vertical-align: top;
        }
        .sectionSortButtonCol img
        {
            margin: 2px 0px 1px 0px;
            cursor: pointer;
        }
        .sectionTitle
        {
            border: solid 1px #b3b3b3;
            background-color: #ffffff;
            height: 20px;
            width: 230px;
        }
        .sectionButtons
        {
            float: right;
            display: inline-block;
            white-space: nowrap;
            background-image: url(Images/AdminImages/LayoutToggleBG.png);
            background-repeat: no-repeat;
            height: 19px;
            vertical-align: top;
            display: inline-block;
            margin: 0px 0px 0px 0px;
            padding-left: 3px;
        }
        .sectionButtons img
        {
            width: 15px;
            height: 11px;
            cursor: pointer;
            margin: 4px 3px 0px 3px;
        }
        .sectionButtons img.deleteSectionButton
        {
            width: 20px;
            height: 15px;
            margin: 0px 0px 0px 13px;
        }
        .sectionTitleCell
        {
            white-space: nowrap;
            vertical-align: bottom;
            padding-bottom: 3px;
        }
        .sectionContentCell
        {
            background-color: #f8fafc;
            border: solid 1px #cccccc;
        }
        .sectionContents
        {
            width: 800px;
            overflow: auto;
            min-height: 134px;
        }
        .sectionChildContents
        {
            width: 800px; /*            min-height: 50px; */
        }
        .sectionContentsCol2
        {
            float: right;
        }
        .sectionList
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #333333;
            font-size: 13px; /*           list-style-image: url(Images/AdminImages/Button_Info_small.png); */
            list-style-image: none; /* remove this if we want to go back to the info button */
            list-style: none; /* remove this if we want to go back to the info button */
            list-style-position: outside;
            padding: 9px 3px 6px 3px;
            margin: 0px 0px 0px 0px;
            width: auto;
            min-width: 350px;
            min-height: 100px;
        }
        .sectionList.DragDrownListRow
        {
        }
        .sectionList li
        {
            border: solid 1px #cccccc;
            background-color: #ffffff;
            margin: 7px 0px 7px 50px;
            padding: 10px 17px 10px 17px;
            cursor: move;
            vertical-align: top;
            min-width: 290px;
        }
        .sectionList2Cols
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #333333;
            font-size: 13px; /*            list-style-image: url(Images/AdminImages/Button_Info_small.png);  */
            list-style-image: none; /* remove this if we want to go back to the info button */
            list-style: none; /* remove this if we want to go back to the info button */
            list-style-position: outside;
            padding: 9px 3px 6px 3px;
            margin: 0px 0px 0px 0px;
            width: 350px;
        }
        .sectionList2Cols li
        {
            border: solid 1px #cccccc;
            background-color: #ffffff;
            margin: 7px 0px 7px 50px;
            padding: 10px 17px 10px 17px;
            cursor: move;
            vertical-align: top;
            min-width: 290px;
        }
        .fieldControlContainer
        {
            display: inline;
            margin-left: 30px;
        }
        .builderInput
        {
            border: solid 1px #cccccc;
            width: 100px;
        }
        .fieldList div
        {
            display: none;
        }
        .TrashItemDisposed
        {
            height: 100%;
            margin: 0px;
            padding: 0px;
            border: 1px dashed #cccccc;
        }
        #mainControlButtons img
        {
            vertical-align: text-bottom;
        }
        .fieldControlContainerGrid
        {
            display: block;
            border: solid 1px #dddddd;
            background-color: #ffffff;
            padding: 10px 5px 10px 5px;
            width: auto;
            white-space: nowrap;
        }
        li.DragDropListItemsGrid
        {
            text-align: center;
            min-width: 80px;
            border: none;
            background-color: Transparent;
            margin: 0px 0px 0px 0px;
            padding: 0px 0px 0px 0px;
            cursor: move;
        }
        .ToolboxItem.DragDropListItemsGrid
        {
        }
        .RequiredField
        {
            color: #8d2a2c;
            font-weight: bold;
        }
        li.DragDropListItemsGrid select
        {
        }
        .DisabledToolboxItem
        {
            font-weight: bold;
            background-color: #cccccc;
        }
        #HelpLayer
        {
            z-index: 100;
            left: 150px;
            top: 16px;
            position: absolute;
            background-image: url(Images/AdminImages/HelpPopupBG.png);
            background-repeat: no-repeat;
            width: 845px;
            height: 534px;
            display: none;
        }
        #HelpTitle
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #ffffff;
            font-weight: bold;
            font-size: 12px;
            margin-left: 32px;
            margin-top: 13px;
            width: 794px;
            line-height: 20px;
            cursor: move;
        }
        #HelpText
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #333333;
            font-weight: normal;
            font-size: 13px;
            line-height: 18px;
            margin-left: 32px;
            margin-top: 22px;
            width: 778px;
            height: 435px;
            overflow: auto;
            display: none;
        }
        #HelpText p
        {
            margin-top: 0px;
        }
        #HelpFrame
        {
            position: absolute;
            left: 3%;
            top: 50px;
            width: 94%;
            height: 425px;
            border: 1px solid #cccccc;
            margin: 0px;
        }
        p strong
        {
            color: #111111;
        }
    </style>
</head>
<body style="overflow: hidden;">
<form id="form1" runat="server">

<div id="HelpLayer" >
<div id="HelpTitle"><img id="CloseHelpBtn" src="Images/AdminImages/shim.gif" style="width: 16px; height: 16px; float: right; cursor: pointer;" alt="Close" />EForm Builder Help</div>
<%-- WORKFLOWS HELP URL --%>
<iframe id="HelpFrame" frameborder="0" src="http://www.caisis.org/wiki/index.php?title=EForm_and_Workflow_Builder"></iframe>
</div>

<table style="width: 100%;" cellspacing="0">
<tr>
<td id="eformBuilderLeftCol">
    <div id="eformTitle">
			<custom:CaisisTextBox runat="server" ID="EformName" ShowLabel="false" onkeyup="setTitleStyle(this);" CssClass="eformTitle" autocomplete="off"></custom:CaisisTextBox>
        <asp:HiddenField runat="server" ID="EformId" />
        <span id="StatusMessage"></span>
    </div>
    <div id="fieldListOuterContainer">
        <span class="sectionTitleText">Available Fields</span>
        <div class="smallHelpText">
            Select a table and drag a control into a section on the right to add. <span style="color: #8d2a2c;
                font-weight: bold;">Red</span> items are required fields.
        </div>
        <div id="tableSelectorContainer">
            Select Table<select id="TableList" name="TableList" style="margin-left: 0px;"><option value=""></option>
                <asp:Repeater runat="server" ID="ParentTables" OnItemDataBound="BuildChildTables">
                    <ItemTemplate><option value="<%#  (Container.DataItem as TableLookup).TableName %>" <%# Container.ItemIndex ==0 ? "selected='selected'" : "" %>>
                            <%# (Container.DataItem as TableLookup).TableLabel %></option>
                        <asp:Repeater runat="server" ID="ChildTables">
                            <ItemTemplate>
                                <option value="<%# (Container.DataItem as TableLookup).TableName %>">
                                   &nbsp;&nbsp;<%# (Container.DataItem as TableLookup).TableLabel %></option>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:Repeater>
            </select>
        </div>
        <div id="fieldListInnerContainer">
            <ol id="fieldList" class="DragDropList">
            </ol>
        </div>
        <%-- Trash Can --%>
        <div id="TrashCan">
            <ol id="Trash" style="z-index: auto;">
            </ol>
        </div>
    </div>
</td>
<td id="eformBuilderRightCol">
<div id="mainControlButtons"><div style="float: right;">
  <img id="PreviewEformBtn" src="Images/AdminImages/Button_PreviewEForm.png" alt="Preview This EForm" />
  <img id="SaveEformBtn" src="Images/AdminImages/Button_Save.png" alt="Save This EForm" /><img id="CloseEformBtn" src="Images/AdminImages/Button_CloseWindow.png" alt="Close Window"  style="cursor: pointer; margin-right: 0px;" /></div>Disease:<asp:DropDownList runat="server" ID="DiseaseList" DataTextField="Disease" DataValueField="Disease" style="margin: 0px 50px 0px 5px;"/>
  <img id="AddNewSectionBtn" src="Images/AdminImages/Button_AddSection.png" alt="Add a section to this EForm"/>
  <img id="HelpBtn" src="Images/AdminImages/Button_NeedHelp.png" alt="View help on creating and editing a dynamic EForm" style="margin-left: 50px;"/>
</div>
<%-- An Eform Page --%>
   
    <div id="mainWorkspace">
    
    
    </div>
    <img id="SaveEformBtn2" src="Images/AdminImages/Button_Save.png" alt="Save" style="float: right;cursor: pointer; margin-top: 3px; margin-right: 107px;"/>
    <img id="DeleteEformBtn" src="Images/AdminImages/Button_DeleteThisEForm.png" alt="Delete This EForm"  style="float: right;cursor: pointer; margin-top: 3px; margin-right: 20px;" />
    <img id="AddNewSectionBtn2" src="Images/AdminImages/Button_AddSection.png" alt="Add a section to this EForm"  style="cursor: pointer; margin-top: 3px;"/>
    
</td>
</tr>
</table>
    

<script type="text/javascript">setTitleStyle(document.getElementById('<% =EformName.ClientID %>'));</script>
</form>
    
        <%-- FORM for Previewing EForm --%>
    <form id="PreviewForm" method="post" action="GetEform.aspx?method=preview" target="_blank">
    <input type="hidden" id="preview_eform" name="eform" />
    </form>

</body>
</html>
