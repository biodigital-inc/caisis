<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.PaperForms.UroBladEndoOR" CodeFile="UroBladEndoOR.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>




<asp:PlaceHolder id="PreOpFormHolder" runat="server"></asp:PlaceHolder>


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
		<div  class="VerticalBarCodeDocType">*U10*</div>
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
              Urology Endoscopy OR Patient</span><br/>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span><img src="../../Images/shim.gif" border="0" width="290" height="1"><span class="blackBoldText">Surgeon:</span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="50%" height="22" align="left" class="FormInnerRowNoBorder">Referring&nbsp;M.D.&nbsp;<%= institutionShortName%>: 
            </td>
            <td width="50%" height="22" align="left" class="FormInnerRowNoBorder">Non-<%= institutionShortName%>: 
            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Diagnosis</span></td>
          </tr>
          <tr valign="top"> 
            <td width="50%" class="FormInnerRowRightBorder">Preoperative:</td>
            <td width="50%">Postoperative:<br/> <br/> <br/> <br/>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">2002 
        Clinical TNM Stage</span><img src="../../Images/shim.gif" border="0" width="30" height="1">T0<img src="../../Images/shim.gif" border="0" width="30" height="1">TA<img src="../../Images/shim.gif" border="0" width="30" height="1">TIS<img src="../../Images/shim.gif" border="0" width="30" height="1">T1<img src="../../Images/shim.gif" border="0" width="30" height="1">T2<img src="../../Images/shim.gif" border="0" width="30" height="1">T3<img src="../../Images/shim.gif" border="0" width="30" height="1">T4<br/> 
        <img src="../../Images/shim.gif" border="0" width="195" height="14">Grade: 
        <img src="../../Images/shim.gif" border="0" width="30" height="1"> <input type="checkbox" name="No22">
        Papilloma<img src="../../Images/shim.gif" border="0" width="30" height="1"> 
        <input type="checkbox" name="No222">
        Low Grade<img src="../../Images/shim.gif" border="0" width="30" height="1"> 
        <input type="checkbox" name="No223">
        High Grade</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table  class="pageWidth" border="0" cellspacing="4" cellpadding="0">
  <tr>
    <td class="blackBoldText" style="width: 15%">Anesthesia</td>
    <td style="width: 25%"><input type="checkbox" >Monitored Sedation</td>
    <td style="width: 20%"><input type="checkbox" >General</td>
    <td style="width: 40%"><input type="checkbox" >2% Xylocaine Jelly</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="checkbox">Spinal</td>
    <td><input type="checkbox">None</td>
    <td>&nbsp;</td>
  </tr>
