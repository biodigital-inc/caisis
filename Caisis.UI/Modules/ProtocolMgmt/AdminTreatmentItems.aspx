<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminTreatmentItems.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminTreatmentItems" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SchemaItems</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery-ui.js"></script>
    <script type="text/javascript">  
    /* <![CDATA[ */
    var EDIT_SCHEMA_ITEM_URL = '<%= GetQueryString(Page.ResolveUrl("AdminAddSchemaItem.aspx")) %>';
    var activePopup;

    jQuery.noConflict();

    jQuery(document).ready(function() {
        // enable timeline
        if (hasSchemaItems() && parent.setTabEnabled) {
            parent.setTabEnabled('SchemaTimeline');
        }

        // init sorting
        var table = jQuery("#SchemaItemsTable");
        var rows = table.find("> tbody > tr");
        var adjustItemOrder = function() {
            table.find("input[name*='ItemOrder']").each(function(index) {
                var itemOrder = jQuery(this);
                itemOrder.val(index + 1 + "");
            });
        };
        rows.each(function() {
            var row = jQuery(this);
            var order = row.find("input[name*='ItemOrder']");
            var up = row.find("img.sortUp");
            var down = row.find("img.sortDown");
            up.click(function() {
                var targetRow = row.prev("tr");
                if(targetRow.length > 0) {
                    row.insertBefore(targetRow);
                    adjustItemOrder();
                }
            });
            down.click(function() {
                var targetRow = row.next("tr");
                if(targetRow.length > 0) {
                    row.insertAfter(targetRow);
                    adjustItemOrder();
                }
            });
            order.blur(function() {
                var value = order.val();
                if(value != "") {
                    var newRowNum = parseInt(value, 10);
                    if(newRowNum == 'NaN' || newRowNum < 1 || newRowNum > rows.length) {
                        alert("Please enter a valid row number (1-" +  rows.length + ").");
                        order.val(order[0].defaultValue);
                    }
                    else {
                        // find new row (account for index=0)
                        var targetRowIndex = newRowNum - 1;
                        var targetRow = table.find("> tbody > tr").eq(targetRowIndex);
                        if(targetRow.length > 0 && targetRow[0] != row[0]) {                   
                            row.insertBefore(targetRow);
                        }
                    }
                    // reset values
                    adjustItemOrder();
                }
            });
            order.focus(hideActiveItemInfo);
            up.focus(hideActiveItemInfo);
            down.focus(hideActiveItemInfo);
        });
    });
    
       
    function onWindowResize()
    {
        var winHeight = getHeight(window);
        var newHeight = Math.max(100, winHeight - 200);
        $('ContentTableHolder').style.height = newHeight + 'px';
    }
    
    function editSchemaItem(schemaItemId, parentTable)
    {
        var addOrEdit = 'Edit';
        
        if (schemaItemId == '') addOrEdit = 'Add New';
        
        return showEditDetailsInModal( EDIT_SCHEMA_ITEM_URL + '&scitid=' + schemaItemId, addOrEdit +' Schema Item',900,700);
        //return showEditDetailsInModal( url + '&scitid=' + schemaItemId + '&parentTable=' + parentTable,'Edit Schema Item',900,700);
    }
    
    function goToPrev() { parent.setActiveTab('SchemaName');}
    function goToNext()
    {
        if(!hasSchemaItems())
        {
            alert('Please add schema items before continuing to Timeline.');
        }
        else
        {
            parent.setActiveTab('SchemaTimeline'); 
        }
        return false;
    } 
    
    function showItemInfo(schemaItemId)
    {
        var label = jQuery("#infoText_" + schemaItemId);
        var layer = jQuery("#infoDiv_" + schemaItemId);
        var layerDOM = layer[0];
        layer.css("left", label.position().left + label.width() + "px");
        layer.css("top", label.position().top + "px");
        layer.show();
        if(activePopup && activePopup != layerDOM)
        {
            hideActiveItemInfo();
        }
        activePopup = layerDOM;
    }
    
    function hideItemInfo(el, evt)
    {
		if (evt==null || isMouseLeave(el, evt))
		{
			jQuery(el).hide();
			activePopup = null;
		 }
    }

    function hideActiveItemInfo() {
        if(activePopup) {
            hideItemInfo(activePopup);
        }
        activePopup = null;
    }
    
    function hasSchemaItems() {
        var schemaItemsTable = $('SchemaItemsTable');
        return schemaItemsTable.getElementsByTagName('TR').length > 0;
    }
    
    
    /* ]]> */
    </script>
    <style type="text/css">
        #SchemaItemsTable  > tbody > tr
        {
            text-align: left;
        }
        #SchemaItemsTable > tbody > tr:nth-child(even)
        {
            background-color: #ffffff;
        }
        #SchemaItemsTable > tbody > tr:nth-child(odd)
        {
            background-color: #DFEDF9;
        }        
        #SchemaItemsTable  > tbody > tr span.infoText
        {
            color: #1C3B68;
            font-size: 12px;
            font-weight: bold;
            text-decoration: underline;
            cursor: pointer;
        }
        .SortWrapper
        {
            float: left;
            width: 40px;
        }
        .SortWrapper input
        {
            float: left;
            width: 25px;
        }
        .SortWrapper img
        {
            float: left;
            margin: auto;
            cursor: pointer;
        }
        #NavigationBtns
        {
            text-align: center;
        }
        #NavigationBtns .dataEntryButtonRed
        {
            margin: 5px auto;
            width: 100px;
        }
    </style>
