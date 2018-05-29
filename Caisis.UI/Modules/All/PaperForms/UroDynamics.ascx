<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.UroDynamics" CodeFile="UroDynamics.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


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
		<div  class="VerticalBarCodeDocType">*U40*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Urodynamic Study<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr> 
            <td width="100" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Vital Signs</span></td>
            <td width="137" height="22" align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td width="137" height="22" align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td width="137" height="22" align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td width="137" height="22" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td height="32" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td width="3%" valign="middle"> <input type="checkbox" name="No24322"> 
            </td>
            <td width="97%" valign="middle">Post instructions reviewed. Fact Cards &quot;Instructions Following Your Urodynamics Study&quot; provided to patient.</td>
          </tr>
          <tr> 
            <td colspan="2" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td width="11%"><span class="blackBoldText">Signature:</span></td>
                  <td width="43%">_________________________________________</td>
                  <td width="20%"><span class="blackBoldText">Date:</span> ____/____/____                 </td>
                  <td width="26%"><span class="blackBoldText">Time:</span>_____:______ <span style="font-size: 9px;">AM / PM </span></td>
                </tr>
              </table>
			  </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td height="32" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Verification:</span>&nbsp;Patient Identity has been confirmed and agreement of planned procedure with patient and consent ensured.<br>
	  <img src="../../Images/shim.gif" border="0" width="315" height="10"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Yes </td>
    </tr>
	<tr>
		<td class="FormOuterTableRow" height="85" align="left">
			<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="55%" valign="top" align="left" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">HPI</span></td>
					<td width="45%" align="left" valign="top"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Medications</span><br/>
						
							<asp:Repeater ID="medications" runat="server"  OnItemDataBound="medicationsItemDataBound">
								<headertemplate><table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td style="line-height: 11px;"></headertemplate>
								<ItemTemplate>
									<asp:Literal ID="StartNextMedColumn" runat="server" /><%# DataBinder.Eval(Container.DataItem, "Medication") %> <%# DataBinder.Eval(Container.DataItem, "MedDose") %> <%# DataBinder.Eval(Container.DataItem, "MedUnits") %> <%# DataBinder.Eval(Container.DataItem, "MedSchedule") %><br/>
								</ItemTemplate>
								<footertemplate></td></tr></table></footertemplate>
							</asp:Repeater>					
					
				  </td>
				</tr>
			</table>
		</td>
	</tr>
    <tr>
		<td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Previous History / Indication</span>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td valign="middle" align="center" width="3%" class="FormInsideTableTopLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableTopCell">Post Prostatectomy</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableTopCell">Radical Prostatectomy</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableTopCell">Laprascopic Prostatectomy</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableTopCell">Robot Assisted Prostatectomy</td>
				</tr>
				<tr>
					<td valign="middle" align="center" width="3%" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Post Cystectomy</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Neobladder</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Ileal-conduit</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Cont. Cutaneous Reservoir</td>
				</tr>
				<tr>
					<td valign="middle" align="center" width="3%" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Post Radical GI Surgery</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Post Radical GYN Surgery</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Post Radiation</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Post TURBT</td>
				</tr>
				<tr>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Post BCG Therapy</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Urgency</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Retention</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Incontinence&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="absmiddle">PCa&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="absmiddle">Other Cause</td>
				</tr>
				<tr>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Frequency</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Pelvic Prolapse</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Neurogenic Bladder</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">BPH</td>
				</tr>
				<tr>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Augmentation</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td colspan="3" valign="middle" align="left" class="FormInsideTableRegCell">Catheter Use:<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">&nbsp;&nbsp;Intermittent<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">&nbsp;&nbsp;In Dwelling </td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Preop for:</td>
				</tr>
				<tr>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" colspan="7">Other:</td>
				</tr>
		  </table>
		</td>
	</tr>
	<tr> 
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr> 
					<td valign="middle" colspan="2"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Procedure</span></td>
				</tr>
				<tr>
					<td colspan="2" align="left" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Multichannel Urodynamic Study Position:
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">Upright
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">Supine<img src="../../Images/shim.gif" border="0" width="80" height="1" />Noninvasive uroflow was performed initially?
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Yes
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">No</td>
				</tr>
				<tr>
					<td colspan="2">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="15%" class="FormInsideTableRegCell" valign="middle" align="center">Qmax (ml/sec)</td>
								<td width="20%" class="FormInsideTableRegCell" valign="middle" align="center">Voided Volume (ml)</td>
								<td width="30%" class="FormInsideTableRegCell" valign="middle" align="center">Pattern</td>
								<td width="35%" class="FormInsideTableRegCell" valign="middle" align="center">Dual Lumen Catheter Size (French)</td>
							</tr>
							<tr>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Normal
								<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Plateau
								<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Interrupted</td>
								<td class="FormInsideTableRegCell" align="center" valign="middle">&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">&nbsp;#7<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">&nbsp;#9</td>
							</tr>
						</table>					</td>
				</tr>
				<tr>
				  <td colspan="2" align="left" valign="middle" class="FormInsideTableRegCell"><table class="pageWidth" border="0" cellspacing="0" cellpadding="3">
                    <tr>
                      <td width="3%" valign="middle"><input type="checkbox" name="No243222" />                      </td>
                      <td valign="middle">Measurement of post void residual was performed by Ultrasound.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>_________ milliliters</strong></td>
                    </tr>
                    <tr>
                      <td colspan="2" valign="middle"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="3">
                          <tr>
                            <td height="36"><span class="blackBoldText">Signature:</span> ____________________________________<img src="../../Images/shim.gif" border="0" width="30" height="1" /><span class="blackBoldText">Date:</span> ____/____/____<img src="../../Images/shim.gif" border="0" width="30" height="1" /><span class="blackBoldText">Time:</span>_____:______ <span style="font-size: 9px;">AM / PM </span></td>
                          </tr>
                      </table></td>
                    </tr>
                  </table></td>
			  </tr>
				<tr>
           			<td align="left" valign="middle" class="FormInsideTableRegCell" width="50%"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Catheter filling Rate: <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Slow <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Medium <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Fast<br /></td>
           			<td align="left" valign="middle" class="FormInsideTableRegCell" width="90%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="absmiddle" style="margin-left: 4px;" />Abdominal Pressure Catheter </td>
				</tr>
			</table>
		</td>
	</tr>
	<tr> 
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Pressure Flow Study</span><span class="urodynamicsSectionComment">(Complex Uroflometry CPT:51741)</span></td>
				</tr>
				<tr>
            		<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Voiding at Capacity:
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Allowed
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Involuntary Detrusor</td>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Voiding Cystometrogram Peak Flow Rate (Qmax): ______ ml/sec
					<img src="../../Images/shim.gif" border="0" width="40" height="1">Detrusor Pressure at Qmax _______ cmH<sub>2</sub>O</td>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Bladder Outlet Obstruction Index
					<span class="smallGrayText">(<i>PdetQmax-2*Qmax</i>):</span> __________
					<img src="../../Images/shim.gif" border="0" width="30" height="1">Pattern:
					<img src="../../Images/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Normal
					<img src="../../Images/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Plateau
					<img src="../../Images/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Interrupted</td>
				</tr>
				<tr>
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Bladder Outlet Obstruction Index consistent with Obstruction?&nbsp;&nbsp;<span class="smallGrayText">(<i>BOOI&gt;40 means obstruction</i>):</span>
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Yes
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">No</td>
				</tr>
				<tr>
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Abdominal straining during voiding?
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Yes
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">No</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr> 
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr> 
					<td valign="middle" colspan="5"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Filling Phase</span><span class="urodynamicsSectionComment">(Complex Cystometrogram CPT: 51728)</span></td>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="bottom" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">First Sensation: _______ ml
					<img src="../../Images/shim.gif" border="0" width="30" height="1">First Urge: _______ ml
					<img src="../../Images/shim.gif" border="0" width="30" height="1">Severe Urge: _______ ml
					<img src="../../Images/shim.gif" border="0" width="30" height="1">Bladder Capacity: _______ ml</td>
				</tr>
				<tr>
       			  <td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell">
					<table width="98%" border="0" cellspacing="0" cellpadding="1">
                      <tr>
                        <td rowspan="5" valign="top" style="width: 18%"><strong>Detrusor Pressure:</strong> <br />
						<span class="urodynamicsSectionComment">(CPT: 51797)</span>
                        <br />
                        <br /><span style="font-size:11px;">(Please Note: Poor<br/>Compliance equivalent<br/>to <12.5 mL/cmH2O)</span></td>
                        <td height="28" colspan="3" valign="middle" class="FormInsideTableTopLeftCell">Resting Pressure (cmH<sub>2</sub>O):</td>
                      </tr>
                      <tr>
                        <td align="center" class="FormInsideTableLeftCell">Volume (ml)</td>
                        <td align="center" class="FormInsideTableRegCell">Pressure (cmH<sub>2</sub>O)</td>
                        <td align="center" class="FormInsideTableRegCell">Compliance (ml/cmH<sub>2</sub>O)</td>
                      </tr>
                      <tr>
                        <td class="FormInsideTableLeftCell" style="font-size: 10px;">&nbsp;</td>
                        <td class="FormInsideTableRegCell" style="font-size: 10px;">&nbsp;</td>
                        <td class="FormInsideTableRegCell" style="font-size: 10px;">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="FormInsideTableLeftCell" style="font-size: 10px;">&nbsp;</td>
                        <td class="FormInsideTableRegCell" style="font-size: 10px;">&nbsp;</td>
                        <td class="FormInsideTableRegCell" style="font-size: 10px;">&nbsp;</td>
                      </tr>
                      <tr>
                        <td class="FormInsideTableLeftCell" style="font-size: 10px;">&nbsp;</td>
                        <td class="FormInsideTableRegCell" style="font-size: 10px;">&nbsp;</td>
                        <td class="FormInsideTableRegCell" style="font-size: 10px;">&nbsp;</td>
                      </tr>
                    </table>
				  </td>
				</tr>
				  <tr> 
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1">Detrusor Overactivity:
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="80" height="1">Patient Leaked with Overactivity:
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">No</td>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Involuntary detrusor contraction with a detrusor pressure of ________ cmH<sub>2</sub>O occurred at ________ ml</td>
				</tr>
				<tr> 
					<td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="33%">Approximate DLPP: ________ cmH<sub>2</sub>O </td>
                          <td width="33%">Other IDC: ________ cm/mL</td>
                          <td width="23%">________ cm/mL</td>
                        </tr>
                      </table></td>
				</tr>
				<tr>
				  <td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>Patient unable to void: <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />Yes <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />No </td>
                      <td width="33%">QMax without catheter:___________</td>
                    </tr>
                    <tr>
                      <td>If unable, Maximum pDet Obtained: ______________<br /></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
			  </tr>
		  </table>
		</td>
	</tr><tr> 
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Video Findings</span><span class="urodynamicsSectionComment">(Injection of Contrast CPT: 51600)</span></td>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Video cystourethrogram revealed:
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Normal Bladder
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Prostatic Impression
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Other (specify):</td>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Other findings:
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">None
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Cystocele
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Enterocele
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Rectocele</td>
				</tr>
				<tr>
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Bladder Neck at Rest:
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Open
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Closed</td>
				</tr>
				<tr>
           			<td width="10%" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Bladder:</td>
					<td width="10%" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Smooth</td>
					<td width="45%" colspan="2" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Trabeculated:
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Mild
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Moderate
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Severe</td>
					<td width="35%" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Diverticula:
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Multiple
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Large</td>
				</tr>
				<tr>
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Bladder Neck During Voiding:
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Open
					<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Closed</td>
				</tr>
				<tr>
					<td  colspan="5"align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Reflux present:&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Yes&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;No<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText">If Yes:</span><img src="../../Images/shim.gif" border="0" width="15" height="1">Grade: Right ______<img src="../../Images/shim.gif" border="0" width="4" height="1">Left ______<img src="../../Images/shim.gif" border="0" width="30" height="1">When:&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Filling&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Voiding</td>
				</tr>
				<tr>
					<td  colspan="5"align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Urethrogram:&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Normal&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Stricture&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Other:<img src="../../Images/shim.gif" border="0" width="160" height="1">Fluoroscopic Post Void Residual: ______ vol<span class="urodynamicsSectionComment">(CPT: 51798)</span></td>
				</tr>
			</table>
		</td>
	</tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU35<img src="../../Images/shim.gif" border="0" width="45" height="1">U40<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/06<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/28/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>




