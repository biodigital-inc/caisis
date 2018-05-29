<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.PaperForms.UroBladCystFU" CodeFile="UroBladCystFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>




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
		<div  class="VerticalBarCodeDocType">*U08*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Urology Cystectomy Follow-Up Patient</span><br>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: 
        <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td align="left" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">Referring&nbsp;M.D.: 
              <asp:Repeater ID="ReferringMD" runat="server" > 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "phFirstName") %>
                  <%# DataBinder.Eval(Container.DataItem, "phLastName") %>
                  ( 
                  <%# DataBinder.Eval(Container.DataItem, "phInstitution") %>
                  )</ItemTemplate>
                <SeparatorTemplate>, </SeparatorTemplate>
              </asp:Repeater> <asp:Label ID="blankReferrringMD" Runat="server"></asp:Label> 
            </td>
          </tr>
        </table>
		</td>
    </tr>
	<tr>
		<td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Diagnosis</span><img src="../../Images/shim.gif" border="0" width="20" height="1">Date: <asp:Label ID="DxDateLabel" Runat="server" /><img src="../../Images/shim.gif" border="0" width="50" height="1">
		2002 TNM Cystectomy Stage: <asp:Label ID="CystectomyStageLabel" Runat="server" /><img src="../../Images/shim.gif" border="0" width="60" height="1">Nodes: <asp:Label ID="CystectomyNodesLabel" Runat="server" /></td>
	</tr>
    <tr> 
      <td height="230" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">HPI</span> 
        <table cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="HPITextBladder" valign="top" width="*"> 
            <asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <span <%#  ((DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PATHPOSITIVE") > -1) || (DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PROCCYSTECTOMY") > -1) || (DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PATHCYSTECTOMY") > -1) || (DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PATHPROSTATECTOMY") > -1))  ? "style=\"font-weight:bold;\"" : "" %> ><%# DataBinder.Eval(Container.DataItem, "patientHPI") %></span><br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> 
            
<%--            <asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "patientHPI") %>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> --%>
              
              <%--<asp:Repeater ID="HpiProstatectomies" runat="server" OnItemDataBound="HpiProstatectomiesItemDataBound"> 
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                  </strong> on 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  <asp:Label ID="CaseSurgeonLabel" Runat="server">by 
                    <%# DataBinder.Eval(Container.DataItem, "ProcSurgeon") %>
                  </asp:Label>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Label ID="PreTxPot" Runat="server" /> <asp:Repeater ID="hpiProtocols" runat="server" OnItemDataBound="appendToHpiItemDataBound"> 
                <ItemTemplate> Protocol 
                  <%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %>
                  <%# DataBinder.Eval(Container.DataItem, "ProtocolNotes") %>
                  <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>
                  <br>
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
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> 
              
               <asp:Label ID="NVB_Left" Runat="server" /> <asp:Label ID="NVB_Right" Runat="server" /> --%>
            </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td align="left" valign="top" height="70" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Interval History</span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Early Complications</span>&nbsp;<span>(&lt;30 Days)</span>
	  	<table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="70" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
            <td width="350" align="center" valign="middle" class="FormInsideTableTopCell">Complaint</td>
            <td width="150" align="center" valign="middle" class="FormInsideTableTopCell">Relation</td>
            <td width="80" align="center" valign="middle" class="FormInsideTableTopCell">Data Source</td>
          </tr>
          <asp:Repeater ID="EarlyComplications" runat="server"> 
            <ItemTemplate> 
              <tr> 
                <td height="25" class="FormInsideTableLeftCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ToxDateText") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ToxName") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ToxRelatedTo") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ToxDataSource") %>
                  </strong></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Late Complications</span>&nbsp;<span>(&gt;30 Days)</span>
        <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="70" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
            <td width="350" align="center" valign="middle" class="FormInsideTableTopCell">Complaint</td>
            <td width="150" align="center" valign="middle" class="FormInsideTableTopCell">Relation</td>
            <td width="80" align="center" valign="middle" class="FormInsideTableTopCell">Date Source</td>
          </tr>
          <tr id="LateComplicationsUreteroentericRow" runat="server"> 
            <td height="25" class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell"><input type="checkbox" name="Films Reviewed2">Ureteroenteric Complication</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr id="LateComplicationsHerniaRow" runat="server"> 
            <td height="25" class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell"><input type="checkbox" name="Films Reviewed22">Abdominal Wall Hernia</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr id="LateComplicationsStomaRow" runat="server"> 
            <td height="25" class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell"><input type="checkbox" name="Films Reviewed222">Stoma</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <asp:Repeater ID="LateComplications" runat="server"> 
            <ItemTemplate> 
              <tr> 
                <td height="25" class="FormInsideTableLeftCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ToxDateText") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ToxName") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ToxRelatedTo") %>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ToxDataSource") %>
                  </strong></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
          <tr> 
            <td height="25" class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
