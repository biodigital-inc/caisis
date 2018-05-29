<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.UroSexFuncFU" CodeFile="UroSexFuncFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


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
		<div  class="VerticalBarCodeDocType">*U22*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Sexual Function Follow Up<br/></span></td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
	<tr>
		<td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="15">Chief Complaint</span>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
				  <td height="30" class="FormInsideTableTopCell"><input type="checkbox" name="No242">Erectile dysfunction</td>
					<td class="FormInsideTableTopCell"><input type="checkbox" name="No242">Penile curvature</td>
					<td class="FormInsideTableTopCell"><input type="checkbox" name="No242">Ejaculation problems</td>
					<td class="FormInsideTableTopCell"><input type="checkbox" name="No242">Orgasm problems</td>
				</tr>
				<tr>
				  <td height="30" class="FormInsideTableRegCell"><input type="checkbox" name="No242">Hypogonadism</td>
					<td colspan="3" class="FormInsideTableRegCell"><input type="checkbox" name="No242">Other:</td>
				</tr>
		  </table>		</td>
	</tr>
    <tr bgcolor="#ffffff"> 
      <td height="220" width="100%" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">HPI</span><br/> 
        <table align="right" width="100%" cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="HPIText" valign="top" width="70%"> 
            
            <asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "patientHPI") %>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Repeater ID="HpiProstatectomies" runat="server" OnItemDataBound="HpiProstatectomiesItemDataBound"> 
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                  </strong> on 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  <asp:Label ID="CaseSurgeonLabel" Runat="server">by 
                    <%# DataBinder.Eval(Container.DataItem, "ProcSurgeon") %>                  </asp:Label>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Label ID="PreTxPot" Runat="server" /> <asp:Repeater ID="hpiProtocols" runat="server" OnItemDataBound="appendToHpiItemDataBound"> 
                <ItemTemplate> Protocol 
                  <%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %>  <%# DataBinder.Eval(Container.DataItem, "ProtocolNotes") %> 
                  <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Repeater ID="hpiBiopsies" runat="server" > 
                <ItemTemplate> Biopsy:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                  &nbsp;&nbsp;Result:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathResult") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathQuality") %>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Label ID="NVB_Left" Runat="server" /> <asp:Label ID="NVB_Right" Runat="server" />            </td>
           <td valign="top" width="40%">
			<table width="100%" cellpadding="4" cellspacing="0" border="0">
          		<tr> 
          			<td valign="top">
          				<img src="../../Images/shim.gif" border="0" width="4" height="1"><input type="checkbox" name="No242" value="Yes">PSA <img src="../../Images/shim.gif" border="0" width="10" height="1"><input type="checkbox" name="No242" value="Yes">ND <img src="../../Images/shim.gif" border="0" width="10" height="1"><input type="checkbox" name="No242" value="Yes">Elevated          			</td>
           		</tr>
          		<tr> 
          			<td valign="top">
         				<img src="../../Images/shim.gif" border="0" width="4" height="1"><input type="checkbox" name="No242" value="Yes">
         				Continence _______________          			</td>
           		</tr>
				<tr> 
          			<td valign="top" height="80">
         				<img src="../../Images/shim.gif" border="0" width="4" height="1"><input type="checkbox" name="No242" value="Yes">New Medications:          			</td>
           		</tr>
				<tr> 
          			<td valign="top" height="80">
         				<img src="../../Images/shim.gif" border="0" width="4" height="1"><input type="checkbox" name="No242" value="Yes">New Conditions:          			</td>
           		</tr>
      	  </table>         </td>
        </tr>
       </table>      </td>
    <tr> 
      <td height="100" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Erectile Function<br/>
        </span> <table class="pageWidth" border="0" cellspacing="0" cellpadding="1">
          <tr align="center"> 
            <td width="10%" class="FormInsideTableTopCell">Date<span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="100" height="1" /></span></td>
            <td width="6%" class="FormInsideTableTopCell">Duration<br/>
              Post Tx</td>
            <td class="FormInsideTableTopCell">Spont<br/>
              EF%</td>
            <!--What does the S Mean here Surgical?-->
            <td class="FormInsideTableTopCell"><p>Spont<br/>
                EFD</p></td>
            <td width="10%" class="FormInsideTableTopCell">Oral Agent</td>
            <td class="FormInsideTableTopCell">Dose</td>
            <td class="FormInsideTableTopCell">Resp<br/>
              (%)</td>
            <td class="FormInsideTableTopCell">Oral<br/>
              EFD</td>
            <td class="FormInsideTableTopCell">ICI<br/>
              Agent</td>
            <td class="FormInsideTableTopCell">Dose</td>
            <td class="FormInsideTableTopCell">Peak<br/>
              Resp%</td>
            <td class="FormInsideTableTopCell">Pen Rig<br/>
              Duration</td>
            <td class="FormInsideTableTopCell">ICI<br/>
              EFD</td>
          </tr>
          
			<asp:Repeater ID="erectileFunction" runat="server" > 
                <ItemTemplate>
					<tr> 
						
                <td height="28" align="center" class="FormInsideTableRegCell">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Date") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Duration Post TX") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Spontaneous Erectile Function %") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Spontaneous Erectile Function Domain") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Oral Agent") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Oral Dose") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Response %") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Oral Erectile Function Domain") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ICI Agent") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ICI Dose") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Peak Response %") %></td>
						<td class="FormInsideTableRegCell" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Penile Rigidity Duration") %></td>
						<td class="FormInnerRowBottomBorder" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ICI Erectile Function Domain") %></td>
					</tr>
				</ItemTemplate>
            </asp:Repeater>
        </table>       </td>
    </tr>
	<tr>
		<td height="20" class="FormOuterTableRow">
			<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="1">
				<tr>
					<td align="center" valign="middle" class="FormInsideTableTopCell" rowspan="2"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1">Nocturnal erections<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No<img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"></td>
					<td height="30" align="center" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1">_____ / 10</td>
					<td align="center" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1">First noted _____ months postop</td>
				</tr>
                <tr><td height="30" align="center" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1">ICI / Week = _____</td>
					<td align="center" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"># Erections / Week = _____</td>
               	</tr>
			</table>		</td>
	</tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" height="200"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Comments:
		      <input type="checkbox" name="No2432" />
		</span>Reviewed EMR for medical and surgical history. </td>
	</tr>
	<tr>
	  <td class="FormOuterTableRow">
	  <span class="PaperFormSectionTitle">Penile Deformity Assessment</span>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
        <tr>
          <td width="10%" height="20" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
          <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">Agent</td>
          <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">Dose</td>
          <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">% Erection </td>
          <td align="center" valign="middle" class="FormInsideTableTopCell">Primary Deformity </td>
          <td align="center" valign="middle" class="FormInsideTableTopCell">Secondary Deformity</td>
          <td align="center" valign="middle" class="FormInsideTableTopCell">Associated Deformities </td>
        </tr>
        <tr>
          <td height="30" class="FormInsideTableLeftCell" align="center" valign="middle">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
        </tr>
        <tr>
          <td height="30" class="FormInsideTableLeftCell" align="center" valign="middle">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
        </tr>
        <tr>
          <td height="30" class="FormInsideTableLeftCell" align="center" valign="middle">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
          <td class="FormInsideTableRegCell">&nbsp;</td>
        </tr>
      </table></td>
	  </tr>
	
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU18<img src="../../Images/shim.gif" border="0" width="45" height="1">U22<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">18</span></td>
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
		<div  class="VerticalBarCodeDocType">*U22*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Sexual Function Follow Up<br/></span></td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
	<tr>
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Duplex Doppler Ultrasonography</span>				</tr>
                <tr>
                <td><img src="../../Images/shim.gif" border="0" width="4" height="1">Clinician Performing Review:<img src="../../Images/shim.gif" border="0" width="10" height="1"><input type="checkbox" name="PA22" value="Yes">
        NP / PA<img src="../../Images/shim.gif" border="0" width="10" height="1"> 
        <input type="checkbox" name="Fellow23" value="Yes">
        Fellow<img src="../../Images/shim.gif" border="0" width="10" height="1"> 
        <input type="checkbox" name="Attending22" value="Yes">
        Attending</span></td>
        		</tr>
				<tr>
					<td height="30" align="left" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><strong>Indications</strong>:</td>
				</tr>
				<tr>
					<td align="left" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><strong>Procedure</strong>: Patient Consented<img src="../../Images/shim.gif" border="0" width="10" height="1"><input type="checkbox" name="No242">Yes<img src="../../Images/shim.gif" border="0" width="10" height="1"><input type="checkbox" name="No243">No</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="60%" height="20" align="left" valign="top" class="FormInsideTableLeftCell">Agent</td>
								<td width="40%" align="left" valign="top" class="FormInsideTableRegCell"># Doses</td>
							</tr>
						</table>				  </td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="25%" height="20" align="left" valign="top" class="FormInsideTableLeftCell">BQE</td>
								<td width="40%" align="left" valign="top" class="FormInsideTableRegCell">Oral Agent Response</td>
								<td width="35%" align="left" valign="top" class="FormInsideTableRegCell">ICI Response</td>
						  </tr>
						</table>					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="8%" height="20" align="center" valign="middle" class="FormInsideTableTopLeftCell">Dose</td>
								<td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Right PSV</td>
								<td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Left PSV</td>
								<td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Right EDV</td>
								<td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Left EDV</td>
								<td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Right RI</td>
								<td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Left RI</td>
							</tr>
							<tr>
								<td height="30" class="FormInsideTableLeftCell" align="center" valign="middle">Dose 1</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" class="FormInsideTableLeftCell" align="center" valign="middle">Dose 2</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" class="FormInsideTableLeftCell" align="center" valign="middle">Dose 3</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
								<td class="FormInsideTableRegCell">&nbsp;</td>
							</tr>
					  </table>					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="40%" height="30" align="left" valign="top" class="FormInsideTableTopLeftCell">Curvature</td>
								<td width="35%" align="left" valign="top" class="FormInsideTableTopCell">Location</td>
								<td width="25%" align="left" valign="top" class="FormInsideTableTopCell">Degree</td>
							</tr>
							<tr>
								<td height="30" align="left" valign="top" class="FormInsideTableLeftCell">Other Deformity</td>
								<td align="left" valign="top" class="FormInsideTableRegCell">Location</td>
								<td align="left" valign="top" class="FormInsideTableRegCell">Magnitude</td>
							</tr>
							<tr>
								<td height="30" align="left" valign="top" class="FormInsideTableLeftCell">Stretched Flaccid Length (cm)</td>
								<td colspan="2" align="left" valign="top" class="FormInsideTableRegCell"> Erect Length (cm)</td>
							</tr>
							<tr>
								<td colspan="2" height="30" align="left" valign="top" class="FormInsideTableLeftCell">Neo-Synephrine Administration</td>
								<td align="left" valign="top" class="FormInsideTableRegCell">Dose</td>
							</tr>
						</table>				  </td>
				</tr>
			</table>		</td>
	</tr>
	<tr>
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="1"><strong>Duplex Doppler Ultrasonography Diagnosis</strong></td>
				</tr>
				<tr>
					<td align="center" width="2%" height="60" class="FormInsideTableTopCell"><strong>1.</strong></td>
					<td width="98%" class="FormInsideTableTopCell">&nbsp;</td>
				</tr>
				<tr>
					<td align="center" height="60" class="FormInsideTableRegCell"><strong>2.</strong></td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
					<td align="center" height="60" class="FormInsideTableRegCell"><strong>3.</strong></td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
		  </table>		</td>
	</tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
	  	<tr>
			<td ><%--width="71%" --%>
				<table align="left" width="100%" border="0" cellpadding="5" cellspacing="0">
				  <tr> 
					<td align="left" class="FormInnerRowBottomBorder"><span class="blackBoldText">Peyronie's Disease</span><img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">None<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Curvature<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Other</td>
				  </tr>
				  <tr> 
					<td align="left" class="FormInnerRowBottomBorder">Status:
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">New
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">First Noted: _____ months postop
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Stable
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Improved
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Worsened					</td>
				  </tr>
				  <tr> 
					<td align="left" class="FormInnerRowBottomBorder">Degree:
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">10-20
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">21-30
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">31-40
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">41-50
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">51-60
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">61-70
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">71-80
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">81-90
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">&gt;90</td>
				</tr>
				<tr> 
					<td height="20" align="left" class="FormInnerRowBottomBorder">Direction: 
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Dorsal
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Ventral
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Right
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Left
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Combined __________</td>
				</tr>
				<tr>
					<td align="left" class="FormInnerRowBottomBorder">Pain:
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Flaccid
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Erect</td>
				</tr>
				<tr>
					<td align="left" class="FormInnerRowBottomBorder">Penetration Ability:
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="30" height="1">Instability:
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No</td>
				</tr>
				<tr> 
					<td height="20" align="left" class="FormInnerRowBottomBorder">First Sign: 
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Pain
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Nodule
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Deformity</td>
				</tr>
				
				<tr> 
					<td height="20" align="left" class="FormInnerRowBottomBorder">Treatments to Date:<br/>
						<table border="0" cellpadding="5" cellspacing="0" style="width: 99%; border: solid 1px #999999; margin-top: 3px;">
							<tr>
						  <td height="20" align="left" class="FormInnerRowBottomBorder" style="padding-left: 5px;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Oral</td>
						  </tr>
						<tr>
						  <td height="20" align="left" class="FormInnerRowBottomBorder" style="padding-left: 5px;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />ILV</td>
						  </tr>
						<tr>
						  <td height="20" align="left" class="FormInnerRowBottomBorder" style="padding-left: 5px;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Other</td>
						  </tr>
						<tr>
						  <td height="20" align="left" style="padding-left: 5px;">Operative: <img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Nesbit <img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />PIG <img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />IPP</td>
						  </tr>
						</table>					</td>
				</tr>
				</table>			</td><%--
			<td width="29%" valign="top" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Comments</span>
          	<table align="left" width="100%" border="0" cellpadding="5" cellspacing="0">
				  <tr>
            		<td colspan="3"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Comments</span>
					<br /><br /><br /><img src="../../Images/FormImages/sexFuncDiagram1.gif" width="200" height="137" vspace="2"></td>
                  </tr>
                  <tr>
                  	<td width="20%" height="20" align="left">Calcified:</td>
					<td width="20%" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes</td>
					<td width="60%" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No</td>
                  </tr>
                  <tr>
                  	<td width="20%" height="20" align="left">Tender:</td> 
					<td width="20%" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes</td>
					<td width="60%" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No</td>
                  </tr>
                 </table> 
            </td>--%>
          </tr>
		</table>		</td>
    </tr>
