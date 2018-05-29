<%@ Register TagPrefix="uc1" TagName="pageHeader" Src="../Header/pageHeader.ascx" %>
<%@ Page language="c#" Inherits="Caisis.UI.Core.Utilities.Splash" CodeFile="Splash.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.FramePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Caisis: Home Page</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta content="NOINDEX" name="ROBOTS" />
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
		
		var kioskSwitched = 0;

		function switchSplashKiosk(divId, buttonId)
		{
			if (kioskSwitched == 0)
			{
				MM_showHideLayers(divId,'','show');
				MM_swapImage(buttonId,'','../../Images/SplashReturn.gif',1)
				kioskSwitched = 1;
			}
			else
			{
				MM_showHideLayers(divId,'','hide');
				MM_swapImage(buttonId,'','../../Images/ChangePurposeDataset.gif',1)
				kioskSwitched = 0;
			}
		}
		
		
		function showSelectPatientPanel(PanelType)
		{
			if (PanelType == 'EFORM' || PanelType == 'EFORMS')
			{
				document.getElementById('PanelTop').src = '../../Images/EnterAnElectronicFormTop.gif';
				
				if (document.getElementById('CurrentPatientPanelLink'))
				{
					document.getElementById('CurrentPatientPanelLink').href = '../Eforms/Index.aspx?eform=Prostate+Surgery+EForm';
				}
				
				PanelType = 'EForm';
			}
			else
			{
				document.getElementById('PanelTop').src = '../../Images/ViewEnterPatientDataTop.gif';
				if (document.getElementById('CurrentPatientPanelLink'))
				{
					document.getElementById('CurrentPatientPanelLink').href = '../DataEntryForms/index.aspx';
				}
				
			}
			SearchTarget.value = PanelType;
			MM_showHideLayers('ViewEditPatient','','show');
			document.getElementById('splashSearchWords').focus();
		}

		// MM functions all in headerJs.js
	
        /* ]]> */
    </script>

    <style type="text/css">
	img.SplashIcon
	{
	    cursor: pointer;
	    border-style: none;
	    margin-top: 5px;
	    margin-bottom: 5px;
	    margin-left: 15px;
	    margin-right: 15px;
	}
    </style>
