<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.PaperForms.UroBladFU_rev2" CodeFile="UroBladFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>



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
		<div  class="VerticalBarCodeDocType">*U09*</div>
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
              Urology Bladder Endoscopy<br/>Follow-Up Patient</span><br/>            </td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
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
              </asp:Repeater> <asp:Label ID="blankReferrringMD" Runat="server"></asp:Label>            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="35" valign="top" class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Chief Complaint</span></td>
    </tr>
	<tr>
		<td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Diagnosis</span><img src="../../Images/shim.gif" border="0" width="20" height="1">Date:<img src="../../Images/shim.gif" border="0" width="120" height="1">2002 TNM Stage:</td>
	</tr>
    <tr> 
      <td height="385" valign="top" class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">HPI</span><br/> 
        <table cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="HPITextBladder" valign="top" width="*"> <asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <span <%#  ((DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PATHPOSITIVE") > -1) || (DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PROCCYSTECTOMY") > -1) || (DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PATHCYSTECTOMY") > -1) || (DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PATHPROSTATECTOMY") > -1))  ? "style=\"font-weight:bold;\"" : "" %> ><%# DataBinder.Eval(Container.DataItem, "patientHPI") %></span><br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> 
              <%--
              <asp:Repeater ID="HpiProstatectomies" runat="server" OnItemDataBound="HpiProstatectomiesItemDataBound"> 
                <ItemTemplate> <strong>
                  <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                  </strong> on 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  <asp:Label ID="CaseSurgeonLabel" Runat="server">by 
                    <%# DataBinder.Eval(Container.DataItem, "procSurgeon") %>
                  </asp:Label>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Label ID="PreTxPot" Runat="server" />
               --%> 
               <%--<asp:Repeater ID="hpiProtocols" runat="server" OnItemDataBound="appendToHpiItemDataBound"> 
                <ItemTemplate> Protocol 
                  <%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %>
                  <%# DataBinder.Eval(Container.DataItem, "ProtocolNotes") %>
                  <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> --%>
              <%--
              <asp:Label ID="NVB_Left" Runat="server" />
              <asp:Label ID="NVB_Right" Runat="server" />
              --%>              </td>
          </tr>
        </table>      </td>
    </tr>
<!--Please note: need to add repeaters from below if reusing this commented section-->
<!--<tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="60%%" height="90" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Interval History</span><br/><img src="../../Images/shim.gif" border="0" width="260" height="1"></td>
            <td width="40%" align="left" valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Protocols</span> 
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
                <tr> 
                  <td height="21" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table>
		</td>
    </tr>-->
    <tr> 
      <td align="left" valign="top" height="110" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Interval History</span></td>
    </tr>
