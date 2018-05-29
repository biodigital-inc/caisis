<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.UroPreopProsNote" CodeFile="UroPreopProsNote.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>



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
		<div  class="VerticalBarCodeDocType">*U37*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Prostatectomy Preoperative Note<br/></span></td>
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
        </table>
		</td>
    </tr>
    <tr> 
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Surgeon: 
        <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>
        </span></td>
    </tr>
    <tr> 
      <td  class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="40%" height="100" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Procedure Planned</span></td>
            <td width="60%" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Past Surgical History</span></td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td height="200" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Past Medical History</span><br/>
      
      
      
      <table cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="HPIText" valign="top">
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
                    <%# DataBinder.Eval(Container.DataItem, "ProcSurgeon") %>
                  </asp:Label>
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
              </asp:Repeater> 
              <asp:Label ID="NVB_Left" Runat="server" /> <asp:Label ID="NVB_Right" Runat="server" /> 
            </td>
          </tr>
        </table>
      
      
      
      </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="70%" height="100" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Medications</span></td>
            <td width="30%" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Allergies</span></td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="20"><span class="blackBoldText">Preoperative Testing</span><img src="../../Images/shim.gif" border="0" width="200" height="1"><span class="blackBoldText">Date:</span> 
        <table width="700" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td> 
			 <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td align="center" width="8%" height="30" class="FormInsideTableTopCell"><strong>WBC</strong></td>
                  <td  class="FormInsideTableTopCell" width="17%">&nbsp;</td>
                  <td align="center" width="8%" class="FormInsideTableTopCell"><strong>Na</strong></td>
                  <td  class="FormInsideTableTopCell" width="17%">&nbsp;</td>
                  <td align="center" width="8%" class="FormInsideTableTopCell"><strong>CO</strong></td>
                  <td  class="FormInsideTableTopCell" width="17%">&nbsp;</td>
                  <td align="center" width="8%"  class="FormInsideTableTopCell"><strong>Creat</strong></td>
                  <td  class="FormInsideTableTopCell" width="17%">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell" height="30"><strong>H/H</strong></td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell"><strong>K+</strong></td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell"><strong>GLuco</strong></td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell"><strong>Ca++</strong></td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell" height="30"><strong>Plts</strong></td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell"><strong>Cl</strong></td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell"><strong>BUN</strong></td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="left" valign="top" class="FormInsideTableRegCell" colspan="2" rowspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="2"><strong>Other:</strong></td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell" height="30"><strong>PT</strong></td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell"><strong>PTT</strong></td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell"><strong>INR</strong></td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell" height="30"><strong>UA</strong></td>
                  <td class="FormInsideTableRegCell" colspan="3">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell"><strong>Urine<br/>
                    C&amp;S</strong></td>
                  <td class="FormInsideTableRegCell" colspan="3">&nbsp;</td>
                </tr>
              </table>
			 </td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td align="left" valign="middle" height="30" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><strong>Type and Cross:</strong></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="left" valign="top" height="50" width="50%" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">EKG</span></td>
            <td align="left" valign="top" width="50%"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Chest 
              X-Ray</span></td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr> 
      <td align="left" valign="top" height="40" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Medical 
        Consult</span></td>
    </tr>
    <tr> 
      <td height="30" valign="middle" align="left" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Informed 
        consent signed and in the medical records?<img src="../../Images/shim.gif" border="0" width="30" height="1"><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">Yes<img src="../../Images/shim.gif" border="0" width="30" height="1"><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">No</span></td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU33<img src="../../images/shim.gif" border="0" width="45" height="1">U37<img src="../../images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../images/shim.gif" border="0" width="45" height="8">rev:10/22/12<img src="../../images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">2</span><img src="../../images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>