<!--          <tr> 
            <td height="25" class="FormInsideTableLeftCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
-->        </table>
		</td>
    </tr>
    <tr> 
      <td align="center" class="FormOuterTableRow">
	  <table border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="left" valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Protocols</span> 
              <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="20%" align="center" class="FormInsideTableTopCell">Start Date</td>
                  <td width="20%" align="center" class="FormInsideTableTopCell">Protocol #</td>
                  <td width="40%" align="center" class="FormInsideTableTopCell">Treatment</td>
                  <td width="20%" align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>
                <tr> 
                  <td height="21" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="21" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table>
			 </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU04<img src="../../Images/shim.gif" border="0" width="45" height="8">U08<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U08*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Urology Cystectomy Follow-Up Patient</span><br>
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
      <td height="15" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow" style="border-bottom: none;"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">CT / MRI</span><img src="../../Images/shim.gif" border="0" width="25" height="1"><input type="checkbox" name="Films Reviewed">Films Reviewed
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td style="width: 12%;" height="18" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
            <td style="width: 12%;" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td style="width: 18%;" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td style="width: 58%;" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
	</table></td>
    </tr>
    <asp:Repeater ID="CtMri" runat="server"> 
    <ItemTemplate>
	<tr> 
      <td class="FormOuterTableRow" style="border-bottom: none;">
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr> 
                <td   style="width: 12%; height: 18px; vertical-align: top;" class="FormInsideTableLeftCell" align="center">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong></td>
                <td   style="width: 12%; vertical-align: top;" class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                  </strong></td>
                <td   style="width: 18%; vertical-align: top;" class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                  </strong></td>
                <td   style="width: 58%; vertical-align: top;" class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                  </strong></td>
              </tr>
	</table></td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
    <tr> 
      <td class="FormOuterTableRow"  style="border-bottom: none; border-top: solid 1px #000000;"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Other Images</span><img src="../../Images/shim.gif" border="0" width="12" height="1"><input type="checkbox" name="Films Reviewed">Films Reviewed
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td  style="width: 12%;"  height="18" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
            <td style="width: 12%;" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td style="width: 18%;" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td style="width: 58%;" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
	</table></td>
    </tr>
    <asp:Repeater ID="images" runat="server"> 
    <ItemTemplate> 
      <tr> 
      <td class="FormOuterTableRow"  style="border-bottom: none;">
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr> 
                <td  style="width: 12%; height: 18px; vertical-align: top;"  class="FormInsideTableLeftCell"  align="center">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong></td>
                <td  style="width: 12%; vertical-align: top;" class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                  </strong></td>
                <td  style="width: 18%; vertical-align: top;" class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                  </strong></td>
                <td  style="width: 58%; vertical-align: top;" class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                  </strong></td>
              </tr>
		</table></td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
    <tr> 
      <td class="FormOuterTableRow" style="border-top: solid 1px #000000;">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="4" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Cytology</span>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Reviewed with Radiologist2">Reviewed with Pathologist</td>
          </tr>
          <tr> 
            <td width="100" height="16" align="center" class="FormInsideTableRegCell">Date</td>
            <td width="150" align="center" class="FormInsideTableRegCell">Source</td>
            <td width="300" align="center" class="FormInsideTableRegCell">Results</td>
            <td width="100" align="center" class="FormInnerRowBottomBorder">Data Source</td>
          </tr>
          <asp:Repeater ID="Cytologies" runat="server"> 
            <ItemTemplate> 
              <tr> 
                <td height="16" class="FormInsideTableRegCell" align="center">
                &nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "PathDateText") %></strong>
                </td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "PathSpecimenCollection")%>
                  </strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "PathResult") %>
                  <%# DataBinder.Eval(Container.DataItem, "PathHistology") %>
                  </strong></td>
                <td class="FormInnerRowBottomBorder">&nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "PathDataSource") %>
                  </strong></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Lab Tests</span></td>
          </tr>
          <tr id="LabTestsTrendViewPopTableRow" runat="server">
            <td colspan="2" class="FormInnerRowBottomBorder"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="90" height="22" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <asp:Repeater ID="LabTestsTrendViewDates" runat="server">
                    <ItemTemplate>
                      <td width="80" height="12" class="FormInsideTableRegCell" align="center"><strong> <%# DataBinder.Eval(Container.DataItem, "LabDates") %> </strong></td>
                    </ItemTemplate>
                  </asp:Repeater>
                  <td width="90" align="left" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                </tr>
                <asp:Repeater ID="LabTestsTrendView" runat="server">
                  <ItemTemplate>
                    <tr>
                      <td align="center" class="FormInsideTableRegCell">&nbsp;<strong> <%# DataBinder.Eval(Container.DataItem, "[0]") %> </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> <%# DataBinder.Eval(Container.DataItem, "[1]") %> </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> <%# DataBinder.Eval(Container.DataItem, "[2]") %> </strong></td>
                      <td class="FormInsideTableRegCell" align="center">&nbsp;<strong> <%# DataBinder.Eval(Container.DataItem, "[3]") %> </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> <%# DataBinder.Eval(Container.DataItem, "[4]") %> </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> <%# DataBinder.Eval(Container.DataItem, "[5]") %> </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> <%# DataBinder.Eval(Container.DataItem, "[6]") %> </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;</td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
            </table></td>
          </tr>
          <tr id="LabTestsTrendViewBlankTableRow" runat="server">
            <td width="50%" class="FormInnerRowRightBorder"><table align="center" border="0" width="100%" cellpadding="2" cellspacing="0" >
                <tr>
                  <td class="FormInnerRowRightBorder">&nbsp;</td>
                  <td colspan="3" align="center" class="FormInsideTableRegCell"><strong>Results</strong></td>
                </tr>
                <tr>
                  <td width="17%" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <td width="28%" height="12" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="28%" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="27%" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
            </table></td>
            <td width="50%"><table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
                <tr>
                  <td class="FormInnerRowRightBorder">&nbsp;</td>
                  <td colspan="3" align="center" class="FormInnerRowBottomBorder"><strong>Results</strong></td>
                </tr>
                <tr>
                  <td width="17%" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <td width="28%" height="12" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="28%" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="27%" class="FormInnerRowBottomBorder"><strong>Date:</strong></td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" valign="top" ><img src="../../Images/shim.gif" border="0" width="4" height="16" /><span class="blackBoldText">Procedures: Biopsies / Endoscopies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="Reviewed with Radiologist22" />
              Reviewed with Pathologist
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr align="center"  >
                    <td width="15%" class="FormInsideTableTopCell">Date</td>
                    <td width="18%" class="FormInsideTableTopCell">Procedure</td>
                    <td width="43%" class="FormInsideTableTopCell">Results</td>
                    <td width="11%" class="FormInsideTableTopCell">Cytology</td>
                    <td width="13%" class="FormInsideTableTopCell">Data Source</td>
                  </tr>
                  <tr >
                    <td height="23" class="FormInsideTableRegCell">&nbsp;</td>
                    <td class="FormInsideTableRegCell">&nbsp;</td>
                    <td class="FormInsideTableRegCell">&nbsp;</td>
                    <td class="FormInsideTableRegCell">&nbsp;</td>
                    <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
              </table></td>
          </tr>
      </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU04<img src="../../Images/shim.gif" border="0" width="45" height="8">U08<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U08*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Urology Cystectomy Follow-Up Patient</span><br>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Neobladder</span></td>
          </tr>
          <tr> 
            <td height="30" class="FormInnerRowBottomBorder">
				<table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="22%">&nbsp;</td>
                  <td width="14%" align="center">Daytime</td>
                  <td width="14%" align="center">Nighttime</td>
                  <td width="50%" rowspan="4" valign="top" class="smallGrayText">&nbsp;&nbsp;&nbsp;&nbsp;1 
                    - Continence (no pads)<br> &nbsp;&nbsp;&nbsp;&nbsp;2 - Mild 
                    SUI (leaks only during heavy actvty)<br> &nbsp;&nbsp;&nbsp;&nbsp;3 
                    - Moderate SUI (leaks with moderate actvty)<br> &nbsp;&nbsp;&nbsp;&nbsp;4 
                    - Severe SUI (leaks during nl actvty, dry at night and at 
                    rest)<br> &nbsp;&nbsp;&nbsp;&nbsp;5 - Total incont (continuous 
                    leakage of urine at rest)</td>
                </tr>
                <tr> 
                  <td align="right">Continence (see codes on right)&nbsp;&nbsp;</td>
                  <td class="FormInsideTableTopLeftCell">&nbsp;</td>
                  <td class="FormInsideTableTopCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="right">Date Mild Continence Achieved&nbsp;&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="right">Date Total Continence Achieved&nbsp;&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table>
              <br>
              Treatment of Incontinence: _____________________<img src="../../Images/shim.gif" border="0" width="60" height="1">Tx Date: __________________<br />
			  Treatment for Bladder Neck Contracture: <img src="../../Images/shim.gif" border="0" width="11" height="1"><input type="checkbox" name="No3222324">Yes<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<img src="../../Images/shim.gif" border="0" width="34" height="1">Tx Date: __________________<br /></td>
          </tr>
          <tr> 
            <td height="25" class="FormInnerRowBottomBorder">Need for Intermittent 
              Cath:<img src="../../Images/shim.gif" border="0" width="10" height="8"> 
              <input type="checkbox" name="No3222">
              No<img src="../../Images/shim.gif" border="0" width="10" height="8"> 
              <input type="checkbox" name="Yes3222">
              Yes<img src="../../Images/shim.gif" border="0" width="20" height="8">Date: 
              __________________ <img src="../../Images/shim.gif" border="0" width="20" height="8">Frequency 
              of Cath: _______ times / day</td>
          </tr>
          <tr> 
            <td height="25" class="FormInnerRowBottomBorder">Nocturia:<img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="No32222">
              No<img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="Yes32222">
              Yes<img src="../../Images/shim.gif" border="0" width="25" height="8">#:_______<img src="../../Images/shim.gif" border="0" width="60" height="1">Pads:<img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="No322222">
              No<img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="Yes322222">
              Yes<img src="../../Images/shim.gif" border="0" width="25" height="1">#:_________</td>
          </tr>
          <tr> 
            <td height="30" class="FormInnerRowBottomBorder"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td width="33%" valign="top" class="FormInnerRowRightBorder"><strong>Current 
                    Erectile Function:</strong>&nbsp; <input type="text" name="textfield2222" class="inputFieldFlat" size="5" style="border: solid 1px #666666"> 
                    <span class="smallGrayText"> <br>
                    1-Normal, full erections <br>
                    2-Full, but recently diminished <br>
                    3-Partial, satis. for intercourse <br>
                    4-Partial, unsatis. for intercourse <br>
                    5-Impotent</span> </td>
                  <td width="27%" valign="top" class="FormInnerRowRightBorder"><strong>% 
                    Best Erection:</strong><br /><br />
                    No Medications: ______<br /><br />
                    Oral PDE-5 Drugs: ______</td>
                  <td width="40%" valign="top"><strong>Sexual Function Survey</strong><br> 
                    <img src="../../Images/shim.gif" border="0" width="1" height="15">Q4: 
                    <asp:Label ID="ShortSexualQOLQ4" CssClass="blackBoldText" Runat="server" >______</asp:Label> 
                    &nbsp;&nbsp;&nbsp;&nbsp;Q5: 
                    <asp:Label ID="ShortSexualQOLQ5" CssClass="blackBoldText" Runat="server" >______</asp:Label> 
                    <br>
                    Total MSK03 Sexual QOL Score: 
                    <asp:Label ID="ShortSexualQOLTotal" CssClass="blackBoldText" Runat="server" >______</asp:Label>
                    / 12<br><asp:Label ID="LastSexualQOLScores" Runat="server" /><br> <span class="smallGrayText">(Fill in scores 
                    above from questions 4 &amp; 5 of <br>
                    Urinary &amp; Sexual Function Questionnaire)</span></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table class="pageWidth" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Continent Cutaneous Diversions</span></td>
          </tr>
          <tr> 
            <td height="24" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1">Cath Interval: _________ hrs</td>
          </tr>
          <tr valign="top"> 
            <td height="24" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1">Continence (circle one):
			<img src="../../Images/shim.gif" border="0" width="30" height="1">Complete
			<img src="../../Images/shim.gif" border="0" width="40" height="1">Leakage
			<img src="../../Images/shim.gif" border="0" width="40" height="1">Constant<br> 
            <img src="../../Images/shim.gif" border="0" width="30" height="4"><br>
			<img src="../../Images/shim.gif" border="0" width="4" height="1">Within:<img src="../../Images/shim.gif" border="0" width="20" height="1">
			1h<img src="../../Images/shim.gif" border="0" width="20" height="1">
			2h<img src="../../Images/shim.gif" border="0" width="20" height="1">
			4h<img src="../../Images/shim.gif" border="0" width="20" height="1">
			6h<img src="../../Images/shim.gif" border="0" width="60" height="1">
			# of pads:_________</td>
          </tr>
          <tr> 
            <td height="24" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1">Cath Size:
			<img src="../../Images/shim.gif" border="0" width="20" height="1">12 F
			<img src="../../Images/shim.gif" border="0" width="30" height="1">14 F
			<img src="../../Images/shim.gif" border="0" width="30" height="1">16 F
			<img src="../../Images/shim.gif" border="0" width="30" height="8">18 F
			<img src="../../Images/shim.gif" border="0" width="30" height="1">&gt;20 F</td>
          </tr>
          <tr valign="top"> 
            <td height="24" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1">Ease of catheterization:
			<img src="../../Images/shim.gif" border="0" width="20" height="1">no difficulty
			<img src="../../Images/shim.gif" border="0" width="30" height="1">&lt;1 /week
			<img src="../../Images/shim.gif" border="0" width="30" height="1">1 /day<br>
			<img src="../../Images/shim.gif" border="0" width="130" height="1"><input type="checkbox" name="No322232">unchanged
			<img src="../../Images/shim.gif" border="0" width="20" height="1"><input type="checkbox" name="Yes322232">worse
			<img src="../../Images/shim.gif" border="0" width="20" height="1"><input type="checkbox" name="Yes3222322">improved</td>
          </tr>
