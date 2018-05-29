<%@ Page language="c#" Inherits="Caisis.UI.Core.Eforms.EFormPrintableText" CodeFile="EFormPrintableText.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>EFormNarrativeText</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
	
	<script src="../../ClientScripts/formsJS.js" type="text/javascript"></script>
<script   language="javascript" type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery-ui.js"></script>
	
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
	<link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet">
	<!-- 
	//		OVERRIDE- need these empty js shells and css styles to void user interaction with printable eform narrative
	-->
	<style type="text/css">
	.chronListHilighted{background-color: #ffffff;cursor:default;}
	.EFormTableRow{background-color: #ffffff;cursor:default;}
	</style>
	<script type="text/javascript" >
	
	
    jQuery.noConflict();
	
	
	// empty function so onclick events on approved eforms do nothing (TODO: remove onclick events from transform saved in DB)
	function LoadComponentByField(field)
	{	
	}
	function LoadComponentByTable(table, recordId)
	{		
	}
	function LoadDataEntryForm(table, id, fields, anchorname)
	{		
	}
	function LoadComponentByTableAndFields()
	{
	}
	
	
	
	var pageMaxHeight = 1020;
	var currentPageStartY = 0;
	var currentPaperFormNeedsToBeRenumbered = false;
	var InstShortName = '<%= ConfigurationSettings.AppSettings["institutionShortName"] %>';
    var showBarCodes = true;
	
        function checkBrowser() {
            this.ver = navigator.appVersion
            this.dom = document.getElementById ? 1 : 0
            this.ie5 = (this.ver.indexOf("MSIE 5") > -1 && this.dom) ? 1 : 0;
            this.ie6 = (this.ver.indexOf("MSIE 6") > -1 && this.dom) ? 1 : 0;
            this.ie7 = (this.ver.indexOf("MSIE 7") > -1 && this.dom) ? 1 : 0;
            this.ie8 = (this.ver.indexOf("MSIE 8") > -1 && this.dom) ? 1 : 0;
            this.ie9 = (this.ver.indexOf("MSIE 9") > -1 && this.dom) ? 1 : 0;
            this.ie4 = (document.all && !this.dom) ? 1 : 0;
            this.ns5 = (this.dom && parseInt(this.ver) >= 5) ? 1 : 0;
            this.ns4 = (document.layers && !this.dom) ? 1 : 0;
            this.bw = (this.ie5 || this.ie4 || this.ns4 || this.ns5)
            return this
        }

        bw = new checkBrowser()
        if (bw.ie7 || bw.ie8 || bw.ie9) {
            document.write('<link href="../../StyleSheets/IE7FormStyles.css" rel="stylesheet" type="text/css" media="all">')
            pageMaxHeight = 1100;
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

        
        
        
		
		
	</script>
	
	<style type="text/css">
	
	.masterTable {
	width: 90%;
	}
	.pageWidth {
		width: 90%;
	}
	.pageWidth98percent {
		width: 98%;
	}
	.pageWidth90percent {
		width: 90%;
	}
	.VerticalBarCodeDiv 
	{
		left:0px;
		width: 96%;
		text-align: right;
	    font-size:34px;
	}
	.VerticalBarCodeMRN {
		top:45px; 
	}
	.VerticalBarCodeDocType {
		top:346px;
	}
	.VerticalBarCodeAcctType {
		top:476px;
	}
	.VerticalBarCodeDate {
		top:845px;
	}
	.VerticalBarCodeDateText 
	{
		top:715px;
	}
	.VerticalBarCodeDateTextBG
	{
		top:710px;
	}
	.VerticalBarCodeStatement {
		top:20px;
	}	
	
	
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
  </head>
  <body style="background-color: #ffffff;">
	
	<div id="theNarrative" runat="server" >

	</div>
	
	
	
	<script type="text/javascript">
//		ScanPagesForAdditionalPageBreaks();CheckPageBreaks();
        
        if (parent.togglePrintButton) { parent.togglePrintButton(true); }
        if (window.CheckPageBreaks) { CheckPageBreaks(); }
        
        if (typeof parent.printDoubleSided != 'undefined' && parent.printDoubleSided == true && showBarCodes)
        {
           setDoubleSidedPrinting(true);
        }
        
	</script>
	
	
  </body>
</html>
