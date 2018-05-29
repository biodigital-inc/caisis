<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.UroGenConsult" CodeFile="UroGenConsult.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>

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
		<div  class="VerticalBarCodeDocType">*U49*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Consult<br/></span></td>
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
      <td class="FormOuterTableRow"><table width="100%" border="0" cellpadding="4" cellspacing="0">
          <tr>
            <td colspan="2" align="left" valign="middle" class="FormInnerRowBottomBorder"><span class="blackBoldText">Category of Service</span></td>
          </tr>
          <tr>
            <td width="20%" align="left" valign="top" class="FormInsideTableRegCell" style="padding-left:15px;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop" /> Consultation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td width="80%" class="FormInnerRowBottomBorder"><table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td  style="padding-left: 4px; line-height: 24px;" > Consultation is requested by _________________________ MD/PA/NP for my advice &amp; opinion<br />
                    regarding this patient&rsquo;s ______________________________________________________</td>
                </tr>
            </table></td>
            <!--<td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Office Consultation is requested by _________________________ MD/PA/NP for my advice & opinion<br />
					<img src="../../Images/shim.gif" border="0" width="4" height="1">regarding this patient&rsquo;s ______________________________________________________</td>-->
          </tr>
          <tr>
            <td valign="top" align="left" class="FormInnerRowRightBorder" style="padding-left:15px;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop" />&nbsp;Transfer of Care <br /></td>
            <td style="padding-left: 4px; line-height: 24px;">Transfer of care  is requested by _________________________ MD/PA/NP for the management<br/>
			of this patient&rsquo;s ______________________________________________________</td>
          </tr>
      </table></td>
    </tr>
    <tr bgcolor="#FFFFFF" > 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td align="left" valign="top" class="blackBoldText" style="height:70px;"><img src="../../Images/shim.gif" border="0" width="4" height="12">Chief 
              Complaint / Reason for Consultation </td>
          </tr>
        </table></td>
    </tr>
	<tr bgcolor="#FFFFFF" > 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td align="left" valign="top" class="blackBoldText" style="height:50px;"><img src="../../Images/shim.gif" border="0" width="4" height="12">Reason for Current Hospitalization </td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#FFFFFF" > 
      <td class="FormOuterTableRow" height="350" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">HPI</span><br />
        <table width="97%" border="0" cellpadding="0" cellspacing="0" id="BlankHPITable" runat="server" style="margin-left: 1%;">
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>


          <!--<tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>-->
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td > <table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">
                    NKA</span></td>
                </tr>
                <tr align="center"> 
                  <td width="40%" class="FormInsideTableRegCell">Allergen</td>
                  <td class="FormInnerRowBottomBorder">Reaction</td>
                </tr>
                <tr> 
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="30" class="FormInnerRowRightBorder">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU43<img src="../../Images/shim.gif" border="0" width="55" height="1">U49<img src="../../Images/shim.gif" border="0" width="55" height="1">CMIC 
        Approval Date: 9/10/09<img src="../../Images/shim.gif" border="0" width="55" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="55" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U49*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Consult<br/></span></td>
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
        </span></td>
    </tr>
    <tr>
      <td height="140" valign="top" class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr valign="top">
            <td colspan="2" class="FormInnerRowRightBorder"><span class="blackBoldText">Medical History / Comorbidities</span></td>
          </tr>
          <tr valign="top">
            <td width="68%" height="40" class="FormInsideTableTopCell" id="ComorbiditiesCell1" runat="server">1.</td>
            <td width="32%" rowspan="7" class="FormInsideTableTopCell"><input name="Comorbidity" type="checkbox" id="Comorbidity" />
              Coronary Artery Disease / MI<br/>
              <input name="Comorbidity2" type="checkbox" id="Comorbidity13" />
              Other Cardiac Disease __________<br/>
              <input name="Comorbidity3" type="checkbox" id="Comorbidity14" />
              Hypertension<br/>
              <input name="Comorbidity4" type="checkbox" id="Comorbidity15" />
              CVA<br/>
              <input name="Comorbidity5" type="checkbox" id="Comorbidity16" />
              Thromboembolic Events / DVT<br/>
              <input name="Comorbidity6" type="checkbox" id="Comorbidity17" />
              Pulmonary Disease / Asthma / COPD<br/>
              <input name="Comorbidity7" type="checkbox" id="Comorbidity18" />
              Diabetes (IDDM/NIDDM)<br/>
              <input name="Comorbidity8" type="checkbox" id="Comorbidity19" />
              Hypercholesterolemia<br/>
              <input name="Comorbidity9" type="checkbox" id="Comorbidity20" />
              Depression<br/>
              <input name="Comorbidity10" type="checkbox" id="Comorbidity21" />
              Back Pain / DJD<br/>
              <input name="Comorbidity11" type="checkbox" id="Comorbidity22" />
              Inflammatory Bowel Disease<br/>
              <input name="Comorbidity12" type="checkbox" id="Comorbidity23" />
              Diverticulitis<br/>
              <input name="Comorbidity112" type="checkbox" id="Comorbidity11" /> 
              Recurrent UTI
