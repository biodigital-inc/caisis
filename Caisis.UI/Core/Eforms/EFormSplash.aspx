<%@ Page language="c#" Inherits="Caisis.UI.Core.Eforms.EFormSplash" CodeFile="EFormSplash.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>EFormSplash</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" Content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

      <script type="text/javascript">
          /* <![CDATA[ */

          function showSelectPatientPanel(PanelType) {
              document.getElementById('SearchTarget').value = '/Eforms/Index.aspx';
              MM_showHideLayers('ViewEditPatient', '', 'show');
              document.getElementById('splashSearchWords').focus();
              // adjust current search criteria
              adjustSearchPopupCriteria();
          }

          // adjust the current search criter
          function adjustSearchPopupCriteria() {
              var searchField = document.getElementById('PatientSearchCriteria');
              if (searchField && top.getSearchType) {
                  // get current search
                  var currentSearchType = top.getSearchType();
                  if (currentSearchType) {
                      // get/set friendly name
                      var currentSearchDesc = top.getSearchTypeDesc(currentSearchType);
                      searchField.innerHTML = currentSearchDesc;
                  }
              }
          }
          
          /* ]]> */
      </script>
  </head>
  <body >
  	<form id="dataForm" method="post">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
		<td align="center" height="380">
		
		
		
		
		
		<div class="splashBG">
            <div class="splashTitle">
                What would you like to do?</div>
            <div class="splashLinkContainer">
                
					<table  cellpadding="0" cellspacing="0" border="0" width="600">
						<tr>
						<td align="center" width="33%" valign="top"><a id="ClinicListLink" href="EFormList.aspx"><img  src="../../Images/EFormSplashEFormsForClinic.gif" width="106" height="76" border="0"></a>
						</td>
						<td align="center" width="33%" valign="top"><a id="PhysicianListLink" href="EFormList.aspx?EFormListType=physician"><img  src="../../Images/EFormSplashMyEForms.gif" width="123" height="76" border="0"></a>
						</td>
						<td align="center" width="33%" valign="top"><img id="EFormIcon" name="EFormIcon" style="cursor:pointer;" onclick="showSelectPatientPanel('EForm');"  src="../../Images/EFormSplashEFormForSinglePatient.gif" width="132" height="78" border="0">
						</td>
						</tr>
					</table>
			</div>
        </div>
		
		
		
		
		
		
		</td>
		</tr>
	</table>
	</form>
	
		<!--- View / Edit Patient Panel --->
	<div id="ViewEditPatient" align="center" style="position:absolute; width:900px; z-index:7; visibility: hidden; height:140px; top:130px;" runat="server">
	<input type="hidden" id="SearchTarget" name="SearchTarget" /> 
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr><td width="440">&nbsp;</td><td align="left" >
	<table cellpadding="0" cellspacing="0" border="0" width="400">
	<tr>
		<td colspan="6"><img id="PanelTop" name="PanelTop" src="../../Images/EnterAnElectronicFormTop.gif" height="37" width="400" border="0" /><br></td>
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
		<td colspan="3" class="popupLabel" style="TEXT-ALIGN: left" valign="bottom"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" /><asp:Label ID="SplashCurrentPatient" Runat="server">There is no patient currently selected.</asp:Label><br><img src="../../Images/shim.gif" height="14" width="19" border="0" /><a id="CurrentPatientPanelLink" name="CurrentPatientPanelLink" href="EFormList.aspx?EFormListType=patient" class="popupAlertMedium"><asp:Literal ID="ViewEditPatientName" Runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Literal ID="ViewEditPatientMRN" Runat="server" /></a></td>
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
        <td colspan="3" class="popupLabel" style="text-align: left;">
            <img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" />
            <label for="splashSearchWords">
                Enter the patient's <span id="PatientSearchCriteria"></span>&nbsp;below:</label>
            <script type="text/javascript">
                /* <![CDATA[ */
                adjustSearchPopupCriteria();
                /* ]]> */
            </script>
        </td>
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
