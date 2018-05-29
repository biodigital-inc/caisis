<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.GUProsFU" CodeFile="GUProsFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


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
		<div  class="VerticalBarCodeDocType">*U19*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
			GU Prostate Follow-Up Patient<br/></span></td>
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
            <td colspan="8" valign="bottom" class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Date: <% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
      <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="left" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">Referring&nbsp;M.D.: 
            <asp:Repeater ID="ReferringMD" runat="server" >
				<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "phFirstName") %> <%# DataBinder.Eval(Container.DataItem, "phLastName") %> (<%# DataBinder.Eval(Container.DataItem, "phInstitution") %>)</ItemTemplate><SeparatorTemplate>, </SeparatorTemplate>
			</asp:Repeater>
			<asp:Label ID="blankReferrringMD" Runat="server"></asp:Label>		  </td>
         </tr>
        </table>       </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="71%" height="400" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">HPI / Diagnosis / Stage</span><br/> 
		<table cellpadding="4" cellspacing="0" border="0">
		<tr>
			<td class="HPIText" valign="top">
				<asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound">
				<ItemTemplate>
					<%# DataBinder.Eval(Container.DataItem, "patientHPI") %><br/><asp:Literal ID="StartNextHpiColumn" Runat="server" />
				</ItemTemplate>
				</asp:Repeater>
				<asp:Label ID="PreTxPot" Runat="server" />			</td>
		</tr>
		</table>
		
		</td>
            <td width="29%" align="left"  valign="top"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Current Disease State</span><br/> 
              <table align="right" border="0" width="100%" cellpadding="0" cellspacing="0" >
                <tr> 
                  <td align="left"><input type="checkbox" name="NED" id="NED" value="No Evidence of Disease" runat="server">
                    No Cancer DX </td>
                </tr>
				<tr> 
                  <td align="left"><input type="checkbox" name="Localized" id="Localized" value="Localized" runat="server">
                    Localized</td>
                </tr>