</head>
<body style="background-color: #ffffff;">
    <form id="form1" runat="server">
    <div id="pageTitle" style="font-size: 14px; color: #222222; margin: 20px auto 4px auto;
        width: 70%;">
        <asp:ImageButton ID="CreateButton" ImageUrl="Images/ButtonAddItem.png" Style="float: right;
            margin-right: 6px;" runat="server" OnClientClick="editSchemaItem('','');" />
        <strong>Add &amp; Edit Items</strong> for this Schema</div>
    <!-- Protocol Listings Header -->
    <div id="MainTableHolder">
        <table cellpadding="0" cellspacing="0" border="0" width="70%" style="margin: auto auto auto auto;">
            <tr class="BlueListBar">
                <td class="BlueListBar" style="width: 5%;">
                    <img src="Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;"
                        alt="Protocol List" />
                </td>
                <td class="BlueListBar" style="width: 5%;">
                    <asp:Label CssClass="HeaderItem" ID="LinkButtonItemOrder" runat="server" Text="Order"
                        ToolTip="Item Order" />
                </td>
                <td class="BlueListBar" style="width: 20%;">
                    <asp:Label CssClass="HeaderItem" ID="LinkButtonItemName" runat="server" Text="Item Name"
                        ToolTip="Item Name" />
                </td>
                <td class="BlueListBar" style="width: 20%;">
                    <asp:Label CssClass="HeaderItem" ID="LinkButtonItemType" runat="server" Text="Item Type"
                        ToolTip="Item Type" />
                </td>
                <td class="BlueListBar" style="width: 5%; text-align: right;">
                    <img src="Images/HeaderBarBlueRight.gif" width="6" height="35" />
                </td>
            </tr>
            <tr>
                <td colspan="5" align="center" style="vertical-align: top; padding: 0px;">
                    <div runat="server" id="ContentTableHolder" style="border: 1px solid #cccccc; border-top: none;
                        overflow: auto; overflow-x: hidden; height: 200px; margin-top: 0px; width: 99%;">
                        <!-- Table Containing Schema Items, ability to overflow -->
                        <table id="SchemaItemsTable" class="SchemaItemsTable" cellpadding="0" cellspacing="0"
                            border="0" width="100%">
                            <tbody>
                                <asp:Repeater runat="server" ID="SchemaItemsListRptr" OnItemDataBound="PopulateValues">
                                    <ItemTemplate>
                                        <tr id="_tr_<%# Eval("SchemaItemId") %>" class="<%# Container.ItemIndex%2==0?"dataGridItemRowA":"dataGridItemRowB" %>">
                                            <td style="width: 5%;">
                                                &nbsp;
                                                <asp:HiddenField runat="server" ID="SchemaItemId" Value='<%# Eval("SchemaItemId") %>' />
                                            </td>
                                            <td style="width: 5%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;">
                                                <div class="SortWrapper">
                                                    <asp:TextBox runat="server" ID="ItemOrder" CssClass="ItemOrder" Text='<%# Eval("ItemOrder") %>'
                                                        OnTextChanged="MarkSchemaItemDirty"></asp:TextBox>
                                                    <img src="../../Images/AdminImages/Button_WidgetUP.gif" alt="Sort Up" class="sortUp" />
                                                    <img src="../../Images/AdminImages/Button_WidgetDOWN.gif" alt="Sort Down" class="sortDown" />
                                                </div>
                                            </td>
                                            <td style="width: 20%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;">
                                                <span id="infoText_<%# Eval("SchemaItemId") %>" class="infoText" onclick="return editSchemaItem(<%# Eval("SchemaItemId") %>, '<%# Eval("DestTable")%>');"
                                                    onmouseover="showItemInfo('<%# Eval("SchemaItemId") %>');">
                                                    <%# Eval("ItemDescription")%>
                                                </span>
                                                <div class="infoPopUpDiv" id="infoDiv_<%# Eval("SchemaItemId") %>" onmouseout="hideItemInfo(this, event);">
                                                    <table cellpadding="0" cellspacing="0" class="infoPopUpTable">
                                                        <tr>
                                                            <td class="infoPopUpTop">
                                                                <div style="width: 220px;">
                                                                    Item Details:
                                                                    <%# Eval("ItemDescription")%>
                                                                </div>
                                                                <img alt="Close" title="Close" src="Images/Close_white.gif" onclick="hideItemInfo($('infoDiv_<%# Eval("SchemaItemId") %>'));"
                                                                    style="cursor: pointer; position: absolute; top: 15px; right: 15px;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="infoPopUpMiddle">
                                                                <div class="infoPopUpContent_subtitle">
                                                                    <%# Eval("DestTable")%></div>
                                                                <div id="selectedFieldListing_<%# Eval("SchemaItemId") %>" class="infoPopUpContent_selectedFieldListing">
                                                                    <table cellpadding="0" cellspacing="0" class="infoPopUpContentTable">
                                                                        <asp:Repeater runat="server" ID="PresetListRptr">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td class="infoPopUpContentCol1">
                                                                                        <%# Eval("FieldLabel")%>
                                                                                    </td>
                                                                                    <td class="infoPopUpContentCol2">
                                                                                        <%# Eval("DestValue")%>
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                        <asp:Repeater runat="server" ID="CollectVisitRepeater">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td class="infoPopUpContentCol1" style="color: #8d2a2c;">
                                                                                        <%# Eval("FieldLabel")%>
                                                                                    </td>
                                                                                    <td class="infoPopUpContentCol2" style="color: #8d2a2c; font-style: italic;">
                                                                                        Collect at Visit
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </table>
                                                                </div>
                                                                <div class="infoPopUpContent_subtitle">
                                                                    Child Table(s):
                                                                    <asp:Label ID="ChildTablesList" runat="server">None</asp:Label>
                                                                </div>
                                                                <table cellpadding="0" cellspacing="0" class="infoPopUpContentTable">
                                                                    <tr>
                                                                        <td class="infoPopUpContentCol2">
                                                                            <asp:Label ID="ChildTablesColumnList" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="infoPopUpBottom">
                                                                <img src="Images/shim.gif" width="1" height="1" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                            <td style="width: 20%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;">
                                                <span>
                                                    <%# Eval("DestTable")%>
                                                </span>
                                            </td>
                                            <td style="width: 5%;">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <input runat="server" id="HiddenSortOrder" type="hidden" value="ASC" />
                    <input runat="server" id="HiddenSortColumn" type="hidden" value="ProtocolNum" />
                </td>
            </tr>
            <tr>
                <td colspan="5" id="NavigationBtns">
                    <asp:Button runat="server" ID="PrevBtn" Text="Previous" CssClass="dataEntryButtonRed"
                        OnCommand="NavigateClick" CommandArgument="Prev" Style="float: left;" />
                    <asp:Button runat="server" ID="UpdateBtn" OnClick="UpdateSchemaItemsClick" Text="Update"
                        CssClass="dataEntryButtonRed" />
                    <asp:Button runat="server" ID="NextBtn" Text="Next" CssClass="dataEntryButtonRed"
                        OnCommand="NavigateClick" CommandArgument="Next" Style="float: right;" />
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        /* <![CDATA[ */
        onWindowResize();
        /* ]]> */
    </script>
    </form>
</body>
</html>
