<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSystemConfig.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminSystemConfig" %>

<%@ Register TagPrefix="val" TagName="Modal" Src="../Core/Header/Modal.ascx" %>
<%@ Register TagPrefix="admin" TagName="Header" Src="AdminHeader.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin System Config</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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

        var SELECTED_ITEM_CLASS = 'selected';

        // resize main data entry frame
        Browser.ResizeElement({ nodeId: 'DataEntryFrame', heightOffset: 90 });

        jQuery.noConflict();

        jQuery(document).ready(function() {

            setInitialPage();

            // DATA ENTRY LINKS
            var subtitleLinks = jQuery('#adminPageSubtitleBarLinks > a');
            
            subtitleLinks.each(function(index, link) {
            
                // clicking on subtitle link, loads url with current disease
                jQuery(link).click(function(e) {
                    var dataLink = jQuery(link).attr('href');
                    var diseaseId = getCurrentDiseaseId();
                    loadDataEntry(dataLink, diseaseId);
                    // set as current
                    subtitleLinks.removeClass(SELECTED_ITEM_CLASS);
                    jQuery(this).addClass(SELECTED_ITEM_CLASS);

                    // prevent url navigation
                    e.preventDefault();
                });
            });

            // DISEASE LINKS
            jQuery('#DiseaseList > li').each(function(index, li) {
                var diseaseIdField = jQuery(li).find('input[name*="DiseaseId_"]');
                var diseaseLink = jQuery(li).find('a');
                // on click of each disease link, filter data entry
                jQuery(li).click(function(e) {
                    var diseaseId = diseaseIdField.val();
                    var dataLink = getCurrentDataEntry();
                    loadDataEntry(dataLink, diseaseId);
                    e.preventDefault();
                });
            });
        });

        function syncDataEntryPath() {
            var dataEntryWindow = getDataEntryWindow();
            var _path = dataEntryWindow.location.pathname;
            var parts = _path.split('/');
            var formPath = parts[parts.length - 1];
            setCurrentDataEntry(formPath);
        }

        // sets the current disease id and selected node
        // @diseaseId: the id
        function setCurrentDiseaseId(diseaseId) {
            // clear all selections
            var diseases = jQuery('#DiseaseList > li');
            diseases.removeClass(SELECTED_ITEM_CLASS);
            // set selection
            var activeDisease = jQuery('#DiseaseItem_' + diseaseId);
            activeDisease.addClass(SELECTED_ITEM_CLASS);

            // sync disease id field
            jQuery('#CurrentDiseaseId').val(diseaseId);
        }
        
        // returns the currently active disease id
        function getCurrentDiseaseId() {
            return jQuery('#CurrentDiseaseId').val();
        }

        // sets the current data path
        // @dataLink: the url of the current data entry item
        function setCurrentDataEntry(dataLink) {
            // clear all selections
            var dataLinks = jQuery('#adminPageSubtitleBarLinks a');
            dataLinks.removeClass(SELECTED_ITEM_CLASS);
            
            // set active
            var activeDataLink =  jQuery('#adminPageSubtitleBarLinks a[href*="' + dataLink + '"]');
            activeDataLink.addClass(SELECTED_ITEM_CLASS);
            
            // set page width
            var isShortForm = activeDataLink.hasClass('dataEntryFormSmall');
            setPageWidth(isShortForm);

            jQuery('#CurrentDataEntry').val(dataLink);
        }

        // gets the current data entry path
        function getCurrentDataEntry() {
            return jQuery('#CurrentDataEntry').val();
        }

        // loads the interface into iframe with optional disease context
        // @url: the url to load
        // @diseaseId: the optional diseaseId to append to the url
        function loadDataEntry(dataLink, diseaseId) {
            // udpate current
            setCurrentDiseaseId(diseaseId);
            setCurrentDataEntry(dataLink);

            // append diseaseId if applicable
            var url = dataLink + (diseaseId && diseaseId != '' ? '?diseaseId=' + diseaseId : '');
            // load into frame
            loadDataEntryFrame(url);
            
            
            return false;
        }

        // returns the window object representing the data entry frame
        function getDataEntryWindow() {
            return window.frames['DataEntryFrame'];
        }
        
        // loads the specified url into the main data entry frame
        // @url: the url to load
        function loadDataEntryFrame(url) {
            var dataEntryWindow = getDataEntryWindow();
            dataEntryWindow.location = url
        }

        // reloads the current data entry frame
        function reloadDataEntryFrame() {
            var dataEntryWindow = getDataEntryWindow();
            loadDataEntryFrame(dataEntryWindow.location);
        }    
        
        // manages the list of current diseases
        function manageDiseases() {
            showModalWithConfig('Diseases_Edit.aspx', 'Manage Diseases', { width: 600, height: 500 });
            return false;
        }
        
        
        
        var urlParams = {};
        (function () {
            var e,
                a = /\+/g,  // Regex for replacing addition symbol with a space
                r = /([^&=]+)=?([^&]*)/g,
                d = function (s) { return decodeURIComponent(s.replace(a, " ")); },
                q = window.location.search.substring(1);

            while (e = r.exec(q))
               urlParams[d(e[1])] = d(e[2]);
        })();

        function setInitialPage() {
            var diseaseId = getCurrentDiseaseId();
            var page = urlParams["page"];
            if (page != null) { loadDataEntry(page + '.aspx', diseaseId); }
            else { loadDataEntry('AdminEditDataEntry.aspx',''); }
        }

        // sets the width of the data entry form to relevant form size
        // @isShortForm: true|false if short form
        function setPageWidth(isShortForm) {
            if (isShortForm) {
                jQuery('#SelectDiseaseBox').animate({ marginLeft: 150 }, 300);
                jQuery('#DataEntryFrameContainer').animate({ marginLeft: 300 }, 300);

            }
            else {
                jQuery('#SelectDiseaseBox').animate({ marginLeft: 0 }, 300);
                jQuery('#DataEntryFrameContainer').animate({ marginLeft: 150 }, 300);
            }
        }

        /* ]]> */
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="CurrentDataEntry" Value="AdminEditDataEntry.aspx" />
    <asp:HiddenField runat="server" ID="CurrentDiseaseId" Value="" />
    <val:Modal ID="AdminModal" runat="server" />