<!--      <tr> 
            <td valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1">Stoma:
			<img src="../../Images/shim.gif" border="0" width="20" height="1">Pink and Viable
			<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
			<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No
			<img src="../../Images/shim.gif" border="0" width="15" height="1">Stoma Type: ___________________________<br>
			<img src="../../Images/shim.gif" border="0" width="4" height="1">Peristomal Hernia
			<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
			<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No
			<img src="../../Images/shim.gif" border="0" width="20" height="1">Stomal Stenosis
			<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
			<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
			<img src="../../Images/shim.gif" border="0" width="4" height="1">Leakage with Appliance
			<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
			<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No
			<img src="../../Images/shim.gif" border="0" width="20" height="1">Anastamosis Type: ___________________________</td>
          </tr>-->          
		  <tr valign="top"> 
            <td height="30" class="FormInnerRowBottomBorder">Complications<br> 
              <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="24%" align="center" class="FormInsideTableTopLeftCell">Stoma</td>
                  <td width="4%" align="center" class="FormInsideTableTopCell">No</td>
                  <td width="4%" align="center" class="FormInsideTableTopCell">Yes</td>
                  <td width="14%" align="center" class="FormInsideTableTopCell">Date</td>
                  <td width="8%">&nbsp;</td>
                  <td width="24%" align="center" class="FormInsideTableTopLeftCell">Pouch</td>
                  <td width="4%" align="center" class="FormInsideTableTopCell">No</td>
                  <td width="4%" align="center" class="FormInsideTableTopCell">Yes</td>
                  <td width="14%" align="center" class="FormInsideTableTopCell">Date</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table>
			 </td>
          </tr>
          <tr valign="top"> 
            <td width="625" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1">Required Revisions:
			<img src="../../Images/shim.gif" border="0" width="20" height="1"><input type="checkbox" name="No322223">No
			<img src="../../Images/shim.gif" border="0" width="20" height="1"><input type="checkbox" name="Yes322223">Yes
			<img src="../../Images/shim.gif" border="0" width="60" height="1">Revision Date: __________________<br>
			<img src="../../Images/shim.gif" border="0" width="4" height="1">revision type (circle one):
			<img src="../../Images/shim.gif" border="0" width="20" height="1">stomal stenosis
			<img src="../../Images/shim.gif" border="0" width="30" height="1">limb revision
			<img src="../../Images/shim.gif" border="0" width="30" height="1">pouch</td>
          </tr>
        </table>
		</td>
    </tr>
