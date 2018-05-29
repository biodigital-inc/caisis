<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.GUProsNP" CodeFile="GUProsNP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


<div id="PaperFormStart">

<div align="left"  style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U18*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>

  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><span style="font-size: 8px; float: right;">Printed <% =DateTime.Now.DayOfWeek %>, <% =DateTime.Now %></span><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>GU Prostate New Patient<br/></span></td>
            <td width="50%" align="center" valign="bottom" class="blackBoldText"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>
                    , 
                    <% =patientFirstName  %>
                    <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>		</td>
    </tr>
    <tr > 
      <td colspan="8"> 
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td colspan="8" align="left" valign="bottom" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Date: <% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
      <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2" align="left" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Category of Service</span></td>
              </tr>
              <tr>
                <td width="23%" valign="top" align="center" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&nbsp;New Patient Encounter<br />
                  (CPT 99201-99205)</td>
                <td width="77%" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Use for patients who have not been see by anyone in your billing group in the last 3 years <strong>AND</strong><br />
                    <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are self referred (includes those referred by friend or patient)<br />
                    <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Do not have  physician asking for your advice/opinion (see PIF sheet or PAS info)<br />
                    <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are referred solely for management and/or treatment of aspect of care<br />                </td>
              </tr>
              <tr>
                <td valign="top" align="center" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&nbsp;Office Consultation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                  (CPT 99241- 99245)</td>
                <td class="FormInsideTableRegCell"><table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                      <td class="FormInsideTableRegCell" colspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Office Consultation is requested by _________________________ MD/PA/NP for my advice &amp; opinion<br />
                          <img src="../../Images/shim.gif" border="0" width="4" height="1" />regarding this patient&rsquo;s ______________________________________________________</td>
                    </tr>
                    <tr>
                      <td width="50%" height="35" align="left" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Requesting&nbsp;M.D.:&nbsp;&nbsp;
                          <asp:Label ID="ReferringMd1Name" Runat="server" CssClass="blackBoldText" />          
                        <br />
                          <img src="../../Images/shim.gif" border="0" width="40" height="16" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> <%= institutionShortName%>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" />Non-<%= institutionShortName%></td>
                      <td width="50%" align="left"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Contact&nbsp;M.D.:&nbsp;&nbsp;
                          <asp:Label ID="ReferringMd2Name" Runat="server" CssClass="blackBoldText" />          
                        <br />
                          <img src="../../Images/shim.gif" border="0" width="40" height="16" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> <%= institutionShortName%>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Non-<%= institutionShortName%></td>
                    </tr>
                    <tr>
                      <td width="50%" class="FormInnerRowRightBorder"><table width="100%" cellpadding="0" cellspacing="0" border="0">
                          <tr>
                            <td width="20%" align="right" valign="bottom">Phone</td>
                            <td width="80%" class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="ReferringMd1Phone" Runat="server" CssClass="blackBoldText" /></td>
                          </tr>
                          <tr>
                            <td align="right" valign="bottom">Fax</td>
                            <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="ReferringMd1Fax" Runat="server" CssClass="blackBoldText" /></td>
                          </tr>
                          <tr>
                            <td align="right" valign="bottom">Specialty</td>
                            <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="ReferringMd1Specialty" Runat="server" CssClass="blackBoldText" /></td>
                          </tr>
                      </table></td>
                      <td width="50%"><table width="100%" cellpadding="0" cellspacing="0" border="0">
                          <tr>
                            <td width="20%" align="right" valign="bottom">Phone</td>
                            <td width="80%" class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="ReferringMd2Phone" Runat="server" CssClass="blackBoldText" /></td>
                          </tr>
                          <tr>
                            <td align="right" valign="bottom">Fax</td>
                            <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="ReferringMd2Fax" Runat="server" CssClass="blackBoldText" /></td>
                          </tr>
                          <tr>
                            <td align="right" valign="bottom">Specialty</td>
                            <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="ReferringMd2Specialty" Runat="server" CssClass="blackBoldText" /></td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
                <!--<td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Office Consultation is requested by _________________________ MD/PA/NP for my advice & opinion<br />
					<img src="../../Images/shim.gif" border="0" width="4" height="1">regarding this patient&rsquo;s ______________________________________________________</td>-->
              </tr>
              <tr>
                <td valign="top" align="center" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&nbsp;Established Patient Visit<br />
                  (CPT 99212-99215)</td>
                <td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Use for patients who<br />
                    <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are seeing you for the first time for management or treatment (Not a consult) and have been seen<br />
                    <img src="../../Images/shim.gif" border="0" width="18" height="1" />by someone else in your billing group in the last 3 years<br />
                    <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are seeing you for follow-up care/visits </td>
              </tr>
          </table></td>
        </tr>
         </table>       </td>
    </tr>
	<tr> 
      <td> 
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="8" valign="top" align="left" height="40" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Chief Complaint</span></td>
          </tr>
        </table>	  </td>
    </tr>
    <tr > 
      <td height="50" colspan="8" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">HPI / Diagnosis / Stage</span>
      	<table cellpadding="2" cellspacing="0" border="0" width="100%">
			<tr>
				<td class="HPIText" valign="top">
					<asp:Repeater ID="hpi"  Runat="server"  OnItemDataBound="hpiItemDataBound">
					<ItemTemplate>
						<%# DataBinder.Eval(Container.DataItem, "patientHPI") %><br/><asp:Literal ID="StartNextHpiColumn" Runat="server" />
					</ItemTemplate>
					</asp:Repeater>
					<asp:Label ID="PreTxPot" Runat="server" />				</td>
			</tr>
		</table>
		
	  	</td>
    </tr>
    <tr >
      <td colspan="8" valign="top" class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="1" align="center" valign="middle" height="20" class="FormInsideTableTopCell">Initial Dx Date:</td>
          <td colspan="1" align="center" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="70" height="1" /></td>
          <td colspan="1" align="center" valign="middle" class="FormInsideTableTopCell">TNM Stage:</td>
          <td colspan="1" align="center" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="70" height="1" /></td>
          <td colspan="1" align="center" valign="middle" class="FormInsideTableTopCell">Gleason:</td>
          <td colspan="1" align="center" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="70" height="1" /></td>
          <td colspan="1" align="center" valign="middle" class="FormInsideTableTopCell">PSA @ Dx:</td>
          <td colspan="1" align="center" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="70" height="1" /></td>
        </tr>
      </table></td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
		 <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="1" align="center" valign="middle" width="12%" class="FormInsideTableRegCell">Date<br/>
              (mm/dd/yyyy)</td>
            <td colspan="6" align="center" valign="middle" class="FormInsideTableRegCell">Extent 
              of Disease / Intervention / Outcome</td>
            <td colspan="1" align="center" valign="middle" width="12%" class="FormInsideTableRegCell">PSA 
              / ACP<br/> </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="6" class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="1" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table>
		</td>
    </tr>
	<tr> 
      <td valign="top" class="FormOuterTableRow" valign="top">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr valign="top"> 
            <td height="30" class="FormInsideTableRegCell" valign="top">
                <span class="blackBoldText">Nomogram Predictions</span>
                <img src="../../Images/shim.gif" border="0" width="30" height="1">
                <asp:Label ID="preRP5Nomo"  Runat="server"  />
                <asp:Label ID="preRP10Nomo"  Runat="server"  />
                <asp:Label ID="preXRTNomo"  Runat="server"  />
                <asp:Label ID="preBrachyNomo"  Runat="server"  />
			</td>
          </tr>
        </table>
	   </td>
    </tr>
	<!--
	<tr> 
      <td valign="top" class="FormOuterTableRow" valign="top">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr valign="top"> 
            <td height="30" class="FormInsideTableRegCell" valign="top">
                <span class="blackBoldText">PSA Doubling Time</span>
                <img src="../../Images/shim.gif" border="0" width="30" height="1">
                <asp:Label ID="psaDT"  Runat="server"  />
			</td>
          </tr>
        </table>
	   </td>
    </tr>
	-->
	<tr > 
	  <td> 
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
		  <tr> 
			<td colspan="8" valign="middle" height="6" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Current 
			  Disease State</span><br/> <img src="../../Images/shim.gif" border="0" width="3" height="0"> 
			  <input type="checkbox" name="Localized" id="Localized" value="Localized" runat="server">Localized<img src="../../Images/shim.gif" border="0" width="9" height="1">
			  <input type="checkbox" name="RisingPSA_NonCastrate" id="RisingPSA_NonCastrate"  value="Rising PSA: Non-Castrate" runat="server">Rising PSA/ Non-castrate<img src="../../Images/shim.gif" border="0" width="9" height="1">
			  <input type="checkbox" name="RisingPSA_Castrate"  id="RisingPSA_Castrate" value="Rising PSA: Castrate"  runat="server">Rising PSA/ Castrate<img src="../../Images/shim.gif" border="0" width="9" height="1">
			  <input type="checkbox" name="ClinMetsNonCastrate"  id="ClinMetsNonCastrate" value="Clin Mets: Non-Castrate" runat="server">Clin mets/ Non-castrate<img src="../../Images/shim.gif" border="0" width="9" height="1">
			  <input type="checkbox" name="ClinMetsCastrate"  id="ClinMetsCastrate" value="Clin Mets: Castrate" runat="server">Clin mets/ Castrate</td>
		  </tr>
		</table>	  </td>
	</tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr valign="top"> 
            <td width="50%" class="FormInnerRowRightBorder"><span class="blackBoldText">Family and Social History</span><br/>Family History:
            <asp:Label ID="FamilyHistoryFiller" Runat="server" ><br/><br/><img src="../../Images/shim.gif" border="0" width="12" height="1">
			  -Cancer:<br/><br/><br/><img src="../../Images/shim.gif" border="0" width="12" height="4">
			  -Other:<br/><br/></asp:Label>
           <asp:Repeater ID="familyHistory"  Runat="server"  OnItemCreated="FamilyHistoryItemCreated">
			<ItemTemplate>
			<strong><%# DataBinder.Eval(Container.DataItem, "FamMemNum") %> <%# DataBinder.Eval(Container.DataItem, "FamMemRelation") %> <asp:Label ID="FamMemSide" Runat="server">(<%# DataBinder.Eval(Container.DataItem, "FamMemSide") %>)</asp:Label> </strong> <asp:Label ID="FamMemDiagnosis" Runat="server" >with <%# DataBinder.Eval(Container.DataItem, "FamMemDiagnosis") %></asp:Label><br/>
			</ItemTemplate>
			</asp:Repeater>
            <br/>Occupation: <asp:Label ID="socHxOccupation" Runat="server" />            </td>
            <td width="50%">Marital Status: <asp:Label ID="socHxMaritalStatus" Runat="server" />
				<br/>Children: <asp:Label ID="socHxChildren" Runat="server" />
				<br/><img src="../../Images/shim.gif" border="0" width="1" height="19">
                <br/>Alcohol Use: <asp:Label ID="socHxAlcohol" Runat="server"><img src="../../Images/shim.gif" border="0" width="55" height="1"></asp:Label>
                <br/>
                <br/>Carcinogen Exposure: <asp:Label ID="socHxCarcinogen" Runat="server" /><br/>
                <br/>
                Tobacco Use: &nbsp; <input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" NAME="socHxTobaccoPacksPerDayCheckBox"/>
                <asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label> packs / day for <asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label> years
                <br/><img src="../../Images/shim.gif" border="0" width="45" height="1"><input type="checkbox" id="socHxTobaccoQuitYearCheckbox" runat="server" NAME="socHxTobaccoQuitYearCheckbox"/>
                Quit: <asp:Label ID="socHxTobaccoQuitYear" Runat="server">______ years ago</asp:Label><img src="../../Images/shim.gif" border="0" width="10" height="1"><input type="checkbox" name="No History">No Tobacco Usage              </td>
          </tr>
        </table>      </td>
    </tr>
	
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU14<img src="../../Images/shim.gif" border="0" width="45" height="1">U18<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:12/09/04<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">14</span></td>
    </tr>
