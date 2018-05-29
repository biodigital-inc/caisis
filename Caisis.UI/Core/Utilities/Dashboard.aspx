<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Caisis.UI.Core.Utilities.Dashboard" %>
<%@ Register TagPrefix="uc1" TagName="pageHeader" Src="~/Core/Header/PageHeader.ascx" %>
<%@ Import Namespace="Caisis.UI.Core.Utilities.Widget" %>
<%@ Register TagPrefix="widget" TagName="DatasetWidget" Src="~/Core/Utilities/Widgets/YourDataSetsWidget.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Welcome to the Caisis Data Management System</title>
    <meta content="NOINDEX" name="ROBOTS" />
    <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE" />
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../../ClientScripts/jquery-ui.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        // supress conflict with caisis specific $ object
        jQuery.noConflict();

        // a list of widget states used for updating hidden state values
        var WIDGET_STATES =
        {
            Opened: "<%= WidgetState.Opened.ToString() %>",
            Collapsed: "<%= WidgetState.Collapsed.ToString() %>",
            Hidden: "<%= WidgetState.Hidden.ToString() %>"
        };

        // jQuery selector representing all widgets
        var ALL_WIDGETS_SELECTOR = ".widget_Active,.widget_Inactive";

        // toggles the state of a widget
        // @widgetContainer: the DOM/selector reference of the widget
        // @e: optional event object
        function toggleWidget(widgetContainer, e) {
            if (jQuery(widgetContainer).hasClass('widget_Active')) {
                hideWidget(widgetContainer);
            }
            else if (jQuery(widgetContainer).hasClass('widget_Inactive')) {
                showWidget(widgetContainer);
            }
            // prevent bubbling
            e.stopPropagation();
        }

        // shows a widget and adjusts styles
        // @container: the DOM/selector reference of the widget
        function showWidget(widgetContainer) {
            _showHideWidget(widgetContainer, true);
        }

        // hides a widget and adjusts styles
        // @container: the DOM/selector reference of the widget
        function hideWidget(widgetContainer) {
            _showHideWidget(widgetContainer, false);
        }
        
        function _showHideWidget(widgetContainer, doShow) {
            var nameField = jQuery(widgetContainer).find('input[name*="WidgetName"]'); 
            var stateField = jQuery(widgetContainer).find('input[name*="StateField"]'); 
            var widgetContent = jQuery(widgetContainer).find(".widgetContentOuterContainer");

            var widgetName = nameField.val();
            var widgetState = doShow ? WIDGET_STATES.Opened : WIDGET_STATES.Collapsed;
            var preClass = doShow ? 'widget_Inactive' : 'widget_Active';
            var postClass = !doShow ? 'widget_Inactive' : 'widget_Active';
            // update UI
            widgetContent['slide' + (doShow ? 'Down' : 'Up')]('fast', function() {
                jQuery(widgetContainer).removeClass(preClass).addClass(postClass);
            });
            // update state
            stateField.val(widgetState);
            // update user state preference
            _updateUserWidgetPreference(widgetName, widgetState);
        }

        function updateUserWidgetCheckBox(widgetName, isChecked) {
            // get widget
            var widget = jQuery('#Widget_' + widgetName);
            // show/hide widget
            if (widget.size() > 0) {
                if (isChecked) {
                    //widget.fadeIn();
                }
                else {
                    //widget.fadeOut();
                }
 //               splitWidgetsInColumns();
            }
            _updateUserWidgetPreference(widgetName, isChecked ? WIDGET_STATES.Opened : WIDGET_STATES.Hidden);
        }
        
        // update user widget prefernce via POST
        // @widgetName: name of the widget
        // @widgetState: the widget state 'Open', 'Collapsed'. etc...
        function _updateUserWidgetPreference(widgetName, widgetState) {
            jQuery.post('Dashboard.aspx', { 'widgetName': widgetName, 'widgetState': widgetState });
        }       
                
        // shows all widgets
        function showAllWidgets() {
            jQuery(ALL_WIDGETS_SELECTOR).each(function(index, widget) {
                showWidget(widget);
            });
        }

        // hides all widgets
        function hideAllWidgets() {
            jQuery(ALL_WIDGETS_SELECTOR).each(function(index, widget) {
                hideWidget(widget);
            });
        }

        // shows widget customization panel
        function showCustomizeWidgets() {
            jQuery("#customizePanel").show();
        }

        // hides widget customization panel
        function hideCustomizeWidgets() {
            jQuery("#customizePanel").hide();
        }

        // shows the dataset selector
        function showDatasetSelector() {
            jQuery('#DataSetSelectorMenu').show();
        }

        // hides the dataset selector
        function hideDataSetSelectorMenu() {
            jQuery('#DataSetSelectorMenu').hide();
        }

        // initilizes widget by adding event handlers
        function initilizeWidgets() {
            // WIDGET EVENTS
            // clicking on toggle icon or title, toggle show/hide
            jQuery(ALL_WIDGETS_SELECTOR).each(function(index, widget) {
                // toggle on icon click
                var toggleBtn = jQuery(widget).find(".widgetToggle");
                toggleBtn.click(function(e) {
                    toggleWidget(widget, e);
                });
                // only show when title clicked
                var titleBar = jQuery(widget).find(".widgetTitleBar");
                titleBar.click(function(e) {
                    showWidget(widget);
                });
            });
            // split widgets
            splitWidgetsInColumns();

            // DATASET SELECTOR EVENTS
            jQuery("#DataSetSelectorTableLeft").click(showDatasetSelector);
            jQuery("#DataSetSelectorMenu").mouseleave(hideDataSetSelectorMenu);


            // CUSTOMIZE PANEL EVENTS
            jQuery("#customizePanel").draggable();
        }

        // splits widgets between left and right columns
        function splitWidgetsInColumns() {
            // get all widgets in left column
            var widgets = jQuery("#dashboardLeftColumn").find(ALL_WIDGETS_SELECTOR);
           
            // special widget (remove from full list)
            var dataSetWidget = jQuery("#Widget_YourDataSetsWidget");
            if(dataSetWidget.size() > 0) {
                widgets = widgets.filter(':not(#Widget_YourDataSetsWidget)');
            }
                   
            // if there are widgets, split up widgets
            var widgetCount = widgets.size();
            if (widgetCount > 0) {
                // get right columns
                var rightColumn = jQuery("#dashboardRightColumn");
                
                // add special widget
                rightColumn.append(dataSetWidget);
                
                // account for main task panel, shift widgets to the right
                // 5 -> left: 2, right: 3
                // 4 -> left: 1, right: 3
                var splitAfterIndex = Math.floor(widgetCount / 2);
                var move = widgets.filter(":gt(" + splitAfterIndex + ")");
                rightColumn.append(move);
            }
        }
        
        
        
        function showSelectPatientPanel(PanelType)
		{
			if (PanelType == 'EFORM' || PanelType == 'EFORMS')
			{
				document.getElementById('PanelTop').src = '../../Images/EnterAnElectronicFormTop.gif';
				
				if (document.getElementById('CurrentPatientPanelLink'))
				{
					document.getElementById('CurrentPatientPanelLink').href = '../Eforms/Index.aspx?eform=Prostate+Surgery+EForm';
				}
				
				PanelType = 'EForm';
			}
			else
			{
				document.getElementById('PanelTop').src = '../../Images/ViewEnterPatientDataTop.gif';
				if (document.getElementById('CurrentPatientPanelLink'))
				{
					document.getElementById('CurrentPatientPanelLink').href = '../DataEntryForms/index.aspx';
				}
				
			}
			SearchTarget.value = PanelType;
			MM_showHideLayers('ViewEditPatient','','show');
			document.getElementById('splashSearchWords').focus();
		}
        
        function toggleWidgetCheckbox(cbId,widgetName)
        {
            var cb = $(cbId);
            cb.checked = !(cb.checked);
            updateUserWidgetCheckBox(widgetName, cb.checked);
        }
          
        /* ]]> */
    </script>

