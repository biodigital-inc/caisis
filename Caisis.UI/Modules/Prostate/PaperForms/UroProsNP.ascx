<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.UroProsNP" CodeFile="UroProsNP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>



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
		<div  class="VerticalBarCodeDocType">*U05*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Prostate New Patient<br/></span></td>
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
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Date: <% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></td>
          </tr>
        </table>		</td>
    </tr>
	
	
		<tr>
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellpadding="1" cellspacing="0">
				<tr>
					<td colspan="2" align="left" valign="middle" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Category of Service</span></td>
				</tr>
				<tr>
					<td width="23%" valign="top" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop">&nbsp;New Patient Encounter<br />(CPT 99201-99205)</td>
					<td width="77%" valign="middle" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1">Use for patients who have not been seen by anyone in your billing group in the last 3 years <strong>AND</strong><br />
						<img src="../../Images/shim.gif" border="0" width="12" height="1"><strong>-</strong>Are self referred (includes those referred by friend or patient)<br />
						<img src="../../Images/shim.gif" border="0" width="12" height="1"><strong>-</strong>Do not have  physician asking for your advice/opinion (see PIF sheet or PAS info)<br />
						<img src="../../Images/shim.gif" border="0" width="12" height="1"><strong>-</strong>Are referred solely for management and/or treatment of aspect of care<br />					</td>
				</tr>
				<tr>
					<td valign="top" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop">&nbsp;Office Consultation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />(CPT 99241- 99245)</td>
					<td class="FormInnerRowBottomBorder">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td class="FormInnerRowBottomBorder" colspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="1">Office Consultation is requested by _________________________ MD/PA/NP for my advice &<br/><img src="../../Images/shim.gif" border="0" width="4" height="1">opinion regarding this patient’s ______________________________________________________</td>
							</tr>
							<tr>
							  <td colspan="2"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                                <tr >
                                  <td align="left" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Requesting&nbsp;M.D.:
                                    <asp:Repeater ID="ReferringMD" Runat="server" >
                                        <ItemTemplate> <%# DataBinder.Eval(Container.DataItem, "phFirstName") %> <%# DataBinder.Eval(Container.DataItem, "phLastName") %> ( <%# DataBinder.Eval(Container.DataItem, "phInstitution") %> )</ItemTemplate>
                                      <SeparatorTemplate>, </SeparatorTemplate>
                                    </asp:Repeater>
                                      <asp:Label ID="blankReferrringMD" Runat="server"></asp:Label>                                  </td>
                                </tr>
                              </table></td>
							</tr>
						</table>					</td>
					<!--<td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Office Consultation is requested by _________________________ MD/PA/NP for my advice & opinion<br />
					<img src="../../Images/shim.gif" border="0" width="4" height="1">regarding this patient’s ______________________________________________________</td>-->				
				</tr>
				<tr>
					<td valign="top" align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop">&nbsp;Established Patient Visit<br />(CPT 99212-99215)</td>
					<td><img src="../../Images/shim.gif" border="0" width="4" height="1" />Use for patients who<br />
						<img src="../../Images/shim.gif" border="0" width="12" height="1"><strong>-</strong>Are seeing you for the first time for management or treatment (Not a consult) and have been seen<br />
						<img src="../../Images/shim.gif" border="0" width="18" height="1">by someone else in your billing group in the last 3 years<br />
						<img src="../../Images/shim.gif" border="0" width="12" height="1"><strong>-</strong>Are seeing you for follow-up care/visits					</td>
				</tr>
			</table>		</td>
	</tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="left" valign="top" height="30" class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Chief 
              Complaint<br/>
              <br/><br/></td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow" height="470" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">HPI</span><br/> 
        <table cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="FormPopulatedSmallerText"><asp:Repeater ID="hpi" Runat="server" OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "patientHPI") %>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> </td>
          </tr>
        </table>        </td>
    </tr>
	<tr>
      <td class="FormOuterTableTopRow" valign="bottom"  style="padding: 2px;"><table cellspacing="0" cellpadding="0" style="width: 100%;">
          <tr>
            <td style="width: 170px; padding: 16px 0px 4px 2px; border-bottom: solid 1px #999999;">Dx Date:____________</td>
            <td style="padding: 16px 0px 4px 0px; border-bottom: solid 1px #999999;">2002 Clinical Stage: T_____<img src="../../Images/shim.gif" border="0" width="10" height="1" />N_____<img src="../../Images/shim.gif" border="0" width="10" height="1" />M_____<img src="../../Images/shim.gif" border="0" width="40" height="1" />Gleason:<img src="../../Images/shim.gif" border="0" width="105" height="1" />PreTx PSA:</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td style="padding: 16px 0px 4px 0px;">Biopsy Cores:<span style="margin-left: 20px;"># Positive: __________</span><span style="margin-left: 30px;"># Negative: __________</span></td>
          </tr>
      </table></td>
	  </tr>
    <tr style="display: none;">
      <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="26%" rowspan="3" valign="top" class="FormInsideTableTopLeftCell"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12" />Nomogram 
              Predictions </span></td>
            <td height="24" colspan="2" class="FormInsideTableTopCell" style="border-right: none;">PFP PreRP 10 Yr:</td>
            <td class="FormInsideTableTopCell" style="font-weight: bold;"><asp:Label ID="preRP10Nomo" Runat="server" />    
              &nbsp;</td>
            <td class="FormInsideTableTopCell" style="border-right: none;">PreBrachy 10 Yr:</td>
            <td class="FormInsideTableTopCell" style="font-weight: bold;"><asp:Label ID="preBrachyNomo" Runat="server" />    
              &nbsp;</td>
            <td colspan="2" class="FormInsideTableTopCell" style="border-right: none;">PFP PostRP 10 Yr:</td>
            <td class="FormInsideTableTopCell" style="font-weight: bold;"><asp:Label ID="postRP10yrNomo" Runat="server" />    
              &nbsp;</td>
          </tr>
          <tr>
            <td height="24" colspan="2" class="FormInsideTableRegCell" style="border-right: none;">PCSS PreRP 15 Yr:</td>
            <td class="FormInsideTableRegCell" style="font-weight: bold;"><asp:Label ID="PCSS15PreOpNomo" Runat="server" />    
              &nbsp;</td>
            <td class="FormInsideTableRegCell" style="border-right: none;">PreXRT 10 Yr:</td>
            <td class="FormInsideTableRegCell" style="font-weight: bold;"><asp:Label ID="preXRTNomo" Runat="server" />    
              &nbsp;</td>
            <td colspan="2" class="FormInsideTableRegCell" style="border-right: none;">PCSS PostRP 15 Yr:</td>
            <td class="FormInsideTableRegCell" style="font-weight: bold;"><asp:Label ID="PCSS15PostOpNomo" Runat="server" />    
              &nbsp;</td>
          </tr>
          <tr>
            <td width="9%" height="24" class="FormInsideTableRegCell" style="border-right: none;">OCD:</td>
            <td width="8%" class="FormInsideTableRegCell">&nbsp;</td>
            <td width="9%" class="FormInsideTableRegCell" style="border-right: none;">ECE:</td>
            <td width="14%" class="FormInsideTableRegCell">&nbsp;</td>
            <td width="9%" class="FormInsideTableRegCell" style="border-right: none;">SVI:</td>
            <td width="8%" class="FormInsideTableRegCell">&nbsp;</td>
            <td width="9%" class="FormInsideTableRegCell" style="border-right: none;">LNI:</td>
            <td width="8%" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
      </table></td>
    </tr>

    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU01<img src="../../Images/shim.gif" border="0" width="45" height="1">U05<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>




