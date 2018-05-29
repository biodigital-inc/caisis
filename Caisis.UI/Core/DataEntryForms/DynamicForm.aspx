<%@ Page language="c#" Inherits="Caisis.UI.Core.DataEntryForms.DynamicForm" CodeFile="DynamicForm.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.DynamicPage" %>
<%@ Register TagPrefix="dataEntry" TagName="Form" Src="~/Core/DataEntryForms/DynamicDataEntryForm.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Dynamic Form</title>
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <%--<script src="../../ClientScripts/Help.js" type="text/javascript"></script>--%>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
	<link href="../../StyleSheets/EformStyles.css" type="text/css" rel="stylesheet"/>
	
	<script language="javascript" type="text/javascript">
		var hiddenFieldDiv = document.getElementById('HiddenDiv');
		
		// what about the SPAN? - do we tag them in codebehind?
		function ToggleShowHidden(doShow) {
		    document.getElementById('HiddenDiv').style.display = doShow ? 'block' : 'none';
		    // show main data entry fields when showing hidden fields
		    if(doShow) {
		        toggleDataEntryTabs('Main');
		    }
		}
			
		function SaveAndClose() // called from codebehind
		{	
		    var callWindow = top.getModalCallingWindow();
		    
            if (callWindow != null)
		    {
		        var _dataForm = callWindow.dataForm || callWindow.document.forms['dataForm'];
		        if (_dataForm) // submit the parent form while we edit eform data
		        {
		            if (callWindow.saveCurrentEformPage) {
		                callWindow.saveCurrentEformPage();
		            }
		            else {
		                _dataForm.submit();
		            }
		            top.hideModal();
		        }
			    else // we are editing the eform narrative- reload parent iframe
			    {
				    callWindow.reloadDataIframe();
				    callWindow.CloseDynFormPopup()
			    }
			}
		}
		function ClosePopup()
		{
		    var callWindow = top.getModalCallingWindow();
		
		    var hasDataForm = callWindow.dataForm || callWindow.document.forms['dataForm'];
			if(hasDataForm && callWindow.ClosePopup) // submit the parent form while we edit eform data
			{	
				callWindow.ClosePopup();
			}
			else if(callWindow.CloseDynFormPopup) // we are editing the eform narrative- reload parent iframe
			{	
				callWindow.CloseDynFormPopup()
			}
			return false;
		}
		
    </script>
	<script language="javascript" type="text/javascript">
		var dateMap = new Array();
		
		// code-behind will populate this array :: dateMap.$dateTextClientId = '$dateClientId'
		<asp:Literal id="DateMapInitializer" runat="server"/>
			
		function UpdateDate(dateTextElement) {
			var dtbox = document.getElementById(dateMap[dateTextElement.id]);
			var newdt = Date.parse(dateTextElement.value);
			if (!isNaN(newdt)) {
				dtbox.value = dateTextElement.value;
			} else {
				dtbox.value = '';
			}
		}
		
		function showLockedMsg()
		{
			// alert('This record has been LOCKED. Please confirm that\nany edits you make are correct before saving.\n\n');
			// TODO: replace this message with an icon set to display
			document.getElementById('LockImage').style.display = 'inline';
		}
		
		function showNullsMsg(field)
		{
			alert(field + ' is a required field and empty. Please enter before saving.');
		}
		
		function showGenericErrorMsg()
		{
			alert('The system encountered a network or database error. Please try saving at a later time.');
		}
		
		// intercept help tooltips
		function showToolTipMessage(msg)
		{
		    return true;
		}
		
		function hideToolTip()
		{
		    return true;
		}
	</script>
	<script language="javascript" type="text/javascript">
	    function FindElement(prefixToken, fieldToken, elementType)
	    {
	        var els = document.getElementsByTagName(elementType);
	        
	        for (i = 0; i < els.length; i++)
	        {
	            var el = els[i];
	            
	            if (el.id.indexOf(prefixToken) == 0 && (el.id.indexOf(fieldToken) == (el.id.length - fieldToken.length)))
	            {
	                return el;
	            }
	        }
	        
	        return null;
	    }
	
	    function UpdateAssociatedDate(dateTextElement)
        {
            dateTextElementId = dateTextElement.id;
            
            // tokenize (_) dateTextElementId and match against tokens[0] and tokens[$last].replace('DateText','Date[Display]')
            
            tokens = dateTextElementId.split('_');
            
            prefixToken = tokens[0];
            dateTextToken = tokens[tokens.length - 1];
            
            dateToken = dateTextToken.replace('DateText','Date');
            dateDisplayToken = dateTextToken.replace('DateText','DateDisplay');
            
            dateElement = FindElement(prefixToken, dateToken, 'input');
            dateDisplayElement = FindElement(prefixToken, dateDisplayToken, 'span');
            
            fuzzyDate(dateTextElement, dateElement);
            
            if (dateElement && dateDisplayElement)
            {
                dateDisplayElement.innerHTML = dateElement.value;
            }
        }

        // toggles the active table (parent, main or child)
        // @tagPrefix: the prefix of the active tab
        function toggleDataEntryTabs(tabPrefix) {
            var prefixes = ['Parent','Main','Child'];
            var childTableCount = <%= ChildTableNames.Length %>;
            // append child table prefixes
            for (var i = 0; i < childTableCount; i++) {
                prefixes.push('Child_' + i + '_')
            }
            var activeTable = document.getElementById(tabPrefix + 'DataEntryTable');
            var activeLabel = document.getElementById(tabPrefix + 'FieldsLabel');
            // toggle labels and panels
            for (var i = 0; i < prefixes.length; i++) {
                var prefix = prefixes[i];
                var table = document.getElementById(prefix + 'DataEntryTable');
                var label = document.getElementById(prefix + 'FieldsLabel');
                if (table && label) {
                    var isActive = activeTable == table;
                    table.style.display = isActive ? 'block' : 'none';
                    label.className = 'DataEntryTabBtn' + (isActive ? ' DataEntryTabBtnActive' : '');
                    // supress hidden
                    if(isActive && prefix != 'Main') {
                        ToggleShowHidden(false);
                    }
                }
            }
        }
        
        // hilight main section on load
        $(window).addEvent('load', function(e) {
            toggleDataEntryTabs('Main');;
        });
        
    </script>
	<style type="text/css">
	.DataEntryTabBtn,.DataEntryTabBtnActive
	{
	    font-weight: bold;
	    font-size: 11px;
	    color: #777777;
	    border: 1px solid #cccccc;
	    background-color: #ffffff;
	    padding: 2px 5px 2px 5px;
	    display: inline-block;
	    cursor: pointer;
	}
	.DataEntryTabBtnActive
	{
	    color: #8d2a2c;
	    background-color: #f4f4f4;
	    border: 1px solid #8d2a2c;
	}
	.DataEntryTabBtn:hover
	{
	    color: #8d2a2c;
	    background-color: #ffffff;
	    border: 1px solid #8d2a2c;
	}
	.DynamicDataEntryTable
	{
	    width: 400px;
	    border: solid 1px #dddddd;
	    margin: 2px 0;
	}
	.DynamicDataEntryTable td
	{
	    padding: 5px 2px 5px 10px;
	}
	.childDataEntry
	{
	    position: relative;
	    display: none;
	    width: 800px;
	    max-width: 800px;
	}	
	</style>
  </head>
  <body style="background-color:#FFFFFF;" id="DynamicFormBody" runat="server">
	<form id="dataForm" method="post" runat="server">
		<table width="100%" border="0" cellspacing="0" cellpadding="4" class="EFormPopupTable">
			<tr style="display: none;">
				<td class="EFormPopupTitleCell"><img alt="Close" src="../../Images/CloseSmall.gif" width="38" height="8" vspace="3" align="right" style="cursor: pointer;" onclick="ClosePopup();" />View / Edit <asp:Label ID="FormTitleLabel" Runat="server" /></td>
			</tr>
			<tr>
				<td class="EFormPopupCell"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="62%" class="EFormPopupInstructionText">Edit data as needed and save below.  To view or edit additional data for this record, click &quot;view all fields&quot;. </td>
					<td><img align="right" src="../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" title="This record has been locked." style="DISPLAY: none">&nbsp;</td>
					<td align="center" class="EFormPopupInstructionText" style="font-size: 11px;">
					<input id="FieldToggle" type="checkbox" onclick="ToggleShowHidden(this.checked);" name="FieldToggle"/><label for="FieldToggle"> View All Fields</label></td>
				</tr>
				</table></td>
			</tr>
			<tr>
				<td valign="top" class="EFormPopupCell">
                    <div>
                        <!-- navigation: parent form -->
                        <asp:Label runat="server" ID="ParentFieldsLabel" CssClass="DataEntryTabBtn" onclick="return toggleDataEntryTabs('Parent');"
                            Visible="false"></asp:Label>
                        <!-- navigation: main form -->
                        <asp:Label runat="server" ID="MainFieldsLabel" CssClass="DataEntryTabBtn DataEntryTabBtnActive"
                            Visible="false" onclick="return toggleDataEntryTabs('Main');"></asp:Label>
                        <asp:Label runat="server" ID="ChildFieldsLabel" CssClass="DataEntryTabBtn DataEntryTabBtnActive"
                            Visible="false" onclick="return toggleDataEntryTabs('Child');"></asp:Label>
                        <!-- navigation: child tables -->
                        <asp:Repeater runat="server" ID="ChildTablesHeaderRptr">
                            <ItemTemplate>
                                <span id="Child_<%# Container.ItemIndex %>_FieldsLabel" class="DataEntryTabBtn"
                                    onclick="return toggleDataEntryTabs('Child_<%# Container.ItemIndex %>_');">
                                        <%# GetTableLabel(Container.DataItem.ToString()) %>
                                </span>
                            </ItemTemplate>
                        </asp:Repeater>
                    
                    </div>
                    <div id="dynamicFormScrollingDiv" style="overflow: auto; width: 96%; height: 220px; overflow-x: hidden; position: relative;">
					<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
					<div id="MainDiv" runat="server">
                        <asp:PlaceHolder runat="server" ID="ParentFieldsPanel" Visible="false">                            
                            <%-- parent form --%>
                            <table id="ParentDataEntryTable" class="DynamicDataEntryTable" style="display: none;width: 100%;" cellspacing="0">
                                <asp:Repeater runat="server" ID="ParentRptr" OnItemDataBound="FillMainRepeater">
                                    <ItemTemplate>
                                        <tr class="<%# Container.ItemIndex % 2 == 0 ? "ControlBoxRowAlternatingRowsA" : "ControlBoxRowAlternatingRowsB" %>">
                                            <td style="width: 150px;">
                                                <asp:Label ID="MainLabelStub" runat="server" />
                                            </td>
                                            <td>
                                                <asp:PlaceHolder ID="MainControlStub" runat="server" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </asp:PlaceHolder>
                    <%-- end parent --%>
                        <table id="MainDataEntryTable" class="DynamicDataEntryTable" cellspacing="0" style="width: 100%;">
						<asp:Repeater ID="MainRepeater" OnItemDataBound="FillMainRepeater" Runat="server">
							<ItemTemplate>
								<tr class="<%# Container.ItemIndex % 2 == 0 ? "ControlBoxRowAlternatingRowsA" : "ControlBoxRowAlternatingRowsB" %>">
									<td style="width: 150px;"><asp:Label ID="MainLabelStub" Runat="server"/></td>
									<td><asp:PlaceHolder ID="MainControlStub" Runat="server"/></td>
								</tr>
							</ItemTemplate>
						</asp:Repeater>
						</table>
					</div>
					<div id="HiddenDiv" runat="server" style="display: none;">
						<table cellspacing="0" class="DynamicDataEntryTable"  border="0"  style="border: solid 1px #dddddd;width: 100%;">
						<asp:Repeater ID="HiddenRepeater" OnItemDataBound="FillHiddenRepeater" Runat="server">
							<ItemTemplate>
								<tr class="<%# (MainRepeater.Items.Count + Container.ItemIndex) % 2 == 0 ? "ControlBoxRowAlternatingRowsA" : "ControlBoxRowAlternatingRowsB" %>">
									<td  style="width: 150px;"><asp:Label ID="HiddenLabelStub" Runat="server"/></td>
									<td><asp:PlaceHolder ID="HiddenControlStub" Runat="server"/></td>
								</tr>
							</ItemTemplate>
						</asp:Repeater>
						</table>
					</div>
                    <%-- child form --%>
                    <asp:PlaceHolder runat="server" ID="ChildFieldsPanel" Visible="false">
                        <asp:Repeater runat="server" ID="ChildTablesRptr" OnItemDataBound="BuildRptrChildDataEntry">
                            <ItemTemplate>
                                <div id="Child_<%# Container.ItemIndex %>_DataEntryTable" class="childDataEntry">
                                    <asp:HiddenField runat="server" ID="TableNameField" Value='<%# Container.DataItem %>' />
                                    <dataEntry:Form runat="server" ID="ChildDataEntry" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:PlaceHolder>
				</div>
				</td>
			</tr>
			<tr>
				<td align="center" class="EFormPopupCell"><img src="../../Images/CancelOnWhite.gif" width="61" height="25" hspace="30" style="cursor:pointer;"   onclick="ClosePopup();" />
					<asp:LinkButton OnClick="Save" Runat="server" ID="Linkbutton1"><img src="../../Images/SaveAndClose.gif" width="100" height="25" hspace="30" border="0" /></asp:LinkButton>
				</td>
			</tr>
		</table>
		<asp:Literal ID="AlertScript" Runat="server" Visible="False"><script>showLockedMsg();</script></asp:Literal>
		<asp:Literal ID="NullsScript" Runat="server" Visible="False"><script>showNullsMsg();</script></asp:Literal>
		<asp:Literal ID="GenericErrorScript" Runat="server" Visible="False"><script>showGenericErrorMsg();</script></asp:Literal>
		
		<script type="text/javascript">
		$('dynamicFormScrollingDiv').style.height = getHeight(window) - 95 + 'px';
		</script>
		
     </form>
  </body>
</html>