<%--				<tr> 
                  <td align="left"><input type="checkbox" name="LocalizedWPelvicNodes" id="LocalizedWPelvicNodes" value="Localized with Pelvic Nodes" runat="server">
                    Localized w/ Pelvic Nodes</td>
                </tr> --%>
                <tr> 
                  <td align="left"><input type="checkbox" name="RisingPSA_NonCastrate" id="RisingPSA_NonCastrate"  value="Rising PSA: Non-Castrate" runat="server">
                    Rising PSA: Non-Castrate</td>
                </tr>
                <tr>
                  <td align="left"><input type="checkbox" name="RisingPSA_Castrate"  id="RisingPSA_Castrate" value="Rising PSA: Castrate"  runat="server" />
                    Rising PSA: Castrate</td>
                </tr>
                <tr> 
                  <td align="left"><input type="checkbox" name="ClinMetsNonCastrate"  id="ClinMetsNonCastrate" value="Clin Mets: Non-Castrate" runat="server">
                    Clin Mets: Non-Castrate</td>
                </tr>
                <tr> 
                  <td  align="left"><input type="checkbox" name="ClinMetsCastrate"  id="ClinMetsCastrate" value="Clin Mets: Castrate" runat="server">
                    Clin Mets: Castrate</td>
                </tr>
                <tr> 
                  <td  align="left" height="22"><img src="../../Images/shim.gif" border="0" width="24" height="22">Change:<img src="../../Images/shim.gif" border="0" width="12" height="1">Y<img src="../../Images/shim.gif" border="0" width="12" height="1">N</td>
                </tr>
              </table>			 </td>
          </tr>
          <tr>
            <td  valign="top" align="left" style="padding-top: 10px; border-top: solid 1px #999999;">&nbsp;<span class="blackBoldText">Known Sites of Disease<br />
            </span>
              <table width="100%" border="0" cellspacing="0" cellpadding="1" style="font-size: smaller;">
                <tr>
                  <td align="center" class="FormInsideTableTopCell" ><strong>Site </strong></td>
                  <td width="26%" align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
                  <td width="26%" align="center" class="FormInsideTableTopCell"><strong>Absent</strong></td>
                </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Bone</td>
                  <td align="center" class="FormInsideTableRegCell"><img id="Bone_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img id="Bone_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
  <!--              <tr>
                  <td align="center" class="FormInsideTableRegCell">Soft Tissue </td>
                  <td align="center" class="FormInsideTableRegCell"><img id="SoftTissue_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img id="SoftTissue_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
 -->				
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Lymph Nodes </td>
                  <td align="center" class="FormInsideTableRegCell"><img id="LymphNodes_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img id="LymphNodes_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Lung</td>
                  <td align="center" class="FormInsideTableRegCell"><img id="Lung_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img id="Lung_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Liver</td>
                  <td align="center" class="FormInsideTableRegCell"><img id="Liver_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img id="Liver_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Local Disease </td>
                  <td align="center" class="FormInsideTableRegCell"><img id="LocalDisease_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img id="LocalDisease_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
              </table></td>
          </tr>
        </table>	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
	  	  <tr >
            <td height="28" valign="middle" style="border-bottom: solid 1px #000000;">Last GnRH&nbsp;</td>
	  	    <td height="20" valign="middle"  style="border-bottom: solid 1px #000000;">Date: ____\____\____</td>
	  	    <td colspan="2" valign="middle"  style="border-bottom: solid 1px #000000;">Agent: _______________________________ </td>
	  	    </tr>
          <tr >
            <td height="28" valign="middle" style="border-bottom: solid 1px #000000;">Last Bisphosphonate&nbsp;</td>
            <td height="20" valign="middle"  style="border-bottom: solid 1px #000000;">Date: ____\____\____</td>
            <td colspan="2" valign="middle"  style="border-bottom: solid 1px #000000;">Agent: _______________________________ </td>
            </tr>
          
          <tr > 
            <td height="28" valign="middle" class="FormInsideTableRegCell">Current TX<img src="../../Images/shim.gif" border="0" width="70" height="1"></td>
            <td valign="middle" class="FormInsideTableRegCell">Start Date&nbsp;&nbsp;____\____\____</td>
            <td valign="middle" class="FormInsideTableRegCell">Cycle / Week<img src="../../Images/shim.gif" border="0" width="70" height="1"></td>
            <td valign="middle" class="FormInsideTableRegCell">Protocol #&nbsp;Y<img src="../../Images/shim.gif" border="0" width="6" height="0">N<img src="../../Images/shim.gif" border="0" width="70" height="1"></td>
            </tr>
        </table>	  </td>
    </tr>
	<tr>
      <td valign="top" class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="71%" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">Interval 
                    History</span></td>
                  <td  valign="top" align="left" style="padding-top: 4px;">&nbsp;<span class="blackBoldText">Progression  Criteria</span>
                      <table width="100%" border="0" cellspacing="0" cellpadding="1" style="font-size: smaller;">
                        <tr>
                          <td align="center" class="FormInsideTableTopCell" ><strong>Site </strong></td>
                          <td width="26%" align="center" class="FormInsideTableTopCell"><strong >Yes</strong></td>
                          <td width="26%" align="center" class="FormInsideTableTopCell"><strong >No</strong></td>
                        </tr>
                        <tr>
                          <td align="center" class="FormInsideTableRegCell">PSA</td>
                          <td align="center" class="FormInsideTableRegCell"><img id="PSA_Eligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                          <td align="center" class="FormInsideTableRegCell"><img id="PSA_Ineligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                        </tr>
                        <tr>
                          <td align="center" class="FormInsideTableRegCell">Bone </td>
                          <td align="center" class="FormInsideTableRegCell"><img id="Bone_Eligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                          <td align="center" class="FormInsideTableRegCell"><img id="Bone_Ineligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                        </tr>
                        <tr>
                          <td align="center" class="FormInsideTableRegCell">Lymph Nodes</td>
                          <td align="center" class="FormInsideTableRegCell"><img id="LymphNodes_Eligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                          <td align="center" class="FormInsideTableRegCell"><img id="LymphNodes_Ineligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                        </tr>
                        <tr>
                          <td align="center" class="FormInsideTableRegCell">Lung</td>
                          <td align="center" class="FormInsideTableRegCell"><img id="Lung_Eligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                          <td align="center" class="FormInsideTableRegCell"><img id="Lung_Ineligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                        </tr>
                        <tr>
                          <td align="center" class="FormInsideTableRegCell">Liver</td>
                          <td align="center" class="FormInsideTableRegCell"><img id="Liver_Eligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                          <td align="center" class="FormInsideTableRegCell"><img id="Liver_Ineligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                        </tr>
                        <tr>
                          <td align="center" class="FormInsideTableRegCell">Symptoms</td>
                          <td align="center" class="FormInsideTableRegCell"><img id="Other_Eligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                          <td align="center" class="FormInsideTableRegCell"><img id="Other_Ineligible" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                        </tr>
                  </table></td>
                </tr>
                
            </table>		</td>
	  </tr>
	<tr> 
      <td valign="top" class="FormOuterTableRow" style="height:120px; padding-left: 4px;">
	  	
			<span class="blackBoldText">Comorbidities</span><br/>
        <asp:Repeater ID="comorbidities" runat="server">
			<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %> - <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %></ItemTemplate>
			<SeparatorTemplate>,&nbsp;&nbsp;&nbsp;&nbsp;</SeparatorTemplate>
        </asp:Repeater>	    </td>
    </tr>
	