<div> <%--onmouseover="$('AdminHeaderSubNavContainer').className='';" onmouseout="$('AdminHeaderSubNavContainer').className='hidden';"--%>
    <admin:Header ID="AdminHeader" runat="server" />
    
    <div id="AdminHeaderSubNavContainer"><%-- class="hidden"--%>
        <div id="AdminHeaderSubNav">
            <div id="adminPageSubtitleBarLinks">
    	        <a href="AdminEditDataEntry.aspx" target="DataEntryFrame" class="selected">Data Entry Forms</a>
                <a href="LookupCode_Edit.aspx" target="DataEntryFrame">Vocabulary</a>
                <a href="EForms_List.aspx" target="DataEntryFrame" class="dataEntryFormSmall">EForms</a>
                <a href="Workflow_List.aspx" target="DataEntryFrame" class="dataEntryFormSmall">Workflows</a>
                <a href="PaperForms_View.aspx" target="DataEntryFrame" class="dataEntryFormSmall">Paper Forms</a>
                <a href="AdminListReports.aspx" target="DataEntryFrame">Reports</a>
                <a href="Surveys_Edit.aspx" target="DataEntryFrame" class="dataEntryFormSmall">Surveys</a>
                <a href="AdminEditTableMetadata.aspx" target="DataEntryFrame" class="selected">All Forms</a>
                <a href="Metadata_Edit.aspx" target="reportFrame">Manage Attributes</a>   
            </div>
        </div>
    </div>
</div>
    <div id="adminPageContentContainer" style="padding-top:10px;">
        <div id="SelectDiseaseBox" class="adminNavBoxContainer">
            <span class="adminNavBoxContainerTitle">Select Disease</span>
            <div class="adminBox">
                <div class="adminBoxNavListContainer" style="overflow-x: hidden; word-wrap: break-word;">
                    <ul id="DiseaseList" class="adminBoxNavList">
                        <li id="DiseaseItem_" class="selected">
                            <input type="hidden" id="DiseaseId_" name="DiseaseId_" value="" />
                            <a href="#" target="DataEntryFrame">General (Default)</a></li>
                        <asp:Repeater runat="server" ID="DiseaseViewRptr">
                            <ItemTemplate>
                                <li id="DiseaseItem_<%# Eval("DiseaseId") %>" <%# Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "" %> >
                                    <input type="hidden" id="DiseaseId_<%# Eval("DiseaseId") %>" name="DiseaseId_<%# Eval("DiseaseId") %>"
                                        value="<%# Eval("DiseaseId") %>" />
                                    <a href="#" target="DataEntryFrame">
                                        <%# Eval("DiseaseName")%></a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
<%--            <img alt="Manage Diseases" title="Manage Diseases" class="NavListFooterButton" src="../Images/AdminImages/AdminButton_ManageDiseases.png"
                onclick="return manageDiseases();" />--%>
            <span title="Manage Diseases" class="dataEntryButtonGray NavListFooterButton" onclick="return manageDiseases();">
                Manage Diseases</span>
        </div>
        
        <div id="DataEntryFrameContainer" style="margin-left: 150px; margin-right: 0px;">
        <iframe id="DataEntryFrame" name="DataEntryFrame" src=""
            style="width: 100%; min-width: 400px; float: left; height: 600px;" scrolling="no"  frameborder="0" onload="syncDataEntryPath();">
        </iframe></div>
    </div>
    </form>
</body>
</html>
