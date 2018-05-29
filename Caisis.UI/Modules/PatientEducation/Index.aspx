<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Modules_PatientEducation_Index" %>
<%@ Register TagPrefix="uc1" TagName="pageHeader" Src="../../Core/Header/pageHeader.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Caisis: Patient Education Materials</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
	<link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet" />
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	<script src="../../ClientScripts/Menu.js" type="text/javascript"></script>
	<script type="text/javascript">
	    function showSelectPatientPanel(PanelType)
		{	
			$('SearchTarget').value = '/PatientEducation/AssembleContent.aspx?usePtInSession=true';
			MM_showHideLayers('ViewEditPatient','','show');
			document.getElementById('splashSearchWords').focus();
		}
		
		function hideSelectPatientPanel()
		{
		    MM_showHideLayers('ViewEditPatient','','hide');
		}
		
		

	</script>

</head>
<body>

    	<table cellspacing="0" cellpadding="0" width="100%" border="0" align="center" height="100%">
        <tr>
			<td class="MenuContainter" nowrap align="center" width="100%" >
                <ul id="menu" style="text-align: center; padding-left: 180px;">
                    <li style="width: 175px; cursor: default;">Print Education Material
                        <ul style="width: 175px;">
                            <li><a href="Index.aspx?goToSection=AssembleContent" onclick="top.clearPatientInHeader();">
                                for General Distribution</a> <a onclick="showSelectPatientPanel('PtEd');" href="javascript:showSelectPatientPanel('PtEd');">
                                for Current Patient</a> </li>
                        </ul>
                    </li>
                    <!-- need to make this permission based -->
                    <li id="ManageMaterialMenu" runat=server visible=false style="width: 175px; cursor: default;">Manage Education Material
                        <ul style="width: 175px;">
                            <li><a href="ManageContent.aspx?mode=Single" target="MainWindow">Edit Content</a> 
                            <a href="ManageContent.aspx?mode=DefaultDoc" target="MainWindow">Assemble Packets</a>
                            </li>
                        </ul>
                    </li>
                </ul>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<table id="contentTable" cellspacing="0" cellpadding="0" width="100%" border="0" >
					<tr>
						<td style="vertical-align: top;" align="center">
							<iframe runat="server" id="MainWindow" style="width: 95%; height: 600px;" scrolling="no" name="MainWindow" src="PatientEdSplash.aspx" frameborder="0">
							</iframe>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
   
   <!--- View / Edit Patient Panel --->
	    <div id="ViewEditPatient" align="center" style="position:absolute; width:1024px; z-index:7; visibility: hidden; height:140px; top:135px;" runat="server">
	        <input type="hidden" id="SearchTarget" name="SearchTarget" /> 
	        <table cellpadding="0" cellspacing="0" border="0" width="100%">
	            <tr>
	                <td align="center" >
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
		                        <td colspan="3" class="popupLabel" style="TEXT-ALIGN: left" valign="bottom"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" /><asp:Label ID="SplashCurrentPatient" Runat="server">There is no patient currently selected.</asp:Label><br><img src="../../Images/shim.gif" height="14" width="19" border="0" /><a id="CurrentPatientPanelLink" name="CurrentPatientPanelLink" href="AssembleContent.aspx?usePtInSession=true" target="MainWindow" class="popupAlertMedium" onclick="hideSelectPatientPanel();"><asp:Literal ID="ViewEditPatientName" Runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MRN: <asp:Literal ID="ViewEditPatientMRN" Runat="server" /></a></td>
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
	                </td>
	            </tr>
	        </table>
	    </div>
</body>
</html>