<%-- old medications section --%>
<%--	
	<tr>
	  <td class="FormOuterTableRow" valign="top" height="180"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="30%" height="22" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Medications</span></td>
				  <td width="35%" align="right">Last GnRH: ____\____\____</td>
				  <td width="35%" align="right">Last Bisphosphonate: ____\____\____&nbsp;&nbsp;</td>
                </tr> 
				
				<tr> 
                  <td colspan="3" valign="top"> 
                    <table cellpadding="4" cellspacing="0" border="0" width="100%">
						<tr>
						<td class="HPIText" valign="top">
							<asp:Repeater ID="medications" runat=server OnItemDataBound="medicationsItemDataBound">
								<ItemTemplate>
									<%# DataBinder.Eval(Container.DataItem, "MedDateText") %> <strong><%# DataBinder.Eval(Container.DataItem, "Medication") %></strong> <%# DataBinder.Eval(Container.DataItem, "MedIndication") %> <%# DataBinder.Eval(Container.DataItem, "MedDose") %> <%# DataBinder.Eval(Container.DataItem, "MedUnits") %> <%# DataBinder.Eval(Container.DataItem, "MedSchedule") %><br/><asp:Literal ID="StartNextMedColumn" Runat="server" />
								</ItemTemplate>
							</asp:Repeater>						</td>
					  </tr>
					</table>                  </td>
                </tr>
	    </table></td>
	  </tr>
--%>
	<tr> 
		<td class="FormOuterTableRow" valign="top" height="120" style="padding-left: 4px;"><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="checkbox" name="NKA" value="NKA">NKA&nbsp;&nbsp;&nbsp;&nbsp;<br />
			<asp:Repeater ID="allergies" runat="server" OnItemDataBound="ShowAllergyResponse">
			<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Allergen") %> <asp:Literal ID="AllergyResponseText" runat="server" /></ItemTemplate>
			<SeparatorTemplate>,&nbsp;&nbsp;&nbsp;&nbsp;</SeparatorTemplate>
		</asp:Repeater>		</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU15<img src="../../Images/shim.gif" border="0" width="45" height="1">U19<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:11/16/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U19*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
			GU Prostate Follow-Up Patient<br/></span></td>
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
            <td valign="bottom" class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Date: <% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td  class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr>
            <td colspan="7" valign="bottom"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">Review of Systems</span> &nbsp;&nbsp;<span class="smallGrayText">&nbsp;&nbsp;&nbsp;Clinician 
        Performing Review:
                <input type="checkbox" name="PA22" value="Yes" />