<div id="LastPageInForm" runat="server" align="left">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U37*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br/>
            Urology Prostatectomy Preoperative Note<br/>
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
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Date: 
              <% =apptClinicDate %>            </td>
          </tr>
        </table>	  </td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td valign="top" align="left" width="50%" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Urinary Function</span></td>
				<td valign="top" align="left" width="50%" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Sexual Function</span></td>
			</tr>
			<tr>
				<td valign="top" align="left" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Urinary QOL(Q1-Q3) :<span class="smallGrayText"><br/>
              		<img src="../../Images/shim.gif" border="0" width="4" height="0">Q1:______&nbsp;&nbsp;&nbsp;&nbsp;Q2:______&nbsp;&nbsp;&nbsp;&nbsp;Q3:______&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total: ______ / 15</span><asp:Label ID="UrinaryQOL" Runat="server" CssClass="blackBoldTextSmall" /><br/>
			  		<br/>
			  		<img src="../../Images/shim.gif" border="0" width="4" height="0">Continence:<img src="../../Images/shim.gif" width="17" height="0"> 
              		<input name="textfield4" type="text" class="inputFieldFlat" size="5"><br/><asp:Label ID="LastCont" Runat="server" CssClass="blackBoldTextSmall"/>					</td>
            	<td valign="bottom" class="FormInsideTableRegCell"><asp:Label CssClass="FormPopulatedSmallerText" ID="LastPot" Runat="server" /> 
            <img src="../../Images/shim.gif" border="0" width="4" height="0">&nbsp;Sexual 
            QOL (Q4-Q6):<span class="smallGrayText"><br/>
            <img src="../../Images/shim.gif" border="0" width="4" height="0">Q4:______&nbsp;&nbsp;&nbsp;(Q5:______ &nbsp;+&nbsp;&nbsp; Q6:______ )&nbsp;=&nbsp;Total: ______ / 12</span> 
            <asp:Label CssClass="blackBoldTextSmall" ID="SexualQOL" Runat="server" />
			  		<br/>
			  		<br/>
            <img src="../../Images/shim.gif" border="0" width="4" height="0">Erectile 
            Function<img src="../../Images/shim.gif" border="0" width="17" height="0"> 
            <input type="text" name="textfield2222" class="inputFieldFlat" size="10"></td>
			</tr>
			<tr>
				<td valign="top" align="left" class="FormInsideTableRegCell"><p class="smallGrayText">
					 <img src="../../Images/shim.gif" border="0" width="4" height="0">1 - Continence(no pads)<br/>
                     <img src="../../Images/shim.gif" border="0" width="4" height="0">2 - Mild SUI(leaks only during heavy actvty)<br/>
                     <img src="../../Images/shim.gif" border="0" width="4" height="0">3 - Moderate SUI(leaks with moderate actvty)<br/>
                     <img src="../../Images/shim.gif" border="0" width="4" height="0">4 - Severe SUI<br/>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(leaks during nl actvty, dry 
                      at night and at rest)<br/>
                      <img src="../../Images/shim.gif" border="0" width="4" height="0">5 - Total incont(continuous leakage of urine at rest)</p></td>
				<td valign="top" align="left" class="FormInsideTableRegCell"><span class="smallGrayText">
			  <img src="../../Images/shim.gif" border="0" width="4" height="0">1-Normal, full erections <br/>
              <img src="../../Images/shim.gif" border="0" width="4" height="0">2-Full, but recently diminished <br/>
              <img src="../../Images/shim.gif" border="0" width="4" height="0">3-Partial, satis. for intercourse <br/>
              <img src="../../Images/shim.gif" border="0" width="4" height="0">4-Partial, unsatis. for intercourse <br/>
              <img src="../../Images/shim.gif" border="0" width="4" height="0">5-Impotent</span></td>
			</tr>
		</table>	  </td>
    </tr>
    <tr> 
      
    <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Preoperative Predictions</span><img src="../../Images/shim.gif" border="0" width="200" height="1"><span class="blackBoldText">Date:</span> 
      <table width="700" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td> 
			 <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                	<td align="center" width="12%" height="30" class="FormInsideTableTopCell"><strong>Clinical T stage</strong></td>
                 	<td width="13%" class="FormInsideTableTopCell">&nbsp;</td>
                 	<td align="center" width="12%" class="FormInsideTableTopCell"><strong>Gleason</strong></td>
                  	<td width="13%" class="FormInsideTableTopCell">&nbsp;</td>
                  	<td align="center" width="12%" class="FormInsideTableTopCell"><strong>PSA</strong></td>
                 	<td width="13%" class="FormInsideTableTopCell">&nbsp;</td>
               		<td align="center" width="12%"  class="FormInsideTableTopCell"><strong>Post RP 5 yr </strong></td>
                 	<td width="13%" class="FormInsideTableTopCell">&nbsp;</td>
                </tr>
                <tr> 
                	<td align="center" class="FormInsideTableRegCell" height="30"><strong>SVI</strong></td>
                  	<td class="FormInsideTableRegCell">&nbsp;</td>
                	<td align="center" class="FormInsideTableRegCell"><strong>LNI</strong></td>
                  	<td class="FormInsideTableRegCell">&nbsp;</td>
               		<td align="center" class="FormInsideTableRegCell"><strong>OC</strong></td>
                 	<td class="FormInsideTableRegCell">&nbsp;</td>
                  	<td align="center" class="FormInsideTableRegCell"><strong>ECE</strong></td>
                  	<td class="FormInsideTableRegCell">Left:<br/>Right:</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>	  </td>
    </tr>
	<tr>
	  <td valign="top" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top" class="FormInsideTableRegCell"><span class="blackBoldText">Biopsy</span><br />
              Indicate the number of cores positive over the total number of cores taken, percent cancer, and millimeters of cancer in each region.</td>
            <td valign="top" class="FormInsideTableRegCell"><span class="blackBoldText">MRI</span><br />
              Mark areas suspicious for cancer and extracapsular extension (ECE).  Darker shading means more suspicious.</td>
            <td valign="top" class="FormInsideTableRegCell"><span class="blackBoldText">DRE</span><br />
              Mark areas suspicious for cancer based on rectal exam. Darker shading means more suspicious.</td>
          </tr>
          <tr>
            <td class="FormInnerRowRightBorder" align="center"><img src="../../Images/FormImages/Preop_ProstateGrid.gif" border="0" width="150" height="150" /></td>
            <td align="center" valign="top" class="FormInnerRowRightBorder" style="padding-top:10px"><img src="../../Images/FormImages/CoronalViewProstate.gif" width="171" height="161" border="0" align="texttop" /><img src="../../Images/FormImages/TransverseProstate.gif" width="155" height="143" border="0" align="texttop" style="margin-top:12px;" /></td>
            <td class="FormInnerRowRightBorder" align="center"><img src="../../Images/FormImages/Preop_DRE.gif" border="0" width="150" height="150" /></td>
          </tr>
          <tr>
            <td align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><strong>Notes:</strong></td>
            <td align="left" valign="top" class="FormInnerRowRightBorder" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" width="99%" style="margin-left: 2px; margin-top: 2px;">
                <tr>
                  <td width="14%" valign="top">&nbsp;</td>
                  <td valign="top" width="24%"><strong>Key:</strong><br/>
                      <img src="../../Images/FormImages/MRIDiagramBlack.gif" border="0" width="11" height="11" /> High <br/>
                      <img src="../../Images/FormImages/MRIDiagramDoubleHatch.gif" border="0" width="11" height="11" /> med<br/>
                      <img src="../../Images/FormImages/MRIDiagramHorizontalHatch.gif" border="0" width="11" height="11" /> low<br/>
                      <img src="../../Images/FormImages/MRIDiagramWhite.gif" border="0" width="11" height="11" /> none<br/>                  </td>
                  <td valign="top">&nbsp;&nbsp;<strong>Notes:</strong> <br />
                      <img src="../../Images/shim.gif" border="0" width="5" height="15" />MRI 
                    Ureth. Length:__________<br />
                            <img src="../../Images/shim.gif" border="0" width="5" height="15" />MRI 
                    Veins (0-4+):___________<br />
                            <img src="../../Images/shim.gif" border="0" width="5" height="15" />Prostate 
                    Volume (cc):_______ </td>
                </tr>
            </table></td>
            <td align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><strong>Notes:</strong></td>
          </tr>
      </table></td> 
      </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
         <tr> 
          <td colspan="2" valign="middle" height="22"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Biochemical Markers</span><img src="../../Images/shim.gif" border="0" width="150" height="1"><span class="blackBoldText">PSA DT:</span><img src="../../Images/shim.gif" border="0" width="100" height="8"><span class="blackBoldText">PSA Velocity (ng/ml/yr):</span></td>
          </tr>
          <tr> 
            <td width="50%" valign="top" class="FormInnerRowRightBorder"> <table width="100%" border="0" cellpadding="1" cellspacing="0" class="FormInnerRowRightBorder">
                <tr > 
                  <td width="29%" align="center" valign="middle" class="FormInsideTableTopCell">Date 
                    <br/>
                    (mm/dd/yyyy)</td>
                  <td width="24%" align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                  <td width="24%" align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td width="23%" align="center" valign="middle" class="FormInsideTableTopCell">Data<br/>
                    Source</td>
                </tr>
                <asp:Repeater ID="labTests" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td height="17" align="center" class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabDateText") %>                      </td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabTest") %>                      </td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabResult") %>                      </td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "LabQuality") %>                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
            <td width="50%" valign="top" class="blackBoldText"><table border="0" width="100%" cellpadding="1" cellspacing="0">
              <tr> 
                <td width="29%" align="center" valign="middle" class="FormInsideTableTopCell">Date 
                  <br/>
                  (mm/dd/yyyy)</td>
                <td width="24%" align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                <td width="24%" align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                <td width="23%" align="center" valign="middle" class="FormInsideTableTopCell">Data<br/>
                  Source</td>
              </tr>
              <tr> 
                <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
              </tr>
              <tr> 
                <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
              </tr>
              <tr> 
                <td height="17" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
                <td class="FormInsideTableRegCell">&nbsp;</td>
              </tr>
            </table>			</td>
          </tr>
        </table>		</td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td colspan="2"><span class="blackBoldText">Signatures</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr>
            <td align="right"><span class="blackBoldText">PA: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr>
            <td height="44" align="right"><span class="blackBoldText">Fellow: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>

          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
                  <td>Patient understands all risks and benefits and agrees to proceed.<br/>
                      <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="34" /> MD / Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="40" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      </tr>
    
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU33<img src="../../images/shim.gif" border="0" width="45" height="1">U37<img src="../../images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../images/shim.gif" border="0" width="45" height="8">rev:10/22/12<img src="../../images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">2</span><img src="../../images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>


</div>


