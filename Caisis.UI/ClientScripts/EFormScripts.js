// set values so postback saves data and redirects user to the section just clicked on
function saveAndLoad(eformId, eformName, fileName)
{	
		isEFormApproved(eformId, false);
		
		document.getElementById('gotoNextPage').value= 'true';
		document.getElementById('nextSectionName').value = fileName; 
		document.getElementById('nextEform').value = eformName; 
		document.getElementById('nextEformId').value = eformId;
		document.dataForm.submit();
		
		return false; // this should eliminate double posts due to race conditions
}
function isEFormApproved(eformId, shouldSubmit)
{
		// if shouldSubmit equal to true hidden frame calls submitMe() after checking approval status
		document.getElementById('HiddenFrame').src = 'HiddenPage.aspx?eformId=' + eformId + '&action=isapproved&submitMe=' + shouldSubmit;	
}
// TODO: accept a control name as input and navigate to it after the dform is closed
function LoadDataEntryForm(table, id, fields, anchorname, childTable)
{
	var childTableString = (childTable == null) ? '' : ('&childTableName=' + childTable);
    var fullPath = '../DataEntryForms/DynamicForm.aspx?tablename=' + table + '&pkey=' + id + '&fields=' + fields + childTableString;
    top.showModalWithConfig(fullPath,'Edit ' + table + ' Record', { width: '98%' }, window ); 

//	document.getElementById('PopupFrame').src = '../DataEntryForms/DynamicForm.aspx?tablename=' + table + '&pkey=' + id + '&fields=' + fields;
//	document.getElementById('PopupDiv').style.zIndex = '500';
//	MM_showHideLayers('PopupDiv','','show');
	
	var anchor = document.getElementById('CurrentSectionAnchor');
	if (anchor != null)
	{
		anchor.value = anchorname;
	}
}

function ClosePopup()
{
//	document.getElementById('PopupDiv').style.zIndex = '-1';
//	MM_showHideLayers('PopupDiv','','hide');

    top.hideModal();

}

// eform enable hidden support		
function enableHiddens(list) {
	if (list != null) {
		var controls = list.split(',');
		for (i = 0; i < controls.length; i++) {
			document.getElementById(controls[i]).removeAttribute('disabled');
		}
	}
}

function disableHiddens(list) {
	if (list != null) {
		var controls = list.split(',');
		for (i = 0; i < controls.length; i++) {
			document.getElementById(controls[i]).disabled = 'disabled';
		}
	}
}

function enableHiddensOnBlur(val, list) {
	if (val != null && val.length > 0)
	{
		enableHiddens(list);
	}
	else
	{
		disableHiddens(list);
	}
}

// TODO: we have the opportunity to create js framework with function blocks/pointers
// and the various traversing mechanisms we use

function parentRowHasData(element) {
	row = element.parentElement.parentElement;
	
	for (i = 0; i < row.cells.length; i++) {
		for (k = 0; k < cell.childNodes.length; k++) {
			node = cell.childNodes[k];
			
			if (node.nodeName == 'SELECT') {
				if (node.selectedIndex > 0) {
					return true;
				}
			} else if (node.nodeName == 'INPUT') {
				type = node.getAttribute('type');
				if (type == 'checkbox' || type == 'radio') {
					if (node.checked) {
						return true;
					}
				} else if (type != 'hidden') {
					if (node.value != null && node.value != '') {
						return true;
					}
				}
			} else if (node.nodeName == 'TEXTAREA') {
				if (node.value != null && node.value != '') {
					return true;
				}
			}
		}
	}
	
	return false;
}

// when several controls are watching the same hidden(s)...
function maintainHiddens(val, element, list) {
	if (val != null && val != '') {
		enableHiddens(list);
	} else {
		if (!parentRowHasData(element)) {
			disableHiddens(list);
		}
	}
}

// refactored "inside" code from clearElementsInParentRow(...) to support elements nested in spans
function clearNode(node) {
	if (node.nodeName == 'SELECT') {
		node.selectedIndex = 0;
	} else if (node.nodeName == 'INPUT') {
		type = node.getAttribute('type');
		if (type == 'checkbox' || type == 'radio') {
			node.checked = false;
		} else if (type == 'hidden') {
			node.disabled = true;
		} else {
			node.value = '';
		}
	} else if (node.nodeName == 'TEXTAREA') {
		node.value = '';
	} else if (node.nodeName == 'LABEL') {
		// may contain one of our "fat" radio buttons
		if (node.hasChildNodes()) {
			for (k = 0; k < node.childNodes.length; k++) {
				nodek = node.childNodes[k];
				if (nodek.nodeName == 'INPUT' && nodek.getAttribute('type') == 'radio') {
					nodek.checked = false;
				}
			}
		}
	}
}

function clearElementsInParentRow(element) {
	// get the table row enclosing el	
	var row = element.parentElement.parentElement;
	if (row.tagName == 'td') row = row.parentElement;
	
	clearAllElementsContainedInNode(row);
	
/*	changed to use clearAllElementsContainedInNode - jf 2012.07.12
	for (i = 0; i < row.cells.length; i++) {
		cell = row.cells[i];
		if (cell.hasChildNodes()) {
			for (j = 0; j < cell.childNodes.length; j++) {
				node = cell.childNodes[j];
				
				if (node.nodeName == 'SPAN') {
					for (sc = 0; sc < node.childNodes.length; sc++) {
						clearNode(node.childNodes[sc]);
					}
				} else {
					clearNode(node);
				}
			}
		}
	}
*/
}

