<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.UroGenEndo" CodeFile="UroGenEndo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


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
		<div  class="VerticalBarCodeDocType">*U25*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            General Urology Endoscopy<br />
          </span></td>
          <td width="50%" align="center" valign="bottom" class="blackBoldText"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
                <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
              </tr>
              <tr>
                <td align="right"><% =patientMRNLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left"><strong>
                  <% =patientMRN  %>
                  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <% =patientDOB  %>
                </td>
              </tr>
              <tr>
                <td colspan="1" align="right"><% =patientNameLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td colspan="1" align="left"><strong>
                  <% =patientLastName  %>
                  ,
                  <% =patientFirstName  %>
                  <% =patientMiddleName  %>
                </strong></td>
              </tr>
              <tr>
                <td align="right" valign="top"><% =patientAddressLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left" valign="top"><% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                </td>
              </tr>
              <tr>
                <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr > 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="650" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="100" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Vital 
              Signs</span></td>
            <td width="137" height="22" align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td width="137" height="22" align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td width="137" height="22" align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td width="137" height="22" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="32" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td width="3%" valign="middle"><input type="checkbox" name="No24322" />
            </td>
            <td valign="middle">Post instructions reviewed. Fact Cards 
              &quot;Instructions Following Your Cystoscopy&quot; provided to patient.</td>
          </tr>
          <tr>
            <td colspan="2" valign="middle"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="3">
                <tr>
                  <td><span class="blackBoldText">Signature:</span><span class="blackBoldText"> ____________________________________<img src="../../Images/shim.gif" border="0" width="30" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="30" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span> </span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow" valign="top" height="20"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="NKA" value="NKA">
        NKA&nbsp;&nbsp;&nbsp;&nbsp; <asp:Repeater ID="allergies" runat=server> 
          <ItemTemplate> 
            <%# DataBinder.Eval(Container.DataItem, "Allergen") %>
            ( 
            <%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %>
            )</ItemTemplate>
          <SeparatorTemplate>,&nbsp;&nbsp;</SeparatorTemplate>
        </asp:Repeater> </td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow"><table cellpadding="10" cellspacing="0" >
        <tr>
          <td style="padding-right: 20px; padding-left: 3px;"><span  class="blackBoldText">Tobacco Use Question </span></td>
          <td style="padding-right: 14px;">Have you smoked even a puff in the past 30 days?</td>
          <td style="white-space: nowrap; padding-right: 8px; text-align: right;"><input type="checkbox" id="socHxPuffLast30DaysYes" runat="server" name="socHxPuffLast30DaysYes"/>
            Yes&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" id="socHxPuffLast30DaysNo" runat="server" name="socHxPuffLast30DaysNo"/>
            No</td>
        </tr>
      </table></td>
	</tr>
    <tr> 
      <td height="32" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Local 
        Anesthesia</span><img src="../../Images/shim.gif" border="0" width="30" height="1"> 
        <input type="checkbox" name="No224">
        None<img src="../../Images/shim.gif" border="0" width="30" height="1"> <input type="checkbox" name="No2222">
        2% Xylocaine Jelly</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table  class="pageWidth" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td colspan="8" valign="middle" class="FormInnerRowBottomBorder"><span class="blackBoldText">Procedure</span></td>
          </tr>
          <tr> 
            <td width="3%" valign="middle" class="FormInsideTableRegCell"><input type="checkbox" name="No2432"></td>
            <td width="27%" valign="middle" class="FormInsideTableRegCell">Cystoscopy<br></td>
            <td width="5%" valign="middle">&nbsp;</td>
            <td width="3%" valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No243132"></td>
            <td width="27%" valign="middle" class="FormInsideTableRegCell">Transurethral Fulguration Tumor</td>
            <td width="5%" valign="middle">&nbsp;</td>
            <td width="3%" valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No243132"></td>
            <td width="27%" valign="middle" class="FormInnerRowBottomBorder">Cystogram</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableRegCell"><input type="checkbox" name="No24323"></td>
            <td valign="middle" class="FormInsideTableRegCell">Stent Removal:<img src="../../Images/shim.gif" border="0" width="30" height="1">Right<img src="../../Images/shim.gif" border="0" width="30" height="1">Left</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24324"></td>
            <td valign="middle" class="FormInsideTableRegCell">Transurethral Biopsy</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No243132"></td>
            <td valign="middle" class="FormInnerRowBottomBorder">Loopogram</td>
		  </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableRegCell"><input type="checkbox" name="No24323"></td>
            <td valign="middle" class="FormInsideTableRegCell">Difficult Catheterization</td>
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No24324"></td>
            <td valign="middle" class="FormInsideTableRegCell">Dilation of Urethral Stricture</td>
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No243132"></td>
            <td valign="middle" class="FormInnerRowBottomBorder">Urethrogram</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td valign="top" class="FormInnerRowRightBorder"> <input type="checkbox" name="No2431318"></td>
            <td colspan="7" valign="top"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="12"></span>Other:<br>            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Review: 
        <input type="checkbox" name="Fellow2" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending2" value="Yes">
        Attending</span> <br> 
        <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <!-- <tr class="eFormInnerTableRow">
						<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br></td>
						<td colspan="1" align="left" valign="top"></td>
					</tr> -->
          <tr> 
            <td width="170" align="center" class="FormInsideTableTopCell"><strong>Area</strong></td>
            <td width="50" align="center" class="FormInsideTableTopCell"><strong>Normal</strong></td>
            <td width="50" align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td width="380" align="center" class="FormInsideTableTopCell"><strong>Findings</strong></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Abdomen:</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse22" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse23" value="Yes">
              </span></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Right Groin:</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse24" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse25" value="Yes">
              </span></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Left Groin:</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse26" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse27" value="Yes">
              </span></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Genitalia:</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse28" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse29" value="Yes">
              </span></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">DRE:</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse210" value="Yes">
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse211" value="Yes">
              </span></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td align="left" class="FormInnerRowRightBorder">Other: ___________________<br></td>
            <td align="center" class="FormInnerRowRightBorder"> <p><span class="smallGrayText"> 
                <input type="checkbox" name="Nurse212" value="Yes">
                </span><span class="smallGrayText"> </span></p></td>
            <td align="center" class="FormInnerRowRightBorder"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse213" value="Yes">
              </span></td>
            <td align="center">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" class="pageWidth" cellpadding="4" cellspacing="0">
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
            <td colspan="2" class="FormInnerRowBottomBorder">Induration / Thickening 
              Location: ______________________________________</td>
          </tr>
          <tr> 
            <td width="50%" valign="top" class="FormInnerRowRightBorder">Mass 
              Size:<br> <br>
              _________ cm&nbsp;&nbsp;&nbsp;x&nbsp;&nbsp; _________ cm &nbsp;&nbsp;&nbsp;x&nbsp;&nbsp; 
              _________ cm</td>
            <td width="50%" valign="top">Involvement of:<br> <span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2133522" value="Yes">
              </span>Vagina<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2134323" value="Yes">
              </span>Rectum<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2135323" value="Yes">
              </span>Cervix<br> <span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21343222" value="Yes">
              </span>Urethra<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse21353222" value="Yes">
              </span>Pelvic Sidewall<img src="../../Images/shim.gif" border="0" width="30" height="1">Right<img src="../../Images/shim.gif" border="0" width="30" height="1">Left</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Lab 
              Tests<br>
              <asp:Repeater ID="labTests" runat=server> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "LabDateText") %>
                  &nbsp;&nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "LabTest") %>
                  : 
                  <%# DataBinder.Eval(Container.DataItem, "LabResult") %>
                  &nbsp;&nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "LabQuality") %>                </ItemTemplate>
                <SeparatorTemplate><br/>
                </SeparatorTemplate>
              </asp:Repeater>
              </span></td>
          </tr>
          <tr> 
            <td width="50%" class="FormInnerRowRightBorder"> <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
                <tr> 
                  <td class="FormInnerRowRightBorder">&nbsp;</td>
                  <td colspan="3" align="center" class="FormInsideTableRegCell"><strong>Results</strong></td>
                </tr>
                <tr> 
                  <td width="17%" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <td width="29%" height="12" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="29%" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="29%" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
            <td width="50%"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
                <tr> 
                  <td class="FormInnerRowRightBorder">&nbsp;</td>
                  <td colspan="3" align="center" class="FormInnerRowBottomBorder"><strong>Results</strong></td>
                </tr>
                <tr> 
                  <td width="17%" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <td width="29%" height="12" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="29%" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="29%" class="FormInnerRowBottomBorder"><strong>Date:</strong></td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="30" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU21<img src="../../Images/shim.gif" border="0" width="45" height="1">U25<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 7/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/26/09<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">21</span></td>
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
		<div  class="VerticalBarCodeDocType">*U25*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            General Urology Endoscopy<br />
          </span></td>
          <td width="50%" align="center" valign="bottom" class="blackBoldText"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
                <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
              </tr>
              <tr>
                <td align="right"><% =patientMRNLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left"><strong>
                  <% =patientMRN  %>
                  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <% =patientDOB  %>
                </td>
              </tr>
              <tr>
                <td colspan="1" align="right"><% =patientNameLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td colspan="1" align="left"><strong>
                  <% =patientLastName  %>
                  ,
                  <% =patientFirstName  %>
                  <% =patientMiddleName  %>
                </strong></td>
              </tr>
              <tr>
                <td align="right" valign="top"><% =patientAddressLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left" valign="top"><% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                </td>
              </tr>
              <tr>
                <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr>
      <td height="26" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Cystoscopy</span>&nbsp;&nbsp;<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText">
        <input type="checkbox" name="Nurse21326" value="Yes">
        </span>Normal
        <img src="../../Images/shim.gif" border="0" width="15" height="1">(Verify normal findings below.)</td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Tumor</span><img src="../../Images/shim.gif" border="0" width="50" height="8"> 
              1997 / 2002 Clinical TNM<img src="../../Images/shim.gif" border="0" width="30" height="1">T<font size="-6">0</font><img src="../../Images/shim.gif" border="0" width="30" height="1">T<font size="-6">A</font><img src="../../Images/shim.gif" border="0" width="30" height="1">T<font size="-6">IS</font><img src="../../Images/shim.gif" border="0" width="30" height="1">T<font size="-6">1</font><img src="../../Images/shim.gif" border="0" width="30" height="1">T<font size="-6">2</font><img src="../../Images/shim.gif" border="0" width="30" height="1">T<font size="-6">3</font><img src="../../Images/shim.gif" border="0" width="30" height="1">T<font size="-6">4</font></td>
          </tr>
          <tr>
            <td colspan="2" class="FormInnerRowBottomBorder">Number: <span class="blackBoldText"></span> <img src="../../Images/shim.gif" border="0" width="30" height="8"><span class="smallGrayText">
              <input type="checkbox" name="Nurse2132" value="Yes">
              </span>1<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText">
              <input type="checkbox" name="Nurse2133" value="Yes">
              </span>2<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText">
              <input type="checkbox" name="Nurse2134" value="Yes">
              </span>3<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText">
              <input type="checkbox" name="Nurse2135" value="Yes">
              </span>4<img src="../../Images/shim.gif" border="0" width="30" height="8"><span class="smallGrayText"> 
              <input type="checkbox" name="Nurse2136" value="Yes">
            </span>5<img src="../../Images/shim.gif" border="0" width="30" height="1">Other: ______________</td>
          </tr>
          <tr>
            <td width="50%" class="FormInsideTableRegCell">Size (Largest): ____________ cm</td>
            <td width="50%" class="FormInnerRowBottomBorder">Size range: ____________ cm&nbsp;&nbsp;&nbsp;to &nbsp;&nbsp; ____________ cm</td>
          </tr>
          <tr>
            <td colspan="2" class="FormInnerRowBottomBorder">Morphology:<img src="../../Images/shim.gif" border="0" width="30" height="1">
            <input type="checkbox" name="Nurse21322" value="Yes">Scar<img src="../../Images/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="Nurse21332" value="Yes">Solid / Nodular<img src="../../Images/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="Nurse21342" value="Yes">TIS<img src="../../Images/shim.gif" border="0" width="30" height="1">
            <input type="checkbox" name="Nurse21352" value="Yes">            Papillary</td>
          </tr>
          <tr>
            <td class="FormInnerRowRightBorder">Margins:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="smallGrayText">
              <input type="checkbox" name="Nurse21323" value="Yes">
              </span>Well-Circumscribed<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText">
              <input type="checkbox" name="Nurse21333" value="Yes">
            </span>Ill-Defined</td>
            <td>Completely Removed / Fugurated: <img src="../../Images/shim.gif" border="0" width="10" height="1"><span class="smallGrayText">
              <input type="checkbox" name="Nurse21324" value="Yes">
              </span>Yes<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText">
              <input type="checkbox" name="Nurse21334" value="Yes">
            </span>No</td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td colspan="5" valign="middle" class="FormInsideTableTopLeftCell"><span class="blackBoldText"> 
              Mucosa</span></td>
          </tr>
          <tr> 
            <td width="3%" align="center" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"> </td>
            <td width="46%" valign="middle" class="FormInsideTableRegCell">Normal<br>            </td>
            <td width="2%" valign="middle">&nbsp;</td>
            <td width="3%" align="right" valign="middle" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"> </td>
            <td width="46%" valign="middle" class="FormInnerRowBottomBorder">Inflammatory</td>
          </tr>
          <tr>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td valign="middle" class="FormInsideTableRegCell">CIS</td>
            <td valign="middle">&nbsp;</td>
            <td align="right" valign="middle" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">            </td>
            <td valign="middle" class="FormInnerRowBottomBorder">Radiation Cystitis</td>
          </tr>
          <tr> 
            <td align="center" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"> </td>
            <td valign="middle" class="FormInsideTableRegCell">Erythema</td>
            <td valign="middle">&nbsp;</td>
            <td align="right" valign="middle" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td valign="middle" class="FormInnerRowBottomBorder">Other (specify):</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Other 
        Bladder Findings&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText"> 
        <input type="checkbox" name="Nurse214" value="Yes">
        Trabeculation&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="NP22" value="Yes">
        Diverticula&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="PA22" value="Yes">
      Other (specify): ___________________</span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <!-- <tr class="eFormInnerTableRow">
						<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br></td>
						<td colspan="1" align="left" valign="top"></td>
					</tr> -->
          <tr> 
            <td colspan="4" class="FormInnerRowBottomBorder"><span class="blackBoldText">Urethra</span></td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td width="150" align="center" class="FormInsideTableRegCell"><strong>Area 
              of Urethra</strong></td>
            <td width="50" align="center" class="FormInsideTableRegCell"><strong>Normal</strong></td>
            <td width="50" align="center" class="FormInsideTableRegCell"><strong>Abnormal</strong></td>
            <td width="400" align="center" class="FormInnerRowBottomBorder"><strong>Findings</strong></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Prostatic</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"> 
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"> 
              </span></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Anterior:</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"> 
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"> 
              </span></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Posterior:</td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"> 
              </span></td>
            <td align="center" class="FormInsideTableRegCell"><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"> 
              </span></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="4" class="FormInsideTableRegCell"> Stricture:<span class="smallGrayText"> 
              <img src="../../Images/shim.gif" border="0" width="40" height="1">Location: 
              ___________________ <img src="../../Images/shim.gif" border="0" width="40" height="1">Caliber: 
              ___________________ French</span></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="455" align="center" class="FormOuterTableRow"><img src="../../Images/FormImages/Bladder6.gif"  class="pageWidth90percent" /></td>    
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU21<img src="../../Images/shim.gif" border="0" width="45" height="1">U25<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 7/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/26/09<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">21</span></td>
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
		<div  class="VerticalBarCodeDocType">*U25*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            General Urology Endoscopy<br />
          </span></td>
          <td width="50%" align="center" valign="bottom" class="blackBoldText"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
                <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
              </tr>
              <tr>
                <td align="right"><% =patientMRNLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left"><strong>
                  <% =patientMRN  %>
                  </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <% =patientDOB  %>                </td>
              </tr>
              <tr>
                <td colspan="1" align="right"><% =patientNameLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td colspan="1" align="left"><strong>
                  <% =patientLastName  %>
                  ,
                  <% =patientFirstName  %>
                  <% =patientMiddleName  %>
                </strong></td>
              </tr>
              <tr>
                <td align="right" valign="top"><% =patientAddressLabel  %>
                  &nbsp;&nbsp;&nbsp;</td>
                <td align="left" valign="top"><% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                </td>
              </tr>
              <tr>
                <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0"  class="pageWidth" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="3" class="blackBoldText">Impression &amp; Plan </td>
          </tr>
          <tr> 
            <td width="48%" align="center" class="FormInsideTableTopCell"><strong>Diagnoses 
              / Problem List</strong></td>
            <td width="4%" align="center" class="FormInsideTableTopCell"><strong>New</strong></td>
            <td width="48%" align="center" class="FormInsideTableTopCell"><strong>Plan 
              &amp; Referrals</strong></td>
          </tr>
          <tr> 
            <td height="60" valign="top" class="FormInsideTableRegCell">1.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"> 
              <input name="diagnosisNew1" type="checkbox" id="diagnosisNew1"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="60" valign="top" class="FormInsideTableRegCell">2.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew2" type="checkbox" id="diagnosisNew2"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="60" valign="top" class="FormInsideTableRegCell">3.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"> 
              <input name="diagnosisNew3" type="checkbox" id="diagnosisNew3"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="60" valign="top" class="FormInnerRowRightBorder">4.</td>
            <td align="center" valign="middle" class="FormInnerRowRightBorder"> 
              <input name="diagnosisNew3" type="checkbox" id="diagnosisNew3"></td>
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
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" /> Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.
		</td>
	</tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="informedConsent" style="vertical-align: middle;" /> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.		</td>
	</tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" class="pageWidth" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Disposition</span><br> 
              <input name="diagnosisNew34" type="checkbox" id="diagnosisNew34">
              Discharge Home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="diagnosisNew33" type="checkbox" id="diagnosisNew33">
              Transfer to UCC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="diagnosisNew32" type="checkbox" id="diagnosisNew32">
              Other (Specify): ____________________________ </td>
          </tr>
          <tr> 
            <td width="69%" align="center" class="FormInnerRowRightBorder"> <table width="440" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="22%" height="18">Prescriptions:</td>
                  <td width="18%" align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1">Yes:</td>
                  <td width="18%">Refill &nbsp;&nbsp;or &nbsp;&nbsp;New</td>
                </tr>
                <tr> 
                  <td height="18" colspan="3">Rx: __________________________________________________________</td>
                </tr>
                <tr> 
                  <td height="18" colspan="3">Rx: __________________________________________________________</td>
                </tr>
                <tr> 
                  <td height="18">Chemo Orders:</td>
                  <td align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1">Yes:</td>
                  <td>____________________________________</td>
                </tr>
              </table></td>
            <td width="200" align="center"> <span>Protocol #: ________</span> 
              <br> <table align="left" width="100%">
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
              <br> <br></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td align="center" class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22"> 
              &#8805; 50% of attending time was spent in counseling <br> <img src="../../Images/shim.gif" border="0" width="1" height="20"> 
              If so, mark total attending time in minutes &amp; describe on right:<br> 
              <img src="../../Images/shim.gif" border="0" width="30" height="12"> 
              <input type="checkbox" name="15-24 (3)2">
              15-24 (3) &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="25-39 (4)2">
              25-39 (4) &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="40+ (5)2">
              40+ (5)</td>
            <td width="50%" valign="top"><img src="../../Images/shim.gif" border="0" width="1" height="11">Describe 
              Counseling or Dictate Note:</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td width="50%" height="22" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1" />1<img src="../../Images/shim.gif" border="0" width="22" height="1" />2<img src="../../Images/shim.gif" border="0" width="22" height="1" />3<img src="../../Images/shim.gif" border="0" width="22" height="1" />4<img src="../../Images/shim.gif" border="0" width="22" height="1" />5 </td>
            <td rowspan="2" align="right" valign="top">Copy to:</td>
            <td width="43%" rowspan="2" valign="top"><input name="fellow222" type="checkbox" id="fellow223" />
              referring M.D.: ________________________<br />
              <input name="fellow2222" type="checkbox" id="fellow2222" />
              other: _______________________________</td>
          </tr>
          <tr>
            <td height="22" class="FormInnerRowRightBorder">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1" />Fellow/ 
              Resident<img src="../../Images/shim.gif" border="0" width="30" height="1" />Attending</td>
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
          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
                  <td><span class="blackBoldText">
                    <input name="fellow22" type="checkbox" id="fellow22" />
                  </span>I personally performed or was physically present during the <strong>key portions</strong> of the procedure today.<br/>
                      <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
                
            </table></td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU21<img src="../../Images/shim.gif" border="0" width="45" height="1">U25<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 7/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/26/09<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">21</span></td>
    </tr>
  </table>
</div>

</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>