<div align="left" style="page-break-after:always">


<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U05*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr bgcolor="#FFFFFF" > 
      <td class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
           
            <tr > 
              <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
                Urology Prostate New Patient</span>              </td>
              <td width="50%" align="center" valign="bottom" class="blackBoldText">
              
				 <table width="340" border="0" cellspacing="1" cellpadding="0" >
					<tr> 
						<td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
						<td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
					</tr>
					<tr> 
						<td align="right"><% =patientMRNLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left"><strong><% =patientMRN  %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% =patientDOB  %></td>
					</tr>
					<tr> 
						<td colspan="1" align="right"><% =patientNameLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td colspan="1" align="left"><strong><% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
					</tr>
					<tr> 
						<td align="right" valign="top"><% =patientAddressLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left" valign="top"><% =patientAddress1  %><% =patientAddress2  %><% =patientCity  %> <% =patientState  %> <% =patientPostalCode  %></td>
					</tr>
					 <tr> 
						<td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
					</tr>
					<tr> 
						<td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
					</tr>
				</table>              </td>
            </tr>
            </table></td>
    </tr>
    <tr> 
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td rowspan="2" width="50%" valign="top" style="padding-top: 1px; border-right: solid 1px #000000;">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="5"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Radiation Therapy</span></td>
                </tr>
                <tr class="eFormInnerTableRow">
                  <td width="20%" align="center" class="FormInsideTableTopLeftCell">Start</td>
                  <td width="20%" align="center" class="FormInsideTableTopCell">Stop</td>
                  <td width="20%" align="center" class="FormInsideTableTopCell">Target</td>
                  <td width="20%" align="center" class="FormInsideTableTopCell">Total Dose</td>
                  <td width="20%" align="center" class="FormInsideTableTopCell">Notes</td>
                </tr>
                <asp:Repeater ID="XRT" Runat="server">
                  <ItemTemplate>
                    <tr>
                      <td height="20" class="FormInsideTableLeftCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></strong></td>
                      <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText") %></strong></td>
                      <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxType") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %></strong></td>
                      <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %></strong></td>
                      <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxNotes") %></strong></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
            </table>
			</td>
            <td valign="top" width="50%"></td>
          </tr>
          <tr>
            <td style="vertical-align: top;"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="4"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Hormone Therapy</span></td>
                </tr>
                <tr>
                  <td height="18" colspan="1" align="center" class="FormInsideTableTopLeftCell">Start Date</td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">TX<br/>
                      <img src="../../Images/shim.gif" border="0" width="90" height="1" /></td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">Notes (Protocol #)</td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>
                <tr>
                  <td height="20" class="FormInsideTableLeftCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="20" class="FormInsideTableLeftCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="20" class="FormInsideTableLeftCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    </tr>
	
		<tr> 
		<td width="650" class="FormOuterTableRow" height="100" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">NKA&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Repeater ID="allergies" Runat="server">
			<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Allergen") %> (<%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %>)</ItemTemplate>
			<SeparatorTemplate>,&nbsp;&nbsp;</SeparatorTemplate>
		  </asp:Repeater>        </td>
	</tr>
	<tr>
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="left" valign="top" height="90"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span  class="blackBoldText">Medical &amp; Surgical History / Comorbidities</span><br/> <img src="../../Images/shim.gif" border="0" width="1" height="14"> 
              <asp:Repeater ID="comorbidities" Runat="server"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
                  - <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>
                  </strong> </ItemTemplate>
                <SeparatorTemplate><br/>
                  &nbsp;</SeparatorTemplate>
              </asp:Repeater> </td>
            <td width="47%" align="right" valign="middle"> 
				<table border="0" width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="50%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Cor. Artery Disease / MI</td>
						<td width="50%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Pulm. Disease / Asthma</td>
					</tr>
					<tr>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Other Cardiac: __________</td>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Diabetes (IDDM/NIDDM)</td>
					</tr>
					<tr>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Hypertension</td>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Hypercholesterolemia</td>
					</tr>
					<tr>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">CVA</td>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Depression</td>
					</tr>
					<tr>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Thrombo. Events / DVT</td>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Back Pain / DJD</td>
					</tr>
				</table>			</td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr valign="top"> 
            <td width="49%" class="FormInnerRowRightBorder"><span class="blackBoldText">Family History:</span><img src="../../Images/shim.gif" border="0" width="50" height="1"><input type="checkbox" name="famHxProstateCancerYes2" runat="server" ID="famHxProstateCancerYes2"/>No known family history of ca<br/> 
			  <table width="98%" border="0" cellspacing="0" cellpadding="0" id="BlankFamilyHistoryTable" runat="server">
				<tr> 
				  <td><img src="../../Images/shim.gif" border="0" width="72" height="1"></td>
				  <td><img src="../../Images/shim.gif" border="0" width="25" height="1"></td>
				  <td><img src="../../Images/shim.gif" border="0" width="25" height="1"></td>
				  <td><img src="../../Images/shim.gif" border="0" width="40" height="1"></td>
				  <td><img src="../../Images/shim.gif" border="0" width="150" height="1"></td>
				</tr>
				<tr> 
				  <td>&nbsp;</td>
				  <td align="center">Y</td>
				  <td align="center">N</td>
				  <td>&nbsp;</td>
				  <td>&nbsp;</td>
				</tr>
				<tr> 
				  <td>Prostate Ca</td>
				  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
				  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
				  <td align="right">If Y:&nbsp;</td>
				  <td>Num. 1&deg; relatives:&nbsp;&nbsp;_______</td>
				</tr>
				<tr> 
				  <td colspan="3">&nbsp;</td>
				  <td>&nbsp;</td>
				  <td>Num. other relatives:&nbsp;_______</td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr> 
				  <td colspan="2">Side of Family</td>
				  <td colspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;Maternal<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;Paternal</td>
				</tr>
				<tr> 
				  <td><img src="../../Images/shim.gif" border="0" width="10" height="15"></td>
				  <td align="center" valign="bottom">Y</td>
				  <td align="center" valign="bottom">N</td>
				  <td>&nbsp;</td>
				  <td>&nbsp;</td>
				</tr>
				<tr valign="top"> 
				  <td>Other Ca</td>
				  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
				  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
				  <td align="right">List:&nbsp;</td>
				  <td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Breast</td>
							<td align="left"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Testis</td>
						</tr>
						<tr>
							<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Bladder</td>
							<td align="left" valign="top" rowspan="2"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Other:</td>
						</tr>
						<tr>
							<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Kidney</td>
						</tr>
					</table>				  </td>
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
                        <td>Other</td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                    </table>					</td>
                </tr>
              </table>
              <br/> <asp:Repeater ID="familyHistory" Runat="server" OnItemCreated="FamilyHistoryItemCreated"> 
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "FamMemNum") %>
                  <%# DataBinder.Eval(Container.DataItem, "FamMemRelation") %>
                  <asp:Label ID="FamMemSide" Runat="server">( 
                    <%# DataBinder.Eval(Container.DataItem, "FamMemSide") %>
                    )</asp:Label>
                  </strong> 
                  <asp:Label ID="FamMemDiagnosis" Runat="server" >with 
                    <%# DataBinder.Eval(Container.DataItem, "FamMemDiagnosis") %>                  </asp:Label>
                  <br/>
                </ItemTemplate>
              </asp:Repeater>			</td>
            <td width="51%"><p><span class="blackBoldText">Social History:</span><br/>
                <img src="../../Images/shim.gif" width="5" height="9" hspace="0" vspace="0" border="0"><br/>
                Occupation: 
                <asp:Label ID="socHxOccupation" Runat="server" /><br/>
                <img src="../../Images/shim.gif" width="5" height="9" hspace="0" vspace="0" border="0"><br/>
                Marital Status: 
                <asp:Label ID="socHxMaritalStatus" Runat="server" /><img src="../../Images/shim.gif" border="0" width="70" height="1">Children: 
                <asp:Label ID="socHxChildren" Runat="server" /><br/>
                <img src="../../Images/shim.gif" border="0" width="1" height="8"><br/>
                Tobacco Use: &nbsp; 
                <input type="checkbox" name="Digitized222222">
                None <br/>
                <img src="../../Images/shim.gif" border="0" width="73" height="8"> 
                <asp:Label ID="socHxTobaccoType" Runat="server"> 
                  <input type="checkbox" name="Digitized2222">
                  Cigarettes <img src="../../Images/shim.gif" border="0" width="10" height="8"> 
                  <input type="checkbox" name="Digitized22222">
                  Cigar<img src="../../Images/shim.gif" border="0" width="10" height="1"> 
                  <input type="checkbox" name="Digitized22223">
                  Pipe</asp:Label>
                <br/>
                <img src="../../Images/shim.gif" border="0" width="73" height="1"> 
                <input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" NAME="socHxTobaccoPacksPerDayCheckBox"/>
                <asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label>
                packs / day for 
                <asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label>
                years<br/>
                <br/>
                <img src="../../Images/shim.gif" border="0" width="73" height="1"> 
                <input type="checkbox" id="socHxTobaccoQuitYearCheckbox" runat="server" NAME="socHxTobaccoQuitYearCheckbox"/>
                Quit Year: 
                <asp:Label ID="socHxTobaccoQuitYear" Runat="server">______ </asp:Label>
                <br/>
                <br/>
                Alcohol Use: 
                <asp:Label ID="socHxAlcohol" Runat="server" /><br/>
                <br/>
                Carcinogen Exposure: 
                <asp:Label ID="socHxCarcinogen" Runat="server" /><br/>
              </p></td>
          </tr>
        </table>		</td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table width="100%" border="0" cellpadding="2" cellspacing="0">
          <tr align="left" valign="top">
            <td colspan="3" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Health Maintenance</span></td>
          </tr>
          <tr>
            <td width="15%" align="center" class="FormInsideTableTopLeftCell">Diagnostic Test</td>
            <td width="15%" align="center" class="FormInsideTableTopCell">Date</td>
            <td width="70%" align="center" class="FormInsideTableTopCell">Results</td>
          </tr>
          <tr>
            <td height="25" align="center" class="FormInsideTableLeftCell">Last Colonoscopy</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          
          
          <tr>
            <td height="25" align="center" class="FormInsideTableLeftCell">Last Stress Test</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
      </table></td>
    </tr>
 
    <tr bgcolor="#FFFFFF">
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU01<img src="../../Images/shim.gif" border="0" width="45" height="1">U05<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>



