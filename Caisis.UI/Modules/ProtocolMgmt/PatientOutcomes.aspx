<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientOutcomes.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientOutcomes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PatientOutcomes</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        var MIN_LAYOUT_HEIGHT = 100;
        var ActiveTab = 'All';

        // Adjust overflow and frame sizes
        function onWindowResize() {
            var winHeight = getHeight(window);
            var dataFrame = $('FormsFrame');
            var heightOffset = Math.max(MIN_LAYOUT_HEIGHT, winHeight);
            dataFrame.style.height = heightOffset - 50 + 'px';
        }

        // sets the selected imaging TYPE
        // either dom node or by tab id, i.e., 'All', 'CT', etc...
        function setActiveImaging(tab, id) {
            tab = $(tab);
            var imgingTabs = $('ImagingTabs');
            ActiveTab = $(ActiveTab);
            // don't modify styles or images if current tab is active
            if (ActiveTab != tab) {
                // reset acitve tab if it exists
                if (ActiveTab != null) {
                    ActiveTab.className = '';
                }
                // now set new tab as active and adjust styles and image
                ActiveTab = tab;
                ActiveTab.className = 'active';
            }
            // determine if we need to show back to Responses
            $('BackToImaging').style.display = tab == $('All') ? 'none' : '';
            // load url into frame
            var baseurl = tab.href;
            $('FormsFrame').src = baseurl + (id ? id : '');

            // special case: show/hide PET filter
            if (tab.id == 'PET') {
                $('PETTracerTypeContainer').style.display = 'block';
                // reset filter
                visitPETTracer(function(link, index) {
                    link.className = index == 0 ? 'active' : '';
                });
            }
            else {
                $('PETTracerTypeContainer').style.display = 'none';
            }
            
            return false;
        }

        function getPETTracerTypes() {
            var links = $('PETTracerType').getElementsByTagName('a');
            return links;
        }

        function visitPETTracer(callback) {
            var links = getPETTracerTypes();
            for (var i = 0; i < links.length; i++) {
                callback(links[i], i)
            }
        }

        $(window).addEvent('load', function(e) {
            // init PET scan specific filtering
            visitPETTracer(function(link) {
                $(link).addEvent('click', function() {
                    // reset links
                    visitPETTracer(function(other) { other.className = ''; });
                    // set active link
                    link.className = 'active';
                });
            });
        });

        /* ]]> */
    </script>

    <style type="text/css">
        #ImagingTabs
        {
            float: left;
        }
        #Tabs
        {
            padding: 0px;
        }
        #Tabs td
        {
        }
        #Tabs a
        {
        }
        .OptionalTab a
        {
            width: auto;
        }
        .ResponseTab
        {
        }
        .ResponseActiveTab
        {
        }
        #BackToImaging
        {
            float: right;
            padding: 0px 5px 2px 5px;
        }
        #PETTracerTypeContainer
        {
            display: none;
            text-align: center;
        }        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <a id="BackToImaging" title="Back to Imaging Response" href="#" onclick="return setActiveImaging('All');"
        style="display: none; font-weight: bold; padding: 5px; font-size: 12px;" class="dataEntryButtonGray">Back to Response</a>
    <%-- Navigation Buttons --%>
    <div id="ImagingTabs" class="OptionalTab">
        <!-- imaging tabs -->
        <div id="Tabs" class="dataEntryNavToggleContainer">
            <div class="dataEntryNavToggle">            
                <a id="All" href="<%= GetQueryString("PatientImaging.aspx") %>" title="Imaging Response"
                    onclick="return setActiveImaging(this);" class="active">Response</a>
                <a id="CT" href="<%= GetQueryString("PatientImagingLesions.aspx") %>&type=CT%2CMRI&diagnosticId="
                    title="CT/MRI" onclick="return setActiveImaging(this);">CT/MRI</a>
                <a id="PET" href="<%= GetQueryString("PatientImagingLesions.aspx") %>&type=PET&diagnosticId="
                    title="PET" onclick="return setActiveImaging(this);">PET</a>
                <a id="Bone" href="<%= GetQueryString("PatientImagingBone.aspx") %>&diagnosticId="
                    title="Bone" onclick="return setActiveImaging(this);">Bone</a>
            </div>
        </div>
    </div>
    <!-- Optional PET Tracer Filters -->
    <div id="PETTracerTypeContainer">
        <span class="boldText">Tracer uptake indicates malignancy: </span>
        <div id="PETTracerType" class="dataEntryNavToggleContainer">
            <div class="dataEntryNavToggle">            
                <a class="active" href="<%= GetQueryString("PatientImagingLesions.aspx") %>&type=PET&diagnosticId=&tracer=" target="FormsFrame">All</a>
                <a href="<%= GetQueryString("PatientImagingLesions.aspx") %>&type=PET&diagnosticId=&tracer=1" target="FormsFrame">Related</a>
                <a href="<%= GetQueryString("PatientImagingLesions.aspx") %>&type=PET&diagnosticId=&tracer=0" target="FormsFrame">Unrelated</a>
            </div>
        </div>
    </div>

    <%-- Data Entry Container --%>
    <iframe id="FormsFrame" name="FormsFrame" src="<%= GetQueryString("PatientImaging.aspx") %>&type=All"
        style="width: 100%; height: 400px; clear: both; margin: 10px auto auto 0px;"
        frameborder="0"></iframe>

    <script type="text/javascript">
        /* <![CDATA[ */
        onWindowResize();
        /* ]]> */
    </script>

    </form>
</body>
</html>