//  this function includes all children, grandchildren etc
function clearAllElementsContainedInNode(node) {
	var inputs = node.getElementsByTagName('input');
	for (var i=0;i<inputs.length;i++)
	{
		type = inputs[i].getAttribute('type');
		if (type == 'checkbox' || type == 'radio') {
			inputs[i].checked = false;
		} else if (type == 'hidden') {
			if (inputs[i].id.indexOf('Date') > -1) { inputs[i].value = ''; }
			else { inputs[i].disabled = true; }
		} else {
			inputs[i].value = '';
		}
	}
	
	var selects = node.getElementsByTagName('select');
	for (var j=0;j<selects.length;j++)
	{
		selects[j].selectedIndex = 0;
	}
	
	var textareas = node.getElementsByTagName('textarea');
	for (var k=0;k<textareas.length;k++)
	{
		textareas[k].value = '';
	}
}

//  this function includes all children, grandchildren etc
function clearAndDisableAllElementsContainedInNode(node) {
	var inputs = node.getElementsByTagName('input');
	for (var i=0;i<inputs.length;i++)
	{
		type = inputs[i].getAttribute('type');
		if (type == 'checkbox' || type == 'radio') {
			inputs[i].checked = false;
		} else if (type == 'hidden') {
			inputs[i].disabled = true;
		} else {
			inputs[i].value = '';
		}
		
		inputs[i].disabled = true;
	}
	
	var selects = node.getElementsByTagName('select');
	for (var j=0;j<selects.length;j++)
	{
		selects[j].selectedIndex = 0;
		selects[j].disabled = true;
	}
	
	var textareas = node.getElementsByTagName('textarea');
	for (var k=0;k<textareas.length;k++)
	{
		textareas[k].value = '';
		textareas[k].disabled = true;
	}
}

//  this function includes all children, grandchildren etc
function enableAllElementsContainedInNode(node) {
	var inputs = node.getElementsByTagName('input');
	for (var i=0;i<inputs.length;i++)
	{
		inputs[i].disabled = false;
	}
	
	var selects = node.getElementsByTagName('select');
	for (var j=0;j<selects.length;j++)
	{
		selects[j].disabled = false;
	}
	
	var textareas = node.getElementsByTagName('textarea');
	for (var k=0;k<textareas.length;k++)
	{
		textareas[k].disabled = false;
	}
}

var tableArray = new Array();

function showFirstAdditionalRow(linkReference, tableId) {
	var rowShown = false;
	var hideWidget = true;
	var table = document.getElementById(tableId);
	for (i = 0; i < table.rows.length; i++) {
		var row = table.rows[i];
		if (rowShown == false && row.style['display'] == 'none') {
			row.style['display'] = '';
			rowShown = true;
		} else if (rowShown == true && row.style['display'] == 'none') {
			hideWidget = false;
		}
	}
	
	if (hideWidget) {
		linkReference.style['display'] = 'none';
	}
	return false;
}

function toggleWidget(widget, docheck) {
	if (docheck) {
		widget.checked = true;
	} else {
		widget.checked = false;
	}
}

function toggleWidgetInTableCell(tableCell, docheck) {
	for (j = 0; j < tableCell.childNodes.length; j++) {
		var node = tableCell.childNodes[j];
		if (node.nodeName == 'INPUT') {
			var type = node.getAttribute('type');
			if (type == 'radio' || type == 'checkbox') {
				toggleWidget(node, docheck);
			}
		} else if (node.nodeName == 'LABEL' || node.nodeName == 'SPAN') {
			for (k = 0; k < node.childNodes.length; k++) {
				var nodek = node.childNodes[k];
		        if (nodek.nodeName == 'INPUT')
		        {
			        var typek = nodek.getAttribute('type');
			        if (typek == 'radio' || typek == 'checkbox')
			        {
				        toggleWidget(nodek, docheck);
			        }
				} else if ((nodek.nodeName == 'LABEL' || nodek.nodeName == 'SPAN') && nodek.getAttribute('style')) {
					for (l = 0; l < nodek.childNodes.length; l++) {
						var nodel = nodek.childNodes[l];
						if (nodel.nodeName == 'INPUT' && nodel.id.indexOf('Other') < 0)
						{
							var typel = nodel.getAttribute('type');
							if (typel == 'radio' || typel == 'checkbox')
							{
								toggleWidget(nodel, docheck);
							}
						}
					}
				}
			}
		}
	}
}

/***
* we are counting from the end of a row, not the beginning;
* this is to deal with possible rowspans in the front
* we could count the appropriate number of widgets in a row,
* but we don't need that level of generality
**/
function toggleAllWidgetsInColumn(tableId, columnNumber, maxNumberOfCellsInRow, docheck) {
	var range = maxNumberOfCellsInRow - 1 - columnNumber; // what if column # is 0? :)
	var tbl = document.getElementById(tableId);
	for (i = 0; i < tbl.rows.length; i++) {
		var row = tbl.rows[i];
		var offset = row.cells.length - 1 - range; // we are counting from the end
		var cell = row.cells[offset];
		if (cell != null) {

			toggleWidgetInTableCell(cell, docheck);
		}
	}
	return false;
}

