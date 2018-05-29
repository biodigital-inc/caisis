<%@ Page language="c#" Inherits="Caisis.UI.Core.Eforms.ReviewEFormContainer" CodeFile="ReviewEFormContainer.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Reference Control="~/Plugins/FileLoader/FileLoaderPlugin.ascx" %>

<html>
  <head>
	<title>Review Eform</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
	<link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	
	
<style type="text/css">

div.referToPanelContainer
{
	position: relative;
	display: block;
	width: 320px;
}
div#referToPanel
{
    display: none;
	position: absolute;
	bottom: 20px;
	left: -100px;
	z-index: 5000;
	width: 330px;
	font-family: Arial, Helvetica, sans-serif;
}

div#referToPanelHeader
{
	position: relative;
	height: 35px;
	overflow: hidden;
	background-image: url(../../Images/ReferEFormPanelTop.png);
}


div#referToPanelHeaderText
{
	position: absolute;
	top: 21px;
	left: 25px;
	font-size: 12px;
	color: #ffffff;
	font-weight: bold;
}

div#referToPanelBody
{
	position: relative;
	height: 472px;
	background-image: url(../../Images/ReferEFormPanelBottom.png);
	background-position: left bottom;
	background-repeat: no-repeat;
}


div#referToPanelBody div.referToPanelSubheader
{
    background-color: #d1d1d1;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #000000;
	padding: 3px 6px 3px 6px;
	overflow: hidden;
	margin: 6px 19px 0px 19px;
}

div#referToPanelBody div#referToPanelContent
{
	position: absolute;
	left: 19px;
	width: 292px;
	height: 258px;
	overflow: auto;
	overflow-x: hidden;
	
}


div#referToPanelContent table
{
	width: 100%;
}


div#referToPanelContent table tr
{
	background-color: #ffffff;
}
div#referToPanelContent table tr:hover
{
	background-color: #EAD7D7;
}

div#referToPanelContent table tr.altRow
{
	background-color: #dfdfdf;
}
div#referToPanelContent table tr.altRow:hover
{
	background-color: #EAD7D7;
}

div#referToPanelContent table tr:hover td
{
	color: #000000;
	background-color: #EAD7D7;
}
div#referToPanelContent table tr.altRow:hover td
{
	color: #000000;
	background-color: #EAD7D7;
}
div#referToPanelContent table td
{
	padding: 4px 8px 4px 8px;
	font-size: 12px;
	color: #111111;
	font-weight: normal;
	cursor: pointer;
}

div#referToPanelContent table td.checkboxCol
{
	padding: 4px 0px 4px 8px;
	width: 20px;
}

div#referToPanelBody div#referToMessageContainer
{
	position: absolute;
	top: 286px;
	left: 19px;
	width: 292px;
	overflow: auto;
}

div#referToButtonContainer
{
	position: absolute;
	top: 448px;
	padding-left: 30px;
}
div#referToButtonContainer span.button
{
    display: inline-block;
	border: solid 1px #bbbbbb;
	padding: 4px 10px 4px 10px;
	font-size: 10px;
	color: #666666;
	font-weight: bold;
	cursor: pointer;
	border-radius: 4px;
}
div#referToButtonContainer span.button:hover
{
	border: solid 1px #8d2a2c;
	color: #8d2a2c;
}
span.ReviewEFormOptionButtonContainer
{
    display: inline-block;
    background-image: url(../../Images/ReferEFormToggleLeft.png);
    background-position: top left;
    background-repeat: no-repeat;
    cursor: pointer;
	padding: 0px 0px 0px 8px;
	margin-top: 8px;
}
span.ReviewEFormOptionButton
{
    display: inline-block;
    height: 22px;
    background-image: url(../../Images/ReferEFormToggleRight.png);
    background-position: top right;
    background-repeat: no-repeat;
    cursor: pointer;
	padding: 4px 8px 0px 0px;
	font-size: 11px;
	color: #111111;
	font-weight: normal;
}

span.ReviewEFormOptionButton input
{
    line-height: 11px;
    vertical-align: middle;
}
span#ReferToDisplayText
{
	font-style: italic;
	font-weight: bold;
}
div#referToPanelHeader img.closeButton
{
    width: 13px;
    height: 11px;
    background-image: url(../../Images/PanelRedTitleBarButton_Close.png);
    background-repeat: no-repeat;
    cursor: pointer;
    position: absolute;
    top: 20px;
    right: 20px;
}
div#referToPanelHeader img.closeButton:hover
{
    background-image: url(../../Images/PanelRedTitleBarButton_Close_hover.png);
}

