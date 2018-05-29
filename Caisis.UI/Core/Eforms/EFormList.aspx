<%@ Page Language="c#" EnableViewState="false" Inherits="Caisis.UI.Core.Eforms.EFormList"
    CodeFile="EFormList.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" %>
<%@ Register  TagPrefix="eform" TagName="EFormList" Src="~/Core/Utilities/ConfigDropDown.ascx" %>
<%@ Import Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>EFormList</title>
    <!-- we REFRESH this page every 5 minutes to update eform status -->
    <!--<meta http-equiv="refresh" content="300">-->
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../../StyleSheets/EFormStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script type="text/javascript">  
    /* <![CDATA[ */

    Browser.ResizeElement( { customResizer: setEFormClinicListHeights } );
    
    var CLINIC_LIST_OFFSET = 300;
    function setEFormClinicListHeights()
	{
        var childDivHeight = Math.max(getHeight(top) - CLINIC_LIST_OFFSET, 100) + 'px';
        var childTdHeight = Math.max(getHeight(top) - CLINIC_LIST_OFFSET + 70, 100) + 'px';
        if($('outerHeightTd')) $('outerHeightTd').style.height = childTdHeight;
        if($('ListManDataTable')) $('ListManDataTable').style.height = childDivHeight;
    }
    
	// in lieu of meta-refresh
	var timeId;
	
	function doEformListRefresh() {
		location.href = location.href; // this is the equivalent of a meta-refresh
	}
	
	// these functions will be called from other locations
	function enableEformListRefresh() {
		timeId = setTimeout("doEformListRefresh()",300000); // 5 minutes
	}
	
	function disableEformListRefresh() {
		clearTimeout(timeId);
	}
	
	// the default onload event
	enableEformListRefresh();
	
     /* ]]> */
    </script>

    <script type="text/javascript">  
    /* <![CDATA[ */
	
	var onPatientList = true;

	var rowClick = 'enabled';
	
	function onRowClickGoToEForm(urlVars)
	{
		if(rowClick == 'enabled'){
			goToEForm(urlVars);
		}
	}
	function showEFormDropDown(plusImageId,evt)
	{
		rowClick = 'disabled';
    
        // Changes image ids to match div id, 
		// div used 'plusImage', image used 'PlusImage', error in id is case senstive in Mozilla
		var divId = plusImageId + 'Div'; 
		document.getElementById(divId).style.display = 'block';
		
		stopBubble(evt);
	}
	function reEnableRowClick()
	{
		rowClick = 'enabled';
	}
	function startBtnClick(startBtnId, epid)
	{
		// use client id of start button to get value of respective select box
		// then add as url variable and on to edit page
		var selectId = startBtnId.replace('StartNewEFormImg', 'EFormDropDown');	
		var eformName = document.getElementById(selectId).value;	
		var urlVars = '?eform=' + eformName + '&epid=' + epid + '&status=new';	//beware of spaces!
		
		 goToEForm(urlVars);
	}
	function startBtn2Click(startBtnId, epid)
	{
		var selectId = startBtnId.replace('StartNewEFormImg2', 'EFormDropDown2');	
		var eformName = document.getElementById(selectId).value;	
		var urlVars = '?eform=' + eformName + '&epid=' + epid + '&status=new';	//beware of spaces!
		
		goToEForm(urlVars);
	}
	function goToEForm(urlVars)
	{
		var goTo   = 'Index.aspx' + urlVars;
		
		parent.document.location = goTo;
	}
	function showDocList()
	{
		document.getElementById('docList').style.visibility = 'visible';
	}
	function submitDocList(clinicPhysician)
	{
		// change title in menu bar: NO longer used
		// parent.setClinicGroupTitle(clinicPhysician);
		
		// refresh form
		document.forms[0].docName.value = clinicPhysician;
		document.forms[0].submit();
	}
	
	function ShowNewPatientApptForm()
	{
		document.getElementById('PopupFrame').src = '../Utilities/AddNewPatientAndAppt.aspx';
		document.getElementById('PopupDiv').style.zIndex = '8';
		MM_showHideLayers('PopupDiv','','show');
		MM_showHideLayers('docList','','hide');
	}
	function showAllPatientEFormsClick(urlVars)
	{
		rowClick = 'disabled';
		
		goToEForm(urlVars);
	}
	function ClosePopup()
	{
		document.getElementById('PopupDiv').style.zIndex = '-1';
		MM_showHideLayers('PopupDiv','','hide');
		window.location = window.location;
	}
	function checkEformTypeChosen(imageElement) {
		// check to see if the select box in this row has been checked; its name should contain 'EFormDropDown'
		var tdWithSelect = imageElement.parentNode.previousSibling;
		if(tdWithSelect.nodeName != "TD") { tdWithSelect = tdWithSelect.previousSibling; } // previousNode refers to text node in Mozilla
		if (tdWithSelect != null) {
			for (i = 0; i < tdWithSelect.childNodes.length; i++) {
				var node = tdWithSelect.childNodes[i];
				if (node.nodeName == 'SELECT' && node.name.indexOf('EFormDropDown') != -1) {
					return node.selectedIndex > 0;
				}
			}
		}
		return false;
	}
	
	
	function showEFormStatusList()
	{
		document.getElementById('eFormStatusList').style.visibility = 'visible';
	}
	

	
	function startNewEForm()
	{
	    MM_showHideLayers('NewEFormPanel','','show');
	}
	
	function loadApprovedEForm(EformId)
	{
//	    top.showModal('EFormPrintableText.aspx?approved=true&eformId=' + EformId, 'Approved EForm');

		var approvedEFormURL = 'EFormPrintableText.aspx?approved=true&eformId=' + EformId;
		// window resizing necessary to print EForm reports properly
//		if (jQuery(top.window).width() > 1024) top.window.resizeTo(1024,jQuery(top.window).height());
		top.showModalWithConfig(approvedEFormURL,'Approved EForm', { width: '1000', height: '90%', context:window } );
	
//		document.getElementById('NarrativeDiv').style.visibility = 'visible';
//		document.getElementById('NarrativeFrame').src = 'EFormPrintableText.aspx?eformId=' + EformId;
	}
	
	function startPatientEfForm(startBtnId, epid)
	{
		var selectId = startBtnId.replace('StartNewEFormImg', 'EFormDropDown');	
		var eformName = document.getElementById(selectId).value;	
		var urlVars = '?eform=' + eformName + '&epid=' + epid + '&status=new';	//beware of spaces!
		
		goToEForm(urlVars);
	}
	function goToEForm(urlVars)
	{
		var goTo   = 'Index.aspx' + urlVars;
		
		parent.document.location = goTo;
	}
	function checkPatientEformTypeChosen(selectId) {
			return document.getElementById(selectId).selectedIndex > 0;
	}
	

    
	function EFormListOnload(listType)
	{
	    setEFormClinicListHeights();
	    top.MM_showHideLayers('menubar','','show');
	    top.setListTypeIndicator(listType);
	}
	
     /* ]]> */
    </script>
    <style type="text/css">
    .RowEformList
    {
        width: 180px;
    }
    .EFormDateSpecial
    {
        color: #8d2a2c;
    }
    .ListManDataTableRow td
    {
        cursor: default;
    }
    </style>