function checkAllWidgetsInColumn(tableId, columnNumber, maxNumberOfCellsInRow) {
	return toggleAllWidgetsInColumn(tableId, columnNumber, maxNumberOfCellsInRow, true);
}

function uncheckAllWidgetsInColumn(tableId, columnNumber, maxNumberOfCellsInRow) {
	return toggleAllWidgetsInColumn(tableId, columnNumber, maxNumberOfCellsInRow, false);
}

function checkAnchor() {
	var anchor = document.getElementById('CurrentSectionAnchor');
	if (anchor.value != null && '' != anchor.value) {
		document.location = '#' + anchor.value;
	}
}

/*************** survey utilities ****************/

function sumSurveyItems(itemValue1, itemValue2, itemValue3) {
	var sum = 0;
	if (!isNaN(itemValue1)) {
		sum += itemValue1;
	}
	if (!isNaN(itemValue2)) {
		sum += itemValue2;
	}
	if (!isNaN(itemValue3)) {
		sum += itemValue3;
	}
	return sum;
}

function updateSumWithSelections(spanId, selectItemId1, selectItemId2, selectItemId3) {
	var valueField = document.getElementById(spanId);
	
	if (valueField != null) {
		var sum;
		var el1, el2, el3;
		var value1, value2, value3;
		
		if (selectItemId1 != null && (el1 = document.getElementById(selectItemId1)) != null) {
			value1 = parseInt(el1.value);
		}
		if (selectItemId2 != null && (el2 = document.getElementById(selectItemId2)) != null) {
			value2 = parseInt(el2.value);
		}
		if (selectItemId3 != null && (el3 = document.getElementById(selectItemId3)) != null) {
			value3 = parseInt(el3.value);
		}
		
		sum = sumSurveyItems(value1, value2, value3);
		
		if (sum > 0) {
			valueField.innerHTML = sum;
		} else { // don't send zeros back to the server
			valueField.innerHTML = '';
		}
	}
	
	// should we return false to avoid "automagic" postback crap?
}

function CheckAllWidgetsInColBasedOnCheckbox(checkbox, TableName, ColNumber, TotalNumCols)
{
	if (checkbox.checked)
	{
		checkAllWidgetsInColumn(TableName, ColNumber, TotalNumCols);
	}
	else
	{
		uncheckAllWidgetsInColumn(TableName, ColNumber, TotalNumCols);
	}
}






// dev scripts - jf --------------------------------------

function CheckAllWidgetsInColBasedOnCheckboxAndRadios(checkbox, TableName, ColNumber, TotalNumCols)
{
	if (checkbox.checked)
	{
		toggleAllWidgetsInColumnIfRadiosAreActive(TableName, ColNumber, TotalNumCols, true);
	}
	else
	{
		toggleAllWidgetsInColumn(TableName, ColNumber, TotalNumCols, false); 
		
		
		
		// no need to check if Radios are active for unchecking, so use above instead of below
//		toggleAllWidgetsInColumnIfRadiosAreActive(TableName, ColNumber, TotalNumCols, false);

	}
}

function toggleAllWidgetsInColumnIfRadiosAreActive(tableId, columnNumber, maxNumberOfCellsInRow, docheck) {
	var range = maxNumberOfCellsInRow - 1 - columnNumber; // what if column # is 0? :)
	var tbl = document.getElementById(tableId);
	for (i = 0; i < tbl.rows.length; i++) {
		var row = tbl.rows[i];
		var offset = row.cells.length - 1 - range; // we are counting from the end
		
			if (DetermineIfRadioButtonsAreChecked(row, (offset)))
			{
				
				var cellToCheck = row.cells[offset];
				if (cellToCheck != null) {
					toggleWidgetInTableCell(cellToCheck, docheck);
				}
			}
		
		
	}
	return false;
}



function DetermineIfRadioButtonsAreChecked(TableRow, LastCellIndex)
{
	var RadioIsChecked = false;
	
	for (j = 0; j < LastCellIndex; j++) 
	{
		var tableCell = TableRow.cells[j];
		
		// need to check an extra layer here because the radio buttons are surrounded by a label
		for (k = 0; k < tableCell.childNodes.length; k++)
		{
			var outerNode = tableCell.childNodes[k];
			for (l = 0; l < outerNode.childNodes.length; l++)
			{

			
				var node = outerNode.childNodes[l];
				if (node.nodeName == 'INPUT')
				{
					var type = node.getAttribute('type');
					if (type == 'radio')
					{
						
						if (node.checked && (node.value.indexOf('NotDone') < 0))
						{
							RadioIsChecked = true;
						}
						
					}
				}
				else if (node.nodeName && (node.nodeName == 'SPAN' || node.nodeName == 'LABEL'))
				{
					
					
					
					for (x = 0; x < node.childNodes.length; x++)
					{
		
					
						var innerNode = node.childNodes[x];
						if (innerNode.nodeName == 'INPUT')
						{
							var innerType = innerNode.getAttribute('type');
							if (innerType == 'radio')
							{
								
								if (innerNode.checked && (innerNode.value.indexOf('NotDone') < 0))
								{
									RadioIsChecked = true;
								}
								
							}
						}
					}
					
					
				}
			
			}
			
			
		}
		
	}
	
	return RadioIsChecked;
	
}


