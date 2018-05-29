<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectPatientPage.aspx.cs"
    Inherits="Modules_PatientEducation_SelectPatientPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Patient</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="PtEdStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/Menu.js" type="text/javascript"></script>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
</head>
<body style="background-color:#ffffff; width:400px;">
    <!--- View / Edit Patient Panel --->
    <div id="ViewEditPatient" align="center" style="position:absolute; width:900px; z-index:7; visibility: visible; height:140px; top:130px;" runat="server">
        <input type="hidden" id="SearchTarget" name="SearchTarget" /> 
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr><td width="440">&nbsp;</td><td align="left" >
        <table cellpadding="0" cellspacing="0" border="0" width="400">
        <tr>
	        <td colspan="6"><img id="PanelTop" name="PanelTop" src="Images/PrintEducationMaterialFormTop.gif" height="37" width="400" border="0" /><br></td>
        </tr>
        <tr class="popupTable">
	        <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	        <td ><img src="../../Images/shim.gif" height="1" width="20" border="0" /></td>
	        <td ><img src="../../Images/shim.gif" height="1" width="88" border="0" /></td>
	        <td ><img src="../../Images/shim.gif" height="1" width="10" border="0" /></td>
	        <td ><img src="../../Images/shim.gif" height="1" width="280" border="0" /></td>
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>
        <tr class="popupTable">
	        <td  class="loginBorder" height="50" ><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	        <td >&nbsp;</td>
	        <td colspan="3" class="popupAlertMedium" valign="bottom">Please select one of the options below.</td>
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>
        <tr class="popupTable" id="ViewEditPatientSpacerRow1" runat="server">
	        <td  class="loginBorder" height="30"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	        <td colspan="4">&nbsp;</td>
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>
        <tr class="popupTable" id="SplashCurrentPatientTableRow" runat="server">
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	        <td>&nbsp;</td>
	        <td colspan="3" class="popupLabel" style="TEXT-ALIGN: left" valign="bottom"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" /><asp:Label ID="SplashCurrentPatient" Runat="server">There is no patient currently selected.</asp:Label><br><img src="../../Images/shim.gif" height="14" width="19" border="0" /><a id="CurrentPatientPanelLink" name="CurrentPatientPanelLink" href="AssembleContent.aspx?usePtInSession=true" class="popupAlertMedium" target="_parent"><asp:Literal ID="ViewEditPatientName" Runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MRN: <asp:Literal ID="ViewEditPatientMRN" Runat="server" /></a></td>
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>
	        <tr class="popupTable">
	        <td  class="loginBorder" height="30"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	        <td colspan="4">&nbsp;</td>
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>
        <tr class="popupTable">
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	        <td >&nbsp;</td>
	        <td colspan="3" class="popupLabel" style="text-align: left;"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" />Enter the patient's last name or MRN below:</td>
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>
        <tr class="popupTable">
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	        <td >&nbsp;</td>
	        <td colspan="3" class="popupLabel" style="text-align: center;" valign="bottom" height="35">
	            <input type="text" id="splashSearchWords" class="popupField" onkeyup="if (event.keyCode==13) { findPatientInHeader('splashSearchWords','ViewEditPatient'); }" onkeydown="if(event.keyCode==13) { return false; }" />
	            <img hspace="10" align="middle" src="../../Images/buttonFindPatient.gif" style="height: 22px; width: 89px; cursor: pointer; vertical-align: middle;" onclick="findPatientInHeader('splashSearchWords','ViewEditPatient');return false;" title="Find A Patient" alt="Find A Patient" /></td>
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>
        <tr class="popupTable" id="ViewEditPatientSpacerRow2" runat="server">
	        <td  class="loginBorder" height="30"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	        <td colspan="4">&nbsp;</td>
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>

        <tr class="popupTable">
	        <td  class="loginBorder" height="40"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	        <td colspan="4" align="center"><img src="../../Images/ButtonCancel.gif" style="height: 22px; width:57px; border-style: none; cursor:pointer;" onclick="cancelSearch('splashSearchWords','ViewEditPatient'); return false;" title="Cancel Search" alt="Cancel Search" /></td>
	        <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>
        <tr class="popupTable">
	        <td colspan="6"><img src="../../Images/ContactAdministratorBottom.gif" height="4" width="400" border="0" /><br></td>
        </tr>
        </table>
        </td></tr></table>
    </div>
</body>
</html>
