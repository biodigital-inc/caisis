<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Testis.PaperForms.UroTestNP" CodeFile="UroTestNP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>




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
		<div  class="VerticalBarCodeDocType">*U13*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br>Urology Testis New Patient<br></span></td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: 
        <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>
        </span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td class="FormOuterTableRow"><table width="100%" border="0" cellpadding="1" cellspacing="0">
          <tr>
            <td colspan="2" align="left" valign="middle" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Category of Service</span></td>
          </tr>
          <tr>
            <td width="23%" valign="top" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop" />&nbsp;New Patient Encounter<br />
              (CPT 99201-99205)</td>
            <td width="77%" valign="middle" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Use for patients who have not been see by anyone in your billing group in the last 3 years <strong>AND</strong><br />
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are self referred (includes those referred by friend or patient)<br />
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Do not have  physician asking for your advice/opinion (see PIF sheet or PAS info)<br />
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are referred solely for management and/or treatment of aspect of care<br />
            </td>
          </tr>
          <tr>
            <td valign="top" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop" />&nbsp;Office Consultation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
              (CPT 99241- 99245)</td>
            <td class="FormInnerRowBottomBorder"><table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td ><img src="../../Images/shim.gif" border="0" width="4" height="1" />Office Consultation is requested by _________________________ MD/PA/NP for my advice &amp; opinion<br />
                      <img src="../../Images/shim.gif" border="0" width="4" height="1" />regarding this patient&rsquo;s ______________________________________________________</td>
                </tr>
            </table></td>
            <!--<td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Office Consultation is requested by _________________________ MD/PA/NP for my advice & opinion<br />
					<img src="../../Images/shim.gif" border="0" width="4" height="1">regarding this patient&rsquo;s ______________________________________________________</td>-->
          </tr>
          <tr>
            <td valign="top" align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop" />&nbsp;Established Patient Visit<br />
              (CPT 99212-99215)</td>
            <td><img src="../../Images/shim.gif" border="0" width="4" height="1" />Use for patients who<br />
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are seeing you for the first time for management or treatment (Not a consult) and have been seen<br />
                <img src="../../Images/shim.gif" border="0" width="18" height="1" />by someone else in your billing group in the last 3 years<br />
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are seeing you for follow-up care/visits </td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Chief 
        Complaint<br>
        <br>
        </span></td>
    </tr>
    <tr> 
      <td height="270" valign="top" class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">HPI</span><br/> 
        <table cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="FormPopulatedSmallerText" valign="top"> <asp:Repeater ID="hpi" runat=server OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "patientHPI") %>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> </td>
          </tr>
        </table></td>
    </tr>
	<tr>
    <td valign="top" class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr> 
				  <td colspan="2" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
					<input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">NKA&nbsp;&nbsp;</span></td>
				</tr>
				<tr align="center"> 
				  <td width="40%" class="FormInsideTableRegCell">Allergen</td>
				  <td class="FormInnerRowBottomBorder">Reaction</td>
				</tr>
				<asp:Repeater ID="allergies" runat=server> 
				  <ItemTemplate> 
					<tr> 
					  <td class="FormInsideTableRegCell" style="height: 30px;">&nbsp;<strong> 
						<%# DataBinder.Eval(Container.DataItem, "Allergen") %>
						</strong></td>
					  <td class="FormInnerRowBottomBorder">&nbsp;<strong> 
						<%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %>
						</strong></td>
					</tr>
				  </ItemTemplate>
				</asp:Repeater>
			</tr>
          </table>			 </td>
	</tr>
    <tr> 
      <td align="center" class="FormOuterTableRow"><table align="center" border="0"  class="pageWidth" cellpadding="1" cellspacing="0">
          <tr> 
            <td colspan="5" align="left" valign="middle"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="3" height="15">Medical 
              Therapies / Chemotherapy</span><img src="../../Images/shim.gif" border="0" width="50" height="1">Initial Risk Category:<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" hspace="0" vspace="0" align="absmiddle">Poor<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" hspace="0" vspace="0" align="absmiddle">Intermediate<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" hspace="0" vspace="0" align="absmiddle">Good</td>
          </tr>
          <tr> 
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopLeftCell">Start Date</td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Stop Date</td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Indication</td>
            <td width="44%" align="center" valign="middle" class="FormInsideTableTopCell">Regimen</td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Cycles</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table>
        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="7" align="left" valign="top" class="smallGrayText"><strong>&nbsp;&nbsp;Indication Codes</strong></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="smallGrayText">&nbsp;</td>
            <td align="right" valign="top" class="smallGrayText"><strong>1&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Induction</span>            </td>
            <td align="right" valign="top" class="smallGrayText"><strong>6&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Relapse after PostChemo RPLND</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>10&nbsp;&nbsp;</strong></td>
            <td valign="top" class="smallGrayText">Third Line</td>
          </tr>
          <tr > 
            <td align="left" valign="top" class="smallGrayText">&nbsp;</td>
            <td align="right" valign="top" class="smallGrayText"><strong>2&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Relapse after Surveillance</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>7&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Relapse after RPLND</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>11&nbsp;&nbsp;</strong></td>
            <td valign="top" class="smallGrayText">Relapse with Progression of disease</td>
          </tr>
          <tr > 
            <td align="left" valign="top" class="smallGrayText">&nbsp;</td>
            <td align="right" valign="top" class="smallGrayText"><strong>3&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Salvage after incomplete RPLND</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>8&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"> Relapse after Chemo</td>
            <td align="right" valign="top" class="smallGrayText"><strong>12&nbsp;&nbsp;</strong></td>
            <td valign="top" class="smallGrayText">Other</td>
          </tr>
          <tr > 
            <td align="left" valign="top" class="smallGrayText">&nbsp;</td>
            <td align="right" valign="top" class="smallGrayText"><strong>4&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Adjuvant after RPLND</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>9&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder">Second Line </td>
            <td align="right" valign="top" class="smallGrayText"><strong>13&nbsp;&nbsp;</strong></td>
            <td valign="top" class="smallGrayText">Unknown</td>
          </tr>
          <tr > 
            <td align="left" valign="top" class="smallGrayText">&nbsp;</td>
            <td align="right" valign="top" class="smallGrayText"><strong>5&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Adjuvant after postChemo RPLND</span></td>
            <td align="right" valign="top" class="smallGrayText">&nbsp;</td>
            <td valign="top" class="FormInnerRowRightBorder">&nbsp;</td>
            <td valign="top" class="smallGrayText">&nbsp;</td>
            <td valign="top" class="smallGrayText">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="71%" height="110" valign="top"><span class="blackBoldText">Comorbidities</span><br/> 
              <asp:Repeater ID="comorbidities" runat=server> 
                <ItemTemplate>&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
                  - <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>
                  </strong> </ItemTemplate>
                <SeparatorTemplate><br/>
                </SeparatorTemplate>
              </asp:Repeater> </td>
            <td width="29%" valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Thromboembolic Events / DVT<br>
			<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Pulmonary Disease / Asthma<br>
			<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Diabetes (IDDM/NIDDM)<br>
			<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Hypertension</td>
          </tr>
        </table></td>
    </tr>
    
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU09<img src="../../Images/shim.gif" border="0" width="45" height="1">U13<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
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
		<div  class="VerticalBarCodeDocType">*U13*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br>Urology Testis New Patient<br></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="46%" height="90" valign="top"><span class="blackBoldText">Medical &amp; Surgical History</span></td>
            <td width="31%" valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Cryptorchidism
			<img src="../../Images/shim.gif" border="0" width="15" height="1"><br>
			<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Ipsilateral Inguinal Surgery<br>
			<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Contralateral Inguinal Surgery<br>
			<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Prior Contralateral Testis Cancer</td>
            <td width="23%" valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Prior Testis Cancer<br>
			<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Prior Scotal Violation<br>
			<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Prior RPLND<br>
			<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Exploratory Laparotomy</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table width="100%" border="0" cellpadding="2" cellspacing="0">
          <tr align="left" valign="top">
            <td colspan="3" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Health Maintenance</span></td>
          </tr>
          <tr>
            <td width="26%" align="center" class="FormInsideTableTopLeftCell">Diagnostic Test</td>
            <td width="15%" align="center" class="FormInsideTableTopCell">Date</td>
            <td width="59%" align="center" class="FormInsideTableTopCell">Results</td>
          </tr>
          <tr>
            <td height="30" align="center" class="FormInsideTableLeftCell">Last Colonoscopy</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="30" align="center" class="FormInsideTableLeftCell">Last Stress Test</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="30" align="center" class="FormInsideTableLeftCell">Last Prostate Cancer Screening</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0"  class="pageWidth" cellpadding="2" cellspacing="0">
          <tr align="left"> 
            <td colspan="6" valign="middle"><span class="blackBoldText">Presenting Symptoms</span></td>
          </tr>
          <tr> 
            <td width="11%" align="center" valign="middle" class="FormInsideTableTopCell">System</td>
            <td width="18%" align="center" valign="middle" class="FormInsideTableTopCell">Symptom</td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">Not Present</td>
            <td width="7%" align="center" valign="middle" class="FormInsideTableTopCell">Present            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><p>Present Now</p></td>
            <td width="44%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <tr> 
            <td rowspan="5" valign="top" class="FormInsideTableLeftCell">GU</td>
            <td class="FormInsideTableRegCell">Testicular Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Swelling (mass/nodule)</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Testicle Hardness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Infertility</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Abdominal Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" valign="top" class="FormInsideTableLeftCell">Breast</td>
            <td class="FormInsideTableRegCell">Gynecomastia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Nipple Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">Nipple Mass</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableLeftCell">Head/Neck</td>
            <td class="FormInsideTableRegCell">Neck Mass</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableLeftCell">MS</td>
            <td class="FormInsideTableRegCell">Back Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top" class="FormInsideTableLeftCell">C/V</td>
            <td class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableLeftCell">General</td>
            <td class="FormInsideTableRegCell">Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="6" class="FormInsideTableLeftCell">Other</td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td height="20" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText"></span>Post Treatment Ejaculation</span>
	  <img src="../../Images/shim.gif" width="30" height="1" border="0" align="absmiddle">Date: ____/____/________
	  <img src="../../Images/shim.gif" border="0" width="25" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Absent
	  <img src="../../Images/shim.gif" border="0" width="25" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Partial
	  <img src="../../Images/shim.gif" border="0" width="25" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Normal</td>
    </tr>
	<tr>
		<td class="FormOuterTableRow">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
	  				<td colspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Fertility:</span></td>
				</tr>
				<tr>
					<td width="50%" height="15" class="FormInsideTableTopLeftCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Number of Children Pre-Surgery:: __________</td>
					<td width="50%" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Number of Children Post-Surgery: __________</td>
				</tr>
				<tr>
					<td height="15" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Post-Surgery if <strong>YES</strong>:&nbsp;Means:&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Normal&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Fertility Assistance</td>
					<td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Type (specify):</td>
				</tr>
				<tr>
					<td height="15" colspan="2" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Post-Surgery if <strong>NO</strong>:<img src="../../Images/shim.gif" border="0" width="4" height="1">Have you and your partner attempted?</td>
				</tr>
			</table>		</td>
	</tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Initial Diagnosis</span><img src="../../Images/shim.gif" border="0" width="35" height="8">Dx Date: _______________<br> 
        <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="22%"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText"></span>Method of Initial Diagnosis:</td>
            <td width="21%"> <input type="checkbox" name="No222">Rad Orch</td>
            <td width="18%"> <input type="checkbox" name="No2222">Simple Orch</td>
            <td width="17%"> <input type="checkbox" name="No22223">Biopsy</td>
            <td width="22%"> <input type="checkbox" name="No22224">FNA</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td><input type="checkbox" name="No222222">Laparotomy</td>
            <td><input type="checkbox" name="No222232">RPLND</td>
            <td><input type="checkbox" name="No222242">Laparoscopy</td>
            <td><input type="checkbox" name="No2222423">Other: _____________</td>
          </tr>
          <tr> 
            <td colspan="5"><img src="../../Images/shim.gif" border="0" width="35" height="6"></td>
          </tr>
          <tr> 
            <td><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText"></span>Site of Initial Diagnosis:</td>
            <td> <input type="checkbox" name="No22232">Left Testis</td>
            <td> <input type="checkbox" name="No222252">Right Testis</td>
            <td> <input type="checkbox" name="No2222232">Head/Neck</td>
            <td> <input type="checkbox" name="No2222332">Mediastinum</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td><input type="checkbox" name="No2222432">Retroperitoneum/Abd</td>
            <td colspan="3"><input type="checkbox" name="No22224223">Other: __________________________________</td>
          </tr>
          <tr> 
            <td colspan="5"><img src="../../Images/shim.gif" border="0" width="35" height="5"></td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="22%"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText"></span><span class="blackBoldText">Primary Site</span></td>
            <td width="21%"> <input type="checkbox" name="No2223">Left Testis</td>
            <td width="18%"><input type="checkbox" name="No22225">Right Testis</td>
            <td width="17%"> <input type="checkbox" name="No222223">Head</td>
            <td width="22%"> <input type="checkbox" name="No222233">Mediastinum</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td><input type="checkbox" name="No222243">Retroperitoneum</td>
            <td><input type="checkbox" name="No22224222">Paratesticular</td>
            <td colspan="2"><input type="checkbox" name="No22224232">Other: _____________</td>
          </tr>
          <tr> 
            <td colspan="5"><img src="../../Images/shim.gif" border="0" width="35" height="10"></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Pathology</span><span><img src="../../Images/shim.gif" border="0" width="30" height="1"> 
        <input type="checkbox" name="Films Reviewed23">Reviewed with <%= institutionShortName%> Pathologist</span><img src="../../Images/shim.gif" border="0" width="35" height="8">Orchiectomy Date: _______________<br>
		<img src="../../Images/shim.gif" border="0" width="35" height="5"><br> 
        <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td valign="middle" class="FormInsideTableTopCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableTopCell">Seminoma</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableTopLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableTopCell">Yolk Sac</td>
            <td valign="middle" class="FormInnerRowRightBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableTopLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableTopCell">Vascular Invation</td>
          </tr>
          <tr> 
            <td width="4%" valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td width="28%" valign="middle" class="FormInsideTableRegCell">Pure-Seminoma</td>
            <td width="1%" valign="middle">&nbsp;</td>
            <td width="5%" valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td width="28%" valign="middle" class="FormInsideTableRegCell">Pure-Yolk Sac </td>
            <td width="1%" valign="middle" class="FormInnerRowRightBorder">&nbsp;</td>
            <td width="5%" valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td width="28%" valign="middle" class="FormInsideTableRegCell">Burnt Out / Scar</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableRegCell">Teratoma</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableRegCell">Chorio</td>
            <td valign="middle" class="FormInnerRowRightBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableRegCell">ITGCN</td>
          </tr>
          <tr>
            <td width="30" valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td> 
            <td class="FormInsideTableRegCell">Imm Teratoma</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableRegCell">Pure Chorio</td>
            <td valign="middle" class="FormInnerRowRightBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableRegCell">Positive Cord Margin</td>
          </tr>
          <tr>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td> 
            <td class="FormInsideTableRegCell">Malignant Transformation</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableRegCell">Leydig Cell</td>
            <td valign="middle" class="FormInnerRowRightBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableRegCell">Extra-Testicular 
              Extension </td>
          </tr>
          <tr>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td> 
            <td class="FormInsideTableRegCell">Pure-Teratoma</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td valign="middle" class="FormInsideTableRegCell">Sertoli Cell</td>
            <td class="FormInnerRowRightBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td class="FormInsideTableRegCell">LVI</td>
          </tr>
          <tr>
            <td width="30" valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td> 
            <td class="FormInsideTableRegCell">Embryonal</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td class="FormInsideTableRegCell">Adenocarcinoma</td>
            <td rowspan="2" valign="top" class="FormInnerRowRightBorder">&nbsp;</td>
            <td rowspan="2" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td> 
            <td class="FormInsideTableRegCell">Pure-Embryonal</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><img style="margin-left: 6px;" src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td class="FormInsideTableRegCell">Other Histology:</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU09<img src="../../Images/shim.gif" border="0" width="45" height="1">U13<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
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
		<div  class="VerticalBarCodeDocType">*U13*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br>Urology Testis New Patient<br></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td class="FormInnerRowBottomBorder" ><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Serum Tumor Markers</span> </td>
          </tr>
          <tr  id="LabTestsTrendViewPopTableRow" runat="server"> 
            <td> 
			<table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
                <tr> 
                  <td width="14%" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <asp:Repeater ID="LabTestsTrendViewDates" runat=server> 
                    <ItemTemplate> 
                      <td width="12%" height="12" class="FormInsideTableRegCell" align="center"><strong> 
                        <%# DataBinder.Eval(Container.DataItem, "LabDates") %>
                        </strong></td>
                    </ItemTemplate>
                  </asp:Repeater>
                  <td width="14%" align="left" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                </tr>
                <asp:Repeater ID="LabTestsTrendView" runat=server> 
                  <ItemTemplate> 
                    <tr> 
                      <td align="center" class="FormInsideTableRegCell" style="height: 32px;">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[0]") %>
                        </strong>&nbsp;</td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[1]") %>
                        </strong>&nbsp;</td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[2]") %>
                        </strong>&nbsp;</td>
                      <td class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[3]") %>
                        </strong>&nbsp;</td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[4]") %>
                        </strong>&nbsp;</td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;</td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
          </tr>
          <tr id="LabTestsTrendViewBlankTableRow" runat="server"> 
            <td> <table align="center" border="0"  class="pageWidth" cellpadding="2" cellspacing="0">
                <tr> 
                  <td width="20%" align="center" class="FormInsideTableRegCell">Marker</td>
                  <td width="20%" class="FormInsideTableRegCell">Date:</td>
                  <td width="20%" class="FormInsideTableRegCell">Date:</td>
                  <td width="20%" class="FormInsideTableRegCell">Date:</td>
                  <td width="20%" class="FormInsideTableRegCell">Date:</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell"><span style="font-family: Symbol;">b</span>HCG</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">AFP</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">LDH</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table>
        <br /><strong>&nbsp;&nbsp;Circle:&nbsp;&nbsp;&nbsp;S1<span><img src="../../Images/shim.gif" border="0" width="30" height="8">S2<img src="../../Images/shim.gif" border="0" width="30" height="8">S3</span></strong> 
      </td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span>
	  <img src="../../Images/shim.gif" border="0" width="12" height="1"><input type="checkbox" name="Films Reviewed">Films Reviewed<br>
        <table align="center" border="0"  class="pageWidth" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="19%" align="center" valign="middle" class="FormInsideTableTopCell">Target</td>
            <td width="44%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
			<td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><%= institutionShortName%></td>
          </tr>
          <asp:Repeater ID="images" runat=server> 
            <ItemTemplate> 
              <tr> 
                <td height="34"  align="center" class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxDateText") %></strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxType") %></strong></td>
                <td class="FormInsideTableRegCell"><strong><%# DataBinder.Eval(Container.DataItem, "DxTarget") %></strong>&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxResult") %></strong></td>
				<td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Yes&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">No</td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table>
		</td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table  class="pageWidth"border="0" cellspacing="0" cellpadding="2">
          <tr valign="top"> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Family and Social History</span></td>
          </tr>
          <tr valign="top"> 
            <td width="42%" class="FormInnerRowRightBorder">Family History:<br /><br />
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="BlankFamilyHistoryTable" runat="server">
                <tr> 
                  <td> <img src="../../Images/shim.gif" border="0" width="12" height="1">- Testis Cancer:<br /> 
				  <img src="../../Images/shim.gif" border="0" width="15" height="1"> 
                  <input type="checkbox" name="Digitized2222">Brother<br />
				  <img src="../../Images/shim.gif" border="0" width="15" height="1">
				  <input type="checkbox" name="Digitized22222">Father<br /><br /><br /><br />
				  <img src="../../Images/shim.gif" border="0" width="12" height="1">-Other Cancer:<br /><br /><br /><br />
				  <img src="../../Images/shim.gif" border="0" width="12" height="1">-Other:<br> </td>
                </tr>
              </table>
              <asp:Repeater ID="familyHistory" runat=server OnItemCreated="FamilyHistoryItemCreated"> 
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
                  <br />
                </ItemTemplate>
              </asp:Repeater> <br /><br />
			  <img src="../../Images/shim.gif" border="0" width="12" height="1">-Race: 
              <asp:Label ID="Race" Runat="server" /><br /></td>
            <td width="58%">Social History: <br /><br />
              Occupation: <asp:Label ID="socHxOccupation" Runat="server" /> <br /><br />
              Marital Status: <asp:Label ID="socHxMaritalStatus" Runat="server" /><img src="../../Images/shim.gif" border="0" width="60" height="8">
			  Children: <asp:Label ID="socHxChildren" Runat="server" /> <img src="../../Images/shim.gif" border="0" width="40" height="8">
			  # Children post-Tx:<br />
			  <img src="../../Images/shim.gif" border="0" width="1" height="10"><br />
              Tobacco Use: &nbsp; Type: <asp:Label ID="socHxTobaccoType" Runat="server"> 
              <input type="checkbox" name="Digitized22223">Cigarettes <img src="../../Images/shim.gif" border="0" width="10" height="1"> 
              <input type="checkbox" name="Digitized222222">Cigar<img src="../../Images/shim.gif" border="0" width="10" height="1"> 
              <input type="checkbox" name="Digitized22223">Pipe</asp:Label> <br> <img src="../../Images/shim.gif" border="0" width="75" height="1"> 
              <input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" NAME="socHxTobaccoPacksPerDayCheckBox"/> 
              <asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label>packs / day for <asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label>years<br />
			  <img src="../../Images/shim.gif" border="0" width="75" height="1"><input type="checkbox" id="socHxTobaccoQuitYearCheckbox" runat="server" NAME="socHxTobaccoQuitYearCheckbox"/>
			  Quit: <asp:Label ID="socHxTobaccoQuitYear" Runat="server">______ years ago</asp:Label> <br /> <br />
              Marijuana Use: <br /> <br />
              Alcohol Use: <asp:Label ID="socHxAlcohol" Runat="server" /><br /> <br />
              Carcinogen Exposure: <asp:Label ID="socHxCarcinogen" Runat="server" /><br /> <br />
              Steroid Use: <br /> <br />
              Propecia Use:</td>
          </tr>
        </table>
		</td>
    </tr>