</head>
<body id="EFormListBody" runat="server">
    <form id="EFormClinicListForm" method="post" runat="server">
        <table width="925" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td colspan="6" height="36">&nbsp;
                    </td>
            </tr>
            <tr id="ClinicListTitleRow" runat="server" visible="false">
                <td colspan="6" class="patientDataSectionTitle">
                    <img src="../../Images/AddAPatientToThisList.gif" onClick="ShowNewPatientApptForm();"
                        width="182" height="22" align="right" style="cursor: pointer;" />
                    <img id="RefreshImage" runat="server" title="Refresh Clinic List" align="absmiddle"
                        onclick="window.location = window.location;" src="../../Images/Icon_Refresh.gif"
                        width="16" height="17" style="cursor: pointer;" />
                    <!-- clinic doc list -->
                    <div id="docList" runat="server" class="EFormClinicListMenu">
                        <div style="width: 99%; overflow: auto; background-color: #eeeeee;">
                            <img src="../../Images/Header/SmallCloseButton.gif" width="11" height="11" hspace="4"
                                vspace="4" border="0" align="right" onClick="MM_showHideLayers('docList','','hide')"
                                style="cursor: pointer;">
                            <img src="../../Images/Header/shim.gif" width="1" height="5"><br />
                            <img src="../../Images/Header/shim.gif" width="5" height="1">
                            <strong>Available Clinics:</strong>
                        </div>
                        <div style="height: 250px; width: 99%; overflow: auto;">
                            <table id="recentFindTable" width="200" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td colspan="2" class="listLayer">
                                        <img src="../../Images/Header/shim.gif" width="10" height="5"></td>
                                </tr>
                                <asp:Repeater ID="ClinicPhysicians" runat="server">
                                    <ItemTemplate>
                                        <tr class="listLayer" onMouseOver="this.className='listLayerOver'" onMouseOut="this.className='listLayer'"
                                            onclick="submitDocList('<%# PageUtil.EscapeSingleQuotes(((System.Data.DataRowView)Container.DataItem)[0].ToString())%>');">
                                            <td style="padding-left: 8" style="font-size: 11px;" nowrap>
                                                <%# ((System.Data.DataRowView)Container.DataItem)[0]%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <br />
                    </div>
                    <asp:Literal ID="PhysicianName" runat="server" />
                    <img onclick="showDocList()" src="../../Images/RedDownWidget.gif" width="13" height="13"
                        align="absmiddle" style="cursor: pointer;" />&nbsp;&nbsp;&nbsp;<asp:Literal ID="ClinicDateText"
                            runat="server" /><img src="../../Images/shim.gif" width="14" height="1" /><img id="clinicDateCal"
                                runat="server" src="../../Images/Calendar/cal.png" width="16" height="16" border="0"
                                alt="Enter Clinic Date" align="absMiddle" class="pdFormFieldButtonOn" />
                    <input type="hidden" id="docName" class="pdFormField" runat="server" name="docName" />
                    <input type="hidden" id="clinicDate" class="pdFormField" runat="server" name="clinicDate" />
                </td>
            </tr>
            <tr id="PhysicianEFormListTitleRow" runat="server" visible="false">
                <td colspan="6" class="patientDataSectionTitle">
                    <span style="margin-right: 500px;">Browse My EForms</span>
                    <!-- eFormStatuslist -->
                    <div id="eFormStatusList" class="EFormClinicListMenu" style="margin-left: 30px; width: 190px;">
                        <div style="width: 99%; overflow: auto; background-color: #eeeeee;">
                            <img src="../../Images/Header/SmallCloseButton.gif" width="11" height="11" hspace="4"
                                vspace="4" border="0" align="right" onClick="MM_showHideLayers('eFormStatusList','','hide')"
                                style="cursor: pointer;">
                            <img src="../../Images/Header/shim.gif" width="1" height="5"><br />
                            <img src="../../Images/Header/shim.gif" width="5" height="1">
                            <strong style="font-size: 12px;">View EForms with Status:</strong>
                        </div>
                        <div style="height: 90px; width: 99%; overflow: auto;">
                            <table id="recentFindTable" width="180" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td colspan="2" class="listLayer">
                                        <img src="../../Images/Header/shim.gif" width="10" height="5"></td>
                                </tr>
                                <asp:Repeater ID="RptEformStatus" runat="server">
                                    <ItemTemplate>
                                        <tr class="listLayer" onMouseOver="this.className='listLayerOver'" onMouseOut="this.className='listLayer'"
                                            onclick="window.location='EFormList.aspx?EFormListType=physician&msgStatus=<%# ((System.Data.DataRowView)Container.DataItem)[1]%>'">
                                            <td style="padding-left: 8" style="font-size: 11px;" nowrap>
                                                <%# ((System.Data.DataRowView)Container.DataItem)[0]%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <br />
                    </div>
                    <span style="font-size: 12px;">View&nbsp;&nbsp;&nbsp;<asp:Literal ID="StatusView"
                        runat="server">All Unapproved</asp:Literal>
                        <img onClick="showEFormStatusList()" src="../../Images/RedDownWidget.gif" width="13"
                            height="13" align="absmiddle" style="cursor: pointer;" />&nbsp;&nbsp;&nbsp;eForms</span>
                </td>
            </tr>
            <tr id="PatientEFormListTitleRow" runat="server" visible="false">
                <td colspan="6" class="patientDataSectionTitle">
                    <img runat="server" style="cursor: pointer;" align="right" id="NewEFormButton" src="../../Images/BeginNewEFormForThisPatient.gif"
                        width="179" height="19" border="0" hspace="30" onClick="startNewEForm();" />
                    <asp:Literal ID="PatientName" runat="server">Open and Approved eForms for this patient </asp:Literal>
                    <img onClick="top.MM_showHideLayers('currentList','','show');" src="../../Images/RedDownWidget.gif"
                        width="13" height="13" align="absmiddle" style="cursor: pointer;" />
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <img src="../../Images/shim.gif" width="10" height="8"></td>
            </tr>
            <tr>
                <td bgcolor="#f1f7fc">
                    <img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
                <td class="ListManagerBGTableTop">
                    <img src="../../Images/shim.gif" width="10" height="5"></td>
                <td class="ListManagerBGTableTop">
                    <img src="../../Images/shim.gif" width="20" height="5"></td>
                <td class="ListManagerBGTableTop">
                    <img src="../../Images/shim.gif" width="490" height="5"></td>
                <td class="ListManagerBGTableTop">
                    <img src="../../Images/shim.gif" width="395" height="5"></td>
                <td bgcolor="#f1f7fc">
                    <img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
            </tr>
            <tr>
                <td class="ListManBGTableLeftSide">
                    <img src="../../Images/shim.gif" width="1" height="1"></td>
                <td colspan="4" class="ListManBGTableBody">
                    <img src="../../Images/shim.gif" width="10" height="8"></td>
                <td class="ListManBGTableRightSide">
                    <img src="../../Images/shim.gif" width="1" height="1"></td>
            </tr>
            <tr>
                <td class="ListManBGTableLeftSide">
                    <img src="../../Images/shim.gif" width="1" height="1"></td>
                <td colspan="4" class="ListManBGTableBody">
                    <img src="../../Images/shim.gif" width="10" height="8"></td>
                <td class="ListManBGTableRightSide">
                    <img src="../../Images/shim.gif" width="1" height="1"></td>
            </tr>
            <tr>
                <td id="outerHeightTd" height="370" class="ListManBGTableLeftSide">&nbsp;
                    </td>
                <td colspan="2" class="ListManBGTableBody">&nbsp;
                    </td>
                <td colspan="2" valign="top" class="ListManBGTableBody">
                    <table id="EFormTitleTable" style="cursor: Default;" width="837" border="0" cellpadding="4"
                        cellspacing="0" class="ListManDataTableOuterBorder" runat="server">
                        <tr id="ClinicHeader" runat="server" visible="false">
                            <td width="5" class="EFormDataTableTop">
                                <img src="../../Images/shim.gif" width="5" height="1"></td>
                            <td class="EFormDataTableTop" width="70" style="text-align: left">
                                &nbsp;&nbsp;<a style="color: #ffffff;" href="#?sortColumn=ApptTime">Time</a></td>
                            <td class="EFormDataTableTop" width="40" style="text-align: left">
                                Visit</td>
                            <td class="EFormDataTableTop" width="155" style="text-align: left;">
                                <a style="color: #ffffff;" href="#?sortColumn=ApptLastName">Name</a></td>
                            <td class="EFormDataTableTop" width="65" style="text-align: left;">
                                <a style="color: #ffffff;" href="#?sortColumn=ApptMRN">MRN</a></td>
                            <td class="EFormDataTableTop" width="200" style="text-align: left">
                                EForm Type</td>
                            <td class="EFormDataTableTop" width="292">
                                EForm Status</td>
                        </tr>
                        <tr id="PhysicianHeader" runat="server" visible="false">
                            <td width="5" class="EFormDataTableTop">
                                <img src="../../Images/shim.gif" width="5" height="1"></td>
                            <td class="EFormDataTableTop" width="70" style="text-align: left">
                                &nbsp;&nbsp;<a style="color: #ffffff;" href="#?sortColumn=ApptTime">Date</a></td>
                            <td class="EFormDataTableTop" width="155" style="text-align: left;">
                                <a style="color: #ffffff;" href="#?sortColumn=ApptLastName">Name</a></td>
                            <td class="EFormDataTableTop" width="95" style="text-align: left;">
                                <a style="color: #ffffff;" href="#?sortColumn=ApptMRN">MRN</a></td>
                            <td class="EFormDataTableTop" width="170" style="text-align: left">
                                EForm Type</td>
                            <td class="EFormDataTableTop" width="292">
                                EForm Status</td>
                        </tr>
                        <tr id="PatientHeader" runat="server" visible="false">
                            <td width="5" class="EFormDataTableTop">
                                <img src="../../Images/shim.gif" width="5" height="1"></td>
                            <td class="EFormDataTableTop" width="100" style="text-align: left">
                                &nbsp;&nbsp;<a style="color: #ffffff;" href="#?sortColumn=ApptTime">Clinic Date</a></td>
                            <td class="EFormDataTableTop" width="250" style="text-align: left">
                                EForm Type</td>
                            <td class="EFormDataTableTop">
                                EForm Status</td>
                        </tr>
                    </table>
                    <div id="ListManDataTable" runat="server" style="height: 310px; z-index: 1; visibility: visible;
                        overflow: auto; width: 857px; position: absolute;">
                        <table class="BatchPrintTable" width="837" border="0" cellpadding="2" cellspacing="0">
                            <asp:Repeater ID="rptInbox" runat="server" OnItemCreated="myEformsItemCreated">
                                <ItemTemplate>
                                    <tr id="listRow" runat="server" class="ListManDataTableRow" valign="middle" onMouseOver="this.className='ListManDataTableRowOver'"
                                        onmouseout="this.className='ListManDataTableRow';">
                                        <td width="5">
                                            <img src="../../Images/shim.gif" width="5" height="27"></td>
                                        <td valign="top" width="70" class="EFormDataTableCell">
                                            <%# DataBinder.Eval(Container.DataItem, "EnteredTime", "{0:d}") %>
                                        </td>
                                        <td width="155" class="EFormDataTableCell">
                                            <%# ((System.Data.DataRowView)Container.DataItem)["PtFirstName"]%>
                                            <%# ((System.Data.DataRowView)Container.DataItem)["PtLastName"]%>
                                        </td>
                                        <td width="95" class="EFormDataTableCell">
                                            <%# ((System.Data.DataRowView)Container.DataItem)["PtMrn"]%>
                                        </td>
                                        <td width="170" class="EFormDataTableCell">
                                            <%# ((System.Data.DataRowView)Container.DataItem)["EFormName"]%>
                                        </td>
                                        <td valign="top" width="292" class="EFormDataTableCell">
                                            <img id="StatusImg" runat="server" src="../../Images/EFormStatus_NotStarted.gif"
                                                width="78" height="19" align="absmiddle" style="margin-right: 20px;" /><asp:Literal
                                                    ID="EFormStatus" runat="server" /></td>
                                    </tr>
                                </ItemTemplate>
