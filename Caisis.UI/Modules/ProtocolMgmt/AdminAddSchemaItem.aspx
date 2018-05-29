<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminAddSchemaItem.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminAddSchemaItem" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>
    
    <script type="text/javascript">

    Browser.ResizeElement({ customResizer: onWindowResize });
    
    // adjust frame height to fill window
    function onWindowResize() {
        var winHeight = getHeight(window);
        var winWidth = getWidth(window);
        var detailsPage = $('<%= SchemaItemDetailsPage.ClientID %>');
        if (detailsPage) {
            detailsPage.style.height = winHeight - 200 + 'px';
        }
    }
    
    function addNewItem()
    {
        $('TemplateMenu').style.display='none';  // not really necessary but makes interface look snappier
        reloadWindow('<%= GetQueryString("AdminAddSchemaItem.aspx") %>');
    }
    
    function reloadWindow(src)
    {
        window.location.href = src;
    }
    
    function reloadAdminProtocolFrame()
    {
        // get reference to window
        var protocolWindow = top.getModalCallingWindow();

        if(protocolWindow)
        {
            protocolWindow.location = protocolWindow.location;
        }
    }
    function hideMoreTabsMenu(element, evt)
    {
        if (isMouseLeave(element, evt))
        {
           element.style.display = 'none';
           
           var radio = document.getElementsByName('LayoutTypeRBList');

            for (var j = 0; j < radio.length; j++)
            {
                if (radio[j].checked)
                {
                    $('LayoutType').value = radio[j].value;
                    $('layoutTitle').innerHTML = radio[j].value;
                    ShowRebuildTablesBtn();
                    break;
                }
            }

        }
    }
    
    function hideCreateOptions(element, evt)
    {
        if (isMouseLeave(element, evt))
        {
           element.style.display = 'none';
        }
    }
    
    // Determines if patient content page isDirty (i.e. form fields values changed before post-back)
    function checkContentPageDirty()
    {
        if(isPageDirty(window.frames['SchemaItemDetailsPage']))
        {
            return confirm('You have made changes to the form, if you leave the changes will be lost');
        }
        else
        {
            return true;
        }
    }
    
    function ShowRebuildTablesBtn()
    {
        if ($('RebuildButtonHolder')
            && IsLayoutAndTypeSelected())
        {
            $('RebuildButtonHolder').style.display = '';
        }
    }
    
    function IsLayoutAndTypeSelected()
    {
   
        if ($('layoutTitle').innerHTML != ''
            && $('DropDownListItemType').selectedIndex > 0)
            return true;
        else
            return false;
            
    }
    
    function setChildTableList()
    {
        var str = "";
    
        var tb = $('ChildCheckBoxTable');
        
        var cbArray = tb.getElementsByTagName('input');
        
        var cbCount = 0;
        
        for (i = 0; i < cbArray.length; i++)
        {
            if (cbArray[i].type == 'checkbox')
            {
                if (cbArray[i].checked == true)
                {
                    var labelArray = cbArray[i].parentNode.parentNode.getElementsByTagName('span');

                    if ( labelArray.length > 0 )
                    {
                        if ( str.length > 0 )
                            str += ', ';
                        str += labelArray[0].innerHTML;
                        cbCount++;
                    }
                }
            }
        }
        
        if (str.length > 20)
        {
            str = str.substring(0,20);
            str += "....(" + cbCount + ")";
        }
        
        $('SelectedChildTablesLabel').innerHTML = str;
    }
    
    function UsePredefinedItem(bTemplate, val)
    {
        $('ItemCreateOption').innerHTML = val;
        
        $('TemplateMenuItemsHeader').style.display=''; 
        
        $('TemplateMenuItems').style.display='none';
		
        $('TemplateMenu').style.display='none';

        
        if (bTemplate)
        {
            $('TemplatesItems').style.display='block'; 
            $('SchemaItems').style.display='none';
        }
        else
        {
            $('TemplatesItems').style.display='none'; 
            $('SchemaItems').style.display='block';
        }
    }
    
    </script>
    
    <script type="text/javascript">

    	function _Map(arr, f)
    	{
    		for (i = 0; i < arr.length; i++)
    			f($(arr[i]));
		}

		function Check(el, doCheck)
		{
			if (!el.disabled)
				el.checked = doCheck;
		}

    	function ManageCheckBoxes(el) 
    	{
    		var id = el.id;

    		// if checked: check any (enabled) unchecked parents
    		// else (if unchecked): uncheck any (enabled) unchecked children

    		if (el.checked && id in parentMap)
    		{
    			_Map(parentMap[id], function(el) { Check(el, true); });
    		}
    		else if (id in cbmap)
    		{
    			_Map(cbmap[id], function(el) { Check(el, false); });
    		}
			
		
    	}

    	function ClearCheckBoxes()
    	{
    		for (key in cbmap)
    			$(key).checked = false;
    	}

    	function ShowChildTables(show)
    	{
    		var display = $('ChildMenuTextDisplay');
    		var div = $('ChildTableMenu');
    		var summary = $('ChildTableSummary');

    		if (show)
    		{
    			display.style.display = 'inline';
    			summary.style.display = 'block';
    		}
    		else
    		{
    			display.style.display = 'none';
    			div.style.display = 'none';
    			summary.style.display = 'none';
    			
    			ClearCheckBoxes();
    		}

            // confirm update interface
            if(window.doViewFieldsClick) {
                var doUpdateLayout = confirm("You have changed the form layout, would you like to update the interface?");
                if(doUpdateLayout) {
                    window.doViewFieldsClick();
                }
            }
    	}
    
    </script>
    
    <style type="text/css">
        
    html { height: 100%; }
    body
    {
	    min-height: 100%;
	    padding: 0px;
	    margin: 0px;
	    background-color: #ffffff;
    }

    .fullScreenLayer
    {
	    width: 100%;
	    height: 100%;
    }
    .Level2PopupDiv
    {
	    position: absolute;
	    width: 100%;
	    height: 446px;
	    z-index: 102;
	    margin: auto auto auto auto;

    }
    .Level2PopupTopLeft
    {
/*	    background-image:url(images/Level2PopupBG_TopLeft.png); */
        background-color: #ffffff;
	    background-repeat: no-repeat;
	    font-family: Arial, Helvetica, sans-serif;
	    font-size: 17px;
	    color: #8d2a2c;
	    padding-left: 21px;
	    padding-top: 12px;
    }
    .Level2PopupTopRight
    {
/*	    background-image:url(images/Level2PopupBG_TopRight_noClose.png);*/
	    background-color: #ffffff;
	    background-repeat: no-repeat;
	    background-position: top right;
	    height: 42px;
	    width: 28px;
    }
    .Level2PopupMidRight
    {
/*	    background-image:url(images/Level2PopupBG_MidRight.png);*/
	    background-color: #ffffff;
	    background-repeat: repeat-y;
	    background-position: right;
    }
    .Level2PopupBottomRight
    {
/*	    background-image:url(images/Level2PopupBG_BottomRight.png);*/
	    background-color: #ffffff;
	    background-repeat: no-repeat;
	    background-position: bottom right;
    }
    .Level2PopupBottomLeft
    {
/*	    background-image:url(images/Level2PopupBG_BottomLeft.png);*/
	    background-color: #ffffff;
	    background-repeat: no-repeat;
	    background-position: bottom left;
    }
    .Level2PopupBottomMid
    {
/*	    background-image:url(images/Level2PopupBG_BottomMid.png);*/
	    background-color: #ffffff;
	    background-repeat: repeat-x;
	    background-position: bottom left;
    }

    .SelectorWhite_left {	background-image:url(images/SelectorWhite_BG_Left.png);
	    background-repeat:no-repeat;
	    vertical-align: top;
	    height: 21px;
	    padding-left: 10px;
	    color: #111111;
	    font-family: Arial, Helvetica, sans-serif;
	    font-size: 10px;
	    font-weight: bold;
	    padding-top: 7px;
    }
    .SelectorWhite_right {	background-image:url(images/SelectorWhite_BG_Right.png);
	    background-repeat:no-repeat;
	    vertical-align: top;
	    height: 21px;
	    width: 30px;
	    color: #111111;
	    font-family: Arial, Helvetica, sans-serif;
	    font-size: 10px;
	    padding-top: 7px;
	    text-align: right;
    }
    .ShadedOptionsArea_Left
    {
	    background-image:url(images/ShadedOptionsArea_Left.png);
	    background-repeat: no-repeat;
	    background-color: #F6F6F6;
	    font-size: 13px;
	    color: #111111;
    }
    .ShadedOptionsArea_Right
    {
	    background-image:url(images/ShadedOptionsArea_Right.png);
	    background-repeat: no-repeat;
	    background-position: right;
	    background-color: #F6F6F6;
	    font-size: 13px;
	    color: #111111;
    }
    .SchemaColumnHeader
    {
	    font-family:Arial, Helvetica, sans-serif;
	    font-size: 10px;
	    color: #000000;
	    font-weight: bold;
	    text-align: center;
    }
    .MenuLayer
    {
    position: absolute; 
    width: 237px; 
    display: none;

    }
    .MenuLayerRow
    {
	    vertical-align: top;
	    height: 16px;
	    font-family:Arial, Helvetica, sans-serif;
	    font-size: 12px;
	    color: #000000;
    	
    }
	#TemplateMenuOptionTd input
	{
		cursor: pointer;
	}
	#TemplateMenuOptionTd label
	{
		cursor: pointer;
	}
	#TemplateItemsOptionsTable label
	{
		cursor: pointer;
	}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="PatientIneligiblePopup" class="fullScreenLayer" style="position: absolute;
            z-index: 100;">
            <asp:HiddenField ID="LayoutType" runat="server" />
            <div class="Level2PopupDiv">
                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="Level2PopupTopLeft" style="white-space: nowrap; text-align: left;"><div style="display: inline; float: left; margin: 6px 20px 0px 0px;">What would you like to do?</div>
                            <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <div id="TemplateMenu" class="MenuLayer" style="width: 250px;" onmouseout="hideCreateOptions(this, event);" >
                                            <div style="background-image: url(images/MenuLayerTop_227Wide_noClose.png); background-repeat: no-repeat;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="2">
                                                    <tr>
                                                        <td colspan="2">
                                                            <img src="images/shim.gif" style="width: 8px; height: 5px; cursor: pointer;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td id="TemplateMenuOptionTd">
                                                            <input id="CreateSchemaRB" type="radio" runat="server" onclick="addNewItem();"
                                                                value="Create a new schema item" name="CreateOptions" ><label for="CreateSchemaRB">Create a new schema item</label><br />
                                                            <input id="UseTemplateRB" type="radio" runat="server" onclick="UsePredefinedItem(true, this.value);"
                                                                value="Use an Item Template created previously" name="CreateOptions"><label for="UseTemplateRB">Use an Item Template created previously</label><br />
                                                            <input id="CopySchemaRB" type="radio" runat="server" onclick="UsePredefinedItem(false, this.value);"
                                                                value="Copy a schema item from this protocol" name="CreateOptions"><label for="CopySchemaRB">Copy a schema item from this protocol</label><br />
				                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <img src="images/MenuLayerBottom_237Wide.png">
                                        </div>
                                        <table border="0" cellspacing="0" cellpadding="0" style="cursor: pointer; height: 28px;"
                                            onclick="document.getElementById('TemplateMenu').style.display='block';">
                                            <tr>
                                                <td class="SelectorWhite_left" style="width: 230px;">
                                                    <asp:Label runat="server" ID="ItemCreateOption" />
                                                </td>
                                                <td class="SelectorWhite_right">&nbsp;
                                                    </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="padding-left: 20px;">
                                        <div id="TemplateMenuItems" class="MenuLayer" style="width: 250px;" onmouseout="hideCreateOptions(this, event);" >
                                            <div style="background-image: url(images/MenuLayerTop_noClose.png); background-repeat: no-repeat;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="2">
                                                    <tr>
                                                        <td colspan="2">
                                                            <img src="images/shim.gif" style="width: 8px; height: 5px; cursor: pointer;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div id="TemplatesItems" runat="server" style="display: none; max-height: 275px; overflow: auto;">
                                                                <table id="TemplateItemsOptionsTable">
                                                                    <asp:Repeater ID="TemplatesRptr" runat="server" OnItemDataBound="TemplatesRptr_ItemDataBound">
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td class="TemplateItemsOptionsTd">
                                                                                    <asp:HiddenField ID="SchemaItemIdHd" runat="server" Value='<%# Eval("SchemaItemId") %>' />
                                                                                    <asp:RadioButton ID="SchemaItemOption" runat="server" Text='<%# Eval("ItemDescription") %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </table>
				                                            </div>
				                                            <div id="SchemaItems" runat="server" style="display: none;">
				                                                <table>
                                                                    <asp:Repeater ID="SchemaItemsRptr" runat="server" OnItemDataBound="SchemaItemsRptr_ItemDataBound">
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:HiddenField ID="SchemaItemIdHd" runat="server" Value='<%# Eval("SchemaItemId") %>' />
                                                                                    <asp:RadioButton ID="SchemaItemOption" runat="server" Text='<%# Eval("ItemDescription") %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </table>
				                                            </div>
				                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <img src="images/MenuLayerBottom.png">
                                        </div>
                                        <div id="TemplateMenuItemsHeader" runat="server" style="display: none;">
                                            <table border="0" cellspacing="0" cellpadding="0" style="cursor: pointer; height: 28px;"
                                                onclick="document.getElementById('TemplateMenuItems').style.display='block';">
                                                <tr>
                                                    <td class="SelectorWhite_left" style="width: 140px;">
                                                        <asp:Label ID="ItemToCopy" runat="server" />
                                                    </td>
                                                    <td class="SelectorWhite_right">&nbsp;
                                                        </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        
                        <td class="Level2PopupTopRight">&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="Level2PopupTopLeft" style="background-position: 0px -30px">
                            <table width="96%" border="0" cellspacing="0" cellpadding="4" style="margin: auto;">
                                <tr>
                                    <td class="ShadedOptionsArea_Left" style="text-align: right; padding-right: 14px;
                                        font-weight: bold; height: 30px;">
                                        <label for="DropDownListItemType">
                                            What type of item is this?</label>
                                    </td>
                                    <td class="ShadedOptionsArea_Left" style="background-position: -190px 0px;">
                                        <span class="ShadedOptionsArea_Left" style="width: 230px; background-position: -190px 0px;">
                                            <asp:DropDownList ID="DropDownListItemType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownListItemType_SelectedIndexChanged" />
                                        </span>
                                        <asp:CheckBox ID="ParentTableIsGridCheckBox" runat="server" Text="Grid" ToolTip="Display this item as a datagrid?" TextAlign="Left" />
                                    </td>
                                    <td style="background-color: #f6f6f6; font-size: 13px; color: #111111; text-align: right;
                                        padding-right: 14px;">
                                       <label for="TextBoxItemName">Item Name</label>
                                    </td>
                                    <td class="ShadedOptionsArea_Right">
                                        <asp:TextBox ID="TextBoxItemName" runat="server" Style="border: solid 1px #cccccc;
                                            font-size: 13px; color: #000000; width: 170px;"></asp:TextBox>
                                    </td>
                                </tr>                                
                                <tr>
                                  <td class="ShadedOptionsArea_Left" style="text-align: right; padding-right: 14px;
                                        background-position: 0px -31px; height: 34px; font-size: 11px;"><span id="ChildMenuTextDisplay" runat="server" style="display: none;">For this item, additional data may be entered:</span></td>
                                  <td class="ShadedOptionsArea_Left" style="background-position: -190px -31px;"><div id="ChildTableMenu" class="MenuLayer">
                                            <div style="background-image: url(images/MenuLayerTop_237Wide.png); background-repeat: no-repeat;">
                                                <table id="ChildCheckBoxTable" width="100%" border="0" cellspacing="0" cellpadding="2">
                                                    <tr>
                                                        <td colspan="2" style="vertical-align: top;">
                                                            <img src="images/shim.gif" alt="Close" style="width: 13px; height: 13px; cursor: pointer;
                                                                margin-top: 5px; margin-right: 5px; float: right;" onclick="setChildTableList();document.getElementById('ChildTableMenu').style.display='none';"><span style="color: #8d2a2c; font-size: 12px; font-weight: bold; margin: 0px 0px 0px 10px; line-height: 28px;">Select Table(s)</span></td>
                                                    </tr>
                                                    <tr>
														<td>
														<table>
															<tr>
																<td>&nbsp;</td>
																<td style="text-decoration: underline;">List</td>
																<td style="text-decoration: underline;">Grid</td>
															</tr>
															<asp:Repeater ID="ChildTablesRptr" runat="server" OnItemDataBound="SetSelectedChildTables">
																<ItemTemplate>
																	<tr>
																		<td style="padding-left: 8px;" class="MenuLayerRow" >
																			<asp:Label ID="childTableNameLabel" runat="server" Text="<%# Container.DataItem %>"/>																		</td>
																		<td>
																			<asp:CheckBox ID="childTableListCheckBox" onclick="ManageCheckBoxes(this);" runat="server"/>																		</td>
																		<td>
																			<asp:CheckBox ID="childTableGridCheckBox" onclick="ManageCheckBoxes(this);" runat="server"/>																		</td>
																	</tr>
																</ItemTemplate>
															</asp:Repeater>
														</table>
														</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <img src="images/MenuLayerBottom_237Wide.png"></div>
                                    <div id="ChildTableSummary" runat="server" style="display: none;">
                                            <table border="0" cellspacing="0" cellpadding="0" style="cursor: pointer; height: 28px;
                                                margin-top: 3px; margin-left: 3px;" onclick="document.getElementById('ChildTableMenu').style.display='block';">
                                                <tr>
                                                    <td class="SelectorWhite_left" style="text-align: right;"><asp:Label runat="server" ID="SelectedChildTablesLabel" />&nbsp;</td>
                                                    <td class="SelectorWhite_right" style="background-image: url(images/SelectorWhite_BG_RightNoArrow.png);
                                                        font-weight: normal;"></td>
                                                </tr>
                                            </table></div></td>
                                  <td style="background-color: #f6f6f6; font-size: 13px; color: #111111;
                                        text-align: right; padding-right: 14px; font-size: 11px;"><%--Layout--%>&nbsp;</td>
                                  <td class="ShadedOptionsArea_Right"><%--<div id="LayoutMenu" class="MenuLayer" style="width: 143px;" onmouseout="hideMoreTabsMenu(this, event);">
                                            <div style="background-image: url(images/MenuLayerNarrowTop.png); background-repeat: no-repeat;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="2">
                                                    <tr>
                                                        <td colspan="2">
                                                            <img src="images/shim.gif" style="width: 8px; height: 5px; cursor: pointer;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButtonList ID="LayoutTypeRBList" CssClass="MenuLayerRow" runat="server">
				                                                <asp:ListItem>List</asp:ListItem>
				                                                <asp:ListItem>Grid</asp:ListItem>
				                                                <asp:ListItem>List and Grid</asp:ListItem>
				                                            </asp:RadioButtonList>
				                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <img src="images/MenuLayerNarrowBottom.png">
                                        </div>
                                        <table border="0" cellspacing="0" cellpadding="0" style="cursor: pointer; height: 28px;
                                            margin-top: 3px; margin-left: 3px;" onclick="document.getElementById('LayoutMenu').style.display='block';">
                                            <tr>
                                                <td class="SelectorWhite_left">
                                                    <asp:Label ID="layoutTitle" runat="server" />
                                                </td>
                                                <td class="SelectorWhite_right">
                                                    &nbsp;</td>
                                            </tr>
                                        </table>--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorItemName" runat="server" 
                                            ErrorMessage="Item Name is a required field" Font-Size="10" Font-Bold="true" ValidationGroup="SchemaItemsGroup" ControlToValidate="TextBoxItemName" >                                        </asp:RequiredFieldValidator></td>
                                </tr>
                            </table>
                            <div style="height: 28px;">
                            <div id="RebuildButtonHolder" style="display:none; text-align: center; height: 28px;" runat="server" >
                                <asp:ImageButton ImageUrl="Images/Button_ViewAndSelectFields.png" ID="RebuildChildTables" CausesValidation="true" ValidationGroup="SchemaItemsGroup" runat="server" Text="Rebuild child tables" OnClientClick="return checkContentPageDirty();" OnClick="RebuildChildTables_Click" style="margin: 3px auto 0px auto;" />
                            </div>
                            </div>
                        </td>
                        <td class="Level2PopupMidRight">&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="Level2PopupTopLeft" style="background-position: 0px -30px; padding-left: 0px;">
                            <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
                                <tr>
                                    <td colspan="4">
                                        <iframe src="" runat="server" id="SchemaItemDetailsPage" name="SchemaItemDetailsPage" frameborder="0" style="width: 94%; margin: auto; display: block;
                                        height: 430px; border: solid 1px #cccccc;"></iframe>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td class="Level2PopupMidRight">&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td class="Level2PopupBottomLeft" colspan="2">&nbsp;</td>
                        <td class="Level2PopupBottomRight">&nbsp;
                            </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