RN&nbsp;&nbsp;
<input type="checkbox" name="PA3" value="Yes" />
PA/NP&nbsp;&nbsp;
<input type="checkbox" name="Fellow3" value="Yes" />
Fellow&nbsp;&nbsp;
<input type="checkbox" name="Attending3" value="Yes" />
Attending</span></td>
            </tr>
          <tr>
            <td colspan="7" valign="bottom" class="smallGrayText" style="padding-left: 160px;"><strong>Attribution codes:</strong> &nbsp;&nbsp;&nbsp;<strong>1</strong>: Unrelated &nbsp;&nbsp;&nbsp;&nbsp;<strong>2</strong>:  Unlikely &nbsp;&nbsp;&nbsp;&nbsp;<strong>3</strong>: Possible &nbsp;&nbsp;&nbsp;&nbsp;<strong>4</strong>: Probable &nbsp;&nbsp;&nbsp;&nbsp; <strong>5</strong>:  Definite</td>
          </tr>
          <tr> 
            <td align="center" valign="bottom" class="FormInsideTableTopCell"><Strong>Organ<br/>System</Strong></td>
            <td align="center" valign="bottom" class="FormInsideTableTopCell"><Strong>Symptom</Strong></td>
            <td align="center" valign="bottom" class="FormInsideTableTopCell" style="border-right: none;">&nbsp;</td>
            <td align="center" valign="bottom" class="FormInsideTableTopCell"><Strong>Grade<br/>0<img src="../../Images/shim.gif" border="0" width="12" height="0">1<img src="../../Images/shim.gif" border="0" width="12" height="0">2<img src="../../Images/shim.gif" border="0" width="12" height="0">3<img src="../../Images/shim.gif" border="0" width="12" height="0">4</Strong></td>
            <td width="15%" align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Start - Stop<br/>
              Dates</strong></td>
            <td align="center" valign="bottom" class="FormInsideTableTopCell"><Strong>Attribution</Strong></td>
            <td width="30%" align="center" valign="bottom" class="FormInsideTableTopCell"><Strong>Comments / Intervention </Strong></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="4"><img src="../../Images/shim.gif" border="0" width="4" height="0">Const&nbsp;</td>
            <td height="25" align="left" class="FormInsideTableRegCell">Fatigue</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Fatigue" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="4" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td height="25" align="left" class="FormInsideTableRegCell">Fever</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Fever" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr> 
            <td height="25" align="left" nowrap class="FormInsideTableRegCell">Anorexia</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Anorexia" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr>
            <td height="25" align="left" nowrap class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr > 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin&nbsp;</td>
            <td height="25" align="left" class="FormInsideTableRegCell">Rash</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Rash" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">ENMT&nbsp;</td>
            <td height="25" align="left" class="FormInsideTableRegCell">Oral Mucositis</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_OralMucositis" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr > 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp&nbsp;</td>
            <td height="25" align="left" class="FormInsideTableRegCell">Dyspnea</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Dyspnea" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0">CV&nbsp;</td>
            <td height="25" align="left" class="FormInsideTableRegCell"> Edema</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Edema" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td height="25" align="left" class="FormInsideTableRegCell">Chest Pain</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_ChestPain" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr>
            <td height="25" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr> 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="5"><img src="../../Images/shim.gif" border="0" width="4" height="0">GI&nbsp;</td>
            <td height="25" align="left" class="FormInsideTableRegCell">Nausea</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Nausea" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="5" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="25" align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Vomiting" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr > 
            <td height="25" align="left" class="FormInsideTableRegCell">Diarrhea</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Diarrhea" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr> 
            <td height="25" align="left" class="FormInsideTableRegCell">Constipation</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Constipation" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr>
            <td height="25" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro&nbsp;</td>
            <td height="25" align="left" class="FormInsideTableRegCell">Sensory Neuropathy</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_SensoryNeuropathy" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="25" align="left" class="FormInsideTableRegCell">Motor Neuropathy</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_MotorNeuropathy" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr>
            <td height="25" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr> 
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="6"><img src="../../Images/shim.gif" border="0" width="4" height="0">GU&nbsp;</td>
            <td height="25" align="left" class="FormInsideTableRegCell">Urinary Frequency </td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_UrinaryFrequency" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="5" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="25" align="left" class="FormInsideTableRegCell">Hemorrhage - Urinary NOS</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_HemorrhageUrinaryNOS" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr> 
            <td height="25" align="left" class="FormInsideTableRegCell">Pain - Urethra </td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_PainUrethra" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr>
            <td height="25" align="left" class="FormInsideTableRegCell">Incontinence</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Incontinence" runat="server">&nbsp;</asp:Label>            </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr>
            <td height="25" align="left" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" colspan="6" height="24" align="left">Potency:<span class="smallGrayText">(circle)</span>&nbsp;&nbsp;&nbsp;Y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;N</td>
          </tr>
          <tr >
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Pain&nbsp;</td>
            <td height="50" align="left" valign="top" class="FormInsideTableRegCell"> Site:</td>
            <td align="center" valign="top" class="FormInsideTableRegCell" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Pain" runat="server">&nbsp;</asp:Label>            </td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" hspace="2" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" valign="top" class="FormInsideTableRegCell">-</td>
            <td align="center" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="left" valign="top" class="FormInsideTableRegCell" style="line-height: 30px;">Inten. (0-10):_______<br />
              Relief:<img src="../../Images/shim.gif" border="0" width="12" height="1" />Y<img src="../../Images/shim.gif" border="0" width="24" height="1" />N</td>
          </tr>
          <tr >
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Other</td>
            <td colspan="6" align="left" valign="top" class="FormInsideTableRegCell">Fasting:<span class="smallGrayText">(circle)</span>&nbsp;&nbsp;&nbsp;Y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;N</td>
            </tr>
          <tr >
            <td colspan="7" align="left" valign="top" class="FormInsideTableRegCell" style="padding-left: 4px; padding-bottom: 10px;">
			<span class="smallGrayText" >
			<strong>CTC AE Pain Grades</strong>&nbsp;&nbsp;&nbsp;&nbsp;
			<strong>Grade 1:</strong> Mild pain&nbsp;&nbsp;&nbsp;
			<strong>Grade 2:</strong> Moderate pain; limiting instrumental ADL&nbsp;&nbsp;&nbsp;
			<strong>Grade 3:</strong> Severe pain; limiting self care ADL&nbsp;&nbsp;&nbsp;
			<%-- previous version
			<strong>Grade 1:</strong> Mild pain not interfering with function&nbsp;&nbsp;&nbsp;
			<strong>Grade 2:</strong> Moderate pain; pain or analgesics interfering with function, but not interfering with ADL&nbsp;&nbsp;&nbsp;
			<strong>Grade 3:</strong> Severe pain; pain or analgesics severely interfering with ADL&nbsp;&nbsp;&nbsp;
			<strong>Grade 4:</strong> Disabling
			--%>
			</span></td>
            </tr>
          

        </table>	  </td>
    </tr>
    <tr id="OtherBaselineToxicitiesHtmlRow" runat="server" visible="false">
      <td height="25" class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
        <tr>
          <td colspan="6" valign="bottom"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">Other Baseline Toxicities </span></td>
        </tr>
        <tr>
          <td align="center" valign="bottom" class="FormInsideTableTopCell" style="font-size: 12px; font-weight: bold;"><strong>Organ<br/>
            System</strong></td>
          <td align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
          <td align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Baseline Grade </strong></td>
          <td width="15%" align="center" valign="bottom" class="FormInsideTableTopCell"  style="font-size: 12px; font-weight: bold;" ><strong>Start - Stop<br/>
            Dates</strong></td>
          <td align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Attribution</strong></td>
          <td width="30%" align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Comments / Intervention </strong></td>
        </tr>