</head>
	<body style="margin: 0px 0px auto 0px">
        <div id="blockHeaderLayer" style="position: absolute; left: 0px; top: 0px; z-index: 20;
            visibility: visible; height: 100px; background-color: #f8fafc; width: 100%;" runat="server">
        </div>
		<table height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td bgColor="#ffffff" height="70"><uc1:PageHeader id="PageHeader1" runat="server"></uc1:PageHeader></td>
				</tr>
				<tr>
					<td bgColor="#3d556d" height="23"><A href="javascript:;"><IMG onclick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide')" hspace="15" src="../../Images/Header/CommonTasks.gif" border="0" vspace="3" align="middle"></A></td>
				</tr>
				<tr>
					<td bgColor="#c5c5bb"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
				</tr>
				<tr>
					<td height="100%" align="middle">
						<table cellpadding="0" cellspacing="0" border="0" class="mainSplashBG" width="896" height="294">
						<tr>
							<td height="32" valign="bottom">
								<img id="splashTitle" title="Welcome to Caisis. What would you like to do?" runat="server" alt="Welcome to Caisis. What would you like to do?" src="../../Images/splashTextSelectADataset.gif" height="14" border="0" hspace="20" />
							</td>
						</tr>
						<tr>
							<td height="6"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
						</tr>
						<tr>
							<td height="1">
							
							
	<!--- View / Edit Patient Panel --->
	<div id="ViewEditPatient" align="center" style="position:absolute; width:776px; z-index:7; visibility: hidden; height:140px; top:130px;" runat="server">
	<input type="hidden" id="SearchTarget" name="SearchTarget" /> 
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	    <tr>
	        <td width="240">&nbsp;</td>
	        <td align="left" height="400">
	            <table cellpadding="0" cellspacing="0" border="0" width="400">
	                <tr>
		                <td colspan="6">
		                    <img id="PanelTop" name="PanelTop" src="../../Images/ViewEnterPatientDataTop.gif" height="37" width="400" border="0" /><br></td>
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
		                <td colspan="3" class="popupLabel" style="TEXT-ALIGN: left" valign="bottom"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" /><asp:Label ID="SplashCurrentPatient" Runat="server">There is no patient currently selected.</asp:Label><br><img src="../../Images/shim.gif" height="14" width="19" border="0" /><a id="CurrentPatientPanelLink" name="CurrentPatientPanelLink" href="../DataEntryForms/index.aspx" class="popupAlertMedium"><asp:Literal ID="ViewEditPatientName" Runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MRN: <asp:Literal ID="ViewEditPatientMRN" Runat="server" /></a></td>
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
		                <td colspan="3" class="popupLabel" style="text-align: center;" valign="bottom" height="35"><input type="text" id="splashSearchWords" class="popupField"  onkeyup="if (event.keyCode==13) { findPatientInHeader('splashSearchWords','ViewEditPatient'); }" onkeydown="if(event.keyCode==13) { return false; }" ><img hspace="10" align="middle" vspace="8" style="cursor: pointer;" src="../../Images/buttonFindPatient.gif" height="22" width="89" onclick="findPatientInHeader('splashSearchWords','ViewEditPatient');return false;" title="Find A Patient" alt="Find A Patient"  /></td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
                    <tr class="popupTable" id="ViewEditPatientSpacerRow2" runat="server">
	                    <td  class="loginBorder" height="30"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                    <td colspan="4">&nbsp;</td>
	                    <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
                    </tr>
	                <tr class="popupTable" id="SelectFromCurrentListTableRow" runat="server">
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td >&nbsp;</td>
		                <td colspan="3" class="popupLabel" style="text-align: left;"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" />Select a patient from the current list:<img hspace="10" align="absmiddle" vspace="8" src="../../Images/viewList.gif" height="22" width="80" onclick="MM_showHideLayers('currentList','','show','ViewEditPatient','','hide');" style="cursor: pointer;" /></td>
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
		                <td colspan="3" class="popupLabel" style="text-align: left;"><img src="../../Images/PopupWidget.gif" height="11" width="8" border="0" hspace="5" /><strong>Or</strong>, go to the <a class="popupAlertMedium" href="../PatientLists/PatientListPage.aspx">Patient Lists</a> page to select a patient.<br><br></td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable">
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td colspan="4">&nbsp;</td>
		                <td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	                </tr>
	                <tr class="popupTable">
		                <td  class="loginBorder" height="40"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
		                <td colspan="4" align="center"><img src="../../Images/ButtonCancel.gif" height="22" width="57" border="0"  style="cursor: pointer;" onclick="cancelSearch('splashSearchWords','ViewEditPatient');" /></td>
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
    <!--- END - View / Edit Patient Panel --->

    <div id="datasetPurposeDiv" align="center" style="position:absolute; width:890px; z-index:20; visibility: visible; height:180px;" runat="server">
	    <form id="dataSetForm" name="dataSetForm" method="post">
	    <img align="left" src="../../Images/shim.gif" height="1" width="10" border="0" />
	    <table cellpadding="0" cellspacing="0" border="0" width="870" bgcolor="#f1f7fc">
		    <tr>
			    <td>&nbsp;<asp:Literal ID="UserHasNoDatasetMsg" Runat="server"></asp:Literal>
			    </td>
			</tr>
		    <tr>
			    <td align="center">
				    <table cellpadding="4" cellspacing="0" border="0" width="400">
					    <tr>
						    <td align="right" width="200">
							    <table cellpadding="4" cellspacing="0" border="0" width="200">
								    <tr>
									    <td align="right" width="100" valign="top">
										    <strong>Your Purpose:</strong>&nbsp;
								        </td>
									    <td width="100">
												<input type="radio" id="purpose2" name="purpose" checked runat="server" value="Clinical">Clinical<br/>
												<input type="radio" id="purpose1" name="purpose" runat="server" value="Research">Research<br/>
												<input type="radio" id="purpose3" name="purpose" runat="server" value="Operations">Operations
									    </td>
								    </tr>
								</table>
							</td>
						    <td width="200" valign="top">
							    <table cellpadding="4" cellspacing="0" border="0" width="200">
					                <tr>
									    <td align="right" width="100">
										<strong>Dataset:</strong>&nbsp;&nbsp;&nbsp;
									    </td>
									    <td width="100">
										    <select id="dataSets" runat="server" name="dataSets" datatextfield="DatasetName" datavaluefield="DatasetId"></select>
									    </td>

								    </tr>
						        </table>
                            </td>
					    </tr>
    					<tr>
						    <td colspan="2" align="center">
						        <input type="image" src="../../Images/buttonSubmit.gif" style="cursor: pointer; border: 0px; width:62px; height: 22px; margin-top: 27px;" title="Change Purpose/Dataset" alt="Change Purpose/Dataset" />