function CheckAttPerfBoxIfNecessary(radiobutton)
{
	if (document.getElementById(AttendingPerformedCheckboxId).checked)
	{
		tableRow = radiobutton.parentNode.parentNode.parentNode;
		
		for (i = 0; i < tableRow.cells.length; i++)
		{
			var tableCell = tableRow.cells[i];
			
				for (l = 0; l < tableCell.childNodes.length; l++)
				{
					var node = tableCell.childNodes[l];
					if (node.nodeName == 'INPUT')
					{
						var type = node.getAttribute('type');
						if (type == 'checkbox' && node.id != null && node.id.indexOf('AttendingPerformed') > -1)
						{
							if (userIsAttending)
							{						
								node.checked = true;
							}
							else
							{
								node.checked = false;
							}
						}
					} 
				
				}
	
		}
	}
}

// Returns the checked values of the given CheckBoxList ID as a comma-delimited string
function RetrieveCheckBoxListSelectedValues (radioBtnID,repeatLayoutType)
{
     var radioBtnArray = radioBtnID.getElementsByTagName('input');
     var checkedValues = '';

     for (var i = 0; i < radioBtnArray.length; i++) 
     { 
      var radioBtnRef = radioBtnArray[i];
      
      if (radioBtnRef.type == 'checkbox')
      {
          if ( radioBtnRef.checked == true ) 
          {
           var labelArray = radioBtnRef.parentNode.getElementsByTagName('label');

            if (repeatLayoutType != null)
            { 
                repeatLayoutType = repeatLayoutType.toUpperCase();
                
                if (repeatLayoutType.toLowerCase() == "flow")
                {                    
                   if ( labelArray.length > 0)
                   {
                    if (labelArray[i].innerHTML != 'Other')
                    {
                        if ( checkedValues.length > 0 )
                         checkedValues += ',';
                        checkedValues += labelArray[i].innerHTML;
                     }
                   }                    
                }
                else if (repeatLayoutType.toLowerCase() == "table")
                {
                   if ( labelArray.length > 0)
                   {
                    if (labelArray[0].innerHTML != 'Other')
                    {
                        if ( checkedValues.length > 0 )
                         checkedValues += ',';
                        checkedValues += labelArray[0].innerHTML;
                     }
                   }                
                }
            }
            else
            {             
               if ( labelArray.length > 0)
               {
                if (labelArray[i].innerHTML != 'Other')
                {
                    if ( checkedValues.length > 0 )
                     checkedValues += ',';
                    checkedValues += labelArray[i].innerHTML;
                 }
               }
            }   
          }
       }
       else if (radioBtnRef.type == 'text')
       {  
          if ( radioBtnRef.value != '' ) 
          {            
                if ( checkedValues.length > 0 )
                 checkedValues += ',';
                 
                checkedValues += radioBtnRef.value;
          }      
       }      
     }     
     return checkedValues;    
}

// Returns the checked values of the given RadioBoxList ID as a comma-delimited string
function RetrieveRadioBtnListSelectedValues (radioBtnID,repeatLayoutType)
{
     var radioBtnArray = radioBtnID.getElementsByTagName('input');
     var checkedValues = '';

     for (var i = 0; i < radioBtnArray.length; i++) 
     { 
      var radioBtnRef = radioBtnArray[i];
      
      if (radioBtnRef.type == 'radio')
      {
          if ( radioBtnRef.checked == true ) 
          {
           var labelArray = radioBtnRef.parentNode.getElementsByTagName('label');

            if (repeatLayoutType != null)
            { 
                repeatLayoutType = repeatLayoutType.toUpperCase();
                
                if (repeatLayoutType.toLowerCase() == "flow")
                {                    
                   if ( labelArray.length > 0)
                   {
                    if (labelArray[i].innerHTML != 'Other')
                    {
                        if ( checkedValues.length > 0 )
                         checkedValues += ',';
                        checkedValues += labelArray[i].innerHTML;
                     }
                   }                    
                }
                else if (repeatLayoutType.toLowerCase() == "table")
                {
                   if ( labelArray.length > 0)
                   {
                    if (labelArray[0].innerHTML != 'Other')
                    {
                        if ( checkedValues.length > 0 )
                         checkedValues += ',';
                        checkedValues += labelArray[0].innerHTML;
                     }
                   }                
                }
            }
            else
            {             
               if ( labelArray.length > 0)
               {
                if (labelArray[i].innerHTML != 'Other')
                {
                    if ( checkedValues.length > 0 )
                     checkedValues += ',';
                    checkedValues += labelArray[i].innerHTML;
                 }
               }
            }   
          }
       }
       else if (radioBtnRef.type == 'text')
       {  
          if ( radioBtnRef.value != '' ) 
          {            
                if ( checkedValues.length > 0 )
                 checkedValues += ',';
                 
                checkedValues += radioBtnRef.value;
          }      
       }      
     }     
     return checkedValues;
 }

 // Sets the selected value of a RadioButtonList to the specified value; returns true if value found and selected; value is case-sensitive
 function SetRadioBtnListSelectedValue(radioBtnID, repeatLayoutType, newValue) {

     var radioBtnArray = radioBtnID.getElementsByTagName('input');
     var valueSelected = false;

     for (var i = 0; i < radioBtnArray.length; i++) {
         var radioBtnRef = radioBtnArray[i];

         if (radioBtnRef.type == 'radio') {
             var labelArray = radioBtnRef.parentNode.getElementsByTagName('label');
             radioBtnRef.checked = false;

             if (repeatLayoutType != null) {
                 repeatLayoutType = repeatLayoutType.toUpperCase();

                 if (repeatLayoutType.toLowerCase() == "flow") {
                     if (labelArray.length > 0) {
                         if (labelArray[i].innerHTML != 'Other' && newValue == labelArray[i].innerHTML) {
                             radioBtnRef.checked = true;
                             valueSelected = true;
                         }
                     }
                 }
                 else if (repeatLayoutType.toLowerCase() == "table") {
                     if (labelArray.length > 0) {
                         if (labelArray[0].innerHTML != 'Other' && newValue == labelArray[0].innerHTML) {
                             radioBtnRef.checked = true;
                             valueSelected = true;
                         }
                     }
                 }
             }
             else {
                 if (labelArray.length > 0) {
                     if (labelArray[i].innerHTML != 'Other' && newValue == labelArray[i].innerHTML) {
                         radioBtnRef.checked = true;
                         valueSelected = true;
                     }
                 }
             }



         }
         else if (radioBtnRef.type == 'text') {
             if (radioBtnRef.value != '' && newValue == labelArray[i].innerHTML) {
                 radioBtnRef.checked = true;
                 valueSelected = true;
             }
         }
     }
     return valueSelected;
 }



