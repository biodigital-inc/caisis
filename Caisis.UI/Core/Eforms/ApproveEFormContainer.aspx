<%@ Page language="c#" Inherits="Caisis.UI.Core.Eforms.ApproveEFormContainer" CodeFile="ApproveEFormContainer.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
<head>
    <title>Approve Eform</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script src="../../ClientScripts/EFormScripts.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery-ui.js"></script>
    
    
    <script type="text/javascript">  
    /* <![CDATA[ */
    
    jQuery.noConflict();
    
    MM_reloadPage(true);

	Browser.ResizeElement( { customResizer: setEFormApprovalHeights } );

	function setEFormApprovalHeights(_winWidth, _winHeight)
	{
		// Elements that need sizing are: ApprovalMainTd, NarrativeFrame, ApprovalLeftNavTd
	    var winHeight = (_winHeight != null ? _winHeight : getHeight(top)) - 205; // adjust this variable to set eform clinic list window screen height
	    var NavTdHeight = Math.max(winHeight + 75, 100);
		var MainTdHeight = Math.max(winHeight, 100);
		var ApprovalFrameHeight = Math.max(winHeight - 10, 100);
		
		$('ApprovalMainTd').style.height = MainTdHeight + 'px';
		$('<% = NarrativeFrame.ClientID %>').style.height = ApprovalFrameHeight + 'px';
		$('ApprovalLeftNavTd').style.height = NavTdHeight + 'px';		
	}
			
	var allLink = parent.document.getElementById('EFormMenus_PatientAllEformLink');
	if (allLink != null) {
		allLink.href = 'Index.aspx?epid=<%= Caisis.Security.CustomCryptoHelper.Encrypt(Session[Caisis.UI.Core.Classes.SessionKey.PatientId].ToString()) %>&status=ListAllEForms';
		allLink.style.display = 'inline';
	}
	
	function LoadComponentByField(field, anchorPrefix, recordId)
	{
		alert('Sorry...this eform has been approved and is no longer editable.');
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
	
    var printDoubleSidedEnabled = <% = DoubleSidedPrintEnabled.ToString().ToLower() %>;
    var printDoubleSided = <% = DoubleSidedPrintPreference.ToString().ToLower() %>;
    
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
            
            if (typeof (window.frames['NarrativeFrame'].setDoubleSidedPrinting) != 'undefined' )
            {
                window.frames['NarrativeFrame'].setDoubleSidedPrinting(printDoubleSided);
            }
            
            
            $('DoubleSidedIndicator').innerHTML = printDoubleSided ? 'ON\u00a0' : 'OFF';
            
            jQuery.post('ApproveEFormContainer.aspx', { 'NewDoubleSidedPrintingSetting': printDoubleSided.toString() });
        
        }
        else
        {
            
        }
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
        padding: 3px 6px 3px 6px;
        border: solid 1px #98A8B5;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 11px;
        color: #5E778A;
        background-color: #F8FAFC;
        font-weight: 400;
        cursor: pointer;
        border-radius: 3px;
        display: inline;
        margin-right: 20px;
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
    
    
    </style>
    

</head>

<!-- USERS SHOULD NOW ONLY BE ON THIS PAGE AFTER FORM HAS BEEN APPROVED -->
  <body class="eformBody" >
	
    

<form id="Form1" method="post" runat="server">



<div class="EFormWarningDiv" id="PrintWarningDiv">
<table cellpadding="20" cellspacing="0" border="0" width="500" ><tr><td align="center" valign="center" height="200"  ><img src="../../Images/CaisisPreparingToPrint.gif" width="284" height="112"/></td></tr></table>

</div>


	
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center"><table width="990" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="3" style="background-color:#395065;"><img src="../../Images/shim.gif" width="1" height="2"/></td>
          </tr>
          <tr> 
            <td colspan="3"><img src="../../Images/shim.gif" width="1" height="1"/></td>
          </tr>
          <tr> 
            <td width="216" valign="top">