<!--<tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span><span><img src="../../Images/shim.gif" border="0" width="15" height="1"> 
        <input type="checkbox" name="Films Reviewed">
        Films Reviewed<img src="../../Images/shim.gif" border="0" width="18" height="8"> 
        <input type="checkbox" name="Compared to Past">
        Compared to Past<img src="../../Images/shim.gif" border="0" width="18" height="1"> 
        <input type="checkbox" name="Reviewed with Radiologist">
        Reviewed with Radiologist<img src="../../Images/shim.gif" border="0" width="18" height="1"> 
        <input type="checkbox" name="Digitized">
        Digitized<br>
        </span> <table align="center" border="0" width="650" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="70" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
            <td width="70" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="310" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td width="200" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <tr> 
            <td height="25" class="FormInsideTableLeftCell">&nbsp;</td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><br>
              CXR</td>
            <td class="FormInsideTableRegCell"> <asp:Repeater ID="XRayChest" runat=server> 
                <ItemTemplate> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxTarget") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxSide") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                  &nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                  </strong> <br/>
                </ItemTemplate>
              </asp:Repeater> 
              <table width="306" border="0" cellspacing="0" cellpadding="0" id="BlankCXRTable" runat="server">
                <tr> 
                  <td class="FormInsideTableTopLeftCell">Site</td>
                  <td class="FormInsideTableTopCell">Side</td>
                  <td class="FormInsideTableTopCell" width="70">Size</td>
                  <td class="FormInsideTableTopCell"  width="70">Nodes</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Normal</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Lung</td>
                  <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Left&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Right</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Mediastinal</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="25" class="FormInsideTableLeftCell">&nbsp;</td>
            <td align="center" valign="top" class="FormInsideTableRegCell">Scrotal 
              U/S</td>
            <td valign="top" class="FormInsideTableRegCell"> <asp:Repeater ID="ScrotalUS" runat=server> 
                <ItemTemplate> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxTarget") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxSide") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                  &nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                  </strong> <br/>
                </ItemTemplate>
              </asp:Repeater> 
              <table width="306" border="0" cellspacing="0" cellpadding="0" id="BlankScrotalUSTable" runat="server">
                <tr> 
                  <td colspan="3"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Microlithiasis &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Macrolithiasis &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Heterogeneity </td>
                </tr>
                <tr> 
                  <td class="FormInsideTableTopLeftCell">Side</td>
                  <td class="FormInsideTableTopCell" width="70">Size</td>
                  <td class="FormInsideTableTopCell"  width="70">Nodes</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Left&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Right</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Left&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Right</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table width="650" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td> <asp:Repeater ID="CTChest" runat=server> 
                <HeaderTemplate> <span class="blackBoldText">Chest CT</span><br/>
                  <br/>
                </HeaderTemplate>
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxTarget") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxSide") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                  &nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                  </strong> <br/>
                </ItemTemplate>
              </asp:Repeater> 
              <table width="642" border="0" cellpadding="0" cellspacing="0" id="BlankChestCTTable" runat="server">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Chest 
                    CT</span><span><img src="../../Images/shim.gif" border="0" width="20" height="8"></span> 
                    <input type="checkbox" name="Films Reviewed24">
                    Normal</td>
                  <td colspan="2" class="FormInsideTableTopLeftCell">Date:</td>
                  <td colspan="2" class="FormInsideTableTopLeftCell">Date:</td>
                  <td colspan="2" class="FormInsideTableTopLeftCell">Date:</td>
                </tr>
                <tr> 
                  <td width="52" align="center" class="FormInsideTableLeftCell"><span>Site</span></td>
                  <td width="90" align="center" class="FormInnerRowBottomBorder">Side</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableLeftCell">Size</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableRegCell">Nodes</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableLeftCell">Size</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableRegCell">Nodes</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableLeftCell">Size</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableRegCell">Nodes</td>
                </tr>
                <tr> 
                  <td rowspan="2" class="FormInsideTableLeftCell"><p>Lung</p></td>
                  <td align="center" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Left&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Right</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Left&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Right</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td rowspan="2" class="FormInsideTableLeftCell">Mediastinal</td>
                  <td align="center" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Left&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Right</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Left&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Right</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
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
    <tr> 
      <td class="FormOuterTableRow"> <asp:Repeater ID="CTAbdomenPelvis" runat=server> 
          <HeaderTemplate> <img src="../../Images/testis.gif" width="167" height="108" vspace="15" border="0" align="right">&nbsp;<span class="blackBoldText">CT Scan (Abdomen / Pelvis)</span><br/>
            <br/>
          </HeaderTemplate>
          <ItemTemplate> <strong>&nbsp; 
            <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
            </strong> &nbsp;<strong> 
            <%# DataBinder.Eval(Container.DataItem, "DxType") %>
            </strong> &nbsp;<strong> 
            <%# DataBinder.Eval(Container.DataItem, "DxTarget") %>
            </strong> &nbsp;<strong> 
            <%# DataBinder.Eval(Container.DataItem, "DxSide") %>
            </strong> &nbsp;<strong> 
            <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
            &nbsp; 
            <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
            </strong> <br/>
          </ItemTemplate>
        </asp:Repeater> 
        <table width="650" border="0" cellspacing="0" cellpadding="4" id="BlankCTAbdomenPelvisTable" runat="server">
          <tr> 
            <td width="420" class="FormInnerRowRightBorder"><span class="blackBoldText">CT 
              Scan (Abdomen / Pelvis)<br>
              </span> <input type="checkbox" name="Films Reviewed2">
              Liver Mets<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
              <input type="checkbox" name="Compared to Past2">
              Other Visc. Mets<br> <input type="checkbox" name="Reviewed with Radiologist2">
              Lymphocele<br> <br>
              Primary Landing Zone: <br> <input type="checkbox" name="Films Reviewed22">
              Left: Paraaortic<img src="../../Images/shim.gif" border="0" width="18" height="1"> 
              <input type="checkbox" name="Compared to Past22">
              Interaortic<br> <input type="checkbox" name="Compared to Past222">
              Right: Interaortocaval<br> <br> </td>
            <td align="center"><img src="../../Images/testis.gif" border="0" width="167" height="108"></td>
          </tr>
          <tr> 
            <td width="650" colspan="2"> <table width="642" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td colspan="5" align="center" class="FormInsideTableTopLeftCell">Size 
                    (cm)</td>
                </tr>
                <tr> 
                  <td width="112" align="center" class="FormInsideTableLeftCell"><span>Site</span></td>
                  <td width="30" align="center" class="FormInnerRowBottomBorder">No 
                    Mass</td>
                  <td width="64" align="center" valign="top" class="FormInsideTableLeftCell">Date:</td>
                  <td width="64" align="center" valign="top" class="FormInsideTableRegCell">Date:</td>
                  <td width="64" align="center" valign="top" class="FormInsideTableRegCell">Date:</td>
                  <td width="64" align="center" valign="top" class="FormInsideTableRegCell">Date:</td>
                  <td width="64" align="center" valign="top" class="FormInsideTableRegCell">Date:</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><p>Largest mass on CT<br>
                      (in longest dimension)</p></td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Precaval</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Paracaval</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Para-aortic</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Preaortic</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Interaortocaval</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Interiliac / Presacral</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Right iliac</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Left iliac</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Right hilar</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Left hilar</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Right retrocrural</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Left retrocrural</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">Inguinal</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="7" class="FormInsideTableLeftCell">Notes:</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table width="650" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="325" valign="top" class="FormInnerRowRightBorder"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="14">Brain 
              Imaging</span><br> <asp:Repeater ID="BrainScan" runat=server> 
                <HeaderTemplate> <br/>
                </HeaderTemplate>
                <ItemTemplate> <strong>&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxTarget") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxSide") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                  &nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                  </strong> <br/>
                </ItemTemplate>
              </asp:Repeater> 
              <table width="325" border="0" cellspacing="0" cellpadding="0"  id="BlankBrainScanTable" runat="server">
                <tr align="center"> 
                  <td width="52" align="center" class="FormInsideTableTopCell">&nbsp;</td>
                  <td width="81" height="35" valign="top" class="FormInsideTableTopCell">Date</td>
                  <td width="79" valign="top" class="FormInsideTableTopCell">Date</td>
                  <td width="81" valign="top" class="FormInsideTableTopCell">Date</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Normal</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Mets</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Not Done</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
            <td width="325" valign="top" class="FormInnerRowRightBorder"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="14">PET 
              Scan </span><br> <asp:Repeater ID="PETScan" runat=server> 
                <HeaderTemplate> <br/>
                </HeaderTemplate>
                <ItemTemplate> <strong>&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxTarget") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxSide") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                  &nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                  </strong> <br/>
                </ItemTemplate>
              </asp:Repeater> 
              <table width="325" border="0" cellspacing="0" cellpadding="0" id="BlankPETScanTable" runat="server">
                <tr align="center"> 
                  <td width="52" align="center" class="FormInsideTableTopCell">&nbsp;</td>
                  <td width="81" height="36" valign="top" class="FormInsideTableTopCell">Date</td>
                  <td width="79" valign="top" class="FormInsideTableTopCell">Date</td>
                  <td width="81" valign="top" class="FormInsideTableTopCell">Date</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Normal</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Mets</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Not Done</td>
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
 -->    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU09<img src="../../Images/shim.gif" border="0" width="45" height="1">U13<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
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
		<div  class="VerticalBarCodeDocType">*U13*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br>Urology Testis New Patient<br></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Review 
        of Systems&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="smallGrayText">Clinician 
        Performing Review: 
        <input type="checkbox" name="NP2" value="Yes">
        NP / PA&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow2" value="Yes">
        Fellow&nbsp;&nbsp; 
        <input type="checkbox" name="Attending2" value="Yes">
        Attending</span> <table border="0"  class="pageWidth" cellpadding="2" cellspacing="0">
          <!-- <tr class="eFormInnerTableRow">
						<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br></td>
						<td colspan="1" align="left" valign="top"></td>
					</tr> -->
          <tr> 
            <td align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Not 
              Present</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Disease 
              Related </strong></td>
            <td width="48%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">General</td>
            <td align="left" class="FormInsideTableRegCell">Fever</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Neuro</td>
            <td align="left" class="FormInsideTableRegCell">Headaches</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Focal Weakness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Eyes</td>
            <td align="left" class="FormInsideTableRegCell">Visual Problems</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">CV</td>
            <td align="left" class="FormInsideTableRegCell">Angina</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Palpitations</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Respiratory</td>
            <td align="left" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Shortness of Breath</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hemoptysis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">GI</td>
            <td align="left" class="FormInsideTableRegCell">Nausea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="4" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Abdominal Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Rectal Bleeding</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="8" align="left" valign="top" class="FormInsideTableLeftCell">GU</td>
            <td align="left" class="FormInsideTableRegCell">Dysuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="7" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Nocturia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Slow Stream</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Infection</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Erectile Function</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">Ejaculation:</td>
          </tr>
          <tr>
            <td align="left" valign="top" class="FormInsideTableLeftCell">MS</td>
            <td align="left" class="FormInsideTableRegCell">Joint Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" valign="top" class="FormInsideTableLeftCell">Psych</td>
            <td align="left" class="FormInsideTableRegCell">Anxiety / Depression</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Heme</td>
            <td align="left" class="FormInsideTableRegCell">Anemia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" class="FormInsideTableRegCell">Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td align="left" class="FormInsideTableRegCell">Rash</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Endo</td>
            <td align="left" class="FormInsideTableRegCell">Heat/Cold Intolerance</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Thirst</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hot Flashes</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Breast</td>
            <td align="left" class="FormInsideTableRegCell">Enlargement</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="7" align="left" valign="top" class="FormInsideTableLeftCell">Other:<br /><br /></td>
          </tr>
        </table>		</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="50" class="FormOuterTableRow">&nbsp;
          <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes" />
          <span class="blackBoldText"> PFSH and ROS performed by:  ___________________________<img src="../../Images/shim.gif" border="0" width="10" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="10" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU09<img src="../../Images/shim.gif" border="0" width="45" height="1">U13<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
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
		<div  class="VerticalBarCodeDocType">*U13*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br>Urology Testis New Patient<br></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