</table>
</div>
<div align="left"  style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U18*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>

  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>GU Prostate New Patient<br/></span></td>
            <td width="50%" align="center" valign="bottom" class="blackBoldText"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>
                    , 
                    <% =patientFirstName  %>
                    <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>		</td>
    </tr>
	<tr> 
      <td width="650" height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
	
	<tr>
		<td class="FormOuterTableRow">
			<table align="left" border="0" cellpadding="4" cellspacing="0">
				<tr>
					
            <td height="70" valign="top"> <img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Medications</span><br/>
						<asp:Repeater ID="medications"  Runat="server"  OnItemDataBound="medicationsItemDataBound">
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "Medication") %> <%# DataBinder.Eval(Container.DataItem, "MedDose") %> <%# DataBinder.Eval(Container.DataItem, "MedUnits") %> <%# DataBinder.Eval(Container.DataItem, "MedSchedule") %><br/><asp:Literal ID="StartNextMedColumn" Runat="server" />
							</ItemTemplate>
              			</asp:Repeater>
					</td>
				</tr>
			</table>		</td>
	</tr>
	<tr> 
		<td class="FormOuterTableRow" height="50" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">NKA&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Repeater ID="allergies" runat="server" OnItemDataBound="ShowAllergyResponse">
			<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Allergen") %> <asp:Literal ID="AllergyResponseText" runat="server" /></ItemTemplate>
			<SeparatorTemplate>,&nbsp;&nbsp;</SeparatorTemplate>
		</asp:Repeater>        </td>
	</tr>
	
    <tr> 
	 <td class="FormOuterTableRow" align="right" valign="top"> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr> 
				<td valign="top" width="34%"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Comorbidities</span><br/>
				    <asp:Repeater ID="comorbidities"  Runat="server" >
					<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %> - <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %></ItemTemplate>
					<SeparatorTemplate><br/></SeparatorTemplate>
				  </asp:Repeater>				</td>
				<td valign="top" width="35%"><br/>
					<img src="../../Images/shim.gif" border="0" width="4" height="1">&nbsp;&nbsp;<img src="../../Images/Present.gif" width="43" height="25"><br/>
					<img src="../../Images/shim.gif" border="0" width="4" height="1">
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Pulmonary Disease / Asthma / COPD<br/>
					<img src="../../Images/shim.gif" border="0" width="4" height="1">
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Diabetes (IDDM/NIDDM)<br/>
					<img src="../../Images/shim.gif" border="0" width="4" height="1">
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Hypercholesterolemia<br/>
					<img src="../../Images/shim.gif" border="0" width="4" height="1">
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Depression<br/>
					<img src="../../Images/shim.gif" border="0" width="4" height="1">
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Back Pain / DJD				</td>
				<td align="left" width="31%"><br/>
					<img src="../../Images/shim.gif" border="0" width="4" height="1">&nbsp;&nbsp;&nbsp;<img src="../../Images/Present.gif" width="43" height="25"><br/>
					<img src="../../Images/shim.gif" border="0" width="10" height="1">
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Coronary Artery Disease / MI<br/>
					<img src="../../Images/shim.gif" border="0" width="10" height="1">
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Other Cardiac Disease:<br/>
					<img src="../../Images/shim.gif" border="0" width="10" height="1">
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Hypertension<br/>
					<img src="../../Images/shim.gif" border="0" width="10" height="1">
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;CVA<br/>
					<img src="../../Images/shim.gif" border="0" width="10" height="1">
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Thromboembolic Events /DVT</td>
			</tr>
		</table>	  </td>
    </tr>
	<tr>
		<td colspan="8" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Review of Systems</span>
		&nbsp;&nbsp;&nbsp;<span class="smallGrayText">&nbsp;&nbsp;&nbsp;Clinician 
        Performing Review:
        <input type="checkbox" name="PA22" value="Yes" />