<!--    <tr> 
      <td height="30" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Treatments</span>
	  <img src="../../Images/shim.gif" border="0" width="30" height="1"><input name="diagnosisNew1242" type="checkbox" id="diagnosisNew1242">Oral
	  <img src="../../Images/shim.gif" border="0" width="30" height="1"><input name="diagnosisNew12222" type="checkbox" id="diagnosisNew12222">Intralesional
	  <img src="../../Images/shim.gif" border="0" width="30" height="1"><input name="diagnosisNew12322" type="checkbox" id="diagnosisNew12322">Surgery
	  <img src="../../Images/shim.gif" border="0" width="30" height="1"><input name="diagnosisNew123222" type="checkbox" id="diagnosisNew123222">Other</td>
    </tr>
--> 



    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU18<img src="../../Images/shim.gif" border="0" width="45" height="1">U22<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">2</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">18</span></td>
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
		<div  class="VerticalBarCodeDocType">*U22*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
              Urology Sexual Function Follow Up<br/></span></td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>



	<tr> 
      <td class="FormOuterTableRow" style="padding-top: 6px;">
	  			<span class="PaperFormSectionTitle">Sexual Incontinence</span>
	  
				<table align="left" width="100%" border="0" cellpadding="5" cellspacing="0" style="border-top: solid 1px #333333;">
				  <tr> 
					<td align="left" class="FormInsideTableRegCell" style="border-right: solid 1px #333333;"><span style="font-weight: bold;">Orgasm Associated Incontinence</span>
					<img src="../../Images/FormImages/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes</td>
				    <td align="left" class="FormInsideTableRegCell"><span  style="font-weight: bold;">Arousal Incontinence</span> <img src="../../Images/FormImages/shim.gif" border="0" width="20" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />No <img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Yes</td>
				  </tr>
				  <tr> 
					<td align="left" class="FormInsideTableRegCell" style="border-right: solid 1px #333333;">
					<img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Commenced: _________ months postop					</td>
				    <td align="left" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Commenced: _________ months postop </td>
				  </tr>
				  <tr>
				    <td align="left" class="FormInsideTableRegCell" style="border-right: solid 1px #333333;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Ceased: _________ months postop</td>
			        <td align="left" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Ceased: _________ months postop</td>
				  </tr>
				  <tr> 
					<td align="left" class="FormInsideTableRegCell" style="border-right: solid 1px #333333;">
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Rare
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Occasional
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Frequent
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Always</td>
				    <td align="left" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Rare <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Occasional <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Frequent <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Always</td>
				  </tr>
				<tr> 
					<td height="20" align="left" class="FormInsideTableRegCell" style="border-right: solid 1px #333333;">
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Small
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Moderate
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Large</td>
				    <td align="left" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Small <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Moderate <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Large</td>
				</tr>
				<tr>
					<td align="left" class="FormInsideTableRegCell" style="border-right: solid 1px #333333;">Distress:
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">None
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Minimal
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Moderate
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Severe</td>
				    <td align="left" class="FormInsideTableRegCell">Distress: <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />None <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Minimal <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Moderate <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Severe</td>
				</tr>
				<tr>
					<td align="left" class="FormInsideTableRegCell" style="border-right: solid 1px #333333;">Treatments Attempted:
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Imipramine
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Loop</td>
				    <td align="left" class="FormInsideTableRegCell">Treatments Attempted: <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Imipramine <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Loop</td>
				</tr>
				<tr> 
					<td height="20" align="left" class="FormInsideTableRegCell" style="border-right: solid 1px #333333;">Improvement: 
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No</td>
				    <td align="left" class="FormInsideTableRegCell">Improvement: <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />Yes <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />No</td>
				</tr>
				</table>					</td>
    </tr>
	<tr>
		<td class="FormOuterTableRow">
			<asp:Literal id="HypogonadismOptionalStyles" runat="server" Visible="false"><style type="text/css">.HypogonadismHCTCol { display: none; }</style></asp:Literal>
	  		<table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="16" style="padding-left: 4px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Hypogonadism</span></td>
				</tr>
				<tr>
					<td align="center" height="25" valign="middle" width="10%" class="FormInsideTableTopCell">Date</td>
					<td align="center" valign="middle" width="15%" class="FormInsideTableTopCell">Medication</td>
					<td align="center" valign="middle" width="10%" class="FormInsideTableTopCell">Dose</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">PSA</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">tT</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">fT</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">SHBG</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">E2</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">LH</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">FSH</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">PRL</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell HypogonadismHCTCol">HCT</td>
				</tr>
				
			    <asp:Repeater ID="Hypogonadism" runat="server" > 
                <ItemTemplate>
				<tr>
					<td height="26" class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DateText")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDose")%><%# DataBinder.Eval(Container.DataItem, "MedUnits")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PSA")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "tT")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "fT")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SHBG")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "E2")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "LH")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "FSH")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PRL")%></td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "HCT")%></td>
				</tr>
                </ItemTemplate>
                </asp:Repeater>
				<tr>
					<td height="40" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol">&nbsp;</td>
				</tr>
				<tr>
					<td height="40" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol">&nbsp;</td>
				</tr>
				<tr>
				  <td height="40" class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell HypogonadismHCTCol">&nbsp;</td>
			  </tr>
				<tr>
					<td height="40" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol">&nbsp;</td>
				</tr>
		  </table>		</td>
	</tr>
	<tr>
      <td class="FormOuterTableRow"><table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="11" style="padding-left: 4px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Semen Analysis </span></td>
          </tr>
          <tr>
            <td align="center" height="25" valign="middle" width="11%" class="FormInsideTableTopCell">Date</td>
            <td align="center" valign="middle" width="11%" class="FormInsideTableTopCell">Concentration</td>
            <td align="center" valign="middle" width="10%" class="FormInsideTableTopCell">Motility</td>
            <td align="center" valign="middle" width="10%" class="FormInsideTableTopCell">Normal Morphology </td>
            <td align="center" valign="middle" width="6%" class="FormInsideTableTopCell">pH</td>
            <td align="center" valign="middle" width="8%" class="FormInsideTableTopCell">Volume</td>
            <td align="center" valign="middle" width="44%" class="FormInsideTableTopCell">Other</td>
          </tr>
          <tr>
            <td height="40" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="40" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="40" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="40" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
      </table></td>
	  </tr>
    <tr>