<style type="text/css">
body
{
	background-color: #f8fafc;
	padding: 0px 0px 0px 0px;
	margin: 0px 0px 0px 0px;
}
th
{
    font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 12px;
	font-weight: bold;
	color: #000000;
	text-align: left;
	padding-left: 18px;
}
#DashboardTitleBar
{
	background-image:url(../../Images/DashboardTitleBar_Left.png);
	background-repeat: no-repeat;
	background-position: left top;
	height: 29px;
	width: 95%;
	margin: 10px auto 10px auto;
	clear: both;
	white-space: nowrap;
}
#DashboardTitleBarRightEnd
{
	background-image:url(../../Images/DashboardTitleBar_Right.png);
	background-repeat: no-repeat;
	background-position: right top;
	float: right;
	height: 29px;
	width: 13px;
	clear: none;
	font-size: 1px;
	line-height: 1px;
}
#DashboardTitleBarText
{
	color: #5D5E5F;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 17px;
	line-height: 17px;
	padding-top: 5px;
	margin-left: 29px;
	clear: none;
}
#DashboardTitleBarButtonContainer
{
	float: right;
	clear: none;
	font-size: 1px;
	line-height: 1px;
}
#DataSetSelectorTable
{
	margin: -2px 0px 0px 0px;
}
#DataSetSelectorTable td
{
	padding: 0px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	line-height: 13px;
	color: #606162;

}
#DataSetSelectorTableLeft
{
	background-image:url(../../Images/DashboardTitleBarSelector_Left.png);
	background-repeat: no-repeat;
	background-position: left top;
	cursor: pointer;
}