<table width="216" border="0" cellspacing="0" cellpadding="0" class="eformBox">
                <tr> 
                  <td><img src="../../Images/EFormBoxTopLeft.gif" width="5" height="5"></td>
                  <td><img src="../../Images/shim.gif" width="206" height="1"></td>
                  <td><img src="../../Images/EFormBoxTopRight.gif" width="5" height="5"></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td id="ApprovalLeftNavTd" height="500" valign="top" align="center"> 
                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="18">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td class="EFormSideBarTitle"><asp:Literal ID="NavTitle" Runat=server></asp:Literal></td>
                      </tr>
                     <tr> 
                        <td height="18">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td height="220" valign="top"  class="previewText">
                        <asp:Label ID="UserMsg" Runat=server></asp:Label>
						</td>
					  </tr>
					  <tr>
						<td><asp:Label ID="ViolationMsg" Runat=server></asp:Label>
						</td>
					  </tr>
					  <tr>
						<td align="center">&nbsp;</td>
					  </tr>
                    </table>
                  </td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td><img src="../../Images/EFormBoxBottomLeft.gif" width="5" height="5"></td>
                  <td><img src="../../Images/shim.gif" width="1" height="1"></td>
                  <td><img src="../../Images/EFormBoxBottomRight.gif" width="5" height="5"></td>
                </tr>
              </table></td>
            <td>&nbsp;</td>
            <td width="764" valign="top">
<table width="764" border="0" cellspacing="0" cellpadding="0" class="eformBox">
                <tr> 
                  <td><img src="../../Images/EFormBoxTopLeft.gif" width="5" height="5"></td>
                  <td><img src="../../Images/shim.gif" width="10" height="1"></td>
                  <td><img src="../../Images/shim.gif" width="744" height="1"></td>
                  <td><img src="../../Images/EFormBoxTopRight.gif" width="5" height="5"></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td valign="top">&nbsp;</td>
                  <td height="500" valign="top"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
						 
                       <tr> 
                        <td height="12"><img src="../../Images/shim.gif" width="1" height="1"><br/> 
                        </td>
                      </tr>
                      
                      <tr> 
                        <td class="EFormMainTitle"><img src="../../Images/StepEnd_Active.gif" width="312" height="15"  style="margin-right: 20px;" align="right" /><asp:Literal ID="EFormTitle" Runat=server></asp:Literal></td>
                      </tr>
                      <tr> 
                        <td class="EFormRedLine"><img src="../../Images/shim.gif" width="1" height="1"></td>
                      </tr>
                      <tr> 
                        <td height="17">&nbsp;</td>
                      </tr>
                      <tr>
                        <td id="ApprovalMainTd" height="525" valign="top">
           
						<!-- Just output narrative in non editable form for approval: src set server side -->
						
						<iframe id="NarrativeFrame" name="NarrativeFrame" runat="server" width="740" height="415" scrolling="auto" frameborder="0" style="border: solid 1px #cccccc;"></iframe>
           
           
						
						</td>
                      </tr>
					  <tr> 
                        <td height="17" align="right"> 
                        
                        <div id="printingOuterContainer">
			                <div id="loadingIconContainer"><img id="loadingFormIcon" src="../../Images/loading_small.gif" /></div>
			                <div id="PrintingContainer"  style="display: none;" >
			                    <div id="DoubleSidedContainer" onclick="switchDoubleSided(this);"  >Double Sided Printing: <span id="DoubleSidedIndicator" class="DoubleSidedIndicator"><% = (DoubleSidedPrintEnabled) ? ((DoubleSidedPrintPreference) ? "ON" : "OFF") : "Disabled"%></span></div><img id="PrintBtn" runat="server" src="../../Images/PrintThisEForm_2.gif" width="164" height="26" border="0"  onclick="printNarrative();" style="cursor: pointer; vertical-align: middle;" /><%-- <div id="PrintButton" onclick="printNarrative();"  >Print This Form</div>--%>
			                </div>
			            </div>
                        
                        
                        
                      	
						<img src="../../Images/shim.gif" width="15" height="1">
                        </td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td><img src="../../Images/EFormBoxBottomLeft.gif" width="5" height="5"></td>
                  <td><img src="../../Images/shim.gif" width="1" height="1"></td>
                  <td><img src="../../Images/shim.gif" width="1" height="1"></td>
                  <td><img src="../../Images/EFormBoxBottomRight.gif" width="5" height="5"></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>

<script type="text/javascript">if (printDoubleSided) document.getElementById('DoubleSidedContainer').className = 'DoubleSidedON';</script>
<asp:Literal ID="PrintPageOnLoadScript" Runat="server" Visible="False" ><script  language="JavaScript" type="text/JavaScript">printNarrativeOnLoad();</script></asp:Literal>

</body>
</html>