<asp:Repeater ID="OtherBaselineToxicitiesRpt" runat="server">
    <ItemTemplate>
        <tr >
          <td class="FormInsideTableRegCell" align="left" valign="top" style="padding-left: 4px;">&nbsp;<%# Eval("ToxCategory") %></td>
          <td height="24" align="left" class="FormInsideTableRegCell">&nbsp;<%# Eval("ToxName") %></td>
          <td class="FormInsideTableRegCell" align="center">&nbsp;<%# Eval("ToxGrade") %></td>
          <td class="FormInsideTableRegCell" align="center" style="font-size: 10px; font-weight: bold;" ><%# Eval("ToxDateText") %> - <%# Eval("ToxStopDateText") %>&nbsp;</td>
          <td class="FormInsideTableRegCell" align="center"><%# Eval("ToxProbability") %></td>
          <td class="FormInsideTableRegCell" style="padding-left:"><%# Eval("ToxIntervention") %>&nbsp;</td>
        </tr>
   </ItemTemplate>
</asp:Repeater>
      </table></td>
    </tr>
    <tr>
      <td height="25" class="FormOuterTableRow">&nbsp;
          <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes" />
          <span class="blackBoldText"> ROS performed by RN: ________________________________<img src="../../Images/shim.gif" border="0" width="40" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="15" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td> 
      </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU15<img src="../../Images/shim.gif" border="0" width="45" height="1">U19<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:11/16/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U19*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
			GU Prostate Follow-Up Patient<br/></span></td>
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
      <td width="700" height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr > 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital Signs</span></td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
          <tr> 
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">KPS:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Height:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Weight:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BSA:</td>
          </tr>
        </table>		</td>
    </tr>
	<tr > 
      <td  class="FormOuterTableRow" valign="middle"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">
        <img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">
        PA&nbsp;&nbsp;&nbsp; 
        <img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">
        NP&nbsp;&nbsp;&nbsp; 
        <img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">
        Fellow&nbsp;&nbsp;&nbsp; 
        <img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">
        Attending Confirmed</span> 
		
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td class="FormInsideTableTopCell" align="center"><strong>System</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Normal Findings</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Abn</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Not<br/>Done</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Comments</strong></td>
          </tr>
		  <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Gen/MS&nbsp;</td>
            <td class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">WD WN</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">NAD</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">A&amp;O</td>
					</tr>
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" rowspan="13" align="center" valign="bottom"><img src="../../Images/ProstateImageURONVWeb.gif" width="251" height="125" /></td>
          </tr>
          <tr > 
		  	<td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Eyes&nbsp;</td>
            <td class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Scleral Icterus</td>
						<td>&nbsp;</td>
					</tr>
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">ENT&nbsp;</td>
            <td class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Mucositis</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Thrush</td>
					</tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">Mucous Membranes Moist</td>
					<tr>					</tr>
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Nodes</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Cervical</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Axillary</td>
					</tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Supraclavicular</td>
					<tr>					</tr>
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
          <tr > 
		  	<td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp.&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">Clear to Percussion&amp; Ausculation</td>
					</tr>
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">C/V&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" />No Murmurs</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" />Regular Rate &amp; Rhythm</td>
					</tr>
					<tr>					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Abdomen&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Hepatosplenomegaly</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Ascites</td>
					</tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">Soft Non-tender; Normal Bowel Sounds</td>
					<tr>					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Back&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle" nowrap><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Spinal Tenderness</td>
						<td valign="middle" nowrap><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No CVA Tenderness</td>
					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">GU<br/> 
              <img src="../../Images/shim.gif" border="0" width="4" height="0">Male&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">Testes w/o Tenderness or Masses</td>
					</tr> 
					<tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">DRE of Prostate</td>
					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">M/S&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Clubbing or Cyanosis</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Cord</td>
					</tr> 
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Calf Tenderness</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Leg Swelling</td>
					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">Motor
						  Function</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">Sensation</td>
					</tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">Cranial Nerves II-XII Intact</td>
					<tr>					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Rash or Ulcers</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">No Nodules</td>
					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other</td>
            <td  class="FormInsideTableRegCell" align="left">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            </tr>
        </table>	  </td>
    </tr>
	<tr>
		<td  class="FormOuterTableRow">
			<span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Lab Tests</span>
			<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
			  <tr>
			  	<td width="50%">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="FormInsideTableTopCell" align="left" valign="top" width="25%" height="18"><img src="../../Images/shim.gif" border="0" width="4" height="0">WBC:</td>
							<td class="FormInsideTableTopCell" align="left" valign="top" width="25%"><img src="../../Images/shim.gif" border="0" width="4" height="0">ANC:</td>
							<td class="FormInsideTableTopCell" align="left" valign="top" width="25%"><img src="../../Images/shim.gif" border="0" width="4" height="0">HGB:</td>
							<td class="FormInsideTableTopCell" align="left" valign="top" width="25%"><img src="../../Images/shim.gif" border="0" width="4" height="0">PLT:</td>
						</tr>
					</table>				</td>
			  	<td width="50%" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Comments:</td>
			  </tr>
			  <tr> 
				<td class="FormInsideTableRegCell"  valign="top" align="left" height="40"><img src="../../Images/shim.gif" border="0" width="4" height="0">Chemistry:<img src="../../Images/shim.gif" border="0" width="270" height="1">Creat:</td>
			  </tr>
			  <tr> 
				<td class="FormInsideTableRegCell"  valign="top" align="left" height="50"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span>Markers (PSA/ACP/LDH):</span>
					<table width="700" cellpadding="0" cellspacing="0" border="0">
					<tr> 
						<td>
						<asp:Repeater ID="labTests" runat="server" OnItemDataBound="labTestsItemDataBound">
							<ItemTemplate>
							&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabQuality") %><br/><asp:Literal ID="StartNextLabTestsColumn" Runat="server" />
							</ItemTemplate>
						</asp:Repeater>						</td>
					</tr>						
				  </table>				</td>
			  </tr>
		  </table>		</td>
	</tr>
		<tr> 
      <td valign="top" class="FormOuterTableRow" >
	  	<table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr valign="top"> 
            <td height="40" class="FormInsideTableRegCell" valign="top">
                <span class="blackBoldText">PSA Doubling Time</span>
                <img src="../../Images/shim.gif" border="0" width="30" height="1">
                <asp:Label ID="psaDT"  Runat="server"  />			</td>
          </tr>
        </table>
	   </td>
    </tr>
    <tr> 
      <td  class="FormOuterTableRow" valign="top" height="200"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Diagnostics</span><span><img src="../../Images/shim.gif" border="0" width="32" height="1"> 
          <input type="checkbox" name="Films Reviewed">
        Films Reviewed<img src="../../Images/shim.gif" border="0" width="32" height="1"> 
        <input type="checkbox" name="Compared to Past">
        Compared to Past<img src="../../Images/shim.gif" border="0" width="32" height="1"> 
        <input type="checkbox" name="Reviewed with Radiologist">
        Reviewed with Radiologist<img src="../../Images/shim.gif" border="0" width="32" height="1"> 
        <input type="checkbox" name="Digitized">
        Digitized</span><br/>
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr > 
            <td class="FormInsideTableTopCell" width="15%" align="center" valign="middle">Date&nbsp;(mm/dd/yyyy)</td>
            <td class="FormInsideTableTopCell" width="20%" align="center" valign="middle">Modality&nbsp;(CT,MRI...)</td>
            <td class="FormInsideTableTopCell" width="65%" align="center" valign="middle">Results/ Comments/ Comparisons</td>
          </tr>
          <asp:Repeater ID="images" runat="server" OnItemCreated="imagesItemCreated">
			<ItemTemplate>
          <tr > 
            <td align="center" class="FormInsideTableRegCell">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
            <td class="FormInsideTableRegCell">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
            <td class="FormInnerRowBottomBorder">&nbsp;Result: <%# DataBinder.Eval(Container.DataItem, "DxResult") %><asp:Literal ID="ImagesNotesBullet" Runat="Server">&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;</asp:Literal><%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
          </tr>
			</ItemTemplate>
			</asp:Repeater>
        </table>	   </td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU15<img src="../../Images/shim.gif" border="0" width="45" height="1">U19<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:11/16/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
 </div>