<!-- <tr> 
      <td class="FormOuterTableRow">
	  <table width="650" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td class="FormInsideTableTopLeftCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Ileal Conduit Diversion</span></td>
            <td class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Ureteral Anastamosis</span></td>
		  </tr>
          <tr> 
            <td width="50%" valign="top" class="FormInsideTableLeftCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><strong>Conduit Stoma</strong>:<br />
				<img src="../../Images/shim.gif" border="0" width="4" height="1">Pink and Viable
				<img src="../../Images/shim.gif" border="0" width="11" height="1"><input type="checkbox" name="No3222324">Yes
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
				<img src="../../Images/shim.gif" border="0" width="4" height="1">Stoma Type:
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Turnbull
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">Rosebud<br /><br />
				<img src="../../Images/shim.gif" border="0" width="4" height="1">Stomal Stenosis
				<img src="../../Images/shim.gif" border="0" width="7" height="1"><input type="checkbox" name="No3222324">Yes
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
				<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="10" height="1">Required Revision
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No
				<img src="../../Images/shim.gif" border="0" width="8" height="1">Date: ___________</span><br /><br />
				<img src="../../Images/shim.gif" border="0" width="4" height="1">Peristomal Hernia
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
				<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="10" height="1">Required Revision
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No
				<img src="../../Images/shim.gif" border="0" width="8" height="1">Date: ___________</span></td>
            <td width="50%" valign="top" class="FormInsideTableRegCell">
				<img src="../../Images/shim.gif" border="0" width="4" height="1">Hydronephrosis
				<img src="../../Images/shim.gif" border="0" width="9" height="1"><input type="checkbox" name="No3222324">Yes
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
				<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="10" height="1">Date: ___________
				<img src="../../Images/shim.gif" border="0" width="2" height="1">Side:
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Left
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Right
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">Bilateral</span><br />
				<img src="../../Images/shim.gif" border="0" width="4" height="1">Ureteral Stenosis
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
				<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="10" height="1">Date: ___________
				<img src="../../Images/shim.gif" border="0" width="2" height="1">Side:
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Left
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Right
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">Bilateral</span><br />
				<img src="../../Images/shim.gif" border="0" width="4" height="1">Upper Tract Recurrence
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
				<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="10" height="1">Date: ___________
				<img src="../../Images/shim.gif" border="0" width="2" height="1">Side:
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Left
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Right
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">Bilateral</span><br />
				<img src="../../Images/shim.gif" border="0" width="4" height="1">Required Revision or AI Procedure
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
				<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="10" height="1">Date: ___________
				<img src="../../Images/shim.gif" border="0" width="2" height="1">Side:
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Left
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Right
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">Bilateral</span></td>
          </tr>
        </table>
		</td>
    </tr>-->
	<tr>
		<td class="FormOuterTableRow">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="100%" colspan="3" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Ileal Conduit Diversion</span></td>
				</tr>
				<tr>
					<td width="30%" class="FormInsideTableLeftCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span><strong>Conduit Stoma:</strong></span>
						<br /><img src="../../Images/shim.gif" border="0" width="4" height="1">Pink and Viable
						<img src="../../Images/shim.gif" border="0" width="11" height="1"><input type="checkbox" name="No3222324">Yes
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
						<img src="../../Images/shim.gif" border="0" width="4" height="1">Stoma Type:<br />
						<img src="../../Images/shim.gif" border="0" width="1" height="1"><input type="checkbox" name="No3222324">Turnbull
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">Rosebud</td>
					<td width="35%" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Stomal Stenosis
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
						<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Required Revision
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
						<img src="../../Images/shim.gif" border="0" width="4" height="1">Date: ___________</span></td>
					<td width="35%" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Peristomal Hernia
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
						<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Required Revision
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
						<img src="../../Images/shim.gif" border="0" width="4" height="1">Date: ___________</span></td>
				</tr>
				<tr> 
					<td width="100%" colspan="3" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span><strong>Appliance</strong></span>:<br />
					<img src="../../Images/shim.gif" border="0" width="4" height="1"><input type="checkbox" name="No322223">No Problems or Leakage
					<img src="../../Images/shim.gif" border="0" width="4" height="1"># Days Between Plate Changes: _____
					<img src="../../Images/shim.gif" border="0" width="4" height="1"><input type="checkbox" name="No322223">Uses Abdominal Binder
					<img src="../../Images/shim.gif" border="0" width="4" height="1"><input type="checkbox" name="No322223">Uses Appliance Belt</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="FormOuterTableRow">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="100%" colspan="3" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Ureteral Anastamosis</span></td>
				</tr>
				<tr>
					<td width="50%" class="FormInsideTableLeftCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Hydronephrosis
						<img src="../../Images/shim.gif" border="0" width="9" height="1"><input type="checkbox" name="No3222324">Yes
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
						<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Date: ___________
						<img src="../../Images/shim.gif" border="0" width="4" height="1">Side:
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Left
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Right
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">Bilateral</span></td>
					<td width="50%" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Ureteral Stenosis
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
						<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Date: ___________
						<img src="../../Images/shim.gif" border="0" width="4" height="1">Side:
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Left
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Right
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">Bilateral</span></td>
				</tr>
				<tr>
					<td width="50%" class="FormInsideTableLeftCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Upper Tract Recurrence
						<img src="../../Images/shim.gif" border="0" width="9" height="1"><input type="checkbox" name="No3222324">Yes
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
						<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Date: ___________
						<img src="../../Images/shim.gif" border="0" width="4" height="1">Side:
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Left
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Right
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">Bilateral</span></td>
					<td width="50%" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Required Revision or AI Procedure
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No<br />
						<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Date: ___________
						<img src="../../Images/shim.gif" border="0" width="4" height="1">Side:
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Left
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Right
						<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">Bilateral</span></td>
				</tr>	
			</table>
		</td>
	</tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU04<img src="../../Images/shim.gif" border="0" width="45" height="8">U08<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U08*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Urology Cystectomy Follow-Up Patient</span><br>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td > 
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="16"><span class="blackBoldText"></span>Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">
                    NKA&nbsp;&nbsp; 
                    <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes">
                    Unchanged Since Last Visit</span></td>
                </tr>
                <tr align="center"> 
                  <td width="40%" class="FormInsideTableRegCell">Allergen</td>
                  <td class="FormInnerRowBottomBorder">Reaction</td>
                </tr>
                <asp:Repeater ID="allergies" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td class="FormInsideTableRegCell">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "Allergen") %>
                        </strong></td>
                      <td class="FormInnerRowBottomBorder">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %>
                        </strong></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table>			  </td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td height="55" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Medical History / Comorbidities</span><br> <asp:Repeater ID="comorbidities" runat="server"> 
          <ItemTemplate> &nbsp; 
            <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
            - <strong> 
            <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>
            </strong> </ItemTemplate>
          <SeparatorTemplate>;&nbsp;&nbsp;&nbsp;&nbsp;</SeparatorTemplate>
        </asp:Repeater> </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Review of Systems</span>
		&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Review:
        <input type="checkbox" name="NP222" value="Yes" />