<td class="FormOuterTableRow">
	  		<table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="16"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">DEXA Scan</span></td>
				</tr>
				<tr>
				  <td align="center" valign="middle" class="FormInsideTableTopCell">&nbsp;</td>
				  <td colspan="4" align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; background-color: #dfdfdf; padding: 0px 0px;">T-Scores</td>
			  </tr>
				<tr>
					<td align="center" height="25" valign="middle" width="20%" class="FormInsideTableRegCell">Date</td>
					<td align="center" valign="middle" width="20%" class="FormInsideTableRegCell">Total Hip </td>
					<td align="center" valign="middle" width="20%" class="FormInsideTableRegCell">Femoral Neck </td>
					<td align="center" valign="middle" width="20%" class="FormInsideTableRegCell">Lumbar / Spine </td>
					<td align="center" valign="middle" width="20%" class="FormInsideTableRegCell">Forearm</td>
				</tr>
				<tr>
					<td height="40" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
				  <td height="40" class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
				  <td class="FormInsideTableRegCell">&nbsp;</td>
			  </tr>
				<tr>
					<td height="40" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
					<td height="40" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
		  </table>		</td>
	</tr>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU18<img src="../../Images/shim.gif" border="0" width="45" height="1">U22<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">3</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">18</span></td>
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
		<div  class="VerticalBarCodeDocType">*U22*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
              Urology Sexual Function Follow Up<br/></span></td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
<tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Review 
        of Systems</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Review: 
        <input type="checkbox" name="PA22" value="Yes">
        RN&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="PA3" value="Yes">
        PA/NP&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow3" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending3" value="Yes">
        Attending</span>
		<table border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr> 
            <td width="45" align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td width="150" align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Not Present</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
            <td width="385" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">General</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Fever</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Neuro</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Headaches</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Focal Weakness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Eyes</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Visual Problems</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">CV</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Angina</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Palpitations</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Respiratory</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Shortness of Breath</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Hemoptysis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">GI</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Nausea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="4" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Abdominal Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Rectal Bleeding</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">GU</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Dysuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>

            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">MS</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Joint Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Psych</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Anxiety / Depression</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Heme</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Anemia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Rash</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Endo</td>
            <td height="32" align="left" class="FormInsideTableRegCell">Heat/Cold Intolerance</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Thirst</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td height="32" align="left" class="FormInsideTableRegCell">Hot Flashes</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
          </tr>
          <tr> 
            <td colspan="7" height="40" align="left" valign="top">Other:</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
          </td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU18<img src="../../Images/shim.gif" border="0" width="45" height="1">U22<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">18</span></td>
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
		<div  class="VerticalBarCodeDocType">*U22*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>
              Urology Sexual Function Follow Up<br/></span></td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>    <tr> 
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
      <td class="FormOuterTableRow"> 
          <tr>
            <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="0" >
                <tr>
                  <td valign="top" rowspan="3"><span class="blackBoldText">Exam</span></td>
                  <td width="30%"><span class="smallGrayText"><strong>Clinician 
                    Performing Initial Exam:</strong></span></td>
                  <td width="12%"><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" /> <strong>NP / PA</strong></span></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" /> <strong>Fellow</strong></span></td>
                  <td><span class="smallGrayText">Attending must repeat and document <span style="font-weight: bold; text-decoration: underline;">critical</span> findings.</span></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" /> <strong>Attending</strong></span> </td>
                  <td>&nbsp;</td>
                </tr>
              </table>
                <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
                    <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
                      Symptoms</strong><strong></strong></td>
                    <td width="30" align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
                    <td width="10%" align="center" class="FormInsideTableTopCell"><strong>Attnd<br />
                      Performed</strong></td>
                    <td align="center" colspan="2" class="FormInsideTableTopCell"><strong>Notes</strong></td>
                  </tr>
                  <tr>
                    <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Gen</td>
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Well Developed / 
                      Well Nourished</td>
                    <td width="30" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td width="20%" rowspan="3" colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder">No Acute Distress</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Alert &amp; Oriented</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr>
                    <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Eyes&nbsp;</td>
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> No Scleral Icterus</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td colspan="2" rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> Conjunctiva</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr>
                    <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Lymph Nodes</td>
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> Cervical</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td rowspan="3" colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> Supraclavicular</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> Groin </td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td align="left" valign="top" class="FormInsideTableLeftCell">Respiratory</td>
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> Clear to Auscultation </td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">CV</td>
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Regular Rate &amp; Rhythm</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder">No murmurs</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr>
                    <td rowspan="5" align="left" valign="top" class="FormInsideTableLeftCell">Abdomen</td>
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Soft Non-tender</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td rowspan="5" colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> Normal Bowel Sounds</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> No Hepatosplenomegaly</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder">No Ascites</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> No Hernia</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr>
                    <td rowspan="8" align="left" valign="top" class="FormInsideTableLeftCell">GU<br />
                      Male</td>
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Scrotum</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
                    <td width="26%" rowspan="8" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/sexFuncDiagram1.gif" width="196" height="150" /></td>
                  </tr>
                  <tr>
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Testis</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td valign="top" class="FormInsideTableRegCell">Testis Volume: _______ </td>
                  </tr>
                  <tr>
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Epididymis</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Varicocele</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Penis</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td valign="top" class="FormInsideTableRegCell">Circumcised:&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />Yes&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />No</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Penile Stretch</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />Poor&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />Fair&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />Good</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Penile Plaque </td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td  class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />Tender&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />Calcified</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> DRE - Prostate </td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr>
                    <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Peripheral Vascular</td>
                    <td height="27" align="left" class="FormInnerRowBottomBorder"> Femoral Pulses</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td rowspan="3" colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Popliteal Pulses</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td height="27" align="left" class="FormInnerRowBottomBorder">Pedal Pulses</td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                    <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  </tr>
                  <tr class="eFormInnerTableRow">
                    <td align="left" height="40" valign="top" class="FormInsideTableLeftCell">Other:</td>
                    <td colspan="6&quot;" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
              </table></td>
       </tr></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU18<img src="../../Images/shim.gif" border="0" width="45" height="1">U22<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">18</span></td>
    </tr>
  </table>