</table>

	  
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table class="pageWidth" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td colspan="8" valign="middle" class="FormInnerRowBottomBorder"><span class="blackBoldText">Procedures</span></td>
          </tr>
          <tr> 
            <td width="5%" height="19" valign="middle" class="FormInsideTableRegCell"><input type="checkbox" name="No2432"></td>
            <td width="27%" valign="middle" class="FormInsideTableRegCell">Cystoscopy<br/></td>
            <td width="2%" valign="middle">&nbsp;</td>
            <td width="5%" valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No243132"></td>
            <td width="27%" valign="middle" class="FormInnerRowBottomBorder">Cold Cup Biopsy</td>
            <td width="2%" valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td width="5%" valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No243132"></td>
            <td width="27%" valign="middle" class="FormInnerRowBottomBorder">Cystogram</td>
		  </tr>
          <tr> 
            <td height="19" valign="middle" class="FormInsideTableRegCell"><input type="checkbox" name="No24322"></td>
            <td valign="middle" class="FormInsideTableRegCell">EUA</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24324"></td>
            <td valign="middle" class="FormInnerRowBottomBorder">Transurethral Fulguration </td>
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24324"></td>
            <td valign="middle" class="FormInnerRowBottomBorder">Loopogram</td>
		  </tr>
          <tr> 
            <td height="19" valign="middle" class="FormInsideTableRegCell"><input type="checkbox" name="No24323"></td>
            <td valign="middle" class="FormInsideTableRegCell">TUR-BT</td>
            <td valign="middle" >&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24325"></td>
            <td valign="middle" class="FormInnerRowBottomBorder">Urethra Biopsy</td>
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No243132"></td>
            <td valign="middle" class="FormInnerRowBottomBorder">Urethrogram</td>
		  </tr>
          <tr> 
            <td height="19" valign="middle" class="FormInsideTableRegCell"><input type="checkbox" name="No243232"></td>
            <td valign="middle" class="FormInsideTableRegCell">Transurethral Biopsy</td>
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No243252"></td>
            <td colspan="4" valign="middle" class="FormInnerRowBottomBorder">Ureter Biopsy<img src="../../Images/shim.gif" border="0" width="30" height="8">Side:<span class="smallGrayText"><input type="checkbox" name="Nurse2133222" value="Yes">
              </span>Left<img src="../../Images/shim.gif" border="0" width="20" height="8"><span class="smallGrayText"><input type="checkbox" name="Nurse2134222" value="Yes"></span>Right</td>
		  </tr>
          <tr> 
            <td valign="top" class="FormInnerRowRightBorder"> <input type="checkbox" name="No2431318"></td>
            <td colspan="8" valign="top"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="12"></span>Other 
              (specify):</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <!-- <tr class="eFormInnerTableRow">
						<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br/></td>
						<td colspan="1" align="left" valign="top"></td>
					</tr> -->
          <tr> 
            <td colspan="5" class="FormInnerRowBottomBorder"><span class="blackBoldText">Radiographic 
              Findings / Upper Tracts</span></td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td colspan="5" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse222222" value="Yes"></span>None Examined</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td colspan="2" align="center" class="FormInsideTableRegCell"><strong>Examined</strong></td>
            <td width="13%" align="center" class="FormInsideTableRegCell"><strong>Normal</strong></td>
            <td width="12%" align="center" class="FormInsideTableRegCell"><strong>Abnormal</strong></td>
            <td width="53%" align="center" class="FormInnerRowBottomBorder"><strong>Comments</strong></td>
          </tr>
          <tr> 
            <td width="2%" align="left" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse22222" value="Yes"></span></td>
            <td width="20%" align="left" class="FormInsideTableRegCell"><span class="smallGrayText"></span>Urogram</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse2222" value="Yes"></span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse2322" value="Yes"></span></td>
            <td align="center" height="40" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
		  <tr> 
            <td  align="left" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse22222" value="Yes"></span></td>
            <td  align="left" class="FormInsideTableRegCell"><span class="smallGrayText"></span>Retrogrades (Left)</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse2222" value="Yes"></span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse2322" value="Yes"></span></td>
            <td align="center" height="40" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell"><span class="smallGrayText"></span>Retrogrades (Right)</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse22225" value="Yes"></span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse22226" value="Yes"></span></td>
            <td align="center" height="40" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse22223" value="Yes"></span></td>
            <td align="left" class="FormInsideTableRegCell">Ureteroscopy (Left)</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse2422" value="Yes"></span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse2522" value="Yes"></span></td>
            <td align="center" height="40" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Ureteroscopy (Right)</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse2622" value="Yes"></span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><input type="checkbox" name="Nurse2722" value="Yes"></span></td>
            <td align="center" height="40" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Tumor</span></td>
          </tr>
          <tr> 
            <td height="26" colspan="2" class="FormInnerRowBottomBorder">Number: 
              <span class="blackBoldText"></span> <img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2132" value="Yes">
              </span>1<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2133" value="Yes">
              </span>2<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2134" value="Yes">
              </span>3<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2135" value="Yes">
              </span>4<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2136" value="Yes">
              </span>5<img src="../../Images/shim.gif" border="0" width="30" height="1">Other: 
              ______________</td>
          </tr>
          <tr> 
            <td height="26" class="FormInsideTableRegCell">Size (Largest): ____________ 
              cm</td>
            <td height="26" class="FormInnerRowBottomBorder">Size range: ____________ 
              cm&nbsp;&nbsp;&nbsp;to &nbsp;&nbsp; ____________ cm</td>
          </tr>
          <tr> 
            <td height="26" colspan="2" class="FormInnerRowBottomBorder">Total 
              area of tumors resected:<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse213222" value="Yes">
              </span>&lt; 2 cm<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse213322" value="Yes">
              </span>2-5 cm<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse213422" value="Yes">
              </span>&#8805; 5 cm</td>
          </tr>
          <tr> 
            <td height="26" colspan="2" class="FormInnerRowBottomBorder">Morphology:<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21322" value="Yes">
              </span>Scar<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21332" value="Yes">
              </span>Solid / Nodular<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21342" value="Yes">
              </span>TIS<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21352" value="Yes">
              </span>Papillary</td>
          </tr>
          <tr> 
            <td width="50%" height="26" class="FormInnerRowRightBorder">Margins:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21323" value="Yes">
              </span>Well-Circumscribed<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21333" value="Yes">
              </span>Ill-Defined</td>
            <td width="50%" height="26">Completely Resected: <img src="../../Images/shim.gif" border="0" width="40" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21324" value="Yes">
              </span>Yes<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21334" value="Yes">
              </span>No</td>
          </tr>
        </table></td>
    </tr>
	
	<tr> 
      <td class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="5" valign="middle" class="FormInsideTableTopLeftCell"><span class="blackBoldText">Intervening 
              Mucosa</span></td>
          </tr>
          <tr> 
            <td width="3%" valign="middle" class="FormInsideTableRegCell"> <input type="checkbox" name="No24326"></td>
            <td width="46%" valign="middle" class="FormInsideTableRegCell">Normal<br/>            </td>
            <td width="2%" valign="middle">&nbsp;</td>
            <td width="3%" valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2431322"></td>
            <td width="46%" valign="middle" class="FormInnerRowBottomBorder">Inflammatory</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableRegCell"> <input type="checkbox" name="No243222"></td>
            <td valign="middle" class="FormInsideTableRegCell">CIS</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No243242"></td>
            <td valign="middle" class="FormInnerRowBottomBorder">Radiation Cystitis</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td valign="top" class="FormInnerRowRightBorder"> <input type="checkbox" name="No24313182"></td>
            <td colspan="4" valign="top"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="12"></span>Other 
              (specify):<br/> </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="25" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Other 
        Bladder Findings&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText"> 
        <input type="checkbox" name="Nurse214" value="Yes">
        Trabeculation&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="NP22" value="Yes">
        Diverticula&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="PA22" value="Yes">
        Other (specify): ___________________</span></td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU06<img src="../../Images/shim.gif" border="0" width="45" height="1">U10<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:12/27/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ORPROC</td>
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
		<div  class="VerticalBarCodeDocType">*U10*</div>
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
              Urology Endoscopy OR Patient</span><br/>            </td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td align="center" class="FormOuterTableRow"><img src="../../Images/FormImages/BladderDiagramCysview.gif" class="pageWidth98percent"></td>
	</tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU06<img src="../../Images/shim.gif" border="0" width="45" height="1">U10<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:12/27/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ORPROC</td>
    </tr>
  </table>
