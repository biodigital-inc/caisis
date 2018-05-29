<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.UroUrinFuncNP" CodeFile="UroUrinFuncNP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>



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
		<div  class="VerticalBarCodeDocType">*U20*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Urinary Function New Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
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
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are referred solely for management and/or treatment of aspect of care<br />            </td>
          </tr>
          <tr>
            <td valign="top" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop" />&nbsp;Office Consultation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
              (CPT 99241- 99245)</td>
            <td class="FormInnerRowBottomBorder"><table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td class="FormInnerRowBottomBorder" colspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Office Consultation is requested by _________________________ MD/PA/NP for my advice &amp; opinion<br />
                      <img src="../../Images/shim.gif" border="0" width="4" height="1" />regarding this patient&rsquo;s ______________________________________________________</td>
                </tr>
                <tr>
                  <td colspan="2"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                      <tr >
                        <td align="left" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Requesting&nbsp;M.D.:
                          <asp:Repeater ID="ReferringMD" runat="server" >
                              <ItemTemplate> <%# DataBinder.Eval(Container.DataItem, "phFirstName") %> <%# DataBinder.Eval(Container.DataItem, "phLastName") %> ( <%# DataBinder.Eval(Container.DataItem, "phInstitution") %> )</ItemTemplate>
                            <SeparatorTemplate>, </SeparatorTemplate>
                          </asp:Repeater>
                            <asp:Label ID="blankReferrringMD" Runat="server"></asp:Label>                        </td>
                      </tr>
                  </table></td>
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
      <td class="FormOuterTableRow" height="30" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Chief Complaint</span></td>
    </tr>
    <tr> 
      <td height="200" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">HPI</span></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr valign="top"> 
            <td height="55" class="FormInnerRowRightBorder"><span class="blackBoldText">Past 
              Medical History / Comorbidities</span> <br> <img src="../../Images/shim.gif" border="0" width="1" height="3"><br> 
              <asp:Repeater ID="comorbidities" runat="server"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
                  - <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>
                  </strong> </ItemTemplate>
                <SeparatorTemplate>;&nbsp; &nbsp; &nbsp; </SeparatorTemplate>
              </asp:Repeater> </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="50" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Surgical History</span></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td > 
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">NKA&nbsp;&nbsp;</span></td>
                </tr>
                <tr align="center"> 
                  <td width="40%" height="15" class="FormInsideTableRegCell">Allergen</td>
                  <td class="FormInnerRowBottomBorder">Reaction</td>
                </tr>
                <asp:Repeater ID="allergies" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td class="FormInsideTableRegCell">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "Allergen") %>
                        </strong></td>
                      <td class="FormInnerRowBottomBorder">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %>
                        </strong></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU16<img src="../../Images/shim.gif" border="0" width="45" height="1">U20<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 9/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U20*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Urinary Function New Patient<br/></span></td>
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
      <td  height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr >
      <td valign="top" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="3">
          <tr valign="top">
            <td width="49%" class="FormInnerRowRightBorder"><span class="blackBoldText">Family History:</span><img src="../../Images/shim.gif" border="0" width="50" height="1" />
                <input type="checkbox" name="famHxProstateCancerYes2" runat="server" id="famHxProstateCancerYes2"/>
              No known family history of ca
              <table width="98%" border="0" cellspacing="0" cellpadding="0" id="BlankFamilyHistoryTable" runat="server">
                  <tr>
                    <td><img src="../../Images/shim.gif" border="0" width="23%" height="1" /></td>
                    <td><img src="../../Images/shim.gif" border="0" width="8%" height="1" /></td>
                    <td><img src="../../Images/shim.gif" border="0" width="8%" height="1" /></td>
                    <td><img src="../../Images/shim.gif" border="0" width="13%" height="1" /></td>
                    <td><img src="../../Images/shim.gif" border="0" width="48%" height="1" /></td>
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
                    <td><img src="../../Images/shim.gif" border="0" width="10" height="30" /></td>
                    <td align="center" valign="bottom">Y</td>
                    <td align="center" valign="bottom">N</td>
                    <td>&nbsp;</td>
                    <td valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;&nbsp;Maternal&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;&nbsp;Paternal</td>
                  </tr>
                  <tr valign="top">
                    <td>Other Ca</td>
                    <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="right">List:&nbsp;</td>
                    <td>&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /> Breast&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /> Prostate<br />
                      &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /> Kidney&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Testis<br />
                      &nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />Other: ____________</td>
                  </tr>
                  <tr>
                    <td colspan="5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><img src="../../Images/shim.gif" border="0" width="13%" height="8" /></td>
                          <td><img src="../../Images/shim.gif" border="0" width="16%" height="1" /></td>
                          <td><img src="../../Images/shim.gif" border="0" width="16%" height="1" /></td>
                          <td><img src="../../Images/shim.gif" border="0" width="16%" height="1" /></td>
                          <td><img src="../../Images/shim.gif" border="0" width="39%" height="8" /></td>
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
                          <td>Other</td>
                          <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                          <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                          <td align="center">______</td>
                          <td align="center">________________</td>
                        </tr>
                    </table></td>
                  </tr>
                </table>
              <br />
                <asp:Repeater ID="familyHistory" runat="server" OnItemCreated="FamilyHistoryItemCreated">
                  <ItemTemplate> <strong> <%# DataBinder.Eval(Container.DataItem, "FamMemNum") %> <%# DataBinder.Eval(Container.DataItem, "FamMemRelation") %>
                        <asp:Label ID="FamMemSide" Runat="server">( <%# DataBinder.Eval(Container.DataItem, "FamMemSide") %> )</asp:Label>
                    </strong>
                      <asp:Label ID="FamMemDiagnosis" Runat="server" >with <%# DataBinder.Eval(Container.DataItem, "FamMemDiagnosis") %> </asp:Label>
                      <br />
                  </ItemTemplate>
                </asp:Repeater>            </td>
            <td width="51%"><p><span class="blackBoldText">Social History:</span><br />
                  <img src="../../Images/shim.gif" width="1" height="5" hspace="0" vspace="0" border="0" /><br />
              Occupation:
              <asp:Label ID="socHxOccupation" Runat="server" />
              <br />
              <img src="../../Images/shim.gif" width="1" height="5" hspace="0" vspace="0" border="0" /><br />
              Marital Status:
              <asp:Label ID="socHxMaritalStatus" Runat="server" />
              <img src="../../Images/shim.gif" border="0" width="60" height="1" />Children:
              <asp:Label ID="socHxChildren" Runat="server" />
              <br />
              <img src="../../Images/shim.gif" width="1" height="5" hspace="0" vspace="0" border="0" /><br />
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
              <img src="../../Images/shim.gif" border="0" width="73" height="1" />
              <input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" name="socHxTobaccoPacksPerDayCheckBox"/>
              <asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label>
              packs / day for
              <asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label>
              years<br />
              <img src="../../Images/shim.gif" border="0" width="73" height="1" />
              <input type="checkbox" id="socHxTobaccoQuitYearCheckbox" runat="server" name="socHxTobaccoQuitYearCheckbox"/>
              Quit:
              <asp:Label ID="socHxTobaccoQuitYear" Runat="server">______ years 
                ago</asp:Label>
              <br />
              <br />
              Alcohol Use:
              <asp:Label ID="socHxAlcohol" Runat="server" />
              <br />
              <img src="../../Images/shim.gif" width="1" height="5" hspace="0" vspace="0" border="0" /> <br />
              Carcinogen Exposure:
              <asp:Label ID="socHxCarcinogen" Runat="server" />
              <br />
              Caffeine Use: </p></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr >
            <td colspan="2" valign="top" class="blackBoldText"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Lab 
              Tests</span> </td>
          </tr>
          <tr >
            <td valign="top" class="FormInnerRowRightBorder" width="50%"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="FormInnerRowRightBorder">
                <tr>
                  <td width="25%" height="15" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Lab Test</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Data Source</td>
                </tr>
                <asp:Repeater ID="labTests" runat="server">
                  <ItemTemplate>
                    <tr>
                      <td height="22" align="center" class="FormInsideTableLeftCell">&nbsp; <%# DataBinder.Eval(Container.DataItem, "LabDateText") %> </td>
                      <td class="FormInsideTableRegCell" align="center">&nbsp; <%# DataBinder.Eval(Container.DataItem, "LabTest") %> </td>
                      <td class="FormInsideTableRegCell" align="center">&nbsp; <%# DataBinder.Eval(Container.DataItem, "LabResult") %> </td>
                      <td class="FormInsideTableRegCell" align="center">&nbsp; <%# DataBinder.Eval(Container.DataItem, "LabQuality") %> </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
            </table></td>
            <td valign="top" class="blackBoldText" width="50%"><table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr >
                  <td width="25%" height="15" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Lab Test </td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Data Source</td>
                </tr>
                <tr >
                  <td height="22" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1" /></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr >
                  <td height="22" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1" /></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr >
                  <td height="22" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1" /></span>/</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span><span><img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Films Reviewed">
        Films Reviewed<br>
        </span> <table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="16%" height="20" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="19%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="19%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td width="46%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <asp:Repeater ID="images" runat="server">
			<ItemTemplate>
          <tr> 
                <td height="22" class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong></td>
            <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxType") %></strong></td>
            <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxResult") %></strong></td>
            <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxNotes") %></strong></td>
          </tr>
			</ItemTemplate>
			</asp:Repeater>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU16<img src="../../Images/shim.gif" border="0" width="45" height="1">U20<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 9/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U20*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Urinary Function New Patient<br/></span></td>
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
      <td  height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr > 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="6" align="left" valign="top" ><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Review 
              of Systems</span><span class="smallGrayText">&nbsp;&nbsp;<span class="smallGrayText">Clinician 
              Performing Review:<span class="smallGrayText"> &nbsp;&nbsp; 
              <input type="checkbox" name="PA22" value="Yes">
              NP / </span>PA&nbsp;&nbsp;&nbsp; 
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
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">General</td>
            <td align="left" class="FormInsideTableRegCell" >Fever</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro</td>
            <td align="left" class="FormInsideTableRegCell" >CVA</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="3" align="left" valign="bottom" class="FormInnerRowBottomBorder">If SCI: Level:&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Lumbar<img src="../../Images/shim.gif" border="0" width="8" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Cervical<img src="../../Images/shim.gif" border="0" width="8" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Sacral</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">LE Weakness / Paresthesia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Spinal Disease</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Eyes</td>
            <td align="left" class="FormInsideTableRegCell" >Vision Changes</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell" >Glaucoma</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">CV</td>
            <td align="left" class="FormInsideTableRegCell" >Angina</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Palpitations</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Peripheral Edema</td>
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
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Shortness of Breath</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Hemoptysis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">GI</td>
            <td align="left" class="FormInsideTableRegCell" >Nausea</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="5" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
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
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Stool Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="8" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">GU</td>
            <td align="left" class="FormInsideTableRegCell" >Frequency / Urgency</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="8" valign="top" class="FormInnerRowBottomBorder" >&nbsp;<br>Urinary QOL Score (Q1-Q3):________ / 15<br>Sexual QOL Score (Q5-Q6):________ / 12<br>
              Pads:________<br> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="FormOuterTableTopRow">
                <tr > 
                  <td colspan="4"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Urinary Function Survey </span></td>
                </tr>
                <tr > 
                  <td width="48" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
                  <td width="97" align="center" valign="middle" class="FormInsideTableTopCell">Code</td>
                  <td width="48" align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td width="130" align="center" valign="middle" class="FormInsideTableTopCell">Comments</td>
                </tr>
                <tr > 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">IPSS 
                    Symptoms</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr > 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">Continence 
                    (1-5)</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr > 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr > 
                  <td colspan="4"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                      <tr > 
                        <td colspan="2" align="left" class="smallGrayText">Continence 
                          Codes:</td>
                      </tr>
                      <tr > 
                        <td class="smallGrayText">1 - </td>
                        <td class="smallGrayText">Continent (No pads)</td>
                      </tr>
                      <tr > 
                        <td class="smallGrayText">2 - </td>
                        <td class="smallGrayText">Mild SUI (Leaks only during 
                          heavy activity/ 1-2 pads)</td>
                      </tr>
                      <tr > 
                        <td class="smallGrayText">3 - </td>
                        <td class="smallGrayText">Moderate SUI (Leaks with moderate 
                          activity/ (3-4 pads)</td>
                      </tr>
                      <tr > 
                        <td class="smallGrayText">4 - </td>
                        <td class="smallGrayText">Severe SUI (Leaks during norm. 
                          activity, dry at night &amp; rest)</td>
                      </tr>
                      <tr > 
                        <td class="smallGrayText">5 - </td>
                        <td class="smallGrayText">Total incontinence (Continuous 
                          leakage of urine at rest)</td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Nocturia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Dysuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Slow Stream</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Infection</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Erectile Function 
              / Peyronies</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
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
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Heme</td>
            <td align="left" class="FormInsideTableRegCell" >Anemia</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
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
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Endo</td>
            <td align="left" class="FormInsideTableRegCell">Heat/cold Intolerance</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="4" align="center" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
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
            <td align="left" class="FormInsideTableRegCell">Diabetes Mellitus</td>
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
        </table></td>
    </tr>
    <tr> 
      <td height="35" class="FormOuterTableRow">&nbsp; <input name="HistoryROSReview2" type="checkbox" id="HistoryROSReview2" value="Yes"> 
        <span class="blackBoldText"> PFSH and ROS performed by: ___________________________________ 
        &nbsp;&nbsp;&nbsp;&nbsp;Date: ____/____/____&nbsp;&nbsp;&nbsp;Time:___:____ <span style="font-size: 9px;">AM / PM </span></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU16<img src="../../Images/shim.gif" border="0" width="45" height="1">U20<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 9/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U20*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Urinary Function New Patient<br/></span></td>
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
    <tr > 
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
          <tr > 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
              Symptom</strong><strong>s</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Attnd<br>
              Performed</strong></td>
            <td width="240" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr > 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">General</td>
            <td width="200" height="18" align="left" class="FormInnerRowBottomBorder">Well 
              Developed / Well Nourished</td>
            <td width="40" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td width="240" rowspan="3" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">No Acute 
              Distress</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">Alert 
              &amp; Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Eyes&nbsp;</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder">No Scleral 
              Icterus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">ENT&nbsp;</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Mucositis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">Mucous 
              Membrane Moist</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Thrush</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Nodes</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder"> Normal 
              Supraclavicular</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> Normal 
              Axillary</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td align="left" valign="top" class="FormInsideTableRegCell">Respiratory</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder">Clear 
              to Percusion<br>
              and Auscultation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">C/V</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">Regular 
              Rate &amp; Rhythm</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Murmurs</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Abdomen</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder">Soft 
              Non-tender</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> Normal 
              Bowel Sounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Hepatosplenomegaly</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">No Ascites</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">No Hernia            </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Back</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Spinal Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              CVA Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">GU<br> 
              <img src="../../Images/shim.gif" border="0" width="4" height="0">Male</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder">Testes 
              w/o Tenderness or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" align="left" valign="top" class="FormInnerRowBottomBorder"> 
              &nbsp;Circumcised: <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Yes &nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              No<br> <br> <br> &nbsp;Prostate Weight: ___________ g</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">No Palpable 
              Penile Plaque or Fibrosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">Normal 
              Scrotum / Testis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">Normal 
              Rectal Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">GU<br> 
              <img src="../../Images/shim.gif" border="0" width="4" height="0">Female</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder">No Vulvar 
              Cyst / Masses </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">No Vaginal 
              Atrophy</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">No Prolapse</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">No Leak 
              with Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">M/S</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Clubbing or Cyanosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Cord</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Leg Swelling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder"> Normal 
              Motor Function</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> Normal 
              Sensation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder">Cran 
              Nerve II-XII Intact</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin</td>
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Rash or Ulcers</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="18" align="left" class="FormInnerRowBottomBorder"> No 
              Nodules</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr > 
            <td height="16" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other<br></td>
            <td colspan="5" align="left">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="32" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td width="3%" valign="middle"><input type="checkbox" name="No24322" />
            </td>
            <td valign="middle">Measurement of post void residual was performed by Ultrasound.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>_________ milliliters</strong></td>
          </tr>
          <tr>
            <td colspan="2" valign="middle"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="3">
                <tr>
                  <td height="36"><span class="blackBoldText">Signature:</span> ____________________________________<img src="../../Images/shim.gif" border="0" width="30" height="1" /><span class="blackBoldText">Date:</span> ____/____/____<img src="../../Images/shim.gif" border="0" width="30" height="1" /><span class="blackBoldText">Time:</span>_____:______ <span style="font-size: 9px;">AM / PM </span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    </tr>
    <tr bgcolor="#FFFFFF" > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU16<img src="../../Images/shim.gif" border="0" width="45" height="1">U20<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 9/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>
<div  align="left"  style="page-break-after:always;"  id="LastPageInForm" runat="server" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U20*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Urinary Function New Patient<br/></span></td>
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
      <td height="20" bgcolor="#FFFFFF" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr > 
      <td class="FormOuterTableRow"><table align="center" border="0" class="pageWidth" cellpadding="4" cellspacing="0">
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
            <td height="40" valign="top" class="FormInsideTableRegCell">1.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="40" valign="top" class="FormInsideTableRegCell">2.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="40" valign="top" class="FormInsideTableRegCell">3.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="40" valign="top" class="FormInsideTableRegCell">4.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="40" valign="top" class="FormInnerRowRightBorder">5.</td>
            <td>&nbsp;</td>
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
    <tr > 
      <td colspan="8" class="FormOuterTableRow" > <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="13">Procedures 
        Planned</span><span> </span> <table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
          <tr > 
            <td height="20" colspan="3" class="FormInsideTableTopCell"><span> 
              <input type="checkbox" name="Surgery Scheduled" value="Yes">
              Surgery Scheduled<img src="../../Images/shim.gif" border="0" width="30" height="1">Surgery 
              Date:<img src="../../Images/shim.gif" border="0" width="12" height="1">___/___/___</span>            </td>
          </tr>
          <tr class="FormInnerRowBottomBorder" > 
            <td width="25%" height="20"> <input type="checkbox" name="eMRI" value="Yes">
              MRI</td>
            <td width="25%"> <input type="checkbox" name="Nerve Graft" value="Yes">
              Cystoscopy</td>
            <td> <input type="checkbox" name="Laparoscopic" value="Yes">
              Urodynamics </td>
          </tr>
          <tr > 
            <td height="20" colspan="2"> <input type="checkbox" name="Patient Education" value="Yes">
              Patient Education - Specify:</td>
            <td colspan="3"> <input type="checkbox" name="Other Intervention" value="Yes">
              Labs: ___________________________________</td>
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
    <tr >
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
            <td colspan="4"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Attending Addendum:&nbsp;&nbsp;&nbsp;____________________________________________________________________<br />
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
    <tr> 
      <td height="14" align="center" valign="bottom" bgcolor="#FFFFFF" class="blackBoldText">GU16<img src="../../Images/shim.gif" border="0" width="45" height="1">U20<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 9/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
  </div>

</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>