<div align="left" style="page-break-after:always">


<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U05*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr bgcolor="#FFFFFF" > 
      <td class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
           
            <tr > 
              <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
                Urology Prostate New Patient</span>
              </td>
              <td width="50%" align="center" valign="bottom" class="blackBoldText">
              
				 <table width="340" border="0" cellspacing="1" cellpadding="0" >
					<tr> 
						<td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
						<td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
					</tr>
					<tr> 
						<td align="right"><% =patientMRNLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left"><strong><% =patientMRN  %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% =patientDOB  %></td>
					</tr>
					<tr> 
						<td colspan="1" align="right"><% =patientNameLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td colspan="1" align="left"><strong><% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
					</tr>
					<tr> 
						<td align="right" valign="top"><% =patientAddressLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left" valign="top"><% =patientAddress1  %><% =patientAddress2  %><% =patientCity  %> <% =patientState  %> <% =patientPostalCode  %></td>
					</tr>
					 <tr> 
						<td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
					</tr>
					<tr> 
						<td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
					</tr>
				</table>
              
              </td>
            </tr>
            </table></td>
    </tr>
    <tr> 
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
      
      
      
      <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td colspan="2" valign="top" class="blackBoldText"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Biochemical 
              Markers / Lab Tests</span> </td>
          </tr>
          <tr > 
            <td valign="top" class="FormInnerRowRightBorder"> 
			    <table width="100%" border="0" cellpadding="1" cellspacing="0" class="FormInnerRowRightBorder">
                <tr > 
                  <td width="100" align="center" valign="middle" class="FormInsideTableTopCell">Date 
                    <br/>
                    (mm/dd/yyyy)</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Data<br/>
                    Source</td>
                </tr>
                
              <asp:Repeater ID="labTests" Runat="server">
				<ItemTemplate>
                <tr> 
                  <td height="17" align="center" class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %></td>
                  <td class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "LabTest") %></td>
                  <td class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "LabResult") %></td>
                      <td class="FormInsideTableRegCell">
                        <%# DataBinder.Eval(Container.DataItem, "LabQuality") %>
                      </td>
                </tr>	
				</ItemTemplate>
			  </asp:Repeater>
               </table>
			</td>
            <td valign="top" class="blackBoldText"><table border="0" width="100%" cellpadding="1" cellspacing="0">
                <tr > 
                  <td width="100" align="center" valign="middle" class="FormInsideTableTopCell">Date 
                    <br/>
                    (mm/dd/yyyy)</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Data<br/>
                    Source</td>
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
              </table></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span><span><img src="../../Images/shim.gif" border="0" width="10" height="1"> 
        <input type="checkbox" name="Films Reviewed">
        Films Reviewed<img src="../../Images/shim.gif" border="0" width="10" height="1"> 
        <input type="checkbox" name="Compared to Past">
        Compared to Past<img src="../../Images/shim.gif" border="0" width="10" height="1"> 
        <input type="checkbox" name="Reviewed with Radiologist">
        Reviewed with Radiologist<img src="../../Images/shim.gif" border="0" width="10" height="1"> 
        <input type="checkbox" name="Digitized">
        Digitized</span> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="35%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td width="35%" align="center" valign="middle" class="FormInsideTableTopCell">Comments</td>
          </tr>
         
          <asp:Repeater ID="images" Runat="server">
			<ItemTemplate>
          <tr> 
            <td height="24" align="center" class="FormInsideTableRegCell">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
            <td class="FormInsideTableRegCell">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
            <td class="FormInsideTableRegCell">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxResult") %></td>
            <td class="FormInnerRowBottomBorder">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
          </tr>
			</ItemTemplate>
			</asp:Repeater>
                <tr> 
                  <td height="17" align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
                  <td class="FormInsideTableRegCell">&nbsp;MRI</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                    
            <td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="5" height="15">MRI 
              Ureth. Length:________________<br/>
              <img src="../../Images/shim.gif" border="0" width="5" height="15">MRI 
              Veins (0-4+):_________________<br/>
              <img src="../../Images/shim.gif" border="0" width="5" height="15">Prostate 
              Volume (cc):_____________<img src="../../Images/shim.gif" border="0" width="25" height="1"></td>
                </tr>
          <tr > 
            <td height="17" colspan="4"><img src="../../Images/shim.gif" border="0" width="4" height="0">Additional 
              Comments:<br/> <br/>
              <img src="../../Images/shim.gif" border="0" width="4" height="0"></td>
          </tr>
        </table>
       </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Previous Biopsies&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <input type="checkbox" name="PA222" value="Yes"><strong>Check if None</strong><br/> 
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Result</td>
            <td width="60%" align="center" valign="middle" class="FormInsideTableTopCell">Comments</td>
          </tr>
          <tr> 
            <td height="24" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Diagnostic 
        Biopsy</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date: ____/____/_____&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data 
        Source:<span> 
        <input name="DateLastGnRH22" type="checkbox" id="DateLastGnRH222" value="yes">
        Outside&nbsp;&nbsp; 
        <input name="DateLastGnRH32" type="checkbox" id="DateLastGnRH323" value="yes">
        MSK Rev &nbsp; 
        <input name="DateLastGnRH322" type="checkbox" id="DateLastGnRH3222" value="yes">
        Done at MSK</span><br/> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="center" valign="middle" class="FormInsideTableTopCell">Result</td>
            <td align="center" valign="middle" class="FormInsideTableTopCell">Gleason Grade </td>
            <td align="center" valign="middle" class="FormInsideTableTopCell">Cores</td>
          </tr>
          <tr > 
            <td height="16" align="center" valign="middle" class="FormInnerRowRightBorder">&nbsp;</td>
            <td align="center" valign="middle" class="FormInnerRowRightBorder"> 
              <input type="text" name="BxGG1" size="2" maxlength="48" class="inputFieldFlat"> 
              &nbsp;<strong>+</strong>&nbsp; <input type="text" name="BxGG2" size="2" maxlength="48" class="inputFieldFlat"> 
              &nbsp;<strong>=</strong>&nbsp; <input type="text" name="BxGGS" size="2" maxlength="48" class="inputFieldFlat"></td>
            <td align="center" valign="middle">&nbsp;&nbsp;Positive: 
              <input type="text" name="BxPosCores" size="3" maxlength="48" class="inputFieldFlat"> 
              &nbsp;&nbsp;Total: 
              <input type="text" name="BxNumCores" size="3" maxlength="48" class="inputFieldFlat"></td>
          </tr>
          <tr> 
            <td colspan="6"><table align="center" style="width: 100%;" cellpadding="0" cellspacing="0" style="border-top: solid 1px #999999;">
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Side</td>
                  <td align="center" class="FormInsideTableRegCell">Laterality</td>
                  <td align="center" class="FormInsideTableRegCell">Level</td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">Pos Cores</td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">Total Cores </td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">GG1</td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">GG2</td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">GGS</td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">%Ca</td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">mmCa</td>
                  <td width="7%" align="center" class="FormInsideTableRegCell">mmCore</td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">PNI</td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">ASAP</td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">HG PIN </td>
                  <td width="15%" align="center" class="FormInsideTableRegCell">Biopsy Notes </td>
                </tr>
                <tr> 
                  <td height="18" align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">A</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="18" align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">M</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="18" align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">B</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">A</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">M</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">B</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">TZ</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr><tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">A</td> 
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">M</td> 
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">B</td> 
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">A</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">M</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td height="18" align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">B</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="18" align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">TZ</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr><tr> 
                  <td height="18" align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table>
             </td>
          </tr>
        </table>
       </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU01<img src="../../Images/shim.gif" border="0" width="45" height="1">U05<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>