RN&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="PA3" value="Yes" />
PA/NP&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="Fellow3" value="Yes" />
Fellow&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="Attending3" value="Yes" />
Attending</span>
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr >
            <td width="10%" align="center" class="FormInsideTableTopCell"><strong>Organ<br/>System</strong></td>
            <td width="12%" align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Grade<br/>
              0<img src="../../Images/shim.gif" border="0" width="12" height="0" />1<img src="../../Images/shim.gif" border="0" width="12" height="0" />2<img src="../../Images/shim.gif" border="0" width="12" height="0" />3<img src="../../Images/shim.gif" border="0" width="12" height="0" />4</strong></td>
            <td width="15%" align="center" class="FormInsideTableTopCell" style="white-space:nowrap;"><strong>Start - Stop<br/>
              Dates</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Attribution</strong></td>
            <td class="FormInsideTableTopCell" width="35%" align="center"><strong>Comments</strong></td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" rowspan="2" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0" />General</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Fever</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" rowspan="2" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Wght. Loss</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Neuro</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Headaches</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" rowspan="2" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Focal Weakness</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Eyes</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Visual Problems</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="0" />CV</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Angina</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" rowspan="2" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td height="16" align="left" class="FormInsideTableRegCell">Palpitations</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Respiratory</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Cough</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" rowspan="3" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">SOB</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Hemoptysis</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="4"><img src="../../Images/shim.gif" border="0" width="4" height="0" />GI</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Nausea</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" rowspan="4" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Vomiting</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Abdominal Pain</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Rectal Bleeding</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="4"><img src="../../Images/shim.gif" border="0" width="4" height="0" />GU</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Dysuria</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" rowspan="4" align="center" height="20">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Frequency</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Incontinence</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Impotency</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0" />MS</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Joint Pain</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Psych</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Anxiety/Depression</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Heme</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Anemia</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" rowspan="2" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Adenopathy</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Skin</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Rash</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Endo</td>
            <td class="FormInsideTableRegCell" align="left" height="16">Heat/cold Intolerance</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" rowspan="3" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Thirst</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" height="16">Hot Flashes</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Other</td>
            <td class="FormInsideTableRegCell" align="center" height="16">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
        </table></td>
		</tr>
		<tr >
      		<td colspan="8" class="FormOuterTableRow">
				<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
					<tr >
					  <td class="FormInsideTableRegCell" width="50%" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0"><strong>Pain:</strong><img src="../../Images/shim.gif" border="0" width="18" height="0">Y<img src="../../Images/shim.gif" border="0" width="18" height="0">N
						<br/><img src="../../Images/shim.gif" border="0" width="4" height="0">Location:
						<br/>
              <img src="../../Images/shim.gif" border="0" width="4" height="0"><img src="../../Images/shim.gif" border="0" width="1" height="22">Intensity 
              (0-10):<img src="../../Images/shim.gif" border="0" width="62" height="1">Post 
              Relief(0-10):</td>
						<td class="FormInsideTableRegCell" width="50%" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Precipitating Factors:<br/>
              <img src="../../Images/shim.gif" border="0" width="4" height="0"><img src="../../Images/shim.gif" border="0" width="1" height="32">Alleviating 
              Factors:<br/>
              <img src="../../Images/shim.gif" border="0" width="0" height="18"></td>
					</tr>
   			  </table>
			  </td>		
		</tr>
		<tr >
		  <td class="FormOuterTableRow">&nbsp;
            <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes" />
            <span class="blackBoldText"> ROS performed by RN: ___________________________<img src="../../Images/shim.gif" border="0" width="40" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="15" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td>
	    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU14<img src="../../Images/shim.gif" border="0" width="45" height="1">U18<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:12/09/04<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">14</span></td>
    </tr>
	</table>