</style>
	
    <script type="text/javascript">  
    /* <![CDATA[ */

    Browser.ResizeElement( { customResizer: setEFormNarrativeHeights } );
    
    function setEFormNarrativeHeights(_winWidth, _winHeight)
	{
		// Elements that need sizing are: MainAreaTd, PDFormDiv, LeftNavigationTd, LeftNavigationDiv
	    var winHeight = (_winHeight != null ? _winHeight : getHeight(top)) - 184; // adjust this variable to set eform clinic list window screen height
	    var NavTdHeight = Math.max(winHeight + 51, 100) + 'px';
		var MainTdHeight = Math.max(winHeight - 21, 100) + 'px';
		
		$('LeftNarrativeNavTd').style.height = NavTdHeight;
		$('<% = ReviewDataFrame.ClientID %>').style.height = MainTdHeight;
	}
	
//	<!--
	function MM_reloadPage(init) {  //reloads the window if Nav4 resized
	if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
		document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
	else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
	}
	MM_reloadPage(true);

	// called on page load and on key press of the div containing the narrative
	function setHiddenField()
	{
		document.getElementById('NarrativeHolder').value = document.getElementById('theNarrative').innerHTML;
	}
	
	// NOTE: next 3 functions are called from ReviewEform.aspx which are called from the xsl, or EFormVerify.ascx.cs
	function LoadComponentByField(field, anchorPrefix, recordId)
	{
		isEFormApproved('false');	
//		document.getElementById('PopupFrame').src = 'EFormUpdateElement.aspx?eformId=' + eformId +'&dataElement=' + field + '&recordId=' + recordId;
		
		var fullPath = 'EFormUpdateElement.aspx?eformId=' + eformId +'&dataElement=' + field + '&recordId=' + recordId;
        top.showModalWithConfig(fullPath,'Edit ' + field, {  }, window ); 
		
		LoadComponentLayer(anchorPrefix);
	}
	function LoadComponentByTable(table, recordId)
	{
		isEFormApproved('false');
		
		var fullPath = 'EFormUpdateElement.aspx?eformId=' + eformId +'&dataTable=' + table + '&recordId=' + recordId;
        top.showModalWithConfig(fullPath,'Edit ' + table + ' Record', {  }, window ); 
		
//		document.getElementById('PopupFrame').src = 'EFormUpdateElement.aspx?eformId=' + eformId +'&dataTable=' + table + '&recordId=' + recordId;
		LoadComponentLayer(table);
	}
	function LoadComponentByTableAndFields(table, fields, anchorPrefix)
	{		
		isEFormApproved('false');
//		document.getElementById('PopupFrame').src = 'EFormUpdateElement.aspx?eformId=' + eformId +'&table=' + table + '&fields=' + fields;

		var fullPath = 'EFormUpdateElement.aspx?eformId=' + eformId +'&table=' + table + '&fields=' + fields;
        top.showModalWithConfig(fullPath,'Edit ' + table + ' Record', {  }, window ); 

		LoadComponentLayer(anchorPrefix);
	}
	// displays layer with eform component
	function LoadComponentLayer(anchorPrefix)
	{
		var anchor = document.getElementById('CurrentSectionAnchor');
			
		if(anchorPrefix != null && anchorPrefix != "")
		{
			anchor.value = anchorPrefix + '_Anchor';
		}
	}
	
	// pops open dynamic form
	function LoadDataEntryForm(table, id, fields)
	{
			isEFormApproved('false');
			
			
			var fullPath = '../DataEntryForms/DynamicForm.aspx?tablename=' + table + '&pkey=' + id + '&fields=' + fields;
            top.showModalWithConfig(fullPath,'Edit ' + table + ' Record', {  }, window ); 

			
			if(document.getElementById('CurrentSectionAnchor') != null)
			{
				var anchor = document.getElementById('CurrentSectionAnchor');
				anchor.value = table + '_Anchor';
			}
	}
	
	function ClosePopup()
	{
			top.hideModal();
	}
	function CloseDynFormPopup()
	{
            top.hideModal();
	}
	function reloadDataIframe()
	{
        window.frames['ReviewDataFrame'].window.location.reload(); 
	}
	function RetrieveAnchor()
	{
		var anchor = document.getElementById('CurrentSectionAnchor');
		if (anchor.value != null && '' != anchor.value) {
			return anchor.value;
		} else {
			return null;
		}
	}
	
	// 1. submitReviewDataFrame called by onclick of step wise navigation and bottom large save btn
	// 2. uses hidden frame to confirm eform was not already approved
	// 3. hidden frame calls submitMe() if eform has not already been approved, else redirects user to clinic list
	function submitReviewDataFrame()
	{	
		
		if (!approvalIsDisabled) { isEFormApproved(true); }
		else { showSignatureAlert(); }
		
		//window.frames['ReviewDataFrame'].document.forms[0].submit();
	}
	
	
	function SaveAndCloseReviewDataFrame()
	{
		this.location.href = 'EFormSplash.aspx'; 
	}
	
	
	// checks to see if someone else already approved the eform using hidden frame
	function isEFormApproved(shouldSubmit)
	{
//	    var referToStr = referToList();
//	    var referToURL = (referToStr.length > 0) ? ('&referTo=' + referToStr) : '';
	    
		// if shouldSubmit equal to true hidden frame calls submitMe() after checking approval status
		document.getElementById('HiddenFrame').src = 'HiddenPage.aspx?eformId=' + eformId + '&action=isapproved&submitMe=' + shouldSubmit;	// + referToURL
	}
	function backToEditData(nodeName)
	{
		// redirect to EditEFormContainer
		this.location.href = "EditEFormContainer.aspx?eformId=" + eformId + "&nodeName=" + nodeName + ""; 
	}
	function submitMe()
	{
  	    var referToStr = referToList();
  	    
  	    if (referToStr.length > 0)
  	    {
  	        var referToMsg = document.getElementById('referToMessage').value;
  	        window.frames['ReviewDataFrame'].setReferrals(referToStr,referToMsg);
  	    }
  	    if (typeof window.frames['ReviewDataFrame'].setHiddenField == 'function') window.frames['ReviewDataFrame'].setHiddenField();
		window.frames['ReviewDataFrame'].document.forms[0].submit();
	}
	
	function showApproveButton(enableSignature)
	{
	    if (document.getElementById('ReviewStepButtons') != null)
	    {
	        document.getElementById('ReviewStepButtons').style.display = '';
	        
	        if (enableSignature && document.getElementById('<% = SignatureToggle.ClientID %>') != null) document.getElementById('<% = SignatureToggle.ClientID %>').style.display = '';
	        
	    }
	    
	    // if the transform doesn't have a signable signature line, allow approval without signature
	    if (!enableSignature)
	    {
	        approvalIsDisabled = false;
	        if (document.getElementById('<% = SaveButton.ClientID %>').src.toString().indexOf('ApproveThisForm') > -1) document.getElementById('<% = SaveButton.ClientID %>').src = '../../Images/ApproveThisForm.gif';
	    
	    }
	    
	}
	
	function printFormPreview()
	{
//	    var PrintingFrame = window.frames['PrintingFrame']
//	    PrintingFrame.src = 'EFormPrintableText.aspx?eformId=' + eformId;
//	    PrintingFrame.focus();
//        PrintingFrame.print();

        var ReviewDataFrame = window.frames['ReviewDataFrame'];
	    ReviewDataFrame.focus();
        ReviewDataFrame.print();

	}
	
		
	function checkReferralCBox(row)
	{
	    
	    var inputs = row.getElementsByTagName('input');
	    
	    if (inputs.length > 0 && inputs[0].type == 'checkbox')
	    {
	        var cbox = inputs[0];
	        cbox.click();
	    }
	}
	function referToList()
	{
	    //list of user IDs
	    var list = '';
	    var referToPanelContent = $('referToPanelContent');
	    
	    if (referToPanelContent != null)
	    {
	        var checkboxIdPrefix = 'referTo_';
	        var checkboxIdPrefixLength = checkboxIdPrefix.length;
	        var referToCBoxes = referToPanelContent.getElementsByTagName('input');
    	    
	        for (i=0; i<referToCBoxes.length; i++)
            {
                if (referToCBoxes[i].type == 'checkbox' && referToCBoxes[i].id != null && referToCBoxes[i].checked)
                {
                    var userId = referToCBoxes[i].id.substring(checkboxIdPrefixLength);
                    list += (list.length > 0) ? ('-' + userId) : userId;
                }
            }
        }
        return list;
	}
	function referToNameList()
	{
	    //list of user names
	    var list = '';
	    var checkboxIdPrefix = 'referTo_';
	    var checkboxIdPrefixLength = checkboxIdPrefix.length;
	    var referToPanelContent = $('referToPanelContent');
	    var referToCBoxes = referToPanelContent.getElementsByTagName('input');
	    
	    for (i=0; i<referToCBoxes.length; i++)
        {
            if (referToCBoxes[i].type == 'checkbox' && referToCBoxes[i].id != null && referToCBoxes[i].checked)
            {
                var userId = referToCBoxes[i].id.substring(checkboxIdPrefixLength);
                var userLastNameSpan = document.getElementById('ReferToLastName_' + userId.toString());
                
                if (typeof userLastNameSpan != 'undefined')
                {
                    var userLastName = userLastNameSpan.innerHTML;
                    list += (list.length > 0) ? (', ' + userLastName) : userLastName;
                }
            }
        }
        
        return list;
	}
	
	function showReferToPanel(show)
	{
	    var referToPanel = $('referToPanel');
	    if (show)
	    {
	        referToPanel.style.display = 'block';
	    }
	    else
	    {
	        referToPanel.style.display = 'none';
	        setReferralDisplay();
	    }
	}
	
	function setReferralDisplay()
	{
        var nameList = referToNameList();
        var ReferToDisplayText = $('ReferToDisplayText');
        
        if (nameList.length > 0)
        {
            var nameArray = nameList.split(',');
            var count = nameArray.length;

            if (count < 3)
            {
                ReferToDisplayText.innerHTML = '&nbsp;' + nameList;
            }
            else
            {
                var firstCommaIndex = nameList.indexOf(',');  
                var secondCommaIndex = nameList.indexOf(',', (firstCommaIndex+1));  
                var firstTwoNames = nameList.substring(secondCommaIndex);
                ReferToDisplayText.innerHTML = '&nbsp;' + nameArray[0] + ',' + nameArray[1] + ' +' + (count-2) + ' more';
            }
        }
        else { ReferToDisplayText.innerHTML = '...'; }
        
        
    //    ReferToDisplayText.innerHTML = (nameList.length > 0) ? ('&nbsp;' + nameList) : '...';
        
	}
	
	
	function uncheckAllReferrals()
	{
	    var referToPanelContent = $('referToPanelContent');
	    var referToCBoxes = referToPanelContent.getElementsByTagName('input');
	    
	    for (i=0; i<referToCBoxes.length; i++)
        {
            if (referToCBoxes[i].type == 'checkbox' && referToCBoxes[i].checked)
            {
                referToCBoxes[i].checked = false;
            }
        }
	    
	    setReferralDisplay();
	}
	
	
	var signatureImgUrl = '<% = userSignatureURL %>';
	var approvalIsDisabled = (signatureImgUrl.length > 0) ? true : false;
	
	
	
	function signForm(cboxToggle)
	{
	    var doSign = cboxToggle.checked;
	    
	    if (typeof window.frames['ReviewDataFrame'].signThisForm != undefined)
	    {
	        var now = new Date();
	        var signDate = (now.getMonth()+1) + '/' + now.getDate() + '/' + now.getFullYear();
	        var signHour = now.getHours();
	        var signMinute = now.getMinutes();
	        if (signMinute.toString().length < 2) signMinute = '0' + signMinute.toString();
	        var signAMPM = ' AM';
	        if (signHour >= 12) signAMPM = ' PM';
	        var signTime = (signHour > 12) ? ((signHour - 12) + ':' + signMinute + signAMPM) : (signHour + ':' + signMinute + signAMPM);
	        window.frames['ReviewDataFrame'].signThisForm(doSign,signatureImgUrl,signDate,signTime);
	    }
	    
	    
	    approvalIsDisabled = !doSign;
	    
	    if (document.getElementById('<% = SaveButton.ClientID %>').src.toString().indexOf('ApproveThisForm') > -1)
	    {
	        document.getElementById('<% = SaveButton.ClientID %>').src = (approvalIsDisabled) ?  '../../Images/ApproveThisForm_disabled.gif' : '../../Images/ApproveThisForm.gif';
	    }
	    
	}
	
	function showSignatureAlert()
	{
	    alert('This EForm requires your signature before approval.');
	}
	
	