<%--							    <img id="submitBtn" runat="server" src="../../Images/buttonSubmit.gif" style="cursor: pointer; border: 0px; width:62px; height: 22px; margin-top: 27px;" title="Change Purpose/Dataset" alt="Change Purpose/Dataset" />
--%>								<br/>
						    </td>
				        </tr>
					</table>
					</td>
					</tr>
					</table>
				</form>
		</div>		
	    <img src="../../Images/shim.gif" height="1" width="1" border="0" />
	    </td>
	    </tr>
		    <tr>
                <td align="center" valign="top">
                    <%--
				    <img id="splashKioskPatientList" name="splashKioskPatientList" runat="server"  src="../../Images/splashOptionsViewAListOfPatients.gif" width="58" style="cursor:hand;" height="85" border="0" hspace="30" onclick="location.href = '../PatientLists/PatientListPage.aspx'" vspace="10" >
				    <img id="splashKioskPatientData" name="splashKioskPatientData" runat="server"  src="../../Images/splashOptionsViewOrEnterDataForAPatient.gif" width="100" style="cursor:hand;" height="85" border="0" hspace="30" onclick="showSelectPatientPanel('PatientData');"  vspace="10" >
				    <img id="splashKioskForms" name="splashKioskForms" runat="server"  src="../../Images/splashOptionsPrintForms.gif" width="89" style="cursor:hand;" height="85" border="0" hspace="30" onclick="location.href = '../PaperForms/Forms.aspx';" vspace="10" >
				    <img id="splashKioskEForms" name="splashKioskForms" runat="server" src="../../Images/FormSplashEnterEForm.gif"  style="cursor:hand;" onclick="showSelectPatientPanel('EForm');" width="131" height="76" hspace="30" border="0" vspace="10" >
				    --%>
                    <img id="splashKioskInbox" class="SplashIcon" 
                        runat="server" src="../../Images/splashOptionsYouHavePendingEForms.gif" onclick="location.href = '../EForms/Index.aspx?EFormListType=physician';" />
                    <asp:Repeater ID="rptSplashIcons" runat="server" OnItemCreated="rptItemCreated">
                        <ItemTemplate>
                            <asp:Image runat="server" ID="myIconImage" CssClass="SplashIcon" />
                            <asp:Literal ID="iconImage" runat="server" Visible="false"></asp:Literal>
                            <%--<img name="splashKiosk<%# ((System.Data.DataRowView)Container.DataItem)["Name"]%>"  src="../../Images/<%# ((System.Data.DataRowView)Container.DataItem)["IconImageName"]%>" onclick="location.href = '../PatientLists/PatientListPage.aspx'" style="cursor:hand;" border="0" vspace="10" hspace="30">--%>
                        </ItemTemplate>
                    </asp:Repeater>
                    <img id="adminButton" class="SplashIcon" 
                        runat="server" src="../../Images/SplashAdministerThisSystem.jpg" style="cursor: pointer;" visible="false" />
                    <img id="changePurposeDatasetButton" runat="server" style="display: block; text-align: left; cursor: pointer; border-style: none;
                        margin: 42px auto auto 20px;" src="../../Images/shim.gif"/>
                </td>
		    </tr>
        </table>				
        </td>
        </tr>
    </table>
	</body>
</html>