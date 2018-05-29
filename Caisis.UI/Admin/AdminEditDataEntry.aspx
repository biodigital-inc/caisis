<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEditDataEntry.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminEditDataEntry" %>

<%@ Register TagPrefix="custom" TagName="ColumnDataEntry" Src="../Core/DataEntryForms/DataEntryControls/ColumnDataEntry.ascx" %>
<%@ Register TagPrefix="custom" TagName="GridDataEntry" Src="../Core/DataEntryForms/DataEntryControls/GridDataEntry.ascx" %>
<%@ Register TagPrefix="custom" TagName="TabDataEntry" Src="../Core/DataEntryForms/DataEntryControls/TabDataEntry.ascx" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="metadata" TagName="tooltip" Src="../Core/DataEntryForms/DataEntryControls/MetadataTooltip.ascx" %>
<%@ Register TagPrefix="filter" TagName="SearchFilter" Src="ListFilter_Control.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>

    <script src="../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>
    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript">
        /* <![CDATA[ */
        
                
        top.APP_PATH = '<%= Page.ResolveUrl("~/") %>';
        var imgDir = "../Images/Calendar/"

        
        

        // resize main data entry
//        Browser.ResizeElement({ nodeId: 'MainInterface', heightOffset: 200 });

        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            // scroll to active table LI
            var scrollX = '<%= ScrollX %>';
            if (scrollX && scrollX != '') {
                jQuery('#adminBoxNavListContainer').scrollTop(parseInt(scrollX));
            }
            // adjust tooltip
            var tooltips = jQuery('.EditDataEntryField_Tooltip');
