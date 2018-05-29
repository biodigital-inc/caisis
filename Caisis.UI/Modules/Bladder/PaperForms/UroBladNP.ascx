<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.PaperForms.UroBladNP" CodeFile="UroBladNP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>



<asp:PlaceHolder id="SurveyFormHolder" runat="server"></asp:PlaceHolder>


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
		<div  class="VerticalBarCodeDocType">*U07*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            Urology Bladder New Patient<br />
          </span></td>
          <td width="50%" align="center" valign="bottom" class="blackBoldText"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
                <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
              </tr>
              <tr>
                <td align="right"><% =patientMRNLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left"><strong>
                  <% =patientMRN  %>
                  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <% =patientDOB  %>
                </td>
              </tr>
              <tr>
                <td colspan="1" align="right"><% =patientNameLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td colspan="1" align="left"><strong>
                  <% =patientLastName  %>
                  ,
                  <% =patientFirstName  %>
                  <% =patientMiddleName  %>
                </strong></td>
              </tr>
              <tr>
                <td align="right" valign="top"><% =patientAddressLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left" valign="top"><% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                </td>
              </tr>
              <tr>
                <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: 
        <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>
        </span></td>
    </tr>
<%--<!--<tr bgcolor="#FFFFFF"> 
      <td class="FormOuterTableRow"> 
	  	<table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="325" height="35" align="left" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Requesting&nbsp;M.D.:&nbsp;&nbsp; 
              <asp:Label ID="ReferringMd1Name" Runat="server" CssClass="blackBoldText" /><br> 
              <img src="../../Images/shim.gif" border="0" width="40" height="16"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
              <%= institutionShortName%>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
              Non-<%= institutionShortName%></td>
            <td width="325" align="left"><img src="../../Images/shim.gif" border="0" width="4" height="0">Requesting&nbsp;M.D.:&nbsp;&nbsp; 
              <asp:Label ID="ReferringMd2Name" Runat="server" CssClass="blackBoldText" /><br> 
              <img src="../../Images/shim.gif" border="0" width="40" height="16"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
              <%= institutionShortName%>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
              Non-<%= institutionShortName%></td>
          </tr>
          <tr> 
            <td height="22" align="left" class="FormInnerRowRightBorder"><table width="300" border="0" cellspacing="0" cellpadding="1">
                <tr> 
                  <td width="70" align="right" valign="bottom">Phone</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd1Phone" Runat="server" CssClass="blackBoldText" /></td>
                </tr>
                <tr> 
                  <td align="right" valign="bottom">Fax</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd1Fax" Runat="server" CssClass="blackBoldText" /></td>
                </tr>
                <tr> 
                  <td align="right" valign="bottom">Specialty</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd1Specialty" Runat="server" CssClass="blackBoldText" /></td>
                </tr>
              </table></td>
            <td align="left"><table width="300" border="0" cellspacing="0" cellpadding="1">
                <tr> 
                  <td width="70" align="right" valign="bottom">Phone</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd2Phone" Runat="server" CssClass="blackBoldText" /></td>
                </tr>
                <tr> 
                  <td align="right" valign="bottom">Fax</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd2Fax" Runat="server" CssClass="blackBoldText" /></td>
                </tr>
                <tr> 
                  <td align="right" valign="bottom">Specialty</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd2Specialty" Runat="server" CssClass="blackBoldText" /></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>-->
--%>	<tr>
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2" align="left" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Category of Service</span></td>
				</tr>
				<tr>
					<td width="23%" valign="top" align="center" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;New Patient Encounter<br />(CPT 99201-99205)</td>
					<td width="77%" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Use for patients who have not been see by anyone in your billing group in the last 3 years <strong>AND</strong><br />
						<img src="../../Images/shim.gif" border="0" width="12" height="1"><strong>-</strong>Are self referred (includes those referred by friend or patient)<br />
						<img src="../../Images/shim.gif" border="0" width="12" height="1"><strong>-</strong>Do not have  physician asking for your advice/opinion (see PIF sheet or PAS info)<br />
						<img src="../../Images/shim.gif" border="0" width="12" height="1"><strong>-</strong>Are referred solely for management and/or treatment of aspect of care<br />
					</td>
				</tr>
				<tr>
					<td valign="top" align="center" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Office Consultation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />(CPT 99241- 99245)</td>
					<td class="FormInsideTableRegCell">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td class="FormInsideTableRegCell" colspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="1">Office Consultation is requested by _________________________ MD/PA/NP for my advice & opinion<br />
								<img src="../../Images/shim.gif" border="0" width="4" height="1">regarding this patient’s ______________________________________________________</td>
							</tr>
							<tr> 
								<td width="50%" height="35" align="left" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Requesting&nbsp;M.D.:&nbsp;&nbsp; <asp:Label ID="ReferringMd1Name" Runat="server" CssClass="blackBoldText" /><br> 
								  <img src="../../Images/shim.gif" border="0" width="40" height="16"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
								  <%= institutionShortName%>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop">Non-<%= institutionShortName%></td>
								<td width="50%" align="left"><img src="../../Images/shim.gif" border="0" width="4" height="0">Contact&nbsp;M.D.:&nbsp;&nbsp;<asp:Label ID="ReferringMd2Name" Runat="server" CssClass="blackBoldText" /><br> 
								  <img src="../../Images/shim.gif" border="0" width="40" height="16"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
								  <%= institutionShortName%>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> Non-<%= institutionShortName%></td>
							</tr>
							<tr>
								<td width="50%" class="FormInnerRowRightBorder">
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr> 
										  <td width="20%" align="right" valign="bottom">Phone</td>
										  <td width="80%" class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd1Phone" Runat="server" CssClass="blackBoldText" /></td>
										</tr>
										<tr> 
										  <td align="right" valign="bottom">Fax</td>
										  <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd1Fax" Runat="server" CssClass="blackBoldText" /></td>
										</tr>
										<tr> 
										  <td align="right" valign="bottom">Specialty</td>
										  <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd1Specialty" Runat="server" CssClass="blackBoldText" /></td>
										</tr>
									</table>
								</td>
								<td width="50%">
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr> 
										  <td width="20%" align="right" valign="bottom">Phone</td>
										  <td width="80%" class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd2Phone" Runat="server" CssClass="blackBoldText" /></td>
										</tr>
										<tr> 
										  <td align="right" valign="bottom">Fax</td>
										  <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd2Fax" Runat="server" CssClass="blackBoldText" /></td>
										</tr>
										<tr> 
										  <td align="right" valign="bottom">Specialty</td>
										  <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp; <asp:Label ID="ReferringMd2Specialty" Runat="server" CssClass="blackBoldText" /></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>					
					</td>
					<!--<td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Office Consultation is requested by _________________________ MD/PA/NP for my advice & opinion<br />
					<img src="../../Images/shim.gif" border="0" width="4" height="1">regarding this patient’s ______________________________________________________</td>-->				
				</tr>
				<tr>
					<td valign="top" align="center" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Established Patient Visit<br />(CPT 99212-99215)</td>
					<td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Use for patients who<br />
						<img src="../../Images/shim.gif" border="0" width="12" height="1"><strong>-</strong>Are seeing you for the first time for management or treatment (Not a consult) and have been seen<br />
						<img src="../../Images/shim.gif" border="0" width="18" height="1">by someone else in your billing group in the last 3 years<br />
						<img src="../../Images/shim.gif" border="0" width="12" height="1"><strong>-</strong>Are seeing you for follow-up care/visits

					</td>
				</tr>
			</table>
		</td>
	</tr>
	<!--Section commented out until new version approved: July 2006 Kevin-->
