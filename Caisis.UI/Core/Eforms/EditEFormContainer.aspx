<%@ Page language="c#" Inherits="Caisis.UI.Core.Eforms.EditEFormContainer" CodeFile="EditEFormContainer.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="../Help/helpToolTip.ascx" %>
<asp:Literal id="doctypeBreaker" runat="server"><!-- Set IE to quirks mode --></asp:Literal>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
<title>Edit Eform</title>
<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
<script src="../../ClientScripts/EFormScripts.js" type="text/javascript"></script>
<script src="../../ClientScripts/Help.js" type="text/javascript"></script>
<script src="../../ClientScripts/jQuery.js" type="text/javascript"></script>
 <script type="text/javascript">  
    /* <![CDATA[ */
    
     jQuery.noConflict();

    // for cross referencing between eform components
    var globalDefaultDateText = '';
     
    Browser.ResizeElement( { customResizer: setEFormEditDataHeights } );

    var winWidth = getWidth(top);
    
    function setEFormEditDataHeights(_winWidth, _winHeight)
    {
        // Elements that need sizing are: MainAreaTd, PDFormDiv, LeftNavigationTd, LeftNavigationDiv
        var winHeight = (_winHeight != null ? _winHeight : getHeight(top)) - 215; // adjust this variable to set eform clinic list window screen height
        var NavTdHeight = (winHeight + 6) + 'px';
        var OuterNavStyleHeight = (winHeight + 13) + 'px';
        var OuterStyleHeight = (winHeight + 100) + 'px';
        var InnerStyleHeight = (winHeight + 22) + 'px';
        var InnerInnerStyleHeight = (winHeight - 5) + 'px';
        $('LeftNavigationTd').style.height = NavTdHeight;
        $('LeftNavigationDiv').style.height = OuterNavStyleHeight;
        $('MainInnerTable').style.height = InnerStyleHeight;
        $('PDFormDiv').style.height = InnerInnerStyleHeight;
        
        
        winWidth = getWidth(top);
        var toggleContainer = $('LeftNavigationContainer');
        if (toggleContainer.style.display == 'none')
        {
            $('PDFormDiv').style.width = (winWidth - 70) + 'px';
        }
        else
        {
            $('PDFormDiv').style.width = (winWidth - 280) + 'px';
        }
        
        
    }
    
    var iPad =  navigator.appVersion.indexOf("iPad") > -1 ? true : false;

    

			
    var allLink = parent.document.getElementById('EFormMenus_PatientAllEformLink');
    if (allLink != null) 
    {
        allLink.href = 'Index.aspx?epid=<%= Caisis.Security.CustomCryptoHelper.Encrypt(Session[Caisis.UI.Core.Classes.SessionKey.PatientId].ToString()) %>&status=ListAllEForms';
        allLink.style.display = 'inline';
    }

    function toggleEformNav() {
        var navField = $('ShowEformNav');
        var isShown = navField.value != 'false';
        setEformNav(!isShown);
    }
    
    function setEformNav(doShow) {
        var setShown = doShow != null && doShow;
        var navField = $('ShowEformNav');
        var pdDIV = $('PDFormDiv');
        var toggleContainer = $('LeftNavigationContainer');
        var toggleImg = $('showHidePagesImg');
        if (setShown) {
            toggleContainer.style.display = '';
            toggleImg.src = '../../Images/EFormButton_HidePages.png';
            pdDIV.style.width = (winWidth - 280) + 'px';
        }
        else {
            toggleContainer.style.display = 'none';
            toggleImg.src = '../../Images/EFormButton_ShowPages.png';
            pdDIV.style.width = (winWidth - 70) + 'px';
        }
        // update field
        navField.value = setShown
    }

    function showHideEFormPages(toggleImg) {
        var PagesAreShowing = toggleImg.src.indexOf('Hide') > -1 ? true : false;
        setEformNav(!PagesAreShowing);
    }

    // the absolute path to the related records page
    var RELATED_RECORDS_PATH = '<%= Page.ResolveUrl("~/Core/DataEntryForms/RelatedRecords.aspx") %>';

    // Shows the related records interface for relating an eform table record to an existing record
    // @eformId: the eform id (required)
    // @recordTableName: the Table Name of the DestTable
    // @recordTablePriKey: the pri key of the DestTable (optional | recordId)
    // @recordId: the RecordId of the DestTable (optional | recordPriKey)
    // @relatedTables: a list of table names to select from in related interface (optional Array)
    // @defaultSrcTableName: the default table to select in the related records interface (optional)
    // @relatedTitle: the title for the related records popup (optional)
    // @relatedClientId: the client id of the field to update (with relation strength text) on related record save (optional)
    // @e: event object (optional)
    function showEformRelatedRecords(eformId, recordTableName, recordTablePriKey, recordId, relatedTables, defaultSrcTableName, relatedTitle, relatedClientId, e) {
        // build url params
        var urlPairs = new Array();
        // required
        urlPairs.push('eformId=' + eformId);
        urlPairs.push('destTableName=' + recordTableName);
        urlPairs.push('destTablePrimaryKey=' + recordTablePriKey);
        urlPairs.push('recordId=' + recordId);
        // add related tables (if applicable)
        if (relatedTables && relatedTables.length > 0) {
            var csvTables = relatedTables.join(',');
            urlPairs.push('relatedTables=' + escape(csvTables));
        }
        // add optional default src table    
        urlPairs.push('srcTableName=' + defaultSrcTableName);
        // add optional custom label
        urlPairs.push('label=' + escape(relatedTitle));
        // add custom field to update
        urlPairs.push('relatedClientId=' + escape(relatedClientId));
        // build full url with query string
        var fullRRPath = RELATED_RECORDS_PATH + '?' + urlPairs.join('&');
        // set path and show frame
        var relatedRecordFrame = document.getElementById('RelatedRecordsFrame');
        relatedRecordFrame.src = fullRRPath;
        relatedRecordFrame.style.display = 'block';        
        // prevent bubbling of event
        if(e) {
            stopBubble(e);
        }        
        return false;
    }

    // hides the related record interface
    function cancelAddOtherRelatedRecord() {
        document.getElementById('RelatedRecordsFrame').style.display = 'none';
    }



    // the absolute path to the upload files page
    var UPLOAD_FILES_PATH = '<%= Page.ResolveUrl("~/Core/Eforms/EformUploadFiles.aspx") %>';

    // Shows the upload files interface for uploading a file to associate with an eform table record
    // @eformId: the eform id (required)
    // @uploadTableName: the Table Name
    // @uploadTablePriKey: the pri key of the Table (optional | recordId)
    // @recordId: the RecordId of the Table (optional | recordPriKey)
    // @uploadTitle: the title for the upload files popup (optional)
    // @e: event object (optional)
    function showEformUploadedFiles(clientEformId,
                    clientEformName,
                    clientEformSectionName,
                    clientRecordId,
                    clientParentRecordId,
                    clientUploadTableName,
                    clientUploadTablePriKey,
                    clientUploadTitle,
                    clientUploadMode, e) {
        // build url params
        var urlPairs = new Array();
        // required
        urlPairs.push('eformId=' + clientEformId);
        urlPairs.push('eformName=' + clientEformName);
        urlPairs.push('eformSectionName=' + clientEformSectionName);
        urlPairs.push('uploadTableName=' + clientUploadTableName);
        urlPairs.push('uploadTablePriKey=' + clientUploadTablePriKey);
        urlPairs.push('recordId=' + clientRecordId);
        urlPairs.push('parentRecordId=' + clientParentRecordId);
        // add optional custom label
        urlPairs.push('title=' + escape(clientUploadTitle));
        urlPairs.push('mode=' + escape(clientUploadMode));
        // build full url with query string
        var fullUFPath = UPLOAD_FILES_PATH + '?' + urlPairs.join('&');
        // set path and show frame
        var uploadFileFrame = document.getElementById('UploadFilesFrame');
        uploadFileFrame.src = fullUFPath;

        var modalTitle = clientUploadTitle;
        if (modalTitle == '') { modalTitle = clientUploadTableName + ' File Upload'; }
        top.showModalWithConfig(fullUFPath, modalTitle, { width: '85%', height: '85%', showClose: true, showPrint: false, context: window });

       // uploadFileFrame.style.display = 'block';
        
        // prevent bubbling of event
        if (e) {
            stopBubble(e);
        }
        return false;
    }

    // hides the related record interface
    function cancelAddOtherUploadedFiles() {
        //document.getElementById('UploadFilesFrame').style.display = 'none';
        return true;
    }

    // the path to the paper form loader
    var PAPER_FORM_BASE_URL = '<%= Page.ResolveUrl("~/Core/PaperForms/FormsContent.aspx") %>';
    
    function viewPaperFormInModal(paperFormName, title, pages) {
        if (top.showModal) {
            var formType = paperFormName.indexOf('.ascx') > -1 ? paperFormName : (paperFormName + '.ascx');
            var formPages = new Array();
            if (pages != null) {
                if (typeof (pages) == typeof (1)) {
                    formPages.push(pages);
                }
                else if (typeof (pages) == typeof (formPages)) {
                    formPages = pages;
                }
            }
            var url = PAPER_FORM_BASE_URL +'?formType=' + escape(formType) + '&pages=' + formPages.join(',');
            var modalTitle = title;
            top.showModalWithConfig(url, title, { width: '850px', height: '650px' });
        }
        return false;
    }