//            jQuery(document.body).append(tooltips).click(function() {
//                tooltips.each(function(i, t) { _hideMetadataTooltip(t); }); ;
//            });
            
            // adjust main content height
            adjustMainContentScroll();        
            jQuery(window).resize(adjustMainContentScroll);

            // add hover
            if ($('EditEFormMainContent')) {
                addHoverToDataEntryFields($('EditEFormMainContent'));
            }
            
            // more tabs
            if (jQuery('.PDMoreTab').length > 0) {
                var moreItems = jQuery('#moreMenuContainer');
                jQuery('.PDMoreTab').click(function() {
                    moreItems.css('display', 'block');
                });
                jQuery('#moreMenuContainer').mouseleave(function() {
                    moreItems.css('display', 'none');
                });
            }
        });

        function adjustMainContentScroll() {
            var winHeight = jQuery(window).height() - 150;
            var mainContainer = jQuery('#EditEFormMainContent');
            mainContainer.css('max-height', Math.max((winHeight-200), 100) + 'px');
            var formListContainer = jQuery('#adminBoxNavListContainer');
            formListContainer.css('max-height', (winHeight+50) + 'px');
        }

        function lockTableMetadata() {
        }

        function unlockTableMetadata() {
            jQuery('.DisplayMetadataField').addClass('hidden');
            jQuery('.EditMetadataField').removeClass('hidden');

            return false;
        }

        function saveTableMetadata() {
        }

        // manages the current tables by diseaes
        function manageDiseaseTables() {
            var diseaseId = jQuery('#CurrentDiseaseId').val();
            var diseaseName = jQuery('#CurrentDiseaseName').val();
            var title = '<%= ManageTablesBtn.InnerText %>';
            var url = 'Table_EditForms.aspx?diseaseId=' + diseaseId;
            top.showModalWithConfig(url, title, { width: 650, height: 500 });
            return false;
        }

        // edits all table metadata with current table selected
        function editTableMetadata() {
               var tableId = jQuery('#CurrentTableId').val();
                var diseaseId = '<%= QueryDiseaseId %>';
                var url = 'AdminEditTableMetadata.aspx?tableId=' + tableId + '&diseaseId=' + diseaseId;;
                var title = 'Edit Table Metadata';
                top.showModalWithConfig(url, title, { width: 1000, height: 650 });
            return false;
        }

        // edits the current table's metadata
        function editTableFieldsMetadata(selectedField) {
            var tableId = jQuery('#CurrentTableId').val();
            if (tableId && tableId != '') {
                var diseaseId = '<%= QueryDiseaseId %>';
                var url = 'AdminEditFieldMetadata.aspx?tableId=' + tableId + '&diseaseId=' + diseaseId;
                var title = 'Edit <%= GetTableLabel(TableName) %> Form';
                top.showModalWithConfig(url, title, { width: '100%', height: '100%' });
            }
            return false;
        }

        var activeMetadataTooltip = null;
        var activeMetadataTooltipDelay = null;
        
        function showMetadataTooltip(text, label, table, field, e) {
            if (e && (e.srcElement || e.target).nodeName.toUpperCase() != 'INPUT'&& (e.srcElement || e.target).nodeName.toUpperCase() != 'SELECT')
            {
                if (activeMetadataTooltipDelay) {
                    clearTimeout(activeMetadataTooltipDelay);
                    activeMetadataTooltipDelay = null;
                }
                if (activeMetadataTooltip) {
                    _hideMetadataTooltip(activeMetadataTooltip);
                    activeMetadataTooltip = null;
                }
                var lab = jQuery(label);
                var tooltip = jQuery('#Metadata_' + table + '_' + field + '_Tooltip');
                var position = lab.offset();
                tooltip.show().css({ left: position.left - 70 , top: position.top + 20 });
                // set active tooltip
                activeMetadataTooltip = tooltip;
            }
        }

        function hideMetadataTooltip(text, label, table, field, e) {
            var target = e ? (e.srcElement || e.target) : null;
            activeMetadataTooltipDelay = setTimeout(function() {
                var tooltip = jQuery('#Metadata_' + table + '_' + field + '_Tooltip');
                if (target && target != tooltip[0]) {
                    _hideMetadataTooltip(tooltip);
                    // clear active tooltip
                    activeMetadataTooltip = tooltip;
                }
            }, 0);
        }
        
        function _hideMetadataTooltip(tooltip) {
            jQuery(tooltip).hide();
        }

        function loadTableForm(li, newUrl) {
            var scrollX = jQuery('#adminBoxNavListContainer').scrollTop();
            window.location = newUrl + '&scrollX=' + scrollX;
            return false;
        }
        
        /* ]]> */
    </script>
    <style type="text/css">
        .DisplayMetadataField
        {
        }
        .EditMetadataField
        {
        }
        .hidden
        {
            display: none;
        }
        
        #mainAdminBox
        {
            padding-top: 0px;
        }
        #TableList a
        {
            padding-left: 5px;
            display: inline-block;
        }
        .AdminBoxNavListIcon
        {
            float: left;
            display: block;
            width: 11px;
            height: 11px;
            vertical-align: baseline;
            margin-left: -16px;
        }
        .FilterSearchBox
        {

        }
        #MoreTabAndMenuContainer
    {
        display: inline;
        position: relative;
    }
    #MoreTab
    {
    }
    #moreMenuContainer
    {
        position: absolute;
        z-index: 5000;
        top: -11px;
        right: -34px;
        width: 224px;
        background-image: url(../Images/MoreMenuBG_top.png);
        background-repeat: no-repeat;
        display: none;  
    }
    #moreMenuContainer div#patientDataMenuTitleBar
    {
        font-family: Arial, Helvetica, sans-serif;
	    font-size: 11px;
	    font-weight: bold;
	    color: #333333;
	    text-align: right;
	    padding: 11px 43px 0px 0px;
	    height: 28px;
    }
    #moreMenuContainer div#patientDataMenuContents
    {
        background-image: url(../Images/MoreMenuBG_bottom.png);
        background-repeat: no-repeat;
        background-position: center bottom;
        min-height: 40px;
        padding: 0px 10px 14px 8px;
    }
    #moreMenuContainer div#patientDataMenuContents a
    {
        background-image: url(../Images/PatientDataMenuWidget_right.png);
        background-repeat: no-repeat;
        background-position: 7px 8px;
        display: block;
        font-family: Arial, Helvetica, sans-serif;
	    font-size: 11px;
	    font-weight: normal;
	    color: #666666;
	    padding: 3px 3px 3px 16px;
	    cursor: pointer;
	    text-decoration: none;
	    
	    
    }
    #moreMenuContainer div#patientDataMenuContents a:hover
    {
        background-image: url(../Images/PatientDataMenuWidget_right_on.png);
        background-color: #DFE2E6;
	    color: #000000;
    }
    
    
    
    #moreMenuContainerNoTabs
    {

    }
    #moreMenuContainerNoTabs div#patientDataMenuTitleBar
    {
        display: none;
    }
    #moreMenuContainerNoTabs div#patientDataMenuContents
    {
        min-height: 40px;
        padding: 10px 0px 0px 0px;
    }
    #moreMenuContainerNoTabs div#patientDataMenuContents a
    {
        background-image: url(../Images/PatientDataMenuWidget_right.png);
        background-repeat: no-repeat;
        background-position: 12px 8px;
        font-family: Arial, Helvetica, sans-serif;
	    font-size: 11px;
	    font-weight: normal;
	    color: #666666;
	    padding: 3px 3px 3px 22px;
	    cursor: pointer;
	    text-decoration: none;
	    
	    margin-left: 2px;
	    margin-right: 2px;
	    width: 45%;
	    display: inline-block;
	    zoom:1;
	    *display: inline;
	    
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        -khtml-border-radius: 3px;
        border-radius: 3px;

	    
    }
    #moreMenuContainerNoTabs div#patientDataMenuContents a:hover
    {
        background-image: url(../Images/PatientDataMenuWidget_right_on.png);
        background-color: #DFE2E6;
	    color: #000000;
    }
     /* more tabs */
    #EditEFormMainContent .EditDataEntryForm_MoreTabLayer
    {
        display: none;
        position: absolute;
        top: 20px;
        left: 0px;
        z-index: 100;
        min-width: 150px;
        background-color: #ffffff;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding-top: 3px;
        padding-bottom: 3px;
    }
    #EditEFormMainContent .EditDataEntryForm_MoreTabLayer a
    {
        display: block;
        color: #aaa;
        text-decoration: none;
        padding: 2px 5px;
    }
    #EditEFormMainContent .EditDataEntryForm_MoreTabLayer a:hover
    {
        color: #000;
        background-color: #ccc;
    }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="CurrentDiseaseId" />
    <asp:HiddenField runat="server" ID="CurrentDiseaseName" />
    <asp:HiddenField runat="server" ID="CurrentTableId" />
    <div id="SelectFormBox" class="adminNavBoxContainer" style="width: 200px;">
        <asp:Label runat="server" ID="ListTitle" CssClass="adminNavBoxContainerTitle" Text="All Data Entry Forms"></asp:Label>
        <div id="mainAdminBox" class="adminBox" >
            <filter:SearchFilter ID="SearchBox" runat="server" ListId="TableList"  />
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;word-wrap: break-word;">
                <ul id="TableList" class="adminBoxNavList">                    
                    <asp:Repeater runat="server" ID="TablesByDiseaseRptr" OnItemDataBound="SetDiseaseListUI">
                        <ItemTemplate>
                            <li id="TableItem_<%# Eval("TableId") %>" title="Table: <%# Eval("TableName").ToString() %>" class="<%# IsDefaultTable((int)Eval("TableId"), Container.ItemIndex) ? "selected" : (Container.ItemIndex % 2 == 0 ? "alternate" : "") %>"
                                onclick="return loadTableForm(this, 'AdminEditDataEntry.aspx?diseaseId=<%= QueryDiseaseId %>&tableId=<%# Eval("TableId") %>');"
                                  style="padding-left: <%# 18 + (int)Eval("TableDepth") * 10 %>px"><asp:Image runat="server" CssClass="AdminBoxNavListIcon" ToolTip="Disease specific table"
                                    ID="TableSpecificIcon" ImageUrl="~/Images/shim.gif" /><%# Eval("TableLabel") %></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <span runat="server" id="NoTablesMessage" visible="false">No data entry forms have been customized for this disease view.<br /><br />Click <strong>Manage Tables</strong> below to select forms you would like to customize for this disease.</span>
            </div>
        </div>
        <span runat="server" id="ManageTablesBtn" class="dataEntryButtonGray NavListFooterButton" title="Add/Remove Data Entry Forms"
            onclick="return manageDiseaseTables();">Add/Remove Data Entry Forms</span>
    </div>
    
        
    <div id="EditFormBox" runat="server" visible="false">
        <span onmouseover="showMetadataTooltip(this.title, this,'<%= Table %>','',event);"
            onmouseout="hideMetadataTooltip(this.title, this,'<%= Table %>','',event);" onclick="return editTableFieldsMetadata('');" style="cursor: help;">
            <asp:Image runat="server" ID="MainTableSpecificIcon" ImageUrl="~/Images/shim.gif" />
            <asp:Label runat="server" ID="MainLabel" CssClass="adminNavBoxContainerTitle"></asp:Label>:
            <asp:Label runat="server" ID="TableDescLabel"></asp:Label>
        </span>       