<div align="left" style="page-break-after:always">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U05*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
           
            <tr> 
              <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
                Urology Prostate New Patient</span></td>
              <td width="50%" align="center" valign="bottom" class="blackBoldText">
              <table width="340" border="0" cellspacing="1" cellpadding="0">
					<tr> 
						<td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
						<td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
					</tr>
					<tr> 
						<td align="right"><% =patientMRNLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left"><strong><% =patientMRN  %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% =patientDOB  %></td>
					</tr>
					<tr> 
						<td colspan="1" align="right"><% =patientNameLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td colspan="1" align="left"><strong><% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
					</tr>
					<tr> 
						<td align="right" valign="top"><% =patientAddressLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left" valign="top"><% =patientAddress1  %><% =patientAddress2  %><% =patientCity  %> <% =patientState  %> <% =patientPostalCode  %></td>
					</tr>
					 <tr> 
						<td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
					</tr>
					<tr> 
						<td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
					</tr>
				</table>              </td>
            </tr>
          </table>        </td>
    </tr>
    <tr> 
      <td width="650" height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="6" align="left" valign="top" ><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Review 
              of Systems</span><span class="smallGrayText">&nbsp;&nbsp;<span class="smallGrayText">Clinician 
              Performing Review:<span class="smallGrayText"> &nbsp;&nbsp; 
              <input type="checkbox" name="PA22" value="Yes">
              RN&nbsp;&nbsp;&nbsp; </span> 
              <input type="checkbox" name="PA2" value="Yes">
              PA/NP&nbsp;&nbsp;&nbsp; 
              <input type="checkbox" name="Fellow2" value="Yes">
              Fellow&nbsp;&nbsp;&nbsp; 
              <input type="checkbox" name="Attending2" value="Yes">
              Attending</span></span></td>
          </tr>
          <tr> 
            <td align="center" class="FormInsideTableTopCell" ><strong> System</strong></td>
            <td align="center" class="FormInsideTableTopCell" ><strong>Symptom</strong></td>
            <td align="center" class="FormInsideTableTopCell" ><strong>Not Present</strong></td>
            <td align="center" class="FormInsideTableTopCell" ><strong>Present</strong></td>
            <td align="center" class="FormInsideTableTopCell" ><strong>Disease 
              Related</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell" ><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">General</td>
            <td align="left" class="FormInsideTableRegCell" >Fever</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Fatigue</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
		  <tr> 
            <td align="left" class="FormInsideTableRegCell">Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro</td>
            <td align="left" class="FormInsideTableRegCell" >Headaches</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Focal Weakness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Eyes</td>
            <td align="left" class="FormInsideTableRegCell" >Visual Problems</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">CV</td>
            <td align="left" class="FormInsideTableRegCell" >Angina</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Palpitations</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Respiratory</td>
            <td align="left" class="FormInsideTableRegCell" >Cough</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Shortness of Breath</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hemoptysis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">GI</td>
            <td align="left" class="FormInsideTableRegCell" >Nausea</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="4" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Abdominal Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Rectal Bleeding</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="9" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">GU</td>
            <td align="left" class="FormInsideTableRegCell" >Dysuria</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="8" valign="top" class="FormInnerRowBottomBorder" ><strong>&nbsp;Prostate QOL Survey</strong><br />
                <table width="100%" border="0" cellspacing="0" cellpadding="4" style="border-bottom: solid 1px #999999;">
                  <tr>
                    <td colspan="2">              <span class="blackBoldTextSmall" style="color: #000000;">Sexual</span><br />
				<span class="blackBoldTextSmall" style="font-weight: normal; color: #000000;">Q1:_____&nbsp;Q2:<span class="blackBoldTextSmall" style="font-weight: normal; color: #000000;">_____</span>&nbsp;&nbsp;Q3:<span class="blackBoldTextSmall" style="font-weight: normal; color: #000000;">_____</span>&nbsp;&nbsp;Q4:<span class="blackBoldTextSmall" style="font-weight: normal; color: #000000;">_____</span>&nbsp;Q5:<span class="blackBoldTextSmall" style="font-weight: normal; color: #000000;">_____</span>&nbsp;&nbsp;Q6:<span class="blackBoldTextSmall" style="font-weight: normal; color: #000000;">_____</span>&nbsp;&nbsp;Q7:<span class="blackBoldTextSmall" style="font-weight: normal; color: #000000;">_____</span></span></td>
                  </tr>
                  <tr>
                    <td colspan="2">              <span class="blackBoldTextSmall" style="color: #000000;">Urinary</span><br />
				<span class="blackBoldTextSmall" style="font-weight: normal; color: #000000;">Q1:_____&nbsp;Q2:_____&nbsp;&nbsp;Q3:_____&nbsp;&nbsp;Q4:_____&nbsp;Q5:_____</span></td>
                  </tr>
                  <tr>
                    <td width="34%"><span class="blackBoldTextSmall" style="color: #000000;">Bowel</span><br />
                      <span class="blackBoldTextSmall" style="font-weight: normal; color: #000000;">Q1:_____&nbsp;Q2:_____</span></td>
                    <td><span class="blackBoldTextSmall" style="color: #000000;">General</span><br />
                      <span class="blackBoldTextSmall" style="font-weight: normal; color: #000000;">Q1:_____</span></td>
                  </tr>
                </table>
                <br />
                <strong>Urinary Function</strong><br/>
				
				<!--
				&nbsp;Q1:
