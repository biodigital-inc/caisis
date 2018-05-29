<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminReports.aspx.cs" Inherits="Admin_AdminReports" %>

<%@ Register TagPrefix="admin" TagName="Header" Src="AdminHeader.ascx" %>
<%@ Register TagPrefix="val" TagName="Modal" Src="~/Core/Header/Modal.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Administrative Reports</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>
    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>
    
    <script type="text/javascript" >
    
        var SELECTED_ITEM_CLASS = 'selected';

        jQuery.noConflict();

        jQuery(document).ready(function() {

            setInitialPage();

            // DATA ENTRY LINKS
            var subtitleLinks = jQuery('#adminPageSubtitleBarLinks > a');
            
            subtitleLinks.each(function(index, link) {
            
                // clicking on subtitle link, loads url with current disease
                jQuery(link).click(function(e) {
                    var dataLink = jQuery(link).attr('href');
                    loadDataEntry(dataLink);
                    // set as current
                    subtitleLinks.removeClass(SELECTED_ITEM_CLASS);
                    jQuery(this).addClass(SELECTED_ITEM_CLASS);

                    // prevent url navigation
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


        // sets the current data path
        // @dataLink: the url of the current data entry item
        function setCurrentDataEntry(dataLink) {
            // clear all selections
            var dataLinks = jQuery('#adminPageSubtitleBarLinks a');
            dataLinks.removeClass(SELECTED_ITEM_CLASS);
            
            // set active
            var activeDataLink =  jQuery('#adminPageSubtitleBarLinks a[href*="' + dataLink + '"]');
            activeDataLink.addClass(SELECTED_ITEM_CLASS);
            
            jQuery('#CurrentDataEntry').val(dataLink);
        }

        // gets the current data entry path
        function getCurrentDataEntry() {
            return jQuery('#CurrentDataEntry').val();
        }

        // loads the interface into iframe with optional disease context
        // @url: the url to load
        // @diseaseId: the optional diseaseId to append to the url
        function loadDataEntry(dataLink) {
            // udpate current
            setCurrentDataEntry(dataLink);
            // load into frame
            loadDataEntryFrame(dataLink);
            
            return false;
        }

        // returns the window object representing the data entry frame
        function getDataEntryWindow() {
            return window.frames['reportFrame'];
        }
        
        // loads the specified url into the main data entry frame
        // @url: the url to load
        function loadDataEntryFrame(url) {
            var dataEntryWindow = getDataEntryWindow();
            dataEntryWindow.location = url
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
            var page = urlParams["page"];
            if (page != null) { loadDataEntry(page + '.aspx'); }
            else { loadDataEntry('AdminSectionReports.aspx'); }
        }



    </script>
    
    <style type="text/css">
    html { height: 100%; }
    body { height: 100%; }
    form { height: 100%; }
    </style>
    
</head>
<body>
    <val:Modal ID="AdminModal" runat="server" />
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="CurrentDataEntry" Value="AdminSectionReports.aspx" />
<div>
    <admin:Header ID="AdminHeader" runat="server" />
    <div id="AdminHeaderSubNavContainer" style="width: 670px; margin-left: -345px;"><%-- class="hidden"--%>
        <div id="AdminHeaderSubNav">
            <div id="adminPageSubtitleBarLinks">
    	        <a href="AdminSectionReports.aspx" target="reportFrame" class="selected">Reports</a>
                <a href="AdminLookupCodesDataIntegrity.aspx" target="reportFrame">Data Review</a>
                <a href="EForms_Splash.aspx" target="reportFrame">EForm Logs</a>
                <a href="Contact_List.aspx" target="reportFrame">Contacts</a>
                <a href="Organization_List.aspx" target="reportFrame">Organizations</a>
                <a href="Application_Utilities.aspx" target="reportFrame">App CACHE</a>
                <a href="Patients_EditInstitutionsAndDiseases.aspx" target="reportFrame">Patients</a>     
                <a href="AdminImportData.aspx" target="reportFrame">Import Data</a>            
            </div>
        </div>
    </div>
</div>
            <div id="reportContainer" style="width:97%; text-align:center; height: 90%; padding-left: 2%;">
                <iframe src="AdminSectionReports.aspx" id="reportFrame" runat="server" name="reportFrame" frameborder="0" width="100%" style="height: 100%;"></iframe>
            </div>
    </form>
</body>
</html>