// Sets the checked values (text boxes) of the given CheckBoxList ID to false (to empty string)
function ResetCheckBoxList(cbl) {
    var cblObj = cbl.getElementsByTagName('input');

    for (var j = 0; j < cblObj.length; j++) {
        var cblRefObj = cblObj[j];
        if (cblRefObj.type == 'checkbox')
            cblRefObj.checked = false;
        else if (cblRefObj.type == 'text')
            cblRefObj.value = '';
    }
    cbl.click();
}

// Sets the selected values (text boxes) of the givenRadioBtnList ID to false (to empty string)
function ResetRadioBtnList(rbl) {
    var rblObj = rbl.getElementsByTagName('input');

    for (var j = 0; j < rblObj.length; j++) {
        var rblRefObj = rblObj[j];
        if (rblRefObj.type == 'radio')
            rblRefObj.checked = false;
        else if (rblRefObj.type == 'text')
            rblRefObj.value = '';
    }
    rbl.click();
}

function TrimString(string) { 
	return string.replace(/^\s+|\s+$/g,""); }

// EForm Printing Scripts
function printNarrative() 
{ 
      window.frames['NarrativeFrame'].focus(); 
      window.frames['NarrativeFrame'].print(); 
}


function printNarrativeOnLoad() 
  { 
	document.getElementById('PrintWarningDiv').style.visibility = 'visible';
//	document.getElementById('PrintBtn').style.display = 'none';';
	document.getElementById('printingOuterContainer').style.display = 'none';
	setTimeout("printNarrative()", 2500);
	setTimeout("hidePrintWarning()", 2500);
  } 
function hidePrintWarning() 
  { 
	document.getElementById('PrintWarningDiv').style.visibility = 'hidden';
//	document.getElementById('PrintBtn').style.display = '';
	document.getElementById('printingOuterContainer').style.display = '';
  }


//show additional row of input elements
function showAdditionalRow(linkReference, tableId) {
      var rowShown = false;
      var hideWidget = true;
      var table = document.getElementById(tableId);
      for (i = 0; i < table.rows.length; i++) {
          if (i % 2 == 1) {
              var row = table.rows[i];
              if (rowShown == false && row.style['display'] == 'none') {
                  row.style['display'] = '';
                  rowShown = true;
              } else if (rowShown == true && row.style['display'] == 'none') {
                  hideWidget = false;
              }
          }
      }

      if (hideWidget) {
          linkReference.style['display'] = 'none';
      }
      return false;
  }
  
  /* STOP RECORDS i.e. (Medications, RadTx, etc...) */
    
  // makes a request to the server to stop the specified record by table and key
  // @url: the server page to POST request
  // @table: the table to update stop date
  // @key: the pri key of the stop date table
  // @cbox: the checkbox reference
  // @enableUncheck: whether or now to enable uncheck
  // @clientCallback: optional client callback
  // @evt: the event object
  function doEformCheckboxCallback(url, table, key, cbox, enableUncheck, clientCallback, evt) {
      if (enableUncheck || cbox.checked) {
          var isChecked = cbox.checked;
          // do call-back to stop record
          var callback = curry(doProcessEformCheckboxCallback, cbox, enableUncheck, clientCallback, isChecked);
          // create request parms
          var params = new Param();
          params.add("table", table);
          params.add("key", key);
          params.add("checked", isChecked.toString());
          // set date param
          var dateField = document.getElementById(cbox.id + "DateText");
          if (dateField && dateField.value != "") {
              params.add("date", dateField.value);
          }
          // make ajax callback to stop record
          AjaxManager.MakeRequest("POST", url, params, callback, true);
          // prevent further event handling upwards
          stopBubble(evt);
          // set checkbox state
          setTimeout(function() { cbox.checked = isChecked; }, 100);
      }
  }

  // callback triggered on server return of new stop date
  // @cb: the checkbox reference
  // @enableUncheck: whether or now to enable uncheck
  // @clientCallback: optional client callback
  // @isChecked: if checkbox is checked
  // @text: server text response
  // @xml: server xml response
  function doProcessEformCheckboxCallback(cb, enableUncheck, clientCallback, isChecked, text, xml) {
      if (text && text != '' && !enableUncheck) {
          // set checkbox state
          //cb.checked = isChecked;
          // set text
          var date;
          var priKey;
          var responseNode = document.createTextNode(text);
          var container = cb.parentNode;
          // remove checkbox label
          var cbLabel = $(cb.id + '_Label');
          if (cbLabel == null) {
              if (cb.nextSibling && cb.nextSibling.nodeName == 'LABEL' && cb.nextSibling.htmlFor == cb.id) {
                  cbLabel = cb.nextSibling;
              }
              else if (cb.previousSibling && cb.previousSibling.nodeName == 'LABEL' && cb.previousSibling.htmlFor == cb.id) {
                  cbLabel = cb.nextSibling;
              }
          }
          if (cbLabel) {
              cbLabel.parentNode.removeChild(cbLabel);
          }
          // replace checkbox with text
          container.replaceChild(responseNode, cb);

          // optional layer toggle
          var textLayer = $(cb.id + '_TextLayer');
          var checkLayer = $(cb.id + '_CheckLayer');
          if (textLayer) {
              textLayer.style.display = 'none';
          }
          if (checkLayer) {
              checkLayer.style.display = '';
          }

          // invoke optional client callback
          if (clientCallback) {
              clientCallback(cb, text);
          }
      }
  }
  
  