<asp:Label ID="ShortUrinaryQOLQ1" CssClass="blackBoldText" Runat="server" >______</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;Q2:
<asp:Label ID="ShortUrinaryQOLQ2" CssClass="blackBoldText" Runat="server" >______</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;Q3:
<asp:Label ID="ShortUrinaryQOLQ3" CssClass="blackBoldText" Runat="server" >______</asp:Label>
<br/>                <img src="../../Images/shim.gif" border="0" width="1" height="15">Total Urinary QOL Score (Q1+Q2+Q3): 
                <asp:Label ID="ShortUrinaryQOLTotal" CssClass="blackBoldText" Runat="server">______</asp:Label> 
                / 15<br/> -->
                <img src="../../Images/shim.gif" border="0" width="1" height="15">
                <asp:Label ID="LastUrinaryQOLScores" Runat="server" />                
                IPSS Score: ______<br/>                <img src="../../Images/shim.gif" border="0" width="1" height="15">IPSS QOL Score: ______<br/>                <img src="../../Images/shim.gif" border="0" width="1" height="15">Continence (1-5): ______
                <br/>
                <br/>                
                &nbsp;<strong>Sexual Function</strong><br/>
				<!--
                &nbsp;Q4:
<asp:Label ID="ShortSexualQOLQ4" CssClass="blackBoldText" Runat="server" >______</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;Q5:
<asp:Label ID="ShortSexualQOLQ5" CssClass="blackBoldText" Runat="server" >______</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;Q6:
<asp:Label ID="ShortSexualQOLQ6" CssClass="blackBoldText" Runat="server" >______</asp:Label>
<br/>                <img src="../../Images/shim.gif" border="0" width="1" height="15">Total Sexual QOL Score (Q5+Q6): 
                <asp:Label ID="ShortSexualQOLTotal" CssClass="blackBoldText" Runat="server" >______</asp:Label> 
                / 12<br/>-->
				
                <asp:Label ID="LastSexualQOLScores" Runat="server" />                                <img src="../../Images/shim.gif" border="0" width="1" height="15">Erectile 
                Function (1-5): ______<br/>                <img src="../../Images/shim.gif" border="0" width="1" height="15">% Best Erection: No Medications: ______<br/>                <img src="../../Images/shim.gif" border="0" width="83" height="15">Oral PDE-5 Drugs: ______</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Nocturia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Slow Stream</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Infection</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Peyronies</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Erectile Dysfunction</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td valign="top" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">MS</td>
            <td align="left" class="FormInsideTableRegCell" >Joint Pain</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Psych</td>
            <td align="left" class="FormInsideTableRegCell" >Anxiety/Depression</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Heme</td>
            <td align="left" class="FormInsideTableRegCell" >Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin</td>
            <td align="left" class="FormInsideTableRegCell" >Rash</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Endo</td>
            <td align="left" class="FormInsideTableRegCell" >Heat/cold Intolerance</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Thirst</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hot Flashes</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Other</td>
            <td align="left" class="FormInsideTableRegCell" >&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
        </table>       </td>
    </tr>
    <tr> 
      <td height="30" class="FormOuterTableRow"> <table width="650" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td valign="top" class="FormInnerRowRightBorder"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr> 
                  <td colspan="2" align="left" class="smallGrayText">Continence Codes:</td>
                </tr>
                <tr valign="top"> 
                  <td class="smallGrayText">1 - </td>
                  <td class="smallGrayText">Continent (No pads)</td>
                </tr>
                <tr valign="top"> 
                  <td class="smallGrayText">2 - </td>
                  <td class="smallGrayText">Mild SUI (Leaks only during heavy 
                    activity/ 1-2 pads)</td>
                </tr>
                <tr valign="top"> 
                  <td class="smallGrayText">3 - </td>
                  <td class="smallGrayText">Moderate SUI (Leaks with moderate 
                    activity/ 3-4 pads)</td>
                </tr>
                <tr valign="top"> 
                  <td class="smallGrayText">4 - </td>
                  <td class="smallGrayText">Severe SUI (Leaks during norm. activity, 
                    dry at night &amp; rest)</td>
                </tr>
                <tr valign="top"> 
                  <td class="smallGrayText">5 - </td>
                  <td class="smallGrayText">Total incontinence (Continuous leakage 
                    of urine at rest)</td>
                </tr>
              </table>             </td>
            <td valign="top">
				<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr> 
                  <td colspan="2" align="left" class="smallGrayText">Sexual Function Codes:</td>
                </tr>
                <tr valign="top"> 
                  <td class="smallGrayText">1 - </td>
                  <td class="smallGrayText">Normal, full erections</td>
                </tr>
                <tr valign="top"> 
                  <td class="smallGrayText">2 - </td>
                  <td class="smallGrayText">Full, but recently diminished</td>
                </tr>
                <tr valign="top"> 
                  <td class="smallGrayText">3 - </td>
                  <td class="smallGrayText">Partial, satisfactory for intercourse</td>
                </tr>
                <tr valign="top"> 
                  <td class="smallGrayText">4 - </td>
                  <td class="smallGrayText">Partial, unsatisfactory for intercourse</td>
                </tr>
                <tr valign="top"> 
                  <td class="smallGrayText">5 - </td>
                  <td class="smallGrayText">Impotent</td>
                </tr>
              </table>             </td>
          </tr>
        </table>       </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="44" valign="bottom" class="FormOuterTableRow">&nbsp;
          <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes" />
          <span class="blackBoldText"> PFSH and ROS performed by:  _____________________________<img src="../../Images/shim.gif" border="0" width="40" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="15" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td>
    </tr>
    <tr>
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU01<img src="../../Images/shim.gif" border="0" width="45" height="1">U05<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>
<div align="left" style="page-break-after:always">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U05*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
              Urology Prostate New Patient</span></td>
            <td width="50%" align="center" valign="bottom" class="blackBoldText"> 
              <table width="340" border="0" cellspacing="1" cellpadding="0">
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
                    <% =patientDOB  %>
                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %>
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
                    <% =patientPostalCode  %>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="650" height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital Signs</span></td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
          <tr> 
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">KPS:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Height:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Weight:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BSA:</td>
          </tr>
        </table>
       </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="11%" valign="top"><span class="blackBoldText">Exam</span></td>
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
                    <span style="font-weight: bold; text-decoration: underline;">critical</span> findings.</span></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"> 
                    <strong>Attending</strong></span> </td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr > 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
              Findings</strong><strong></strong></td>
            <td width="6%" align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td width="6%" align="center" class="FormInsideTableTopCell"><strong>Attnd<br/>
              Performed</strong></td>
            <td width="41%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Gen</td>
            <td width="30%" align="left" class="FormInnerRowBottomBorder">Well 
              Developed / Well Nourished</td>
            <td width="6%" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td width="240" rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Acute Distress</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Alert &amp; Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Eyes&nbsp;</td>
            <td align="left" class="FormInnerRowBottomBorder">No Scleral Icterus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">ENT&nbsp;</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Mucositis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Mucous Membrane 
              Moist</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Thrush</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Nodes</td>
            <td align="left" class="FormInnerRowBottomBorder"> Supraclavicular</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> Axillary</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp.</td>
            <td align="left" class="FormInnerRowBottomBorder">Clear to Percusion<br/>
              and Auscultation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">C/V</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Regular Rate &amp; 
              Rhythm</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Murmurs</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Abdomen</td>
            <td align="left" class="FormInnerRowBottomBorder">Soft Non-tender</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Bowel Sounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Hepatosplenomegaly</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Ascites</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Hernia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Back</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Spinal Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No CVA Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="6" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">GU<br/> 
              <img src="../../Images/shim.gif" border="0" width="4" height="0">Male</td>
            <td align="left" class="FormInnerRowBottomBorder">Testes w/o Tenderness 
              or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Palpable Penile Plaque or Fibrosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr>
            <td align="left" class="FormInnerRowBottomBorder">Normal Scrotum / 
              Testis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Phallus / 
              Urethra </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Digital Rectal Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td colspan="5" align="left" class="FormInnerRowBottomBorder"><span class="blackBoldText">Rectal Exam</span><br/>
			  <table width="100%" border="0" cellspacing="0" cellpadding="4">
                <tr valign="top"> 
                  <td> <table width="210" border="0" cellspacing="0" cellpadding="1">
                      <tr align="center"> 
                        <td class="FormInsideTableTopLeftCell">Side</td>
                        <td class="FormInsideTableTopCell">Level</td>
                        <td class="FormInsideTableTopCell">Cancer (1-5)</td>
                        <td class="FormInsideTableTopCell">ECE (1-5)</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">SV</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">B</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">M</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">A</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">SV</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">B</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">M</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">A</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                    </table>
                  </td>
                  <td> Prostate Weight:<br/>
                    _________ g<br/> <br/>
                    Largest Induration<br/>(Length x Width):<br/> <img src="../../Images/shim.gif" border="0" width="1" height="18">____cm&nbsp;&nbsp;x&nbsp;&nbsp;____cm<br/></td>
                  <td><strong>2002 Clinical Stage: T____</strong>
				  	  <strong style="margin-left: 10px;">N____</strong>
					  <strong style="margin-left: 10px;">M____</strong><br/><img src="../../Images/ProstateImageURONVWeb.gif" width="251" height="125" style="margin-top:10px;"></td>
                </tr>
                <tr valign="top"> 
                  <td colspan="3"><strong>CODES</strong><span class="smallGrayText">&nbsp;&nbsp;&nbsp;&nbsp;Cancer: 
                    &nbsp;1. Definitely No Ca&nbsp;&nbsp;&nbsp;&nbsp;2. Probably No Ca&nbsp;&nbsp;&nbsp;&nbsp;3. 
                    Possible Ca&nbsp;&nbsp;&nbsp;&nbsp;4. Probably Ca&nbsp;&nbsp;&nbsp;&nbsp;5. 
                    Definitely Ca<br/><img src="../../Images/shim.gif" border="0" width="54" height="1"> 
                    ECE: &nbsp;&nbsp;1. Definitely No ECE&nbsp;&nbsp;&nbsp;&nbsp;2. Probably No ECE&nbsp;&nbsp;&nbsp;&nbsp;3. 
                    Possible ECE&nbsp;&nbsp;&nbsp;&nbsp;4. Probably ECE&nbsp;&nbsp;&nbsp;&nbsp;5. 
                    Definitely ECE</span></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">M/S</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Clubbing or 
              Cyanosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Cord</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Leg Swelling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro</td>
            <td align="left" class="FormInnerRowBottomBorder"> Normal Motor Function</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Sensation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Cran Nerve II-XII 
              Intact</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Rash or Ulcers</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Nodules</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td height="16" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other<br/></td>
            <td colspan="5" align="left">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU01<img src="../../Images/shim.gif" border="0" width="45" height="1">U05<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>