#DataSetSelectorTableLeft span.CurrentSelection
{
	margin-left: 8px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	line-height: 13px;
	color: #333333;
}
#DataSetSelectorTableRight
{
	background-image:url(../../Images/DashboardTitleBarSelector_Right.png);
	background-repeat: no-repeat;
	background-position: right top;
	float: right;
	height: 23px;
	width: 27px;
	font-size: 1px;
	line-height: 1px;
	padding: 0px;
	cursor: pointer;
}
#dashboardLeftColumn
{
	float:left;
	width:45%;
	margin-left: 3%;
}
#dashboardRightColumn
{
	float:right;
	width:45%;
	margin-right: 3%;
}
.widget_Active
{
	margin-top: 12px;
	min-width: 400px;
}
.widget_Inactive
{
	margin-top: 12px;
}
.widget_Inactive div.widgetContentOuterContainer
{
	display: none;
}
.widget_Active div.widgetContentOuterContainer
{
	display: block;
	background-image:url(../../Images/DashboardWidgetContainer_Main.gif);
	background-repeat: no-repeat;
	background-position: left top;
	margin-left: 7px;
}
.widgetContentRightBorder
{
	background-image:url(../../Images/DashboardWidgetContainer_TopRIght.gif);
	background-repeat: no-repeat;
	background-position: right top;
}
.widgetContentBottomBorder
{
	background-image:url(../../Images/DashboardWidgetContainer_BottomLeft.gif);
	background-repeat: no-repeat;
	background-position: left bottom;
}
.widgetContentInnerContainer
{
	background-image:url(../../Images/DashboardWidgetContainer_BottomRight.gif);
	background-repeat: no-repeat;
	background-position: right bottom;
	padding: 10px 11px 10px 11px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: normal;
	color: #333333;
}

.widget_Active div.widgetTitleBar
{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	line-height: 29px;
	font-weight: bold;
	color: #666666;
	height: 31px;
	padding-left: 9px;
	white-space: nowrap;
}
.widget_Inactive div.widgetTitleBar
{
	background-image:url(../../Images/DashboardWidgetTitleBarOff_Left.gif);
	background-repeat: no-repeat;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	line-height: 29px;
	font-weight: bold;
	color: #666666;
	height: 31px;
	padding-left: 9px;
	white-space: nowrap;
}
.widget_Inactive div.widgetTitleBar:hover
{
	background-image:url(../../Images/DashboardWidgetTitleBarOff_Left.gif);
	background-repeat: no-repeat;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	line-height: 29px;
	font-weight: bold;
	color: #8C2A2C;
	height: 31px;
	padding-left: 9px;
	cursor: pointer;
}


.widget_Inactive img.widgetToggle
{
	background-image:url(../../Images/DashboardWidget_Show.png);
	background-repeat: no-repeat;
	width: 15px;
	height: 13px;
	float: right;
	margin: 8px 6px 0px 0px;
	cursor: pointer;
}

.widget_Active img.widgetToggle
{
	background-image:url(../../Images/DashboardWidget_Hide.png);
	background-repeat: no-repeat;
	width: 15px;
	height: 13px;
	float: right;
	margin: 8px 6px 0px 0px;
	cursor: pointer;
}
.widget_Active img.widgetTitleBarRightEnd
{
	background-image: none;
	width: 5px;
	height: 31px;
	float: right;
}
.widget_Inactive img.widgetTitleBarRightEnd
{
	background-image:url(../../Images/DashboardWidgetTitleBarOff_Right.gif);
	background-repeat: no-repeat;
	width: 5px;
	height: 31px;
	float: right;
}
.widget_Inactive div.widgetTitleBar:hover img.widgetTitleBarRightEnd
{
	background-image:url(../../Images/DashboardWidgetTitleBarOff_Right.gif);
	background-repeat: no-repeat;
	width: 5px;
	height: 31px;
	float: right;
}