</div>

<div align="left"  id="LastPageInForm" runat="server" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="320"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U22*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Sexual Function Follow Up<br/></span></td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %>
      <img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: 
      <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0" class="pageWidth" cellpadding="3" cellspacing="0">
          <tr> 
            <td colspan="3" class="blackBoldText">Impression &amp; Plan</td>
          </tr>
          <tr> 
            <td width="29%" align="center" class="FormInsideTableTopCell"><strong>Diagnoses / Problem List</strong></td>
            <td width="3%" align="center" class="FormInsideTableTopCell"><strong>New</strong></td>
            <td width="68%" align="center" class="FormInsideTableTopCell"><strong>Plan &amp; Referrals</strong></td>
          </tr>
          <tr> 
            <td height="75" valign="top" class="FormInsideTableRegCell">1.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew1" type="checkbox" id="diagnosisNew1"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="75" valign="top" class="FormInsideTableRegCell">2.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew2" type="checkbox" id="diagnosisNew2"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="75" valign="top" class="FormInsideTableRegCell">3.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew3" type="checkbox" id="diagnosisNew3"></td>
            <td valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="75" valign="top" class="FormInnerRowRightBorder">4.</td>
            <td align="center" valign="middle" class="FormInnerRowRightBorder"><input name="diagnosisNew4" type="checkbox" id="diagnosisNew4"></td>
            <td>&nbsp;</td>
          </tr>
        </table>		</td>
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
      <td valign="top" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="100%" class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22">&#8805; 50% of  time was spent in counseling<img src="../../Images/shim.gif" border="0" width="4" height="1">(If so, mark total attending time in minutes):<img src="../../Images/shim.gif" border="0" width="4" height="1">
			<input type="checkbox" name="15-24 (3)22">15-24 (3)&nbsp;&nbsp;<input type="checkbox" name="25-39 (4)22">25-39 (4)&nbsp;&nbsp;<input type="checkbox" name="40+ (5)22">40+ (5)			  </td>
          </tr>
        </table>	  </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
					  <td colspan="2" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Describe Counseling or Dictate Note</span></td>
				<td align="center" valign="bottom" style="font-weight: bold;">Notes</td>
			</tr>
			<tr>
			  <td width="30%" height="20" align="left" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Oral Erectogenic Therapy</td>
			  <td width="26%" align="left" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Penile Rehabilitation</td>
				<td width="44%" class="FormInsideTableTopLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Intracavernosal Injections</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Vacuum Device Therapy</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Intraurethral Agents</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Penile Implant Surgery</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Duplex Doppler US</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;DICC</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Premature Ejaculation</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Retarded Orgasm</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
            </tr>
             <tr>
               <td height="20" colspan="2" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Orgasm Associated Incontinence</td>   
                <td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Peyronie's Disease Medical Therapy</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Intralesional Injection Therapy</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Peyronie's Disease Surgery</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Bone Density</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Varicocele</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Varicocele Surgery </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Low Testosterone</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Testosterone Supplementation</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Vasectomy</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Vasectomy Reversal </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Male Infertility </td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Female Infertility </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Azoospermia</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;TESE </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;ICSI</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;EEJ </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;PVS</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Other: </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
		</table>      </td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="22" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5</td>
            <td width="50%">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ Resident<img src="../../Images/shim.gif" border="0" width="30" height="1">Attending</td>
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
            <td colspan="4"><span class="blackBoldText"><input name="np/pa" type="checkbox" id="np/pa"></span>This visit was conducted <strong>jointly</strong> with the attending physician.</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU18<img src="../../Images/shim.gif" border="0" width="45" height="1">U22<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">6</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">18</span></td>
    </tr>
  </table>
</div>

</div>