<!--<tr bgcolor="#FFFFFF" > 
      <td valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Category of Service</span><br>
	  	<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr valign="top"> 
            <td width="17%" class="FormInnerRowRightBorder"> <span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"></span> 
              <strong>New Patient</strong></td>
            <td> &nbsp;<span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"></span> 
              <strong>Office Consultation</strong> Requested by __________________ 
              for evaluation of ______________________.<br> <img src="../../Images/shim.gif" border="0" width="1" height="20">Please 
              send note to the requesting physician and the following: _________________________________.</td>
          </tr>
        </table></td>
    </tr>-->
	<tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Chief Complaint</span><br /><br /><img src="../../Images/shim.gif" border="0" width="4" height="1">Dx Date:<img src="../../Images/shim.gif" border="0" width="120" height="1">2002 TNM Stage: </td>
    </tr>
    <tr> 
      <td height="110" align="center" valign="top" class="FormOuterTableRow"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">HPI</span></td>
          </tr>
          <tr> 
            <td height="140" align="center">
				<table cellpadding="4" cellspacing="0" border="0" id="PopulatedHPITable" runat="server" width="700">
                <tr> 
                  <td class="HPITextBladder" valign="top" width="*"> <asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound"> 
                      <ItemTemplate> 
                        <%# DataBinder.Eval(Container.DataItem, "patientHPI") %>
                        <br>
                        <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                      </ItemTemplate>
                    </asp:Repeater> <asp:Repeater ID="HpiProstatectomies" runat="server" OnItemDataBound="HpiProstatectomiesItemDataBound"> 
                      <ItemTemplate> <strong> 
                        <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                        </strong> on 
                        <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                        <asp:Label ID="CaseSurgeonLabel" Runat="server">by 
                          <%# DataBinder.Eval(Container.DataItem, "ProcSurgeon") %>
                        </asp:Label>
                        <br>
                        <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                      </ItemTemplate>
                    </asp:Repeater> <asp:Label ID="PreTxPot" Runat="server" /> 
                    <asp:Repeater ID="hpiProtocols" runat="server" OnItemDataBound="appendToHpiItemDataBound"> 
                      <ItemTemplate> Protocol 
                        <%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %>
                        <%# DataBinder.Eval(Container.DataItem, "ProtocolNotes") %>
                        <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>
                        <br>
                        <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                      </ItemTemplate>
                    </asp:Repeater> <asp:Repeater ID="hpiBiopsies" runat="server" > 
                      <ItemTemplate> Biopsy:&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                        &nbsp;&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                        &nbsp;&nbsp;Result:&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "PathResult") %>
                        &nbsp;&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "PathQuality") %>
                        <br>
                        <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                      </ItemTemplate>
                    </asp:Repeater> 
                    
                    
                    <asp:Label ID="NVB_Left" Runat="server" /> 
                    <asp:Label ID="NVB_Right" Runat="server" />
                   </td>
                </tr>
              </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" id="BlankHPITable" runat="server">
                <tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <!--<tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>-->
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="22">&nbsp;</td>
                </tr>
              </table>
			 </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr align="left"> 
            <td colspan="6" valign="middle"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Presenting Symptoms</span></td>
          </tr>
          <tr> 
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">System</td>
            <td width="17%" align="center" valign="middle" class="FormInsideTableTopCell">Symptom</td>
            <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">Presenting</td>
            <td width="8%" align="center" valign="middle" class="FormInsideTableTopCell">Current</td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">Presenting Date</td>
            <td width="44%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <tr> 
            <td rowspan="10" align="center" valign="top" class="FormInsideTableRegCell">GU</td>
            <td class="FormInsideTableRegCell">Dysuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Nocturia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Obstructive Symp*</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Flank Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Sexual Symptoms</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Groin Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Urgency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="center" valign="top" class="FormInsideTableRegCell">Gen</td>
            <td class="FormInsideTableRegCell">Chills / Fever</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="center" class="FormInsideTableRegCell">M/S</td>
            <td class="FormInsideTableRegCell">Bone Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="center" class="FormInsideTableRegCell">C/V</td>
            <td class="FormInsideTableRegCell">Peripheral Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="6" class="FormInsideTableRegCell">&nbsp;&nbsp;&nbsp;&nbsp;Other</td>
          </tr>
        </table>
        <span>&nbsp;*hesitancy, intermittance, weak stream, dribbling</span></td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU03<img src="../../Images/shim.gif" border="0" width="45" height="1">U07<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U07*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>    <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            Urology Bladder New Patient<br />
          </span></td>
          <td width="50%" align="center" valign="bottom" class="blackBoldText"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
                <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
              </tr>
              <tr>
                <td align="right"><% =patientMRNLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left"><strong>
                  <% =patientMRN  %>
                  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <% =patientDOB  %>
                </td>
              </tr>
              <tr>
                <td colspan="1" align="right"><% =patientNameLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td colspan="1" align="left"><strong>
                  <% =patientLastName  %>
                  ,
                  <% =patientFirstName  %>
                  <% =patientMiddleName  %>
                </strong></td>
              </tr>
              <tr>
                <td align="right" valign="top"><% =patientAddressLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left" valign="top"><% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                </td>
              </tr>
              <tr>
                <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Lab Tests</span></td>
          </tr>
          <tr  id="LabTestsTrendViewPopTableRow" runat="server"> 
            <td colspan="2" class="FormInnerRowBottomBorder">
			<table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
                <tr> 
                  <td width="90" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <asp:Repeater ID="LabTestsTrendViewDates" runat="server"> 
                    <ItemTemplate> 
                      <td width="80" height="12" class="FormInsideTableRegCell" align="center"><strong>
                        <%# DataBinder.Eval(Container.DataItem, "LabDates") %>
                        </strong></td>
                    </ItemTemplate>
                  </asp:Repeater>
                  <td width="90" align="left" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                </tr>
                <asp:Repeater ID="LabTestsTrendView" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td align="center" class="FormInsideTableRegCell">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "[0]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "[1]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "[2]") %>
                        </strong></td>
                      <td class="FormInsideTableRegCell" align="center">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "[3]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "[4]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "[5]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "[6]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;</td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
          </tr>
          <tr id="LabTestsTrendViewBlankTableRow" runat="server"> 
            <td width="350" class="FormInnerRowRightBorder"> 
			<table align="center" border="0" width="100%" cellpadding="1" cellspacing="0" >
                <tr> 
                  <td class="FormInnerRowRightBorder">&nbsp;</td>
                  <td colspan="3" align="center" class="FormInsideTableRegCell"><strong>Results</strong></td>
                </tr>
                <tr> 
                  <td width="55" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <td width="95" height="12" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="95" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="95" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
            <td>
			<table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
                <tr> 
                  <td class="FormInnerRowRightBorder">&nbsp;</td>
                  <td colspan="3" align="center" class="FormInnerRowBottomBorder"><strong>Results</strong></td>
                </tr>
                <tr> 
                  <td width="55" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <td width="95" height="12" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="95" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="95" class="FormInnerRowBottomBorder"><strong>Date:</strong></td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
              </table>
			  </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow" style="border-bottom: none;"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span><span><img src="../../Images/shim.gif" border="0" width="12" height="8"> 
        <input type="checkbox" name="Films Reviewed">Films Reviewed</span>
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="18%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td width="50%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
		  </table></td>
    </tr>

    <asp:Repeater ID="images" runat="server"> 
      <ItemTemplate>
			    <tr> 
      <td class="FormOuterTableRow" style="border-bottom: none;">
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr> 
                <td   align="center" class="FormInsideTableRegCell" style="width: 12%; height: 30px; vertical-align: top;">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong></td>
                <td class="FormInsideTableRegCell" style="width: 18%; height: 30px; vertical-align: top;">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                  </strong></td>
                <td class="FormInsideTableRegCell" style="width: 20%; height: 30px; vertical-align: top;">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                  </strong></td>
                <td class="FormInsideTableRegCell" style="width: 50%; height: 30px; vertical-align: top;"> 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                  &nbsp; </td>
              </tr>
			  </table></td>
    </tr>
            </ItemTemplate>
          </asp:Repeater>
        
    <tr> 
      <td class="FormOuterTableRow" style="border-top: 1px solid #000000;">
	  	<table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="6"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Procedures: Endoscopies</span></td>
          </tr>
          <tr> 
            <td width="80" align="center" class="FormInsideTableTopLeftCell">Date</td>
            <td width="75" align="center" class="FormInsideTableTopCell">Procedure</td>
            <td width="310" align="center" class="FormInsideTableTopCell">Findings</td>
            <td width="105" align="center" class="FormInsideTableTopCell">Pathology</td>
            <td width="65" align="center" class="FormInsideTableTopCell">Cytology</td>
            <td width="65" align="center" class="FormInsideTableTopCell">Pathology Source</td>
          </tr>
          <asp:Repeater ID="Endoscopies" runat="server"> 
            <ItemTemplate> 
              <tr> 
                <td height="30" class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "PathResult") %>
                  </strong></td>
                <td class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "PathStageT") %>
                  &nbsp;&nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathGrade") %>
                  &nbsp;&nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathHistology") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInnerRowBottomBorder">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "Pathologist") %>
                  </strong></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table></td>
    </tr>
    <tr> 
      <td align="left" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Intravesical Therapies</span>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr align="center"> 
            <td width="70" class="FormInsideTableTopLeftCell">Start Date</td>
            <td width="70" class="FormInsideTableTopCell">Stop Date</td>
            <td width="160" class="FormInsideTableTopCell">Agent(s)</td>
            <td width="400" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <asp:Repeater ID="IntravesicalTx" runat="server"> 
            <ItemTemplate> 
              <tr > 
                <td height="30" class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>
                  </strong></td>
                <td class="FormInnerRowBottomBorder">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "MedTxNotes") %>
                  </strong></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table></td>
    </tr>
    <tr> 
      <td align="left" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Systemic Therapies</span>
	 	<table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr align="center"> 
            <td width="70" class="FormInsideTableTopLeftCell">Start Date</td>
            <td width="70" class="FormInsideTableTopCell">Stop Date</td>
            <td width="160" class="FormInsideTableTopCell">Agent(s)</td>
            <td width="400" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <asp:Repeater ID="SystemicTx" runat="server"> 
            <ItemTemplate> 
              <tr > 
                <td height="30" class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>
                  </strong></td>
                <td class="FormInnerRowBottomBorder">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "MedTxNotes") %>
                  </strong></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table></td>
    </tr>
    <tr> 
      <td align="left" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Radiation Therapies</span><br> 
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr align="center"  class="eFormInnerTableRow"> 
            <td width="70" class="FormInsideTableTopLeftCell">Start Date</td>
            <td width="70" class="FormInsideTableTopCell">Stop Date</td>
            <td width="180" class="FormInsideTableTopCell">Type and Target</td>
            <td width="100" class="FormInsideTableTopCell">Total Dosage</td>
            <td width="280" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <asp:Repeater ID="XRT" runat="server"> 
            <ItemTemplate> 
              <tr> 
                <td height="30" class="FormInsideTableLeftCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "RadTxType") %>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "RadTxNotes") %>
                  </strong></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU03<img src="../../Images/shim.gif" border="0" width="45" height="1">U07<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U07*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            Urology Bladder New Patient<br />
          </span></td>
          <td width="50%" align="center" valign="bottom" class="blackBoldText"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
                <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
              </tr>
              <tr>
                <td align="right"><% =patientMRNLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left"><strong>
                  <% =patientMRN  %>
                  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <% =patientDOB  %>
                </td>
              </tr>
              <tr>
                <td colspan="1" align="right"><% =patientNameLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td colspan="1" align="left"><strong>
                  <% =patientLastName  %>
                  ,
                  <% =patientFirstName  %>
                  <% =patientMiddleName  %>
                </strong></td>
              </tr>
              <tr>
                <td align="right" valign="top"><% =patientAddressLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left" valign="top"><% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                </td>
              </tr>
              <tr>
                <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td height="140" valign="top" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr valign="top"> 
            <td colspan="2" class="FormInnerRowRightBorder"><span class="blackBoldText">Medical History / Comorbidities</span></td>
          </tr>
          <tr valign="top"> 
            <td width="68%" height="45" class="FormInsideTableTopCell" id="ComorbiditiesCell1" runat="server">1.<br> 
              <asp:Repeater ID="comorbidities" runat="server"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
                  - <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>
                  </strong> </ItemTemplate>
                <SeparatorTemplate><br>
                </SeparatorTemplate>
              </asp:Repeater> </td>
            <td width="32%" rowspan="7" class="FormInsideTableTopCell"> <input name="Comorbidity" type="checkbox" id="Comorbidity">
              Coronary Artery Disease / MI<br/> <input name="Comorbidity2" type="checkbox" id="Comorbidity13">
              Other Cardiac Disease __________<br/> <input name="Comorbidity3" type="checkbox" id="Comorbidity14">
              Hypertension<br/> <input name="Comorbidity4" type="checkbox" id="Comorbidity15">
              CVA<br/> <input name="Comorbidity5" type="checkbox" id="Comorbidity16">
              Thromboembolic Events / DVT<br/> <input name="Comorbidity6" type="checkbox" id="Comorbidity17">
              Pulmonary Disease / Asthma / COPD<br/> <input name="Comorbidity7" type="checkbox" id="Comorbidity18">
              Diabetes (IDDM/NIDDM)<br/> <input name="Comorbidity8" type="checkbox" id="Comorbidity19">
              Hypercholesterolemia<br/> <input name="Comorbidity9" type="checkbox" id="Comorbidity20">
              Depression<br/> <input name="Comorbidity10" type="checkbox" id="Comorbidity21">
              Back Pain / DJD<br/> <input name="Comorbidity11" type="checkbox" id="Comorbidity22">
              Inflammatory Bowel Disease<br/> <input name="Comorbidity12" type="checkbox" id="Comorbidity23">
              Diverticulitis</td>
          </tr>
          <tr valign="top"> 
            <td height="45" class="FormInsideTableRegCell" id="ComorbiditiesCell2" runat="server">2.</td>
          </tr>
          <tr valign="top"> 
            <td height="45" class="FormInsideTableRegCell"  id="ComorbiditiesCell3" runat="server">3.</td>
          </tr>
          <tr valign="top"> 
            <td height="45" class="FormInsideTableRegCell">4.</td>
          </tr>
          <tr valign="top"> 
            <td height="45" class="FormInsideTableRegCell">5.</td>
          </tr>
          <tr valign="top"> 
            <td height="45" class="FormInsideTableRegCell">6.</td>
          </tr>
          <tr valign="top"> 
            <td height="45" class="FormInnerRowRightBorder">7.</td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td height="80" valign="top" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr valign="top"> 
            <td colspan="2" class="FormInnerRowRightBorder"><span class="blackBoldText">Surgical History </span></td>
          </tr>
          <tr valign="top"> 
            <td width="350" height="45" class="FormInsideTableTopCell" id="SurgicalHistoryCell1" runat="server">1. 
              <asp:Repeater ID="SurgicalHistory" runat="server"> 
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "VarDate") %>
                  :&nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "VarName") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "VarValue") %>
                  </strong> </ItemTemplate>
                <SeparatorTemplate><br>
                </SeparatorTemplate>
              </asp:Repeater> </td>
            <td width="350" class="FormInsideTableTopCell">6.</td>
          </tr>
          <tr valign="top"> 
            <td height="45" class="FormInsideTableRegCell"  id="SurgicalHistoryCell2" runat="server">2.</td>
            <td class="FormInnerRowBottomBorder">7.</td>
          </tr>
          <tr valign="top"> 
            <td height="45" class="FormInsideTableRegCell"  id="SurgicalHistoryCell3" runat="server">3.</td>
            <td class="FormInnerRowBottomBorder">8.</td>
          </tr>
          <tr valign="top"> 
            <td height="45" class="FormInsideTableRegCell"  id="SurgicalHistoryCell4" runat="server">4.</td>
            <td class="FormInnerRowBottomBorder">9.</td>
          </tr>
          <tr valign="top"> 
            <td height="45" class="FormInnerRowRightBorder"  id="SurgicalHistoryCell5" runat="server">5.</td>
            <td>10.</td>
          </tr>
        </table>
		</td>
    </tr>
	<tr>
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellpadding="2" cellspacing="0">
				<tr align="left" valign="top">
					<td colspan="3" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Health Maintenance</span></td>
				</tr>
				<tr>
					<td width="26%" align="center" class="FormInsideTableTopLeftCell">Diagnostic Test</td>
					<td width="15%" align="center" class="FormInsideTableTopCell">Date</td>
					<td width="59%" align="center" class="FormInsideTableTopCell">Results</td>
				</tr>
				<tr>
					<td height="45" align="center" class="FormInsideTableLeftCell">Last Colonoscopy</td>
					<td align="center" class="FormInsideTableRegCell">&nbsp;</td>
					<td align="center" class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
					<td height="45" align="center" class="FormInsideTableLeftCell" style="white-space:nowrap;">Last Mammography</td>
					<td align="center" class="FormInsideTableRegCell">&nbsp;</td>
					<td align="center" class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
					<td height="45" align="center" class="FormInsideTableLeftCell">Last PAP Smear</td>
					<td align="center" class="FormInsideTableRegCell">&nbsp;</td>
					<td align="center" class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
					<td height="45" align="center" class="FormInsideTableLeftCell">Last Stress Test</td>
					<td align="center" class="FormInsideTableRegCell">&nbsp;</td>
					<td align="center" class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
				  <td height="45" align="center" class="FormInsideTableLeftCell">Last Prostate Cancer Screening</td>
				  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
				  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
			  </tr>
			</table>
		</td>
	</tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU03<img src="../../Images/shim.gif" border="0" width="45" height="1">U07<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U07*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
  <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            Urology Bladder New Patient<br />
          </span></td>
          <td width="50%" align="center" valign="bottom" class="blackBoldText"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
                <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
              </tr>
              <tr>
                <td align="right"><% =patientMRNLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left"><strong>
                  <% =patientMRN  %>
                  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <% =patientDOB  %>
                </td>
              </tr>
              <tr>
                <td colspan="1" align="right"><% =patientNameLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td colspan="1" align="left"><strong>
                  <% =patientLastName  %>
                  ,
                  <% =patientFirstName  %>
                  <% =patientMiddleName  %>
                </strong></td>
              </tr>
              <tr>
                <td align="right" valign="top"><% =patientAddressLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left" valign="top"><% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                </td>
              </tr>
              <tr>
                <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td  valign="top"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="1">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="ROS182" type="checkbox" id="ROS182" value="Yes">
                    NKA&nbsp;&nbsp; </span></td>
                </tr>
                <tr align="center"> 
                  <td class="FormInsideTableLeftCell" style="width: 35%;">Allergen</td>
                  <td class="FormInnerRowBottomBorder">Reaction</td>
                </tr>
                <asp:Repeater ID="allergies" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td height="40" class="FormInsideTableLeftCell">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "Allergen") %>
                        </strong></td>
                      <td class="FormInnerRowBottomBorder">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %>
                        </strong></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText"></span>Family 
              and Social History</span></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td width="53%" height="500" class="FormInnerRowRightBorder"><strong>Family 
              History:</strong><br> 
              <br> <img src="../../Images/shim.gif" border="0" width="98" height="1"> 
              <input type="checkbox" name="famHxProstateCancerYes2" runat="server" ID="famHxProstateCancerYes2"/>
              No known family history of ca<br> <img src="../../Images/shim.gif" border="0" width="12" height="1"> 
              <table width="370" border="0" cellspacing="0" cellpadding="0" id="BlankFamilyHistoryTable" runat="server">
                <tr> 
                  <td><img src="../../Images/shim.gif" border="0" width="82" height="1"></td>
                  <td><img src="../../Images/shim.gif" border="0" width="25" height="1"></td>
                  <td><img src="../../Images/shim.gif" border="0" width="25" height="1"></td>
                  <td><img src="../../Images/shim.gif" border="0" width="40" height="1"></td>
                  <td><img src="../../Images/shim.gif" border="0" width="140" height="1"></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td align="center">Y</td>
                  <td align="center">N</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td>Bladder Ca</td>
                  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                  <td align="right">If Y:&nbsp;</td>
                  <td>No. 1&deg; relatives:&nbsp;&nbsp;_______</td>
                </tr>
                <tr> 
                  <td colspan="3">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>No other relatives:&nbsp;_______</td>
                </tr>
                <tr> 
                  <td colspan="3">&nbsp; </td>
                  <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Side of Family:</td>
                </tr>
                <tr> 
                  <td><img src="../../Images/shim.gif" border="0" width="10" height="50"></td>
                  <td align="center" valign="bottom">Y</td>
                  <td align="center" valign="bottom">N</td>
                  <td>&nbsp;</td>
                  <td valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;Maternal<br> 
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;Paternal</td>
                </tr>
                <tr> 
                  <td valign="top">Other Ca</td>
                  <td align="center" valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                  <td align="center" valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                  <td align="right" valign="top">List:&nbsp;</td>
                  <td valign="top">&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Breast <br> &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Kidney<br> &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Prostate<br> &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Testis <br> &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Other: ___________</td>
                </tr>
                <tr> 
                  <td valign="bottom">&nbsp;</td>
                  <td align="center" valign="bottom">Y</td>
                  <td align="center" valign="bottom">N</td>
                  <td align="right" valign="bottom">&nbsp;</td>
                  <td valign="top">&nbsp;</td>
                </tr>
                <tr> 
                  <td valign="bottom">Other Non-Ca</td>
                  <td align="center" valign="bottom"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                  <td align="center" valign="bottom"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                  <td align="right" valign="bottom">List:&nbsp;</td>
                  <td valign="top">&nbsp;</td>
                </tr>
				<tr> 
					<td align="left" valign="middle" colspan="5"><br /><img src="../../Images/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Family History of early Heart Disease</td>
				</tr>
                <tr> 
                  <td height="50" colspan="5">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="5"> 
				  	<table width="312" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td><img src="../../Images/shim.gif" border="0" width="40" height="8"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="50" height="1"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="50" height="1"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="50" height="1"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="122" height="8"></td>
                      </tr>
                      <tr> 
                        <td>&nbsp;</td>
                        <td align="center">Alive</td>
                        <td align="center">Dead</td>
                        <td align="center">Age</td>
                        <td align="center">Cause of Death</td>
                      </tr>
                      <tr> 
                        <td>Mother</td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                      <tr> 
                        <td>Father</td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                      <tr>
                        <td>Siblings</td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                      <tr> 
                        <td>Other</td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                    </table>
					</td>
                </tr>
              </table>
              <br> <asp:Repeater ID="familyHistory" runat="server" OnItemCreated="FamilyHistoryItemCreated"> 
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "FamMemNum") %>
                  <%# DataBinder.Eval(Container.DataItem, "FamMemRelation") %>
                  <asp:Label ID="FamMemSide" Runat="server">( 
                    <%# DataBinder.Eval(Container.DataItem, "FamMemSide") %>
                    )</asp:Label>
                  </strong> 
                  <asp:Label ID="FamMemDiagnosis" Runat="server" >with 
                    <%# DataBinder.Eval(Container.DataItem, "FamMemDiagnosis") %>
                  </asp:Label>
                  <br>
                </ItemTemplate>
              </asp:Repeater>
            </td>
            <td width="47%" class="FormInnerRowRightBorder"><strong>Social History:<br>
              </strong><br> 
              <br>
              Occupation: 
              <asp:Label ID="socHxOccupation" Runat="server" /><br> <br> <br> 
              <br>
              Marital Status: 
              <asp:Label ID="socHxMaritalStatus" Runat="server" /><img src="../../Images/shim.gif" border="0" width="100" height="1">Children: 
              <asp:Label ID="socHxChildren" Runat="server" /> <br> <img src="../../Images/shim.gif" border="0" width="1" height="28"> 
              <br> <br>
              Tobacco Use: 
              <input type="checkbox" name="Digitized22224">
              Never Smoked<br> <br> <img src="../../Images/shim.gif" border="0" width="84" height="25">Type: 
              <asp:Label ID="socHxTobaccoType" Runat="server"> 
                <input type="checkbox" name="Digitized2222">
                Cigarettes <img src="../../Images/shim.gif" border="0" width="10" height="1"> 
                <input type="checkbox" name="Digitized22222">
                Cigar<img src="../../Images/shim.gif" border="0" width="10" height="1"> 
                <input type="checkbox" name="Digitized22223">
                Pipe</asp:Label> <br> <img src="../../Images/shim.gif" border="0" width="80" height="19"> 
              <input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" NAME="socHxTobaccoPacksPerDayCheckBox"/> 
              <asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label>
              packs / day for 
              <asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label>
              years<br> <img src="../../Images/shim.gif" border="0" width="80" height="19"> 
              <input type="checkbox" id="socHxTobaccoQuitYearCheckbox" runat="server" NAME="socHxTobaccoQuitYearCheckbox"/>
              Year Quit: 
              <asp:Label ID="socHxTobaccoQuitYear" Runat="server">______ </asp:Label> <br>
			  
			  <table cellpadding="0" cellspacing="0" style="margin-left: 84px; margin-top: 16px; margin-right: 0px;">
			  <tr>
			  <td style="padding-right: 14px;">Have you smoked even a puff in the past 30 days?</td>
			  <td style="white-space: nowrap; padding-right: 8px; text-align: right;"><input type="checkbox" id="socHxPuffLast30DaysYes" runat="server" NAME="socHxPuffLast30DaysYes"/>Yes&nbsp;&nbsp;<input type="checkbox" id="socHxPuffLast30DaysNo" runat="server" NAME="socHxPuffLast30DaysNo"/>No</td>
			  </tr>
			  </table>
              
			  
			   <br> <br>
              Alcohol Use: 
              <asp:Label ID="socHxAlcohol" Runat="server" /><br> <br> <br> <br>
              Carcinogen Exposure / Second-Hand: 
              <asp:Label ID="socHxCarcinogen" Runat="server" /></td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU03<img src="../../Images/shim.gif" border="0" width="45" height="1">U07<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U07*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
  <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            Urology Bladder New Patient<br />
          </span></td>
          <td width="50%" align="center" valign="bottom" class="blackBoldText"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
                <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
              </tr>
              <tr>
                <td align="right"><% =patientMRNLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left"><strong>
                  <% =patientMRN  %>
                  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <% =patientDOB  %>
                </td>
              </tr>
              <tr>
                <td colspan="1" align="right"><% =patientNameLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td colspan="1" align="left"><strong>
                  <% =patientLastName  %>
                  ,
                  <% =patientFirstName  %>
                  <% =patientMiddleName  %>
                </strong></td>
              </tr>
              <tr>
                <td align="right" valign="top"><% =patientAddressLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left" valign="top"><% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                </td>
              </tr>
              <tr>
                <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Review of Systems</span>
		&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Review:
        <input type="checkbox" name="NP22" value="Yes" />