<div   align="left"  style="page-break-after:always;" id="LastPageInForm" runat="server">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U05*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td bgcolor="#FFFFFF" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
           
            <tr> 
              <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
                Urology Prostate New Patient</span><br/></td>
              <td width="50%" align="center" valign="bottom" class="blackBoldText">
				<table width="340" border="0" cellspacing="1" cellpadding="0">
					<tr> 
						<td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
						<td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
					</tr>
					<tr> 
						<td align="right"><% =patientMRNLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left"><strong><% =patientMRN  %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% =patientDOB  %></td>
					</tr>
					<tr> 
						<td colspan="1" align="right"><% =patientNameLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td colspan="1" align="left"><strong><% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
					</tr>
					<tr> 
						<td align="right" valign="top"><% =patientAddressLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left" valign="top"><% =patientAddress1  %><% =patientAddress2  %><% =patientCity  %> <% =patientState  %> <% =patientPostalCode  %></td>
					</tr>
					 <tr> 
						<td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
					</tr>
					<tr> 
						<td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
					</tr>
				</table>              </td>
            </tr>
          </table>        </td>
    </tr>
    <tr> 
      <td height="20" bgcolor="#FFFFFF" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" class="pageWidth" cellpadding="4" cellspacing="0">
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
            <td height="64" valign="top" class="FormInsideTableRegCell">1.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="64" valign="top" class="FormInsideTableRegCell">2.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="64" valign="top" class="FormInsideTableRegCell">3.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="64" valign="top" class="FormInsideTableRegCell">4.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="64" valign="top" class="FormInnerRowRightBorder">5.</td>
            <td>&nbsp;</td>
          </tr>
        </table>		</td>
    </tr>
	<tr>
		<td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Referrals</span>
			<table width="100%" align="left" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="25%"><input type="checkbox" name="Repeat Biopsy" value="Yes">&nbsp;Repeat Biopsy</td>
					<td width="25%"><input type="checkbox" name="Sexual Med Consult" value="Yes" />					  &nbsp;Sexual Med Consult</td>
					<td width="25%"><input type="checkbox" name="Rad Tx Consult" value="Yes">&nbsp;Rad Tx Consult</td>
					<td width="25%"><input type="checkbox" name="Med Oncology Consult" value="Yes">&nbsp;Med Oncology Consult</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="Med / Cardiology" value="Yes">&nbsp;Med / Cardiology</td>
					<td><input type="checkbox" name="eMRI" value="Yes">&nbsp;eMRI</td>
				  <td colspan="2"><input type="checkbox" name="eMRI2" value="Yes" />
			      &nbsp;Sperm Banking</td>
			  </tr>
			</table>		</td>
	</tr>
    <tr> 
      <td colspan="8" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="13">Procedures Planned</span>
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        	<tr> 
				<td class="FormInsideTableTopCell"><input type="checkbox" name="Radical Prostatectomy" value="Yes">Radical Prostatectomy</td>
				<td class="FormInsideTableTopCell">Date:&nbsp;&nbsp;___/___/_______</td>
				<td class="FormInsideTableTopCell"><input type="checkbox" name="Open" value="Yes">Open</td>
				<td class="FormInsideTableTopCell"><input type="checkbox" name="Laparoscopic" value="Yes">Laparoscopic</td>
				<td class="FormInsideTableTopCell"><input type="checkbox" name="Robot Assisted" value="Yes">Robot Assisted</td>
			</tr>		  
        	<tr> 
				<td class="FormInsideTableRegCell"><input type="checkbox" name="PLND" value="Yes">PLND</td>
				<td class="FormInsideTableRegCell"><input type="checkbox" name="Nerve Graft" value="Yes">Nerve Graft</td>
				<td class="FormInsideTableRegCell" colspan="3"><input type="checkbox" name="Other" value="Yes">Other:</td>
			</tr>
			<tr> 
			  <td class="FormInsideTableRegCell" colspan="2"><input type="checkbox" name="Patient Education" value="Yes">Patient Education - Specify:</td>
				<td class="FormInsideTableRegCell" colspan="3"><input type="checkbox" name="Other Intervention" value="Yes">Other Intervention - Specify:</td>
			</tr>
        </table>      </td>
    </tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" /> Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.		</td>
	</tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="informedConsent" style="vertical-align: middle;" /> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.		</td>
	</tr>
    <tr> 
      <td class="FormOuterTableRow"><table class="pageWidth" align="center" border="0" cellpadding="2" cellspacing="0">
        <tr>
          <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Disposition</span></td>
        </tr>
        <tr>
          <td width="69%" align="center" class="FormInnerRowRightBorder"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="100" height="18">Prescriptions:</td>
                <td width="80" align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1" />Yes:</td>
                <td>Refill &nbsp;&nbsp;or &nbsp;&nbsp;New</td>
              </tr>
              <tr>
                <td height="18" colspan="3">Rx: __________________________________________________________</td>
              </tr>
              <tr>
                <td height="18" colspan="3">Rx: __________________________________________________________</td>
              </tr>
          </table></td>
          <td width="31%" align="center"><span>Protocol #: ________</span> <br />
              <table align="left" width="100%">
                <tr>
                  <td>Considered:</td>
                  <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                </tr>
                <tr>
                  <td>Consent Obtained:</td>
                  <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                </tr>
                <tr>
                  <td>Registered:</td>
                  <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                </tr>
              </table>
            <br />
              <br /></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" valign="top" class="FormInnerRowRightBorder"> 
              <input type="checkbox" name="50% of Time22"> 
              &#8805; 50% of attending time was spent in counseling <br/>
              <img src="../../Images/shim.gif" border="0" width="1" height="15"> 
              If so, mark total attending time in minutes &amp; describe on right:<br/>
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
              </table>            </td>
            <td width="50%" valign="top" class="FormInnerRowRightBorder">Describe 
              Counseling or Dictate Note:<br />
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="22" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5            </td>
            <td width="50%">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ 
              Resident<img src="../../Images/shim.gif" border="0" width="30" height="1">Attending</td>
          </tr>
        </table>		</td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td colspan="2"><span class="blackBoldText">Signatures</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr>
            <td align="right"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Fellow: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr>
            <td align="right"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />NP/PA: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr class="pageWidth">
            <td height="40" align="right" valign="bottom" style="padding-bottom: 0px; padding-top: 13px;"><span class="blackBoldText">Attending&nbsp;<br />
              Addendum:</span></td>
            <td colspan="3"  class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr class="pageWidth">
            <td>&nbsp;</td>
            <td colspan="3"  class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
              <tr>
                <td style="vertical-align: top;padding-top: 6px;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                <td style="vertical-align: top;">I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.</td>
              </tr>
              <tr>
                <td colspan="2" style="padding-top: 20px; text-align: center;"><span class="blackBoldText"> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
              </tr>
            </table></td>
          </tr>
      </table></td> 
      </tr>
    <tr>
      <td height="14" align="center" valign="bottom" bgcolor="#FFFFFF" class="blackBoldText">GU01<img src="../../Images/shim.gif" border="0" width="45" height="1">U05<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">6</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="8">ASMNTS</td>
    </tr>
  </table>
</div>

</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>