<div  align="left"  style="page-break-after:always;" id="LastPageInForm" runat="server">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U19*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
			GU Prostate Follow-Up Patient<br/></span></td>
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
      <td  height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
	<tr > 
      <td  class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td class="FormInsideTableTopCell" width="48%" align="center"><strong>Diagnoses / Problem List</strong></td>
            <td class="FormInsideTableTopCell" width="2%" align="center"><strong>New</strong></td>
            <td class="FormInsideTableTopCell" width="50%" align="center"><strong>Plan / Work-up / Referrals</strong></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="49"><img src="../../Images/shim.gif" border="0" width="4" height="0">1.</td>
            <td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="49"><img src="../../Images/shim.gif" border="0" width="4" height="0">2.</td>
            <td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="49"><img src="../../Images/shim.gif" border="0" width="4" height="0">3.</td>
            <td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="49"><img src="../../Images/shim.gif" border="0" width="4" height="0">4.</td>
            <td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="49"><img src="../../Images/shim.gif" border="0" width="4" height="0">5.</td>
            <td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top" height="49"><img src="../../Images/shim.gif" border="0" width="4" height="0">6.</td>
			<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top" height="49"><img src="../../Images/shim.gif" border="0" width="4" height="0">7.</td>
			<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top" height="49"><img src="../../Images/shim.gif" border="0" width="4" height="0">8.</td>
			<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top" height="49"><img src="../../Images/shim.gif" border="0" width="4" height="0">9.</td>
			<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top" height="49"><img src="../../Images/shim.gif" border="0" width="4" height="0">10.</td>
			<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
        </table>	  </td>
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
      <td align="left" valign="top" class="FormOuterTableRow" height="40"><img src="../../Images/shim.gif" border="0" width="8" height="8"><span class="blackBoldText">Additional 
        Records/Films to Request:</span></td>
	</tr>
	<tr> 
      <td class="FormOuterTableRow">
	    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="2" class="FormInsideTableTopLeftCell"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="8" height="8">Disposition</span></td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell" width="50%" align="center">
              <table align="left" width="100%">
				<tr> 
                  <td>Dictation for today's visit?</td>
                  <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="0">No</td>
                </tr>
              </table>			 </td>
            <td class="FormInsideTableRegCell" width="50%" align="center">
              <table align="left" width="100%">
                <tr> 
                  <td>See dispo for orders?</td>
                  <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="0">No</td>
                </tr>
              </table>			 </td>
            </tr>
          <tr>
            <td height="40" colspan="2" valign="top" class="FormInsideTableRegCell"><table align="left" width="100%">
              <tr>
                <td colspan="2">Return:<img src="../../Images/shim.gif" border="0" width="16" height="1" />_____________Weeks<img src="../../Images/shim.gif" border="0" width="12" height="0" />_____________Months</td>
              </tr>
            </table></td>
            </tr>
        </table>	   </td>
    </tr>
