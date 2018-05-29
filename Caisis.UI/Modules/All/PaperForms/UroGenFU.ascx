<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.UroGenFU" CodeFile="UroGenFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>




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
		<div  class="VerticalBarCodeDocType">*U21*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology General Follow Up<br/></span></td>
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
    <tr bgcolor="#FFFFFF" > 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td align="left" valign="top" height="130" class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Chief 
              Complaint<br> <br> <br> <br> </td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#FFFFFF" > 
      <td class="FormOuterTableRow" height="100" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">HPI</span> 
     <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	  <span><img id="HpiSpacer" runat="server" src="../../Images/shim.gif" border="0" width="4" height="1">Cancer Diagnosis :
	  <img src="../../Images/shim.gif" border="0" width="75" height="8">Urology Issue :
	  <img src="../../Images/shim.gif" border="0" width="75" height="8">Dx Date :
	  <img src="../../Images/shim.gif" border="0" width="75" height="8">2002 TNM Stage: </td>
    </tr>
    <tr>
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td ><table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes" />
                    NKA&nbsp;&nbsp;
                    <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes" />
                    Unchanged Since Last Visit</span></td>
                </tr>
                <tr align="center">
                  <td width="40%" class="FormInsideTableRegCell">Allergen</td>
                  <td class="FormInnerRowBottomBorder">Reaction</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>

            </table></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="100" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15" />Comorbidities</span></td>
    </tr>
    <tr>
      <td height="125" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15" />Medical 
        &amp; Surgical History</span></td>
    </tr>
    
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU17<img src="../../Images/shim.gif" border="0" width="45" height="1">U21<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">17</span></td>
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
		<div  class="VerticalBarCodeDocType">*U21*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology General Follow Up<br/></span></td>
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
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15" />Lab 
        Tests</span><br />
            <table align="center" border="0"  class="pageWidth" cellpadding="4" cellspacing="0">
              <tr>
                <td colspan="2" class="FormInsideTableTopCell"><strong>Date:</strong></td>
                <td colspan="2" class="FormInsideTableTopCell"><strong>Date:</strong></td>
                <td colspan="2" class="FormInsideTableTopCell"><strong>Date:</strong></td>
                <td colspan="2" class="FormInsideTableTopCell"><strong>Date:</strong></td>
              </tr>
              <tr align="center">
                <td width="13%" class="FormInsideTableRegCell"><strong>Test</strong></td>
                <td width="12%" height="12" class="FormInsideTableRegCell"><strong>Result</strong></td>
                <td width="13%" class="FormInsideTableLeftCell"><strong>Test</strong></td>
                <td width="12%" class="FormInsideTableRegCell"><strong>Result</strong></td>
                <td width="13%" class="FormInsideTableLeftCell"><strong>Test</strong></td>
                <td width="12%" class="FormInsideTableRegCell"><strong>Result</strong></td>
                <td width="13%" height="12" class="FormInsideTableLeftCell"><strong>Test</strong></td>
                <td width="12%" class="FormInsideTableRegCell"><strong>Result</strong></td>
              </tr>
              <tr class="FormInsideTableRegCell">
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
              </tr>
              <tr class="FormInsideTableRegCell">
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
              </tr>
              <tr class="FormInsideTableRegCell">
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
              </tr>
              <tr class="FormInsideTableRegCell">
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
              </tr>
              <tr class="FormInsideTableRegCell">
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
              </tr>
              <tr class="FormInsideTableRegCell">
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td height="12" class="FormInsideTableLeftCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
              </tr>
          </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Imaging</span><span><img src="../../Images/shim.gif" border="0" width="12" height="1" />
            <input type="checkbox" name="Films Reviewed" />
        Films Reviewed<br />
        </span>
          <table align="center" border="0"  class="pageWidth" cellpadding="2" cellspacing="0">
            <tr>
              <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
              <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
              <td width="35%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
              <td width="35%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
            </tr>
            <tr>
              <td height="36" class="FormInsideTableRegCell">&nbsp;</td>
              <td class="FormInsideTableRegCell">&nbsp;</td>
              <td class="FormInsideTableRegCell">&nbsp;</td>
              <td class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
            <tr>
              <td height="36" class="FormInsideTableRegCell">&nbsp;</td>
              <td class="FormInsideTableRegCell">&nbsp;</td>
              <td class="FormInsideTableRegCell">&nbsp;</td>
              <td class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
            <tr>
              <td height="36" class="FormInsideTableRegCell">&nbsp;</td>
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
    <tr>
      <td class="FormOuterTableRow"><table  class="pageWidth" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="6"><img src="../../Images/shim.gif" border="0" width="4" height="16" /><span class="blackBoldText">Procedures: 
              Endoscopies</span></td>
          </tr>
          <tr>
            <td width="12%" align="center" class="FormInsideTableTopLeftCell">Date</td>
            <td width="12%" align="center" class="FormInsideTableTopCell">Procedure</td>
            <td width="40%" align="center" class="FormInsideTableTopCell">Findings</td>
            <td width="16%" align="center" class="FormInsideTableTopCell">Pathology</td>
            <td width="10%" align="center" class="FormInsideTableTopCell">Cytology</td>
            <td width="10%" align="center" class="FormInsideTableTopCell">Pathology 
              Source</td>
          </tr>
          <tr>
            <td height="36" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="36" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>

      </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU17<img src="../../Images/shim.gif" border="0" width="45" height="1">U21<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">17</span></td>
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
		<div  class="VerticalBarCodeDocType">*U21*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology General Follow Up<br/></span></td>
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
        Performing Review:<span class="smallGrayText"> &nbsp;&nbsp; 
        <input type="checkbox" name="PA22" value="Yes">
        RN&nbsp;&nbsp;&nbsp; </span> 
        <input type="checkbox" name="PA2" value="Yes">
        PA/NP&nbsp;&nbsp;&nbsp; 
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
            <td rowspan="6" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">General</td>
            <td align="left" class="FormInsideTableRegCell" >Fever</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="6" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr >
            <td align="left" class="FormInsideTableRegCell" >Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            </tr>
          <tr >
            <td align="left" class="FormInsideTableRegCell">Anemia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr >
            <td align="left" class="FormInsideTableRegCell">PAP Smear </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr >
            <td align="left" class="FormInsideTableRegCell">Colonoscopy</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr > 
            <td align="left" class="FormInsideTableRegCell">Mammogram</td>
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
            <td rowspan="2" class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr > 
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
            <td class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">CV</td>
            <td align="left" class="FormInsideTableRegCell" >Angina</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder" >&nbsp;</td>
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
            <td rowspan="3" class="FormInnerRowBottomBorder" >&nbsp;</td>
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
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">GI</td>
            <td align="left" class="FormInsideTableRegCell" >Nausea</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="4" class="FormInnerRowBottomBorder" >&nbsp;</td>
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
          <tr> 
            <td rowspan="9" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">GU</td>
            <td align="left" class="FormInsideTableRegCell" >Dysuria</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="9" class="FormInnerRowBottomBorder" >&nbsp;</td>
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
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">MS</td>
            <td align="left" class="FormInsideTableRegCell" >Joint Pain</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Lower Extremity Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
		  <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Psych</td>
            <td align="left" class="FormInsideTableRegCell" >Anxiety/Depression</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Heme</td>
            <td align="left" class="FormInsideTableRegCell" >Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin</td>
            <td align="left" class="FormInsideTableRegCell" >Rash</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td class="FormInnerRowBottomBorder" >&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Endo</td>
            <td align="left" class="FormInsideTableRegCell" >Heat/cold Intolerance</td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" >&nbsp;</td>
            <td rowspan="3" class="FormInnerRowBottomBorder" >&nbsp;</td>
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
            <td align="left" valign="top" ><img src="../../Images/shim.gif" border="0" width="4" height="0">Other</td>
            <td align="left" class="FormInnerRowRightBorder" >&nbsp;</td>
            <td align="center" class="FormInnerRowRightBorder" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowRightBorder" ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowRightBorder" >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="35" class="FormOuterTableRow">&nbsp;
          <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes" />
          <span class="blackBoldText"> PFSH and ROS performed by:  ___________________________<img src="../../Images/shim.gif" border="0" width="10" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="10" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU17<img src="../../Images/shim.gif" border="0" width="45" height="1">U21<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">17</span></td>
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
		<div  class="VerticalBarCodeDocType">*U21*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology General Follow Up<br/></span></td>
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
        <input type="checkbox" name="NP22" value="Yes">
        PA / NP&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow23" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending23" value="Yes">
        Attending</span> <br> 
        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
              Symptoms</strong><strong></strong></td>
            <td width="30" align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td width="10%" align="center" class="FormInsideTableTopCell"><strong>Attnd<br>
              Performed</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Gen</td>
            <td align="left" class="FormInnerRowBottomBorder">Well Developed / 
              Well Nourished</td>
            <td width="30" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td width="46%" rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Acute Distress</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Alert &amp; Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Eyes&nbsp;</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Scleral Icterus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
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
            <td align="left" class="FormInnerRowBottomBorder">Mucous Membrane 
              Moist</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Nodes</td>
            <td align="left" class="FormInnerRowBottomBorder"> Cervical</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> Supraclavicular</td>
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
            <td align="left" class="FormInnerRowBottomBorder">Clear to Percusion<br>
              and Auscultation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">C/V</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Regular Rate and 
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
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="7" align="left" valign="top" class="FormInsideTableLeftCell">Abdomen</td>
            <td align="left" class="FormInnerRowBottomBorder">Well Healed Incision</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="7" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Soft Non-tender 
            </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Bowel Sounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Masses or Tenderness</td>
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
            <td align="left" class="FormInnerRowBottomBorder">No Hernia</td>
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
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No CVA Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="11" align="left" valign="top" class="FormInsideTableLeftCell">GU<br>
              Male</td>
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
            <td align="left" class="FormInnerRowBottomBorder">Testes w/o Tenderness 
              or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="9" align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/ProstateImageURONVWeb.gif" width="196" height="97"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Prostate 
              Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Variocele Present</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Rectal Tone</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Pelvic Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Palpable Penile 
              Plaque or Fibrosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Empty Prostatic 
              Fossa</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Rectal Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Rectal Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Gyn</td>
            <td align="left" class="FormInnerRowBottomBorder">Normal Pelvic Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">M/S</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Clubbing or 
              Cyanosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Pedal Pulses</td>
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
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Sensation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Rashes or Ulcers</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
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
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Other:<br></td>
            <td align="left" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU17<img src="../../Images/shim.gif" border="0" width="45" height="1">U21<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">17</span></td>
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
		<div  class="VerticalBarCodeDocType">*U21*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology General Follow Up<br/></span></td>
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
            <td height="41" valign="top" class="FormInsideTableRegCell">1.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="41" valign="top" class="FormInsideTableRegCell">2.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="41" valign="top" class="FormInsideTableRegCell">3.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="41" valign="top" class="FormInsideTableRegCell">4.</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="41" valign="top" class="FormInnerRowRightBorder">5.</td>
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
      <td height="100" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Comments</span></td>
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
      <td valign="top" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" valign="top" class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22"> 
              &#8805; 50% of attending time was spent in counseling <br> <img src="../../Images/shim.gif" border="0" width="1" height="20"> 
              If so, mark total attending time in minutes &amp; describe on right:<br> 
              <img src="../../Images/shim.gif" border="0" width="30" height="12"> 
              <input type="checkbox" name="15-24 (3)22">
              40-59 (3) &nbsp;&nbsp; <input type="checkbox" name="25-39 (4)22">
              60-79 (4) &nbsp;&nbsp; <input type="checkbox" name="40+ (5)22">
              80+ (5)</td>
            <td width="50%" height="100" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="1" height="11" /><strong>Describe 
              Counseling or Dictate Note:</strong><br />
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:6px;">
                  <tr>
                    <td width="50%" align="left" valign="middle"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Risk / Benefits of Surgery</td>
                    <td width="50%" align="left" valign="middle"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Radiology Findings</td>
                  </tr>
                  <tr>
                    <td align="left" valign="middle" style="padding-top:5px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Pathology Findings </td>
                    <td align="left" valign="middle" style="padding-top:5px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />&nbsp;Above Treatment Plan </td>
                  </tr>
                  <tr>
                    <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                    <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                    <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                    <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                    <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                  </tr>
              </table></td>
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
            <td colspan="4"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Attending Addendum:&nbsp;&nbsp;&nbsp;____________________________________________________________________<br></span></td>
            </tr>
          <tr>
            <td colspan="4"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="136" height="1">____________________________________________________________________</span></td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU17<img src="../../Images/shim.gif" border="0" width="45" height="1">U21<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">17</span></td>
    </tr>
  </table>
</div>


</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>