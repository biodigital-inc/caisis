<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.UroILVEndo" CodeFile="UroILVEndo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


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
		<div  class="VerticalBarCodeDocType">*U35*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Intralesional Injection<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr > 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="16%" align="left" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../images/shim.gif" border="0" width="4" height="1">Vital Signs</span></td>
            <td width="42%" height="22" align="left" valign="middle" class="FormInnerRowRightBorder"><img src="../../images/shim.gif" border="0" width="4" height="0">Starting BP:</td>
            <td width="42%" height="22" align="left" valign="middle" class="FormInnerRowRightBorder"><img src="../../images/shim.gif" border="0" width="4" height="0">Completion BP:</td>
          </tr>
        </table>	  </td>
    </tr>
    <tr> 
      <td height="32" class="FormOuterTableRow" style="padding-top: 20px;">
	  <table width="100%" border="0" cellspacing="0" cellpadding="2">
	    <tr>
          <td style="width: 4%; vertical-align: top;"><input type="checkbox" /></td>
	      <td style="padding-bottom: 20px;"><strong>Lidocaine and Verapamil</strong> injections given by _____________________________________. Patient tolerated procedure well. No active bleeding or bruising noted. Area wrapped in 2x2 gauze and 1 inch Coban. Patient instructed to leave dressing on for 4 hours.</td>
	      </tr>
          <tr> 
          <td style="width: 5%; vertical-align: top;"><input type="checkbox" /></td>
            <td><strong>XIAFLEX</strong> injections given by _____________________________________. Patient tolerated procedure well. No active bleeding or bruising noted. Area wrapped in 2x2 gauze and 1 inch Coban. Patient instructed to leave dressing on for 3 days.</td>
          </tr>
		  <tr> 
		    <td colspan="2" class="blackBoldText" style="vertical-align: bottom; height: 46px;">Signature: ____________________________________________________________________</td>
		  </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td height="88" valign="middle" class="FormOuterTableRow" style="padding-left: 4px;">
	  <table cellspacing="0" cellpadding="0">
	  	<tr>
			<td class="blackBoldText" style="padding-right: 30px;">Local Anesthesia</td>
			<td ><input type="checkbox" > None
			<input type="checkbox" style="margin-left: 30px;"> 2% Lidocaine
			<input type="checkbox" style="margin-left: 30px;"> 2% Lidocaine (100mg/5cc) and 0.5% Bupivacaine (25mg/5cc)</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		<td style="padding-top: 16px;">Number of injections<input type="checkbox" style="margin-left: 8px;">1<input type="checkbox" style="margin-left: 20px;">2</td>
		</tr>
	  </table>
		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <style type="text/css">
	  table.ILVProcedure { width: 100%; } 
	  table.ILVProcedure td { padding: 10px 4px; width: 40%; } 
	  </style>
	  <table  class="ILVProcedure" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="4" class="blackBoldText">Procedure</span></td>
          </tr>
          <tr> 
            <td style="width: 4%;" ><input type="checkbox" /></td>
            <td >Intralesional  <strong>Verapamil</strong> Injection #&nbsp;__________</td>
            <td style="width: 20%">Dose&nbsp;__________</td>
		    <td style="width: 35%">Saline Volume&nbsp;__________</td>
		    </tr>
          <tr> 
            <td style="width: 4%;" ><input type="checkbox" /></td>
            <td >Intralesional  <strong>XIAFLEX</strong> Injection #&nbsp;__________</td>
            <td style="width: 20%">Dose&nbsp;__________</td>
		    <td style="width: 35%">&nbsp;</td>
		    </tr>
          <!--<tr> 
            <td align="left" colspan="6" height="30" class="FormInsideTableRegCell"><span class="blackBoldText"><img src="../../images/shim.gif" border="0" width="4" height="1">Injections administered by Dr. Mulhall</span><img src="../../images/shim.gif" border="0" width="30" height="1">Initials:______________</td>
          </tr>-->
        </table>	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow" style="padding-top: 10px;"><span class="blackBoldText" style="margin-left: 4px;">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician Performing Review: 
        <input type="checkbox" name="NP/PA2" value="Yes">
        NP/PA&nbsp;&nbsp;&nbsp;
        <input type="checkbox" name="Fellow2" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending2" value="Yes">
        Attending</span> <br> 
        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Penis</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td height="250" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/sexFuncDiagram1.gif" width="278" height="188" vspace="2" /></td>
            <td class="FormInsideTableRegCell" style="vertical-align: top; padding: 4px;">
			<style type="text/css">
			table.ILVExamNotesTable td { padding: 6px 0px; }
			</style>
			<table class="ILVExamNotesTable">
				<tr>
				<td style="vertical-align: top;"><input type="checkbox" /></td>
				<td>Peyronie's Disease</td>
				</tr>
				<tr>
				<td style="vertical-align: top;"><input type="checkbox" /></td>
				<td>Intralesional  treatment # _______________ provided and tolerated.  Post site care reviewed.</td>
				</tr>
				<tr>
				<td style="vertical-align: top;"><input type="checkbox" /></td>
				<td>Resume use of penile traction device as directed:
					<span style="display: block; padding-left: 20px;"><input type="checkbox" /> in 24 hours (Verapamil)</span>
					<span style="display: block; padding-left: 20px;"><input type="checkbox" /> in 7 days (XIAFLEX)</span>
				 </td>
				</tr>
				<tr>
				<td style="vertical-align: top;"><input type="checkbox" /></td>
				<td>Follow-up in ______ weeks for ILV / ILX # _______</td>
				</tr>
				<tr>
				<td style="vertical-align: top;"><input type="checkbox" /></td>
				<td>Follow-up in _______weeks/months for curvature reassessment</td>
				</tr>
			</table>			</td>
			<td align="center" class="FormInsideTableRegCell"><span class="smallGrayText">          </tr>
        </table>	  </td>
    </tr>
    <tr> 
		<td class="FormOuterTableRow" style="padding: 10px 4px;"><span class="blackBoldText">Disposition</span><img src="../../images/shim.gif" border="0" width="10" height="1">
		  <input name="diagnosisNew34" type="checkbox" id="diagnosisNew34">
		  Discharge Home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="diagnosisNew33" type="checkbox" id="diagnosisNew33">
		  Transfer to UCC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="diagnosisNew32" type="checkbox" id="diagnosisNew32">
		  Other (Specify): ____________________________ </td>
  	</tr>
	<tr> 
      <td align="center" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="22" class="FormInnerRowRightBorder">Procedure Code: (54200) Intralesional Injection</td>
            <td width="50%">
			<span style="display: block;"><span style="display:inline-block; width: 70px;">Copy to:</span><input type="checkbox" />referring M.D.: ________________________</span>
			<span style="display: block;"><span style="display:inline-block; width: 70px;">&nbsp;</span><input type="checkbox" />other: ________________________</span>
