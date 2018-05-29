<%@ Page language="c#" CodeFile="AdminMetaTables.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" AutoEventWireup="false" Inherits="Caisis.UI.Admin.AdminMetaTables" EnableEventValidation="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 
<html>
  <head>
    
    <title>Administrator</title>
	<meta content="Microsoft Visual Studio 7.0" name="GENERATOR"/>
	<meta content="C#" name="CODE_LANGUAGE"/>
	<meta content="JavaScript" name="vs_defaultClientScript"/>
	<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
	<meta content="NOINDEX" name="ROBOTS"/>
	<meta http-equiv="PRAGMAS" content="NO-CACHE"/>
	<meta http-equiv="EXPIRES" content="0"/>
	<meta http-equiv="CACHE-CONTROL" content="NO-CACHE"/>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
        
    <script type="text/javascript">
        // Show edit lookup codes layer
        function launchLookupCodeFrame(lookupCodeValue)
        {
            var lkpPage = $('LookupCodePage');
            lkpPage.src = "AdminLookupCodes.aspx?lookupCodeValue=" + lookupCodeValue;

            var lkpLayer = $('LookupCodeLayer');
            lkpLayer.show('');
            lkpLayer.center();
        }
        // Hide lookup codes layer
	    function hideLookupWindow()
	    {
	        var lkpLayer = $('LookupCodeLayer');
	        lkpLayer.hide('none');
	    }
	    
	    // end lookup page display functions
	    
		function gettheform()
		{
		    var theform = document.dataForm;
		    if (window.navigator.appName.toLowerCase().indexOf("microsoft") > -1) 
		    {
			    theform = document.dataForm;
		    }
		    else 
		    {
			    theform = document.forms["dataForm"];
		    }
		    return theform;
		}
		
        function selectedTableChanged()
        {
            var theform = gettheform();
            var val = theform.ddlTableDefs.options[theform.ddlTableDefs.selectedIndex].text;
            if (val.toString().length > 0)
            {
		        theform.btnEditMetaTable.disabled = false;
            }
            else
            {
                theform.btnEditMetaTable.disabled = true;
            }
        }
		function newMetaTableBaseChanged()
        {
            var theform = gettheform();
            var newName = theform.ddlNewMetaTableBaseTable.value;
            var ok = true;
            var message = "";
            if (trim(newName).length < 1)
            {
                ok = false;
                message = "Please select base table.";
            }
		    if (ok)
            {
                message = "A new meta table based on '" + newName + "' will be created in next step.";
                for (i = 0; i < theform.ddlTableDefs.length; i++)
                {
                    if(theform.ddlTableDefs.options[i].value.toLowerCase() == newName.toLowerCase())
                    {
                        message = "A meta table with this name already exists."; 
                        ok = false;  
                        break;
                    }
                }
            }
            if(ok)
            {
                NewTableNameSetInfoOK(message);
            }
            else
            {
                NewTableNameSetInfoErrorMessage(message);
            } 
         }
            function NewTableNameSetInfoErrorMessage(message)
            {
                var theform = gettheform();
                lblNewTableNameInfo.innerHTML = message;
                lblNewTableNameInfo.style.color = "red";
                theform.btnCreateMetaTable.disabled = true;
            }
            function NewTableNameSetInfoOK(message)
            {
                var theform = gettheform();
                lblNewTableNameInfo.innerHTML = message;
                lblNewTableNameInfo.style.color = "black";
                theform.btnCreateMetaTable.disabled = false;
            }
            var undoTableChange = new Array();
            function EditTable(btn)
            {   
                var theTable = btn.parentElement.parentElement.parentElement;
                disableControlsInTable(theTable,-1);
                disableEditField(false)
                return false;
            }
            function EditTableCancel(btn)
            {
                enableControls();
                disableEditField(true);
                undoTableChange = new Array();
                return false;
            }
            function disableEditField(disable)
            {
                var theForm = gettheform();
                var btnSave = theForm.btnEtSave;
                var btnCancel = theForm.btnEtSaveCancel;
                var btnEdit = theForm.btnEtSaveEdit;
                var btnDeleteTable = theForm.btnEtDeleteTable;
                var ddlTableName = theForm.ddlEtTableName;
                btnSave.disabled = disable;
                btnCancel.disabled = disable;
                btnEdit.disabled = !disable;
                ddlTableName.disabled = !disable;
                btnDeleteTable.disabled = !disable;
                
                var txtEtTableDescription = theForm.txtEtTableDescription;
                var txtEtTableLabel = theForm.txtEtTableLabel;
                txtEtTableDescription.disabled = disable;
                txtEtTableLabel.disabled = disable;                
                if (disable && undoTableChange.length > 1)
                {
                    txtEtTableLabel.value = undoTableChange[0];
                    txtEtTableDescription.value = undoTableChange[1];
                }
                else
                {
                    undoTableChange[0] = txtEtTableLabel.value;
                    undoTableChange[1] = txtEtTableDescription.value;
                }
            }
            function EtChanged()
            {
                var theform = gettheform();
                var ok = true;
                var newLabel = theform.txtEtTableLabel.value;
                var message = "";
                if (newLabel.length < 1)
                {
                    ok = true;//label not needed
                    message = "";
                }
                if (ok)
                {
                    message = "The changes has not been saved."
                    disableAddButton();
                    disableColumnTable();
                    disableFieldTable();
                    disableDdlTableName();
                }
                else
                {
                    message = "Please enter a table label."
                    enableControls();
                }
                var theform = gettheform();
                
            }
            function EfChanged()
            {
                var theform = gettheform();
                var ok = true;
                var message = "";
                
                if (ok)
                {
                    message = "The changes has not been saved."
                }
                
                var theform = gettheform();
                
            }
            /*
            function SetInfoMessage(lbl,btn,message,ok)
            {
                var color = "black";
                var disabled = false;
                
                if(!ok)
                {
                    disable = true;
                    color = "red";
                }
                lbl.innerHTML = message;
                lbl.style.color = color;
                btn.disabled = disabled;
            }
            String.prototype.trim = function() {
            a = this.replace(/^\s+/, '');
            return a.replace(/\s+$/, '');
            };
            */
            function select_deselectAll (chkbx,chkVal, idVal)
            {
                //var frm = document.forms[0];
                var frm = gettheform();
                // Loop through all elements
                for (i=0; i<frm.length; i++)
                {
                    // Look for our Header Template's Checkbox
                    if (idVal.indexOf ('CheckAll') != -1 && frm.elements[i].id.indexOf ('chkSelection') > 0)
                    {
                        // Check if main checkbox is checked, then select or deselect datagrid checkboxes
                        if(chkVal == true)
                        {
                            frm.elements[i].checked = true;
                        }
                        else
                        {
                            frm.elements[i].checked = false;
                        }
                    }
                }
                countChecked(chkbx);

            }
            function countCheckedBoxes(chbx)
            {
                var table;
                var rows;
                if(chbx == null)
                {
                    table = document.getElementById('dgEtFieldsNotUsed');  
                }
                else
                {
                    table = chbx.parentElement.parentElement.parentElement;
                }
                rows = table.rows;
                
                var theCount = 0;
                for (i=1; i < rows.length; i++)
                {
                    if(rows[i].cells[0].children[0].checked)
                    {
                        theCount++;
                    }
                }
                return theCount;
               
            }
            function countChecked (chbx)
            {
                var table;
                var rows;
                var theCount = countCheckedBoxes(chbx);
                
                
                if (theCount < 1)
                {
                    btnEtAddSelectedColumnsToMetaFieldsInfo.innerHTML = 'No items selected.';
                    gettheform().btnEtAddSelectedColumnsToMetaFields.disabled = true;
                    enableControls();
                 }
                else
                {
                    btnEtAddSelectedColumnsToMetaFieldsInfo.innerHTML = theCount.toString() + ' items selected.';
                    gettheform().btnEtAddSelectedColumnsToMetaFields.disabled = false;
                    disableSaveButton();
                    disableFieldTable();
                    disableDdlTableName();
                }
                gettheform().btnEtAddSelectedColumnsToMetaFieldsCancel.disabled = gettheform().btnEtAddSelectedColumnsToMetaFields.disabled;
            }
            function AddColumns()
            {
                var frm = gettheform();
                var foundSelectedRows = false;
                // Loop through all elements
                for (i=0; i<frm.length; i++)
                {
                    if (frm.elements[i].checked == true)
                    {
                        foundSelectedRows = true;
                        break;
                    }
                }
                if(!foundSelectedRows)
                {
                    alert('Please select one or more fields.');
                    return false;   
                }
                else
                {
                    return confirm('Add ' + countCheckedBoxes() + ' selected fields?');
                }
            }
            function AddColumnsCancel()
            {
                var frm = gettheform();
                // Loop through all elements
                for (i=0; i<frm.length; i++)
                {
                    if (frm.elements[i].checked == true)
                    {
                        frm.elements[i].checked = false;
                    }
                }
               countChecked(null);
               return false;
            }
           function changeCursor(obj,cursor)
           {
                if(cursor == '1')
                {
                    obj.style.cursor = 'hand';
                }
                else
                {
                    obj.style.cursor = 'auto';
                }
           }
           function NewVirtualFieldChanged(theBox)
           {
                var theform = gettheform();
                var ok = false;
                var newField = theBox.value;
                var theRowIndex = theBox.parentElement.parentElement.rowIndex;
                
                var message = "";
                
                var color = "white";
                var disabled = true;
               
                if (newField.length < 1)
                {
                    message = "Please enter a table label.";
                }
                else if (newField.indexOf(' ') != -1)
                {
					message = "A virtual fieldname cannot contain spaces.";
					color = "red";
                }
                else
                {
                    //add check for duplicate field name
                    if(findValueInTableInput('dgEtFields',1,newField,theRowIndex))
                    {
                        if(findValueInTable('dgEtFieldsNotUsed',1,newField))
                        {
                            disabled = false;
                            color = "white";
                            message = "New field has not been saved.";
                        }
                        else
                        {
                            color = "red";
                            disabled = true;
                            message = "Field name exists as column table. Add by using listing below.";
                        }
                    }
                    else
                    {
                        color = "red";
                        disabled = true;
                        message = "Field name already exists.";
                     }
                }
                
                theBox.style.backgroundColor = color;
                var saveButton = theBox.parentElement.parentElement.children[6].children[0];
                    
                saveButton.disabled = disabled;
                
                var theDTDDL = theBox.parentElement.parentElement.children[2].children[0];
                var cbxSuppressSpan = theBox.parentElement.parentElement.children[4].children[0];
                var cbxSuppress = theBox.parentElement.parentElement.children[4].children[0].children[0];
                var ddlOrder = theBox.parentElement.parentElement.children[5].children[0];
                var btnCancel = theBox.parentElement.parentElement.children[7].children[0];
                //theDTDDL.disabled = cbxSuppress.disabled = cbxSuppressSpan.disabled = ddlOrder.disabled = btnCancel.disabled = disabled;
                
                if (theDTDDL)
                {
					theDTDDL.disabled = disabled;
				}
				
				if (cbxSuppress)
				{
					cbxSuppress.disabled = disabled;
				}
				
				if (cbxSuppressSpan)
				{
					cbxSuppressSpan.disabled = disabled;
				}
				
				if (ddlOrder)
				{
					ddlOrder.disabled = disabled;
				}
				
				if (btnCancel)
				{
					btnCancel.disabled = disabled;
				}
                
                if(saveButton.value == 'Add')
                {
                    
                    NewVirtualFieldDataTypeChanged(theDTDDL,!disabled);
                    
                    
                }
                if(btnCancel.disabled)
                {
                    enableControls();
                }
                else
                {
                    var theRow = theBox.parentElement.parentElement;
                    var theTable = theRow.parentElement;
            
                    disableControlsInTable(theTable,theRow.rowIndex);
                    disableControlsInTable(document.getElementById('dgEtFieldsNotUsed'),-1);
                    disableButtons();
                }
           }
           
           function NewVirtualFieldDataTypeChanged(theDDL, length)
           {
                var theform = gettheform();
                var ok = true;
                var saveButton = theDDL.parentElement.parentElement.children[6].children[0];
                
                var newDatatype = theDDL.value;
                if (newDatatype.length < 1 || !length)
                {
                    ok = false;
                }
                saveButton.disabled = !ok;
            }
            
           
           function findValueInTable(tableId,columnIndex,value)
            {
                var ok = true;
                if(document.getElementsByTagName)
                {  
                    var table = document.getElementById(tableId);  
                    if(table != null)
                    {
                        var rows = table.rows;  
                        for(i = 0; i < rows.length; i++)
                        {          
                            if(trim(rows[i].cells[columnIndex].innerHTML.toLowerCase()) == trim(value.toLowerCase())) 
                            {
                                ok = false;
                                break;
                            }
                        }
                     }
                }
                return ok;
            }
           function findValueInTableInput(tableId,columnIndex,value,rowIndex)
            {
                var ok = true;
                if(document.getElementsByTagName)
                {  
                    var table = document.getElementById(tableId);  
                    var rows = table.rows;
                    for(i = 1; i < rows.length; i++)
                    {          
                        try
                        {
                            if(rows[i].cells[columnIndex].children[0].value.toLowerCase() == value.toLowerCase() && rowIndex != i) 
                            {
                                ok = false;
                                break;
                            }
                        }
                        //in case atypical row, ie dynamically added
                        catch(err){}
                    }
                }
                return ok;
            }
            function underlinePreviousCell(theCell)
            {
                theCell.parentElement.children[0].style.textDecorationUnderline = true;
            }
            
            function underlinePreviousCellRemove(theCell)
            {
                theCell.parentElement.children[0].style.textDecorationUnderline = false;
            }
            var undoFieldChange = new Array();
            function EditField(theButton)
            {
                var theRow = theButton.parentElement.parentElement;
                var theTable = theRow.parentElement;
                var deleteButton = theRow.children[7].children[0];
                var saveButton = theRow.children[6].children[0];
                var rtrn = true;
                switch (theButton.value )   
                {
                    case 'Edit',' Edit ':
                        saveButton.value = 'Save';
                        
                        theTable.children[0].children[6].innerHTML = "Save";
                        theTable.children[0].children[7].innerHTML = "Cancel";
                        deleteButton.value = "Cancel";
                         
                        enableDisableFieldRow(theRow,false);
                        
                        undoFieldChange[0] = theRow.children[1].children[0].value;
                        undoFieldChange[1] = theRow.children[2].children[0].value;
                        undoFieldChange[2] = theRow.children[4].children[0].children[0].checked;
                        undoFieldChange[3] = theRow.children[5].children[0].value;
                        
                        disableControlsInTable(theTable,theRow.rowIndex);
                        disableControlsInTable(document.getElementById('dgEtFieldsNotUsed'),-1);
                        disableButtons();
                        
                        rtrn = false;
                        break;
                    
                    case 'Cancel':
                        saveButton.value = ' Edit ';
                        
                        deleteButton.value = "Delete";
                            
                        theTable.children[0].children[6].innerHTML = "Edit";
                        theTable.children[0].children[7].innerHTML = "Delete";
                        
                        enableDisableFieldRow(theRow,true);
                        
                        theRow.children[1].children[0].value = undoFieldChange[0];
                        theRow.children[2].children[0].value = undoFieldChange[1];
                        theRow.children[4].children[0].children[0].checked = undoFieldChange[2];
                        theRow.children[5].children[0].value = undoFieldChange[3];
                        //NewVirtualFieldChanged(theRow.children[1].children[0]);
                        
                        enableControls();
                        
                        rtrn = false;                
                        break;
                    case 'Delete':
                        rtrn = confirmDelete(theButton,1,0);
                        break;
                } 
                return rtrn;  
            }
            function cancelNewField(theButton)
            {   
                var theRow = theButton.parentElement.parentElement;
                theRow.children[1].children[0].value = "";
                theRow.children[2].children[0].value = "";
                theRow.children[4].children[0].children[0].checked = "";
                theRow.children[5].children[0].value = "[\"not set\"]";
                NewVirtualFieldChanged(theRow.children[1].children[0]);
                
                return false;
            }
            function enableDisableFieldRow(theRow,disabled)
            {
                if(theRow.children[3].children[0].children[0].checked)
                {
                    theRow.children[1].children[0].disabled = disabled;
                }
                theRow.children[2].children[0].disabled = disabled;
                theRow.children[4].children[0].disabled = disabled;
                theRow.children[4].children[0].children[0].disabled = disabled;
                theRow.children[4].children[0].disabled = disabled;
                theRow.children[5].children[0].disabled = disabled;
            }
            
            //disable controls on edit
            var disabledControls = new Array();
            function disableButtons()
            {
               disableSaveButton();
               disableAddButton();
               disableDdlTableName();
            }
            function disableSaveButton()
            {
                var theForm = gettheform();
                var btn = theForm.btnEtSave;
                disableControl(btn);
                btn = theForm.txtEtTableLabel;
                disableControl(btn);
                btn = theForm.txtEtTableDescription;
                disableControl(btn);
                var btn = theForm.btnEtSaveEdit;
                disableControl(btn);
                var btn = theForm.btnEtDeleteTable;
                disableControl(btn);
                
            }
            function disableAddButton()
            {
                var theForm = gettheform();
                var btn = theForm.btnEtAddSelectedColumnsToMetaFields
                disableControl(btn);
            }
            
            function disableDdlTableName()
            {
                var theForm = gettheform();
                var btn = theForm.ddlEtTableName;
                disableControl(btn);
            }
            function disableControl(ctrl)
            {
                var l = disabledControls.length;
                if (ctrl != null && !ctrl.disabled) 
                {
                    ctrl.disabled = true;
                    disabledControls[l] = ctrl.id;
                }
            }
            function disableTables()
            {
                disableFieldTable();
                disableColumnTable();
                disableDdlTableName();
            }
            function disableFieldTable()
            {
                disableControlsInTable(document.getElementById('dgEtFields'),-1);
            }   
            function disableColumnTable()
            {
                disableControlsInTable(document.getElementById('dgEtFieldsNotUsed'),-1);
            }
            function disableAllTableControlsExceptThisTable(exceptionTable)
            {
                var o = disabledControls.length + 0;
                var tables = document.getElementsByTagName('table');
                var exceptionControls = exceptionTable.getElementsByTagName('input');
                disableDdlTableName();
                for (i = 0; i < tables.length;i++)
                {
                    var currentTable = tables[i];
                    if (exceptionTable.innerHTML != currentTable.innerHTML)
                    {
                        var inputs = currentTable.getElementsByTagName("input");
                        for (j = 0;j < inputs.length;j++)
                        {
                           if(!inputs[j].disabled && inputs[j].id.indexOf('etBtnExpandAttributes') < 0)
                            {
                                var isExcepted = false
                                for(k = 0;k < exceptionControls.length;k++)
                                {
                                    if(exceptionControls[k] == inputs[j])
                                    {
                                        isExcepted = true;
                                    }
                                }
                                if (!isExcepted)
                                {
                                    disabledControls[o] = inputs[j].id;
                                    o++;
                                    inputs[j].disabled = true;
                                }
                                isExcepted = false;
                            } 
                        }
                    }
                }
            }
            function disableControlsInTable(table,exceptionRowIndex)
            {
                if(table != null)
                {
                    var k = disabledControls.length + 0;
                    //include subtables
                    var rows = table.getElementsByTagName("tr");  
                    for(i = 0; i < rows.length; i++)
                    {          
                        var theRow = rows[i];
                        if(exceptionRowIndex != theRow.rowIndex || table.id != theRow.parentElement.id) 
                        {
                            var inputs = theRow.getElementsByTagName("input");
                                for(j = 0; j < inputs.length; j++)
                                {
                                    if(!inputs[j].disabled && inputs[j].id.indexOf('etBtnExpandAttributes') < 0)
                                    {
                                        disabledControls[k] = inputs[j].id;
                                        k++;
                                        inputs[j].disabled = true;
                                    }
                                }
                            
                        }
                    }
                }
            }
            function enableControls()
            {
                for(l = 0;l < disabledControls.length;l++)
                    {
                        try
                        {
                            document.getElementById(disabledControls[l]).disabled = false;
                        }
                        catch(err)
                        {}
                    }
                    disabledControls = new Array();
            }
            function ExpandAttributesAll(iBtn)
            {
                var theRow = iBtn.parentElement.parentElement;
                var theTable = theRow.parentElement;
                var iBtn = theRow.cells[0].children[0];
                var forceExpand = (iBtn.src.indexOf("Icon_Minus.gif") < 0);
                var forceClose = false;
                if(forceExpand)
                {
                    iBtn.src = "../Images/Icon_Minus.gif";
                
                }
                else
                {
                    iBtn.src = "../Images/Icon_Plus.gif";
                    forceClose = true;
                }
                
                var aButton;
                for(i=1;i<theTable.rows.length;i++)
                {
                    aButton = theTable.rows[i].cells[0].children[0];
                    if (aButton != null)
                    {
                        ExpandAttributes(aButton,false,forceExpand,forceClose);
                    }
                }
                return false;
                
            }
            function ExpandAttributes(iBtn,ignoreTracker,forceExpand,forceClose)
            {
                theForm = gettheform();
                var theRow = iBtn.parentElement.parentElement;
                var theRowIndex = theRow.rowIndex;
                var newRowIndex = theRowIndex + 1;
                var theTable = theRow.parentElement;
                var tracker = theForm.txtToKeepTrackOfExpandedAttributeRows;
                var fieldId;
                if(theRow.children[8].innerHTML != "" && !forceClose)
                {
                    var newRow = theTable.insertRow(newRowIndex);
                    var newCell = newRow.insertCell(0);
                    var newCell = newRow.insertCell(1);
                    newCell.colSpan = 7;
                    newCell.innerHTML = theRow.children[8].innerHTML;
                    theRow.children[8].innerHTML = "";
                    iBtn.src = "../Images/Icon_Minus.gif";
                    
                    if (!ignoreTracker)
                    {
                        fieldId = theTable.children[newRowIndex].children[1].children[0].rows[theTable.children[newRowIndex].children[1].children[0].rows.length-1].cells[0].children[0].value;
                        tracker.value = tracker.value + ';' + fieldId + ';';
                    }
                }else if(!forceExpand && theRow.children[8].innerHTML == "")
                {   
                    fieldId = theTable.children[newRowIndex].children[1].children[0].rows[theTable.children[newRowIndex].children[1].children[0].rows.length-1].cells[0].children[0].value;
                    tracker.value = tracker.value.replace(';' + fieldId + ';','');
                    theRow.children[8].innerHTML = theTable.children[newRowIndex].children[1].innerHTML;
                    theTable.deleteRow(newRowIndex);
                    iBtn.src = "../Images/Icon_Plus.gif";
                }
                return false;
            }
            function expandAttributesOnReload()
            {
                 theForm = gettheform();
                    try
                    {  
                        var trackedIds = theForm.txtToKeepTrackOfExpandedAttributeRows.value;
                    }
                    catch(err)
                    {return false;}
                    var table = document.getElementById('dgEtFields')
                    if (table != null){
                        for (i = 1;i<table.rows.length;i++)
                        {
                            var row = table.rows[i];
                            try
                            {
                                var id = row.cells[8].children[0].title;
                                if (id.length > 0 && trackedIds.indexOf(';' + id + ';') > -1)
                                {
                                    //find button
                                    ExpandAttributes(row.cells[0].children[0],true);
                                }
                            }
                            catch(err){}
                        }
                    }
               
                
            }
            function NewAttributeNameChanged(ctrl)
            {
                var theForm = gettheform();
                var disable = true;
                var newName = ctrl.value;
                var txtVisible = false;
                var txtValueCtrl = ctrl.parentElement.parentElement.cells[2].children[1];
                var ddlValueCtrl = ctrl.parentElement.parentElement.cells[2].children[0];
                var valueOptions = new Array();
                clearDdlOptions(ddlValueCtrl);
                if(newName.length > 0)
                {
                    disable = false;
                    switch(newName)
                    {
                        <%= strAttributeSwitchOptionsForJS %>                
                        default:
                            txtVisible = true;
                        break;
                    }
                }
                else
                {
                    txtVisible = true;
                    disable = true;
                 }
                
                if(txtVisible)
                {
                    txtValueCtrl.style.display = 'inline';
                    ddlValueCtrl.style.display = 'none';
                }
                else
                {
                    txtValueCtrl.style.display = 'none';
                    ddlValueCtrl.style.display = 'inline';
                    for (var i=0; i < valueOptions.length;++i)
                    {
                        addOption(ddlValueCtrl, valueOptions[i], valueOptions[i]);
                    }
                    ddlValueCtrl.selectedIndex = 0;
                }
                
                txtValueCtrl.disabled = disable;
                ddlValueCtrl.disabled = disable;
                
                txtValueCtrl.value = '';
                
            }
            function addOption(selectbox,text,value )
            {
                var optn = document.createElement("OPTION");
                optn.text = text;
                optn.value = value;
                selectbox.options.add(optn);
            }
            
            function clearDdlOptions(selectbox)
            {
                for (var i = (selectbox.options.length-1); i >= 0; i--)
                 {
                    selectbox.options[i]=null;
                }
            }
            function copyDdlOptions(fromSelectbox,toSelectbox)
            {
                for (var i = (fromSelectbox.options.length-1); i >= 0; i--)
                 {
                    var optn = fromSelectbox.options[i];
                    addOption(toSelectbox,optn.text,optn.value);
                }
            }
            function cancelNewAttribute(ctrl)
            {
                var index = ctrl.id.replace('attNewAttributeCancel_','');
                var theRow = ctrl.parentElement.parentElement;
                
                var templateTable = document.getElementById("dgEtFieldsAttributesNewAttributes");
                
                templateTable.rows[index].cells[0].innerHTML = theRow.cells[1].innerHTML;
                clearDdlOptions(templateTable.rows[index].cells[0].children[0]);
                templateTable.rows[index].cells[1].innerHTML = theRow.cells[2].innerHTML;
                clearDdlOptions(templateTable.rows[index].cells[1].children[0]);
                templateTable.rows[index].cells[1].children[1].value = '';
                templateTable.rows[index].cells[2].innerHTML = theRow.cells[3].innerHTML;
                
                theTable = theRow.parentElement;
                theTable.deleteRow(theRow.rowIndex);
                newAttributeCount--;
                return false;
            }
            function prepareToSaveNewAttributes(btn)
            {
                theTable = btn.parentElement.parentElement.parentElement.parentElement;
                var rowCount = theTable.rows.length;
                    
                for(j=0;j<newAttributeCount;j++)
                {   
                    newAttributeRow = theTable.rows[rowCount - (2 + j)];
                    var attributeId = newAttributeRow.cells[1].children[0].value;
                    var attributeValue = '';
                    var fieldId = newAttributeRow.cells[0].children[0].value;
                    if (newAttributeRow.cells[2].children[0].style.display == 'inline')
                    {
                        attributeValue = newAttributeRow.cells[2].children[0].value;
                    }
                    else
                    {
                        attributeValue = newAttributeRow.cells[2].children[1].value;
                    }
                    var theform = gettheform();
                    var txtList = document.getElementById("attTxtNewAttributesList");
                    txtList.value = txtList.value + fieldId + ';' + attributeId  + ';' + attributeValue + '@';
                }
            }
            
            
            var undoEditAttributes = new Array();
            function EditAttributes(btn)
            {
                disableEditAttributesButtons(btn,false);
                theTable = btn.parentElement.parentElement.parentElement;
                var rows = theTable.rows;
                var theDDL;
                for(i = 1; i < rows.length - 1; i++)
                {
                    theDDL = rows[i].cells[2].children[0];
                    undoEditAttributes[i] = theDDL.value;
                    theDDL.disabled = false;
                }
                disableAllTableControlsExceptThisTable(theTable);
                return false;
            }
            var newAttributeCount = 0;
            function EditAttributesCancel(btn)
            {
                theTable = btn.parentElement.parentElement.parentElement.parentElement;
                for(j=1;j<=newAttributeCount;j++)
                {   
                    var rowCount = theTable.rows.length;
                    removeThisRow = theTable.rows[rowCount- 2];
                    cancelNewAttribute(removeThisRow.cells[3].children[0]);
                    newAttributeCount++;
                }
                
                newAttributeCount = 0;
                disableEditAttributesButtons(btn,true);
                var rows = theTable.rows;
                var theDDL;
                for(i = 1; i < rows.length - 1; i++)
                {
                    theDDL = rows[i].cells[2].children[0];
                    theDDL.value = undoEditAttributes[i];
                    theDDL.disabled = true;
                }
                enableControls();
                return false;
            }
            function disableEditAttributesButtons(btn,disable )
            {
                theRow = btn.parentElement.parentElement;
                theRow.cells[1].children[0].disabled = disable ;
                theRow.cells[2].children[0].disabled = disable ;
                theRow.cells[2].children[1].disabled = disable ;
                theRow.cells[3].children[0].disabled = !disable ;
                
                theTable = btn.parentElement.parentElement.parentElement;
                var rows = theTable.rows;
                var deleteBtn;
                for(i = 1; i < rows.length - 1; i++)
                {
                    deleteBtn = rows[i].cells[3].children[0];
                    deleteBtn.disabled = !disable ;
                }
            }
            function AddNewAttribute(btn)
            {
                theRow = btn.parentElement.parentElement;
                theTable = theRow.parentElement;
                
                var templateTable = document.getElementById("dgEtFieldsAttributesNewAttributes");
                var found = true;
                if (theRow.cells[1].children[1].options.length > 0 && theRow.cells[1].children[1].options.length > newAttributeCount)
                {
                    found = false;
                    for (i = 0; 1< templateTable.rows.length - 1;i++)
                    {
                        var templateRow = templateTable.rows[i];
                        if(templateRow.cells[0].innerHTML.length > 0)
                        {
                            var newRowIndex = theRow.rowIndex;
                            var newRow = theTable.insertRow(newRowIndex);
                            var newCell1 = newRow.insertCell(0);
                            var newCell2 = newRow.insertCell(1);
                            var newCell3 = newRow.insertCell(2);
                            var newCell4 = newRow.insertCell(3);
                            newCell1.innerHTML = theRow.cells[0].innerHTML;
                            newCell1.className = "hidden";
                            
                            newCell2.innerHTML = templateRow.cells[0].innerHTML;
                            newCell3.innerHTML = templateRow.cells[1].innerHTML;
                            newCell4.innerHTML = templateRow.cells[2].innerHTML;
                            
                            templateRow.cells[0].innerHTML = "";
                            templateRow.cells[1].innerHTML = "";
                            templateRow.cells[2].innerHTML = "";
                            
                            newCell2.children[0].disabled = false;
                            newCell4.children[0].disabled = false;
                            
                            newCell3.children[1].value = "";
                            
                            clearDdlOptions(newCell2.children[0]);
                            addOption(newCell2.children[0],'','');
                            copyDdlOptions(theRow.cells[1].children[1],newCell2.children[0]);
                            newCell2.children[0].selectedIndex = 0;
                            
                            newCell3.children[0].style.display = 'none';
                            newCell3.children[1].style.display = 'inline';
                            
                            
                            newAttributeCount++;
                            found = true;
                            break;
                        }
                    }
                 }
                 else
                 {
                    alert('All attributes used.');
                 }
                /*
                if(templateTable.rows.length > 0)
                {
                    var newRowIndex = theRow.rowIndex;
                    var newRow = theTable.insertRow(newRowIndex);
                    var newCell1 = newRow.insertCell(0);
                    var newCell2 = newRow.insertCell(1);
                    var newCell3 = newRow.insertCell(2);
                    var newCell4 = newRow.insertCell(3);
                    newCell1.innerHTML = theRow.cells[0].innerHTML;
                    newCell1.className = "hidden";
                    
                    var templateRow = templateTable.rows[0];
                    
                    newCell2.innerHTML = templateRow.cells[0];
                    newCell2.children[0].disabled = false;
                
                    newCell3.innerHTML = templateRow.cells[1].innerHTML;
                    newCell3.children[0].disabled = false;
                    newCell3.children[1].disabled = false;
                    newCell4.innerHTML = templateRow.cells[1].innerHTML;
                    newCell4.children[0].disabled = false;
                }
                else
                {
                    alert('Please save unsaved attributes first!');
                    return false;
                }*/
                if(!found)
                {
                    alert('Please save unsaved attributes first!');
                    return false;
                }
                return false;
            }
            // Removes leading whitespaces
            function LTrim( value ) {
            	
	            var re = /\s*((\S+\s*)*)/;
	            return value.replace(re, "$1");
            	
            }

            // Removes ending whitespaces
            function RTrim( value ) {
            	
	            var re = /((\s*\S+)*)\s*/;
	            return value.replace(re, "$1");
            	
            }

            // Removes leading and ending whitespaces
            function trim( value ) {
            	
	            return LTrim(RTrim(value));
            	
            }
            var undoEditAnAttribute = "";
            function editAnAttribute(btn)
            {
                var frm = gettheform();
                var disable = false;
                if (btn.value == 'Edit')
                {
                    disable = false;
                    undoEditAnAttribute = frm.txtEditAnAttributeName.value;
                }
                else
                {
                    disable = true;
                    frm.txtEditAnAttributeName.value = undoEditAnAttribute;
                }
                frm.btnSaveAnAttribute.disabled = disable;
                frm.btnEditAnAttributeCancel.disabled = disable;
                frm.btnEditAnAttributeEdit.disabled = !disable;
                frm.txtEditAnAttributeName.disabled = disable;
            }
            function txtNewOptionChanged(ctrl)
            {
                var btn = ctrl.parentElement.nextSibling.nextSibling.firstChild;
                var tableId = ctrl.parentElement.parentElement.parentElement.parentElement.id;
                var ok = findValueInTable(tableId,0,ctrl.value);
                if (ctrl.value.length < 1 || !ok)
                {
                    btn.disabled = true;
                }
                else
                {
                    btn.disabled = false;
                }
            }
            function confirmDelete(ctrl,column,child)
            {
                var row = ctrl.parentElement.parentElement;
                var cell = row.cells[column];
                var label = '';
                if (child < 0)
                {
                    label = cell.innerHTML;
                }
                else
                {
                    label = cell.children[child].value;
                }
                return confirm("Do you want to delete '" + label + "'?");
            }
            function lblEtSelectedTableChangedQuestion(ctrl)
            {
             return "Do you want to navigate to " + ctrl.options[ctrl.selectedIndex].text;
            }
            function lblEtSelectedTableChanged(ctrl)
            {
                var oldVal = document.getElementById('lblEtTableName').innerHTML;
                //var rtrn = confirm("Do you want to navigate to " + ctrl.options[ctrl.selectedIndex].text);
                //if (!rtrn)
                //{
                    for (var i = 0;i < ctrl.length;i++)
                    {
                        if (ctrl[i].text.indexOf(oldVal) == 0)
                        {
                            ctrl[i].selected = true;
                        }
                    }
                //}
                //return rtrn;
            }
            
            // Admin feature is currenly not supported in non-IE browsers.
            // Alert user that browser not supported, in non-supported browsers.
            var nonIEUserMessage = 'Note: MetaData management for Caisis currently requires Microsoft Internet Explorer.';
            function handleNonIE()
            {
                var isIE = document.all && window.attachEvent;
                if(!isIE) { alert(nonIEUserMessage); }
            }
    </script>
    
    <style>
        .DGHeader, .DGHeader td {
	        background-color: #00668d;
	        font-family: Verdana, Arial, Helvetica, sans-serif;
	        color: #FFFFFF;
	        text-align: center;
	        height:25px;}
        .DGHeaderSmall, .DGHeaderSmall td {
	        background-color: silver;
	        font-family: Verdana, Arial, Helvetica, sans-serif;
	        color: #FFFFFF;
	        text-align: center;
	        font-size:10px;
	        height:15px;}
	    #dgEtFields tr td {height:25px;}
	    .dgEtFieldsAttributes tr td {height:15px;}
	    .Hidden {display:none}
	    hr {color:#8d2a3c;height:1px;width:100%;}
    </style>
</head>
    <body  onload="expandAttributesOnReload(); handleNonIE();"  style="background-color: #ffffff;">
    <form id="dataForm" method="post" runat="server">
		<asp:Panel ID="pnlStart" Runat="server">
		    <table width="90%">
			    <tr>
				    <td><span class=adminSectionNavOn>Select meta table to edit</span></td>
			    </tr>
			    <tr>
				    <td>
					    <asp:DropDownList id="ddlTableDefs" autopostback="False" onChange="javascript:selectedTableChanged();"  Runat="server" Width=350px></asp:DropDownList>&nbsp;[Table name (Table label)]
				        <br/><asp:Button id="btnEditMetaTable" OnClick="btnEditMetaTable_onClick"  Runat="server" Text="Edit meta table"></asp:Button>
				        <br/><br/><hr/>
				    </td>
			    </tr>
			    <tr>
				    <td><br/><span class=adminSectionNavOn>Create new meta table</span></td>
			    </tr>
			    <tr>
				    <td>
					        <label for="ddlNewMetaTableBaseTable">Based on database tables (BASE TABLES):</label><br/><asp:DropDownList AutoPostBack="False" ID="ddlNewMetaTableBaseTable" Runat="server" DataTextField="TABLE_NAME" DataValueField="TABLE_NAME" With=350px onKeyUp="javascript:newMetaTableBaseChanged()" onChange="javascript:newMetaTableBaseChanged()"></asp:DropDownList>&nbsp;
					        <br/><asp:Button name=btnCreateMetaTable id="btnCreateMetaTable" OnClick="btnCreateMetaTable_onClick"  Runat="server" Text="Create meta table"></asp:Button>
				            <br/><asp:Label name=lblNewTableNameInfo ID="lblNewTableNameInfo" Runat="server"></asp:Label>
				    <br/><br/><hr/></td>
			    </tr>
			    <tr>
				    <td><br/><span class=adminSectionNavOn>Edit field attributes</span></td>
			    </tr>
			    <tr>
				    <td>
					        <asp:DropDownList AutoPostBack="False" ID="ddlEditAnAttribute" Runat="server" Width=350px ></asp:DropDownList>
					        <br/><asp:Button id="btnEditAFieldAttribute" OnClick="btnEditAnAttribute_onClick" Runat="server" Text="Edit attribute" Enabled="True"></asp:Button>
				    <br/><br/><hr/></td>
			    </tr>
			    <tr>
				    <td><br/><span class=adminSectionNavOn>Create new attribute</span></td>
			    </tr>
			    <tr>
				    <td>
					        New attribute:<br/><asp:TextBox Runat="server" ID=txtNewAttributeName></asp:TextBox>
					        <br/><asp:Button id="btnAddAnAttribute"  OnClick="btnAddAnAttribute_onClick" Runat="server" Text="Create new attribute"  Enabled=True></asp:Button>
				    </td>
			    </tr>
		    </table>
		</asp:Panel>
		<asp:Panel ID=pnlEditTable Runat="server">
		    <table width="90%">
			    <tr>
				    <td colspan=2><span class=adminSectionNavOn>Edit meta table</span class=adminSectionNavOn></td>
			    </tr>
			    <tr>
				    <td>Table name:</td>
				    <td><asp:Label ID="lblEtTableName" Runat="server" CssClass="hidden"></asp:Label><asp:DropDownList id="ddlEtTableName" autopostback="True" xxonChange="javascript: return lblEtSelectedTableChanged(this);" OnSelectedIndexChanged="btnEditMetaTable_onClick" Runat="server" Width=400px></asp:DropDownList>
				    </td>
			    </tr>
			    <tr>
				    <td colspan=2>Table id:&nbsp;<asp:Label ID=lblEtTableId Runat="server"></asp:Label>
				    </td>
			    </tr>
			    <tr>
				    <td>Table label:
				    </td>
				    <td>
				        <asp:TextBox ID="txtEtTableLabel"  Width=400px onKeyUp="javascript:EtChanged()" onChange="javascript:EtChanged()" Runat="server" Enabled=false></asp:TextBox>
				    </td>
			    </tr>
			    <tr>
				    <td valign="top">Table Description:
				    </td>
				    <td>
				        <asp:TextBox Rows=4 TextMode=MultiLine ID="txtEtTableDescription"  Width=400px onKeyUp="javascript:EtChanged()" onChange="javascript:EtChanged()" Enabled=false Runat="server"></asp:TextBox>
				    </td>
			    </tr>
			    <tr>
				    <td colspan=2>
				        <asp:Button name=btnEtSave id="btnEtSave" OnClick="btnEtSave_onClick" Text="Save changes" Enabled=False Runat="server"></asp:Button>
				        &nbsp;<asp:Button name=btnEtSaveCancel id="btnEtSaveCancel" Text="Cancel" Enabled=False Runat="server"></asp:Button>
				        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button name=btnEtSaveEdit id="btnEtSaveEdit" Runat="server" Text="Edit" Enabled=True ></asp:Button>
				        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button name=btnEtDeleteTable id="btnEtDeleteTable" OnClick="btnEtDeleteTable_onClick" Runat="server" Text="Delete this meta table" Enabled=True OnClientClick="return confirm('Delete this meta table, its meta fields and saved virtual data?');" ></asp:Button>
				    <br/><br/>
				    <hr/>
				    </td>
			    </tr>
			    <tr>
				    <td colspan=2><br/><span class=adminSectionNavOn>Fields for this meta table</span>&nbsp;(click on plus sign to view attributes)
				    <br/><asp:Label ID="lblEtFields" Runat="server">None</asp:Label>
				    <asp:datagrid id="dgEtFields" Runat="server"  Width="550" EnableViewState="True"   DataMember="ParentTable"
				                CellPadding="1" CellSpacing="0"
                                AllowSorting="False" AllowPaging="False" 
                                AutoGenerateColumns="False" 
                                OnItemDataBound="dgEtFields_ItemDataBound"
                                OnItemCommand="dgEtFields_ItemCommand"
                                ShowFooter=True>
                                <HEADERSTYLE CssClass="DGHeader"/>
                                <ALTERNATINGITEMSTYLE BackColor="#EEEEEE"/>
                                <Columns>
                                    <asp:TemplateColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
						                <HeaderStyle Width="15px" ></HeaderStyle>
						                <HeaderTemplate>
						                    <asp:ImageButton id="etBtnExpandAttributesAll" runat="server" Width="9px" Height="9px" ImageUrl="../Images/Icon_Plus.gif"
								                CommandName="Expand"></asp:ImageButton>
                                        </HeaderTemplate>
						                <ItemTemplate>
							                <asp:ImageButton id="etBtnExpandAttributes" runat="server" Width="9px" Height="9px" ImageUrl="../Images/Icon_Plus.gif"
								                CommandName="Expand"></asp:ImageButton>
						                </ItemTemplate>
					                </asp:TemplateColumn>
					                <asp:BoundColumn DataField="FieldId" HeaderText="Field ID" Visible=False>
						                <ItemStyle HorizontalAlign="Left"></ItemStyle>
					                </asp:BoundColumn>
                					<asp:TemplateColumn HeaderText="FieldName">
                                        <ItemTemplate>
                                            <asp:TextBox id="efTxtFieldName" runat="server" Title='<%# ((System.Data.DataRowView)Container.DataItem)["FieldName"]  %>'  Text='<%# ((System.Data.DataRowView)Container.DataItem)["FieldName"]  %>' Enabled="False" OnChange="javascript: NewVirtualFieldChanged(this);"  OnKeyUp="javascript: NewVirtualFieldChanged(this);">
                                            </asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate >
                                                <asp:TextBox Runat="server" onKeyUp="javascript:NewVirtualFieldChanged(this)" onChange="javascript:NewVirtualFieldChanged(this)"  ID="efTxtNewVirtualField"></asp:TextBox>        
                                        </FooterTemplate> 
                                    </asp:TemplateColumn>
                					
					                <asp:TemplateColumn HeaderText="DataType">
                                        <ItemTemplate>
                                            <asp:DropDownList Runat="server" ID="efDdlFieldDataType" Enabled=False >
										    </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList Runat="server" ID="efDdlNewVirtualFieldDataType" OnChange="javascript: NewVirtualFieldDataTypeChanged(this,true);">
											 </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateColumn>
					                
					                <asp:TemplateColumn HeaderText="IsVirtual">
                                        <ItemTemplate>
                                            <asp:CheckBox id=efCbxFieldIsVirtual runat="server" Checked='<%# ((System.Data.DataRowView)Container.DataItem)["FieldIsVirtual"]  %>' Enabled="False">
                                            </asp:CheckBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:CheckBox id="efCbxNewFieldIsVirtual" runat="server" Checked='True'>
                                            </asp:CheckBox>
                                        </FooterTemplate>
                                    </asp:TemplateColumn>
                					<asp:TemplateColumn HeaderText="Suppress">
                                        <ItemTemplate><span>
                                            <asp:CheckBox id="efCbxFieldSuppress" runat="server" Checked='<%# ((System.Data.DataRowView)Container.DataItem)["FieldSuppress"]  %>' Enabled="True">
                                            </asp:CheckBox></span>
                                        </ItemTemplate>
                                        
                                        <FooterTemplate>
                                            <asp:CheckBox id="efCbxNewFieldSuppress" runat="server" Checked='False'>
                                            </asp:CheckBox>
                                        </FooterTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Order">
                                        <ItemTemplate>
                                            <asp:DropDownList Runat="server" ID="efDdlFieldOrder" enabled=False>
											</asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList Runat="server" ID="efDdlNewFieldOrder"></asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Edit">
						                <ItemTemplate>
							                <asp:Button CommandName="Edit" Text=" Edit " ID="btnEditField" Runat="server" />
						                </ItemTemplate>
						                <FooterTemplate>
						                    <asp:Button CommandName="AddNewField" Text="Add" ID="efBtnAddNewField" Runat="server"/>
						                </FooterTemplate>
						            </asp:TemplateColumn>
					                <asp:TemplateColumn HeaderText="Delete">
						                <ItemTemplate>
							                <asp:Button CommandName="Delete" Text="Delete" ID="btnEfDeleteAttribute" Runat="server" OnClientClick="return EditField(this);"/>
						                </ItemTemplate>
						                <FooterTemplate>
						                    <asp:Button CommandName="AddNewFieldCancel" Text="Cancel" ID="efBtnAddNewFieldCancel" Runat="server"></asp:Button>
						                </FooterTemplate>
						            </asp:TemplateColumn>
						            
						            <asp:TemplateColumn ItemStyle-CssClass=Hidden FooterStyle-CssClass="Hidden" HeaderStyle-CssClass="Hidden">
						                <ItemTemplate>
							                <asp:Placeholder ID="Expanded" Runat="server" Visible=True>
								                
										                <asp:DataGrid Runat="server" id=dgEtFieldsAttributes 
										                ShowFooter=True
										                CellPadding="2" BackColor="#f1f1f1" Font-Name="Verdana" Font-Size="8pt" AutoGenerateColumns=false ItemStyle-VerticalAlign="Middle" 
										                EnableViewState=true Width=500px cssClass="dgEtFieldsAttributes"
                                                        OnItemDataBound="dgEtFieldsAttributes_ItemDataBound"
                                                        OnItemCommand="dgEtFieldsAttributes_ItemCommand">
										                <HEADERSTYLE CssClass="DGHeaderSmall"/>
										                <FooterStyle HorizontalAlign="Right"></FooterStyle>
                                                                        
                                                        <ALTERNATINGITEMSTYLE BackColor="#EEEEEE"/>
											                <Columns>
											                    <asp:BoundColumn DataField="FieldAttributeId" HeaderText="FieldAttributeId" Visible="False">
													                <ItemStyle HorizontalAlign="Left"></ItemStyle>
												                </asp:BoundColumn>
												                <asp:BoundColumn DataField="AttributeId" HeaderText="AttributeId" Visible="False">
													                <ItemStyle HorizontalAlign="Left"></ItemStyle>
												                </asp:BoundColumn>
												                <asp:TemplateColumn HeaderText="FieldId" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
						                                            <ItemTemplate>
						                                                <asp:Literal Runat="server" ID="attTxtFieldIdItem" Text='<%# ((System.Data.DataRowView)Container.DataItem)["FieldId"]  %>'  ></asp:Literal>
						                                            </ItemTemplate>
						                                            <FooterTemplate>
						                                                    <asp:TextBox  ID="attTxtFieldIdFooter" NAME="attFieldIdFooter" Runat="server" enabled=False/>
                                                                    </FooterTemplate>
					                                            </asp:TemplateColumn>
					                                            <asp:TemplateColumn HeaderText="Attribute" >
						                                            <ItemTemplate>
						                                                <asp:Literal Runat="server" ID="attLitAttributeName"  ></asp:Literal>
						                                            </ItemTemplate>
						                                            <FooterTemplate>
						                                                    <asp:Button Text="Add new attribute" ID="attBtnAddAttribute" NAME="attBtnAddAttribute" Runat="server" enabled=False/>
                                                                            <asp:DropDownList ID="attDdlAddAttributeUnusedAttributes" Runat="server"  CssClass="hidden"></asp:DropDownList>
                                                                    </FooterTemplate>
					                                            </asp:TemplateColumn>
					                                            
					                                            <asp:TemplateColumn HeaderText="Value" >
                                                                    <ItemTemplate>
                                                                        <asp:DropDownList Runat="server" ID="attDdlAttributeValue" Enabled=False>
										                                </asp:DropDownList>
                                                                        <asp:TextBox Runat="server" ID="attTxtAttributeValue" Enabled=False Visible=False Text='<%# ((System.Data.DataRowView)Container.DataItem)["AttributeValue"]  %>'  >
										                                </asp:TextBox>
                                                                        <asp:TextBox Runat="server" ID="attTxtAttributeValueCtrlUsed" Enabled=False Visible=True CssClass="Hidden" >
										                                </asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                            <asp:Button Text="Save" CommandName="SaveAttributes" ID="attBtnEditAttributeSave" NAME="attBtnEditAttributeSave" Runat="server" enabled=False/>
                                                                            <asp:Button Text="Cancel" ID="attBtnEditAttributeCancel" NAME="attBtnEditAttributeCancel" Runat="server" enabled=False/>
                                                                    </FooterTemplate>
                                                                </asp:TemplateColumn>
					                                            
					                                            <asp:TemplateColumn HeaderText="Delete" ItemStyle-HorizontalAlign="Right" >
						                                            <ItemTemplate>
							                                            <asp:Button CommandName="Delete" Text="Delete" ID="EtFieldAttributeBtnDelete" Runat="server"  OnClientClick="return confirmDelete(this,1,-1);" />
						                                            </ItemTemplate>
						                                            <FooterTemplate>
                                                                        <asp:Button Text="Edit" ID="attBtnEditAttribute" NAME="attBtnEditAttribute"  Runat="server" enabled=True/>
						                                            </FooterTemplate>
						                                        </asp:TemplateColumn>
						                                        
											                </Columns>
										                </asp:DataGrid><br/>
										        </asp:Placeholder>
						                </ItemTemplate>
					                </asp:TemplateColumn>
					            </Columns>
					</asp:datagrid>
					<br/>
				    <Table ID="dgEtFieldsAttributesNewAttributes" Runat="server"  Class="hidden">
				        <TR>
				           <TD><asp:DropDownList Runat="server" ID=attDdlNewAttributeName_0 EnableViewState=True></asp:DropDownList></TD>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeValue_0" CssClass=hidden  EnableViewState=True></asp:DropDownList><asp:TextBox Runat="server" ID="attTxtNewAttributeValue_0" EnableViewState=false></asp:TextBox></TD>
				           <TD><INPUT type=button id="attNewAttributeCancel_0" Value="Cancel" onclick="javascript: return cancelNewAttribute(this);"/></TD>
				        </TR>
				        <TR>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeName_1"></asp:DropDownList></TD>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeValue_1" CssClass=hidden></asp:DropDownList><asp:TextBox Runat="server" ID="attTxtNewAttributeValue_1" EnableViewState=false></asp:TextBox></TD>
				           <TD><INPUT type=button id="attNewAttributeCancel_1" Value="Cancel" onclick="javascript: return cancelNewAttribute(this);"/></TD>
				        </TR>
				        <TR>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeName_2"></asp:DropDownList></TD>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeValue_2" CssClass=hidden></asp:DropDownList><asp:TextBox Runat="server" ID="attTxtNewAttributeValue_2" EnableViewState=false></asp:TextBox></TD>
				           <TD><INPUT type=button id="attNewAttributeCancel_2" Value="Cancel" onclick="javascript: return cancelNewAttribute(this);"/></TD>
				        </TR>
				        <TR>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeName_3"></asp:DropDownList></TD>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeValue_3" CssClass=hidden></asp:DropDownList><asp:TextBox Runat="server" ID="attTxtNewAttributeValue_3" EnableViewState=false></asp:TextBox></TD>
				           <TD><INPUT type=button id="attNewAttributeCancel_3" Value="Cancel" onclick="javascript: return cancelNewAttribute(this);"/></TD>
				        </TR>
				        <TR>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeName_4"></asp:DropDownList></TD>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeValue_4" CssClass=hidden></asp:DropDownList><asp:TextBox Runat="server" ID="attTxtNewAttributeValue_4" EnableViewState=false></asp:TextBox></TD>
				           <TD><INPUT type=button id="attNewAttributeCancel_4" Value="Cancel" onclick="javascript: return cancelNewAttribute(this);"/></TD>
				        </TR>
				        <TR>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeName_5"></asp:DropDownList></TD>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeValue_5" CssClass=hidden></asp:DropDownList><asp:TextBox Runat="server" ID="attTxtNewAttributeValue_5" EnableViewState=false></asp:TextBox></TD>
				           <TD><INPUT type=button id="attNewAttributeCancel_5" Value="Cancel" onclick="javascript: return cancelNewAttribute(this);"/></TD>
				        </TR>
				        <TR>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeName_6"></asp:DropDownList></TD>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeValue_6" CssClass=hidden></asp:DropDownList><asp:TextBox Runat="server" ID="attTxtNewAttributeValue_6" EnableViewState=false></asp:TextBox></TD>
				           <TD><INPUT type=button id="attNewAttributeCancel_6" Value="Cancel" onclick="javascript: return cancelNewAttribute(this);"/></TD>
				        </TR>
				        <TR>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeName_7"></asp:DropDownList></TD>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeValue_7" CssClass=hidden></asp:DropDownList><asp:TextBox Runat="server" ID="attTxtNewAttributeValue_7" EnableViewState=false></asp:TextBox></TD>
				           <TD><INPUT type=button id="attNewAttributeCancel_7" Value="Cancel" onclick="javascript: return cancelNewAttribute(this);"/></TD>
				        </TR>
				        <TR>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeName_8"></asp:DropDownList></TD>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeValue_8" CssClass=hidden></asp:DropDownList><asp:TextBox Runat="server" ID="attTxtNewAttributeValue_8" EnableViewState=false></asp:TextBox></TD>
				           <TD><INPUT type=button id="attNewAttributeCancel_8" Value="Cancel" onclick="javascript: return cancelNewAttribute(this);"/></TD>
				        </TR>
				        <TR>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeName_9"></asp:DropDownList></TD>
				           <TD><asp:DropDownList Runat="server" ID="attDdlNewAttributeValue_9" CssClass=hidden></asp:DropDownList><asp:TextBox Runat="server" ID="attTxtNewAttributeValue_9" EnableViewState=false></asp:TextBox></TD>
				           <TD><INPUT type=button id="attNewAttributeCancel_9" Value="Cancel" onclick="javascript: return cancelNewAttribute(this);"/></TD>
				        </TR>
				     </Table>
					<hr/>
				    </td>
			    </tr>
			    
			    <tr>
				    <td colspan=2><br/><span class=adminSectionNavOn>Database table columns not added to meta table</span>
				    <asp:datagrid id="dgEtFieldsNotUsed" Runat="server" Width="550" EnableViewState="True" 
				                CellPadding="1" CellSpacing="0"
                                AllowSorting="False" AllowPaging="False">
                                <HEADERSTYLE CssClass="DGHeader"/>
                                <ALTERNATINGITEMSTYLE BackColor="#EEEEEE"/>
                                    <Columns>
                                	    <asp:TemplateColumn ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="CheckAll" OnClick="javascript: return select_deselectAll (this,this.checked, this.id);"
                                                runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelection"  OnClick="javascript: countChecked (this);" Runat="server" />
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                        </asp:datagrid>
                        <br/><asp:Label ID="lblEtNotUsedFields" Runat="server">None</asp:Label>
                        <asp:Button ID="btnEtAddSelectedColumnsToMetaFields"   OnClick="btnEtAddSelectedColumnsToMetaFields_onClick" Text="Add fields"  Runat="server" Visible=False  Enabled=False></asp:Button>
				        &nbsp;<asp:Button ID="btnEtAddSelectedColumnsToMetaFieldsCancel" Text="Cancel"  Runat="server" Visible=False  Enabled=False></asp:Button>
				        &nbsp;<asp:Label ID="btnEtAddSelectedColumnsToMetaFieldsInfo" Runat="server" Visible=False>No items selected.</asp:Label>
				        </td>
			    </tr>
		    </table>
		    <asp:TextBox ID=txtToKeepTrackOfExpandedAttributeRows Runat="server" CssClass=hidden></asp:TextBox>
		</asp:Panel>
		<asp:Panel ID="pnlNewTableStep2" Runat="server">
		    <table width="90%">
			    <tr>
				    <td colspan=2><span class=adminSectionNavOn>Create meta table</span></td>
			    </tr>
			    <tr>
				    <td colspan=2><asp:Label ID="lbNewTableResult" Runat="server"></asp:Label>
				    </td>
			    </tr>
			    <tr>
				    <td colspan=2>Table name:&nbsp;<asp:Label ID="lbNewTableResultTableName" Runat="server"></asp:Label>
				    </td>
			    </tr>
			    <tr>
				    <td colspan=2>Table id:&nbsp;<asp:Label ID="lbNewTableResultTableId" Runat="server"></asp:Label>
				    </td>
			    </tr>
			    <tr>
				    <td  colspan=2><br/><asp:Button id="btnNewTableCreatedNext" OnClick="btnEditMetaTable_onClick"  Runat="server" Text="Next"></asp:Button>
				    
				 </tr>
		    </table>
		</asp:Panel>
		<asp:Panel ID="pnlCreateNewAttributeStep2" Runat="server">
		    <table width="90%">
			    <tr>
				    <td colspan=2><span class=adminSectionNavOn>Create new attribute</span class=adminSectionNavOn></td>
			    </tr>
			    <tr>
				    <td colspan=2><asp:Label ID="lblCreateNewAttributeResult" Runat="server"></asp:Label>
				    </td>
			    </tr>
			    <tr>
				    <td >Attribute name:</td><td><asp:Label ID="lblCreateNewAttributeName" Runat="server"></asp:Label>
				    </td>
			    </tr>
			    <tr>
				    <td >Attribute id:</td><td><asp:Label ID="lblCreateNewAttributeId" Runat="server"></asp:Label>
				    </td>
			    </tr>
			    <tr>
				    <td  colspan=2><br/><asp:Button id="btnCreateNewAttributeNext" OnClick="btnEditAnAttribute_onClick"  Runat="server" Text="Next"></asp:Button>
				 </tr>
			</table>
			</asp:Panel>    
		    <asp:Panel ID="pnlEditAnAttribute" Runat="server">
		    <table width="90%">
			    <tr>
				    <td colspan=2><span class=adminSectionNavOn>Edit field attribute</span class=adminSectionNavOn></td>
			    </tr>
			    <tr>
				    <td width=80>Attribute name:</td><td><asp:TextBox ID=txtEditAnAttributeName Runat=server Enabled=False></asp:TextBox>
				    </td>
			    </tr>
			    <tr>
				    <td width=80>Attribute id:</td><td><asp:Label ID="txtEditAnAttributeId" Runat=server Enabled=False></asp:Label>
				    </td>
			    </tr>
			    <tr>
				    <td  colspan=2><br/><asp:Button id="btnSaveAnAttribute" OnClick="btnEditAnAttribute_onClick"  Runat=server Text="Save" Enabled=False></asp:Button>&nbsp;&nbsp;<input type=button id="btnEditAnAttributeCancel" value=Cancel onclick="javascript:editAnAttribute(this); return false;" disabled=true>&nbsp;&nbsp;<input id="btnEditAnAttributeEdit" type=button value=Edit onclick="javascript:editAnAttribute(this); return false;">
				 <br/><br/><hr/></td>
			    </tr>
			    <tr>
				    <td colspan=2><span class=adminSectionNavOn>Options for this attribute</span></td>
			    </tr>
			    <tr>
				    <td colspan=2>
				        <asp:DataGrid ID=dgOptionsForAnAttribute Runat=server EnableViewState="True"
				                CellPadding="1" CellSpacing="0"
                                AllowSorting="False" AllowPaging="False" 
                                AutoGenerateColumns="False" 
                                OnItemCommand="dgOptionsForAnAttribute_ItemCommand"
                                ShowFooter=True>
                                <HEADERSTYLE CssClass="DGHeaderSmall"/>
								<FooterStyle HorizontalAlign="Right"></FooterStyle>
                                <ALTERNATINGITEMSTYLE BackColor="#EEEEEE"/>
									<Columns>
										<asp:TemplateColumn HeaderText="Option value">
						                    <ItemTemplate>
						                        <asp:Literal Runat=server ID="ltrOptionValue" Text='<%# ((System.Data.DataRowView)Container.DataItem)["AttributeOptionValue"] %>' ></asp:Literal>
						                    </ItemTemplate>
						                    <FooterTemplate>
						                            <asp:TextBox  ID="txtNewOption" NAME="txtNewOption" Runat="server" enabled=True onChange="javascript:txtNewOptionChanged(this)" onKeyUp="javascript:txtNewOptionChanged(this)"/>
                                            </FooterTemplate>
					                    </asp:TemplateColumn>
					                    <asp:TemplateColumn HeaderText="Used">
						                    <ItemTemplate>
						                        <asp:Literal Runat=server ID="ltrOptionValueUsed" Text='<%# ((System.Data.DataRowView)Container.DataItem)["UsedTimes"] %>' ></asp:Literal>
						                    </ItemTemplate>
					                    </asp:TemplateColumn>
										<asp:TemplateColumn HeaderText="">
						                    <ItemTemplate>     
						                        <asp:Button CommandName="Delete" Text="Delete" ID="btnOptionValueDelete" Runat="server" enabled=True OnClientClick="return confirmDelete(this,0,-1);"></asp:Button>
						                    </ItemTemplate>
						                    <FooterTemplate>
						                        <asp:Button CommandName="Add" Text="Add" ID="btnOptionValueAdd" Name="btnOptionValueAdd" Runat="server" enabled=False></asp:Button>
						                    </FooterTemplate>
					                    </asp:TemplateColumn>
					                </Columns>
					            </asp:DataGrid>                            
				    </td>
			    </tr>
			</table>
			</asp:Panel>    
		    <asp:Panel ID="pnlErrorMessage" Runat="server">
		    <table width="90%">
			    <tr>
				    <td colspan=2><asp:Label ID="lblErrorHeading" Runat=server CssClass=adminSectionNavOn></asp:Label></td>
			    </tr>
			    <tr>
				    <td colspan=2><asp:Label ID="lblErrorMessage" Runat=server ></asp:Label>
				    </td>
			    </tr>
			    <tr>
				    <td  colspan=2><input type=button id="btnBack" value="Back" onclick="javascript:history.go(-1);" >
				</tr>
			</table>
			</asp:Panel>    
		    <asp:TextBox ID=attTxtNewAttributesList Name=attTxtNewAttributesList Runat="server" CssClass="hidden"></asp:TextBox>
		    <asp:TextBox ID="attTxtAttributeValueOptionsSwitch" Name=attTxtAttributeValueOptionsSwitch Runat="server" CssClass="hidden"></asp:TextBox>
			   
	    </form>	
	    
        <!-- layer for lookup codes -->
        <div id="LookupCodeLayer" style="z-index: 1000; left: 30px; top: 180px; display: none;
            overflow: hidden; position: absolute; width: 580px; height: 470px; background-color: #ffffff;
            border: 2px solid #666666;">
            <div style="text-align: right; padding-top: 5px; padding-bottom: 5px; padding-right: 5px;">
                <img alt="Close Lookup Codes" title="Close Lookup Codes" src="../Images/Close.gif"
                    style="cursor: pointer;" onclick="hideLookupWindow();" /></div>
            <iframe id="LookupCodePage" frameborder="0" name="LookupCodePage" src="" style="width: 98%;
                margin: auto; height: 460px; z-index: 1001;"></iframe>
        </div>
  </body>
</html>