function findPos(obj) {
	var curleft = curtop = 0;

	if (obj.offsetParent) {
		do {
			curleft += obj.offsetLeft;
			curtop += obj.offsetTop;
		} while (obj = obj.offsetParent);
	}

	return({
		'x': curleft,
		'y': curtop
	});
}

function showEFormBubbleMsg(msg, show, recordDataHtmlCell) {

    var dataBubble = $('EFormInfoBubble');
    var dataBubbleContentContainer = $('EFormInfoBubbleContent');
    if (show) {
        dataBubbleContentContainer.innerHTML = msg;
        dataBubble.style.top = ((findPos(recordDataHtmlCell).y - 66 - $('PDFormDiv').scrollTop) + 'px');
        dataBubble.style.left = ((findPos(recordDataHtmlCell).x - 240) + 'px');
        dataBubble.style.display = 'block';
    }
    else {
        dataBubble.style.display = 'none';
    }
}


    
    /* ]]> */
 </script>
<link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
<link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

<style type="text/css">
span.pdFormFieldLabel {
    display: none;
}

</style>


</head>

<body class="eformBody" onkeydown="cancelBackOnBackspace();">   
<form id="dataForm" name="dataForm" method="post" runat="server">
	<input type="hidden" id="gotoNextPage" name="gotoNextPage" value="false" runat="server">
	<input type="hidden" id="nextEform" name="nextEform" runat="server">
	<input type="hidden" id="nextSectionName" name="nextSectionName" runat="server">
	<input type="hidden" id="nextEformId" name="nextEformId" runat="server">
	<input type="hidden" id="CurrentSectionAnchor" name="CurrentSectionAnchor" runat="server"/>
    <input type="hidden" id="ShowEformNav" name="ShowEformNav" value="" runat="server" />
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;">
          <tr> 
            <td id="LeftNavigationContainer" style="width: 216px; vertical-align: top; padding-left: 4px;" >
			<table  style="width: 100%; margin: 0px 0px 0px 0px;" border="0" cellspacing="0" cellpadding="0" class="eformBox">
                <tr> 
                  <td><img src="../../Images/EFormBoxTopLeft.gif" width="5" height="5"></td>
                  <td><img src="../../Images/shim.gif" width="206" height="1"></td>
                  <td><img src="../../Images/EFormBoxTopRight.gif" width="5" height="5"></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td  valign="top"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="18">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td class="EFormSideBarTitle"><asp:Literal ID="EFormNavTitle" Runat="server"/></td>
                      </tr>
                      <tr> 
                        <td height="18">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td id="LeftNavigationTd" style="height: 400px; position: relative; overflow: visible;" valign="top">
                          
						  <div id="LeftNavigationDiv" style="height: 380px; width:100%; overflow: auto;">
						  
						  
						  
						  
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td><asp:Literal ID="navigation" Runat="server" /></td>
									</tr>
									
									<!-- DEVELOPMENT ONLY -->
									<tr><td><br/><br/><asp:HyperLink ID="testLink" Visible="False" Target="_blank" runat="server">view xml</asp:HyperLink></td></tr>
								
								</table>
							</div>
                         </td>
                      </tr>
                      <tr>
						<td align="center"><img src="../../Images/shim.gif" width="1" height="22"><img ID="DeleteBtn" runat="server" src="../../Images/DeleteThisEForm.gif" width="133" height="22" border="0" style="cursor:pointer;" align="absmiddle"/></td>
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
            <td style="width: 18px; padding: 0px 0px 0px 0px;"><img id="showHidePagesImg" src="../../Images/EFormButton_HidePages.png" onclick="showHideEFormPages(this);" style="cursor: pointer;  margin: 0px 0px 0px 0px;" /></td>
            <td valign="top"><!-- default height are for 1024 x 768 browsers -->
			<table width="97%"  border="0" cellspacing="0" cellpadding="0" class="eformBox">
                <tr height="5"> 
                  <td><img src="../../Images/EFormBoxTopLeft.gif" width="5" height="5"></td>
                  <td><img src="../../Images/shim.gif" width="10" height="1"></td>
                  <td><img src="../../Images/shim.gif" width="744" height="1"></td>
                  <td><img src="../../Images/EFormBoxTopRight.gif" width="5" height="5"></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td valign="top">&nbsp;</td>
                  <td valign="top"> 
                    <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                      
                      <!-- STEPS NAV BAR -->
                      <tr> 
                        <td height="12" valign="top"><img src="../../Images/shim.gif" width="1" height="1">

                        </td>
                      </tr>
                      
                      <tr valign="top" height="15"> 
                        <td class="EFormMainTitle">
                            <table border="0" cellspacing="0" cellpadding="0" style="margin-right: 20px;" align="right">
                                <tr>
                                    <td>
                                    <a id="EditStep" runat="server"  ><img src="../../Images/Step1_Active.gif" width="126" height="15" border="0"  onClick=""></a><a href="" id="NarrativeStep" runat="server"><img src="../../Images/Step2_Inactive.gif" width="150" height="15" border="0" class="imageButtonOn"   onClick="" onmouseover="this.src='../../Images/Step2_Over.gif'" onmouseout="this.src='../../Images/Step2_Inactive.gif'"></a><img src="../../Images/StepEnd_Inactive.gif" width="36" height="15" border="0"  ><%-- <a href="" id="ApproveStep" runat="server"><img src="../../Images/Step4_Inactive.gif" width="89" height="15" border="0" class="imageButtonOn"  onClick=""></a> --%></td>
                                </tr>
                            </table><asp:Literal ID="EFormTitle" runat="server"></asp:Literal></td>
                      </tr>
                      <tr valign="top" height="1"> 
                        <td class="EFormRedLine"><img src="../../Images/shim.gif" width="1" height="1"></td>
                      </tr>
                      <tr> 
                        <td height="10">&nbsp;</td>
                      </tr>
                      <tr>
                        <td valign="top" id="MainInnerTable" style="height:330px;"> 
                          <div id="PDFormDiv" style="height: 310px; visibility: visible; overflow: auto;  width: 744px; position: relative; text-align: left; border: none; background-color:transparent; "> 
                            
                            <!--- This script needs to stay here for formatting reasons - jf. --->
							<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
							
							<script  type="text/javascript">
								valAdjX = -285;
								if (getWidth() > 1007) valAdjX -= ((getWidth() - 1007)*2/3);
								
								valAdjY = -105;
							</script>
							<uc1:helpToolTip id="HelpToolTipLayer" runat="server" />
                            <table style="margin-bottom: 45px;">
                            <tr>
								<td valign="top">
									<asp:PlaceHolder ID="holder" Runat="server"></asp:PlaceHolder>
								</td>
							</tr>
							</table>
						  </div>	
						</td>
                      </tr>
					  <tr> 
                        <td height="10" valign="top" align="right" nowrap>
                        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="85%"></td>
								<td rowspan="2" valign="bottom" align="right">
								<asp:ImageButton ID="NextButton" Runat="server" ImageUrl="../../Images/EFormNext.gif"  style="width: 61px; height: 22px; margin-right: 120px;" />
								</td>
							</tr>
							<tr>
								<td align="right">
								<asp:ImageButton ID="BackButton" Runat="server" ImageUrl="../../Images/BackBold.gif" Width="61" Height="22" /><img src="../../Images/shim.gif" width="30" height="1">
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