</td>
          </tr>
        </table></td>
    </tr>
	<tr>
      <td class="FormOuterTableRow">
	  <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td><span class="blackBoldText">Signatures</span><br></td>
            <td>&nbsp;</td>
          </tr>
          <tr class="FormOuterTableRow">
            <td><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Fellow: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
		  <tr>
		  	<td colspan="3" valign="bottom"><input name="fellow" type="checkbox" id="fellow">I personally performed or was physically present during the <strong>key portions</strong> of the procedure today.</td>
		  </tr>
          <td colspan="3" valign="bottom"><input name="np/pa" type="checkbox" id="np/pa">The Fellow / NP/PA conducted this visit <strong>jointly</strong> with the attending physician.</td>
		  </tr>
 		  <tr>
            <td height="40"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />NP/PA: </span></td>
            <td align="left"><span class="blackBoldText">_____________________________ Title:_______</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr>
            <td height="40"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Attending: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
		  <tr>
		  	<td colspan="2" align="center"><span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span></td>
		  </tr>
         </table>		</td>
    </tr>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU31<img src="../../images/shim.gif" border="0" width="45" height="1">U35<img src="../../images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../images/shim.gif" border="0" width="45" height="8">rev:03/20/14<img src="../../images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">1</span><img src="../../images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>

</div>