<!--<tr> 
		<td align="left" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Late Complications</span>&nbsp;&nbsp;
		<input type="checkbox" name="No">No&nbsp;&nbsp;
		<input type="checkbox" id="ComplicationsCheckbox" runat="server" NAME="ComplicationsCheckbox"/>Yes (specify): &nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Repeater ID="complications" runat="server"> 
			<ItemTemplate> <strong>
			  <%--<%# DataBinder.Eval(Container.DataItem, "ToxDateText") %>--%>
			  </strong> &nbsp;-&nbsp; <strong>
			  <%--<%# DataBinder.Eval(Container.DataItem, "ToxName") %>--%>
			  </strong> </ItemTemplate>
			<SeparatorTemplate>;&nbsp;&nbsp;&nbsp; </SeparatorTemplate>
		  </asp:Repeater> </td>
	</tr>-->
    <tr>
      <td class="FormOuterTableRow"><table border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr align="left">
            <td colspan="5" valign="middle"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Current Symptoms</span></td>
          </tr>
          <tr>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">System</td>
            <td width="17%" align="center" valign="middle" class="FormInsideTableTopCell">Symptom</td>
            <td width="8%" align="center" valign="middle" class="FormInsideTableTopCell">Current</td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">Onset Date</td>
            <td width="53%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <tr>
            <td rowspan="10" align="center" valign="top" class="FormInsideTableRegCell">GU</td>
            <td height="24" class="FormInsideTableRegCell">Dysuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">Nocturia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">Obstructive Symp*</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">Flank Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">Sexual Symptoms</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">Groin Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">Urgency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td rowspan="2" align="center" valign="top" class="FormInsideTableRegCell">Gen</td>
            <td height="24" class="FormInsideTableRegCell">Chills / Fever</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" class="FormInsideTableRegCell">M/S</td>
            <td height="24" class="FormInsideTableRegCell">Bone Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" class="FormInsideTableRegCell">C/V</td>
            <td height="24" class="FormInsideTableRegCell">Peripheral Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td rowspan="3" align="center" valign="top" class="FormInsideTableRegCell">Other</td>
            <td height="24" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr>
            <td height="24" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          
        </table>
          <span>&nbsp;*hesitancy, intermittance, weak stream, dribbling</span></td>
      </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU05<img src="../../Images/shim.gif" border="0" width="45" height="1">U09<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/05/14<img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U09*</div>
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
              Urology Bladder Endoscopy<br/>Follow-Up Patient</span><br/>            </td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
<!--    <tr> 
      <td class="FormOuterTableRow">
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="left" valign="top" ><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Procedures: Biopsies / Endoscopies</span><br/>
			  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr align="center"> 
                  <td width="60" class="FormInsideTableTopCell">Date</td>
                  <td width="120" class="FormInsideTableTopCell">Procedure</td>
                  <td width="350" class="FormInsideTableTopCell">Findings</td>
                  <td width="60" class="FormInsideTableTopCell">Cytology</td>
                  <td width="60" class="FormInsideTableTopCell">Source</td>
                </tr>
                <tr> 
                  <td height="20" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="20" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
              </table>
			  </td>
          </tr>
        </table>
		</td>
    </tr>
-->    
    <tr> 
      <td class="FormOuterTableRow">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="left" valign="top"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Intravesical Therapies</span>
				<table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="100" align="center" class="FormInsideTableTopCell">Start Date</td>
                  <td width="200" align="center" class="FormInsideTableTopCell">Agent</td>
                  <td width="350" align="center" class="FormInsideTableTopCell">Notes</td>
                </tr>
                <asp:Repeater ID="IntravesicalTx" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td height="28" class="FormInsideTableRegCell">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>
                        </strong></td>
                      <td class="FormInsideTableRegCell">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>
                        </strong></td>
                      <td class="FormInnerRowBottomBorder">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "MedTxNotes") %>
                        </strong></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="left" valign="top"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="16">Systemic Therapies</span>
            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="100" align="center" class="FormInsideTableTopCell">Start Date</td>
                  <td width="200" align="center" class="FormInsideTableTopCell">Agent<br/></td>
                  <td width="350" align="center" class="FormInsideTableTopCell">Notes</td>
                </tr>
                <asp:Repeater ID="SystemicTx" runat="server"> 
                  <ItemTemplate> 
                    <tr > 
                      <td height="28" class="FormInsideTableRegCell">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>
                        </strong></td>
                      <td class="FormInsideTableRegCell" style="padding-left:3px;"><strong>
                        <%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>
                        </strong>&nbsp;</td>
                      <td class="FormInnerRowBottomBorder">&nbsp;<strong>
                        <%# DataBinder.Eval(Container.DataItem, "MedTxNotes") %>
                        </strong></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table>             </td>
          </tr>
        </table>       </td>
    </tr>
    <tr> 
      <td align="left" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Radiation Therapies</span><br/> 
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr align="center"  class="eFormInnerTableRow"> 
            <td width="70" class="FormInsideTableTopCell">Start Date</td>
            <td width="70" class="FormInsideTableTopCell">Stop Date</td>
            <td width="230" class="FormInsideTableTopCell">Location</td>
            <td width="70" class="FormInsideTableTopCell">Total Dosage</td>
            <td width="210" class="FormInsideTableTopCell">Findings</td>
          </tr>
          <asp:Repeater ID="XRT" runat="server"> 
            <ItemTemplate> 
              <tr> 
                <td height="28" class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText") %></strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxType") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %></strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %></strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "RadTxNotes") %></strong></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table>		</td>
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
                <asp:Repeater ID="hpiProtocols" runat="server" > 
                <ItemTemplate>
                  <tr> 
                  <td height="28" class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtProtocolStatusDateText")%></td>
                  <td class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %>&nbsp;</td>
                  <td class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "ProtocolNotes") %>&nbsp;</td>
                  <td  class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                </ItemTemplate>
              </asp:Repeater>
                <tr> 
                  <td height="28" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td  class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="28" class="FormInsideTableRegCell">&nbsp;</td>
                  <td  class="FormInsideTableRegCell">&nbsp;</td>
                  <td  class="FormInsideTableRegCell">&nbsp;</td>
                  <td  class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>		</td>
    </tr>

