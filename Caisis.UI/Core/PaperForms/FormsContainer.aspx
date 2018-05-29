<%@ Reference Page="~/Core/PaperForms/FormsContent.aspx" %>
<%@ Page language="c#" Inherits="Caisis.UI.Core.PaperForms.FormsContainer" CodeFile="FormsContainer.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="../Help/helpToolTip.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>FormsContainer</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	<script src="../../ClientScripts/Help.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery-ui.js"></script>

	<script type="text/javascript">
		var helpArray = new Array();
		helpArray.PrintForm="<b>Reminder:</b><br/>For accurate printing results, please eliminate the header and footer and set all margins to 0.25 inches (or less) in the Page Setup Dialog Box of your browser.";
		helpArray.LoadingForm="The requested forms are loading and will soon be available for printing.";
		helpArray.DoubleSided="Turn this setting <strong>ON</strong><br/>only if your printer is set to print in duplex (double-sided) mode. Leave <strong>OFF</strong> otherwise.";
		helpArray.DoubleSidedInactive="Double-sided printing has been <strong>DISABLED</strong> by a System Adminsitrator.<br/><br/>When printing Caisis paper forms, please ensure that your printer is NOT set to print in duplex (double-sided) mode.";
		helpArray.HidePhysician="Set this option to <strong>HIDE</strong> if you wish to hide the physician's name on the first page of printed forms.";
	</script>
    <script type="text/javascript">  
    /* <![CDATA[ */
    
    jQuery.noConflict();

    
    function setFormTitle(title){
	    document.getElementById('formTitleSectionName').innerHTML = title;
    }

    function CheckIsIE() 
    { 
        if  (navigator.appName.toUpperCase() == 'MICROSOFT INTERNET EXPLORER')
		    { return true;} 
        else { return false; } 
    } 


    function printForm() 
    { 
        window.frames['FormsContent'].focus(); 
        window.frames['FormsContent'].print(); 
    }
    
    function togglePrintButton(show)
    {
        
        var PrintingContainer = $('PrintingContainer');
        var loadingIconContainer = $('loadingIconContainer');
        
        if (show)
        {
            PrintingContainer.style.display = 'inline';
            loadingIconContainer.style.display = 'none';
        }
        else
        {
            PrintingContainer.style.display = 'none';
            loadingIconContainer.style.display = 'block';
        }
        
    }
    
    function setBatchPrintButton()
    {
        var printFormButton = $('printFormButton');
        printFormButton.src = '../../Images/FormImages/PrintTheseForms.gif';
    }
    function highlightFormBatch(highlightNumber) 
    {
        togglePrintButton(false);  // hide print button until batch is loaded.
        
	    for( i = 1; i <= <% =numFormBatches %>; i++ )
        {
		    if (highlightNumber == i)
		    {
			    document.getElementById('BatchNumber' + i.toString()).className = 'BatchPrintLinkOn';
		    }
		    else
		    {
			    document.getElementById('BatchNumber' + i.toString()).className = 'BatchPrintLinkOff';
		    }
        }
    	

    } 

    Browser.ResizeFrame( { heightOffset: 150 } );
    Browser.ResizeElement({ nodeId: 'FormsContent', heightOffset: 220 });
    
    var printDoubleSidedEnabled = <% = DoubleSidedPrintEnabled.ToString().ToLower() %>;
    var printDoubleSided = <% = DoubleSidedPrintPreference.ToString().ToLower() %>;
    var hideAttendingName = false;
    
    function switchDoubleSided(button)
    {
    
        if (printDoubleSidedEnabled)
        {
    
            printDoubleSided = !printDoubleSided;
            
            if (printDoubleSided)
            {
                document.getElementById('DoubleSidedContainer').className = 'DoubleSidedON';
            }
            else
            {
                document.getElementById('DoubleSidedContainer').className = '';
            }
            
            if (typeof (window.frames['FormsContent'].setDoubleSidedPrinting) != 'undefined' )
            {
                window.frames['FormsContent'].setDoubleSidedPrinting(printDoubleSided);
            }
            
            
            $('DoubleSidedIndicator').innerHTML = printDoubleSided ? 'ON\u00a0' : 'OFF';
            
            jQuery.post('FormsContainer.aspx', { 'NewDoubleSidedPrintingSetting': printDoubleSided.toString() });
        
        }
        else
        {
            
        }
    }
    

    function hidePhysicianLabel(button)
    {
        
    
            hideAttendingName = !hideAttendingName;
            
            if (hideAttendingName)
            {
                document.getElementById('HideAttendingContainer').className = 'attendingHidden';
            }
            else
            {
                document.getElementById('HideAttendingContainer').className = '';
            }
            
            if (typeof (window.frames['FormsContent'].hidePhysicianName) != 'undefined' )
            {
                window.frames['FormsContent'].hidePhysicianName(hideAttendingName);
            }
            
            
            $('HideAttendingIndicator').innerHTML = hideAttendingName ? 'HIDE\u00a0\u00a0\u00a0' : 'SHOW';
            
    
    }
    

    /* ]]> */
    </script>
    
    
    <style type="text/css">
    #printFormButton
    {
        height: 23px;
        margin: 0px 30px 0px 0px;
        cursor: pointer;
        display: none;
    }
    #loadingFormIcon
    {
        height: 23px;
        margin: 0px 60px 0px 0px;
    }
    
    #printingOuterContainer
    {
        height: 23px;
        margin: 6px 0px 0px 0px;
    }
    #loadingIconContainer
    {
    }
    #PrintingContainer
    {
    }
    div#DoubleSidedContainer
    {
        padding: 5px 6px 5px 6px;
        border: solid 1px #98A8B5;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 11px;
        color: #5E778A;
        background-color: #F8FAFC;
        font-weight: 400;
        cursor: pointer;
        border-radius: 3px;
        display: inline;
        margin: 0px 5px 0px 5px;
    }
    div#DoubleSidedContainer:hover
    {
        border: solid 1px #37566E;
        background-color: #ffffff;
        color: #37556D;
    }
    div#DoubleSidedContainer.DoubleSidedON
    {
        border: solid 1px #128537;
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
        border: solid 1px #145C17;
    }
    div#DoubleSidedContainer span.DoubleSidedIndicator
    {
        font-weight: bold;
    }
    #DoubleSidedContainer.DoubleSidedON span.DoubleSidedIndicator
    {
        color: #ffffff;
    }
    #PrintButton
    {
        padding: 5px 6px 5px 30px;
        background-image: url(../../Images/printFormsButtonBG.png);
        background-position: 5px 2px;
        background-repeat: no-repeat;
        border: solid 1px #98A8B5;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 11px;
        color: #37556D;
        background-color: #F8FAFC;
        font-weight: 400;
        cursor: pointer;
        border-radius: 3px;
        display: inline;
        margin: 0px 10px 0px 5px;
    }
    #PrintButton:hover
    {
        border: solid 1px #37566E;
        background-color: #ffffff;
    }
    
    
    div#HideAttendingContainer
    {
        padding: 5px 6px 5px 6px;
        border: solid 1px #98A8B5;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 11px;
        color: #5E778A;
        background-color: #F8FAFC;
        font-weight: 400;
        cursor: pointer;
        border-radius: 3px;
        display: inline;
    }
    div#HideAttendingContainer:hover
    {
        border: solid 1px #37566E;
        background-color: #ffffff;
        color: #37556D;
    }
    div#HideAttendingContainer.attendingHidden
    {
        border: solid 1px #8d2a2c;
        background-color: #8d2a2c;
        color: #ffffff;
        
        
        
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#BD1F2A', endColorstr='#8d2a2c'); /* for IE */
	    background-image: -webkit-gradient(
		    linear,
		    left top,
		    left bottom,
		    color-stop(0, #BD1F2A),
		    color-stop(1, #8d2a2c)
	    );
	    background-image: -moz-linear-gradient(
		    center top,
		    #BD1F2A 0%,
		    #8d2a2c 100%
	    );	
        
        
    }
    div#HideAttendingContainer.attendingHidden:hover
    {
        border: solid 1px #145C17;
    }
    div#HideAttendingContainer span.HideAttendingIndicator
    {
        font-weight: bold;
    }
    #HideAttendingContainer.attendingHidden span.HideAttendingIndicator
    {
        color: #ffffff;
    }
    
    
    
    
    </style>
    
  </head>
  <body>
  <uc1:helpToolTip id="HelpToolTipLayer" runat="server" />
  <form runat="server" >
	<table width="940" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	<td width="57" valign="top"><a href="FormsSplash.aspx"><img border="0" src="../../Images/GoToFormsStartPage.gif" width="57" height="45" vspace="3"></a>
	</td>
  	<td>
	<table width="820" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td colspan="4" class="ListManTitle"><span id="formTitleSectionName">Caisis</span>&nbsp;<asp:Literal ID="FormTitleMod" Runat="server">Form</asp:Literal> <asp:Label ID="formTitlePatientName" Runat="server"></asp:label></td>
			<td colspan="2" style="text-align: right; vertical-align: bottom;">
			
			<div id="printingOuterContainer">
			    <div id="loadingIconContainer"><img id="loadingFormIcon" src="../../Images/loading_small.gif"  onmouseover="showToolTip('LoadingForm')" onmouseout="hideToolTip()" /></div>
			    <div id="PrintingContainer" style="display: none;" >
			    
			    <div id="HideAttendingContainer" <% = (Request.Form["batchPrint"] != null) ? "" : " style=\"display: none;\"" %> onclick="hidePhysicianLabel(this);" onmouseover="showToolTip('HidePhysician')" onmouseout="hideToolTip()" >
			    Attending Name: <span id="HideAttendingIndicator" class="HideAttendingIndicator"><% = ((HideAttendingPreference) ? "SHOW" : "HIDE")%></span></div>
			    
			        <div id="DoubleSidedContainer" onclick="switchDoubleSided(this);" onmouseover="showToolTip('<% = (DoubleSidedPrintEnabled) ? "DoubleSided" : "DoubleSidedInactive" %>')" onmouseout="hideToolTip()" >Double Sided Printing: <span id="DoubleSidedIndicator" class="DoubleSidedIndicator"><% = (DoubleSidedPrintEnabled) ? ((DoubleSidedPrintPreference) ? "ON" : "OFF") : "Disabled"%></span></div>
			        <div id="PrintButton" onclick="printForm();" onmouseover="showToolTip('PrintForm')" onmouseout="hideToolTip()"><% = (Request.Form["batchPrint"] != null) ? "Print These Forms" : "Print This Form" %></div>
			    </div>
			</div>

			
			</td>
		</tr>


			<asp:Repeater ID="rptPrintBatches" runat="server" >
				<HeaderTemplate>
				<tr><td colspan="6" valign="bottom" height="17">Forms have been split into <% =numFormBatches %> batches:&nbsp;&nbsp;
				</HeaderTemplate>
				<ItemTemplate>
					<a class="BatchPrintLinkOff" id="BatchNumber<%# DataBinder.Eval(Container.DataItem, "BatchNumber") %>" onClick="highlightFormBatch(<%# DataBinder.Eval(Container.DataItem, "BatchNumber") %>)" target="FormsContent" href="<%# DataBinder.Eval(Container.DataItem, "BatchUrlString") %>"><%# DataBinder.Eval(Container.DataItem, "BatchBeginningFormNumber") %>-<%# DataBinder.Eval(Container.DataItem, "BatchEndingFormNumber") %></a>
				</ItemTemplate>
				<SeparatorTemplate>&nbsp;&nbsp;&nbsp;</SeparatorTemplate>
				<FooterTemplate>
				</td></tr>
				</FooterTemplate>
			  </asp:Repeater>
		
		
		<tr>
			<td colspan="6"><img src="../../Images/shim.gif" width="10" height="8"></td>
		</tr>
		<tr>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="10" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="20" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="360" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="420" height="5"></td>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
		</tr>
		<tr>
			<td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			<td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
			<td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
		</tr>
		<tr>
			<td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			<td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
			<td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
		</tr>
		<tr>
			<td height="400" class="ListManBGTableLeftSide">&nbsp;</td>
			<td colspan="2" class="ListManBGTableBody">&nbsp;</td>
			<td colspan="2" valign="top" class="ListManBGTableBody">
			<iframe id="FormsContent" name="FormsContent" src="FormsContent.aspx" width="750" height="375" scrolling="auto" frameborder="0" runat="server">
			</iframe>
			</td>
			<td class="ListManBGTableRightSide">&nbsp;</td>
		</tr>
		<tr>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
			<td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="10" height="5"></td>
			<td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="20" height="5"></td>
			<td colspan="2" class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="1" height="1"></td>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
		</tr>
	</table>
	</td></tr></table>
	<!--- don't delete this div - needed for the help functionality --->
	<div class="patientDataFormDiv" id="PDFormDiv" style="visibility: hidden;"></div>


<script type="text/javascript">if (printDoubleSided) document.getElementById('DoubleSidedContainer').className = 'DoubleSidedON';</script>

	</form>
  </body>
</html>
