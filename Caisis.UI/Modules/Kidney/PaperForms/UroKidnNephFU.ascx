<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.PaperForms.UroKidnNephFU" CodeFile="UroKidnNephFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


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
		<div  class="VerticalBarCodeDocType">*U12*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;">
  

  
  <font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              Urology Nephrectomy Follow-Up Patient</span><br/>
            </td>
            <td width="50%" align="center" valign="bottom">
				<table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
    <tr> 
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: 
        <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
      <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr > 
          <td align="left" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">Referring&nbsp;M.D.: 
            <asp:Repeater ID="ReferringMD" runat="server" >
				<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "phFirstName") %> <%# DataBinder.Eval(Container.DataItem, "phLastName") %> (<%# DataBinder.Eval(Container.DataItem, "phInstitution") %>)</ItemTemplate><SeparatorTemplate>, </SeparatorTemplate>
			</asp:Repeater>
			<asp:Label ID="blankReferrringMD" Runat="server"></asp:Label>
		  </td>
            </tr>
            </table>
      </td>
    </tr>
    <tr> 
      <td height="90" valign="top" class="FormOuterTableRow" style="padding: 4px;"><span class="blackBoldText">Chief Complaint</span>
		
		<input type="checkbox" name="ActiveSurv" id="ActiveSurv" runat="server" style="margin-left: 90px;" />Active Surveillance <br/>
		
		<asp:Repeater ID="ActiveSurveillanceRpt" runat="server" >
			<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "StatusDateText") %>&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "Status") %></ItemTemplate>
			<SeparatorTemplate><br/></SeparatorTemplate>
		</asp:Repeater>
		
		




		
		</td>
    </tr>
    <tr> 
      <td height="400" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">HPI</span><br/> 
        
        		<table cellpadding="4" cellspacing="0" border="0">
		<tr>
		<td class="HPIText" valign="top" width="*">
              <asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound">
				<ItemTemplate>
					<span <%# Eval("patientHPI").ToString().ToUpper().IndexOf("PROTOCOL")>-1 ? "style=\"font-weight: bold;\"" : "" %>  ><%# DataBinder.Eval(Container.DataItem, "patientHPI") %></span><br/><asp:Literal ID="StartNextHpiColumn" Runat="server" />
				</ItemTemplate>
			  </asp:Repeater>
		</td>
		</tr>
		</table>
        
        </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="130" colspan="4" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Interval History</span>
			<input type="checkbox" name="Complication" id="Complication" style="margin-left: 40px;" />Complication
			<br/></td>
            <td align="left" valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Other Treatments</span> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr> 
                  <td colspan="1" align="center" class="FormInsideTableTopCell">Start Date</td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">TX<br/><img src="../../Images/shim.gif" border="0" width="90" height="1"></td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">Notes (Protocol #)</td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>
                <tr> 
                  <td height="24" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="24" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="24" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="24" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr > 
            <td colspan="8" style="vertical-align: top; padding: 4px;">Complication Details:
			<%--&nbsp;&nbsp; <input type="checkbox" name="No">No&nbsp;&nbsp; <input type="checkbox" name="Yes" id="LateComplicationsCheckbox" runat="server">Yes (specify):&nbsp;&nbsp;
               --%>
			  
			  <asp:Repeater ID="ComplicationsRpt" runat="server"> 
                <ItemTemplate><strong>
                  <%# DataBinder.Eval(Container.DataItem, "ToxDateText") %>
                  - 
                  <%# DataBinder.Eval(Container.DataItem, "ToxName") %></strong>
                </ItemTemplate>
                <SeparatorTemplate>;&nbsp;&nbsp;&nbsp;</SeparatorTemplate>
              </asp:Repeater>
			  
			  

              
              <br/> <img src="../../Images/shim.gif" border="0" width="0" height="12"> 
            </td>
          </tr>
          <!-- <tr >
						<td colspan="8" align="left" valign="top">
							<table align="left" border="0" width="70%" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
								<tr >
									<td valign="middle"><img src="../../Images/shim.gif" border="0" width="4" height="0">Check Indication:</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">+SM</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">BCR</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">+ECE/SVI</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">LCR</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">+LN</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">Mets</td>
								</tr>
							</table>
						</td>
					</tr>-->
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td class="FormInnerRowRightBorder" style="width: 50%; vertical-align: top; height: 280px;" ><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">NKA&nbsp;&nbsp; 
                    <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes">Unchanged Since Last Visit</span><br/>
              
			  
			   <asp:Repeater ID="allergies" runat="server"> 
                  <ItemTemplate>
				  <strong><%# DataBinder.Eval(Container.DataItem, "Allergen") %></strong> - <strong><%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %></strong>
				  </ItemTemplate>
				  <SeparatorTemplate>, </SeparatorTemplate>
                </asp:Repeater>
			  
			  
			  </td>
			  <td style="padding: 2px 2px 2px 4px; vertical-align: top;">
			  <span class="blackBoldText">Comorbidities</span><br/>
      
      <table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td>
              <asp:Repeater ID="comorbidities" runat="server" OnItemDataBound="ComorbiditiesItemDataBound"> 
                <ItemTemplate>
                  <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
                  - 
                  <strong><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %></strong><br/>
                  <asp:Literal ID="StartNextColumn" Runat="server"/>
                </ItemTemplate>
              </asp:Repeater>
      </td></tr></table>
			  </td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU08<img src="../../Images/shim.gif" border="0" width="45" height="1">U12<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/21/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
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
		<div  class="VerticalBarCodeDocType">*U12*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              Urology Nephrectomy Follow-Up Patient</span><br/>            </td>
            <td width="50%" align="center" valign="bottom">
				<table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
                    <% =patientPostalCode  %>                  </td>
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
    <tr> 
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    
<tr> 
      <td valign="top" class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr valign="top"> 
            <td width="49%" class="FormInnerRowRightBorder" style="height: 700px; vertical-align: top;"><span class="blackBoldText">Family 
              History:</span><img src="../../Images/shim.gif" border="0" width="50" height="1"> 
              <input type="checkbox" name="famHxProstateCancerYes2" runat="server" ID="Checkbox1"/>
              No known family history of ca<br/>            
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
                  <td>Kidney Ca</td>
                  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                  <td align="right">If Y:&nbsp;</td>
                  <td>Number of 1&deg; relatives:&nbsp;&nbsp;_______</td>
                </tr>
                <tr> 
                  <td colspan="3">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>Number of other relatives:&nbsp;_______</td>
                </tr>
                <tr> 
                  <td colspan="3">&nbsp; </td>
                  <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Side of Family:</td>
                </tr>
                <tr> 
                  <td><img src="../../Images/shim.gif" border="0" width="10" height="30"></td>
                  <td align="center" valign="bottom">Y</td>
                  <td align="center" valign="bottom">N</td>
                  <td>&nbsp;</td>
                  <td valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;Maternal&nbsp;&nbsp;&nbsp; 
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;Paternal</td>
                </tr>
                <tr valign="top"> 
                  <td>Other Ca</td>
                  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                  <td align="right">List:&nbsp;</td>
                  <td>&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Breast&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Prostate<br/>
                    &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Bladder&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Testis <br/>
                    &nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Other: ____________</td>
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
              </table>
              <asp:Repeater ID="familyHistory" runat="server" OnItemCreated="FamilyHistoryItemCreated"> 
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
              </asp:Repeater><br/> <input type="checkbox" name="Digitized232">
              Balkan Heritage<br/>
			  <br />Other Significant Family Hx:<br />
			  <table  class="FamilyHistoryNonCancerDiseases" width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width: 5%;">&nbsp;</td>
    <td style="width: 45%; font-weight: bold; padding-left: 10px;">Disease</td>
    <td style="width: 2%;">&nbsp;</td>
    <td style="width: 48%; font-weight: bold; padding-left: 70px;">Relation(s)</td>
  </tr>
  <tr>
    <td height="24"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
    <td>Von Hippel-Lindau (VHL)<br /></td>
    <td>&nbsp;</td>
    <td style="border-bottom: solid 1px #111111;">&nbsp;</td>
  </tr>
  <tr>
    <td height="24"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
    <td>Birt-Hogg-Dub&eacute; (BHD)</td>
    <td>&nbsp;</td>
    <td style="border-bottom: solid 1px #111111;">&nbsp;</td>
  </tr>
  <tr>
    <td height="24"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
    <td>Hereditary Papillary</td>
    <td>&nbsp;</td>
    <td style="border-bottom: solid 1px #111111;">&nbsp;</td>
  </tr>
  <tr>
    <td height="24"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
    <td>Tubulosclerosis</td>
    <td>&nbsp;</td>
    <td style="border-bottom: solid 1px #111111;">&nbsp;</td>
  </tr>
  <tr>
    <td height="24"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
    <td style="border-bottom: solid 1px #111111;">&nbsp;</td>
    <td>&nbsp;</td>
    <td style="border-bottom: solid 1px #111111;">&nbsp;</td>
  </tr>
  <tr>
    <td height="24"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
    <td style="border-bottom: solid 1px #111111;">&nbsp;</td>
    <td>&nbsp;</td>
    <td style="border-bottom: solid 1px #111111;">&nbsp;</td>
  </tr>
  <tr>
    <td height="24"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
    <td style="border-bottom: solid 1px #111111;">&nbsp;</td>
    <td>&nbsp;</td>
    <td style="border-bottom: solid 1px #111111;">&nbsp;</td>
  </tr>
</table>
</td>
            <td width="51%"> <p><span class="blackBoldText">Social History:</span><br/>
                <br/>
                Occupation: 
                <asp:Label ID="socHxOccupation" Runat="server" /><br/>
                <br/>
                Marital Status: 
                <asp:Label ID="socHxMaritalStatus" Runat="server" /><img src="../../Images/shim.gif" border="0" width="30" height="1">Children: 
                <asp:Label ID="socHxChildren" Runat="server" /><br/>
                <img src="../../Images/shim.gif" border="0" width="1" height="8"> 
                <br/>
				<table cellspacing="0" cellpadding="0">
					<tr>
					<td style="padding-right: 8px;">Tobacco Use:</td>
					<td><input type="checkbox" name="Digitized222222"> None</td>
					</tr>
					<tr>
					<td>&nbsp;</td>
					<td><asp:Label ID="socHxTobaccoType" Runat="server">  
                  <input type="checkbox" name="Digitized2222">
                  Cigarettes <img src="../../Images/shim.gif" border="0" width="10" height="8"> 
                  <input type="checkbox" name="Digitized22222">
                  Cigar<img src="../../Images/shim.gif" border="0" width="10" height="1"> 
                  <input type="checkbox" name="Digitized22223">
                  Pipe</asp:Label></td>
					</tr>
					<tr>
					<td>&nbsp;</td>
					<td style="padding-top: 20px;"><input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" NAME="socHxTobaccoPacksPerDayCheckBox"/>
                <asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label>
                packs / day for 
                <asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label>
                years</td>
					</tr>
					<tr>
					<td>&nbsp;</td>
					<td><input type="checkbox" id="socHxTobaccoQuitYearCheckbox" runat="server" NAME="socHxTobaccoQuitYearCheckbox"/>
                 Year Quit: 
                 <asp:Label ID="socHxTobaccoQuitYear" Runat="server">______</asp:Label></td>
					</tr>

				</table>
                
                <br/>
                <br/>
                Alcohol Use: 
                <asp:Label ID="socHxAlcohol" Runat="server" /><br/>
                <br/>
                Carcinogen Exposure: 
                <asp:Label ID="socHxCarcinogen" Runat="server" /><br/>
              </p></td>
          </tr>
        </table></td>
    </tr>    <tr> 
      <td class="FormOuterTableRow" style="padding: 4px; height: 250px; vertical-align: top;">
<table border="0" cellpadding="0" cellspacing="0" style="width: 100%;" >
                <tr>
<td style="width: 50%; vertical-align: top;">
<span class="blackBoldText" style="margin-right: 70px;">Disease State</span>
Change:<img src="../../Images/shim.gif" border="0" width="12" height="1">Y<img src="../../Images/shim.gif" border="0" width="12" height="1">N
<%--<asp:Label ID="LastStatus" Runat="server">Date:</asp:Label> --%>
<asp:Repeater ID="StatusRpt" runat="server">
	<HeaderTemplate><table cellspacing="0" style="margin-top: 8px;"></HeaderTemplate>
	<ItemTemplate><tr>
	                <td><%# Eval("StatusDateText") %></td>
	                <td style="padding-left: 10px;"><%# Eval("Status") %></td>
	</tr></ItemTemplate>
	<FooterTemplate></table></FooterTemplate>
</asp:Repeater>
</td>
<td>
<table border="0" cellpadding="0" cellspacing="0">
				<tr> 
                  <td align="left" style="font-weight: bold;">
				 Date: <asp:Label ID="NewStatusDateLabel" runat="server">____/____/____</asp:Label>
				  </td>
                </tr>
                <tr> 
                  <td align="left">
				  <input type="checkbox" name="CurrentStatus_NED" id="CurrentStatus_NoCancerDiagnosis" value="No Cancer Diagnosis" runat="server">
                    <asp:Label ID="NoCancerDiagnosis_Label" Runat="server">No Cancer Diagnosis</asp:Label> <asp:Label ID="NoCancerDiagnosis_DateLabel" Runat="server">&nbsp;</asp:Label></td>
                </tr>
                <tr> 
                  <td align="left">
				  <input type="checkbox" name="CurrentStatus_NED" id="CurrentStatus_NED" value="No Evidence of Disease" runat="server">
                    <asp:Label ID="NED_Label" Runat="server">NED</asp:Label> <asp:Label ID="NED_DateLabel" Runat="server">&nbsp;</asp:Label></td>
                </tr>
				<tr> 
                  <td align="left"><input type="checkbox" name="CurrentStatus_LocalRecurrence" id="CurrentStatus_LocalRecurrence" value="Local Recurrence" runat="server">
                    <asp:Label ID="LocalRecurrence_Label" Runat="server">Local Recurrence</asp:Label> <asp:Label ID="LocalRecurrence_DateLabel" Runat="server">&nbsp;</asp:Label></td>
                </tr>
                <tr> 
                  <td align="left"><input type="checkbox" name="CurrentStatus_ContralateralRecurrence" id="CurrentStatus_ContralateralRecurrence"  value="Contralateral Recurrence" runat="server">
                    <asp:Label ID="ContralateralRecurrence_Label" Runat="server">Contralateral Recurrence</asp:Label> <asp:Label ID="ContralateralRecurrence_DateLabel" Runat="server">&nbsp;</asp:Label></td>
                </tr>
                <tr>
                  <td align="left"><input type="checkbox" name="CurrentStatus_Mets"  id="CurrentStatus_Mets" value="Mets"  runat="server" />
                     <asp:Label ID="Mets_Label" Runat="server">Mets</asp:Label> <asp:Label ID="Mets_DateLabel" Runat="server">&nbsp;</asp:Label> Site:________________</td>
                </tr>

              </table>
</td>
</tr>			  
</table>
</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU08<img src="../../Images/shim.gif" border="0" width="45" height="1">U12<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:06/21/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
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
		<div  class="VerticalBarCodeDocType">*U12*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              Urology Nephrectomy Follow-Up Patient</span><br/>
            </td>
            <td width="50%" align="center" valign="bottom">
				<table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
    <tr> 
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td align="center" class="FormOuterTableRow" style="border-bottom: none;""> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td  colspan="3" style="padding: 4px;"><span class="blackBoldText">Lab Tests</span> <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date: 
              ______________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data 
              Source :_______________--%></td>
          </tr>
          <%-- <tr> 
            <td colspan="3"><img src="../../Images/standardLabsGridLinedwPSA.gif"  class="pageWidth98percent" /></td>
          </tr> --%>
          <tr id="PopulatedLabTestsTableRow" runat="server"> 
            <td colspan="3" style="padding-left: 0px; padding-right: 0px;"><table width="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed;" >
				<thead>
                <tr > 
                  <td width="16%" height="20" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">GFR</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Data Source</td>
                </tr>
				</thead>
				<tbody  id="LabTestBlankRows" runat="server">
                <tr> 
                      <td class="FormInsideTableLeftCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
					  <td class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
                 </tr>
                <tr> 
                      <td height="17" class="FormInsideTableLeftCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
					  <td class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
                 </tr>
                <tr> 
                      <td height="17" class="FormInsideTableLeftCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
					  <td class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
                 </tr>
                <tr> 
                      <td height="17" class="FormInsideTableLeftCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
					  <td class="FormInsideTableRegCell" >&nbsp;</td>
                      <td class="FormInsideTableRegCell" >&nbsp;</td>
                 </tr>
				 </tbody>
              </table></td>
          </tr>
        </table></td>
    </tr>
	
	
	
	
				<style type="text/css">
				tr.LastNeph td {font-weight: bold; color: #000000; padding: 6px 2px 6px 2px;}
				</style>
				
	<asp:Repeater ID="labTests" runat="server" ><ItemTemplate>  
    <tr> 
      <td align="center" class="FormOuterTableRow" style="border-top: none; border-bottom: none;"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr > 
            <td style="padding-left: 0px; padding-right: 0px;"><table width="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed;" >
				  <tbody id="LabTestPopRows">
                    <tr <%# (bool)DataBinder.Eval(Container.DataItem, "LastBeforeNeph") == true ? "class=\"LastNeph\"" : "" %> > 
                      <td  width="16%" align="center" class="FormInsideTableLeftCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabDateText") %></td>
                      <td class="FormInsideTableRegCell" align="center"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabTest") %> <%# (bool)DataBinder.Eval(Container.DataItem, "LastBeforeNeph") == true ? "(Pre-Op)" : "" %></td>
                      <td class="FormInsideTableRegCell" align="center"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
                  <td class="FormInsideTableRegCell" style="vertical-align: middle; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "GFR") %><span style="font-size: 9px; line-height: 10px; color: #444444; font-weight: bold;"><%# DataBinder.Eval(Container.DataItem, "GFRError") %></span>&nbsp;</td>
                      <td class="FormInsideTableRegCell" align="center"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
                    </tr>
				  </tbody>
              </table></td>
          </tr>
        </table></td>
    </tr>	
	</ItemTemplate></asp:Repeater>
	
	
	
	
	
	
	
	
	
	
    <tr> 
      <td class="FormOuterTableRow" style="border-top: solid 1px #000000;"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span><span><img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Films Reviewed">
        Films Reviewed<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Compared to Past">
        Compared to Past<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Reviewed with Radiologist">
        Reviewed with Radiologist<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Digitized">
        Digitized<br/>
        </span> <table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="12%" height="20" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="24%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">Largest Dimension </td>
            <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">Side<br/><span style="font-size: 10px;">(of largest lesion)</span></td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"># Tumors</td>
            <td width="13%" align="center" valign="middle" class="FormInsideTableTopCell">Tumor Type</td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>

          <asp:Repeater ID="images" runat="server" OnItemDataBound="PopulateKindneyImageFindings">
			<ItemTemplate>
          <tr> 
            <td height="34" class="FormInsideTableRegCell" align="center">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxDateText") %></strong></td>
            <td class="FormInsideTableRegCell" style="padding-left: 4px;"><strong><%# DataBinder.Eval(Container.DataItem, "DxType") %></strong>&nbsp;<asp:Literal id="DxTarget" runat="server" /><%# DataBinder.Eval(Container.DataItem, "DxTarget").ToString().Length > 0 ? "(": "" %><%# DataBinder.Eval(Container.DataItem, "DxTarget") %><%# DataBinder.Eval(Container.DataItem, "DxTarget").ToString().Length > 0 ? ")": "" %></td>
            <td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<strong><asp:Literal id="MaxDim" runat="server" /></strong> <asp:Label id="MaxDimMsg" runat="server" Font-Size="10px" Visible="false" Text="(note: one or more measurements was not in the correct format)" /></td>
            <td class="FormInsideTableRegCell" style="white-space: nowrap;text-align: center;"><strong><asp:Literal id="ImgFindSide" runat="server" />&nbsp;</strong></td>
            <td class="FormInsideTableRegCell" style="white-space: nowrap;"><input type="checkbox" name="MultTumors" id="MultTumors" runat="server" />Multiple:<asp:Label id="NumTumors" runat="server" style="width: 30px; border-bottom: solid 1px #000000; text-align: center; font-weight: bold;"  >&nbsp;</asp:Label></td>
            <td class="FormInsideTableRegCell" style="text-align: center;"><strong><asp:Literal id="TumorType" runat="server"  ></asp:Literal></strong><asp:Literal id="NoTumorType" runat="server" ><input type="checkbox" />Cyst<input type="checkbox" style="margin-left: 8px;" />Complex<input type="checkbox" style="margin-left: 8px;" />Solid</asp:Literal></td>
            <td class="FormInsideTableRegCell"><!--<strong><%# DataBinder.Eval(Container.DataItem, "DxNotes") %></strong>-->&nbsp;</td>
          </tr>
			</ItemTemplate>
		</asp:Repeater>
          

        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Review of Systems</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician Performing Review: 
        <input type="checkbox" name="NP22" value="Yes">NP&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="PA22" value="Yes">PA&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow22" value="Yes">Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending22" value="Yes">Attending</span> <br/>
		<table align="center" border="0"  class="pageWidth" cellpadding="1" cellspacing="0">
          <tr> 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Not Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Disease<br/>Related</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Gen</td>
            <td height="24" align="left" class="FormInsideTableRegCell">Fatigue</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="left" class="FormInsideTableRegCell">Fever</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td height="24" align="left" class="FormInsideTableRegCell">Wounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Resp</td>
            <td height="24" align="left" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="left" class="FormInsideTableRegCell">Dyspnea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">CV</td>
            <td height="24" align="left" class="FormInsideTableRegCell">LE Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="left" class="FormInsideTableRegCell">Chest Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">GI</td>
            <td height="24" align="left" class="FormInsideTableRegCell">Dyspepsia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="left" class="FormInsideTableRegCell">Diarrhea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="left" class="FormInsideTableRegCell">Nausea/Vomiting</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="left" class="FormInsideTableRegCell">Flank Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="4" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">GU</td>
            <td height="24" align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="left" class="FormInsideTableRegCell">Dysuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="left" class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp; </td>
          </tr>
          <tr> 
            <td rowspan="1" align="left" valign="top" class="FormInsideTableLeftCell">Psych</td>
            <td height="24" align="left" class="FormInsideTableRegCell">Depression</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Neuro</td>
            <td height="24" align="left" class="FormInsideTableRegCell">Numbness / Tingling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24" align="left" class="FormInsideTableRegCell">Headaches</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="7" align="left" valign="top">Other:</td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" class="FormOuterTableRow">&nbsp; 
        <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes">
        <span class="blackBoldText"> PFSH and ROS performed by: _____________________________________</span></td>
	</tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU08<img src="../../Images/shim.gif" border="0" width="45" height="1">U12<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:06/21/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
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
		<div  class="VerticalBarCodeDocType">*U12*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              Urology Nephrectomy Follow-Up Patient</span><br/>
            </td>
            <td width="50%" align="center" valign="bottom">
				<table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
    <tr> 
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0"  class="pageWidth" cellpadding="4" cellspacing="0">
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
      <td class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Initial Exam: 
        <input type="checkbox" name="NP2" value="Yes">
        NP&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="PA2" value="Yes">
        PA&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow2" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending2" value="Yes">
        Attending</span> <br/> 
        <table align="center" border="0" class="pageWidth" cellpadding="1" cellspacing="0">
          <tr> 
            <td  align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
              Findings</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td  align="center" class="FormInsideTableTopCell"><strong>Attnd<br/>
              Performed</strong></td>
            <td width="40%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Gen</td>
            <td width="27%" align="left" class="FormInnerRowBottomBorder">Well 
              Developed / Well Nourished </td>
            <td width="5%" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Acute Distress</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Alert and Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableLeftCell">Eyes&nbsp;</td>
            <td align="left" class="FormInnerRowBottomBorder">No Scleral Icterus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Mucositis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Thrush</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
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
            <td align="left" class="FormInnerRowBottomBorder">Mucous Membranes 
              Moist</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
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
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">Nodes</td>
            <td align="left" class="FormInnerRowBottomBorder"> Cervical</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> Supraclavicular</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Axillary</td>
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
            <td align="left" class="FormInnerRowBottomBorder">Clear to Percusion<br/>
              and Auscultation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">C/V</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Regular Rate &amp; 
              Rhythm</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Murmurs</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">Abdomen</td>
            <td align="left" class="FormInnerRowBottomBorder">Soft Non-tender 
            </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" align="center" class="FormInsideTableRegCell">&nbsp;</td>
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
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No CVA Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="6" align="left" valign="top" class="FormInsideTableLeftCell">G/U</td>
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
            <td valign="top" class="FormInsideTableRegCell">Lesions:&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Yes&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">No: 
              __________________ </td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span>Testes Without Tenderness or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" align="left" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span> No Urethral Masses </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span>Normal Prostate Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span> No Pelvic or Rectal Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">M/S</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Clubbing or 
              Cyanosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Leg Swelling</td>
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
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Sensation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Rash or Ulcers</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
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
            <td align="left" valign="top" class="FormInsideTableLeftCell">Other:<br/></td>
            <td align="left" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU08<img src="../../Images/shim.gif" border="0" width="45" height="1">U12<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/21/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>



<div  align="left"  style="page-break-after:always;" id="LastPageInForm" runat="server" ><%--align="left" --%>

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U12*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              Urology Nephrectomy Follow-Up Patient</span><br/>            </td>
            <td width="50%" align="center" valign="bottom">
				<table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
                    <% =patientPostalCode  %>                  </td>
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
    <tr> 
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="3" class="blackBoldText">Impression &amp; Plan</td>
          </tr>
          <tr> 
            <td width="309" align="center" class="FormInsideTableTopCell"><strong>Diagnoses / Problem List</strong></td>
            <td width="32" align="center" class="FormInsideTableTopCell"><strong>New</strong></td>
            <td width="309" align="center" class="FormInsideTableTopCell"><strong>Plan &amp; Referrals</strong></td>
          </tr>
          <tr> 
            <td height="100" valign="top" class="FormInsideTableRegCell">1.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew1" type="checkbox" id="diagnosisNew1"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="100" valign="top" class="FormInsideTableRegCell">2.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew2" type="checkbox" id="diagnosisNew2"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="100" valign="top" class="FormInnerRowRightBorder">3.</td>
            <td align="center" valign="middle" class="FormInnerRowRightBorder"><input name="diagnosisNew3" type="checkbox" id="diagnosisNew3"></td>
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
    <tr> 
      <td height="45" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Comments</span></td>
    </tr>

	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" /> Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.
		</td>
	</tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="informedConsent" style="vertical-align: middle;" /> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.		</td>
	</tr>    <tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Disposition</span></td>
          </tr>
          <tr> 
            <td width="450" align="center" class="FormInnerRowRightBorder"> <table width="440" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="100" height="20">Prescriptions:</td>
                  <td width="80" align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1">Yes:</td>
                  <td>Refill &nbsp;&nbsp;or &nbsp;&nbsp;New</td>
                </tr>
                <tr> 
                  <td height="20" colspan="3">Rx: __________________________________________________________</td>
                </tr>
                <tr> 
                  <td height="20" colspan="3">Rx: __________________________________________________________</td>
                </tr>
                <tr> 
                  <td height="20">Chemo Orders:</td>
                  <td align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1">Yes:</td>
                  <td>____________________________________</td>
                </tr>
              </table></td>
            <td width="200" align="center"> <span>Protocol #: ________</span> 
              <br/> <table align="left" width="100%">
                <tr> 
                  <td>Considered:</td>
                  <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1">No</td>
                </tr>
                <tr> 
                  <td>Consent Obtained:</td>
                  <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1">No</td>
                </tr>
                <tr> 
                  <td>Registered:</td>
                  <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1">No</td>
                </tr>
              </table>
              <br/> <br/></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22"> 
              &#8805; 50% of attending time was spent in counseling <br/> <img src="../../Images/shim.gif" border="0" width="1" height="15"> 
              If so, mark total attending time in minutes &amp; describe on right:<br/> 
              <img src="../../Images/shim.gif" border="0" width="30" height="12"> 
              <input type="checkbox" name="15-24 (3)2">
              15-24 (3) &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="25-39 (4)2">
              25-39 (4) &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="40+ (5)2">
              40+ (5)</td>
            <td width="50%" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="1" height="11">Describe 
              Counseling or Dictate Note:</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="22" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5            </td>
            <td width="50%" rowspan="2"><span style="width: 60px;">Copy to:</span><input name="fellow222" type="checkbox" id="fellow223">
              referring M.D.: ________________________<br/>
			  <span style="width: 60px;">&nbsp;</span><input name="fellow2222" type="checkbox" id="fellow2222"> other: _______________________________</td>
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
<tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU08<img src="../../Images/shim.gif" border="0" width="45" height="1">U12<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/21/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr></table>
</div>

</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>