<tr> 
      <td class="FormOuterTableRow">
	  <table border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="4" class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Cytology</span>&nbsp;&nbsp;&nbsp;&nbsp; 
             <input type="checkbox" name="Reviewed with Radiologist2">Reviewed with Pathologist</td>
          </tr>
          <tr> 
            <td width="100" height="20" align="center" class="FormInsideTableRegCell">Date</td>
            <td width="150" align="center" class="FormInsideTableRegCell">Source</td>
            <td width="300" align="center" class="FormInsideTableRegCell">Results</td>
            <td width="100" align="center" class="FormInnerRowBottomBorder">Data Source </td>
          </tr>
          <asp:Repeater ID="Cytologies" runat="server"> 
            <ItemTemplate> 
              <tr> 
                <td height="28" class="FormInsideTableRegCell" align="center">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "PathDateText") %></strong></td>
                <td  class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "PathSpecimenCollection")%></strong></td>
                <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "PathResult") %> <%# DataBinder.Eval(Container.DataItem, "PathHistology") %></strong></td>
                <td class="FormInnerRowBottomBorder">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "PathDataSource") %></strong></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table>		</td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow" style="border-bottom: none;"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Imaging</span>
	  <img src="../../Images/shim.gif" border="0" width="12" height="1"><input type="checkbox" name="Films Reviewed">Films Reviewed<br/>
        <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td align="center" valign="middle" class="FormInsideTableTopCell" style="width: 15%;">Date</td>
            <td width="200" align="center" valign="middle" class="FormInsideTableTopCell" style="width: 30%;">Study</td>
            <td width="350" align="center" valign="middle" class="FormInsideTableTopCell" style="width: 55%;">Results</td>
          </tr>
		  </table>		</td>
    </tr>
    <asp:Repeater ID="images" runat="server"> 
    <ItemTemplate>
	<tr> 
      <td class="FormOuterTableRow" style="border-bottom: none;">
	  <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
              <tr> 
                <td  align="center" class="FormInsideTableRegCell" style="width: 15%; height: 28px; vertical-align: top;">&nbsp;
				<strong><%# DataBinder.Eval(Container.DataItem, "DxDateText") %></strong></td>
                <td class="FormInsideTableRegCell" style="width: 30%; vertical-align: top;">&nbsp;
				<strong><%# DataBinder.Eval(Container.DataItem, "DxType") %></strong></td>
                <td class="FormInsideTableRegCell" style="width: 55%; vertical-align: top;">&nbsp;
				<strong><%# DataBinder.Eval(Container.DataItem, "DxResult") %></strong>&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
              </tr>
			  </table>		</td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
    <tr> 
      <td valign="top" class="FormOuterTableRow" style="border-top: solid 1px #000000;;">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="50%"> 
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">NKA&nbsp;&nbsp;</td>
                </tr>
                <tr> 
                  <td width="50%" valign="top"> 
				  	<table width="100%" border="0" cellspacing="0" cellpadding="2">
                      <tr align="center"> 
                        <td class="FormInsideTableRegCell">Allergen</td>
                        <td class="FormInsideTableRegCell">Reaction</td>
                      </tr>
                      <asp:Repeater ID="allergies" runat="server"> 
                        <ItemTemplate> 
                          <tr> 
                            <td height="28" class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "Allergen") %></strong></td>
                            <td class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %></strong></td>
                          </tr>
                        </ItemTemplate>
                      </asp:Repeater>
                    </table>				  </td>
                  <td width="50%" valign="top"> 
				  	<table width="100%" border="0" cellspacing="0" cellpadding="2">
                      <tr align="center"> 
                        <td class="FormInsideTableLeftCell">Allergen</td>
                        <td class="FormInsideTableRegCell">Reaction</td>
                      </tr>
                      <tr> 
                        <td height="28" class="FormInsideTableLeftCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td height="28" class="FormInsideTableLeftCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td height="28" class="FormInsideTableLeftCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                    </table>					</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>	</td>
    </tr>

	<tr> 
      <td class="FormOuterTableRow">
	  	<table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" height="120" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span  class="blackBoldText">Medical History / Comorbidities</span>
			<img src="../../Images/shim.gif" border="0" width="10" height="0"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;Unchanged<br/>
			<img src="../../Images/shim.gif" border="0" width="1" height="14"> 
              <asp:Repeater ID="comorbidities" runat="server"> 
                <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %> - <strong><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %></strong></ItemTemplate><SeparatorTemplate>&nbsp;&nbsp;&nbsp;&nbsp;</SeparatorTemplate>
            </asp:Repeater></td>
            <td width="50%" align="right" valign="top"> 
				<table border="0" width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="55%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Coronary Artery Disease / MI</td>
						<td width="45%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Pulm. Disease / Asthma</td>
					</tr>
					<tr>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Other Cardiac: __________</td>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Diabetes (IDDM/NIDDM)</td>
					</tr>
					<tr>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Hypertension</td>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Hypercholesterolemia</td>
					</tr>
					<tr>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">CVA</td>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Depression</td>
					</tr>
					<tr>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Thrombo. Events / DVT</td>
						<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Back Pain / DJD</td>
					</tr>
				</table>			</td>
          </tr>
        </table>	  </td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow"><table cellpadding="10" cellspacing="0" >
        <tr>
          <td style="padding-right: 20px;"><span  class="blackBoldText">Tobacco Use Question </span></td>
          <td style="padding-right: 14px;">Have you smoked even a puff in the past 30 days?</td>
          <td style="white-space: nowrap; padding-right: 8px; text-align: right;"><input type="checkbox" id="socHxPuffLast30DaysYes" runat="server" name="socHxPuffLast30DaysYes"/>
            Yes&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" id="socHxPuffLast30DaysNo" runat="server" name="socHxPuffLast30DaysNo"/>
            No</td>
        </tr>
      </table></td>
	</tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU05<img src="../../Images/shim.gif" border="0" width="45" height="1">U09<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/05/14<img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U09*</div>
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
              Urology Bladder Endoscopy<br/>Follow-Up Patient</span><br/>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
    <tr >
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr>
            <td width="100" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Vital 
              Signs</span></td>
            <td width="100" height="22" align="left" valign="top" class="FormInnerRowRightBorder">BP:</td>
            <td width="100" height="22" align="left" valign="top" class="FormInnerRowRightBorder">Pulse:</td>
            <td width="100" height="22" align="left" valign="top" class="FormInnerRowRightBorder">Temp:</td>
            <td width="100" height="22" align="left" valign="top" class="FormInnerRowRightBorder">Resp:</td>
            <td width="100" height="22" align="left" valign="top" class="FormInnerRowRightBorder">Height:</td>
            <td width="100" height="22" align="left" valign="top">Weight:</td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="32" class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td width="3%" valign="middle"><input type="checkbox" name="No24322" />
            </td>
            <td width="97%" valign="middle">Post instructions reviewed. Fact Cards 
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
      <td height="32" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Local 
        Anesthesia</span><img src="../../Images/shim.gif" border="0" width="30" height="1"> 
        <input type="checkbox" name="No224">
        None<img src="../../Images/shim.gif" border="0" width="30" height="1"> <input type="checkbox" name="No2222">
        2% Xylocaine Jelly</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table class="pageWidth" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td colspan="8" valign="middle" class="FormInnerRowBottomBorder"><span class="blackBoldText">Procedures</span></td>
          </tr>
          <tr> 
            <td width="3%" valign="middle" class="FormInsideTableRegCell"><input type="checkbox" name="No2432"></td>
            <td width="27%" valign="middle" class="FormInsideTableRegCell">Cystoscopy<br/></td>
            <td width="5%" valign="middle">&nbsp;</td>
            <td width="3%" valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No243132"></td>
            <td width="27%" valign="middle" class="FormInsideTableRegCell">Transurethral Fulguration Tumor</td>
            <td width="5%" valign="middle">&nbsp;</td>
            <td width="3%" valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No243132"></td>
            <td width="27%" valign="middle" class="FormInnerRowBottomBorder">Cystogram</td>
		  </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableRegCell"><input type="checkbox" name="No24323"></td>
            <td valign="middle" class="FormInsideTableRegCell">Stent Removal:<img src="../../Images/shim.gif" border="0" width="20" height="8">Right<img src="../../Images/shim.gif" border="0" width="20" height="8">Left</td>
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24324"></td>
            <td valign="middle" class="FormInsideTableRegCell">Transurethral Biopsy</td>
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24324"></td>
            <td valign="middle" class="FormInnerRowBottomBorder">Loopogram</td>
		  </tr>
          <tr> 
            <td valign="middle" height="40" class="FormInnerRowRightBorder"> <input type="checkbox" name="No2431318"></td>
            <td colspan="5" rowspan="2" valign="middle"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="12"></span>Other:<br/></td>
			<td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No24324"></td>
            <td valign="middle" class="FormInnerRowBottomBorder">Urethrogram</td>
		  </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Review: 
        <input type="checkbox" name="Fellow2" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending2" value="Yes">
        Attending</span> <br/> <table align="center" border="0" width="100%" cellpadding="3" cellspacing="0">
          <!-- <tr class="eFormInnerTableRow">
						<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br/></td>
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
            <td height="35" align="left" class="FormInsideTableRegCell">Right 
              Groin:</td>
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
            <td align="left" class="FormInnerRowRightBorder">Other: ___________________<br/></td>
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
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Bimanual Examination Findings</span>
			<img src="../../Images/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="Nurse21325" value="Yes">Normal
			<img src="../../Images/shim.gif" border="0" width="30" height="8"><input type="checkbox" name="Nurse21335" value="Yes">Abnormal
			<img src="../../Images/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="Nurse21343" value="Yes">Mass
			<img src="../../Images/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="Nurse21353" value="Yes">Induration</td>
          </tr>
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder">Induration / Thickening Location: ______________________________________</td>
          </tr>
          <tr> 
            <td width="325" valign="top" class="FormInnerRowRightBorder">Mass Size:<br/>
			_________ cm&nbsp;&nbsp;&nbsp;x&nbsp;&nbsp; _________ cm &nbsp;&nbsp;&nbsp;x&nbsp;&nbsp; _________ cm</td>
            <td width="325" valign="top">Involvement of:<br/> 
              <input type="checkbox" name="Nurse2133522" value="Yes">Vagina
			  <img src="../../Images/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="Nurse2134323" value="Yes">Rectum
			  <img src="../../Images/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="Nurse2135323" value="Yes">Cervix<br/>
			  <input type="checkbox" name="Nurse21343222" value="Yes">Urethra
			  <img src="../../Images/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="Nurse21353222" value="Yes">Pelvic Sidewall
			  <img src="../../Images/shim.gif" border="0" width="30" height="1">Right<img src="../../Images/shim.gif" border="0" width="30" height="1">Left</td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Lab 
              Tests</span><br/> </td>
          </tr>
          <tr  id="LabTestsTrendViewPopTableRow" runat="server"> 
            <td colspan="2" class="FormInnerRowBottomBorder"> <table align="center" border="0" class="pageWidth" cellpadding="3" cellspacing="0">
                <tr> 
                  <td width="14%" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <asp:Repeater ID="LabTestsTrendViewDates" runat="server"> 
                    <ItemTemplate> 
                      <td width="12%" height="12" class="FormInsideTableRegCell" align="center"><strong> 
                        <%# DataBinder.Eval(Container.DataItem, "LabDates") %>
                        </strong></td>
                    </ItemTemplate>
                  </asp:Repeater>
                  <td width="14%" align="left" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                </tr>
                <asp:Repeater ID="LabTestsTrendView" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td align="center" class="FormInsideTableRegCell">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[0]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[1]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[2]") %>
                        </strong></td>
                      <td class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[3]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[4]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[5]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[6]") %>
                        </strong></td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;</td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
          </tr>
          <tr id="LabTestsTrendViewBlankTableRow" runat="server"> 
            <td width="50%" class="FormInnerRowRightBorder"> <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0" >
                <tr> 
                  <td class="FormInnerRowRightBorder">&nbsp;</td>
                  <td colspan="3" align="center" class="FormInsideTableRegCell"><strong>Results</strong></td>
                </tr>
                <tr> 
                  <td width="13%" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <td width="29%" height="12" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="29%" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="29%" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
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
                  <td width="13%" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <td width="29%" height="12" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="29%" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                  <td width="29%" class="FormInnerRowBottomBorder"><strong>Date:</strong></td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr class="FormInsideTableRegCell"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU05<img src="../../Images/shim.gif" border="0" width="45" height="1">U09<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/05/14<img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U09*</div>
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
              Urology Bladder Endoscopy<br/>Follow-Up Patient</span><br/>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
    <tr>
      <td height="26" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Cystoscopy</span>&nbsp;&nbsp;<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText">
        <input type="checkbox" name="Nurse21326" value="Yes">
        </span>Normal
        <img src="../../Images/shim.gif" border="0" width="15" height="1">(Verify normal findings below.)</td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Tumor</span></td>
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
              </span>4<img src="../../Images/shim.gif" border="0" width="30" height="1"><span class="smallGrayText">
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
      <td class="FormOuterTableRow"><table class="pageWidth" border="0" cellspacing="0" cellpadding="1">
          <tr> 
            <td colspan="5" valign="middle" class="FormInsideTableTopLeftCell"><span class="blackBoldText">Intervening 
              Mucosa</span></td>
          </tr>
          <tr> 
            <td width="3%" align="center" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"> </td>
            <td width="46%" valign="middle" class="FormInsideTableRegCell">Normal<br/> 
            </td>
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
						<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br/></td>
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
      <td height="455" align="center" class="FormOuterTableRow"><img src="../../Images/FormImages/Bladder7.gif" class="pageWidth90percent" /></td>    
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU05<img src="../../Images/shim.gif" border="0" width="45" height="8">U09<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/05/14<img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>
<div  align="left"  style="page-break-after:always;"  id="LastPageInForm" runat="server" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U09*</div>
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
              Urology Bladder Endoscopy<br/>Follow-Up Patient</span><br/>            </td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