<div id="PopupDiv" style="position:absolute; left:30px; top:39px; right: 30px; height: 80%; z-index:-1; visibility: hidden;"> 
<iframe scrolling="no" frameborder="0" style="border: solid 3px #8d2a2c;" id="PopupFrame" style="width: 100%; height: 100%;"></iframe>
</div>

<!-- checks that eform has not already been approved on page unload -->
<iframe scrolling="no" frameborder="0" src="HiddenPage.aspx" id="HiddenFrame" name="HiddenFrame" height="1" width="1"></iframe>

<!--<script language="javascript">centerLayer('PopupDiv', 466, 390);</script>-->



    <%-- EditEFormInfoBubble --%>
    <div id="EFormInfoBubbleContainer">
        <div id="EFormInfoBubble" class="EFormInfoBubble">
            <div id="EFormInfoBubbleContent" class="EFormInfoBubbleContent">
                <%-- when showing the bubble, copy the content into this div --%>
                <table>
                    <tr>
                        <td>
                            field name
                        </td>
                        <td>
                            field value
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>








<!-- data checker; should be at the bottom of eform edit -->
    <script type="text/javascript">  
    /* <![CDATA[ */
    
    bw=new checkBrowser()
    if(bw.iPad)
    {   
        alert('');
    }


    function checkPopulated(cell) {
        for (k = 0; k < cell.childNodes.length; k++) {
            node = cell.childNodes[k];

            if (node.nodeName == 'SELECT') {
                if (node.selectedIndex > 0) {
                    return true;
                }
            } else if (node.nodeName == 'INPUT') {
                type = node.getAttribute('type');
                if (type == 'checkbox' || type == 'radio') {
                    if (node.checked) {
                        return true;
                    }
                } else if (type != 'hidden') {
                    if (node.value != null && node.value != '') {
                        return true;
                    }
                }
            } else if (node.nodeName == 'TEXTAREA') {
                if (node.value != null && node.value != '') {
                    return true;
                }
            } else if (node.nodeName == 'TABLE') {

                if (proccessTable(node))
                    return true;

            }
        }

        return false;
    }

    function proccessTable(node) {

        if (node.id != null && node.id != "undefined" && node.id != '') {
            var tbl = document.getElementById(node.id);
            var populated = false;
            for (var j = 0; j < tbl.rows.length; j++) {
                var row = tbl.rows[j];
                for (var i = 0; i < row.cells.length; i++) {
                    var cell = row.cells[i];
                    if (cell.hasChildNodes()) {
                        for (var k = 0; k < cell.childNodes.length; k++) {
                            var node2 = cell.childNodes[k];

                            if (node2.nodeName == 'SELECT') {
                                if (node2.selectedIndex > 0) {
                                    populated = true;
                                    break;
                                }
                            }
                            else if (node2.nodeName == 'INPUT') {
                                var type2 = node2.getAttribute('type');
                                if (type2 == 'checkbox' || type2 == 'radio') {
                                    if (node2.checked) {
                                        populated = true;
                                        break;
                                    }
                                } else if (type2 != 'hidden') {
                                    if (node2.value != null && node2.value != '') {
                                        populated = true;
                                        break;
                                    }
                                }
                            }
                            else if (node2.nodeName == 'TEXTAREA') {
                                if (node2.value != null && node2.value != '') {
                                    populated = true;
                                    break;
                                }
                            }
                            else if (node2.nodeName == 'TABLE') {
                                if (proccessTable(node2))
                                    populated = true;
                                break;
                            }
                        }
                    }
                    if (populated) {
                        break;
                    }
                }
                if (populated) {
                    break;
                }
            }
            if (populated) {
                return true;
            }
        }
        else {
            return false;
        }

    }
	
	function showRowIfPopulated(row) {
		var populated = false;
		
		for (i = 0; i < row.cells.length; i++) {
			var cell = row.cells[i]; 
			if (cell.hasChildNodes()) {
				if (checkPopulated(cell)) { 
					populated = true;
					break;
				}
			}
		}
		
		if (populated) {
			row.style['display'] = '';
		}
	}
	
	for (var el in tableArray) { 
		var tbl = document.getElementById(el);
		for (j = 0; j < tbl.rows.length; j++) {
			showRowIfPopulated(tbl.rows[j]);
		}
	}

	// for some reason onload will not work
	checkAnchor();
	


	if (iPad){
	    showHideEFormPages($('showHidePagesImg'));
	}
	else { $('PDFormDiv').style.width = (winWidth-280) + 'px'; }
	
	// set navigation
	setEformNav($('ShowEformNav').value != 'false');
	
	
    if(typeof top.window.includeEformMenu == 'function') { top.includeEformMenu(); }
	
	
     /* ]]> */
    </script>
    
    
    <!-- Related Records -->
    <iframe id="RelatedRecordsFrame" name="RelatedRecordsFrame" class="RelatedRecordsFrame"
        scrolling="no" frameborder="0" allowtransparency="true" backgroundcolor="transparent"
        style="display: none;"></iframe>
        
    <!-- Upload files -->
    <iframe id="UploadFilesFrame" name="UploadFilesFrame" class="UploadFilesFrame" 
        scrolling="no" frameborder="0" allowtransparency="true" backgroundcolor="transparent"
        style="display: none; width: 850px; height: 850px; "></iframe>

  </body>
</html>