function showHideSection(targetContainer, doShow)
{
    if (doShow) { targetContainer.style.display = ''; }
    else { targetContainer.style.display = 'none'; clearAllElementsContainedInNode(targetContainer); }
}

function showHideBasedOnRadioToggle(toggleContainer, toggleTarget, ShowValue, OptionalHideValue, OptionalAdditionalFunction, OptionalAdditionalFunctionArgs)
{
    addShowHideToggleFunctions(toggleContainer, toggleTarget, ShowValue, OptionalHideValue, OptionalAdditionalFunction, OptionalAdditionalFunctionArgs);
    setInitialViewBasedOnToggleFunctions(toggleContainer, toggleTarget, ShowValue, OptionalHideValue);
}


// OptionalAdditionalFunction & OptionalAdditionalFunctionArgs are not added yet - jf - 2012.10.09
function addShowHideToggleFunctions(toggleContainer, toggleTarget, ShowValue, OptionalHideValue, OptionalAdditionalFunction, OptionalAdditionalFunctionArgs)
{
    var checkHideFunction = (OptionalHideValue != null && OptionalHideValue.toString().length > 0) ? true : false;
    var includeAditionalFunction = (OptionalAdditionalFunction != null && OptionalAdditionalFunction.toString().length > 0) ? true : false;
    var includeAditionalFunctionArgs = (OptionalAdditionalFunctionArgs != null && OptionalAdditionalFunctionArgs.toString().length > 0) ? true : false;
    
    var toggleInputs = toggleContainer.getElementsByTagName('input');

    if (toggleInputs.length > 0)
    {
        for(var i = 0; i < toggleInputs.length; i++)
        {
            if ((toggleInputs[i].getAttribute('type') == 'radio'))
            {
                  if (toggleInputs[i].value.toString().toUpperCase() == ShowValue.toString().toUpperCase())
                        { toggleInputs[i].onclick = function() {window["showHideSection"](toggleTarget,true)}; }
                  else if (checkHideFunction)  // for cases where you only want to hide if the selected value matches the OptionalHideValue
                        { if (toggleInputs[i].value.toString().toUpperCase() == OptionalHideValue.toString().toUpperCase())
                                { toggleInputs[i].onclick = function() {window["showHideSection"](toggleTarget,false)}; } }
                  else { toggleInputs[i].onclick = function() {window["showHideSection"](toggleTarget,false)}; }
            }

        }
    }
}

function setInitialViewBasedOnToggleFunctions(toggleContainer, toggleTarget, ShowValue, OptionalHideValue)
{
    var checkHideFunction = (OptionalHideValue != null && OptionalHideValue.toString().length > 0) ? true : false;
    
    var toggleInputs = toggleContainer.getElementsByTagName('input');

    if (toggleInputs.length > 0)
    {
        for(var i = 0; i < toggleInputs.length; i++)
        {
            if ((toggleInputs[i].getAttribute('type') == 'radio'))
            {
                if (toggleInputs[i].checked == true)
                {
                      if (toggleInputs[i].value.toString().toUpperCase() == ShowValue.toString().toUpperCase())
                            { showHideSection(toggleTarget,true);}
                      else if (checkHideFunction)  // for cases where you only want to hide if the selected value matches the OptionalHideValue
                            { showHideSection(toggleTarget,false); }
                      else { showHideSection(toggleTarget,false); }
                      break;
                }
            }
        }
    }
}





function showHideBasedOnCheckboxToggle(toggleContainer, toggleTarget, OptionalAdditionalFunction, OptionalAdditionalFunctionArgs)
{
    addShowHideCheckboxToggleFunctions(toggleContainer, toggleTarget, OptionalAdditionalFunction, OptionalAdditionalFunctionArgs);
    setInitialViewBasedOnCheckboxToggleFunctions(toggleContainer, toggleTarget);
}