<tr> 
      <td height="50" class="FormOuterTableRow" style="border-bottom: none;"> 
        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td colspan="8" valign="middle" style="padding: 4px;"><span class="blackBoldText">Today's Disease State</span>
			<img src="../../Images/shim.gif" border="0" width="15" height="1">
			<input type="checkbox" name="NED2">No Recurrence
			  <img src="../../Images/shim.gif" border="0" width="15" height="8"><input type="checkbox" name="LCR">Local Recurrence (Pelvic)
			  <img src="../../Images/shim.gif" border="0" width="15" height="8"><input type="checkbox" name="NED">
			  Distant Mets&nbsp;&nbsp;Sites:_____________________<br />
			  
              <input type="checkbox" name="BCR32" style="margin-left: 180px; margin-top: 7px;" />
              Bladder Recurrence &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			  	<input type="checkbox" name="BCR3">Uppertract &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			  	<input type="checkbox" name="BCR22">Urethral &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		  	  <input type="checkbox" name="BCR22">Positive Cytology Only</td>
          </tr>
        </table>
        <img src="../../Images/shim.gif" border="0" width="105" height="1"> <asp:Label ID="LastStatus" Runat="server" /></td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow" style="padding: 4px;"><span class="blackBoldText">Today's Clinical Stage (1997 / 2002)</span> <img src="../../Images/shim.gif" border="0" width="30" height="1">TX<img src="../../Images/shim.gif" border="0" width="30" height="1">T0<img src="../../Images/shim.gif" border="0" width="30" height="1">TA<img src="../../Images/shim.gif" border="0" width="30" height="1">TIS<img src="../../Images/shim.gif" border="0" width="30" height="1">T1<img src="../../Images/shim.gif" border="0" width="30" height="1">T2<img src="../../Images/shim.gif" border="0" width="30" height="1">T3<img src="../../Images/shim.gif" border="0" width="30" height="1">T4<br/> 
        <br/><span style="margin-left: 202px;">Grade:</span> 
        <input type="checkbox" name="No22"style="margin-left: 28px;">
        Papilloma<img src="../../Images/shim.gif" border="0" width="30" height="1"> 
        <input type="checkbox" name="No222">
        Low Grade<img src="../../Images/shim.gif" border="0" width="30" height="1"> 
        <input type="checkbox" name="No223">
        High Grade</td>
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
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr>
            <td colspan="2" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Disposition</span></td>
          </tr>
          <tr>
            <td width="69%" align="center" class="FormInnerRowRightBorder"><table width="98%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="23%" height="18">Prescriptions:</td>
                  <td width="18%" align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1" />Yes:</td>
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
                  <td align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1" />Yes:</td>
                  <td>____________________________________</td>
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
    <tr bgcolor="#000000"> 
      <td class="FormOuterTableRow"><table width="650" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td><span class="blackBoldText">Signature</span><br/></td>
            <td colspan="2">&nbsp;</td>
          </tr>
<!--          <tr> 
            <td width="100"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1">Fellow: </span></td>
            <td width="350"><span class="blackBoldText">________________________________________________</span></td>
            <td width="200">&nbsp;</td>
          </tr>
          <tr> 
            <td><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1">NP / PA: </span></td>
            <td><span class="blackBoldText">________________________________________________</span></td>
            <td>&nbsp;</td>
          </tr>
-->          <tr> 
            <td colspan="3"><table cellpadding="0" cellspacing="0" class="FormInnerTableBlackTopRow pageWidth98percent">
                <tr> 
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="4">
                      <tr> 
                        <td><span class="blackBoldText"> 
                          <input name="fellow" type="checkbox" id="fellow">
                          </span>I personally performed or was physically present during the <strong>key portions</strong> of the procedure today. <br/> 
                          <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20">MD 
                          / Attending:  _________________________________<img src="../../Images/shim.gif" border="0" width="30" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="20" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span> </span><span class="blackBoldText"> </span></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU05<img src="../../Images/shim.gif" border="0" width="45" height="1">U09<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/05/14<img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>

</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>