<!--	
	<tr>
	  <td align="left" valign="top" class="FormOuterTableRow" height="40"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Procedures:</span>
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td><img src="../../Images/icon_checkBoxBlank2.gif" width="18" height="10" alt="" border="0" />Port Flush</td>
              <td><img src="../../Images/icon_checkBoxBlank2.gif" width="18" height="10" alt="" border="0" />Patient Education_____________________</td>
              <td align="left" valign="top" rowspan="2" width="350">Comments:</td>
            </tr>
            <tr>
              <td><img src="../../Images/icon_checkBoxBlank2.gif" width="18" height="10" alt="" border="0" />GNRH</td>
              <td align="left"><img src="../../Images/icon_checkBoxBlank2.gif" width="18" height="10" alt="" border="0" />Other Intervention_____________________</td>
            </tr>
        </table></td>
	  </tr>
-->
    <tr>
      <td align="left" valign="top" class="FormOuterTableRow" height="105"><img src="../../Images/shim.gif" border="0" width="8" height="8"><span class="blackBoldText">Comments / Notes:</span></td>
	</tr>
    <tr>
      <td align="left" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="8" height="8" /><span class="blackBoldText">Protocol #: __________________</span><br />
              <table align="left" width="100%">
                <tr>
                  <td width="11%">Considered:</td>
                  <td>&nbsp;&nbsp;Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                  <td width="16%">Consent Obtained:</td>
                  <td>&nbsp;&nbsp;Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                  <td width="10%">Registered:</td>
                  <td>&nbsp;&nbsp;Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="4">
          
          <tr> 
            <td class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22">&#8805; 50% of attending time was spent in counseling<img src="../../Images/shim.gif" border="0" width="4" height="1"><span style="font-size: smaller;">(If so, mark total attending time in minutes)</span>
			<input type="checkbox" name="15-24 (3)22">15-24 (3)&nbsp;&nbsp;<input type="checkbox" name="25-39 (4)22">25-39 (4)&nbsp;&nbsp;<input type="checkbox" name="40+ (5)22">40+ (5)</td>
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
                  <td>I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I have reviewed this entire document and I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                    <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU15<img src="../../Images/shim.gif" border="0" width="45" height="1">U19<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:11/16/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
    </tr>
    </table>

