<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.DynamicInfusionCavernosometry" CodeFile="DynamicInfusionCavernosometry.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>

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
		<div  class="VerticalBarCodeDocType">*U47*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br />Dynamic Infusion Cavernosometry Report<br/></span></td>
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
				  <td align="left" colspan="3" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date:</span><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText"><% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Physician:</span></td>
				</tr>
			</table>
		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="100" valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">INDICATION:</span>&nbsp;&nbsp;&nbsp;</td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="80" valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">PROCEDURE:</span><br />
            The patient was brought into the DICC suite after completion of consent and positioned supine on the table. His genitalia were prepped with Betadine and 1% plain Xylocaine was given in the dorsal penile shaft. Two 21 gauge butterfly needles were placed, one in each corporal body and connected to the pump and pressure transducer.</td>
          </tr>
        </table>
	  </td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Agent:</td>
            <td height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"># Doses :</td>
            <td height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Starting BP :</td>
            <td height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Completion BP :</td>
          </tr>
          <tr> 
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BQE:</td>
            <td height="22" colspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Oral Agent Response :</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">ICI Reponse :</td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td  height="20" width="9%" class="FormInnerRowBottomBorder" align="center"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>DATE</span></td>
            <td width="13%" class="FormInsideTableLeftCell" align="center"><span class="blackBoldText">Peq <br />
            (mmHg)</span></td>
            <td  height="20" width="13%" class="FormInnerRowBottomBorder" align="center"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">FTM30 <br />(mls/min)</span></td>
            <td width="13%" class="FormInsideTableLeftCell" align="center"><span class="blackBoldText">FTM60<br />(mls/min)</span></td>
			<td width="13%" class="FormInnerRowBottomBorder" align="center"><span class="blackBoldText">FTM90<br />(mls/min)</span></td>
			<td width="13%" class="FormInsideTableLeftCell" align="center"><span class="blackBoldText">FTM120<br />(mls/min)</span></td>
			<td width="13%" class="FormInnerRowBottomBorder" align="center"><span class="blackBoldText">FTM150<br />(mls/min)</span></td>
			<td width="13%" class="FormInsideTableLeftCell" align="center"><span class="blackBoldText">PD<br />
			(mmHg/30sec)</span></td>
          </tr>
          <tr> 
            <td  height="20" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Run 1</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
			<td class="FormInnerRowBottomBorder">&nbsp;</td>
			<td class="FormInsideTableLeftCell">&nbsp;</td>
			<td class="FormInnerRowBottomBorder">&nbsp;</td>
			<td class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
          <tr> 
            <td  height="20" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Run 2</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
			<td class="FormInnerRowBottomBorder">&nbsp;</td>
			<td class="FormInsideTableLeftCell">&nbsp;</td>
			<td class="FormInnerRowBottomBorder">&nbsp;</td>
			<td class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
          <tr> 
            <td  height="20" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Run 3</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
			<td class="FormInnerRowBottomBorder">&nbsp;</td>
			<td class="FormInsideTableLeftCell">&nbsp;</td>
			<td class="FormInnerRowBottomBorder">&nbsp;</td>
			<td class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table align="left" border="0" class="pageWidth" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="20%" height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">AIG (L):</td>
            <td width="20%" height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">AIG (R):</td>
            <td width="60%" height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Findings:</td>
          </tr>
          <tr> 
            <td height="22" colspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Cavernosogram:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Findings:</td>
          </tr>
        </table>
	  </td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table align="left" border="0" class="pageWidth" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="33%" height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Curvature:</td>
            <td width="33%" height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Location:</td>
            <td width="33%" height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Degree:</td>
          </tr>
          <tr> 
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other deformity:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Location:</td>
			<td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Magnitude:</td>
          </tr>
		  <tr> 
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Waisting:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Instability:</td>
			<td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">&nbsp;</td>
          </tr>
		  <tr> 
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Erect length:<img src="../../Images/shim.gif" border="0" width="100" height="0">/cms</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Erect girth:<img src="../../Images/shim.gif" border="0" width="100" height="0">/cms</td>
			<td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">&nbsp;</td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table align="left" border="0" class="pageWidth" cellpadding="4" cellspacing="0">
	  	  <tr>
		  	<td align="left" colspan="3" class="FormInsideTableRegCell"><span class="blackBoldText">DIAGNOSIS</span></td>
          <tr> 
            <td width="33%" height="80" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">1.</td>
            <td width="33%" height="80" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">2.</td>
            <td width="33%" height="80" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">3.</td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table align="left" border="0" class="pageWidth" cellpadding="4" cellspacing="0">
	  	  <tr>
		  	<td align="left" colspan="3" class="FormInsideTableRegCell"><span class="blackBoldText">TREATMENT PLAN</span></td>
          <tr> 
            <td width="100%" height="100" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">1.</td>
          </tr>
		  <tr> 
            <td width="100%" height="100" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">2.</td>
          </tr>
		  <tr> 
            <td width="100%" height="100" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">3.</td>
          </tr>
		  <tr> 
            <td width="100%" height="20" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">The bandage was removed from the penis prior to discharge. The patient was discharged with a detumesced penis in stable condition.</td>
          </tr>
        </table>
	  </td>
    </tr>
	<tr> 
		 <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="40" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span>
		  
		  <asp:Label id="PhysicianSignatureLabel" runat="server" Font-Bold="true" ><br/><img src="../../Images/shim.gif" border="0" width="280" height="1"></asp:Label>

		  
		  </td>
    </tr>
	<tr>
		<td class="FormOuterTableRow" align="center"><span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span></td>
	</tr>
	<tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU42<img src="../../Images/shim.gif" border="0" width="45" height="1">U47<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 2/09<img src="../../Images/shim.gif" border="0" width="45" height="8">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">1</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">42</span></td>
	</tr>


  </table>
</div>

</div>