//-->

    /* ]]> */
    </script>
</head>
  <body class="eformBody">
	
    
  	<form id="Form1" method="post" runat="server">
  	<input type="hidden" id="NarrativeHolder" runat="server" NAME="NarrativeHolder"/>
  	<input style="width:0" type="hidden" id="HiddenEFormId" runat="server" NAME="EFormId"/>
	<input style="width:0" type="hidden" id="HiddenEformName" runat="server" NAME="EformName">
	<input type="hidden" id="CurrentSectionAnchor" name="CurrentSectionAnchor" runat="server"/>
  	<input type="hidden" id="referralUserIDs" name="referralUserIDs" />
						
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
                  <td id="LeftNarrativeNavTd" height="500" valign="top" align="center"> 
                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="18">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td class="EFormSideBarTitle">Write Narrative <asp:Literal ID="PatientName" runat="server"></asp:Literal></td>
                      </tr>
                      <tr> 
                        <td height="18">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td height="200" valign="top"  class="previewText">The 
                          text contained within this document has been generated 
                          based on system data and information you entered for this 
                          visit.<br/>
                          <br/>
                          Corrections can be made by clicking on the row of data.
                         </td>
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
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="">
                       <!-- STEPS NAV BAR -->
                      <tr> 
                        <td height="12">
                          <img src="../../Images/shim.gif" width="1" height="1"><br/> 
                        </td>
                      </tr>
                      
                      <tr> 
                        <td class="EFormMainTitle"><table border="0" cellspacing="0" cellpadding="0" style="margin-right: 20px;" align="right"><tr><td><a href="" id="EditStep" runat="server" ><img src="../../Images/Step1_Active.gif" width="126" height="15" border="0" class="imageButtonOn" onClick="isEFormApproved('false')" onmouseover="this.src='../../Images/Step1_Over.gif'" onmouseout="this.src='../../Images/Step1_Active.gif'"></a><a id="NarrativeStep" runat="server" style="cursor: default;"><img src="../../Images/Step2_Active.gif" width="150" height="15" border="0"  ></a><img src="../../Images/StepEnd_Inactive.gif" width="36" height="15" border="0"  ></td></tr></table><asp:Literal ID="EFormTitle" runat="server"></asp:Literal></td>
                      </tr>
                      <tr> 
                        <td class="EFormRedLine"><img src="../../Images/shim.gif" width="1" height="1"></td>
                      </tr>
                      <tr> 
                        <td height="17">&nbsp;</td>
                      </tr>
                      <tr><!-- height set by Eforms/Index js function dynamically -->
                        <td id="MainNarrativeTd" valign="top">
                       
							<iframe id="ReviewDataFrame" name="ReviewDataFrame" frameborder="0"  runat="server" style="height: 425px; width: 750px; border: solid 1px #999999;"></iframe>
    
                        </td>
                     </tr>

                     <tr> 
						<td style="height: 26px;">
						
						<table cellspacing="0" cellpadding="0" id="ReviewStepControls"  style="width: 100%;">
						<tr>
						    <td style="width: 46%;">
						        <div id="referToPanelContainer" runat="server" visible="false" class="referToPanelContainer"><span id="ReferToDisplayContainer" class="ReviewEFormOptionButtonContainer" onclick="showReferToPanel(true);"><span id="ReferToDisplayInnerContainer" class="ReviewEFormOptionButton" >Refer This EForm to<span id="ReferToDisplayText">...</span></span></span>
                                <div id="referToPanel">
                                <div id="referToPanelHeader"><img alt="Close" title="Close" class="closeButton" src="../../Images/shim.gif"  onclick="showReferToPanel(false);" />
                                <div id="referToPanelHeaderText">Refer This EForm</div>
                                </div>
                                <div id="referToPanelBody">
                                <div class="referToPanelSubheader">Refer to</div>
                                <div id="referToPanelContent">
                                <table cellspacing="0" onclick="setReferralDisplay();">
                                <asp:Repeater runat="server" ID="ReferToRptr">
                                    <ItemTemplate>
                                            <tr onclick="checkReferralCBox(this);" <%# Container.ItemIndex % 2 == 0 ? "class=\"altRow\"" : "" %>  title="<%# Eval("UserEmail") %>" >
                                            <td class="checkboxCol"><input type="checkbox" id="referTo_<%# Eval("UserId")%>"   /></td>
                                            <td><span id="ReferToLastName_<%# Eval("UserId")%>"><%# Eval("UserLastName")%></span>, <span id="ReferToFirstName"><%# Eval("UserFirstName")%></span></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    
                                    <tr id="NoEFormReferees" runat="server" visible="true"  >
                                    <td >No users have been enabled to receive EForm referrals.<br /><br />
                                    Please contact a System Administrator to configure this feature.</td>
                                    </tr>
                                </table>
                                </div>
                                <div id="referToMessageContainer">
                                <div class="referToPanelSubheader" style="margin-left: 0px; margin-right: 0px;">Message</div>
                                <textarea rows="4" cols="30" id="referToMessage" style="height: 86px; margin-top: 4px; margin-left: 15px;" >Please review the patient EForm listed below.</textarea>
                                </div>
                                
                                </div>
                                <div id="referToButtonContainer">
                                <span class="button" onclick="uncheckAllReferrals();">Uncheck All</span>
                                <span class="button" style="margin-left: 80px;" onclick="showReferToPanel(false);">Done</span>
                                </div>
                                </div>
                                </div><span style="font-size: 1px; width: 1px;">&nbsp;</span>
						    </td>
						    <td style="width: 54%; text-align: right;">
						    <span id="ReviewStepButtons" style="display: none;"><label for="signFormToggle" style="margin-right: 14px;"><span id="SignatureToggle" runat="server" visible="false" class="ReviewEFormOptionButtonContainer" style="padding: 0px 0px 0px 5px; margin-top: 0px; display: none;"><span class="ReviewEFormOptionButton" style="padding: 1px 11px 0px 0px;"><input type="checkbox" id="signFormToggle" onclick="signForm(this);" />Sign Form</span></span></label><img id="PrintBtn" runat="server" visible="false" src="../../Images/PrintEFormPreview.gif" border="0"  onclick="printFormPreview();" style="cursor: pointer;margin-right: 10px; vertical-align: middle;" title="Note: EForm print outs are not coded for scanning into the EMR until the EForm has been approved."  /><img ID="SaveButton" runat="server" src="../../Images/ApproveThisForm_disabled.gif" style="cursor: pointer; vertical-align: middle;" /><asp:Label ID="PermissionMessage" runat="server" Visible="false" style="font-size: 11px; color: #8d2a2c; font-weight: 700;" /></span>
						    </td>

						</tr>
						</table>
						

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
  
  <div id="PopupDiv" style="position:absolute; left:312px; top:59px; width:800px; height:490px; z-index:-1; visibility: hidden;"> 
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr style="display: none;">
      <td ><img src="Images/CloseSmall.gif" width="38" height="8" hspace="0" vspace="0" class="ClickableImage" title="Click here to close." onClick="MM_showHideLayers('ExistingRecordDiv','','hide')" align="right" /></td>
  </tr>
  <tr>
      <td height="20">
		<iframe scrolling="no" frameborder="0" style="border: solid 3px #8d2a2c;" id="PopupFrame" name="PopupFrame" height="380" width="100%"></iframe></td>
  </tr>
  </table>  
</div>

<div id="PopupDynFormDiv" style="position:absolute; left:312px; top:59px; width:490px; height:490px; z-index:-1; visibility: hidden;"> 
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td ><img src="Images/CloseSmall.gif" width="38" height="8" hspace="0" vspace="0" class="ClickableImage" title="Click here to close." onClick="CloseDynFormPopup();" align="right" /></td>
  </tr>
  <tr>
      <td height="20">
		<iframe scrolling="no" frameborder="0" style="border: solid 3px #8d2a2c;" id="PopupDynFormFrame" name="PopupDynFormFrame" height="380" width="100%"></iframe></td>
  </tr>
  </table>  
</div>

	<iframe scrolling="no" frameborder="0" src="HiddenPage.aspx" id="HiddenFrame" name="HiddenFrame" height="1" width="1"></iframe>
  </body>
</html>

