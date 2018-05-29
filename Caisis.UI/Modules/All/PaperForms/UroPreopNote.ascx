<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.UroPreopNote" CodeFile="UroPreopNote.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


<div id="PaperFormStart">



<div align="left"  id="LastPageInForm" runat="server"  style="page-break-after: always;" >


<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U36*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>    <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br />
            Urology Preoperative Note<br />
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Surgeon: 
        <% =apptPhysicianName %>
        </span></td>
    </tr>
    <tr bgcolor="#ffffff"> 
      <td height="100" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">HPI</span><br/> 
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
              </asp:Repeater> <!-- <asp:Label ID="NVB_Left" Runat="server" /> <asp:Label ID="NVB_Right" Runat="server" /> -->            </td>
          </tr>
        </table>	  </td>
    </tr>
    <tr> 
      <td  class="FormOuterTableRow"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="40%" height="60" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Procedure Planned</span></td>
            <td width="60%" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Past Surgical History</span></td>
          </tr>
        </table>	  </td>
    </tr>
    <tr> 
      <td height="100" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Past Medical History</span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="70%" height="100" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Medications</span></td>
            <td width="30%" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Allergies</span></td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="20"><span class="blackBoldText">Preoperative Testing</span><img src="../../Images/shim.gif" border="0" width="200" height="1"><span class="blackBoldText">Date:</span> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td> 
			 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td style="width: 8%; text-align: center; height: 30px;" class="FormInsideTableTopCell"><strong>WBC</strong></td>
                  <td style="width: 17%;"  class="FormInsideTableTopCell">&nbsp;</td>
                  <td style="width: 8%; text-align: center;" class="FormInsideTableTopCell"><strong>Na</strong></td>
                  <td style="width: 17%;" class="FormInsideTableTopCell">&nbsp;</td>
                  <td style="width: 8%; text-align: center;" class="FormInsideTableTopCell"><strong>CO</strong></td>
                  <td style="width: 17%;" class="FormInsideTableTopCell">&nbsp;</td>
                  <td style="width: 8%; text-align: center;" class="FormInsideTableTopCell"><strong>Creat</strong></td>
                  <td style="width: 17%;" class="FormInsideTableTopCell">&nbsp;</td>
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
              </table>			 </td>
          </tr>
        </table>	  </td>
    </tr>
    <tr> 
      <td align="left" valign="middle" height="30" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><strong>Type and Cross:</strong></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="left" valign="top" height="50" width="50%" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">EKG</span></td>
            <td align="left" valign="top" width="50%"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Chest 
              X-Ray</span></td>
          </tr>
        </table>	  </td>
    </tr>
    <tr> 
      <td align="left" valign="top"  height="40" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">Medical 
        Consult</span></td>
    </tr>
    <tr> 
      <td height="30" valign="middle" align="left" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Informed 
        consent signed and in the medical records?<img src="../../Images/shim.gif" border="0" width="30" height="1"><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">Yes<img src="../../Images/shim.gif" border="0" width="30" height="1"><img src="../../Images/icon_checkBoxBlank.gif" align="absmiddle" width="18" height="14" alt="" border="0">No</span></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td colspan="2"><span class="blackBoldText">Signatures</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr>
            <td><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Prepared 
              By: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr>
            <td><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Fellow: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
                  <td>Patient understands all risks and benefits and agrees to 
                    proceed.<br/>
                                    <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20" /> MD 
                    / Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="40" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="22" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU32<img src="../../images/shim.gif" border="0" width="45" height="1">U36<img src="../../images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../images/shim.gif" border="0" width="45" height="8">rev:11/16/10
        <!--rev:9/17/04--><img src="../../images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">1</span><img src="../../images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">32</span></td>
    </tr>
  </table>
</div>

</div>
