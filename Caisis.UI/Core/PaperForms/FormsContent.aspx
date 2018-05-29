<%@ Page Language="c#" Inherits="Caisis.UI.Core.PaperForms.FormsContent" CodeFile="FormsContent.aspx.cs"
    CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Caisis: Forms</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    <script src="../../ClientScripts/formsJS.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery-ui.js"></script>


    <script type="text/javascript">
        /* <![CDATA[ */
        jQuery.noConflict();

        var nowDate = '<asp:Literal ID="nowDate" Runat="server" />';

        function noClinicDateAlert() {
            alert('One or more patients did not have a scheduled appointment date.  Forms for those patients will display today, ' + nowDate + ', as the appointment date.');
        }

        var InstShortName = '<%= CaisisConfiguration.GetWebConfigValue("institutionShortName") %>';
        var pageMaxHeight = 1020;
        var currentPageStartY = 0;
        var currentPaperFormNeedsToBeRenumbered = false;
        var showBarCodes = true;


        function checkBrowser() {
            this.ver = navigator.appVersion
            this.dom = document.getElementById ? 1 : 0
            this.ie5 = (this.ver.indexOf("MSIE 5") > -1 && this.dom) ? 1 : 0;
            this.ie6 = (this.ver.indexOf("MSIE 6") > -1 && this.dom) ? 1 : 0;
            this.ie7 = (this.ver.indexOf("MSIE 7") > -1 && this.dom) ? 1 : 0;
            this.ie8 = (this.ver.indexOf("MSIE 8") > -1 && this.dom) ? 1 : 0;
            this.ie9 = (this.ver.indexOf("MSIE 9") > -1 && this.dom) ? 1 : 0;
            this.ie10 = (this.ver.indexOf("MSIE 10") > -1 && this.dom) ? 1 : 0;
            this.ie11 = (this.ver.indexOf("Trident") > -1 && this.dom) ? 1 : 0;
            this.ie4 = (document.all && !this.dom) ? 1 : 0;
            this.ns5 = (this.dom && parseInt(this.ver) >= 5) ? 1 : 0;
            this.ns4 = (document.layers && !this.dom) ? 1 : 0;
            this.bw = (this.ie5 || this.ie4 || this.ns4 || this.ns5)
            return this
        }

        bw = new checkBrowser()
        if (bw.ie7 || bw.ie8 || bw.ie9 || bw.ie10 || bw.ie11) {
            document.write('<link href="../../StyleSheets/IE7FormStyles.css" rel="stylesheet" type="text/css" media="all">')
            pageMaxHeight = 1223;
        }
        else if (bw.ie4 || bw.ie5 || bw.ie6) {
            document.write('<link href="../../StyleSheets/formStyles.css" rel="stylesheet" type="text/css" media="all">')
        }
        else {
            document.write('<link href="../../StyleSheets/XBFormStyles.css" rel="stylesheet" type="text/css" media="all">')
            pageMaxHeight = 1223;
            showBarCodes = false;
        }


        function setDoubleSidedPrinting(showDouble)
        {
            if (showDouble)
            {
            	var pageBody = document.getElementsByTagName('body')[0];

                var allDivsOnPage = pageBody.getElementsByTagName('div');
                var allPaperForms = new Array();

                // find all paper forms and add them to array
                for (var i = 0; i < allDivsOnPage.length; i++)
                {   
                    if (allDivsOnPage[i].id && (allDivsOnPage[i].id.indexOf('PaperForm') > -1 || allDivsOnPage[i].id.indexOf('theNarrative') > -1) ) // each paper form or eform will pass this condition
                    {allPaperForms.push(allDivsOnPage[i]);}
                }
                
                // check each paper form
                for (var j = 0; j < allPaperForms.length; j++)
                {
                    setFormBarCodesToDoubleSided(allPaperForms[j]);
                }
            }
            else
            {
                var allReversedPages = jQuery('.reverseSidePage');
                allReversedPages.removeClass('reverseSidePage');
                
                var allBlankReversePages = jQuery('.doubleSideSpacerPage');
                allBlankReversePages.removeClass('doubleSideSpacerPage');
            }

        }
        
        function setFormBarCodesToDoubleSided(formDiv)
        {
            var allPaperFormChilden = formDiv.childNodes
            var paperFormPages = new Array();  // array of pages in this form
            
            for (var i = 0; i < allPaperFormChilden.length; i++)
            {   
                if (allPaperFormChilden[i].tagName == 'DIV')
                {
                    paperFormPages.push(allPaperFormChilden[i]);
                }
            }
            
            for (var j = 0; j < paperFormPages.length; j++)
            {
               var pageNumber = j+1;
               var page = jQuery(paperFormPages[j]);
               
               if ((pageNumber)%2 == 0) {page.addClass('reverseSidePage');}// alert('back page');
               else if (pageNumber == paperFormPages.length) // add spacer if the last page of form is on front side
               {
  //                   alert('1 sided page');
                    
                    var spacer = document.createElement('div');
                    spacer.setAttribute('class', 'doubleSideSpacerPage');
                    
                    var txt = document.createTextNode("\u00a0");
                    spacer.appendChild(txt);
                    
                    paperFormPages[j].parentNode.insertBefore( spacer, paperFormPages[j].nextSibling );
                    break;
               }
               else {page.removeClass('reverseSidePage');page.removeClass('doubleSideSpacerPage');}// alert('front page');
               
            }
        }

        function hidePhysicianName(hideName)
        {
            if (hideName)
            {
                jQuery('.AppointmentPhysicianLabel').css( 'display', 'none' );
            }
            else
            {
                jQuery('.AppointmentPhysicianLabel').css( 'display', 'inline' );
            }
        }


        /* ]]> */
    </script>
    <style media="all" type="text/css">
    .reverseSidePage
    {
        /*margin-left: 60px; */

    }
    .reverseSidePage div.VerticalBarCodeDiv
    {
    	/* left: 10px;  */
    	display: none;
    }
    
    .lastPageOnFrontSide
    {
        page-break-after:always;
        page-break-before:always;
    }
    .doubleSideSpacerPage
    {
        page-break-after:always;
    }
    .VerticalBarCodeDiv 
    {
        font-family:Bar-Code39,Code39One,Code39OneText;
    }

    </style>
    <style media="screen" type="text/css">
        body
        {
            background-color: transparent;
        }
    </style>
    <style media="print" type="text/css">
        body
        {
            background-color: #ffffff;
        }
    </style>
</head>
<body id="formContentBody" style="margin: 0px 0px 0px 0px;" runat="server"  >
    <asp:PlaceHolder ID="formHolder" runat="server"></asp:PlaceHolder>

    <script type="text/javascript">
        /* <![CDATA[ */

       if (window.CheckPageBreaks) { CheckPageBreaks(); jQuery('div[id$="LastPageInForm"]').last().css( 'page-break-after', 'avoid' ); }

        if (parent.togglePrintButton) { parent.togglePrintButton(true); }
        
        
        if (typeof parent.printDoubleSided != 'undefined' && parent.printDoubleSided == true && showBarCodes)
        {
           setDoubleSidedPrinting(true);
        }
        
        
        if (typeof parent.hideAttendingName != 'undefined' && parent.hideAttendingName == true )
        {
           hidePhysicianName(true);
        }
        
        

        /* ]]> */
    </script>

</body>
</html>