<div id="MainInterface" class="adminBox" >
    <div class="adminBoxHeaderArea">
        <strong>Include Subforms: </strong>
        <label>
            <asp:Label runat="server" ID="SubFormsLabel"></asp:Label></label>
        <strong style="margin-left: 50px;">Layout: </strong>
        <label>
            <asp:Label runat="server" ID="TableLayoutType" Text=""></asp:Label></label>
<%--        <asp:DropDownList runat="server" ID="EditTable_DisplayAsGrid" CssClass="EditMetadataField hidden">
            <asp:ListItem Text="No" Value="false"></asp:ListItem>
            <asp:ListItem Text="Yes" Value="false"></asp:ListItem>
        </asp:DropDownList>--%>
<%--        <strong style="margin-left: 50px;">Columns: </strong>
        <label>
            <asp:Label runat="server" ID="TableColumnCount" Text="N/A"></asp:Label></label>--%>
    </div>
        <metadata:tooltip runat="server" ID="MainMetaTooltip" />
<%--<div class="EditFormBoxHelpSection">
Mouseover a field to view metadata.
<img src="../Images/AdminImages/AdminButton_AddEditFields.png" style="vertical-align: text-bottom; margin-left: 100px; cursor: pointer;" onclick="return editTableFieldsMetadata();" />