NP / PA&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="Fellow22" value="Yes" />
Fellow&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="Attending22" value="Yes" />
Attending</span>
		<table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr> 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Not Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong> Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Disease<br>Related</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell">Gen</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Fever</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS" type="checkbox" id="ROS" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS18" type="checkbox" id="ROS18" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell">Skin</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Rash</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS3" type="checkbox" id="ROS3" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS20" type="checkbox" id="ROS20" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell">Resp</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS4" type="checkbox" id="ROS4" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS21" type="checkbox" id="ROS21" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Shortness of Breath</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS4" type="checkbox" id="ROS4" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS21" type="checkbox" id="ROS21" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Hemoptysis</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS5" type="checkbox" id="ROS5" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS22" type="checkbox" id="ROS22" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell">CV</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Angina</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS6" type="checkbox" id="ROS6" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS23" type="checkbox" id="ROS23" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Palpitations</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS7" type="checkbox" id="ROS7" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS24" type="checkbox" id="ROS24" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell">GI</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Nausea</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS8" type="checkbox" id="ROS8" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS25" type="checkbox" id="ROS25" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="4" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS9" type="checkbox" id="ROS9" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS26" type="checkbox" id="ROS26" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Abdominal Pain</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS10" type="checkbox" id="ROS10" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS27" type="checkbox" id="ROS27" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Rectal Bleeding</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS11" type="checkbox" id="ROS11" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS28" type="checkbox" id="ROS28" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell">MS</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Joint Pain</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS14" type="checkbox" id="ROS14" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS31" type="checkbox" id="ROS31" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="1" align="left" valign="top" class="FormInsideTableRegCell">Psych</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Anxiety / Depression</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS15" type="checkbox" id="ROS15" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"> <input name="ROS32" type="checkbox" id="ROS32" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp; </td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell">Heme</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Fatigue</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS12" type="checkbox" id="ROS12" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS29" type="checkbox" id="ROS29" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS13" type="checkbox" id="ROS13" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS30" type="checkbox" id="ROS30" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell">GU</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS12" type="checkbox" id="ROS12" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS29" type="checkbox" id="ROS29" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Urgency</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS13" type="checkbox" id="ROS13" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS30" type="checkbox" id="ROS30" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Flank Pain</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS13" type="checkbox" id="ROS13" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS30" type="checkbox" id="ROS30" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell">Endo</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Heat / Cold Intolerance</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS14" type="checkbox" id="ROS14" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS31" type="checkbox" id="ROS31" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Thirst</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS14" type="checkbox" id="ROS14" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS31" type="checkbox" id="ROS31" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Hot Flashes</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS15" type="checkbox" id="ROS15" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS32" type="checkbox" id="ROS32" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell">Neuro</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Headaches</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS16" type="checkbox" id="ROS16" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS33" type="checkbox" id="ROS33" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Focal Weakness</td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS17" type="checkbox" id="ROS17" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell"><input name="ROS34" type="checkbox" id="ROS34" value="Yes"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="40" colspan="7" align="left" valign="top">Other:<img src="../../Images/shim.gif" border="0" width="1" height="10"></td>
          </tr>
        </table></td>
    </tr>