<div align="left"  id="LastPageInForm" runat="server"   >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U40*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Urodynamic Study<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
	<tr>
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
            		<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Leak Point Pressure</span><span class="urodynamicsSectionComment">(Intra-abdominal Pressure Study CPT: 51797)</span></td>
				</tr>
				<tr>
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Did the patient leak?
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Yes
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">No
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><span class="blackBoldTextSmall">(If Yes, answer the questions below)</span><img src="../../Images/shim.gif" border="0" width="34" height="1" />With Catheter? <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Yes <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />No</td>
				</tr>
				<tr>
					<td colspan="5"align="left" valign="baseline" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Valsalva Leak Point Pressure: ______ cmH<sub>2</sub>O<img src="../../Images/shim.gif" border="0" width="30" height="1">Bladder volume Refilled:&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;150 ml&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;200 ml&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;300 ml</td>
				</tr>
				<tr>
					<td colspan="5"align="left" valign="baseline" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Valsalva Leak Point Pressure:<img src="../../Images/shim.gif" border="0" width="10" height="1">With Catheter______ cmH<sub>2</sub>O<img src="../../Images/shim.gif" border="0" width="30" height="1">Without Catheter______ cmH<sub>2</sub>O</td>
				</tr>
			</table>		</td>
	</tr>
	<tr> 
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
            		<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">EMG</span></td>
				</tr>
				<tr>
					<td align="left" valign="middle" class="FormInsideTableRegCell" width="90%"><img src="../../Images/shim.gif" border="0" width="4" height="1">EMG performed with patch electrodes placed in the midline at the perineum?
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">Yes
					<img src="../../Images/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">No</td>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell">
						<table width="100%" border="0" cellpadding="2" cellspacing="0">
							<tr>
								<td colspan="10" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">EMG Activity</td>
							</tr>
							<tr>
								
								<td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell">Progressive Filling</td>
								<td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell">Valsalva</td>
								<td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell">Cough</td>
								<td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell">Voiding</td>
								<td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell">Involuntary Detrusor</td>
							</tr>
							<tr>
								<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Increase</td>
								<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Decrease</td>
								<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Increase</td>
								<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Decrease</td>
								<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Increase</td>
								<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Decrease</td>
								<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Increase</td>
								<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Decrease</td>
								<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Increase</td>
								<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;Decrease</td>
							</tr>
						</table>					</td>
				</tr>
			</table>		</td>
	</tr>
    <tr>
		<td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Video Urodynamics Study Diagnosis</span>
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td valign="middle" align="center" width="3%" class="FormInsideTableTopLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableTopCell">Bladder Outlet Obstruction</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableTopCell">Poor Compliance</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableTopCell">Sphincteric Incontinence</td>
					<td valign="middle" align="center" width="3%" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableTopCell">Impaired Sensation</td>
				</tr>
				<tr>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Detrusor Sphincter Dyssynergia</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Urethral Stricture</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Diverticula</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Abdominal Voiding</td>
				</tr>
				<tr>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Detrusor Overactivity Incontinence</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Stomal Stenosis</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Detrusor Overactivity</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Peristalsis</td>
				</tr>
				<tr>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Detrusor Underactivity</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Small Capacity Bladder</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Large Capacity Bladder</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Filling Defect</td>
				</tr>
				<tr>
					<td valign="middle" align="center" width="3%" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td  colspan="3"valign="middle" align="left" class="FormInsideTableRegCell">Vesicoureteral Reflex<img src="../../Images/shim.gif" border="0" width="20" height="1">Grade ____Left&nbsp;____Right</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Trabeculations</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Bladder stones</td>
				</tr>
				<tr>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left">Other:</td>
				    <td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
				    <td colspan="3" align="left" valign="middle" class="FormInsideTableRegCell">Other:</td>
					<td valign="middle" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
					<td valign="middle" align="left" class="FormInsideTableRegCell">Prolapse</td>
				</tr>
			</table>		</td>
	</tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="3" class="blackBoldText">Impression &amp; Plan</td>
          </tr>
          <tr> 
            <td width="43%" align="center" class="FormInsideTableTopCell"><strong>Diagnoses / Problem List</strong></td>
            <td width="4%" align="center" class="FormInsideTableTopCell"><strong>New</strong></td>
            <td width="43%" align="center" class="FormInsideTableTopCell"><strong>Plan 
              &amp; Referrals</strong></td>
          </tr>
          <tr> 
            <td height="30" valign="top" class="FormInsideTableRegCell">1.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"> 
              <input name="diagnosisNew1" type="checkbox" id="diagnosisNew1"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="30" valign="top" class="FormInsideTableRegCell">2.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew2" type="checkbox" id="diagnosisNew2"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="30" valign="top" class="FormInsideTableRegCell">3.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"> 
              <input name="diagnosisNew3" type="checkbox" id="diagnosisNew3"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="30" valign="top" class="FormInnerRowRightBorder">4.</td>
            <td align="center" valign="middle" class="FormInnerRowRightBorder"> 
              <input name="diagnosisNew3" type="checkbox" id="diagnosisNew3"></td>
            <td>&nbsp;</td>
          </tr>
        </table>       </td>
    </tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" /> Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.		</td>
	</tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="informedConsent" style="vertical-align: middle;" /> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.		</td>
	</tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Disposition</span><br> 
              <input name="diagnosisNew34" type="checkbox" id="diagnosisNew34">
              Discharge Home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="diagnosisNew33" type="checkbox" id="diagnosisNew33">
              Transfer to UCC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="diagnosisNew32" type="checkbox" id="diagnosisNew32">
              Other (Specify): ____________________________ </td>
          </tr>
          <tr> 
            <td width="69%" align="center" class="FormInnerRowRightBorder">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="100" height="18">Prescriptions:</td>
                  <td width="80" align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1">Yes:</td>
                  <td>Refill &nbsp;&nbsp;or &nbsp;&nbsp;New</td>
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
            <td width="31%" align="center"> <span>Protocol #: ________</span><br>
				<table align="left" width="100%" border="0" cellpadding="0" cellspacing="1">
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
      <td align="center" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" class="FormInnerRowRightBorder">
			<input type="checkbox" name="50% of Time22">&#8805; 50% of attending time was spent in counseling<br>
			<img src="../../Images/shim.gif" border="0" width="1" height="20">If so, mark total attending time in minutes &amp; describe on right:<br> 
            <img src="../../Images/shim.gif" border="0" width="30" height="12">
			<input type="checkbox" name="15-24 (3)2">15-24 (3) &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="25-39 (4)2">25-39 (4) &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="40+ (5)2">40+ (5)</td>
            <td width="50%" valign="top"><img src="../../Images/shim.gif" border="0" width="1" height="11">Describe Counseling or Dictate Note:</td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td align="center" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="50%" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ Resident<img src="../../Images/shim.gif" border="0" width="30" height="1">Attending</td>
			<td width="50%" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Copy to:&nbsp;&nbsp;&nbsp;
			<input name="fellow222" type="checkbox" id="fellow223">referring M.D.: ________________________<br />
			<img src="../../Images/shim.gif" border="0" width="56" height="1"><input name="fellow2222" type="checkbox" id="fellow2222">other: _______________________________</td>
          </tr>
        </table>		</td>
    </tr>
    <tr >
      <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td><span class="blackBoldText">Signatures</span><br /></td>
            <td>&nbsp;</td>
          </tr>
          <tr class="FormOuterTableRow">
            <td width="15%"><span class="blackBoldText"><img src="../../images/shim.gif" border="0" width="6" height="1" />Fellow:</span></td>
            <td>________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></td>
          </tr>
          <!--<tr> 
            <td class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../images/shim.gif" border="0" width="6" height="1">NP / PA: </span></td>
            <td class="FormInnerRowBottomBorder"><span class="blackBoldText">_____________________________________________________________</span></td>
          </tr>-->
          <tr>
            <td colspan="2" valign="bottom"><span class="blackBoldText">
              <input name="fellow" type="checkbox" id="fellow" />
            </span>I personally performed or was physically present during the <strong>key portions</strong> of the procedure today.</td>
          </tr>
          <tr>
            <td><span class="blackBoldText">MD / Attending:</span></td>
            <td>________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </td>
          </tr>
          
      </table></td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU35<img src="../../Images/shim.gif" border="0" width="45" height="1">U40<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/06<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/28/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>

</div>