</div>--%>


        <div id="EditEFormMainContent" style="position: relative;">
            <%-- Main Data Entry form --%>
            <asp:PlaceHolder runat="server" ID="MainDataEntry"></asp:PlaceHolder>
            <%-- Child Data Entry forms --%>
            <asp:PlaceHolder runat="server" ID="ChildTableContainer">
                <custom:TabDataEntry runat="server" ID="Tabs" />
            </asp:PlaceHolder>
        </div>


<div class="EditFormBoxHelpSection" style="text-align: center;">
<span class="dataEntryButtonGray largeButton" runat="server" id="MainDataEntryEditBtn" onclick="return editTableFieldsMetadata('');" style="min-width: 175px; font-size: larger;">Edit this Form</span>
<%--<img src="../Images/AdminImages/AdminButton_AddEditFields.png" style="cursor: pointer;" />
--%></div>
<%--        <div id="EditEFormMainContentFooter">
            Additional Subforms</div>
--%>        
        <div id="ChildDataEntryTables" style="vertical-align: top;">
            
        </div>
    </div>
    <span style="position: absolute; right: 10px;"><img alt="Disease Customized" title="customized for this disease" src="../Images/AdminImages/AdminIcon_CustomizedField.png" style="vertical-align: baseline; margin-right: 5px; cursor: pointer;"  />customized for this disease</span>
    </div>
    </form>
</body>
</html>