<!--<tr> 
      <td valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Review of Systems cont.</span> 
        <table border="0" width="650" cellpadding="2" cellspacing="0">
          <!-- <tr class="eFormInnerTableRow">
				<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br></td>
				<td colspan="1" align="left" valign="top"></td>
			</tr> -->
          <!--<tr> 
            <td align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Not Present</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Disease Related</strong></td>
            <td width="315" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
        </table>
		</td>
    </tr>-->
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital 
              Signs</span></td>
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
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
        <table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr > 
            <td width="10%" valign="top"><span class="blackBoldText">Exam</span></td>
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
            <td   class="FormInsideTableTopCell" style="text-align:center;"><strong>Attnd<br/>
              Performed</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Gen</td>
            <td width="24%" height="29" align="left" class="FormInnerRowBottomBorder">Well 
              Developed / Well Nourished </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" ></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" ></td>
            <td width="10%" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" ></td>
            <td width="40%" rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">No Acute Distress</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" ></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">Alert &amp; Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" ></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Eyes&nbsp;</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder">No Scleral Icterus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">EOMI</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">ENT&nbsp;</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder">Mucous Membranes 
              Moist</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">Nodes</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder"> Cervical</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> Supraclavicular</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">Axillary</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">Groin </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Resp.</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder">Clear to Percusion<br>
              and Auscultation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">C/V</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">Regular Rate &amp; 
              Rhythm</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Murmurs</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableLeftCell">Abdomen</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder">Soft Non-tender            </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> Normal Bowel Sounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">No Palpable Mass</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Hepatosplenomegaly</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Ascites</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Back</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Spinal Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No CVA Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableLeftCell">GU<br />Male</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder">Normal Prostate Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">No Varicocele Present</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">Normal Rectal Tone</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td height="29" align="left" class="FormInnerRowBottomBorder">Normal Penis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">Circumcised:&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Yes&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">No</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td height="29" align="left" class="FormInnerRowBottomBorder">Normal Meatus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">Lesions:&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Yes&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">No: __________________ </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU09<img src="../../Images/shim.gif" border="0" width="45" height="1">U13<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
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
		<div  class="VerticalBarCodeDocType">*U13*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br>Urology Testis New Patient<br></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Exam cont.</span><br> 
        <table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr> 
            <td width="80" align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal Symptoms</strong></td>
            <td width="46" align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td  align="center" class="FormInsideTableTopCell"><strong>Attnd<br />Performed</strong></td>
            <td width="40%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableLeftCell">Testes</td>
            <td width="24%" height="29" align="left" class="FormInnerRowBottomBorder">No Tenderness or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/testis.gif" border="0" width="167" height="108"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">Normal Size</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">No Hydrocele</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">No Varicocele</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">Normal Scrotal Wall</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Breast&nbsp;</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder">No Gynecomastia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">No Nipple Tenderness 
              / Discharge</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableLeftCell">M/S</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Clubbing or 
              Cyanosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Cord</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Leg Swelling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">Normal Pedal Pulses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Neuro</td>
            <td width="220" height="29" align="left" class="FormInnerRowBottomBorder"> Normal 
              Motor Function</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> Normal Sensation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder">Cran Nerv II-XII 
              Intact</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Rash or Ulcers</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="29" align="left" class="FormInnerRowBottomBorder"> No Nodules</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Other:<br></td>
            <td height="29" align="left" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td width="23%" height="21"><span class="blackBoldText">2002 Clinical 
              TNM Stage</span></td>
            <td width="4%"><strong>I</strong></td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">A</td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">B</td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">S</td>
          </tr>
          <tr> 
            <td rowspan="2">&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Pending Data</td>
            <td><strong>II</strong></td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">A 
              (&lt;2cm)</td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">B 
              (2-5 cm)</td>
            <td height="21"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">C 
              (&gt; 5cm)</td>
          </tr>
          <tr> 
            <td><strong>III</strong></td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Bone 
              / Liver</td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Lung</td>
            <td height="21"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Mediastinum 
              <img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Supraclavicular 
              <img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
              Combination</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="70" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="8" height="15"><span class="blackBoldText">Disease 
        State</span><img src="../../Images/shim.gif" border="0" width="26" height="8"> 
        <input type="checkbox" name="NED"/>
        NED<img src="../../Images/shim.gif" border="0" width="26" height="8"> <input type="checkbox" name="AWD"/>
        AWD<img src="../../Images/shim.gif" border="0" width="26" height="8"> <input type="checkbox" name="AS"/>
        Active Surveillance<img src="../../Images/shim.gif" border="0" width="60" height="8">Date:</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="44%" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="4">
                <tr> 
                  <td width="46%"><span class="blackBoldText">Relapse<br>
                    </span></td>
                  <td width="20%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    Yes </td>
                  <td width="34%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    No </td>
                </tr>
                <tr> 
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;Late Relapse</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    Yes </td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    No </td>
                </tr>
                <tr> 
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;Date:</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    Elevated Markers</td>
                </tr>
                <tr> 
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;Infield Recurrence</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    Yes </td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    No </td>
                </tr>
              </table></td>
            <td width="56%" valign="top"> <table width="96%" border="0" cellspacing="0" cellpadding="4">
                <tr> 
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="20%"><strong>Site</strong></td>
                  <td width="40%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    Retroperitoneum</td>
                  <td width="40%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    Liver</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    Retrocrural</td>
                  <td width="137"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    Mediastinum</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    Lung</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> 
                    Brain</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU09<img src="../../Images/shim.gif" border="0" width="45" height="1">U13<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
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
		<div  class="VerticalBarCodeDocType">*U13*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br>Urology Testis New Patient<br></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td colspan="2" class="blackBoldText">Impression &amp; Plan </td>
          </tr>
          <tr> 
            <td width="62%" align="center" class="FormInsideTableTopCell"><strong>Diagnoses 
              / Problem List</strong></td>
            <td width="38%" align="center" class="FormInsideTableTopCell"><strong>Plan 
              &amp; Referrals</strong></td>
          </tr>
          <tr> 
            <td height="65" valign="top" class="FormInsideTableRegCell">1.</td>
            <td valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"><strong>Review 
              Pathology</strong></td>
          </tr>
          <tr> 
            <td height="65" valign="top" class="FormInsideTableRegCell">2.</td>
            <td valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"><strong>CXR:</strong><br> 
              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">STM<img src="../../Images/shim.gif" border="0" width="22" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">AFP<img src="../../Images/shim.gif" border="0" width="22" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">HCG<img src="../../Images/shim.gif" border="0" width="22" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">LDH</td>
          </tr>
          <tr> 
            <td height="65" valign="top" class="FormInsideTableRegCell">3.</td>
            <td valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"><strong>CT:</strong><br> 
              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Chest<img src="../../Images/shim.gif" border="0" width="22" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Abdomen<img src="../../Images/shim.gif" border="0" width="22" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Pelvis</td>
          </tr>
          <tr> 
            <td height="65" valign="top" class="FormInnerRowRightBorder">4.</td>
            <td valign="top">&nbsp;</td>
          </tr>
          <!--<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">4.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">5.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">6.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
 					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">7.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">8.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">9.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">10.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr> -->
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="1">
          <tr> 
            <td><span class="blackBoldText">&nbsp;Procedures Planned</span><span></span></td>
          </tr>
          <tr> 
            <td height="21" class="FormInnerRowTopBorder"> &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="absbottom"> 
              Surgery Scheduled<img src="../../Images/shim.gif" border="0" width="22" height="1">Surgery 
              Type:<img src="../../Images/shim.gif" border="0" width="12" height="1">_________________________<img src="../../Images/shim.gif" border="0" width="22" height="1">Surgery 
              Date:<img src="../../Images/shim.gif" border="0" width="12" height="1">___/___/___            </td>
          </tr>
          <tr> 
            <td height="21" class="FormInnerRowTopBorder"> &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="absbottom"> 
              Patient Education<span><img src="../../Images/shim.gif" border="0" width="15" height="1"></span>Specify__________&nbsp;&nbsp;&nbsp;<img src="../../Images/shim.gif" border="0" width="22" height="1"> 
              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="absbottom"> 
              Other Intervention<span><img src="../../Images/shim.gif" border="0" width="15" height="1"></span>Specify__________            </td>
          </tr>
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
      <td class="FormOuterTableRow"><table class="pageWidth" align="center" border="0" cellpadding="4" cellspacing="0">
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
                <tr>
                  <td height="17">Chemo Orders:</td>
                  <td align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1" />Yes:</td>
                  <td>____________________________________</td>
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
            <td width="50%" height="100" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="1" height="11">Describe 
              Counseling or Dictate Note:<br> <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="22" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5            </td>
            <td width="50%">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ 
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
          <tr>
            <td colspan="4"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Attending 
              Addendum:&nbsp;&nbsp;&nbsp;____________________________________________________________________<br />
            </span></td>
          </tr>
          <tr>
            <td colspan="4"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="136" height="1" />____________________________________________________________________</span></td>
          </tr>
          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
                  <td>I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                      <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU09<img src="../../Images/shim.gif" border="0" width="45" height="1">U13<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">7</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>

</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>