<%@ Page Language="c#" Inherits="Caisis.UI.Core.Eforms.Index" CodeFile="Index.aspx.cs"
    CodeFileBaseClass="Caisis.UI.Core.Classes.FramePage" %>

<%@ Register TagPrefix="uc1" TagName="pageHeader" Src="../Header/pageHeader.ascx" %>
<%@ Register TagPrefix="val" TagName="EFormMenus" Src="EFormMenus.ascx" %>
<!--
		*********************************************************************************************************************
		
	    Caisis : Data Management System
		Copyright(C) 2015 BioDigital, Inc., All Rights Reserved. 

		Unless explicitly acquired and licensed from Licensor, the contents of this file are subject to  the GNU PUBLIC LICENSE 
		("GPU") Version 2, or subsequent versions as allowed by the GPU, and You may not copy or use this file in either source
		code or executable form, except in compliance with the terms and conditions of the GPU. 

		You may obtain a copy of both the GPU at http://www.caisis.org. 

		All software distributed under the Licenses is provided strictly on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND,  EITHER EXPRESS OR IMPLIED, AND THE CAISIS TEAM HEREBY DISCLAIMS ALL SUCH WARRANTIES, INCLUDING WITHOUT LIMITATION,  ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR  PURPOSE, QUIET ENJOYMENT, OR NON-INFRINGEMENT.  FOR THE AVOIDANCE OF DOUBT, LICENSOR DOES NOT WARRANT THAT THE SOFTWARE WILL MEET CUSTOMER'S REQUIREMENTS OR BE ERROR-FREE OR SECURE. USE OF THE SOFTWARE IS AT YOUR OWN RISK AND YOU ARE SOLELY RESPONSIBLE FOR THE SECURITY, ACCURACY, TRANSMISSION AND USE OF THE DATA.
        See the  Licenses for specific language governing rights and limitations under the Licenses. 
		
		
		**********************************************************************************************************************
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Caisis: Cancer Data Management EForms</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/headerJS.js"></script>

    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery-ui.js"></script>
    
    <script type="text/javascript">  
    /* <![CDATA[ */    
    
    jQuery.noConflict();

    // Adjust main frame on load and on browser resize	
    Browser.ResizeElement({ nodeId: 'EFormFrame', heightOffset: 94 });
			
	// called on change of the Eform list doctor name
	function setClinicGroupTitle(docName) { $('JSClinicName').innerText = "Dr. " + docName + "'s Clinic"; }			
     
     

    var printDoubleSidedEnabled = <% = DoubleSidedPrintEnabled.ToString().ToLower() %>;
    var printDoubleSided = <% = DoubleSidedPrintPreference.ToString().ToLower() %>;
    
    function switchDoubleSided(button)
    {
    
        if (printDoubleSidedEnabled)
        {
    
            printDoubleSided = !printDoubleSided;
            
            var targetFrame = (window.frames['NarrativeFrame'] != null) ? window.frames['NarrativeFrame'] : window.frames['modalFrame'];
            
            if (printDoubleSided)
            {
                document.getElementById('DoubleSidedContainer').className = 'DoubleSidedON';
            }
            else
            {
                document.getElementById('DoubleSidedContainer').className = '';
            }
            
            if (typeof (targetFrame.setDoubleSidedPrinting) != 'undefined' )
            {
                targetFrame.setDoubleSidedPrinting(printDoubleSided);
            }
            
            
            $('DoubleSidedIndicator').innerHTML = printDoubleSided ? 'ON\u00a0' : 'OFF';
            
            jQuery.post('Index.aspx', { 'NewDoubleSidedPrintingSetting': printDoubleSided.toString() });
        
        }
        else
        {
            
        }
    }
     
     
     /* ]]> */
    </script>
    
    


<style type="text/css">
    
    div#DoubleSidedContainer
    {
        padding: 1px 3px 1px 3px;
        border: none;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 10px;
        color: #ffffff;
        background-color: transparent;
        font-weight: 400;
        cursor: pointer;
        border-radius: 3px;
        display: inline;
        margin-right: 25px;
    }
    div#DoubleSidedContainer:hover
    {
        border: none;
        background-color: #ffffff;
        color: #37556D;
    }
    div#DoubleSidedContainer.DoubleSidedON
    {
        border: none;
        background-color: #128537;
        color: #ffffff;
        
        
        
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#128537', endColorstr='#145C17'); /* for IE */
	    background-image: -webkit-gradient(
		    linear,
		    left top,
		    left bottom,
		    color-stop(0, #128537),
		    color-stop(1, #145C17)
	    );
	    background-image: -moz-linear-gradient(
		    center top,
		    #128537 0%,
		    #145C17 100%
	    );	
        
        
    }
    div#DoubleSidedContainer.DoubleSidedON:hover
    {
        border: none;
    }
    div#DoubleSidedContainer span.DoubleSidedIndicator
    {
        font-weight: bold;
    }
    #DoubleSidedContainer.DoubleSidedON span.DoubleSidedIndicator
    {
        color: #ffffff;
    }
</style>

</head>
<body>
    <table height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td colspan="2" bgcolor="#ffffff" height="70">
                <uc1:pageHeader ID="PageHeader1" runat="server"></uc1:pageHeader>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="23" bgcolor="#3d556d">
                <a href="javascript:;">
                    <img onclick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide')"
                        hspace="15" src="../../Images/Header/CommonTasks.gif" border="0" vspace="3" align="middle"></a>
                <val:EFormMenus ID="EFormMenus" runat="server" />
            </td>
        </tr>
        <!-- end header; start page -->
        <tr>
            <td valign="top">
                <iframe id="EFormFrame" name="EFormFrame" src="EFormSplash.aspx" runat="server" width="100%"
                    height="520" scrolling="no" frameborder="0"></iframe>
            </td>
        </tr>
    </table>
    <!-- Loader Logic -->
    <script type="text/javascript">
        // init loader logic  
        (function(){         
            showLoaderBar();
            // container frame
            var eFormFrameElement = $("<%= EFormFrame.ClientID %>");
            var eFormWindow = $(window.frames["EFormFrame"]);
            // on frame loaded: wire events to show/hide loader
            eFormFrameElement.addEvent("load", function() {
                // hide loader
                hideLoaderBar();
                // wire to show on unload
                eFormWindow.addEvent("beforeunload", function() {
                    showLoaderBar();
                });            
            });
        })();
    </script>
<script type="text/javascript">if (printDoubleSided) document.getElementById('DoubleSidedContainer').className = 'DoubleSidedON';</script>
</body>
</html>