<!--    <tr bgcolor="#FFFFFF"> 
      <td height="30" class="FormOuterTableRow">
        <table width="700" border="0" cellspacing="0" cellpadding="0">
          <tr > 
            <td valign="top" class="FormInnerRowRightBorder">&nbsp;<strong>Urinary 
              Function Survey</strong><br><span style="line-height:25px;">&nbsp;Q1: <asp:Label ID="ShortUrinaryQOLQ1" CssClass="blackBoldText" Runat="server" >______</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;Q2: <asp:Label ID="ShortUrinaryQOLQ2" CssClass="blackBoldText" Runat="server" >______</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;Q3: <asp:Label ID="ShortUrinaryQOLQ3" CssClass="blackBoldText" Runat="server" >______</asp:Label><br> 
              &nbsp;Total Urinary QOL Score (Q1+Q2+Q3): <asp:Label ID="ShortUrinaryQOLTotal" CssClass="blackBoldText" Runat="server" >______</asp:Label> / 15<br>
              
			  <asp:Label CssClass="blackBoldText" ID="LastUrinaryQOLScores" Runat="server" />
			  
			  &nbsp;IPSS Score: ______</span><br>
              <br>
			<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr> 
                  <td colspan="2" align="left" class="smallGrayText">Continence Codes:</td>
                </tr>
                <tr> 
                  <td class="smallGrayText">1 - </td>
                  <td class="smallGrayText">Continent (No pads)</td>
                </tr>
                <tr> 
                  <td class="smallGrayText">2 - </td>
                  <td class="smallGrayText">Mild SUI (Leaks only during heavy activity/ 1-2 pads)</td>
                </tr>
                <tr> 
                  <td class="smallGrayText">3 - </td>
                  <td class="smallGrayText">Moderate SUI (Leaks with moderate activity/ (3-4 pads)</td>
                </tr>
                <tr> 
                  <td class="smallGrayText">4 - </td>
                  <td class="smallGrayText">Severe SUI (Leaks during norm. activity, dry at night &amp; rest)</td>
                </tr>
                <tr> 
                  <td class="smallGrayText">5 - </td>
                  <td class="smallGrayText">Total incontinence (Continuous leakage of urine at rest)</td>
                </tr>
              </table>
			</td>
            <td valign="top">&nbsp;<strong>Sexual Function Survey</strong><br> 
              <span style="line-height:25px;">&nbsp;Q4: <asp:Label ID="ShortSexualQOLQ4" CssClass="blackBoldText" Runat="server" >______</asp:Label>&nbsp;&nbsp;Q5: <asp:Label ID="ShortSexualQOLQ5" CssClass="blackBoldText" Runat="server" >______</asp:Label>&nbsp;&nbsp;Q6 ______<br>
			  &nbsp;Total Sexual QOL Score (Q5+Q6): <asp:Label ID="ShortSexualQOLTotal" CssClass="blackBoldText" Runat="server" >______</asp:Label> / 12<br>
              <asp:Label  CssClass="blackBoldText"  ID="LastSexualQOLScores" Runat="server" />
			  &nbsp;% Best Erection:&nbsp;&nbsp;&nbsp;&nbsp; No Medications: ______<br>
              &nbsp;<img src="../../Images/shim.gif" border="0" width="83" height="1">&nbsp;&nbsp;&nbsp;&nbsp;Oral PDE-5 Drugs: ______</span><br>
			<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr> 
                  <td colspan="2" align="left" class="smallGrayText">Erectile Function Codes:</td>
                </tr>
                <tr> 
                  <td class="smallGrayText">1 - </td>
                  <td class="smallGrayText">Normal, full erection</td>
                </tr>
                <tr> 
                  <td class="smallGrayText">2 - </td>
                  <td class="smallGrayText">Full, but recently diminished</td>
                </tr>
                <tr> 
                  <td class="smallGrayText">3 - </td>
                  <td class="smallGrayText">Partial, but occasionally satisfactory for intercourse</td>
                </tr>
                <tr> 
                  <td class="smallGrayText">4 - </td>
                  <td class="smallGrayText">Partial, but unsatisfactory for intercourse</td>
                </tr>
                <tr> 
                  <td class="smallGrayText">5 - </td>
                  <td class="smallGrayText">Impotent</td>
                </tr>
              </table>
			  </td>
          </tr>
        </table>
		</td>
    </tr>
-->    
<tr bgcolor="#FFFFFF">
  <td height="35" class="FormOuterTableRow">&nbsp;
      <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes" />
      <span class="blackBoldText"> PFSH and ROS performed by:  ___________________________<img src="../../Images/shim.gif" border="0" width="10" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="10" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td>
</tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU03<img src="../../Images/shim.gif" border="0" width="45" height="1">U07<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U07*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            Urology Bladder New Patient<br />
          </span></td>
          <td width="50%" align="center" valign="bottom" class="blackBoldText"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
                <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
              </tr>
              <tr>
                <td align="right"><% =patientMRNLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left"><strong>
                  <% =patientMRN  %>
                  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <% =patientDOB  %>
                </td>
              </tr>
              <tr>
                <td colspan="1" align="right"><% =patientNameLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td colspan="1" align="left"><strong>
                  <% =patientLastName  %>
                  ,
                  <% =patientFirstName  %>
                  <% =patientMiddleName  %>
                </strong></td>
              </tr>
              <tr>
                <td align="right" valign="top"><% =patientAddressLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left" valign="top"><% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                </td>
              </tr>
              <tr>
                <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital 
              Signs</span></td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
          <tr> 
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">KPS:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Height:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Weight:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BSA:</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td valign="top"><span class="blackBoldText">Exam</span></td>
            <td colspan="5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="30%"><span class="smallGrayText"><strong>Clinician 
                    Performing Initial Exam:</strong></span></td>
                  <td width="12%"><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"> 
                    <strong>NP / PA</strong></span></td>
                  <td><span class="smallGrayText">Attending must repeat and document 
                    findings.&nbsp;</span></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"> 
                    <strong>Fellow</strong></span></td>
                  <td><span class="smallGrayText">Attending must repeat and document 
                    <span style="font-weight: bold; text-decoration: underline;">critical</span> 
                    findings.</span></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"> 
                    <strong>Attending</strong></span> </td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
              Symptoms</strong><strong></strong></td>
            <td  align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td   class="FormInsideTableTopCell" style="text-align:center;"><strong>Attnd<br/>Performed</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Gen</td>
            <td align="left" class="FormInnerRowBottomBorder">Well Developed / 
              Well Nourished</td>
            <td width="30" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td width="40%" rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Acute Distress</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Alert &amp; Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Eyes&nbsp;</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Scleral Icterus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> EOMI</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> PERRL</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">ENT&nbsp;</td>
            <td align="left" class="FormInnerRowBottomBorder">Mucous Membrane 
              Moist</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Head 
              &amp; Neck</td>
            <td align="left" class="FormInnerRowBottomBorder">Neck Supple and 
              Mobile</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Carotid Bruits</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Nodes</td>
            <td align="left" class="FormInnerRowBottomBorder"> Cervical</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> Supraclavicular</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Groin </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Resp.</td>
            <td align="left" class="FormInnerRowBottomBorder">Clear to Percusion<br>
              and Auscultation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">C/V</td>
            <td align="left" class="FormInnerRowBottomBorder">Regular Rate and Rhythm</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Murmurs</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="6" align="left" valign="top" class="FormInsideTableLeftCell">Abdomen</td>
            <td align="left" class="FormInnerRowBottomBorder">Soft Non-tender 
            </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="6" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Bowel Sounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Hepatosplenomegaly</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Hernia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Ascites</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Back</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Spinal Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No CVA Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="7" align="left" valign="top" class="FormInsideTableLeftCell">GU</td>
            <td align="left" class="FormInnerRowBottomBorder">Normal Penis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">Circumcised:&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Yes&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">No</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Meatus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">Lesions:&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Yes&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">No: __________________ </td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Urethral Masses/ discharge</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/ProstateImageURONVWeb.gif" width="155" height="87"></td>
		  </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Bladder Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Testes w/o Tenderness or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Variocele Present</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Prostate Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Rectal</td>
            <td align="left" class="FormInnerRowBottomBorder">Normal Rectal Tone</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Rectal Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">GYN</td>
            <td align="left" class="FormInnerRowBottomBorder">Normal Pelvic Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Cystocele</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Rectocele</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">M/S</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Clubbing or Cyanosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Pedal Pulses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Neuro</td>
            <td align="left" class="FormInnerRowBottomBorder"> Normal Motor Function</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Sensation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Rashes or Ulcers</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Nodules</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Breast</td>
            <td align="left" class="FormInnerRowBottomBorder">Normal Breast Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Other:<br></td>
            <td align="left" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU03<img src="../../Images/shim.gif" border="0" width="45" height="1">U07<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">6</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>
<div  align="left"  style="page-break-after:always;" id="LastPageInForm" runat="server" >



<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U07*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>    <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            Urology Bladder New Patient<br />
          </span></td>
          <td width="50%" align="center" valign="bottom" class="blackBoldText"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
                <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
              </tr>
              <tr>
                <td align="right"><% =patientMRNLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left"><strong>
                  <% =patientMRN  %>
                  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <% =patientDOB  %>
                </td>
              </tr>
              <tr>
                <td colspan="1" align="right"><% =patientNameLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td colspan="1" align="left"><strong>
                  <% =patientLastName  %>
                  ,
                  <% =patientFirstName  %>
                  <% =patientMiddleName  %>
                </strong></td>
              </tr>
              <tr>
                <td align="right" valign="top"><% =patientAddressLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left" valign="top"><% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                </td>
              </tr>
              <tr>
                <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="2" class="blackBoldText">Impression &amp; Plan </td>
          </tr>
          <tr> 
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Diagnoses 
              / Problem List</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Plan 
              &amp; Referrals</strong></td>
          </tr>
          <tr> 
            <td height="65" valign="top" class="FormInsideTableRegCell">1.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="65" valign="top" class="FormInsideTableRegCell">2.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="65" valign="top" class="FormInsideTableRegCell">3.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="65" valign="top" class="FormInsideTableRegCell">4.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="65" valign="top" class="FormInnerRowRightBorder">5.</td>
            <td>&nbsp;</td>
          </tr>
          <!--<tr class="eFormInnerTableRow">
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">4.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr class="eFormInnerTableRow">
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">5.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr class="eFormInnerTableRow">
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">6.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
 					<tr class="eFormInnerTableRow">
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">7.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr class="eFormInnerTableRow">
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">8.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr class="eFormInnerTableRow">
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">9.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr class="eFormInnerTableRow">
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">10.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr> -->
        </table></td>
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
      <td height="110" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Attending Addendum / Comments</span></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" valign="top" class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22"> 
              &#8805; 50% of attending time was spent in counseling <br> <img src="../../Images/shim.gif" border="0" width="1" height="15"> 
              If so, mark total attending time in minutes &amp; describe on right:<br> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="4" height="5"><img src="../../Images/shim.gif" border="0" width="1" height="1"></td>
                </tr>
                <tr> 
                  <td valign="top"><strong>&nbsp;New Visit</strong></td>
                  <td class="FormInnerRowRightBorder">&nbsp;</td>
                  <td colspan="2" valign="top"><strong>&nbsp;Office Consultation</strong></td>
                </tr>
                <tr> 
                  <td> <input type="checkbox" name="15-24 (3)2222">
                    10-19 (1) </td>
                  <td class="FormInnerRowRightBorder"> <input type="checkbox" name="25-39 (4)22">
                    45-59 (4) </td>
                  <td> <input type="checkbox" name="15-24 (3)2222">
                    15-29 (1) </td>
                  <td> <input type="checkbox" name="25-39 (4)22">
                    60-79 (4) </td>
                </tr>
                <tr> 
                  <td><input type="checkbox" name="15-24 (3)2232">
                    20-29 (2)</td>
                  <td class="FormInnerRowRightBorder"> <input type="checkbox" name="40+ (5)22">
                    60+ (5)</td>
                  <td><input type="checkbox" name="15-24 (3)2232">
                    30-39 (2)</td>
                  <td> <input type="checkbox" name="40+ (5)22">
                    80+ (5)</td>
                </tr>
                <tr> 
                  <td><input type="checkbox" name="15-24 (3)2242">
                    30-44 (3) </td>
                  <td class="FormInnerRowRightBorder">&nbsp;</td>
                  <td><input type="checkbox" name="15-24 (3)2242">
                    40-59 (3) </td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
            <td width="50%" height="100" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="1" height="11"><strong>Describe 
              Counseling or Dictate Note:</strong><br> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:6px;">
                <tr>
                  <td width="50%" align="left" valign="middle"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Risk / Benefits of Surgery</td>
                  <td width="50%" align="left" valign="middle"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Radiology Findings</td>
                </tr>
                <tr>
                  <td align="left" valign="middle" style="padding-top:5px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Pathology Findings </td>
                  <td align="left" valign="middle" style="padding-top:5px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Above Treatment Plan </td>
                </tr>
                
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td> 
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td> 
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td> 
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table width="700" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="350" height="22" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5            </td>
            <td width="350">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ 
              Resident<img src="../../Images/shim.gif" border="0" width="30" height="1">Attending</td>
          </tr>
        </table></td>
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
                  <td>I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                      <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
                <tr>
                  <td align="center"><span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU03<img src="../../Images/shim.gif" border="0" width="45" height="1">U07<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">7</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>

</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>