<%--                                <SeparatorTemplate>
                                    <tr>
                                        <td height="1" colspan="7" class="ListManDataTableDottedLine">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                </SeparatorTemplate>--%>
                                <FooterTemplate>
                                    <tr>
                                        <td height="1" colspan="7" class="ListManDataTableBottomBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                </FooterTemplate>
                            </asp:Repeater>
                            <!-- repeater listing eforms -->
                            <asp:Repeater ID="PatientEForms" OnItemCreated="OnPatientListItemCreate" runat="server">
                                <ItemTemplate>
                                    <tr id="EFormRow" runat="server" class="ListManDataTableRow" valign="middle" onMouseOver="this.className='ListManDataTableRowOver'"
                                        onmouseout="this.className='ListManDataTableRow';">
                                        <td width="5">
                                            <img src="../../Images/shim.gif" width="5" height="27"></td>
                                        <td id="EFormCell" runat="server" width="100" class="EFormDataTableCell">
                                            <asp:Label ID="PatientEFormListDate" runat="server" /><%-- <%# DataBinder.Eval(Container.DataItem, "EformApptTime", "{0:d}") %> --%>
                                        </td>
                                        <td align="left" nowrap width="250" class="EFormDataTableCell">
                                            <%# ((System.Data.DataRowView)Container.DataItem)["EFormName"]%>
                                        </td>
                                        <td class="EFormDataTableCell">
                                            <img id="EFormStatusImg" runat="server" src="../../Images/EFormStatus_InProgress.gif"
                                                width="78" height="19" align="absmiddle" style="margin-right: 20px;" /><asp:Literal
                                                    ID="EFormStatus" runat="server" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <%--<SeparatorTemplate>
                                    <tr>
                                        <td height="1" colspan="7" class="ListManDataTableDottedLine">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                </SeparatorTemplate>--%>
                                <FooterTemplate>
                                    <tr>
                                        <td height="1" colspan="7" class="ListManDataTableBottomBorder">
                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                </FooterTemplate>
                            </asp:Repeater>
                            <tr id="NoEFormsTableRow" runat="server" class="listLayer" style="cursor: default;"
                                visible="false">
                                <td colspan="2" style="border-bottom: solid 1px #cccccc; padding-top: 4px; padding-bottom: 4px;">
                                    <table width="100%" cellpadding="1" cellspacing="0" border="0">
                                        <tr>
                                            <td class="PatientAllEformsList" height="40" align="center" style="border-bottom: none;">
                                                <strong>No past or current eForms were<br />
                                                    found for this patient.</strong></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <asp:Repeater ID="EFormClinicList" OnItemCreated="OnEFormClinicListItemCreate" OnPreRender="DoRepeaterPostProcessing"
                                runat="server">
                                <ItemTemplate>
                                    <tr id="PatientRow" runat="server" class="ListManDataTableRow" valign="middle">
                                        <td width="5" class="EFormDataTableCell">
                                            <img id="ShowAllEFormsImg" src="../../Images/Icon_PastEForms.gif" runat="server"
                                                width="11" height="11" align="absmiddle" hspace="3" title="View past eForms for this patient."
                                                style="cursor: default" />&nbsp;</td>
                                        <td width="70" class="EFormDataTableCell">
                                            <!-- ROW HEIGHT -->
                                            <img align="absmiddle" src="../../Images/shim.gif" height="27" width="1" border="0" /><asp:Literal
                                                ID="AppointmentTime" runat="server" />
                                        </td>
                                        <td width="40" align="left" class="EFormDataTableCell">
                                            <asp:Literal ID="VisitTypeLiteral" runat="server" />&nbsp;
                                        </td>
                                        <td width="155" class="EFormDataTableCell">
                                            <asp:Literal ID="PatientName" runat="server" /></td>
                                        <td width="65" align="center" class="EFormDataTableCell" style="text-align: left;">
                                            <asp:Literal ID="PatientMrn" runat="server" /></td>
                                        <td width="200" align="left" class="EFormDataTableCell">
                                            <asp:Literal ID="EFormNameLiteral" runat="server" /><img id="plusImage" src="../../Images/EFormListPlus.gif"
                                                runat="server" width="10" height="10" align="absmiddle" title="Add another eform for this patient."
                                                style="cursor: default; margin-left: 5px;" />
                                            <eform:EFormList runat="server" ConfigTypeName="EformConfig" ID="EFormDropDown" CssClass="RowEformList"/>
                                        </td>
                                        <td width="292" align="left" class="EFormDataTableCell">
                                            <img id="StatusImg" runat="server" src="../../Images/EFormStatus_NotStarted.gif"
                                                width="78" height="19" align="absmiddle" style="margin-right: 20px;" /><asp:Literal
                                                    ID="EFormStatus" runat="server" /><img id="StartNewEFormImg" runat="server" src="../../Images/Start.gif"
                                                        width="53" height="19" align="absmiddle" hspace="10" style="cursor: pointer;" />
                                        </td>
                                    </tr>
                                    <tr id="additionalEformRow" runat="server">
                                        <td colspan="7">
                                            <div id="plusImageDiv" runat="server">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr id="PatientRow2" class="ListManDataTableRow" valign="middle">
                                                        <td width="360" align="center">
                                                            <img src="../../Images/shim.gif" width="360" height="27"></td>
                                                        <td width="192" align="left" class="EFormDataTableCell">
                                                            <eform:EFormList runat="server" ConfigTypeName="EformConfig" ID="EFormDropDown2" CssClass="RowEformList" />
                                                            </td>
                                                        <td width="290" align="left" class="EFormDataTableCell">
                                                            <img src="../../Images/EFormStatus_NotStarted.gif" width="78" height="19" /><img
                                                                src="../../Images/shim.gif" width="20" height="1"><img id="StartNewEFormImg2" runat="server"
                                                                    src="../../Images/Start.gif" width="53" height="19" align="absmiddle" hspace="10"
                                                                    style="cursor: pointer;" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                            <asp:Repeater ID="ExtractedApprovedClinicList" OnItemCreated="OnEFormClinicListItemCreate"
                                OnPreRender="DoRepeaterPostProcessing" runat="server">
                                <ItemTemplate>
                                    <tr id="PatientRow" runat="server" class="ListManDataTableRow" valign="middle">
                                        <td width="5" class="EFormDataTableCell">
                                            <img id="ShowAllEFormsImg" src="../../Images/Icon_PastEForms.gif" runat="server"
                                                width="11" height="11" align="absmiddle" hspace="3" title="View past eForms for this patient."
                                                style="cursor: default" /></td>
                                        <td width="70" class="EFormDataTableCell">
                                            <!-- ROW HEIGHT -->
                                            <img align="absmiddle" src="../../Images/shim.gif" height="27" width="1" border="0" /><asp:Literal
                                                ID="AppointmentTime" runat="server" />
                                        </td>
                                        <td width="40" align="left" class="EFormDataTableCell">
                                            <asp:Literal ID="VisitTypeLiteral" runat="server" />
                                        </td>
                                        <td width="155" class="EFormDataTableCell">
                                            <asp:Literal ID="PatientName" runat="server" /></td>
                                        <td width="65" align="center" class="EFormDataTableCell" style="text-align: left;">
                                            <asp:Literal ID="PatientMrn" runat="server" /></td>
                                        <td width="200" align="left" class="EFormDataTableCell">
                                            <asp:Literal ID="EFormNameLiteral" runat="server" /><img id="plusImage" src="../../Images/EFormListPlus.gif"
                                                runat="server" width="10" height="10" align="absmiddle" title="Add another eform for this patient."
                                                style="cursor: default; margin-left: 5px;" />
                                            <eform:EFormList runat="server" ConfigTypeName="EformConfig" ID="EFormDropDown" />
                                        </td>
                                        <td width="292" align="left" class="EFormDataTableCell">
                                            <img id="StatusImg" runat="server" src="../../Images/EFormStatus_NotStarted.gif"
                                                width="78" height="19" align="absmiddle" style="margin-right: 20px;" /><asp:Literal
                                                    ID="EFormStatus" runat="server" /><img id="StartNewEFormImg" runat="server" src="../../Images/Start.gif"
                                                        width="53" height="19" align="absmiddle" hspace="10" style="cursor: pointer;" />
                                        </td>
                                    </tr>
                                    <tr id="additionalEformRow" runat="server">
                                        <td colspan="7">
                                            <div id="plusImageDiv" runat="server">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr id="PatientRow2" class="ListManDataTableRow" valign="middle">
                                                        <td width="360" align="center">
                                                            <img src="../../Images/shim.gif" width="360" height="27"></td>
                                                        <td width="192" align="left" class="EFormDataTableCell">
                                                            <eform:EFormList runat="server" ConfigTypeName="EformConfig" ID="EFormDropDown2" CssClass="RowEformList" /></td>
                                                        <td width="290" align="left" class="EFormDataTableCell">
                                                            <img src="../../Images/EFormStatus_NotStarted.gif" width="78" height="19" /><img
                                                                src="../../Images/shim.gif" width="20" height="1"><img id="StartNewEFormImg2" runat="server"
                                                                    src="../../Images/Start.gif" width="53" height="19" align="absmiddle" hspace="10"
                                                                    style="cursor: pointer;" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                            <tr id="noPatientsRow" runat="server" class="ListManDataTableRow" valign="middle"
                                visible="false" style="cursor: default;">
                                <td style="height: 100px; text-align: center; font-size: 13px; font-weight: 400;
                                    color: #8d2a2c;">
                                    <asp:Literal ID="EmptyListMsg" runat="server">There are no patients on this list.</asp:Literal></td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td class="ListManBGTableRightSide">&nbsp;
                    </td>
            </tr>
            <tr>
                <td bgcolor="#f1f7fc">
                    <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
                <td class="ListManagerBGTableBottom">
                    <img src="../../Images/shim.gif" width="10" height="5"></td>
                <td class="ListManagerBGTableBottom">
                    <img src="../../Images/shim.gif" width="20" height="5"></td>
                <td colspan="2" class="ListManagerBGTableBottom">
                    <img src="../../Images/shim.gif" width="1" height="1"></td>
                <td bgcolor="#f1f7fc">
                    <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
            </tr>
        </table>
        <!--- New EForm Panel --->
        <div id="NewEFormPanel" align="center" style="position: absolute; width: 776px; z-index: 7;
            visibility: hidden; height: 140px; top: 40px; left: 320px;" runat="server">
            <input type="hidden" id="SearchTarget" name="SearchTarget" />
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td width="240">&nbsp;
                        </td>
                    <td align="left" valign="top">
                        <table cellpadding="0" cellspacing="0" border="0" width="400">
                            <tr>
                                <td colspan="6">
                                    <img id="PanelTop" name="PanelTop" src="../../Images/AddANewEFormTop.gif" height="37"
                                        width="400" border="0" /><br>
                                </td>
                            </tr>
                            <tr class="popupTable">
                                <td class="loginBorder">
                                    <img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
                                <td>
                                    <img src="../../Images/shim.gif" height="1" width="20" border="0" /></td>
                                <td>
                                    <img src="../../Images/shim.gif" height="1" width="88" border="0" /></td>
                                <td>
                                    <img src="../../Images/shim.gif" height="1" width="10" border="0" /></td>
                                <td>
                                    <img src="../../Images/shim.gif" height="1" width="280" border="0" /></td>
                                <td class="loginBorder">
                                    <img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
                            </tr>
                            <tr class="popupTable">
                                <td class="loginBorder" height="30">
                                    <img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
                                <td>&nbsp;
                                    </td>
                                <td colspan="3" class="popupAlertMedium" valign="bottom">
                                    Please select an EForm Type.</td>
                                <td class="loginBorder">
                                    <img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
                            </tr>
                            <tr class="popupTable">
                                <td class="loginBorder">
                                    <img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
                                <td>&nbsp;
                                    </td>
                                <td colspan="3" class="popupAlertMedium" valign="top" style="height: 90px; padding-top: 30px;">
                                    <eform:EFormList runat="server" ConfigTypeName="EformConfig" ID="EFormDropDown" />
                                    <img id="StartNewEFormImg" runat="server" src="../../Images/Start.gif"
                                        width="53" height="19" align="absmiddle" hspace="10" style="cursor: pointer;" /></td>
                                <td class="loginBorder">
                                    <img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
                            </tr>
                            <tr class="popupTable">
                                <td class="loginBorder" height="40">
                                    <img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
                                <td colspan="4" align="center">
                                    <img src="../../Images/ButtonCancel.gif" height="22" width="57" border="0" style="cursor: hand;"
                                        onclick="MM_showHideLayers('NewEFormPanel','','hide');" /></td>
                                <td class="loginBorder">
                                    <img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
                            </tr>
                            <tr class="popupTable">
                                <td colspan="6">
                                    <img src="../../Images/ContactAdministratorBottom.gif" height="4" width="400" border="0" /><br>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <!-- floating div/iframe stolen from EditEFormContainer -->
    <div id="PopupDiv" style="position: absolute; left: 200px; top: 60px; width: 638px;
        height: 356px; z-index: -1; visibility: hidden;">
        <table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0">

            <tr>
                <td height="100%" width="100%">
                    <iframe scrolling="no" frameborder="0" style="border: solid 3px #8d2a2c;" id="PopupFrame"
                        height="100%" width="100%"></iframe>
                </td>
            </tr>
        </table>
    </div>
    <div id="NarrativeDiv" style="position: absolute; left: 80px; top: 70px; z-index: 50;
        visibility: hidden; border: solid 1px #cccccc; background-color: #ffffff;">
        <div style="width: 820px; background-color: #8d2a2c; color: #ffffff; padding: 4px;
            font-size: 13px; font-weight: bold;">
            <img src="../../Images/CloseSmall.gif" width="38" height="8" class="ClickableImage"
                title="Click here to close." onClick="MM_showHideLayers('NarrativeDiv','','hide')"
                align="right" style="margin-top: 4px; margin-right: 6px;" />Approved EForm</div>
        <iframe id="NarrativeFrame" name="NarrativeFrame" width="820" height="585" scrolling="auto"
            frameborder="0"></iframe>
    </div>
</body>
</html>