<br/>
<input name="Comorbidity122" type="checkbox" id="Comorbidity12" /> 
Urinary Calculi
</td>
          </tr>
          <tr valign="top">
            <td height="40" class="FormInsideTableRegCell" id="ComorbiditiesCell2" runat="server">2.</td>
          </tr>
          <tr valign="top">
            <td height="40" class="FormInsideTableRegCell"  id="ComorbiditiesCell3" runat="server">3.</td>
          </tr>
          <tr valign="top">
            <td height="40" class="FormInsideTableRegCell">4.</td>
          </tr>
          <tr valign="top">
            <td height="40" class="FormInsideTableRegCell">5.</td>
          </tr>
          <tr valign="top">
            <td height="40" class="FormInsideTableRegCell">6.</td>
          </tr>
          <tr valign="top">
            <td height="40" class="FormInnerRowRightBorder">7.</td>
          </tr>
      </table></td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="left" valign="top"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="16">Medical Therapies</span>
              <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="100" align="center" class="FormInsideTableTopCell">Start Date</td>
                  <td width="200" align="center" class="FormInsideTableTopCell">Agent<br/></td>
                  <td width="350" align="center" class="FormInsideTableTopCell">Notes</td>
                </tr>
                <asp:Repeater ID="SystemicTx" runat="server"> 
                  <ItemTemplate> 
                    <tr > 
                      <td height="26" class="FormInsideTableRegCell">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>
                        </strong></td>
                      <td height="26" class="FormInsideTableRegCell" style="padding-left:3px;"><strong>
                        <%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>
                        </strong>&nbsp;</td>
                      <td height="26" class="FormInnerRowBottomBorder">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "MedTxNotes") %>
                        </strong></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table>
             </td>
          </tr>
        </table>
       </td>
    </tr>
	<tr> 
      <td align="left" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Radiation Therapies</span><br/> 
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr align="center"  class="eFormInnerTableRow"> 
            <td width="70" class="FormInsideTableTopCell">Start Date</td>
            <td width="70" class="FormInsideTableTopCell">Stop Date</td>
            <td width="230" class="FormInsideTableTopCell">Location</td>
            <td width="70" class="FormInsideTableTopCell">Total Dosage</td>
            <td width="210" class="FormInsideTableTopCell">Findings</td>
          </tr>
          <asp:Repeater ID="XRT" runat="server"> 
            <ItemTemplate> 
              <tr> 
                <td height="26" class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText") %></strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxType") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %></strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %></strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxNotes") %></strong></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table>
		</td>
    </tr>
    <tr>
      <td height="80" valign="top" class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr valign="top">
            <td colspan="2" class="FormInnerRowRightBorder"><span class="blackBoldText">Surgical History </span></td>
          </tr>
          <tr valign="top">
            <td width="50%" height="38" class="FormInsideTableTopCell" id="SurgicalHistoryCell1" runat="server">1.            </td>
            <td width="50%" class="FormInsideTableTopCell">6.</td>
          </tr>
          <tr valign="top">
            <td height="38" class="FormInsideTableRegCell"  id="SurgicalHistoryCell2" runat="server">2.</td>
            <td class="FormInnerRowBottomBorder">7.</td>
          </tr>
          <tr valign="top">
            <td height="38" class="FormInsideTableRegCell"  id="SurgicalHistoryCell3" runat="server">3.</td>
            <td class="FormInnerRowBottomBorder">8.</td>
          </tr>
          <tr valign="top">
            <td height="38" class="FormInsideTableRegCell"  id="SurgicalHistoryCell4" runat="server">4.</td>
            <td class="FormInnerRowBottomBorder">9.</td>
          </tr>
          <tr valign="top">
            <td height="38" class="FormInnerRowRightBorder"  id="SurgicalHistoryCell5" runat="server">5.</td>
            <td>10.</td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td valign="top" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr valign="top">
            <td width="49%" class="FormInnerRowRightBorder"><span class="blackBoldText">Family 
              History</span><img src="../../Images/shim.gif" border="0" width="50" height="1" />
                        <input type="checkbox" name="famHxProstateCancerYes2" runat="server" id="famHxProstateCancerYes2"/>
              No known family history of ca<br />
              <table width="98%" border="0" cellspacing="0" cellpadding="0" id="BlankFamilyHistoryTable" runat="server">
                <tr>
                  <td><img src="../../Images/shim.gif" border="0" width="72" height="1" /></td>
                  <td><img src="../../Images/shim.gif" border="0" width="25" height="1" /></td>
                  <td><img src="../../Images/shim.gif" border="0" width="25" height="1" /></td>
                  <td><img src="../../Images/shim.gif" border="0" width="40" height="1" /></td>
                  <td><img src="../../Images/shim.gif" border="0" width="150" height="1" /></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="center">Y</td>
                  <td align="center">N</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>Ca History</td>
                  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  <td align="right">If Y:&nbsp;</td>
                  <td>No. 1&deg; relatives:&nbsp;&nbsp;_______</td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>No other relatives:&nbsp;_______</td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                  <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Side of Family:</td>
                </tr>
                <tr>
                  <td><img src="../../Images/shim.gif" border="0" width="10" height="22" /></td>
                  <td align="center" valign="bottom">&nbsp;</td>
                  <td align="center" valign="bottom">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;&nbsp;Maternal&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;&nbsp;Paternal</td>
                </tr>
                <tr valign="top">
                  <td colspan="5"><img src="../../Images/shim.gif" border="0" width="40" height="3" /></td>
                </tr>
                <tr valign="top">
                  <td>List Ca Types</td>
                  <td colspan="4" align="left">&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /> Breast&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /> Prostate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /> Testis<br />
                    &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /> Bladder&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /> Kidney<br />
                    &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /> Other: ____________</td>
                </tr>
                <tr>
                  <td colspan="5"><table width="312" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="../../Images/shim.gif" border="0" width="40" height="8" /></td>
                      <td><img src="../../Images/shim.gif" border="0" width="50" height="1" /></td>
                      <td><img src="../../Images/shim.gif" border="0" width="50" height="1" /></td>
                      <td><img src="../../Images/shim.gif" border="0" width="50" height="1" /></td>
                      <td><img src="../../Images/shim.gif" border="0" width="122" height="8" /></td>
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
                      <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                      <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                      <td align="center">______</td>
                      <td align="center">________________</td>
                    </tr>
                    <tr>
                      <td>Father</td>
                      <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                      <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
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
                      <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                      <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                      <td align="center">______</td>
                      <td align="center">________________</td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td colspan="5" style="padding-top: 10px;"><table width="100%" border="0" cellspacing="0" cellpadding="1">
                    <tr>
                      <td width="50%">History of Early Heart Disease </td>
                      <td class="FormInnerRowBottomBorder" style="border-color: #000000;">&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan="2" class="FormInnerRowBottomBorder" style="border-color: #000000;">&nbsp;</td>
                      </tr>
                  </table></td>
                </tr>
              </table>
              <br />            </td>
            <td width="51%"><p><span class="blackBoldText">Social History</span><br />
                    <br />
              Occupation: <br />
              <br />
              Marital Status:<img src="../../Images/shim.gif" border="0" width="100" height="1" />Children:<br />
              <img src="../../Images/shim.gif" border="0" width="1" height="12" /> <br />
              Tobacco Use: &nbsp;
              <input type="checkbox" name="Digitized222222" />
              None <br />
              <img src="../../Images/shim.gif" border="0" width="73" height="8" />
              <asp:Label ID="socHxTobaccoType" Runat="server">
                <input type="checkbox" name="Digitized2222" />
                Cigarettes <img src="../../Images/shim.gif" border="0" width="10" height="8" />
                <input type="checkbox" name="Digitized22222" />
                Cigar<img src="../../Images/shim.gif" border="0" width="10" height="1" />
                <input type="checkbox" name="Digitized22223" />
                Pipe</asp:Label>
              <br />
              <br />
              <img src="../../Images/shim.gif" border="0" width="75" height="1" />
              <input type="checkbox" name="Digitized222" />
              ______ packs / day for ______years<br />
              <img src="../../Images/shim.gif" border="0" width="75" height="1" />
              <input type="checkbox" name="Digitized23" />
              Year Quit:  ______ <br />
              <br />
              <br />
              Alcohol Use: <br />
              <br />
              Carcinogen Exposure: <br />
            </p></td>
          </tr>
      </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU43<img src="../../Images/shim.gif" border="0" width="55" height="1">U49<img src="../../Images/shim.gif" border="0" width="55" height="1">CMIC 
        Approval Date: 9/10/09<img src="../../Images/shim.gif" border="0" width="55" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="55" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U49*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Consult<br/></span></td>
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
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Review 
        of Systems</span><span class="smallGrayText">&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Review:<span class="smallGrayText"> &nbsp;&nbsp;</span>
        <input type="checkbox" name="Fellow22" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending22" value="Yes">
        Attending</span></span><br> 
        <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <!-- <tr class="eFormInnerTableRow">
						<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br></td>
						<td colspan="1" align="left" valign="top"></td>
					</tr> -->
          <tr> 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Not Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong> Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Disease<br>
              Related</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">General</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Fever</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr >
            <td height="26" align="left" class="FormInsideTableRegCell" >Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            </tr>
          <tr >
            <td height="26" align="left" class="FormInsideTableRegCell">Fatigue</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Headaches</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td rowspan="2" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
            <td height="26" align="left" class="FormInsideTableRegCell">Focal Weakness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Eyes</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Visual Problems</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">CV</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Angina</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td rowspan="2" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
            <td height="26" align="left" class="FormInsideTableRegCell">Palpitations</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Respiratory</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Cough</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td rowspan="3" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
            <td height="26" align="left" class="FormInsideTableRegCell">Shortness of Breath</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr > 
            <td height="26" align="left" class="FormInsideTableRegCell">Hemoptysis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">GI</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Nausea</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td rowspan="4" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
            <td height="26" align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr > 
            <td height="26" align="left" class="FormInsideTableRegCell">Abdominal Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr > 
            <td height="26" align="left" class="FormInsideTableRegCell">Rectal Bleeding</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td rowspan="10" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">GU</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Dysuria</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td rowspan="10" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Nocturia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Slow Stream</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          
          <tr>
            <td height="26" align="left" class="FormInsideTableRegCell">Urgency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr>
            <td height="26" align="left" class="FormInsideTableRegCell">Suprapubic Pain </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr>
            <td height="26" align="left" class="FormInsideTableRegCell">Split Stream  </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Flank Pain </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr>
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0" />Gyn</td>
            <td height="26" align="left" class="FormInsideTableRegCell">Vaginal Bleeding </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">MS</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Joint Pain</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Lower Extremity Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
		  <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Psych</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Anxiety/Depression</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Heme</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Rash</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Endo</td>
            <td height="26" align="left" class="FormInsideTableRegCell" >Heat/Cold Intolerance</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td rowspan="3" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Thirst</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInsideTableRegCell">Hot Flashes</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td align="left" valign="top" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Other</td>
            <td height="26" align="left" class="FormInnerRowRightBorder" >&nbsp;</td>
            <td align="center" class="FormInnerRowRightBorder" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowRightBorder" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td >&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="35" class="FormOuterTableRow">&nbsp; <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes"> 
        <span class="blackBoldText"> PFSH and ROS performed by:  ___________________________<img src="../../Images/shim.gif" border="0" width="10" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="10" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU43<img src="../../Images/shim.gif" border="0" width="55" height="1">U49<img src="../../Images/shim.gif" border="0" width="55" height="1">CMIC 
        Approval Date: 9/10/09<img src="../../Images/shim.gif" border="0" width="55" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="55" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U49*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Consult<br/></span></td>
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
      <td class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;<span class="smallGrayText"> 
        Clinician Performing Initial Exam: 
        
        <input type="checkbox" name="Fellow23" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending23" value="Yes">
        Attending</span> <br> 
        <table align="center" border="0" width="100%" cellpadding="3" cellspacing="0">
          <tr> 
            <td align="center" class="FormInsideTableTopLeftCell"><strong style="font-size: 12px;">System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong style="font-size: 12px;"> Elements of Examination </strong><strong></strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong style="font-size: 11px;">Normal</strong></td>
            <td width="30" align="center" class="FormInsideTableTopCell" style="font-size: 11px;"><strong>Abnormal</strong></td>
            <td class="FormInsideTableTopCell" style="font-size: 11px; text-align: center;"><strong>Attnd<br/>
              Performed</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong style="font-size: 12px;">Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Con</td>
            <td colspan="2" align="left" class="FormInsideTableRegCell">Vital Signs  Verified </td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" ></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" ></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" ></td>
            <td width="47%" rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          
          <tr class="eFormInnerTableRow">
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">General Appearance of Patient<!--<br />
              <span style="font-size: 10px;">(e.g. Development, Nutrition, Body Habitus, Deformities, Attention to Grooming)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
          </tr>
          
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInsideTableLeftCell">Head &amp; Face </td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Eyes&nbsp;</td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">ENT&nbsp;</td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Neck</td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Examination of Neck<!--<br />
              <span style="font-size: 10px;">(e.g. Masses, Overall Appearance, Symmetry, Trachael Position, Crepitus)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          
          <tr>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Examination of Thyroid<!--<br />
              <span style="font-size: 10px;">(e.g. Enlargement, Tenderness,<br />
              Symmetry, Mass)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
          </tr>
          
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Resp.</td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Assessment of Respiratory Effort<!--<br />
              <span style="font-size: 10px;">(e.g. Intercostal Retractions, Use of Accessory Muscles, Diaphragmatic Movement, Mass)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          
          <tr>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Auscultation of Lungs<!--<br />
              <span style="font-size: 10px;">(e.g. Breath Sounds, Adventitious <br />
              Sounds, Rubs)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;"></td>
            </tr>
          
          <tr>
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">C/V</td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Auscultation of Heart<!--<br />
              <span style="font-size: 10px;">(with notation of abnormal sounds <br />
              and murmurs)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          
          <tr class="eFormInnerTableRow">
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Examination of Peripheral Vascular System by Observation and Palpation</td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
          </tr>
          

          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">GI</td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Examination of Abdomen<!--<br />
              <span style="font-size: 10px;">(with notation of presence of masses <br />
              or tenderness)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td rowspan="4" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          
          <tr class="eFormInnerTableRow">
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Examination for Presence of Hernia </td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Examination of Liver and Spleen </td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
          </tr>
          
          <tr class="eFormInnerTableRow">
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Obtain Stool Sample for Occult Blood Test When Indicated </td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
          </tr>
          
          <tr>
            <td rowspan="11" align="left" valign="top" class="FormInsideTableLeftCell">GU Male </td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Examination of Anus and Perineum </td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td rowspan="11" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="left" valign="top" class="FormInsideTableRegCell">Examination of Genitalia </td>
            </tr>
          <tr>
            <td align="left" valign="top" class="FormInnerRowBottomBorder" style="width: 20px;">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Scrotum<!--<br />
              <span style="font-size: 10px;">(e.g. Lesions, Cysts, Rashes)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
          </tr>
          <tr>
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Epididymides<!--<br />
              <span style="font-size: 10px;">(e.g. Size, Symmetry, Masses)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Testes<!--<br />
              <span style="font-size: 10px;">(e.g. Size, Symmetry, Masses)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Urethral Meatus<!--<br />
              <span style="font-size: 10px;">(e.g. Size, Location, Lesions, Discharge)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Penis<!--<br />
              <span style="font-size: 10px;">(e.g. Lesions, Presence or Absence of Foreskin, Foreskin Retractability, Plaque, Masses, Scarring, Deformities)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td colspan="5" align="left" valign="top" class="FormInsideTableRegCell">Digital Rectal Examination </td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Prostate Gland<!--<br />
              <span style="font-size: 10px;">(e.g. Size, Symmetry, Nodularity, Tenderness)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Seminal Vesicles<!--<br />
              <span style="font-size: 10px;">(e.g. Symmetry, Temdermess, <br />
              Masses, Enlargement)</span>--></td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Sphincter Tone, Presence of Hemorrhoids, Rectal Masses </td>
            <td height="35"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU43<img src="../../Images/shim.gif" border="0" width="55" height="1">U49<img src="../../Images/shim.gif" border="0" width="55" height="1">CMIC 
        Approval Date: 9/10/09<img src="../../Images/shim.gif" border="0" width="55" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="55" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U49*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Consult<br/></span></td>
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
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Exam</span> continued<br> 
        <table align="center" border="0" width="100%" cellpadding="3" cellspacing="0">
          <tr> 
            <td align="center" class="FormInsideTableTopLeftCell"><strong style="font-size: 12px;">System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong style="font-size: 12px;"> Elements of Examination </strong><strong></strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong style="font-size: 11px;">Normal</strong></td>
            <td width="30" align="center" class="FormInsideTableTopCell" style="font-size: 11px;"><strong>Abnormal</strong></td>
            <td class="FormInsideTableTopCell" style="font-size: 11px; text-align: center;"><strong>Attnd<br/>
              Performed</strong></td>
            <td width="47%" align="center" class="FormInsideTableTopCell"><strong style="font-size: 12px;">Notes</strong></td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td rowspan="12" align="left" valign="top" class="FormInsideTableLeftCell">GU Female
              <!-- <span style="font-size: 10px;"><br/><br/>(Include at least 7 elements)</span> --></td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Inspection and Palpation<!--<br />
              of Breasts<br />
              <span style="font-size: 10px;">(e.g. Masses or Lumps, Tenderness, Symmetry, Nipple Discharge)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td rowspan="12" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Digital Rectal Examination<!--<br />
              <span style="font-size: 10px;">(including Sphincter Tone, Presence of Hemorrhoids, Rectal Masses)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td colspan="5" align="left" valign="top" class="FormInsideTableRegCell">Pelvic Examination<!--<br />
              <span style="font-size: 10px;">(with or without specimen collection for smears and cultures)</span>--></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder" style="width: 20px;">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">External Genitalia<!--<br />
              <span style="font-size: 10px;">(e.g. General Appearance, <br />
              Hair Distribution, Lesions)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Urethral Meatus<!--<br />
              <span style="font-size: 10px;">(e.g. Size, Location, Lesions, Prolapse)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Urethra<!--<br />
              <span style="font-size: 10px;">(e.g. Masses, Tenderness, Scarring)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Bladder<!--<br />
              <span style="font-size: 10px;">(e.g. Fullness, Masses, Tenderness)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Vagina<!--<br />
              <span style="font-size: 10px;">(e.g. General Appearance, Estrogen Effect, Discharge, Lesions, Pelvic Support, Cystocele, Rectocele)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Cervix<!--<br />
              <span style="font-size: 10px;">(e.g. General Appearance, <br />
              Lesions, Discharge)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Uterus<!--<br />
              <span style="font-size: 10px;">(e.g. Size, Contour, Position, Mobility, Tenderness, Consistency, Descent or Support)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Adnexa / Parametria<!--<br />
              <span style="font-size: 10px;">(e.g. Masses, Tenderness, Organomegaly, Nodularity)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Anus and Perineum </td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInsideTableLeftCell">Breasts</td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Inspect for Nodules, Tenderness </td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInsideTableLeftCell">Lymph</td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Palpation of Lymph Nodes in Neck, Axillae, Groin and/or Other Location </td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInsideTableLeftCell">M/S</td>
            <td height="40" colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Inspect for CVAT or Point Bone Tenderess</td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInsideTableLeftCell" >Extremities</td>
            <td height="40" colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Inspect for Clubbing, Cyanosis, Edema and Pulses</td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td colspan="2" align="left" valign="top" class="FormInsideTableRegCell">Inspection and/or Palpation of Skin and Subcutaneous Tissue<!--<span style="font-size: 10px;">(e.g. Rashes, Lesions, Ulcers)</span>-->, Skin Turgor </td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Neuro / Psych </td>
            <td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell">Brief Assessment of Mental Status </td>
            <td rowspan="3" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Orientation<!--<br />
              <span style="font-size: 10px;">(e.g.Time, Place, and Person)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Mood and Affect<!--<br />
                <span style="font-size: 10px;">(e.g. Depression, Anxiety, Agitation)</span>--></td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Other:<br></td>
            <td height="40" colspan="2" align="left" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInsideTableLeftCell">&nbsp;</td>
            <td height="40" colspan="2" align="left" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInsideTableLeftCell">&nbsp;</td>
            <td height="40" colspan="2" align="left" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInsideTableLeftCell">&nbsp;</td>
            <td height="40" colspan="2" align="left" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td height="39"  align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px;" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU43<img src="../../Images/shim.gif" border="0" width="55" height="1">U49<img src="../../Images/shim.gif" border="0" width="55" height="1">CMIC 
        Approval Date: 9/10/09<img src="../../Images/shim.gif" border="0" width="55" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="55" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U49*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Consult<br/></span></td>
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
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Lab 
        Tests</span><br> <table align="center" border="0"  class="pageWidth" cellpadding="4" cellspacing="0">
          
          <tr align="center"> 
            <td width="14%" class="FormInsideTableTopCell"><strong>Date</strong></td>
            <td width="19%" class="FormInsideTableTopCell"><strong>Test</strong></td>
            <td width="17%" height="12" class="FormInsideTableTopCell"><strong>Result</strong></td>
            <td width="14%" class="FormInsideTableTopLeftCell"><strong>Date</strong></td>
            <td width="19%" class="FormInsideTableTopCell"><strong>Test</strong></td>
            <td width="17%" class="FormInsideTableTopCell"><strong>Result</strong></td>
            </tr>
          <tr class="FormInsideTableRegCell"> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr class="FormInsideTableRegCell"> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr class="FormInsideTableRegCell"> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr class="FormInsideTableRegCell"> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr class="FormInsideTableRegCell"> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr class="FormInsideTableRegCell">
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="FormInsideTableRegCell">
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="FormInsideTableRegCell">
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="FormInsideTableRegCell">
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="FormInsideTableRegCell">
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span><span><img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Films Reviewed">
        Films Reviewed<br>
        </span> <table align="center" border="0"  class="pageWidth" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="35%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td width="35%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <tr> 
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="50" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <!---<tr class="eFormInnerTableRow">
						<td height="18">&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>--->
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU43<img src="../../Images/shim.gif" border="0" width="55" height="1">U49<img src="../../Images/shim.gif" border="0" width="55" height="1">CMIC 
        Approval Date: 9/10/09<img src="../../Images/shim.gif" border="0" width="55" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">6</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="55" height="1">ASMNTS</td>
    </tr>
  </table>
