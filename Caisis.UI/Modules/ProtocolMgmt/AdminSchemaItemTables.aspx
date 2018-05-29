<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSchemaItemTables.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminSchemaItemTables" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>
    
    <script type="text/javascript">

        Browser.ResizeElement({ customResizer: onWindowResize });
        function onWindowResize() {
            var winHeight = top.getHeight(window);
            var winWidth = top.getWidth(window);

            if (winHeight > 25) { $('MainOverflow').style.height = winHeight - 25 + 'px'; }
            //$('MainOverflow').style.width  = winWidth - 50 + 'px';
        }

        // overrides original functionality to support "[enter]"
        function UpdateAssociatedDate(dateTextElement) {
            dateTextElementId = dateTextElement.id;

            dateFieldId = dateTextElementId.replace('DateText', 'Date');
            dateDisplayId = dateTextElementId.replace('DateText', 'DateDisplay');
            dateElement = document.getElementById(dateFieldId);
            dateDisplayElement = document.getElementById(dateDisplayId);

            fuzzyDate(dateTextElement, dateElement);

            if (dateElement && dateDisplayElement) {
                dateDisplayElement.innerHTML = dateElement.value;
            }
        }

        function toggleUserEntered(id, childid, cb) {
            el = document.getElementById(id);

            child_el = document.getElementById(childid + 'Display');

            if ($(cb) != null) {
                if ($(cb).checked == false) {

                    if (child_el != null) {
                        child_el.innerHTML = "";
                    }
                    el.value = "";
                    el.refClass = el.className;
                    el.className = 'UnEditable';
                }
                else {

                    el.value = "";
                    el.className = el.refClass;
                }
            }
        }

        function toggleUserEntered_CheckBox(id, cb) {
            el = document.getElementById(id);

            if ($(cb) != null) {
                if ($(cb).checked == false) {
                    el.checked = false;
                    //el.value = "";
                    el.refClass = el.className;
                    el.className = 'UnEditable';
                }
                else {
                    //el.checked = true;
                    //el.value = "";
                    el.className = el.refClass;
                }
            }
        }

        function toggleUserEntered_DropDown(checked, id, state) {
            el = document.getElementById(id);

            if (state == 'RadioButtonCollect') {
                for (i = 0; i < el.options.length; i++) {
                    if (el.options[i].value == "[enter]") {
                        el.selectedIndex = i;
                    }
                }

                el.className = 'UnEditable';
            }
            else if (state == 'RadioButtonNoCollect') {
                el.selectedIndex = 0;
                el.className = 'UnEditable';
            }
            else {
                el.selectedIndex = 0;
                el.className = '';
            }
        }
        function SetEditableControl(buttonId, controlId) {
            el = document.getElementById(controlId);
            if (el)
                el.className = '';

            el = document.getElementById(buttonId);
            if (el)
                el.checked = true;

        }

        function DisplayChildGrid(childCheckBox, childGridName) {
            var childCB = $(childCheckBox);
            var childDiv = document.getElementById(childGridName + 'Holder');

            if (childCB != null) {
                if (childCB.checked == true)
                    childDiv.style.display = '';
                else
                    childDiv.style.display = 'none';
            }
        }



        function showAddNewRow(childTableName) {
            var tb = document.getElementById(childTableName);

            if (tb) {
                var maxFieldRowIndex = 0;
                // starting with third row should have the controls
                for (i = 0; i < tb.rows.length; i++) {
                    if (tb.rows[i].className == 'ChildTableRow') {
                        if (tb.rows[i].style.display == 'none') {
                            // set FieldRowIndex so we know it's a new row
                            var allRowTags = tb.rows[i].getElementsByTagName('input');

                            for (j = 0; j < allRowTags.length; j++) {
                                if (allRowTags[j].className == 'HiddenFieldRowIndex')
                                    allRowTags[j].value = '1';
                            }

                            // display the row
                            tb.rows[i].style.display = '';
                            break;
                        }
                    }
                }
            }
        }
        function getParentItemName() {
            if ($('parentItemName')
            && parent.document.getElementById("TextBoxItemName")) {
                $('parentItemName').value = parent.document.getElementById("TextBoxItemName").value;
                if ($('parentItemName').value == '') {
                    alert('Item Name is required');
                    return false;
                }
            }
            else {
                return false;
            }

            return true;
        }

        function confirmDelete() {
            return confirm('Are you sure you want to delete this schema?');
        }
    
    </script>
    <style type="text/css">
    .SchemaItemsTable td
    {
        border: solid 1px #dddddd;
    }
    .FieldTitle
    {
        font-size: 11px;
        font-weight: bold;
        color: #000000;
    }
    .UnEditable
    {
        background-color:#F6F6F6;
    }
    .dataGridItemRowB
    {
        background-color: #E0EBF1;
    }
    </style>
</head>
<body style="margin: 0px; padding: 0px;">
    <form id="form1" runat="server">
        <div id="MainOverflow" style="overflow: auto; height: 200px; position: relative;">
	        <div>
	            <asp:HiddenField ID="parentItemName" runat="server" />
		        <div>
		            <asp:PlaceHolder ID="MainTableContainer" runat="server" />
		        </div>
		        <div>
		            <asp:PlaceHolder ID="ChildrenTableContainer" runat="server" />
		        </div>
		    </div>
        
        </div>        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <asp:CheckBox ID="TemplateCheckBox" runat="server" Text="Save this item as an Item Template for reuse in other schemas" />
                </td>
                                                
        <!-- buttons -->
                <td>
		        <asp:Panel ID="ButtonPanel" CssClass="ButtonContainer" Visible="true" runat="server" style="text-align: right; margin-top: 6px;">
                    
			        <span class="CancelButtonContainer">
			            <asp:ImageButton ID="CancelButton" runat="server" ImageUrl="Images/Button_Cancel.png" 
			                OnClientClick="top.hideModal(); return false;" Visible="True" style="margin-right: 20px;" />
                    </span>
			        <span class="SaveButtonContainer">
				        <asp:ImageButton ID="SaveButton" ImageUrl="Images/Button_Save.png" 
					        CausesValidation="true" runat="server" Visible="True" OnClientClick="return getParentItemName();" OnClick="SaveItemBtn_Click" style="margin-right: 20px;" />
			        </span>
			        <span class="CreateButtonContainer"><asp:ImageButton ID="CreateButton" ImageUrl="Images/Button_Save.png" 
					         runat="server" Visible="False" OnClientClick="return getParentItemName();" OnClick="CreateItemBtn_Click" style="margin-right: 20px;" />
			        </span>
			        <span class="DeleteButtonContainer">
				        <asp:ImageButton ID="DeleteButton" ImageUrl="Images/Button_Delete.png" 
					        runat="server" Visible="False" OnClientClick="return confirmDelete();" OnClick="DeleteItemBtn_Click" style="margin-right: 20px;" />
			        </span>
                </asp:Panel>
                </td>
            </tr>
        </table>	
    </form>
</body>
</html>