</div>
<div align="left"  style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U18*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>

  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>GU Prostate New Patient<br/></span></td>
            <td width="50%" align="center" valign="bottom" class="blackBoldText"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>
                    , 
                    <% =patientFirstName  %>
                    <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td width="650" height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="10%" align="center" rowspan="2" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital<br/>Signs</span></td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
          <tr> 
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">KPS:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Height:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Weight:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BSA:</td>
          </tr>
        </table>
	   </td>
    </tr>
    <tr > 
      <td colspan="8" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">
        <input type="checkbox" name="PA" value="Yes">
        PA&nbsp;&nbsp;&nbsp;
        <input type="checkbox" name="NP" value="Yes">
        NP&nbsp;&nbsp;&nbsp;
        <input type="checkbox" name="Attending" value="Yes">
        Attending Confirmed</span> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td class="FormInsideTableTopCell" align="center"><strong>System</strong></td>
            <td class="FormInsideTableTopCell" align="center" colspan="2"><strong>Normal Findings</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Abn</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Not Done</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Attnd<br />
              Performed</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Comments</strong></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="0">Gen/MS</td>
            <td class="FormInnerRowBottomBorder" align="left">NAD</td>
            <td class="FormInsideTableRegCell" width="1%" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" width="7%" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" width="7%" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" width="5%" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td valign="bottom" class="FormInsideTableRegCell" width="46%" rowspan="30" align="center">
			MAX-PC Total Score: __________________<br/>
			<br/>
			<img src="../../Images/ProstateImageURONVWeb.gif" width="251" height="140"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">Alert and Oriented</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">ENT</td>
            <td class="FormInnerRowBottomBorder" align="left">No Scleral icterus</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0">Eyes</td>
            <td class="FormInnerRowBottomBorder" align="left">No Mucositis</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">Mucous Membranes Moist</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No Thrush</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0">Nodes</td>
            <td class="FormInnerRowBottomBorder" align="left">No Cervical</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No Supraclavicular</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No Axillary</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp.</td>
            <td class="FormInnerRowBottomBorder" align="left">Clear to Percusion<br/>and Auscultation</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0">C/V</td>
            <td class="FormInnerRowBottomBorder" align="left">No Edema</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">Regular Rate &amp; Rhythm</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No Murmurs</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0">Abdomen</td>
            <td class="FormInnerRowBottomBorder" align="left">Soft Non-tender;<br/>Normal Bowel Sounds</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No Hepatosplenomegaly</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No Ascites</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="0">Back</td>
            <td class="FormInnerRowBottomBorder" align="left">No Spinal Tenderness</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No CVA Tenderness</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="0">GU<br/><img src="../../Images/shim.gif" border="0" width="4" height="0">Male</td>
            <td class="FormInnerRowBottomBorder" align="left">Testes w/o Tenderness or Masses</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">Normal DRE of Prostate</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="4"><img src="../../Images/shim.gif" border="0" width="4" height="0">M/S</td>
            <td class="FormInnerRowBottomBorder" align="left">No Clubbing or Cyanosis</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No Cord</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No Calf Tenderness</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No Leg Swelling</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro</td>
            <td class="FormInnerRowBottomBorder" align="left">Motor Function Normal</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td  class="FormInnerRowBottomBorder" align="left">Sensation Normal</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">Cran Nerves II-XII Intact</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin</td>
            <td class="FormInnerRowBottomBorder" align="left">No Rash or Ulcers</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInnerRowBottomBorder" align="left">No Nodules</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other</td>
            <td class="FormInnerRowBottomBorder" align="left">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
      <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" id="labTestsBlankTable" runat="server">
          <tr > 
            <td colspan="2" valign="top" class="blackBoldText"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Biochemical 
              Markers</span> </td>
          </tr>
          <tr> 
            <td valign="top" class="FormInnerRowRightBorder" width="50%"> 
	<table border="0" width="100%" cellpadding="1" cellspacing="0">
                <tr > 
                  <td width="29%" align="center" valign="middle" class="FormInsideTableTopCell">Date 
                    <br/>
                    (mm/dd/yyyy)</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Source</td>
                </tr>
                <tr > 
                  <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table>
   			</td>
            <td valign="top" class="blackBoldText" width="50%"><table border="0" width="100%" cellpadding="1" cellspacing="0">
                <tr > 
                  <td width="29%" align="center" valign="middle" class="FormInsideTableTopCell">Date 
                    <br/>
                    (mm/dd/yyyy)</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Source</td>
                </tr>
                <tr > 
                  <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table>
             </td>
          </tr>
        </table>
        

      <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" id="labTestsPopulatedTable" runat="server">
          <tr > 
            <td  valign="top" class="blackBoldText"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Biochemical 
              Markers</span> </td>
          </tr>
          <tr> 
            <td valign="top" class="FormInnerRowRightBorder"> 

				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr> 
						<td>
						<asp:Repeater ID="labTests"  Runat="server"  OnItemDataBound="labTestsItemDataBound">
							<ItemTemplate>
							&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabQuality") %><br/><asp:Literal ID="StartNextLabTestsColumn" Runat="server" />
							</ItemTemplate>
						</asp:Repeater>
						</td>
					</tr>						
				  </table>
            
             </td>
          </tr>
        </table>

        
        
      </td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span><span><img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Films Reviewed">Films Reviewed<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Compared to Past">Compared to Past<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Reviewed with Radiologist">Reviewed with Radiologist<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Digitized">Digitized<br/>
        </span> <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="14" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
            <td width="17" align="center" valign="middle" class="FormInsideTableTopCell">Dx/Img</td>
            <td width="69%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
          </tr>
           <asp:Repeater ID="images" runat="server" OnItemCreated="imagesItemCreated">
			<ItemTemplate>
          <tr > 
            <td align="center" class="FormInsideTableRegCell" height="20">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
            <td class="FormInsideTableRegCell">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
            <td class="FormInnerRowBottomBorder">&nbsp;<asp:Literal ID="ImagesResultBullet" Runat="Server">Result:</asp:Literal> <%# DataBinder.Eval(Container.DataItem, "DxResult") %><asp:Literal ID="ImagesNotesBullet" Runat="Server">&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;</asp:Literal><%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
          </tr>
			</ItemTemplate>
			</asp:Repeater>
        </table>
	</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU14<img src="../../Images/shim.gif" border="0" width="45" height="1">U18<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:12/09/04<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">14</span></td>
    </tr>
  </table>
