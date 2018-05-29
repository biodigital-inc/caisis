<%@ Page language="c#" Inherits="Caisis.UI.Core.Eforms.PatientEFormList" CodeFile="PatientEFormList.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
      <title>Patient Eform List</title>
      <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
      <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

      <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

      <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

      <script src="../../ClientScripts/EFormScripts.js" type="text/javascript"></script>

      <script type="text/javascript">  
    /* <![CDATA[ */

    // Content Needs to resize on load and on browser resize
	Browser.ResizeElement( { customResizer: setPatientEformListHeights } );
	function setPatientEformListHeights()
	{
        var winHeight = getHeight(window) - 185; // adjust this variable to set eform clinic list window screen height
        var NavTdHeight = winHeight - 105;
        var MainTdHeight = winHeight;
        var ApprovalFrameHeight = winHeight - 10;

        $('NarrativeFrame').style.height = ApprovalFrameHeight;
        $('NarrativeFrameContainer').style.height = ApprovalFrameHeight + 15;
        $('PatientEformListNavTd').style.height = NavTdHeight + 25;
        $('PatientEformListNavDiv').style.height = NavTdHeight;
    }
    
	function startBtnClick(startBtnId, epid)
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
	function checkEformTypeChosen(selectId) {
		return document.getElementById(selectId).selectedIndex > 0;
	}
	
	function loadApprovedEForm(EformId)
	{
		document.getElementById('NarrativeFrame').style.display = '';
		document.getElementById('NarrativeFrame').src = 'EFormPrintableText.aspx?eformId=' + EformId;
		document.getElementById('PrintBtn').style.display = '';
	}
 
	var allLink = parent.document.getElementById('EFormMenus_PatientAllEformLink');
	if (allLink != null) 
	{
		allLink.href = 'Index.aspx?epid=<%= Caisis.Security.CustomCryptoHelper.Encrypt(Session[Caisis.UI.Core.Classes.SessionKey.PatientId].ToString()) %>&status=ListAllEForms';
		allLink.style.display = 'inline';
	}

     /* ]]> */
      </script>
</head>
  <body class="eformBody">
