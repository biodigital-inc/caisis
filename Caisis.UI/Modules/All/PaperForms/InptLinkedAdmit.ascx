<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.InptLinkedAdmit" CodeFile="InptLinkedAdmit.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>



<div id="PaperFormStart">


<div align="left"  id="LastPageInForm" runat="server" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U32*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Genitourinary / Head and Neck Service<br/>Attending Inpatient Progress Note: Linked<br/></span></td>
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
	  		<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td align="left" colspan="3" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date:</span><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText"><% =apptClinicDate %></span></td>
				</tr>
				<tr>
				  <td colspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Linked Admission Follow-up and Discharge</span></td>
				  <!--<td align="right"><span class="blackBoldText">Room #:</span></td>-->
				  <!--<td width="15%">&nbsp;<span class="blackBoldText"><% =InPatientRoomNumber  %></span></td>-->
				</tr>
				<tr>
				  <td align="left" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">Admission</span><img src="../../Images/shim.gif" border="0" width="50" height="1"><span><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">Follow-up</span><img src="../../Images/shim.gif" border="0" width="50" height="1"><span><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">Discharge</span></td>
				  <td align="right"><span class="blackBoldText">Admit Date:</span></td>
				  <td width="15%">&nbsp;<span class="blackBoldText"><% =InPatientAdmitDate  %></span></td>
				</tr>
			</table>
		</td>
    </tr>
    <tr> 
      <td height="60" valign="middle" align="left" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">The 
        patient was interviewed and examined by me with Dr. __________________________________________.<br>
        <img src="../../Images/shim.gif" border="0" width="4" height="1">His/her 
        findings were confirmed or corrected and the plan reviewed. I agree with 
        the history, physical exam, <br>
        <img src="../../Images/shim.gif" border="0" width="4" height="1">and plan 
        as documented in his/her note.</span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
	  	<table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;<!--<strong><% =InPatientAdmitReason  %></strong>--></td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="37" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
		<tr> 
			<td><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Signature</span><br>
			<img src="../../Images/shim.gif" border="0" width="4" height="20"><span class="blackBoldText">Attending:<img src="../../Images/shim.gif" border="0" width="15" height="8">______________________________________________<img src="../../Images/shim.gif" border="0" width="40" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="22" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM</span></span></td>
		</tr>
		<tr>
		<td align="center"><span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span></td>
		</tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	   	<table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
       	  <tr>
			<td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Discharge Day Only</span>
				<br>
				<br><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">&nbsp;Discussed the Care Plan with the patient and Family; and Instructed the caregivers.
				<br>
				<br>
              <img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">&nbsp;I have supervised preparation of Discharge records, Prescriptions, 
              and Referral Forms. <br>
				<br><img src="../../Images/shim.gif" border="0" width="4" height="1"><span><strong>Total Attending time in Minutes:</strong></span><img src="../../Images/shim.gif" border="0" width="20" height="1"><span><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">&lt;30 minutes</span><img src="../../Images/shim.gif" border="0" width="20" height="1"><span><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">&gt;30 minutes</span>
			</td>
		   </tr>
			<tr> 
				 <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Signature</span><br>
				  <img src="../../Images/shim.gif" border="0" width="4" height="20"><span class="blackBoldText">Attending:<img src="../../Images/shim.gif" border="0" width="15" height="8">______________________________________________<img src="../../Images/shim.gif" border="0" width="40" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="22" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM</span></span>
				  
				  
				  <asp:Label id="PhysicianSignatureLabel" runat="server" Font-Bold="true" ><br/><img src="../../Images/shim.gif" border="0" width="240" height="1"></asp:Label>
				  
			  </td>
			</tr>
			<tr>
				<td class="FormInnerRowBottomBorder" align="center"><span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span></td>
			</tr>
	    </table>
	  </td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU28<img src="../../images/shim.gif" border="0" width="45" height="1">U32<img src="../../images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../images/shim.gif" border="0" width="45" height="8">rev:11/16/10<!--rev:9/17/04--><img src="../../images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">1</span><img src="../../images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">28</span></td>
    </tr>
  </table>
</div>

</div>