</div>
<div  align="left"  style="page-break-after:always;"  id="LastPageInForm" runat="server"><%--align="left" --%>

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U49*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Consult<br/></span></td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0"  class="pageWidth" cellpadding="4" cellspacing="0">
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
            <td height="70" valign="top" class="FormInsideTableRegCell">1.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="70" valign="top" class="FormInsideTableRegCell">2.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="70" valign="top" class="FormInsideTableRegCell">3.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="70" valign="top" class="FormInsideTableRegCell">4.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="70" valign="top" class="FormInnerRowRightBorder">5.</td>
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
      <td height="130" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Additional Comments</span><br />
        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" runat="server">
          <tr>
            <td height="28" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          
          <tr>
            <td height="28" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="28" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
		  <tr>
            <td height="28" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="28" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
		  <tr>
            <td height="28" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="28" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          
          <!--<tr> 
                  <td height="22" class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>-->
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
      <td valign="top" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td valign="top" class="FormInnerRowRightBorder"><input type="checkbox" name="50% of Time22" />
              &gt; 50% of attending time was spent in counseling. If so, mark total attending time in minutes &amp; describe below.<br/>
                         <table width="86%" border="0" align="center" cellpadding="0" cellspacing="0">
                           <tr>
                             <td width="20%"><input type="checkbox" name="15-24 (3)2222" />
                               10-19 (1) </td>
                             <td width="20%" ><input type="checkbox" name="15-24 (3)22422" />
                               20-29 (2) </td>
                             <td width="20%" ><input type="checkbox" name="40+ (5)222" />
                              30-44 (3) </td>
                             <td width="20%"><input type="checkbox" name="15-24 (3)2232" />
                               45-59 (4)</td>
                             <td width="20%" ><input type="checkbox" name="25-39 (4)222" />
                               60+ (5) </td>
                           </tr>
                       </table></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td valign="top" class="FormOuterTableRow" style="padding: 4px;"><strong>Describe 
              Counseling or Dictate Note:</strong><br />
              <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-top:6px; margin-left: 18px;">
                <tr>
                  <td align="left" valign="middle"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Risk / Benefits of Surgery</td>
                  <td align="left" valign="middle"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Radiology Findings</td>
                  <td align="left" valign="middle" style="padding-top:5px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Pathology Findings </td>
                  <td align="left" valign="middle" style="padding-top:5px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Above Treatment Plan </td>
                </tr>

                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
              </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="22" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5            </td>
            <td width="50%" rowspan="2">Copy to:&nbsp;&nbsp;&nbsp; <input name="fellow222" type="checkbox" id="fellow223">
              referring M.D.: ________________________<br> <img src="../../Images/shim.gif" border="0" width="50" height="1"> 
              <input name="fellow2222" type="checkbox" id="fellow2222">
              other: _______________________________</td>
          </tr>
          <tr> 
            <td height="22" class="FormInnerRowRightBorder">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ 
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
            <td align="left"><span class="blackBoldText" style="white-space: nowrap;">_____________________________<img src="../../Images/shim.gif" border="0" width="35" height="1" />Pager: ___________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          
          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
                  <td>I have seen and examined the patient.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                      <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ___________________________<img src="../../Images/shim.gif" border="0" width="25" height="1" />Pager: ___________<img src="../../Images/shim.gif" border="0" width="25" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="20" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU43<img src="../../Images/shim.gif" border="0" width="55" height="1">U49<img src="../../Images/shim.gif" border="0" width="55" height="1">CMIC 
        Approval Date: 9/10/09<img src="../../Images/shim.gif" border="0" width="55" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">7</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="55" height="1">ASMNTS</td>
    </tr>
  </table>
</div>


</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>