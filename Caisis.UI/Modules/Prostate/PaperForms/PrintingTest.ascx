<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.PrintingTest" CodeFile="PrintingTest.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>




<div id="PaperFormStart">



<div align="left" >


<div align="right">
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
	  	<table align="center" border="0" width="840" cellpadding="4" cellspacing="0">
            <tr> 
              <td width="420" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
                test<br/>
              </span></td>
              <td width="420" align="center" valign="bottom">
				<table  width="420" border="0" cellspacing="1" cellpadding="0" >
					<tr> 
						<td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
						<td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
					</tr>
					<tr> 
						<td align="right"><% =patientMRNLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left"><strong><% =patientMRN  %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% =patientDOB  %></td>
					</tr>
					<tr> 
						<td colspan="1" align="right"><% =patientNameLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td colspan="1" align="left"><strong><% =patientFirstName  %> <% =patientMiddleName  %> <% =patientLastName  %></strong></td>
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
		</table>	  </td>
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
      <td height="540" class="FormOuterTableRow">&nbsp;</td>
    </tr>
	<tr> 
      <td height="540" class="FormOuterTableRow">&nbsp;</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU14<img src="../../Images/shim.gif" border="0" width="45" height="1">U18<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:12/09/04<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">14</span></td>
    </tr>
</table>
</div>

<div style="page-break-before:always;" />

<div align="left"  >

<div align="right">
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
			<table align="center" border="0" width="840" cellpadding="4" cellspacing="0">
            <tr> 
              <td width="420" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
                test<br/>
              </span></td>
              <td width="420" align="center" valign="bottom">
				<table  width="420" border="0" cellspacing="1" cellpadding="0" >
					<tr> 
						<td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
						<td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
					</tr>
					<tr> 
						<td align="right"><% =patientMRNLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left"><strong><% =patientMRN  %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% =patientDOB  %></td>
					</tr>
					<tr> 
						<td colspan="1" align="right"><% =patientNameLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td colspan="1" align="left"><strong><% =patientFirstName  %> <% =patientMiddleName  %> <% =patientLastName  %></strong></td>
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
		</table>		  </td>
		</tr>
    <tr> 
      <td width="650" height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr > 
      <td height="600" colspan="8" class="FormOuterTableRow">&nbsp;</td>
    </tr>
	<tr> 
      <td height="100" class="FormOuterTableRow">&nbsp;</td>
	</tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU14<img src="../../Images/shim.gif" border="0" width="45" height="1">U18<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 8/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:12/09/04<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">14</span></td>
    </tr>
  </table>
</div>

<div style="page-break-before:always;" />

<div id="LastPageInForm" runat="server" align="left" >

<div align="right">
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
		<table align="center" border="0" width="840" cellpadding="4" cellspacing="0">
            <tr> 
              <td width="420" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
                test<br/>
              </span></td>
              <td width="420" align="center" valign="bottom">
				<table  width="420" border="0" cellspacing="1" cellpadding="0" >
					<tr> 
						<td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
						<td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
					</tr>
					<tr> 
						<td align="right"><% =patientMRNLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td align="left"><strong><% =patientMRN  %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% =patientDOB  %></td>
					</tr>
					<tr> 
						<td colspan="1" align="right"><% =patientNameLabel  %>&nbsp;&nbsp;&nbsp;</td>
						<td colspan="1" align="left"><strong><% =patientFirstName  %> <% =patientMiddleName  %> <% =patientLastName  %></strong></td>
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
		</table>	  </td>
	</tr>
    <tr> 
      <td width="650" height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td height="600" colspan="8" class="FormOuterTableRow">&nbsp;</td>
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