// OptionalAdditionalFunction & OptionalAdditionalFunctionArgs are not added yet - jf - 2012.10.09
function addShowHideCheckboxToggleFunctions(toggleContainer, toggleTarget, ShowValue, OptionalHideValue, OptionalAdditionalFunction, OptionalAdditionalFunctionArgs)
{
    var includeAditionalFunction = (OptionalAdditionalFunction != null && OptionalAdditionalFunction.toString().length > 0) ? true : false;
    var includeAditionalFunctionArgs = (OptionalAdditionalFunctionArgs != null && OptionalAdditionalFunctionArgs.toString().length > 0) ? true : false;
    
    var toggleInputs = toggleContainer.getElementsByTagName('input');

    if (toggleInputs.length > 0)
    {
        for(var i = 0; i < toggleInputs.length; i++)
        {
            if ((toggleInputs[i].getAttribute('type') == 'checkbox'))
            {
                  toggleInputs[i].onclick = function() { window["showHideSection"](toggleTarget,this.checked); }
            }

        }
    }
}

function setInitialViewBasedOnCheckboxToggleFunctions(toggleContainer, toggleTarget, ShowValue, OptionalHideValue)
{
    var toggleInputs = toggleContainer.getElementsByTagName('input');

    if (toggleInputs.length > 0)
    {
        for(var i = 0; i < toggleInputs.length; i++)
        {
            if ((toggleInputs[i].getAttribute('type') == 'checkbox'))
            {
                if (toggleInputs[i].checked == true) { showHideSection(toggleTarget,true); }
                else { showHideSection(toggleTarget,false); }
                break;
            }
        }
    }
}

/* Eform Default Values (requires jQuery) */
var EformDefaultType =
    {
        Default: "Default",
        SourceValue: "SourceValue",
        SourceDefaultValue: "SourceDefaultValue"
    }

// Initalize event handlers to track and set default values, and dependencies for eform fields
//  @map: <Array> => [config, config, config,...] => config<Object>
//  { 
//      DefaultType : "Default",
//      DefaultValue : "PSA"
//      Source : { "Type": "CaisisTextBox", "Id": "ctl00_Field1" },
//      Targets : [{ "Type": "CaisisSelect", "Id": "ctl00_Field4" }, { "Type": "CaisisTextBox", "Id": "ct100_Field5" },..],
//      Siblings: [{ "Type": "CaisisSelect", "Id": "ctl00_Field2" }, { "Type": "CaisisTextBox", "Id": "ct100_Field3" },..],
//      RequireSiblings: true,
//      TriggerSiblings: true
//  }
function initEformDefaultValues(map) {
    // verify jQuery
    if (!window.jQuery)
        return;
    else
        jQuery.noConflict();
    // for each configuration, setup event handlers to cascade values
    jQuery.each(map, function (configIndex, config) {
        // type, static, dynamic, etc...
        var type = config.DefaultType;
        // optional static default value
        var defaultValue = config.DefaultValue;
        // true|false require siblings have data for cascading
        var requireSiblings = config.RequireSiblings;
        // build target
        var targetNode = _buildjQuerySet([config.Target]);
        // build siblings
        var targetSiblingNodes = _buildjQuerySet(config.TargetSiblings);
        // build sources
        var sourceNodes = _buildjQuerySet(config.Sources);
        // trigger check
        var triggerSiblings = config.TriggerSiblings;
        // !important: query siblings live via function()
        var doSiblingsHaveValue = function () { return !requireSiblings || _inputFieldsHaveValue(targetSiblingNodes); };

        // CASE(Default): for each sibling, once "activated", set static value
        if (type == EformDefaultType.Default && targetSiblingNodes.size() > 0) {
            targetSiblingNodes.each(function (index, sibling) {
                var siblingNode = jQuery(sibling);
                var nodeSet = _getNodeSet(siblingNode);
                nodeSet.each(function (nodeSetIndex, nodeSetItem) {
                    var nodeItem = jQuery(nodeSetItem);
                    var eType = _getTriggerEventType(nodeItem);
                    nodeItem.bind(eType, function (e) {
                        // activate: node has no value and target has a value
                        if (!_inputFieldHasValue(targetNode) && _inputFieldHasValue(siblingNode) && doSiblingsHaveValue()) {
                            _setInputFieldValue(targetNode, defaultValue);
                        }
                    });
                });
            });
        }
        // CASE(TargetValue|TargetDefaultValue): for each sibling, once "activated", set static value
        else if (type == EformDefaultType.SourceValue || type == EformDefaultType.SourceDefaultValue) {
            if (sourceNodes.size() > 0) {
                sourceNodes.each(function (index, sNode) {
                    var sourceNode = jQuery(sNode);
                    var nodeSet = _getNodeSet(sourceNode);
                    nodeSet.each(function (nodeSetIndex, nodeSetItem) {
                        var nodeItem = jQuery(nodeSetItem);
                        var eType = _getTriggerEventType(nodeItem);
                        nodeItem.bind(eType, function (e) {
                            var sourceValue = _getInputFieldValue(sourceNode);
                            var sourceHasValue = _inputFieldHasValue(sourceNode);
                            if (!_inputFieldHasValue(targetNode) && sourceHasValue && doSiblingsHaveValue()) {
                                // CASE(SourceValue): set value based on target's value when target "activated"
                                if (type == EformDefaultType.SourceValue) {
                                    _setInputFieldValue(targetNode, sourceValue);
                                }
                                // CASE(SourceDefaultValue): set static default value when target "activated"
                                else if (type == EformDefaultType.SourceDefaultValue) {
                                    _setInputFieldValue(targetNode, defaultValue);
                                }
                            }
                        });
                    });
                });
            }
        }
        // TODO: refactor, similar to Default case
        if (triggerSiblings) {
            targetSiblingNodes.each(function (index, sNode) {
                var sibling = jQuery(sNode);
                var nodeSet = _getNodeSet(sibling);
                nodeSet.each(function (nodeSetIndex, nodeSetItem) {
                    var nodeItem = jQuery(nodeSetItem);
                    var eType = _getTriggerEventType(nodeItem);
                    nodeItem.bind(eType, function (e) {
                        var siblingHasValue = _inputFieldHasValue(sibling);
                        if (!_inputFieldHasValue(targetNode) && siblingHasValue && doSiblingsHaveValue()) {
                            // CASE(SourceValue): set value based on target's value when sibling "activated"
                            if (type == EformDefaultType.SourceValue) {
                                var sourceNode = sourceNodes.first();
                                var sourceValue = _getInputFieldValue(sourceNode);
                                _setInputFieldValue(targetNode, sourceValue);
                            }
                            // CASE(SourceDefaultValue): set static default value when sibling "activated"
                            else if (type == EformDefaultType.SourceDefaultValue) {
                                _setInputFieldValue(targetNode, defaultValue);
                            }
                        }
                    });
                });
            });
        }
    });
}