</div>

<%--
<div   align="left" id="LastPageInForm" runat="server">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U19*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
			GU Prostate Follow-Up Patient<br/></span></td>
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
      <td  height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow" valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="30%" height="22" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">Medications</span></td>
            <td width="35%" align="right">Last GnRH: ____\____\____</td>
            <td width="35%" align="right">Last Bisphosphonate: ____\____\____&nbsp;&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" valign="top"><table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                  <td   align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; width: 23%;">Agent</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; width: 10%;">Dose</td>
                  <td   align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; width: 11%;">Schedule</td>
                  <td  align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; width: 23%;">Indication</td>
                  <td   align="center" valign="middle" class="FormInsideTableTopLeftCell" style="font-weight: bold; width: 11%;">Route</td>
                  <td   align="center" valign="middle" class="FormInsideTableTopLeftCell" style="font-weight: bold; width: 11%;">Start Date</td>
                  <td   align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; width: 11%;">End Date</td>
                </tr>
				</table>
			</td>
          </tr>
      </table>
	  </td>
    </tr>
	
<asp:Repeater ID="AdditionalGUMedicationSection" runat="server">
                  <ItemTemplate>	
<tr>
      <td class="FormOuterTableRow" style="border-bottom: none;" valign="top" >
	  				<table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                    <tr>
                      <td class="FormInsideTableRegCell" valign="top"  style="width: 23%; height: 28px;">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "Medication") %></strong></td>
                      <td class="FormInsideTableRegCell" valign="top"  style="width: 10%;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDose") %> <%# DataBinder.Eval(Container.DataItem, "MedUnits") %></td>
                      <td class="FormInsideTableRegCell" valign="top"  style="width: 11%;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedSchedule") %></td>
                      <td class="FormInsideTableRegCell" valign="top" style="width: 23%;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedIndication") %></td>
                      <td class="FormInsideTableRegCell" valign="top"  style="width: 11%;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedRoute") %></td>
                      <td class="FormInsideTableRegCell" valign="top" style="width: 11%; text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDateText") %></td>
                      <td class="FormInsideTableRegCell" valign="top" style="width: 11%; text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedStopDateText") %></td>
                    </tr>
                  
            </table>
		</td>
    </tr>
</ItemTemplate>
                </asp:Repeater>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td><span class="blackBoldText">Signatures</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="3"><table width="100%" cellpadding="0" cellspacing="0"  class="FormInnerTableBlackTopRow">
                <tr>
                  <td style="padding:8px;">I have reviewed  and verified the accuracy of the information above regarding my medications.<br/>
                    <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="30" /> Patient: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
		  <tr align="center">
            <td colspan="3"><table width="100%" cellpadding="0" cellspacing="0"  class="FormInnerTableBlackTopRow">
                <tr>
                  <td style="padding:8px;"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="30" /> Clinician: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU15<img src="../../Images/shim.gif" border="0" width="45" height="1">U19<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:11/16/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>

    </table>

</div>
--%>
</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>