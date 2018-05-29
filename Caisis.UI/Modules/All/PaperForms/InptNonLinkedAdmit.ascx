<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.InptNonLinkedAdmit" CodeFile="InptNonLinkedAdmit.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>

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
		<div  class="VerticalBarCodeDocType">*U39*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Genitourinary / Head and Neck Service<br/>Attending Inpatient Admission: Non-Linked<br/></span></td>
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
				  <td><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Non-Linked Admission Note</span></td>
				  <td align="right"><span class="blackBoldText">Admit Date:</span></td>
				  <td width="15%">&nbsp;<span class="blackBoldText"><% =InPatientAdmitDate  %></span></td>
				  <!--<td align="right"><span class="blackBoldText">Room #:</span></td>-->
				  <!--<td width="15%">&nbsp;<span class="blackBoldText"><% =InPatientRoomNumber  %></span></td>-->
				</tr>
			</table>
		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">History of Present Illness:</span>
	   <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" width="15%" valign="bottom"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Primary Site:</span></td>
            <td width="35%" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td width="15%" valign="bottom"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Prior Therapy:</span></td>
            <td width="35%">&nbsp;</td>
		  </tr>
          <tr>
            <td height="30" valign="bottom"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Histologic Type:</span></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
            <td colspan="2" rowspan="3" class="">&nbsp;</td>
		  </tr>
          <tr>
            <td height="30" valign="bottom"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Metastatic Site:</span></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
		  </tr>
          <tr>
            <td height="2" colspan="4">&nbsp;</td>
		  </tr>
		</table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="20" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Reason for Admission \ Symptoms:</span>&nbsp;&nbsp;&nbsp;<!--<strong><% =InPatientAdmitReason  %></strong>--></td>
          </tr>
          <tr> 
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" class="FormInnerRowBottomBorder" align="right" valign="bottom">&nbsp;</td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="25" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Other 
              Medical Problems:</span></td>
          </tr>
          <tr> 
            <td height="26" class="FormInnerRowBottomBorder" align="right" valign="bottom">&nbsp;</td>
          </tr>
        </table>
	  </td>
    </tr>
	<tr>
	  <td class="FormOuterTableRow">
		  <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td height="30"><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0"><span><strong>&nbsp;I agree with the Past Med/Surg Hx, S&amp;P Hx, FHx as documented by the NP dated ____/____/____.</strong></span></td>
			</tr>
			<tr>
				<td height="20"><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0"><span><strong>&nbsp;Review of symptoms is as documented by the NP on the Adult Initial Admission / Chemotherapy <br><img src="../../Images/shim.gif" border="0" width="20" height="1">Assessment dated  ____/____/____.&nbsp;&nbsp;The Review of Symptoms is otherwise negative.</strong></span></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
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
      <td class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="20" colspan="4" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Physical Exam:</span></td>
          </tr>
          <tr> 
            <td  height="26" width="10%" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>General:</span></td>
            <td width="40%" class="FormInsideTableLeftCell">&nbsp;</td>
            <td  height="20" width="10%" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Abd/GI:</span></td>
            <td width="40%" class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
          <tr> 
            <td  height="26" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Psych:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Rectal:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
          <!-- Verify that this is the correct exam and expand to full word -->
          <tr> 
            <td  height="26" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Eyes:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Neuro:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
          <tr> 
            <td  height="26" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>ENT/Mouth:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>MS/Extr:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
          <tr> 
            <td  height="26" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Nodes:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Skin:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
          <tr> 
            <td  height="26" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Lungs:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>GU/GYN:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
          <tr> 
            <td  height="26" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>CV:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="8" height="8"><span>Back:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
          <tr> 
            <td  height="26" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Breasts:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Masses:</span></td>
            <td class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
          <tr> 
            <td  height="26" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span>Other:</span></td>
            <td colspan="3" class="FormInsideTableLeftCell">&nbsp;</td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="20"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Comments \ Diagrams:</span></td>
          </tr>
          <tr> 
            <td height="26">&nbsp;</td>
          </tr>
		  <tr> 
            <td height="26">&nbsp;</td>
          </tr>
        </table>
	  </td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="20" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Labs \ Imaging:</span></td>
          </tr>
          <tr> 
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="26" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="20" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Impressions:</span></td>
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
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="20" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Plan:</span></td>
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
        </table>
	  </td>
    </tr>
	<tr> 
		 <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Signature</span><br>
		  <img src="../../Images/shim.gif" border="0" width="4" height="20"><span class="blackBoldText">Attending:<img src="../../Images/shim.gif" border="0" width="15" height="8">___________________________________________________________________</span>
		  
		  <asp:Label id="PhysicianSignatureLabel" runat="server" Font-Bold="true" ><br/><img src="../../Images/shim.gif" border="0" width="280" height="1"></asp:Label>

		  
		  </td>
    </tr>
	<tr>
		<td class="FormOuterTableRow" align="center"><span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span></td>
	</tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU29<img src="../../images/shim.gif" border="0" width="45" height="1">U39<img src="../../images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../images/shim.gif" border="0" width="45" height="8"><!--rev:9/17/04--><img src="../../images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">1</span> of <span id="TotalPages">1</span><img src="../../images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">29</span></td>
    </tr>
  </table>
</div>

</div>