NP / PA&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="Fellow22" value="Yes" />
Fellow&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="Attending22" value="Yes" />
Attending</span>
		<table border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr> 
            <td width="10%" align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td width="20%" align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td width="5%" align="center" class="FormInsideTableTopCell"><strong>Not Present</strong></td>
            <td width="5%" align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
            <td width="10%" align="center" class="FormInsideTableTopCell"><strong>Disease Related</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">General</td>
            <td align="left" class="FormInsideTableRegCell">Fever</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Neuro</td>
            <td align="left" class="FormInsideTableRegCell">Headaches</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Focal Weakness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Eyes</td>
            <td align="left" class="FormInsideTableRegCell">Visual Problems</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">CV</td>
            <td align="left" class="FormInsideTableRegCell">Angina</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Palpitations</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Resp</td>
            <td align="left" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Shortness of Breath</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hemoptysis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">GI</td>
            <td align="left" class="FormInsideTableRegCell">Nausea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="4" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Abdominal Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Rectal Bleeding</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">GU</td>
            <td align="left" class="FormInsideTableRegCell">Urine Leakage</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" valign="top" align="left" class="FormInsideTableRegCell">
				<span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Recent UTI
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222324">Yes
				<img src="../../Images/shim.gif" border="0" width="2" height="1"><input type="checkbox" name="No3222323">No
				<img src="../../Images/shim.gif" border="0" width="8" height="1">Date: ___________</span></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Flank Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">MS</td>
            <td align="left" class="FormInsideTableRegCell">Joint Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Psych</td>
            <td align="left" class="FormInsideTableRegCell">Anxiety / Depression</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Heme</td>
            <td align="left" class="FormInsideTableRegCell">Fatigue</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td align="left" class="FormInsideTableRegCell">Rash</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Endo</td>
            <td align="left" class="FormInsideTableRegCell">Heat/Cold Intolerance</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Thirst</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hot Flashes</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Other</td>
            <td align="left" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="35" class="FormOuterTableRow">&nbsp;
          <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes" />
          <span class="blackBoldText"> PFSH and ROS performed by:  ___________________________<img src="../../Images/shim.gif" border="0" width="10" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="10" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU04<img src="../../Images/shim.gif" border="0" width="45" height="8">U08<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U08*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Urology Cystectomy Follow-Up Patient</span><br>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital 
              Signs</span></td>
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
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Exam</span><span class="smallGrayText">&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="NP22" value="Yes">
        NP / PA</span><br> 
        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="80" align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
              Findings</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Attnd Performed</strong></td>
            <td width="265" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Gen</td>
            <td width="220" align="left" class="FormInnerRowBottomBorder"> Well 
              Developed / Well Nourished</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span>No Acute Distress</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span>Alert &amp; Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">ENT</td>
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span>Mucous Membranes Moist</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell"> 
              EYES</td>
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span>No Scleral Icterus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> EOMI</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> PERRL</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Head 
              &amp; Neck</td>
            <td align="left" class="FormInnerRowBottomBorder">Neck Supple and 
              Mobile</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Carotid Bruits</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">Nodes</td>
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span> Cervical</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span> Supraclavicular</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span> Axillary</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span> Inguinal</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Respiratory</td>
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span>Clear to Percussion and Auscultation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">CV</td>
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span>Regular Rate and Rhythm</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span> No Murmurs</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableLeftCell">Abdomen</td>
            <td align="left" class="FormInnerRowBottomBorder"> Soft Non-Tender</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span> Normal Bowel Sounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span> No Hepatosplenomegaly</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span>No Masses or Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"><span class="smallGrayText"> 
              </span> No Hernias</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">Stomal</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Rash</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Stenosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Hernia </td>
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
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No CVA Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Rectal</td>
            <td align="left" class="FormInnerRowBottomBorder">Normal Rectal Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Gross Blood</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="6" align="left" valign="top" class="FormInsideTableLeftCell">GU</td>
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
            <td align="left" class="FormInnerRowBottomBorder">Testes Without Tenderness 
              or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" valign="top" class="FormInsideTableRegCell"><br>
              PVR _________</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Urethral Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Pelvic Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Vaginal 
              Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">M/S</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Clubbing or 
              Cyanosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Leg Swelling 
              / Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Neuro</td>
            <td align="left" class="FormInnerRowBottomBorder"> Normal Motor Function 
            </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Sensation 
            </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Rash or Ulcers</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Nodules</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Other</td>
            <td align="left" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU04<img src="../../Images/shim.gif" border="0" width="45" height="8">U08<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U08*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Urology Cystectomy Follow-Up Patient</span><br>            </td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td height="50" class="FormOuterTableRow"> 
        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td colspan="8" valign="middle"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Disease State</span>
			<img src="../../Images/shim.gif" border="0" width="15" height="1"><input type="checkbox" name="NED2">No Recurrence
			  <img src="../../Images/shim.gif" border="0" width="15" height="8"><input type="checkbox" name="LCR">Local Recurrence (Pelvic)
			  <img src="../../Images/shim.gif" border="0" width="15" height="8"><input type="checkbox" name="NED">Distant Mets&nbsp;&nbsp;Sites:_________________________<br>
              <img src="../../Images/shim.gif" border="0" width="107" height="22">Urethelial Recurrence: &nbsp;&nbsp;
			  	<input type="checkbox" name="BCR3">Uppertract &nbsp;&nbsp; 
              	<input type="checkbox" name="BCR22">Urethral
				<img src="../../Images/shim.gif" border="0" width="15" height="8"><strong>Date:</strong>________________</td>
          </tr>
        </table>
        <img src="../../Images/shim.gif" border="0" width="105" height="1"> <asp:Label ID="LastStatus" Runat="server" /></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="3" class="blackBoldText">Impression &amp; Plan </td>
          </tr>
          <tr> 
            <td width="309" align="center" class="FormInsideTableTopCell"><strong>Diagnoses 
              / Problem List</strong></td>
            <td width="32" align="center" class="FormInsideTableTopCell"><strong>New</strong></td>
            <td width="309" align="center" class="FormInsideTableTopCell"><strong>Plan 
              &amp; Referrals</strong></td>
          </tr>
          <tr> 
            <td height="55" valign="top" class="FormInsideTableRegCell">1.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"> 
              <input name="diagnosisNew1" type="checkbox" id="diagnosisNew1"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="55" valign="top" class="FormInsideTableRegCell">2.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew22" type="checkbox" id="diagnosisNew22"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="55" valign="top" class="FormInsideTableRegCell">3.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew2" type="checkbox" id="diagnosisNew2"></td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="55" valign="top" class="FormInnerRowRightBorder">4.</td>
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
      <td height="60" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Attending Addendum / Comments</span></td>
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
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Disposition</span></td>
          </tr>
          <tr> 
            <td width="69%" align="center" class="FormInnerRowRightBorder"> <table width="98%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="23%" height="18">Prescriptions:</td>
                  <td width="18%" align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1">Yes:</td>
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
            <td width="31%" align="center"> <span>Protocol #: ________</span> 
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
      <td valign="top" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td width="50%" valign="top" class="FormInnerRowRightBorder"><input type="checkbox" name="50% of Time22" />
              &#8805; 50% of attending time was spent in counseling <br />
              <img src="../../Images/shim.gif" border="0" width="1" height="15" /> If so, mark total attending time in minutes &amp; describe on right:<br />
              <img src="../../Images/shim.gif" border="0" width="30" height="12" />
              <input type="checkbox" name="15-24 (3)22" />
              15-24 (3)&nbsp;&nbsp;&nbsp;
              <input type="checkbox" name="25-39 (4)22" />
              25-39 (4)&nbsp;&nbsp;&nbsp;
              <input type="checkbox" name="40+ (5)22" />
              40+ (5)</td>
            <td width="50%" height="100" valign="top"><img src="../../Images/shim.gif" border="0" width="1" height="11" />Describe 
              Counseling or Dictate Note:<br /></td>
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
                  <td>I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                      <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
                <tr>
                  <td align="center"><span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU04<img src="../../Images/shim.gif" border="0" width="45" height="8">U08<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">6</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>


</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>