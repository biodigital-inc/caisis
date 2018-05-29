<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientDataEntryContainer.aspx.cs"
    Inherits="Caisis.UI.Core.PatientDataEntryContainer" %>

<%@ Register TagPrefix="val" TagName="SubFormMenu" Src="ChildFormMenu.ascx" %>
<%@ Register TagPrefix="val" TagName="StickyNote" Src="../../Plugins/StickyNote/StickyNote.ascx" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="../Help/helpToolTip.ascx" %>
<%@ Register TagPrefix="loader" TagName="PluginLoader" Src="PluginLoader.ascx" %>

<%@ Register TagPrefix="dataEntry" TagName="ColumnLayout" Src="~/Core/DataEntryForms/DataEntryControls/ColumnDataEntry.ascx" %>
<%@ Register TagPrefix="dataEntry" TagName="GridLayout" Src="~/Core/DataEntryForms/DataEntryControls/GridDataEntry.ascx" %>
<%@ Register TagPrefix="dataEntry" TagName="TabLayout" Src="~/Core/DataEntryForms/DataEntryControls/TabDataEntry.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jquery-ui.js" type="text/javascript"></script>
    <script src="../../ClientScripts/Help.js" type="text/javascript"></script>
    <script type="text/javascript">
    /* <![CDATA[ */

        jQuery.noConflict();
        
        // overwrite default PDE script
        window.loadDataEntryForm = function(tableName, primKey, parentKey) {
            window.location = '<%= Page.ResolveUrl("PatientDataEntryContainer.aspx") %>?tableName=' + tableName + '&primKey=' + primKey + '&parentKey=' + parentKey;
        }
 

        // Signal expand image to check state (expanded or not)
        Event.Register('load', window, checkIfPdExpanded, false);
              
        jQuery(document).ready(function(e) {

            // add hover look and feel to data entry
            if ($('PDFormDiv')) {
                addHoverToDataEntryFields($('PDFormDiv'));
            }
            
            if (jQuery('.PDMoreTab').length > 0){
                var moreItems = jQuery('#moreMenuContainer');
                jQuery('.PDMoreTab').click(function() {
                    moreItems.css('display', 'block');
                    jQuery('.PDMoreTabOn').css('margin-left', ((jQuery(this).offset().left - 32) + 'px'));
                });
                jQuery('#moreMenuContainer').mouseleave(function() {
                    moreItems.css('display', 'none');
                });
            }
            
            // UI datagrid fix: IE table=disabled, overrides styles
            jQuery("table.dataGrid").removeAttr("disabled");             
            
/*
            if (jQuery('.PatientDataSubformTabContainer').length > 0)
            {
                
                // jQuery('#PDFormDiv')
                jQuery('#PDFormDiv').scroll(function() {
                    var containerHeight = jQuery('#PDFormDiv').height();
                    if (jQuery('.PatientDataSubformTabContainer').position().top > containerHeight)
                    {   
                        jQuery('.PatientDataSubformTabContainer').css('position', 'fixed');
                        jQuery('.PatientDataSubformTabContainer').offset({ top: containerHeight})
                    }
                });
            }
*/  
        });

        // Loads the next tab on click, if data entry validated
        function loadNextTabClick() {
            var doSave = false;
            // VALID = (form is not dirty) OR (form is dirty + required fields entered)
            if (!isFormDirty() || checkRequiredFields()) {
                // valid
                doSave = true;
                // refresh chron list
                parent.refreshChronList();
                // supress check to perform submit
                disIsDirty();
            }
            // update hidden bool
            document.getElementById('nextTabSave').value = doSave.toString();
            return doSave;
        }
    
       function loadRelatedRecord(x)
       {
            //alert(x);
       }

       /* AUDIT FIELDS TOOLTIP */
       function showAuditTooltip(cell, layerId, e) {
           if (isMouseEnter(cell, e)) {
               jQuery(cell).parent('tr').addClass('auditFieldRow');
               jQuery('#' + layerId).show();
           }
       }

       function hideAuditTooltip(cell, layerId, e) {
           if (isMouseLeave(cell, e)) {
               jQuery(cell).parent('tr').removeClass('auditFieldRow');
               jQuery('#' + layerId).hide();
           }
       }
        
    /* ]]> */
    </script>

    <!-- IE7 position fix -->
    <!--[if IE 7]>
    
    <script type="text/javascript">       

        function getTopPos(dom) {
            var node = jQuery(dom);
            if (doOverridePosition(node)) {
                return node.position().top;
            }
            else {
                return posHelper(dom, 'top');
            }
        }

        function getLeftPos(dom) {
            var node = jQuery(dom);
            if (doOverridePosition(node)) {
                return node.position().left;
            }
            else {
                return posHelper(dom, 'left');
            }
        }
        
        function doOverridePosition(jNode) {
            if(jNode.data('dataGridParent')==null) {
                jNode.data('dataGridParent', jNode.parents('.dataGrid').size() > 0);
            }
            return jNode.data('dataGridParent');
        }
        
    </script>

 <![endif]-->

    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/AdminStyles.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #PDFormDiv
        {
            background-color: #ffffff;
        }
        #DataEntryFooter
        {
            position: relative;
        }
        #expandBtn
        {
            position: absolute;
            top: 5px;
            left: 5px;
        }
    
    #PatientDataEntryContainerTitleBar
    {
        position: static;
        height: 30px;
    }
    #relatedRecordsButton
    {
        position: absolute;
        top: 10px;
        right: 55px;
        width: 29px;
        height: 19px;
        background-image: url(../../Images/Button_RelatedRecords_empty.png);
        cursor: pointer;
    }
    #relatedRecordsButton.hasData
    {
        background-image: url(../../Images/Button_RelatedRecords.png);
    }
    #relatedRecordsMenuContainer
    {
        position: absolute;
        z-index: 5000;
        top: 0px;
        right: 45px;
        width: 200px;
        background-image: url(../../Images/RelatedRecordsMenuBG_top.png);
        background-repeat: no-repeat;
        display: none;
    }
    #relatedRecordsMenuContainer div#patientDataMenuTitleBar
    {
        background-image: url(../../Images/Button_RelatedRecords_on.png);
        background-repeat: no-repeat;
        background-position: 161px 10px;
        font-family: Arial, Helvetica, sans-serif;
	    font-size: 11px;
	    font-weight: bold;
	    color: #333333;
	    text-align: right;
	    padding: 11px 43px 0px 0px;
	    height: 28px;
    }
    #relatedRecordsMenuContainer div#patientDataMenuContents
    {
        background-image: url(../../Images/RelatedRecordsMenuBG_bottom.png);
        background-repeat: no-repeat;
        background-position: center bottom;
        min-height: 40px;
        padding: 0px 10px 14px 8px;
    }
    #relatedRecordsMenuContainer div#patientDataMenuContents a
    {
        display: block;
        font-family: Arial, Helvetica, sans-serif;
	    font-size: 11px;
	    font-weight: normal;
	    color: #666666;
	    padding: 3px 3px 3px 27px;
	    cursor: pointer;
        background-repeat: no-repeat;
	    background-position: 6px center;
	    text-decoration: none;
	    
    }
    #relatedRecordsMenuContainer div#patientDataMenuContents a:hover
    {
        background-color: #DFE2E6;
	    color: #000000;
    }
    #relatedRecordsMenuContainer div#patientDataMenuContents div.divider
    {
        width: 90%;
        margin: 7px auto 0px auto;
        height: 7px;
        font-size: 1px;
        border-top: solid 1px #dddddd;
    }
    
    .RelatedRecordStrength0
    {
        background-image: url(../../Images/Icon_RelatedRecordStrength_0.png);
    }
    .RelatedRecordStrength1
    {
        background-image: url(../../Images/Icon_RelatedRecordStrength_1.png);
    }
    .RelatedRecordStrength2
    {
        background-image: url(../../Images/Icon_RelatedRecordStrength_2.png);
    }
    .RelatedRecordStrength3
    {
        background-image: url(../../Images/Icon_RelatedRecordStrength_3.png);
    }
    .RelatedRecordStrength4
    {
        background-image: url(../../Images/Icon_RelatedRecordStrength_4.png);
    }
    .RelatedRecordStrength5
    {
        background-image: url(../../Images/Icon_RelatedRecordStrength_5.png);
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
        top: -5px;
        right: -5px;
        width: 590px;
        background-image: url(../../Images/MoreMenu2BG_bottom.png);
        background-repeat: no-repeat;
        background-position: left bottom;
        display: none;
        padding-bottom: 20px;
    }
    #moreMenuContainer div#patientDataMenuTitleBar
    {
        font-family: Arial, Helvetica, sans-serif;
	    font-size: 11px;
	    font-weight: bold;
	    color: #333333;
	    text-align: center;
	    padding: 11px 2px 0px 0px;
	    height: 31px;
	    width: 73px;
	    margin-top: -23px;

        background-image: url(../../Images/MoreMenu2Tab.png);
        background-repeat: no-repeat;
    }
    #moreMenuContainer div#patientDataMenuContents
    {
        background-image: url(../../Images/MoreMenu2BG_top.png);
        background-repeat: no-repeat;
        background-position: 0px 23px;
        padding: 0px 10px 0px 8px;
        margin-top: -19px;
    }
    #moreMenuContainer div#patientDataMenuContents a
    {
        background-image: url(../../Images/PatientDataMenuWidget_right.png);
        background-repeat: no-repeat;
        background-position: 7px 8px;
        font-family: Arial, Helvetica, sans-serif;
	    font-size: 11px;
	    font-weight: normal;
	    color: #666666;
	    padding: 3px 3px 3px 16px;
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
    #moreMenuContainer div#patientDataMenuContents a:hover
    {
        background-image: url(../../Images/PatientDataMenuWidget_right_on.png);
        background-color: #efefef;
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
        background-image: url(../../Images/PatientDataMenuWidget_right.png);
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
	    width: 40%;
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
        background-image: url(../../Images/PatientDataMenuWidget_right_on.png);
        background-color: #efefef;
	    color: #000000;
    }
    
    
    
 
    
    .PatientDataSubformTabContainer
    {
    }
    
    
    
    

    #PDFormDiv .EditDataEntryForm_2Cols
    {
	    width: 97%;
	    margin: 0px auto 0px auto;
	    clear: both;
    }

    #PDFormDiv .EditDataEntryForm_ChildTable
    {
	    float: right;
	    width: 98%;
	    padding: 10px 0px 10px 0px;
    	
	    background-color: #fbfbfb;
	    border: solid 1px #dddddd;
    	
	    -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        -khtml-border-radius: 3px;
        border-radius: 3px;
    	
	    margin: 40px auto 20px auto;
    	
    }
    #PDFormDiv .EditDataEntryForm_ChildTable .EditDataEntryField_Container
    {
	    width: 99%;
	    padding: 3px 3px 3px 7px;
	    border: solid 1px #f4f4f4;
	    background-color: #fcfcfc;
    	
	    margin: 4px 0px 0px 0px;
    	
	    vertical-align: top;
    	
    }
    
    #PDFormDiv .EditDataEntryForm_ChildTableTitle
    {
	    display: inline-block;
    	
	    padding-left: 6px;
	    background-image: url(../../Images/AdminImages/ChildTableTitleBG_Left.png);
	    background-position: left center;
	    background-repeat: no-repeat;
	    height: 21px;
    	
	    font-family: Arial, Helvetica, sans-serif;
	    font-size: 12px;
	    line-height: 21px;
	    font-weight: bold;
    	
	    color: #111111;
    	
	    cursor: pointer;
    	
    }
    
    
   #PDFormDiv .EditDataEntryField_Container /*:hover*/
    {
	    background-image: none; 
	    cursor: default;
	    filter: none; 
    }
    
    
    /* more tabs */
    #PDFormDiv .EditDataEntryForm_MoreTabLayer
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
    #PDFormDiv .EditDataEntryForm_MoreTabLayer a
    {
        display: block;
        color: #aaa;
        text-decoration: none;
        padding: 2px 5px;
    }
    #PDFormDiv .EditDataEntryForm_MoreTabLayer a:hover
    {
        color: #000;
        background-color: #ccc;
    }

    #PDFormDiv .EditDataEntryForm_ChildTableTitleInnerContainer
    {
	    display: inline-block;
    	
	    padding-right: 6px;
	    background-image: url(../../Images/AdminImages/ChildTableTitleBG_Right.png);
	    background-position: right center;
	    background-repeat: no-repeat;
	    height: 21px;
    }
    #PDFormDiv .EditDataEntryForm_ChildTableTitleOuterContainer
    {
	    margin-top: -31px;
	    margin-left: -1px;
	    margin-bottom: 10px;

	    width: 96%;
        /*position: relative;*/
    }

    #PDFormDiv .EditDataEntryForm_Overflow
    {
	    max-height: 270px;
	    overflow: auto;
    }
    #PDFormDiv .EditDataEntryField_Container
    {
	    width: 99%;
	    padding: 3px 3px 3px 7px;
	    border: solid 1px #f0f0f0;
	    background-color: #f9f9f9;
    	
	    margin: 0px 0px 4px 0px;
    	
	    vertical-align: top;
    	
    }
    #PDFormDiv .EditDataEntryField_Common
    {
        background-color: #DFE1E2;
        color: #000000;
        font-weight: bold;
    }
    #PDFormDiv div.EditDataEntryField_Container input[type="text"]
    {
	    vertical-align: middle;
	    /*max-width: 120px;*/
        width: 110px;
    }
    
    #PDFormDiv div.EditDataEntryField_Container select
    {
	    vertical-align: middle;
	    /*max-width: 120px;*/
        width: 133px;
    }
    #PDFormDiv div.EditDataEntryField_Container textarea
    {
	    /*max-width: 120px;*/
        width: 110px;
        vertical-align: middle;
    }

    /*.EditDataEntryField_Container:hover,*/
    #PDFormDiv .EditDataEntryField_Container_Active
    {
	    width: 99%;
	    padding: 3px 3px 3px 7px;
	    border: solid 1px #BDC4CB;
	    background-color: #F2F3F4;
    /*	border: solid 1px #cccccc;
	    background-image: url(../../Images/AdminImages/AdminEditDataEntryFieldHighlightBG.png);  
	    cursor: pointer;
    */
            background-repeat: repeat-x;
            margin: 0px 0px 4px 0px;
        }
        #EditEFormMainContent .EditDataEntryField_Container:hover, #EditEFormMainContent .EditDataEntryField_Container_Active
        {
            cursor: help;
        }
        #PDFormDiv .EditDataEntryField_Label
        {
            display: inline-block;
            width: 120px; /*	float: left; */
            line-height: 14px;
        }
        #PDFormDiv .requiredField
        {
            display: inline-block;
            width: 120px; /*	float: left; */
            line-height: 14px;
        }
        #PDFormDiv .EditDataEntryField_icon_standard
        {
            /*	    width: 9px;
	    height: 9px;
    	
	    margin-right: 25px;
    	
	    background-image: none;
    	
	    vertical-align: middle;
    	
	    border: none;
	    float: left;
*/
            display: none;
        }
        #PDFormDiv .EditDataEntryField_icon_customized
        {
            /*	    width: 9px;
	    height: 9px;
    	
	    margin-right: 25px;
    	
	    background-image: url(../../Images/AdminImages/AdminIcon_CustomizedField.png);
	    background-repeat: no-repeat;	
	    vertical-align:  baseline;
    	
	    border: none;
	    float: left;
*/
            display: none;
        }
        #PDFormDiv .EditDataEntryForm_Grid
        {
            margin: 0px auto 0px auto;
            clear: both;
            padding: 10px 0px 20px 10px;
            white-space: nowrap;
            overflow: auto;
            width: 100%;
        }
        #PDFormDiv div.EditDataEntryForm_Grid div.EditDataEntryField_Container
        {
        }
        /*
    #PDFormDiv div.EditDataEntryForm_Grid div.EditDataEntryField_Container:hover
    {
    }
}*/
        #PDFormDiv div.EditDataEntryForm_Grid span.EditDataEntryField_Label
        {
            float: left;
        }
        #PDFormDiv div.EditDataEntryForm_Grid span.EditDataEntryField_Label > input
        {
            float: left;
            clear: both;
        }
        #PDFormDiv div.EditDataEntryForm_Grid img.EditDataEntryField_icon_standard
        {
            float: left;
            margin-right: 4px;
        }
        #PDFormDiv div.EditDataEntryForm_Grid img.EditDataEntryField_icon_customized
        {
            float: left;
            margin-right: 4px;
        }
        #PDFormDiv .dataEntryTabDisabled .EditDataEntryForm_ChildTableTitle
        {
            color: #aaaaaa;
        }
        div.dataEntryFieldCommon
        {
            background-color: Red;
        }
        /* COMMON DATA ELEMENTS */
        #PDFormDiv .EditDataEntryField_Common,
        #PDFormDiv .EditDataEntryForm_ChildTable .EditDataEntryField_Common
        {
            background-color: #e9e9e9;
        }
        /* AUDIT FIELDS (datagrid) */
        .dataGrid .auditFieldCell
        {
            border: none;
            background-color: #ffffff;
            border-top: 1px solid #ffffff;
            border-right: 1px solid #ffffff;
            border-bottom: 1px solid #ffffff;
        }
        .dataGrid th.auditFieldCell
        {
        }
        .dataGrid td.auditFieldCell img
        {
            cursor: pointer;
            padding-left: 6px;
            padding-right: 12px;
        }
        .dataGrid td.auditFieldCell .auditFieldTooltip
        {
            display: none;
            width: 250px;
            padding: 3px;
            min-height: 10px;
            max-height: 70px;
            position: absolute;
            margin-left: -255px;
            margin-top: 1px;
            color: #222;
            border-radius: 3px;
            vertical-align: middle;
            box-shadow: 1px 1px 2px 2px #dddddd;
        }
        .auditFieldTooltip
        {
            background-color: #fbfbef;
            border: 1px solid #C6CDAB;
        }
        .auditFieldTooltip span
        {
            display: block;
            color: #222;
            font-size: 10px;
        }
       
        tr.auditFieldRow
        {
            background-color: rgb(223, 237, 249);
        }
    </style>

    <!-- Fix no overflow w/ Data Grids, IE6 and less only -->
    <!--[if lt IE 7]>
    <style>
    .dataGrid
    {
        margin-right: expression(this.offsetWidth > (window.document.documentElement.clientWidth||window.document.body.clientWidth) ? '-' + (this.offsetWidth - (window.document.documentElement.clientWidth||window.document.body.clientWidth) + 25) + 'px' : '');
    }
    </style>
    <![endif]-->
    <!-- DO NOT PUT Javascript here : all js handled by default.aspx parent page and included PatientDataEntry.js file -->
</head>
<body onbeforeunload="if(!window.event) { return isDirty(event); }" onunload="isDirty(event);" onkeydown="return cancelBackOnBackspace(event);">
    <form id="dataForm" runat="server">
        <%-- (optional) Next patient id to load, after current patient saved --%>
        <input type="hidden" id="nextEPID" name="nextEPID" value="" />
        <%-- (optional) bool representing if to save the form, used for adding tabs --%>
        <input type="hidden" id="nextTabSave" name="nextTabSave" value="" />
        <asp:HiddenField ID="PagePrimaryKey" runat="server" />
        <%-- <asp:HiddenField ID="WorkFlowFlag" runat="server" /> --%>
        <!-- PAGE TITLE AND SUBFORM MENU -->
         
         <div id="PatientDataEntryContainerTitleBar">
             <img alt="" ID="PageTitleIcon" src="~/Images/shim.gif" runat="server" class="PatientDataPageTitleIcon" />
             <asp:HyperLink ID="ParentNavigationLink" runat="server" CssClass="patientDataSectionTitle" Visible="false" style=" text-decoration: none;"></asp:HyperLink>
             <img alt="" ID="PageTitleArrow" src="~/Images/PatientDataTitleWidget.png" runat="server" class="PatientDataTitleWidget" visible="false" />
             <asp:Label ID="PageTitle" runat="server" CssClass="patientDataSectionTitle"></asp:Label>
             <val:SubFormMenu ID="SubFormMenu" Visible="false" runat="server"></val:SubFormMenu>
            
            <val:StickyNote ID="StickyNote" runat="server" />
            
                    
         </div>

        
        <div id="PDFormDiv" style="padding-bottom: 20px; position: relative; clear: both;">
                <div style="text-align: right;">
                    <loader:PluginLoader ID="DynamicPlugins" runat="server" />
                </div>
                <div style="text-align:center">
                    <div id="ClientErrorMessage" class="patientDataFormUserMessage"></div>
                    <asp:Label ID="UserMessage" CssClass="patientDataFormUserMessage" runat="server" />
                </div>

                    <!--- This script needs to stay here for formatting reasons - jf. --->
                    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
					<uc1:helpToolTip id="HelpToolTipLayer" runat="server" />	                
                
                    <!-- DYNAMIC AND STATIC DATA ENTRY FORMS LOADED INTO PLACEHOLDER -->
                    <asp:PlaceHolder ID="formHolder" runat="server"></asp:PlaceHolder>
                    

        </div>
        <div id="DataEntryFooter">
            <!-- DATA ENTRY BUTTONS -->
            <div id="DataEntryButtons">
                <asp:ImageButton ID="NewBtn" OnCommand="DataEntryButtonClick" CommandName="New" Enabled="False"
                    runat="server" ImageUrl="../../Images/DataEntryButtons/Button_New_off.gif" Height="22px"
                    Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                <asp:ImageButton ID="EditBtn" AccessKey="E" OnCommand="DataEntryButtonClick" CommandName="Edit"
                    Enabled="False" runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Edit_off.gif"
                    Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                <asp:ImageButton ID="SaveBtn" OnCommand="DataEntryButtonClick" CommandName="Save" OnClientClick="if(validateGrids()) { disIsDirty(); } else { return false; }" 
                    Enabled="False" runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Save_off.gif"
                    Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                <asp:ImageButton ID="LockBtn" OnCommand="DataEntryButtonClick" CommandName="Lock"  OnClientClick="disIsDirty()"
                    Enabled="False" runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Lock_off.gif"
                    Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                <asp:ImageButton ID="UnlockBtn" OnCommand="DataEntryButtonClick" CommandName="Unlock"
                    Enabled="False" runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Unlock_off.gif"
                    Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                <asp:ImageButton ID="CancelBtn" OnCommand="DataEntryButtonClick" CommandName="Cancel"  OnClientClick="disIsDirty()" 
                    Enabled="False" runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Cancel_off.gif"
                    Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                <asp:ImageButton ID="DeleteBtn" OnClientClick="disIsDirty(); if(confirmDelete()==false)return false;" OnCommand="DataEntryButtonClick" CommandName="Delete"
                    Enabled="False" runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Delete_off.gif"
                    Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
            </div>
            <!-- DATA ENTRY AUDIT LABELS -->
            <div id="AuditLabels" class="smallPrint">
                <div id="AuditLabelsLeft">
                    <span class="AuditLabel">Entered By:&nbsp;</span> 
                    <span class="AuditLabel">Updated By:&nbsp;</span>
                    <span class="AuditLabel">Locked By:&nbsp;</span>
                </div>
                <div id="AuditLabelsRight">
                    <div>
                        <asp:Label ID="EnteredBy" runat="server" /><asp:Label ID="EnteredTime" runat="server" /></div>
                    <div>
                        <asp:Label ID="UpdatedBy" runat="server" /><asp:Label ID="UpdatedTime" runat="server" /> <asp:HyperLink ID="AuditLink" runat="server" Visible="false"><img runat="server" id="AuditLinkImage" src="~/Images/ViewAuditLogIcon.gif" title="View Previous Changes To This Record" border="0" style="margin-left: 3px;" /></asp:HyperLink></div>
                    <div>
                        <asp:Label ID="LockedBy" runat="server" /><asp:Label ID="LockedTime" runat="server" /></div>
                </div>
            </div>
            <a id="expandBtn" href="javascript:expandPatientData();">
                <img id="ExpandPatientDataButton" src="../../Images/buttonExpand.gif" alt="Expand Data Entry"
                    style="border: none;" /></a>
        </div>
        <script type="text/javascript">
            /* <![CDATA[ */
            
            // Resize frame and content immediately + on resize
            Browser.ResizeFrame({ heightOffset: 125, wait: false });
            Browser.ResizeElement({ nodeId: 'PDFormDiv', heightOffset: 250, wait: false });

            // collapse interface when comming from workflows
            if (top.WORKFLOW_ACTIVE) {
                top.WORKFLOW_ACTIVE = false;
                top.pdIsExpanded = false;
                expandPatientDataFrame();
            }
            

            if (jQuery)
            {              
                if (jQuery('.PatientDataSubformTabContainer').length > 0)
                {
                    jQuery(jQuery('.PatientDataSubformTabContainer').first()).mouseenter(function() {
                        overSubform = true;
                    });
                    jQuery(jQuery('.PatientDataSubformTabContainer').first()).mouseleave
                    (function() {
                        overSubform = false;
                    });
                }
            }
            
                    // set position for data entry buttons in the form pages
        
        $('PDFormDiv').onscroll = setSubformTabPos;
        $('PDFormDiv').onresize = setSubformTabPos;
        
        
        var tabBar = null;
        var normalTabTop = null;
        if ((jQuery) && jQuery('.EditDataEntryForm_ChildTableTitleOuterContainer').length > 0)
        {
            tabBar = jQuery('.EditDataEntryForm_ChildTableTitleOuterContainer').first();
            normalTabTop = tabBar.offset().top;
        }
        function setSubformTabPos()
        {
            if (tabBar != null)
	        {   
                var scroll = jQuery('#PDFormDiv').scrollTop();
                if ((scroll+jQuery('#PDFormDiv').offset().top) >= normalTabTop)
                {
                    tabBar.css('position', 'fixed');
                    tabBar.css('top', '62px');
                    tabBar.css('background-color', '#f7f7f7');
                    tabBar.css('border-bottom', 'solid 1px #eeeeee');
                }
                else
                {
                    returnTabToOrginalPos();
                }
	        }
        }
        
        function returnTabToOrginalPos()
        {
            if (tabBar != null)
	        {   
                tabBar.css('position', '');
                tabBar.css('top', '');
                tabBar.css('background-color', '');
                tabBar.css('border-bottom', '');
	        }
        }

        function getScrollY(sObj) {
          var scrolledObj = window;
          if (sObj != null){scrolledObj=sObj;}
          var scrOfY = 0;
          if( typeof( scrolledObj.pageYOffset ) == 'number' ) {
            //Netscape compliant
            scrOfY = scrolledObj.pageYOffset;
          } else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
          } else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
          }
          return scrOfY;
        }
            

            /* ]]> */
        </script>
    </form>
    
</body>
</html>