</div>

<div align="left" style="page-break-after:always;" id="LastPageInForm" runat="server"  >
<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U18*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>

  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>GU Prostate New Patient<br/></span></td>
            <td width="50%" align="center" valign="bottom" class="blackBoldText"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>
                    , 
                    <% =patientFirstName  %>
                    <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td width="650" height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pathology</span><span><img src="../../Images/shim.gif" border="0" width="32" height="1"> 
        <input type="checkbox" name="Reviewed aith Pathologist">
        Reviewed with Pathologist</span> <span><br/>
        </span> <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date 
              (mm/dd/yyyy)</td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Specimen 
              Type</td>
            <td width="38%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td width="32%" align="center" valign="middle" class="FormInsideTableTopCell"> Submitted to <%= institutionShortName%></td>
          </tr>
          <tr> 
            <td height="20" class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <!---<tr> 
            <td height="25" class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>--->
        </table>		</td>
    </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Impression / Plan</span><br/>
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td class="FormInsideTableTopLeftCell" width="50%" align="center"><strong>Diagnoses / Problem List</strong></td>
            <td class="FormInsideTableTopLeftCell" width="50%" align="center"><strong>Plan / Work-up</strong></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="25"><img src="../../Images/shim.gif" border="0" width="4" height="0">1.</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="25"><img src="../../Images/shim.gif" border="0" width="4" height="0">2.</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top"  height="25"><img src="../../Images/shim.gif" border="0" width="4" height="0">3.</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top"  height="25"><img src="../../Images/shim.gif" border="0" width="4" height="0">4.</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top"  height="25"><img src="../../Images/shim.gif" border="0" width="4" height="0">5.</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top"  height="25"><img src="../../Images/shim.gif" border="0" width="4" height="0">6.</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top"  height="25"><img src="../../Images/shim.gif" border="0" width="4" height="0">7.</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" valign="top"  height="25"><img src="../../Images/shim.gif" border="0" width="4" height="0">8.</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top"  height="25"><img src="../../Images/shim.gif" border="0" width="4" height="0">9.</td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
		  <tr >
			<td class="FormInsideTableRegCell" valign="top" height="25"><img src="../../Images/shim.gif" border="0" width="4" height="0">10.</td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
        </table>		</td>
    </tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" /> Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.
		</td>
	</tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="informedConsent" style="vertical-align: middle;" /> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.		</td>
	</tr>
    <tr>
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="4">
				<tr>
					<td class="FormInnerRowRightBorder" width="19%" valign="top"><span class="BlackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Reminders</span>
						<br/><img src="../../Images/shim.gif" border="0" width="4" height="1">Imaging
						<br/><img src="../../Images/shim.gif" border="0" width="4" height="1">Pathology
						<br/><img src="../../Images/shim.gif" border="0" width="4" height="1">Referrals
						<br/><img src="../../Images/shim.gif" border="0" width="4" height="1">Therapies to Consider
						<br/><img src="../../Images/shim.gif" border="0" width="4" height="1">Potential Protocols
						<br/><img src="../../Images/shim.gif" border="0" width="4" height="1">Procedures
						<br/><img src="../../Images/shim.gif" border="0" width="4" height="1">Records to Request
						<br/><img src="../../Images/shim.gif" border="0" width="4" height="1">Prescriptions					</td>
					<td width="81%" height="200" valign="top"><span class="BlackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Notes and Additional Requests</span>					</td>
				</tr>
			</table>		</td>
    </tr>
    <tr>
      <td align="left" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="8" /><span class="blackBoldText">Protocol #: __________________</span><br />
          <table align="left" width="100%">
            <tr>
              <td width="80">Considered:</td>
              <td>&nbsp;&nbsp;Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
              <td width="115">Consent Obtained:</td>
              <td>&nbsp;&nbsp;Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
              <td width="70">Registered:</td>
              <td>&nbsp;&nbsp;Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
            </tr>
        </table></td>
      </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22"> 
              &#8805; 50% of attending time was spent in counseling <br/> <img src="../../Images/shim.gif" border="0" width="13" height="15"> 
              If so, mark total attending time in minutes:<br/> 
              <img src="../../Images/shim.gif" border="0" width="30" height="12"> 
              <input type="checkbox" name="15-24 (3)22">
              40-59 (3) &nbsp;&nbsp; <input type="checkbox" name="25-39 (4)22">
              60-79 (4) &nbsp;&nbsp; <input type="checkbox" name="40+ (5)22">
              80+ (5)</td>
            <td width="50%">Dictated:<img src="../../Images/shim.gif" border="0" width="22" height="1">No<img src="../../Images/shim.gif" border="0" width="15" height="1">Yes<img src="../../Images/shim.gif" border="0" width="25" height="1">By:<img src="../../Images/shim.gif" border="0" width="5" height="1">Fellow/Resident
			<img src="../../Images/shim.gif" border="0" width="20" height="1">Attending<br/><br/>
            Copy to:&nbsp;&nbsp;&nbsp; <input name="fellow222" type="checkbox" id="fellow223">
              Referring M.D.&nbsp;&nbsp;&nbsp;&nbsp; 
              <input name="fellow2222" type="checkbox" id="fellow2222">
              other: ______________</td>
          </tr>
        </table>	  </td>
    </tr>
	<tr>
	  <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td colspan="2"><span class="blackBoldText">Signatures</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr>
            <td><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Fellow: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr>
            <td><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />NP/PA: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
                  <td>Patient was seen and examined today by me and I agree with 
                    the findings and plan as documented.<br/>
                      <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
                
            </table></td>
          </tr>
      </table></td>
	  </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU14<img src="../../Images/shim.gif" border="0" width="45" height="1">U18<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:12/09/04<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">14</span></td>
    </tr>
	</table>
	 </td>
    </tr>
  </table>
</div>


</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>