.widget_Active div.widgetTitleBar img.widgetIcon
{
	background-repeat: no-repeat;
	background-position: left 3px;
	width: 20px;
	height: 31px;
	vertical-align: middle;
	margin-right: 4px;
	margin-bottom: 1px;
}
.widget_Inactive div.widgetTitleBar img.widgetIcon
{
	background-repeat: no-repeat;
	background-position: left 3px;
	width: 20px;
	height: 31px;
	vertical-align: middle;
	margin-right: 4px;
	margin-bottom: 1px;
}
.widget_Active div.widgetTitleBar span.widgetOptionalHelpText
{
	display: inline;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	line-height: 11px;
	color: #999999;
	margin-left: 46px;
}
.widget_Inactive div.widgetTitleBar span.widgetOptionalHelpText
{
	display: none;
}


#DataSetSelectorMenu
{
	display: none;
	position: absolute;
	z-index: 5000;
	margin-top: -3px;
	margin-left: 0px;
}
.DataSetSelectorMenuTopContainer
{
	background-image:url(../../Images/DashboardTitleBarSelectorMenu_Right.png);
	background-position: right top;
	background-repeat: no-repeat;
	padding-right: 27px;
}
.DataSetSelectorMenuTop
{
	background-image:url(../../Images/DashboardTitleBarSelectorMenu_Left.png);
	background-position: left top;
	background-repeat: no-repeat;
	height: 20px;
	padding-top: 5px;
	padding-left: 6px;
	font-size: 11px;
}
.DataSetSelectorMenuItemContainer
{
	background-image:url(../../Images/DashboardTitleBarSelectorMenu_Right.png);
	background-position: right center;
	background-repeat: no-repeat;
	padding-right: 15px;
}
.DataSetSelectorMenuItemContainer div.DataSetSelectorMenuItem
{
	background-image:url(../../Images/DashboardTitleBarSelectorMenu_Left.png);
	background-position: left center;
	background-repeat: no-repeat;
	padding-top: 3px;
	padding-bottom:3px;
	padding-left: 6px;
	font-size: 11px;
}
.DataSetSelectorMenuItemContainer:hover
{
	background-image:url(../../Images/DashboardTitleBarSelectorMenuItemHighlight_Right.png);
	background-position: right center;
	background-repeat: no-repeat;
	padding-right: 15px;
}
.DataSetSelectorMenuItemContainer:hover div.DataSetSelectorMenuItem
{
	background-image:url(../../Images/DashboardTitleBarSelectorMenuItemHighlight_Left.png);
	background-position: left center;
	background-repeat: no-repeat;
	padding-top: 3px;
	padding-bottom:3px;
	padding-left: 6px;
	font-size: 11px;
	color: #111111;
}
.DataSetSelectorMenuItemContainer a
{
    text-decoration: none;
    color: #000000;
}
.DataSetSelectorMenuItemContainer a:hover
{
	color: #111111;
}
.DataSetSelectorMenuBottomContainer
{
	background-image:url(../../Images/DashboardTitleBarSelectorMenu_Right.png);
	background-position: right bottom;
	background-repeat: no-repeat;
	padding-right: 27px;
}
.DataSetSelectorMenuBottom
{
	background-image:url(../../Images/DashboardTitleBarSelectorMenu_Left.png);
	background-position: left bottom;
	background-repeat: no-repeat;
	height: 14px;
	padding-top: 5px;
	padding-left: 6px;
	font-size: 1px;
	line-height: 1px;
	display: block;
}
.DashboardScrollingList
{
	overflow: auto;
	overflow-x: hidden;
	border: solid 1px #cccccc;
	max-height: 135px;
	margin-bottom: 2px;
}
.DashboardScrollingListTable
{
	width: 100%;
	table-layout: fixed;
}
.DashboardScrollingListRowTypeA td
{
	background-color: #E0EBF1;
	border-bottom: solid 1px #cccccc;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	line-height: 11px;
	font-weight: normal;
	color: #1F1F1F;
	padding-top: 6px;
	padding-bottom: 6px;
	padding-left: 18px;
}
.DashboardScrollingListRowTypeA:hover td
{
	background-color: #EEDFE0;
	border-bottom: solid 1px #c3c3c3;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	line-height: 11px;
	font-weight: normal;
	color: #000000;
	padding-top: 6px;
	padding-bottom: 6px;
	padding-left: 18px;
	cursor: pointer;
	
	
	*filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #D0C9D1),
		color-stop(0.47, #DBA5B2),
		color-stop(1, #EED2D9)
	);
	background-image: -moz-linear-gradient(
		center top,
		#D0C9D1 0%,
		#DBA5B2 47%,
		#EED2D9 100%
	);
	
	
}
.DashboardScrollingListRowTypeB td
{
	background-color: #F8FAFC;
	border-bottom: solid 1px #cccccc;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	line-height: 11px;
	font-weight: normal;
	color: #1F1F1F;
	padding-top: 6px;
	padding-bottom: 6px;
	padding-left: 18px;
}
.DashboardScrollingListRowTypeB:hover td
{
	background-color: #EEDFE0;
	border-bottom: solid 1px #c3c3c3;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	line-height: 11px;
	font-weight: normal;
	color: #000000;
	padding-top: 6px;
	padding-bottom: 6px;
	padding-left: 18px;
	cursor: pointer;
	
	*filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #D0C9D1),
		color-stop(0.47, #DBA5B2),
		color-stop(1, #EED2D9)
	);
	background-image: -moz-linear-gradient(
		center top,
		#D0C9D1 0%,
		#DBA5B2 47%,
		#EED2D9 100%
	);
	
}
.DashboardButton
{
	cursor: pointer;
	border: none;
}


#DashboardModuleButtonContainer
{
    max-height: 310px;
    overflow: auto;
    text-align: center;
}
div.DashboardModuleButton
{
	padding-right: 4px;
	margin-left: 2px;
	margin-right: 2px;
	width: 46%;
	min-width: 191px;
	display: inline-block;
	clear: both;
	zoom:1;
	*display: inline;
}
div.DashboardModuleButton:hover
{
	background-image:url(../../Images/DashboardModuleButtonHoverBG_Right.png);
	background-position: right top;
	background-repeat: no-repeat;
	cursor: pointer;
}
div.DashboardModuleButtonContentContainer
{
	padding-left: 10px;
	padding-top: 4px;
	height: 39px;
}
div.DashboardModuleButton:hover div.DashboardModuleButtonContentContainer
{
	background-image:url(../../Images/DashboardModuleButtonHoverBG_Left.png);
	background-position: left top;
	background-repeat: no-repeat;
}
div.DashboardModuleButtonContent
{
	padding-left: 39px;
	padding-top: 9px;
	padding-bottom: 9px;
	background-position: 0px 0px;
	background-repeat: no-repeat;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 12px;
	color: #202020;
	text-align: left;
	margin: 0px auto 0px auto;
}
div.DashboardModuleButton:hover div.DashboardModuleButtonContent
{
	color: #111111;
}
div.CustomizeUserWidgetsOption
{
	    margin: 2px 2px 6px 6px;
	    width: 45%;
	    display: inline-block;
	    zoom:1;
	    *display: inline;
	    
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        -khtml-border-radius: 3px;
        border-radius: 3px;
}
div.CustomizeUserWidgetsOption:hover
{
/*    background-color: #e8e8e8;
    color: #000000; */
}
</style>
    
    
    
    
</head>

<body style="margin: 0px 0px auto 0px">
<form id="form1" runat="server">

<div style="position: fixed; top: 0px; left: 0px; z-index: 10; width: 100%">
<uc1:pageheader id="PageHeader1" runat="server"></uc1:pageheader>
</div>
<div id="blueBarContainer" style="position: fixed; top: 70px; left: 0px; background-color: #3d556d; height: 23px; width: 100%; z-index: 9;">
<a href="javascript:;">
<img onclick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide')" hspace="15" src="../../Images/Header/CommonTasks.gif" border="0" vspace="3" align="middle"></a>
</div>


    <table cellspacing="0" cellpadding="0" width="100%" border="0" >



        <tr>
            <td style="vertical-align: top; padding-top: 98px;" >
            
                
<%--<div >
        <table id="DataSetSelectorTable" cellspacing="0">
        <tr>
        <td style="padding-right: 7px;">Dataset</td>
        <td id="DataSetSelectorTableLeft">
        
        <div id="DataSetSelectorMenu">
        <div class="DataSetSelectorMenuTopContainer"><div class="DataSetSelectorMenuTop">Select Dataset</div></div>
        
        <asp:Repeater ID="DatasetsSelector" runat="server">
        <ItemTemplate>
            <div class="DataSetSelectorMenuItemContainer"><div class="DataSetSelectorMenuItem"><asp:LinkButton runat="server" ID="DataSetBtn" OnCommand="OnDatasetChange" CommandArgument='<%# Eval("DatasetId") %>'><%# Eval("DatasetName") %></asp:LinkButton></div></div>
        </ItemTemplate>
        </asp:Repeater>
        <div class="DataSetSelectorMenuBottomContainer"><div class="DataSetSelectorMenuBottom">&nbsp;</div></div>
        </div>        
        <span class="CurrentSelection"><asp:Literal runat="server" ID="ActiveDataset"></asp:Literal></span></td>
        <td id="DataSetSelectorTableRight">&nbsp;</td>
        <td><img src="../../Images/DashboardIcon_Help.png" alt="What is a dataset?" style="margin-left: 4px; cursor: pointer;"/></td>
        </tr>
        </table>
</div>--%>




	<!--- View / Edit Patient Panel --->
	<div id="ViewEditPatient" align="center" style="position:absolute; width:776px; z-index:7; visibility: hidden; height:140px; top:130px;" runat="server">
	<input type="hidden" id="SearchTarget" name="SearchTarget" /> 
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	    <tr>
	        <td width="240">&nbsp;</td>
	        <td align="left" height="400">
	            <table cellpadding="0" cellspacing="0" border="0" width="400">
	                <tr>
		                <td colspan="6">
		                    <img id="PanelTop" name="PanelTop" src="../../Images/ViewEnterPatientDataTop.gif" height="37" width="400" border="0" /><br></td>
	                </tr>
	                <tr class="popupTable">
		                <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td ><img src="../../Images/shim.gif" height="1" width="20" border="0" /></td>
		                <td ><img src="../../Images/shim.gif" height="1" width="88" border="0" /></td>
		                <td ><img src="../../Images/shim.gif" height="1" width="10" border="0" /></td>
		                <td ><img src="../../Images/shim.gif" height="1" width="280" border="0" /></td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable">
		                <td  class="loginBorder" height="50" ><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td >&nbsp;</td>
		                <td colspan="3" class="popupAlertMedium" valign="bottom">Please select one of the options below.</td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable" id="ViewEditPatientSpacerRow1" runat="server">
		                <td  class="loginBorder" height="30"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td colspan="4">&nbsp;</td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable" id="SplashCurrentPatientTableRow" runat="server">
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td>&nbsp;</td>
		                <td colspan="3" class="popupLabel" style="TEXT-ALIGN: left" valign="bottom"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" /><asp:Label ID="SplashCurrentPatient" Runat="server">There is no patient currently selected.</asp:Label><br><img src="../../Images/shim.gif" height="14" width="19" border="0" /><a id="CurrentPatientPanelLink" name="CurrentPatientPanelLink" href="../DataEntryForms/index.aspx" class="popupAlertMedium"><asp:Literal ID="ViewEditPatientName" Runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MRN: <asp:Literal ID="ViewEditPatientMRN" Runat="server" /></a></td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
		            <tr class="popupTable">
		                <td  class="loginBorder" height="30"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td colspan="4">&nbsp;</td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable">
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td >&nbsp;</td>
		                <td colspan="3" class="popupLabel" style="text-align: left;"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" />Enter the patient's last name or MRN below:</td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable">
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td >&nbsp;</td>
		                <td colspan="3" class="popupLabel" style="text-align: center;" valign="bottom" height="35"><input type="text" id="splashSearchWords" class="popupField"  onkeyup="if (event.keyCode==13) { findPatientInHeader('splashSearchWords','ViewEditPatient'); }" onkeydown="if(event.keyCode==13) { return false; }" ><img hspace="10" align="middle" vspace="8" style="cursor: pointer;" src="../../Images/buttonFindPatient.gif" height="22" width="89" onclick="findPatientInHeader('splashSearchWords','ViewEditPatient');return false;" title="Find A Patient" alt="Find A Patient"  /></td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
                    <tr class="popupTable" id="ViewEditPatientSpacerRow2" runat="server">
	                    <td  class="loginBorder" height="30"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                    <td colspan="4">&nbsp;</td>
	                    <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
                    </tr>
	                <tr class="popupTable" id="SelectFromCurrentListTableRow" runat="server">
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td >&nbsp;</td>
		                <td colspan="3" class="popupLabel" style="text-align: left;"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" />Select a patient from the current list:<img hspace="10" align="absmiddle" vspace="8" src="../../Images/viewList.gif" height="22" width="80" onclick="MM_showHideLayers('currentList','','show','ViewEditPatient','','hide');" style="cursor: pointer;" /></td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable">
		                <td  class="loginBorder" height="30"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td colspan="4">&nbsp;</td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable">
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td >&nbsp;</td>
		                <td colspan="3" class="popupLabel" style="text-align: left;"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" /><strong>Or</strong>, go to the <a class="popupAlertMedium" href="../PatientLists/PatientListPage.aspx">Patient Lists</a> page to select a patient.<br><br></td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable">
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td colspan="4">&nbsp;</td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable">
		                <td  class="loginBorder" height="40"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td colspan="4" align="center"><img src="../../Images/ButtonCancel.gif" height="22" width="57" border="0"  style="cursor: pointer;" onclick="cancelSearch('splashSearchWords','ViewEditPatient');" /></td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable">
		                <td colspan="6"><img src="../../Images/ContactAdministratorBottom.gif" height="4" width="400" border="0" /><br></td>
	                </tr>
	            </table>
	        </td>
	    </tr>
	</table>
	</div>
    <!--- END - View / Edit Patient Panel --->


<div id="customizePanel" class="grayPanel">
<div class="grayPanelContentContainer">
<img class="grayPanelCloseButton" src="../../Images/shim.gif" onclick="hideCustomizeWidgets();" />
<img class="grayPanelTitleIcon" src="../../Images/GrayPanelIcon_CustomizeDashboard.png" />
<div class="grayPanelTitle">Customize Caisis Home Screen</div>
<div class="grayPanelContent">Select the widgets that you would like to have on the Caisis home screen. Place your cursor over a widget title to view a description.
    <div class="grayPanel_SubcontentBox">
            <div>
                <asp:Repeater runat="server" ID="UserWidgetsChooserRptr">
                    <ItemTemplate>
                        <div class="CustomizeUserWidgetsOption" title="<%# Eval("description")%>" ><%--  onclick="toggleWidgetCheckbox('WidgetChooser_Check_<%# Container.ItemIndex %>','<%# Eval("Name") %>');" --%>
                            <input type="checkbox" id="WidgetChooser_Check_<%# Container.ItemIndex %>" name="WidgetChooser_<%# Container.ItemIndex %>" <%# Eval("State").ToString() != "Hidden" ? "checked='checked'" : "" %> onclick="updateUserWidgetCheckBox('<%# Eval("Name") %>', this.checked);" />
                            <label for="WidgetChooser_Check_<%# Container.ItemIndex %>"><%# Eval("Title")%></label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <a title="Update Preferences" href="Dashboard.aspx" class="dataEntryButtonGray" style=" position: absolute; bottom: 0px; right: 0px; margin: 10px 35px;">Update Preferences</a>
 <%--        <asp:CheckBoxList runat="server" ID="UserWidgetsChooser" RepeatColumns="2" RepeatLayout="Table"
            RepeatDirection="Vertical" DataTextField="Title" DataValueField="Name">
        </asp:CheckBoxList>--%>
    </div>
<div class="grayPanel_SubcontentBoxBottom">&nbsp;</div>

<%--<div class="grayPanelFooterReminder"><strong>Remember:</strong> You can change the layout of your home screen by dragging the widgets around the screen by the title bars.</div>

<div class="grayPanelFooterButtonContainer">
<asp:ImageButton runat="server" ImageUrl="~/Images/CaisisButton_Save.png" AlternateText="Save" ID="UpdateUserWidgetsBtn" OnClientClick="return updateUserWidgetPreferences();" style="margin-right: 80px;" />
</div>--%>
</div>
</div>
<div class="grayPanelContentBottom">&nbsp;</div>
</div>






<div id="dashboardMainContent">
    <div id="dashboardLeftColumn">
    
    
 <!-- start widget -->
    <div class="widget_Active">
    <div class="widgetTitleBar" style="font-size: 13px; color: #8C2A2C; white-space: normal; overflow: hidden;" ><img src="../../Images/shim.gif" class="widgetTitleBarRightEnd" /><img src="../../Images/shim.gif" class="widgetToggle"/>Today is <% = System.DateTime.Now.ToLongDateString() %>.&nbsp;&nbsp;What would you like to do?<%--<span class="widgetOptionalHelpText">these are the primary tasks available to you</span>--%></div>
	<div class="widgetContentOuterContainer"><div class="widgetContentRightBorder"><div class="widgetContentBottomBorder">
	<div class="widgetContentInnerContainer">
		<div id="DashboardModuleButtonContainer">
		    <asp:Repeater ID="DashboardModulesList" runat="server" OnItemCreated="rptItemCreated" >
		        <ItemTemplate>
        	    <div class="DashboardModuleButton" id="moduleButtonDiv" runat="server" ><div class="DashboardModuleButtonContentContainer"><div class="DashboardModuleButtonContent" style="background-image:url(../../Images/<%# Eval("Icon") %>);"><%# Eval("TabDescription")%></div></div></div>
		        </ItemTemplate>
		    </asp:Repeater>
		    <div class="DashboardModuleButton" id="adminButtonDiv" runat="server" visible="false" ><div class="DashboardModuleButtonContentContainer"><div class="DashboardModuleButtonContent" style="background-image:url(../../Images/DashboardModuleButton_SystemAdmin.png);">Administer this system</div></div></div>
            <div class="DashboardModuleButton" onclick="showCustomizeWidgets();" ><div class="DashboardModuleButtonContentContainer"><div class="DashboardModuleButtonContent" style="background-image:url(../../Images/DashboardModuleButton_Customize.png);">Customize this page</div></div></div>
            <!--<div class="DashboardModuleButton" onclick="top.location = '../../Admin/Admin.aspx';" ><div class="DashboardModuleButtonContentContainer"><div class="DashboardModuleButtonContent" style="background-image:url(../../Images/DashboardModuleButton_SystemAdministration.png);">Old 5.0 Admin</div></div></div>-->
        </div>

    </div>
	</div></div></div>
    </div>
	<!-- end widget -->   
    
    
    
    
        <!-- list of widgets -->
        <asp:Repeater runat="server" ID="WidgetsRptr" OnItemDataBound="BuildWidget" OnItemCreated="AddWidgetOnCreation">
            <ItemTemplate>
                <!-- start widget -->
                <div id="Widget_<%# Eval("Name") %>" class="<%# Eval("State").ToString().ToLower() == "collapsed" ? "widget_Inactive" : "widget_Active" %>">
                    <div class="widgetTitleBar">
                        <img src="../../Images/shim.gif" class="widgetTitleBarRightEnd" /><img src="../../Images/shim.gif"
                            class="widgetToggle"/><img src="../../Images/shim.gif"
                                class="widgetIcon" style="background-image: url(../../Images/WidgetIcon_<%# Eval("Name") %>.png);" /><asp:Label
                                    runat="server" ID="WidgetTitle"></asp:Label>
                        <asp:Label runat="server" ID="WidgetHelpText" CssClass="widgetOptionalHelpText"></asp:Label>
                    </div>
                    <div class="widgetContentOuterContainer">
                        <div class="widgetContentRightBorder">
                            <div class="widgetContentBottomBorder">
                                <div class="widgetContentInnerContainer">
                                    <asp:HiddenField runat="server" ID="WidgetName" />
                                    <asp:HiddenField runat="server" ID="StateField" />
                                    <asp:PlaceHolder runat="server" ID="WidgetContent"></asp:PlaceHolder>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end widget -->
            </ItemTemplate>
        </asp:Repeater>

    </div>
    <div id="dashboardRightColumn">
        <!-- start static widgets -->
        <%-- <div class="widget_Active">
            <div class="widgetTitleBar">
                <img src="../../Images/shim.gif" class="widgetTitleBarRightEnd" /><img src="../../Images/shim.gif"
                    class="widgetToggle" /><img src="../../Images/shim.gif" class="widgetIcon" style="background-image: url(../../Images/WidgetIcon_YourDatasetsWidget.png);" /><asp:Label
                        runat="server" ID="WidgetTitle"  Text="Your Dataset"></asp:Label>
                <asp:Label runat="server" ID="WidgetHelpText" CssClass="widgetOptionalHelpText" Text="Select your Dataset"></asp:Label>
            </div>
            <div class="widgetContentOuterContainer">
                <div class="widgetContentRightBorder">
                    <div class="widgetContentBottomBorder">
                        <div class="widgetContentInnerContainer">
                            <widget:DatasetWidget ID="DatasetWidget" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <!-- end static widgets -->
    </div>

    <script type="text/javascript">
        /* <![CDATA[ */
        initilizeWidgets();
        /* ]]> */
    </script>

</div>



                
                
                
                
                
                
                

                            

                        

                
            </td>
        </tr>
    </table>
    
<!-- IE9 blowout fix -->
<!--[if IE 9]>
<script type="text/javascript">
var dashboardMainContent = jQuery('#dashboardMainContent');
var headerContainerWidth = jQuery('#blueBarContainer').width() + 'px';
dashboardMainContent.css({'max-width': headerContainerWidth});
</script>

<![endif]-->       
    
</form>    
</body>
</html>