<form id="Form1" method="post" runat="server">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center">
      
      <table width="990" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="3" style="background-color:#395065;"><img src="../../Images/shim.gif" width="1" height="2"/></td>
          </tr>
          <tr> 
            <td colspan="3"><img src="../../Images/shim.gif" width="1" height="1"/></td>
          </tr>
          <tr> 
            <td valign="top">
            
            
			<table width="216" border="0" cellspacing="0" cellpadding="0" class="eformBox">
                <tr> 
                  <td><img src="../../Images/EFormBoxTopLeft.gif" width="5" height="5"></td>
                  <td><img src="../../Images/shim.gif" width="206" height="1"></td>
                  <td><img src="../../Images/EFormBoxTopRight.gif" width="5" height="5"></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td height="484" valign="top" align="center"> 
                    <table width="90%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="18">&nbsp;</td>
                      </tr>

                      <tr> 
                        <td height="30" valign="top" class="EFormSideBarTitle">Open and Approved eForms for <asp:Literal ID="PatientName" Runat="server">this patient </asp:Literal>:</td>
                      </tr>
                      <!--
                      <tr> 
                        <td height="18">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td height="50" valign="top"  class="previewText">
                         <br/>
                          Click on an eform to view the narrative. </td>
                      </tr>
                      -->
                       <tr> 
                        <td id="PatientEformListNavTd" valign="top" height="325">
                        
                        <div id="PatientEformListNavDiv"  style="z-index: 20; position: absolute; overflow: auto; height: 300px; width: 100%" >
                             <table  width="98%" border="0" cellspacing="0" cellpadding="0" style="border: solid 1px #cccccc;">

								<!-- repeater listing eforms -->	
								<asp:Repeater ID="PatientEForms" OnItemCreated="OnItemCreate" runat="server">
								<ItemTemplate>
									<tr id="EFormRow" runat="server" class="listLayer"  onmouseover="this.className='listLayerOver'" onmouseout="this.className='listLayer'">
										<td id="EFormCell" runat="server" colspan="2" style="border-bottom: solid 1px #cccccc; padding-top: 4px; padding-bottom: 4px;">
											<table width="100%" cellpadding="1" cellspacing="0" border="0">
											<tr><td width="34%" class="PatientAllEformsList"><strong><%# DataBinder.Eval(Container.DataItem, "UpdatedTime", "{0:d}") %></strong></td>
												<td align="left" nowrap  class="PatientAllEformsList"><strong><%# ((System.Data.DataRowView)Container.DataItem)["EFormName"]%></strong></td>
											</tr>
											<tr><td class="PatientAllEformsList">&nbsp;</td>
											<td valign="bottom">
											
											<img Id="EFormStatusImg" runat="server" src="../../Images/EFormStatus_InProgress.gif" width="78" height="19" style="margin-top: 3px;" />
										<!-- 	Status: <%# ((System.Data.DataRowView)Container.DataItem)["CurrentStatus"]%>  -->
											
											</td></tr>
											</table>
										
											 
										</td>
									</tr>

								</ItemTemplate>
									</asp:Repeater>
									
									
									
									<tr id="NoEFormsTableRow" runat="server" class="listLayer" style="cursor: default;">
										<td colspan="2" style="border-bottom: solid 1px #cccccc; padding-top: 4px; padding-bottom: 4px;">
											<table width="100%" cellpadding="1" cellspacing="0" border="0">
											<tr><td class="PatientAllEformsList" height="40" align="center" style="border-bottom: none;"><strong>No past or current eForms were<br/>found for this patient.</strong></td>
											</tr>
											</table>
										
											 
										</td>
									</tr>
									
									
							</table>
                        </div>
                        
                        
                        

                        </td>
                      </tr>
                      
                      <tr> 
                        <td>&nbsp;</td>
                      </tr>
                      
                      <tr> 
                        <td height="32" class="EFormSideBarTitle" valign="top">Start a new eForm for<br/>this patient:</td>
                      </tr>
                     
                       <tr> 
                        <td height="18"><asp:DropDownList ID="EFormDropDown" runat="server"></asp:DropDownList><img id="StartNewEFormImg" runat="server" src="../../Images/Start.gif" width="53" height="19" align="absmiddle" hspace="10"  style="cursor: pointer;" /></td>
                      </tr>
                      
                       
                       
                      
                      
                      
                    </table><br/>
                  </td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td><img src="../../Images/EFormBoxBottomLeft.gif" width="5" height="5"></td>
                  <td><img src="../../Images/shim.gif" width="1" height="1"></td>
                  <td><img src="../../Images/EFormBoxBottomRight.gif" width="5" height="5"></td>
                </tr>
              </table>
              
              
              
              </td>
            <td>&nbsp;</td>
            <td width="694" valign="top">
				<table width="694" border="0" cellspacing="0" cellpadding="0" class="eformBox">
                <tr> 
                  <td><img src="../../Images/EFormBoxTopLeft.gif" width="5" height="5"></td>
                  <td><img src="../../Images/shim.gif" width="10" height="1"></td>
                  <td><img src="../../Images/shim.gif" width="744" height="1"></td>
                  <td><img src="../../Images/EFormBoxTopRight.gif" width="5" height="5"></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td valign="top">&nbsp;</td>
                  <td height="400" valign="top"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                       
                       <!-- STEPS NAV BAR -->
                     
                      
                      <tr> 
                        <td class="EFormMainTitle"><asp:Literal ID="EFormTitle" runat="server"></asp:Literal></td>
                      </tr>
                      <!--<tr> 
                        <td class="EFormRedLine"><img src="../../Images/shim.gif" width="1" height="1"></td>
                      </tr>-->
                      <tr> 
                        <td height="17">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="437" valign="top" class="PatientEformListStart"  id="NarrativeFrameContainer"> 
							<iframe id="NarrativeFrame" name="NarrativeFrame"  width="740" height="415" scrolling="auto" frameborder="0" style="border: solid 1px #cccccc; display: none;"></iframe>
							
						</td>
                      </tr>
                      <tr> 
                        <td height="29" align="right"> 
						<img id="PrintBtn" src="../../Images/PrintThisEForm_2.gif" width="164" height="26" border="0"  onClick="printNarrative();" style="cursor: pointer; display: none;" />
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
        </table>
        
        
        
        </td>
    </tr>
  </table>
</form>
	
  </body>
</html>