</div>

<div id="LastPageInForm" runat="server" align="left" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U10*</div>
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
              Urology Endoscopy OR Patient</span><br/>            </td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <!-- <tr class="eFormInnerTableRow">
						<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br/></td>
						<td colspan="1" align="left" valign="top"></td>
					</tr> -->
          <tr> 
            <td colspan="4" class="FormInnerRowBottomBorder"><span class="blackBoldText">Urethra</span></td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td width="30%" align="center" class="FormInsideTableRegCell"><strong>Area 
              of Urethra</strong></td>
            <td width="9%" align="center" class="FormInsideTableRegCell"><strong>Normal</strong></td>
            <td width="10%" align="center" class="FormInsideTableRegCell"><strong>Abnormal</strong></td>
            <td width="61%" align="center" class="FormInnerRowBottomBorder"><strong>Findings</strong></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Prostatic</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse222" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse232" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Anterior:</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse242" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse252" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Posterior:</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse262" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse272" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="4" class="FormInsideTableRegCell"> Stricture:<span class="smallGrayText"> 
              <img src="../../Images/shim.gif" border="0" width="40" height="1">Location: 
              ___________________ <img src="../../Images/shim.gif" border="0" width="40" height="1">Caliber: 
              ___________________ French</span></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Bimanual 
              Examination Findings</span><span class="smallGrayText"> <img src="../../Images/shim.gif" border="0" width="30" height="1"> 
              <input type="checkbox" name="Nurse21325" value="Yes">
              </span>Normal<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21335" value="Yes">
              </span>Abnormal<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21343" value="Yes">
              </span>Mass<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21353" value="Yes">
              </span>Induration</td>
          </tr>
          <tr> 
            <td height="35" colspan="2" class="FormInnerRowBottomBorder"><br/>
              Induration / Thickening Location: ______________________________________</td>
          </tr>
          <tr> 
            <td width="50%" valign="top" class="FormInnerRowRightBorder">Mass 
              Size:<br/> <br/>
              _________ cm&nbsp;&nbsp;&nbsp;x&nbsp;&nbsp; _________ cm &nbsp;&nbsp;&nbsp;x&nbsp;&nbsp; 
              _________ cm <br/> <br/> <br/></td>
            <td width="50%" valign="top">Involvement of:<br/> <br/> <span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2133522" value="Yes">
              </span>Vagina<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2134323" value="Yes">
              </span>Rectum<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2135323" value="Yes">
              </span>Cervix<br/> <br/> <span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21343222" value="Yes">
              </span>Urethra<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21353222" value="Yes">
              </span>Pelvic Sidewall<img src="../../Images/shim.gif" border="0" width="30" height="1">Right<img src="../../Images/shim.gif" border="0" width="30" height="1">Left<br/>            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="100" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Preliminary 
        Recommendations</span></td>
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
                  <td width="125" align="center"><input type="checkbox" >No<input type="checkbox" style="margin-left: 19px;">Yes:</td>
                  <td>Refill &nbsp;&nbsp;or &nbsp;&nbsp;New</td>
                </tr>
                <tr>
                  <td height="18" colspan="3">Rx: __________________________________________________________</td>
                </tr>
                <tr>
                  <td height="18" colspan="3">Rx: __________________________________________________________</td>
                </tr>
                <tr>
                  <td height="25">Chemo Orders:</td>
                  <td align="center"><input type="checkbox">No<input type="checkbox" style="margin-left: 19px;" />Yes:</td>
                  <td>____________________________________</td>
                </tr>
            </table></td>
            <td width="31%" align="center"><span>Protocol #: ________</span> <br />
                <table align="left" width="100%">
                  <tr>
                    <td>Considered:</td>
                    <td style="text-align: center;"><input type="checkbox">Yes<input type="checkbox" style="margin-left: 16px;" />No</td>
                  </tr>
                  <tr>
                    <td>Consent Obtained:</td>
                    <td style="text-align: center;"><input type="checkbox">Yes<input type="checkbox" style="margin-left: 16px;" />No</td>
                  </tr>
                  <tr>
                    <td>Registered:</td>
                    <td style="text-align: center;"><input type="checkbox">Yes<input type="checkbox" style="margin-left: 16px;" />No</td>
                  </tr>
                </table>
              <br />
                <br /></td>
          </tr>
      </table></td>
      </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" class="FormInnerRowRightBorder"> Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ 
              Resident<img src="../../Images/shim.gif" border="0" width="30" height="1">Attending</td>
            <td width="50%"><span style="width: 70px;">Copy to:</span><input name="fellow222" type="checkbox" id="fellow223">
              Referring M.D.: ________________________<br/>
			  <span style="width: 70px;">&nbsp;</span><input name="fellow2222" type="checkbox" id="fellow2222">
              Other: _______________________________</td>
          </tr>
        </table></td>
    </tr>
    <tr >
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
                  <td><span class="blackBoldText">
                    <input name="fellow2" type="checkbox" id="fellow2" />
                  </span>I personally performed or was physically present during the <strong>key portions</strong> of the procedure today.<br/>
                                  <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="40" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      </tr>
<tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU06<img src="../../Images/shim.gif" border="0" width="45" height="1">U10<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:12/27/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ORPROC</td>
    </tr></table>
</div>

</div>