// For the given node, return a list of input fields
// (i.e., checkboxes in checkbox list) used to attach events
function _getNodeSet(node) {
    var _node = jQuery(node);
    var controlType = _node.data('ControlType');
    var isSpecialType = controlType == 'EformRadioButtonList' || controlType == 'EformCheckBoxList';
    var sourceNodeSet = null;
    if (isSpecialType) {
        sourceNodeSet = _node.find('input[type="radio"],input[type="checkbox"]');
    }
    else {
        sourceNodeSet = _node;
    }
    return sourceNodeSet;
}

// for the gievn config, build a set of nodes
function _buildjQuerySet(configs) {
    var nodeSet = jQuery();
    jQuery.each(configs, function (index, config) {
        var id = config.Id;
        var type = config.Type;
        var node = jQuery('#' + id);
        node.data('ControlType', type);
        nodeSet = nodeSet.add(node);
    });
    return nodeSet;
}

function _inputFieldHasValue(node) {
    var _node = jQuery(node);
    if (_node.is(':checkbox') || _node.is(':radio')) {
        return _node.is(':checked');
    }
    else {
        return _getInputFieldValue(node) != '';
    }
}

function _inputFieldsHaveValue(nodeSet) {
    var hasValue = false;
    nodeSet.each(function (index, node) {
        if (_inputFieldHasValue(node)) {
            hasValue = true; // set value
            return false; // end iteration
        }
    });
    return hasValue;
}

// Sets the value of the specified node, i.e. textbox value field, checkbox list values
// @node: input field (i.e., textbox, checkbox)
function _setInputFieldValue(node, value) {
    var _node = jQuery(node);
    // SPECIAL CASE: handle list based controls
    var controlType = _node.data('ControlType');
    if (controlType == 'EformRadioButtonList' || controlType == 'EformCheckBoxList') {
        var radios = _node.find('input[type="radio"],input[type="checkbox"]');
        var labels = _node.find('label');
        radios.each(function (index, radio) {
            var _radio = jQuery(radio);
            var radioValue = '';
            if (_radio.is(':checkbox')) {
                var radioLabel = labels.eq(index);
                radioValue = jQuery.trim(radioLabel.text());
            }
            else {
                radioValue = _radio.val();
            }
            if (radioValue == value) {
                _radio.attr('checked', true);
            }
        });
    }
    else if (_node.is(':checkbox') || _node.is(':radio')) {
        var doCheck = value != '';
        if (doCheck)
            _node.attr("checked", "checked");
        else
            _node.removeAttr("checked");
    }
    else {
        _node.val(value);
    }
}

// Returns the value of the specified node, i.e. textbox value field, checkbox list values
// @node: input field (i.e., textbox, checkbox)
function _getInputFieldValue(node) {
    var _node = jQuery(node);
    var _value = '';
    // SPECIAL CASE: handle list based controls
    var controlType = _node.data('ControlType');
    if (controlType == 'EformRadioButtonList' || controlType == 'EformCheckBoxList') {
        var radios = _node.find('input[type="radio"],input[type="checkbox"]');
        var labels = _node.find('label');
        var values = new Array();
        radios.each(function (index, radio) {
            var _radio = jQuery(radio);
            if (_radio.is(':checked')) {
                var radioValue = '';
                if (_radio.is(':checkbox')) {
                    var radioLabel = labels.eq(index);
                    radioValue = jQuery.trim(radioLabel.text());
                }
                else {
                    radioValue = _radio.val();
                }
                values.push(radioValue);
            }
        });
        _value = values.join(',');
    }
    else if (_node.is(':checkbox') || _node.is(':radio')) {
        _value = _node.is(':checked');
    }
    else {
        _value = _node.val();
    }
    return _value;
}

// Returns the trigger event type (click, blur) for the specified node
// @node: input field (i.e., textbox, checkbox)
function _getTriggerEventType(node) {
    var _node = jQuery(node);
    if (_node.is(':checkbox') || _node.is(':radio')) {
        return 'click';
    }
    else {
        return 'blur';
    }
}