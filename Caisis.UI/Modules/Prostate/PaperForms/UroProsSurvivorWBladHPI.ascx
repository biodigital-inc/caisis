<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.UroProsSurvivorWBladHPI" CodeFile="UroProsSurvivorWBladHPI.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>



<%-- Survey remover per Mary Shoen 06-19-2008
<asp:PlaceHolder id="SurveyFormHolder" runat="server"></asp:PlaceHolder>
--%>

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
		<div  class="VerticalBarCodeDocType">*U38*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Survivorship<br/></span></td>
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
                  <td align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong><% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
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
      <td class="FormOuterTableRow"> 
	  <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td class="blackBoldText"><img src="../../images/shim.gif" border="0" width="4" height="15">Date:<% =apptClinicDate %><img src="../../images/shim.gif" border="0" width="80" height="1">Nurse Practitioner:
              <img src="../../images/shim.gif" border="0" width="120" height="1">Primary Physician: 
              <% =apptPhysicianName %>
            </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="FormOuterTableRow"> 
	  <table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
            <tr>              
            <td width="50%" align="left" class="FormInnerRowRightBorder" valign="top"><img src="../../images/shim.gif" border="0" width="4" height="1" />Local&nbsp;M.D.:&nbsp;&nbsp;<asp:Label ID="ReferringMd1Name" Runat="server" CssClass="blackBoldText" /></td>
            <td width="50%" align="left"><img src="../../images/shim.gif" border="0" width="4" height="1" />Local&nbsp;M.D.:&nbsp;&nbsp;<asp:Label ID="ReferringMd2Name" Runat="server" CssClass="blackBoldText" /></td>
            </tr>
            <tr> 
              <td align="left" class="FormInnerRowRightBorder">
			  	<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="22%" height="20" align="right" valign="bottom">Address</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td  height="20" align="right" valign="bottom">&nbsp;</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td  height="20" align="right" valign="bottom">City, State, Zip</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  </tr>
				  <tr> 
                    <td height="20" align="right" valign="bottom">Phone</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;<asp:Label ID="ReferringMd1Phone" Runat="server" CssClass="blackBoldText" /></td>
                  </tr>
                  <tr> 
                    <td  height="20" align="right" valign="bottom">Fax</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;<asp:Label ID="ReferringMd1Fax" Runat="server" CssClass="blackBoldText" /></td>
                  </tr>
                  <tr> 
                    <td  height="20" align="right" valign="bottom">Specialty</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;<asp:Label ID="ReferringMd1Specialty" Runat="server" CssClass="blackBoldText" /></td>
                  </tr>
                </table>
				</td>
              <td align="left">
			  	<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="1">
                  <tr> 
                    <td width="23%" height="20" align="right" valign="bottom">Address</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td height="20" align="right" valign="bottom">&nbsp;</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td height="20" align="right" valign="bottom">City, State, Zip</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  </tr>
				  <tr> 
                    <td height="20" align="right" valign="bottom">Phone</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;<asp:Label ID="ReferringMd2Phone" Runat="server" CssClass="blackBoldText" /></td>
                  </tr>
                  <tr> 
                    <td height="20" align="right" valign="bottom">Fax</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;<asp:Label ID="ReferringMd2Fax" Runat="server" CssClass="blackBoldText" /></td>
                  </tr>
                  <tr> 
                    <td height="20" align="right" valign="bottom">Specialty</td>
                    <td class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;<asp:Label ID="ReferringMd2Specialty" Runat="server" CssClass="blackBoldText" /></td>
                  </tr>
                </table>
				</td>
            </tr>
		 </table>
		 </td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td align="left" height="22"><img src="../../images/shim.gif" border="0" width="4" height="0" />Referring&nbsp;M.D.: 
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
        </table></td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td height="30" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="4" height="12">Chief Complaint</td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td height="300" valign="top" class="FormOuterTableRow"><img src="../../images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">HPI</span><br/> 
        <table cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="HPIText" valign="top"> 
            <asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <span <%#  ((DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PATHPOSITIVE") > -1) || (DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PROCCYSTECTOMY") > -1) || (DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PATHCYSTECTOMY") > -1) || (DataBinder.Eval(Container.DataItem, "ExtraInfo").ToString().ToUpper().IndexOf("PATHPROSTATECTOMY") > -1))  ? "style=\"font-weight:bold;\"" : "" %> ><%# DataBinder.Eval(Container.DataItem, "patientHPI") %></span><br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> 
            
            <%--
            <asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "patientHPI") %>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater>
              
              <asp:Repeater ID="HpiProstatectomies" runat="server" OnItemDataBound="HpiProstatectomiesItemDataBound"> 
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
              </asp:Repeater> 
              
              <asp:Repeater ID="HpiNephrectomies" runat="server" OnItemDataBound="HpiProstatectomiesItemDataBound"> 
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
              </asp:Repeater>

              <asp:Label ID="PreTxPot" Runat="server" /> <asp:Repeater ID="hpiProtocols" runat="server" OnItemDataBound="appendToHpiItemDataBound"> 
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
              </asp:Repeater> --%><!-- <asp:Label ID="NVB_Left" Runat="server" /> <asp:Label ID="NVB_Right" Runat="server" /> -->
            </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr style="display: none;"> 
      <td valign="top" class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="23%" rowspan="2" valign="top" class="FormInsideTableTopLeftCell"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Nomogram 
              Prediction </span></td>
            <td width="11%" class="FormInsideTableTopCell">&nbsp;PreRP 5:</td>
            <td width="16%" class="FormInsideTableTopCell">&nbsp; <asp:Label ID="preRP5Nomo" runat="server" /></td>
            <td width="11%" class="FormInsideTableTopCell">&nbsp;PreBrachy:</td>
            <td width="16%" class="FormInsideTableTopCell">&nbsp; 
              <asp:Label ID="preBrachyNomo" runat="server" /></td>
            <td width="12%" class="FormInsideTableTopCell">&nbsp;Post RP 
              7 Yr:</td>
            <td width="19%" class="FormInsideTableTopCell">&nbsp; <asp:Label ID="postRP7yrNomo" runat="server" /></td>
          </tr>
          <tr>
            <td class="FormInsideTableTopCell">&nbsp;PreRP 10:</td>
            <td class="FormInsideTableTopCell">&nbsp; <asp:Label ID="preRP10Nomo" runat="server" /></td>
            <td class="FormInsideTableTopCell">&nbsp;PreXRT:</td>
            <td class="FormInsideTableTopCell">&nbsp; 
              <asp:Label ID="preXRTNomo" runat="server" /></td>
            <td class="FormInsideTableTopCell">&nbsp;Post RP 
              10 Yr:</td>
            <td class="FormInsideTableTopCell">&nbsp; <asp:Label ID="postRP10yrNomo" runat="server" /></td>
          </tr>
        </table>
		</td>
    </tr>
	<tr> 
      <td valign="top" class="FormOuterTableRow">
	  <table align="center" border="0" class="pageWidth" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" valign="top" class="FormInsideTableTopCell"><img src="../../images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">Interval History</span><br/></td>
            <td colspan="2" align="left" valign="top"><span class="blackBoldText">Other Treatments:</span> <span class="smallGrayText"> (CHEMO,GENE,HORM,ORCH,XRT,NONE)</span><br/> 
              <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
                <tr> 
                  <td align="center" class="FormInsideTableTopLeftCell">Start Date</td>
                  <td align="center" class="FormInsideTableTopCell">TX<br/> <img src="../../Images/shim.gif" border="0" width="90" height="1"></td>
                  <td align="center" class="FormInsideTableTopCell">Notes (Protocol #)</td>
                  <td align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>
                <asp:Repeater ID="MedTx" runat="server"> 
                  <ItemTemplate>
                <tr> 
                  <td class="FormInsideTableLeftCell"><%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>&nbsp;</td>
                  <td class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>&nbsp;</td>
                  <td class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "MedTxNotes") %>&nbsp;</td>
                  <td class="FormInnerRowBottomBorder"><%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%>&nbsp;</td>
                </tr> 
                  </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="XRT" runat="server"> 
                  <ItemTemplate>
                <tr> 
                  <td class="FormInsideTableLeftCell"><%# DataBinder.Eval(Container.DataItem, "RadTxDateText")%>&nbsp;</td>
                  <td class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "RadTxType")%>&nbsp;</td>
                  <td class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "RadTxNotes")%>&nbsp;</td>
                  <td class="FormInnerRowBottomBorder"><%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText")%>&nbsp;</td>
                </tr> 
                  </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="Brachy" runat="server"> 
                  <ItemTemplate>
                <tr> 
                  <td class="FormInsideTableLeftCell"><%# DataBinder.Eval(Container.DataItem, "BrachyDateText")%>&nbsp;</td>
                  <td class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "BrachyPrescribedDose")%> <%# DataBinder.Eval(Container.DataItem, "BrachyIsotope")%>&nbsp;</td>
                  <td class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "BrachyNotes")%>&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr> 
                  </ItemTemplate>
                </asp:Repeater>
 <%--               <tr> 
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>--%> 
				</table>
			</td>
		  </tr>
          <tr> 
            <td align="left" valign="top" height="30"><img src="../../images/shim.gif" border="0" width="4" height="0" />Late Complications:&nbsp;&nbsp; <input type="checkbox" name="No"> No&nbsp;&nbsp; <input type="checkbox" name="Yes"> Yes (specify): 
              <asp:Repeater ID="complications" runat="server"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "ROS_DateText") %>
                  <%# DataBinder.Eval(Container.DataItem, "ROS_Result") %>
                </ItemTemplate>
                <SeparatorTemplate>,&nbsp;&nbsp;</SeparatorTemplate>
              </asp:Repeater> </td>
				<td> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
				Peyronies<br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
				Hernia  Side:________________<br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
				Stricture<br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
				Depression<br/></td>
				<td valign="top"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
				Erectile Dysfunction<br/><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
				Incontinence<br/><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
				Other:<br/></td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> 
	  <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="52%" class="FormInnerRowRightBorder" valign="top"> 
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="3" style="height: 22px;"><span class="blackBoldText"><img src="../../images/shim.gif" border="0" width="4" height="0" />Medications/Devices</span> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> Yes <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> No&nbsp;<span><img src="../../images/shim.gif" border="0" width="30" height="1"><input name="DateLastGnRH4" type="checkbox" id="DateLastGnRH4" value="yes" />&nbsp;Unchanged</span></td>
                </tr>
                <tr align="center"> 
                  <td width="58%" class="FormInsideTableTopCell">Agent</td>
                  <td width="21%" class="FormInsideTableTopCell">Dose</td>
                  <td width="21%" class="FormInsideTableTopCell">Schedule</td>
                </tr>
                <asp:Repeater ID="medications" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "Medication") %>
                      </td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "MedDose") %>
                        &nbsp;</td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "MedSchedule") %>
                        &nbsp;</td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table>
			 </td>
            <td width="48%" valign="top"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td  style="height: 22px;" colspan="3">&nbsp;</td>
                </tr>
			    <tr align="center"> 
                  <td width="60%" class="FormInsideTableTopCell">Agent</td>
                  <td width="18%" class="FormInsideTableTopCell">Dose</td>
                  <td width="22%" class="FormInsideTableTopCell">Schedule</td>
                </tr>
                <tr align="center"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr align="center"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr align="center"> 
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table>
			 </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr > 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td align="left" valign="top" height="150"><img src="../../images/shim.gif" border="0" width="4" height="0" /><span  class="blackBoldText">Medical 
              &amp; Surgical History/Comorbidities</span><br/> <img src="../../images/shim.gif" border="0" width="1" height="14"> 
              <asp:Repeater ID="comorbidities" runat="server"> 
                <ItemTemplate>
                  <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
                  - 
                  <strong><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %></strong>
                </ItemTemplate>
                <SeparatorTemplate><br/>&nbsp;</SeparatorTemplate>
              </asp:Repeater> </td>
            <td width="35%" align="right" valign="top"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td><img src="../../images/shim.gif" border="0" width="10" height="5"></td>
                </tr>
                <tr> 
                  <td> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
                    Coronary Artery Disease/MI<br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
                    Other Cardiac Disease __________<br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
                    Hypertension<br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
                    CVA<br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
                    Thromboembolic Events/DVT <br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
                    Pulmonary Disease/Asthma/COPD<br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
                    Diabetes (Type I/Type II)<br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
                    Hypercholesterolemia<br/> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> 
                    Back Pain/DJD <br/></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU34<img src="../../Images/shim.gif" border="0" width="45" height="1">U38<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:03/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">1</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U38*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Survivorship<br/></span></td>
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
                  <td align="left"><strong><% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
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
      <td class="FormOuterTableRow"><img src="../../images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr valign="top"> 
            <td width="50%" class="FormInnerRowRightBorder"><span class="blackBoldText">Family History:</span><img src="../../Images/shim.gif" border="0" width="50" height="1"><input type="checkbox" name="famHxProstateCancerYes2" runat="server" ID="famHxProstateCancerYes2"/>No known family history of ca<br/> 
			  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="BlankFamilyHistoryTable" runat="server">
				<tr> 
				  <td width="22%"><img src="../../Images/shim.gif" border="0"  height="1"></td>
				  <td width="10%"><img src="../../Images/shim.gif" border="0" height="1"></td>
				  <td width="10%"><img src="../../Images/shim.gif" border="0" height="1"></td>
				  <td width="12%"><img src="../../Images/shim.gif" border="0" height="1"></td>
				  <td width="46%"><img src="../../Images/shim.gif" border="0" height="1"></td>
				</tr>
				<tr> 
				  <td>&nbsp;</td>
				  <td align="center">Y</td>
				  <td align="center">N</td>
				  <td>&nbsp;</td>
				  <td>&nbsp;</td>
				</tr>
				<tr> 
				  <td>Prostate Ca</td>
				  <td align="center"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				  <td align="center"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				  <td align="right">If Y:&nbsp;</td>
				  <td>Num. 1&deg; relatives:&nbsp;&nbsp;_______</td>
				</tr>
				<tr> 
				  <td colspan="3">&nbsp;</td>
				  <td>&nbsp;</td>
				  <td>Num. other relatives:&nbsp;_______</td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr> 
				  <td colspan="2">Side of Family</td>
				  <td colspan="3"><img src="../../images/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;&nbsp;Maternal<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;&nbsp;Paternal</td>
				</tr>
				<tr> 
				  <td><img src="../../Images/shim.gif" border="0" width="10" height="15"></td>
				  <td align="center" valign="bottom">Y</td>
				  <td align="center" valign="bottom">N</td>
				  <td>&nbsp;</td>
				  <td>&nbsp;</td>
				</tr>
				<tr valign="top"> 
				  <td>Other Ca</td>
				  <td align="center"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				  <td align="center"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				  <td align="right">List:&nbsp;</td>
				  <td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />Breast</td>
							<td align="left"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />Testis</td>
						</tr>
						<tr>
							<td><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />Bladder</td>
							<td align="left" valign="top" rowspan="2"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />Other:</td>
						</tr>
						<tr>
							<td><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />Kidney</td>
						</tr>
					</table>
				  </td>
				</tr>
                <tr> 
                  <td colspan="5">
				  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td><img src="../../Images/shim.gif" border="0" width="40" height="8"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="50" height="1"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="50" height="1"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="50" height="1"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="122" height="8"></td>

                      </tr>
                      <tr> 
                        <td>&nbsp;</td>
                        <td align="center">Alive</td>
                        <td align="center">Dead</td>
                        <td align="center">Age</td>
                        <td align="center">Cause of Death</td>
                      </tr>
                      <tr> 
                        <td>Mother</td>
                        <td align="center"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
                        <td align="center"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                      <tr> 
                        <td>Father</td>
                        <td align="center"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
                        <td align="center"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                      <tr> 
                        <td>Other</td>
                        <td align="center"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
                        <td align="center"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                    </table>
					</td>
                </tr>
              </table>
              <br/> <asp:Repeater ID="familyHistory" runat="server" OnItemCreated="FamilyHistoryItemCreated"> 
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "FamMemNum") %>
                  <%# DataBinder.Eval(Container.DataItem, "FamMemRelation") %>
                  <asp:Label ID="FamMemSide" Runat="server">( 
                    <%# DataBinder.Eval(Container.DataItem, "FamMemSide") %>
                    )</asp:Label>
                  </strong> 
                  <asp:Label ID="FamMemDiagnosis" Runat="server" >with 
                    <%# DataBinder.Eval(Container.DataItem, "FamMemDiagnosis") %>
                  </asp:Label>
                  <br/>
                </ItemTemplate>
              </asp:Repeater>
			</td>
            <td width="50%"><p><span class="blackBoldText">Social History:</span><br/>
                <img src="../../Images/shim.gif" width="5" height="9" hspace="0" vspace="0" border="0"><br/>
                Occupation: <asp:Label ID="socHxOccupation" Runat="server" /><br/>
                <img src="../../Images/shim.gif" width="5" height="9" hspace="0" vspace="0" border="0"><br/>
                Marital Status: <asp:Label ID="socHxMaritalStatus" Runat="server" /><img src="../../Images/shim.gif" border="0" width="70" height="1">Children: 
                <asp:Label ID="socHxChildren" Runat="server" /><br/>
                <img src="../../Images/shim.gif" border="0" width="1" height="8"><br/>
                <span style="display: inline-block; width: 100px;">Tobacco Use:</span><input type="checkbox" name="Digitized222222">None <br/>
                <span style="display: inline-block; width: 100px;">&nbsp;</span><asp:Label ID="socHxTobaccoType" Runat="server"><input type="checkbox" name="Digitized2222">Cigarettes
				<img src="../../Images/shim.gif" border="0" width="10" height="8"><input type="checkbox" name="Digitized22222">Cigar
				<img src="../../Images/shim.gif" border="0" width="10" height="1"><input type="checkbox" name="Digitized22223">Pipe</asp:Label>
                <br/>
                <span style="display: inline-block; width: 100px;">&nbsp;</span><input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" NAME="socHxTobaccoPacksPerDayCheckBox"/>
                <asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label> packs/day for <asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label>years<br/>
                <br/>
                <span style="display: inline-block; width: 100px;">&nbsp;</span><input type="checkbox" id="socHxTobaccoQuitYearCheckbox" runat="server" NAME="socHxTobaccoQuitYearCheckbox"/>
                Quit Year: <asp:Label ID="socHxTobaccoQuitYear" Runat="server">______ </asp:Label><br/>
                <br/>
                Alcohol Use: <asp:Label ID="socHxAlcohol" Runat="server" /><br/><br/>
                Carcinogen Exposure: <asp:Label ID="socHxCarcinogen" Runat="server" /><br/><br/>
                Diet &amp; Exercise: <asp:Label ID="socHxDietExercise" Runat="server" /><br/><br/></p></td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
            <td style="padding-top: 5px; vertical-align: top; width: 58%;" class="FormInnerRowRightBorder"><span class="blackBoldText" style="margin-left: 4px;">Biochemical Markers/Lab Tests</span>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">GFR</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell">Data Source</td>
                </tr>
                <asp:Repeater ID="labTests" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td class="FormInsideTableRegCell" style="height: 17px; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
                      <td class="FormInsideTableRegCell" style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
                      <td class="FormInsideTableRegCell" style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
                      <td class="FormInsideTableRegCell" style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "GFR") %>&nbsp;</td>
                      <td class="FormInsideTableRegCell" style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table>
			</td>
            <td style="padding-top: 5px; vertical-align: top; width: 42%;"><span class="blackBoldText" style="margin-left: 4px;">Allergies</span>&nbsp;&nbsp; <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />Yes <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">NKA&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes">Unchanged</span>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr align="center"> 
                  <td width="49%" class="FormInsideTableTopCell">Allergen</td>
                  <td width="51%" class="FormInsideTableTopCell">Reaction</td>
                </tr>
                <asp:Repeater ID="allergies" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td  height="17" class="FormInsideTableRegCell">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "Allergen") %>
                      </td>
                      <td class="FormInnerRowBottomBorder">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %>
                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table>
			  </td>
          </tr>
        </table></td>
    </tr>
    
    <tr> 
      <td class="FormOuterTableRow" style="border-bottom: none;"><span class="blackBoldText"><img src="../../images/shim.gif" border="0" width="4" height="0" />Imaging</span><span><img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Films Reviewed">
        Films Reviewed<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Compared to Past">
        Compared to Past<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Reviewed with Radiologist">
        Reviewed with Radiologist<img src="../../Images/shim.gif" border="0" width="12" height="1"> 
        <input type="checkbox" name="Digitized">
        Digitized<br/>
        </span>
        <table class="pageWidth" align="center" border="0" cellpadding="1" cellspacing="0">
          <tr> 
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td width="45%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
        </table>        </td>
        </tr>
<asp:Repeater ID="images" Runat="server"><ItemTemplate>
        <tr>
<td class="FormOuterTableRow" style="border-bottom: none;">
        <table class="pageWidth" align="center" border="0" cellpadding="1" cellspacing="0">
              <tr > 
                <td width="15%" height="28" align="center" class="FormInsideTableRegCell">&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText")%>                </td>
                <td width="15%" class="FormInsideTableRegCell">&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxType")%>                </td>
                <td width="25%" width="15%" class="FormInsideTableRegCell">  
                  <%# DataBinder.Eval(Container.DataItem, "DxResult")%>                </td>
                <td width="45%" class="FormInnerRowBottomBorder">&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes")%>                </td>
              </tr>
        </table></td>
    </tr>
</ItemTemplate></asp:Repeater>


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
                <td height="22" class="FormInsideTableRegCell" align="center">
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
      <td class="FormOuterTableRow">
      
      <style type="text/css">
      table#SurvivorshipHealthMaintenance
      {
          width: 100%;
          border-collapse: collapse;
          border-spacing: 0;
      }
      table#SurvivorshipHealthMaintenance td
      {
          border: solid 1px #666666;
          padding: 4px 2px;
          text-align: center;
          height: 20px;
      }
      table#SurvivorshipHealthMaintenance td:first-child
      {
          border-left: none;
      }
      </style>
      <img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Health Maintenance</span>
      <table id="SurvivorshipHealthMaintenance" cellspacing="0">
          <tr>
            <td style="width: 15%;">Test</td>
            <td style="width: 15%;">Date</td>
            <td style="width: 70%;">Results</td>
          </tr>
          <tr>
            <td >Colonoscopy</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >Mammogram</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >Bone Density Scan</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >Pap Smear</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >Cholesterol</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >PSA</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >Flu Vaccine</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >Pneumovax</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >Shingles Vaccine</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >Tdap Vaccine</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
      </table></td>
    </tr>
    
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU34<img src="../../Images/shim.gif" border="0" width="45" height="1">U38<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:03/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">2</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U38*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Survivorship<br/></span></td>
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
                  <td align="left"><strong><% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
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
      <td class="FormOuterTableRow"><img src="../../images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">Review of Systems</span>
        <table align="center" border="0" width="100%" cellpadding="3" cellspacing="0">
          <tr> 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td align="center" class="FormInsideTableTopCell" style="font-size: smaller;"><strong>Not<br/>Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
            <td align="center" class="FormInsideTableTopCell" style="font-size: smaller;"><strong>Disease<br/>Related</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr>
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Gen&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Weight Changes</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" class="FormInsideTableRegCell">Fever/Chills</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" class="FormInsideTableRegCell">Skin Changes</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Skin&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Wounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" class="FormInsideTableRegCell">Breast Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Heme&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Anemia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
		  <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Resp&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Dyspnea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />CV&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Chest Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />GI&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Dyspepsia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" class="FormInnerRowBottomBorder" valign="bottom"><img src="../../images/shim.gif" border="0" width="4" height="0" />&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Diarrhea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Melena</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="7" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />GU&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Obstruction</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="7" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Dysuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Penile Pain, Curvature, Length</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Groin Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Flank Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="6" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />GYN&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="6" class="FormInnerRowBottomBorder" align="left" valign="bottom">&nbsp;<img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />Amenorrhea <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />Irregular Menses <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />Dysmenorrhea</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Discharge</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Pre-Menopausal</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Post-Menopausal: <span class="smallGrayText">Vaginal Bleeding</span></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">LMP: __________</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Sexuality Difficulty</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Psych&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Depression</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder" style="padding: 3px;">PHQ-9: ____ / 27</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Mood Changes</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
		  <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Neuro&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Numbness/Tingling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Headaches</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />MS&nbsp;</td>
			<td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../images/shim.gif" border="0" width="4" height="0" />Fatigue&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center">Y<img src="../../images/shim.gif" border="0" width="24" height="1">N</td>
            <td class="FormInsideTableRegCell" align="left" nowrap>Inten. (0-10):<img src="../../images/shim.gif" border="0" width="8" height="0"></td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
	      </tr>
		  <tr> 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../images/shim.gif" border="0" width="4" height="0" />Pain&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center">Y<img src="../../images/shim.gif" border="0" width="24" height="1">N</td>
            <td class="FormInsideTableRegCell" align="left" nowrap>Inten. (0-10):<img src="../../images/shim.gif" border="0" width="8" height="0"></td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td align="left" valign="bottom" class="FormInsideTableRegCell">Relief:<img src="../../images/shim.gif" border="0" width="12" height="1">Y<img src="../../images/shim.gif" border="0" width="24" height="1">N</td>
	      </tr>
		  <tr> 
            <td align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../images/shim.gif" border="0" width="4" height="0" />Other:<br/> 
            <td align="center" class="FormInnerRowRightBorder"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="left" valign="top" class="FormInnerRowRightBorder">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td align="left" valign="top">&nbsp;</td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU34<img src="../../Images/shim.gif" border="0" width="45" height="1">U38<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:03/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">3</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U38*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Survivorship<br/></span></td>
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
                  <td align="left"><strong><% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
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
      <td class="FormOuterTableRow"><img src="../../images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
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
                    - Continence (no pads)<br/> &nbsp;&nbsp;&nbsp;&nbsp;2 - Mild 
                    SUI (leaks only during heavy activity)<br/> &nbsp;&nbsp;&nbsp;&nbsp;3 
                    - Moderate SUI (leaks with moderate activity)<br/> &nbsp;&nbsp;&nbsp;&nbsp;4 
                    - Severe SUI (leaks during nl activity, dry at night and at 
                    rest)<br/> &nbsp;&nbsp;&nbsp;&nbsp;5 - Total incont (continuous 
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
              <br/>
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
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table width="100%" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="50%" class="FormInsideTableTopLeftCell"><img src="../../images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Urinary Function Survey </span></td>			
				<td width="50%" class="FormInsideTableTopCell"><img src="../../images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Erectile Function Survey</span><img src="../../images/shim.gif" border="0" width="20" height="1"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Not Applicable</td>			
			</tr>
			<tr>
				<td height="25" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Q1:______<img src="../../images/shim.gif" border="0" width="6" height="1">Q2:______<img src="../../images/shim.gif" border="0" width="6" height="1">Q3:______</td>			
				<td class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Q4:_____ <img src="../../images/shim.gif" border="0" width="30" height="1">On PDE-5? <input type="checkbox" name="Yes2">Yes&nbsp; <input type="checkbox" name="Yes22">No</td>			
			</tr>
			<tr> 
				<td height="25" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Total: ____ / 15&nbsp;<br/><asp:Label ID="LastUrinaryQOLScores" Runat="server"  CssClass="blackBoldTextSmall" /><asp:Label ID="UrinaryQOL" Runat="server" CssClass="blackBoldTextSmall" /></td>
			  	<td class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />(Q5:_____ &nbsp;&nbsp;+&nbsp;&nbsp;Q6:_____&nbsp;)&nbsp;&nbsp;=<img src="../../images/shim.gif" border="0" width="4" height="0" />Total: _____ / 12<br/><asp:Label ID="LastSexualQOLScores" CssClass="blackBoldTextSmall"  Runat="server" /><asp:Label CssClass="blackBoldTextSmall" ID="SexualQOL" Runat="server" />
			  </td>
            </tr>
			<tr> 
				<td class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Continence:<img src="../../images/shim.gif" width="10" height="1"><input name="textfield4" type="text" class="inputFieldFlat" size="3"><img src="../../images/shim.gif" width="5" height="1">Date Fully Continent: ____/____/______<br/><asp:Label ID="LastCont" Runat="server" CssClass="blackBoldTextSmall"/></td>
				<td align="left" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Current Erectile Function:<img src="../../images/shim.gif" width="10" height="1"><input type="text" name="CurrentErectileFunctionTextbox" runat="server" id="CurrentErectileFunctionTextbox" class="inputFieldFlat" size="3"><asp:Label CssClass="FormPopulatedSmallerText" ID="LastPot" Runat="server"/></td>
			</tr>
			<tr>
            	<td class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />TX for Stricture:<img src="../../images/shim.gif" border="0" width="20" height="1"><input name="textfield" type="text" class="inputFieldFlat" size="10"><img src="../../images/shim.gif" border="0" width="20" height="1">Tx Date:<input name="textfield" type="text" class="inputFieldFlat" size="10"></td>
				<td class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />% Best Erection: No Medications: ___________</td>			
			</tr>
			<tr> 
				<td class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />TX for Incontinence:<input name="textfield" type="text" class="inputFieldFlat" size="10"><img src="../../images/shim.gif" border="0" width="20" height="1">Tx Date:<input name="textfield" type="text" class="inputFieldFlat" size="10"></td>
				<td class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />% Best Erection: Oral PDE-5 Drugs: ___________</td>			
		  </tr>
          <tr id="LastIncontTxTableRow" runat="server"> 
            <td class="FormInnerRowRightBorder" colspan="2"><img src="../../images/shim.gif" border="0" width="20" height="1"><asp:Label ID="LastIncontTx" Runat="server" CssClass="blackBoldTextSmall" /></td>
          </tr>
          <tr> 
			  <td class="FormInsideTableRegCell"><p class="smallGrayText"><img src="../../images/shim.gif" border="0" width="4" height="1" />1 - Continence (no pads)<br/>
				  <img src="../../images/shim.gif" border="0" width="4" height="1" />2 - Mild SUI (leaks only during heavy activity)<br/>
				  <img src="../../images/shim.gif" border="0" width="4" height="1" />3 - Moderate SUI (leaks with moderate activity)<br/>
				  <img src="../../images/shim.gif" border="0" width="4" height="1" />4 - Severe SUI (leaks during normal activity, dry at night and at rest)<br/>
				  <img src="../../images/shim.gif" border="0" width="4" height="1" />5 - Total incont (continuous leakage of urine at rest)</p>
			 </td>
            <td valign="top" class="FormInsideTableRegCell">
			  <span class="smallGrayText">
			  <img src="../../images/shim.gif" border="0" width="4" height="1" />Current Erectile Function<br/>
              <img src="../../images/shim.gif" border="0" width="4" height="1" />1 - Normal, full erections <br/>
              <img src="../../images/shim.gif" border="0" width="4" height="1" />2 - Full, but recently diminished <br/>
              <img src="../../images/shim.gif" border="0" width="4" height="1" />3 - Partial, satis. for intercourse <br/>
              <img src="../../images/shim.gif" border="0" width="4" height="1" />4 - Partial, unsatis. for intercourse<br/>
              <img src="../../images/shim.gif" border="0" width="4" height="1" />5 - Impotent</span>
			</td>
		  </tr>
		</table>
		</td>
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
			<img src="../../Images/shim.gif" border="0" width="40" height="1">Constant<br/> 
            <img src="../../Images/shim.gif" border="0" width="30" height="4"><br/>
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
			<img src="../../Images/shim.gif" border="0" width="30" height="1">1 /day<br/>
			<img src="../../Images/shim.gif" border="0" width="130" height="1"><input type="checkbox" name="No322232">unchanged
			<img src="../../Images/shim.gif" border="0" width="20" height="1"><input type="checkbox" name="Yes322232">worse
			<img src="../../Images/shim.gif" border="0" width="20" height="1"><input type="checkbox" name="Yes3222322">improved</td>
          </tr>
		  <tr valign="top"> 
            <td height="30" class="FormInnerRowBottomBorder">Complications<br/> 
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
			<img src="../../Images/shim.gif" border="0" width="60" height="1">Revision Date: __________________<br/>
			<img src="../../Images/shim.gif" border="0" width="4" height="1">Revision Type:
			<img src="../../Images/shim.gif" border="0" width="20" height="1"><input type="checkbox" name="stomalStenosis"/>Stomal Stenosis
			<img src="../../Images/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="limbRevision"/>Limb Revision
			<img src="../../Images/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="pouch"/>Pouch</td>
          </tr>
        </table>
		</td>
    </tr>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU34<img src="../../Images/shim.gif" border="0" width="45" height="1">U38<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:03/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">4</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U38*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Survivorship<br/></span></td>
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
                  <td align="left"><strong><% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
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
      <td class="FormOuterTableRow"><img src="../../images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital Signs</span></td>
            <td width="30%" height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />BP:</td>
            <td width="30%" height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Resp:</td>
            <td width="30%" height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Height:</td>
          </tr>
          <tr> 
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Pulse:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Temp:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />Weight:<img src="../../images/shim.gif" border="0" width="50" height="1">BMI:</td>
          </tr>
        </table>
	</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <img src="../../images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">Exam</span>
	  <table align="center" border="0" width="100%" cellpadding="3" cellspacing="0">
          <tr> 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal Findings</strong><strong></strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />General</td>
            <td align="left" class="FormInsideTableRegCell">Well Developed/Well Nourished</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Alert &amp; Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
		  <tr> 
            <td rowspan="7" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Abdomen&nbsp;</td>
            <td align="left" class="FormInsideTableRegCell">Soft, Non-tender</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td rowspan="7" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Rebound or Guarding</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Palpable Hernia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Masses or Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Normal Bowel Sounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Hepatosplenomegaly</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Ascites</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell">Stomal</td>
            <td align="left" class="FormInsideTableRegCell"> No Rash</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell"> No Stenosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell"> No Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell"> No Hernia </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          
          
          
          
          
          <%-- 
		  <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Nodes</td>
            <td align="left" class="FormInsideTableRegCell">Supraclavicular</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Axillary</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>--%>

		  <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Resp.</td>
            <td align="left" class="FormInsideTableRegCell">Clear to Auscultation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
		  <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />GU</td>
            <td align="left" class="FormInsideTableRegCell">Testes w/o Tenderness or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td rowspan="4" align="left" class="FormInnerRowBottomBorder" valign="bottom">
            
            
            
            &nbsp;Circumcised&nbsp;&nbsp; <input type="checkbox" name="Yes">Yes&nbsp;&nbsp; <input type="checkbox" name="No">No<br /><br />
            
            &nbsp;Stool Sent for Guiac&nbsp;&nbsp; <input type="checkbox" name="Yes">Yes&nbsp;&nbsp; <input type="checkbox" name="No">No<br /><br />
            
            &nbsp;PVR _________

            </td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell"> No Palpable Penile Plaque or Fibrosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Empty Prostatic Fossa</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Rectal Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="0" />CV</td>
            <td align="left" class="FormInsideTableRegCell">No Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td  rowspan="4"align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Regular Rate &amp; Rhythm</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Murmurs</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
<%-- 		  <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Breast</td>
            <td align="left" class="FormInsideTableRegCell">No Dimpling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td rowspan="4" align="left" valign="bottom" class="FormInnerRowBottomBorder">&nbsp;Last Mammogram Exam:  _____/_____/_____</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Nipple Retraction </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Discharge </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Masses or Axillar Lymphadenopathy </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>--%>
		  <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Back</td>
            <td align="left" class="FormInsideTableRegCell">No Spinal Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No CVA Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
		  <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />MS</td>
            <td align="left" class="FormInsideTableRegCell">No Leg Swelling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
		  <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../images/shim.gif" border="0" width="4" height="1" />Skin</td>
            <td align="left" class="FormInsideTableRegCell">No Rash or Ulcers</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">No Nodules</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
          </tr>
		  <tr> 
            <td align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../images/shim.gif" border="0" width="4" height="0" />Other&nbsp;</td>
            <td align="left" class="FormInnerRowRightBorder">&nbsp;</td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            <td align="center">&nbsp;</td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU34<img src="../../Images/shim.gif" border="0" width="45" height="1">U38<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:03/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">5</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
</table>
</div>
<div align="left"  id="LastPageInForm" runat="server" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U38*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Survivorship<br/></span></td>
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
                  <td align="left"><strong><% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
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
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td colspan="4" class="blackBoldText">Impression &amp; Plan </td>
          </tr>
          <tr> 
            <td style="width: 32%; text-align: center;" class="FormInsideTableTopCell"><strong>Diagnoses / Problem List</strong></td>
            <td style="width: 68%; text-align: center;" colspan="2" class="FormInsideTableTopCell"><strong>Plan &amp; Referrals</strong></td>
          </tr>
          <tr> 
            <td rowspan="6" class="FormInsideTableRegCell" style="vertical-align: top;">1.&nbsp;&nbsp;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Bladder Cancer</td>
            <td style="width: 34%;" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Return Visit in 12 Months</td>
            <td style="width: 34%;" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;CMP</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Return Visit in 6 Months</td>
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;CBC</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Urine Cytology</td>
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;CT Urogram</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Renal US</td>
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;MR Urogram</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;CXR</td>
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Urine Cytology: Urethral Wash</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;PSA</td>
            <td class="FormInsideTableRegCell"  >&nbsp;</td>
          </tr>
          
          <tr> 
            <td rowspan="4" class="FormInsideTableRegCell" style="vertical-align: top;">2.&nbsp;&nbsp;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Testicular Cancer</td>
            <td colspan="2" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Return Visit in 12 Months</td>
          </tr>
          <tr> 
            <td colspan="2" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Return Visit in 6 Months</td>
          </tr>
          <tr> 
            <td colspan="2" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;CXR</td>
          </tr>
          <tr> 
            <td colspan="2" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;AFP, Bhcg, LDH</td>
          </tr>



          
          <tr> 
            <td rowspan="5" class="FormInsideTableRegCell" style="vertical-align: top;">3.&nbsp;&nbsp;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Prostate Cancer</td>
            <td colspan="2" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Return Visit in 12 Months</td>
          </tr>
          <tr> 
            <td colspan="2" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Return Visit in 6 Months</td>
          </tr>
          <tr> 
            <td colspan="2" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Discharge to PCP for Continued Annual PSA and Exam</td>
          </tr>
          <tr> 
            <td colspan="2" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Repeat PSA in 12 Months</td>
          </tr>
          <tr> 
            <td colspan="2" class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Repeat PSA in 6 Months</td>
          </tr>





          


          
          <tr> 
            <td rowspan="4" class="FormInsideTableRegCell" style="vertical-align: top;">4.&nbsp;&nbsp;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Renal Cancer</td>
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Return Visit in 12 Months</td>
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;MRI Renal Protocol</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Return Visit in 6 Months</td>
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;CT Abdomen/Pelvis</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Renal US</td>
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;UA</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;CXR</td>
            <td class="FormInsideTableRegCell"  ><img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;BMP</td>
          </tr>




          <tr> 
            <td valign="top" class="FormInsideTableRegCell">5.&nbsp;&nbsp;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Renal Mass</td>
            <td colspan="2" class="FormInsideTableRegCell"  >&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top" class="FormInsideTableRegCell">6.&nbsp;&nbsp;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&nbsp;Active Surveillance</td>
            <td colspan="2" class="FormInsideTableRegCell"  >&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top" class="FormInsideTableRegCell">7.</td>
            <td colspan="2" class="FormInsideTableRegCell"  >&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top" class="FormInsideTableRegCell">8.</td>
            <td colspan="2" class="FormInsideTableRegCell"  >&nbsp;</td>
          </tr>
        </table>
		</td>
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
      <td class="FormOuterTableRow"><span class="blackBoldText">Disposition</span>
		<table width="100%" cellpadding="1" cellspacing="0" border="0">
			<tr>
				<td valign="bottom" align="center" width="20%" class="FormInsideTableTopCell">Appointment</td>
				<td valign="bottom" align="center" width="5%" class="FormInsideTableTopCell">Y</td>
				<td valign="bottom" align="center" width="5%" class="FormInsideTableTopCell">N</td>
				<td valign="bottom" align="center" width="20%" class="FormInsideTableTopCell">Appointment</td>
				<td valign="bottom" align="center" width="5%" class="FormInsideTableTopCell">Y</td>
				<td valign="bottom" align="center" width="5%" class="FormInsideTableTopCell">N</td>
				<td valign="bottom" align="center" width="20%" class="FormInsideTableTopCell">Appointment</td>
				<td valign="bottom" align="center" width="5%" class="FormInsideTableTopCell">Y</td>
				<td valign="bottom" align="center" width="5%" class="FormInsideTableTopCell">N</td>
			</tr>
			<tr>
				<td align="left" class="FormInsideTableRegCell">Colonoscopy</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="left" class="FormInsideTableRegCell">Dermatology Consult</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="left" class="FormInsideTableRegCell">Neuro-Urologist Consult</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
			</tr>
			<tr>
				
            <td align="left" class="FormInsideTableRegCell">Smoking Cessation</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
            	<td align="left" class="FormInsideTableRegCell">Psych Consult</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="left" class="FormInsideTableRegCell">GU Medicine Consult</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
			</tr>
			<tr>
				<td align="left" class="FormInsideTableRegCell">Social Worker</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="left" class="FormInsideTableRegCell">Nutrition Consult</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="left" class="FormInsideTableRegCell">Radiation Consult</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
			</tr>
			<tr>
				<td align="left" class="FormInsideTableRegCell">Integrative Medicine</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="left" class="FormInsideTableRegCell">Sexual Medicine Consult</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="left" class="FormInsideTableRegCell">Treating Urologist</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
			</tr>
			<tr>
				<td align="left" class="FormInsideTableRegCell">Mammogram</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="left" class="FormInsideTableRegCell">Pap Test</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="left" class="FormInsideTableRegCell">Other:</td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
				<td align="center" class="FormInsideTableRegCell"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /></td>
			</tr>
		</table>
	</td>
  </tr>
  
    <tr> 
      <td class="FormOuterTableRow">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
					  <td colspan="2" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Counseling</span></td>
				<td align="center" valign="bottom" style="font-weight: bold;">Notes</td>
			</tr>
			<tr>
			  <td width="35%" height="20" align="left" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Heart Healthy Diet</td>
			  <td width="35%" align="left" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Importance of Exercise</td>
				<td width="30%" class="FormInsideTableTopLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Avoid Sun - Use Sunscreen Regularly</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Recommend Colonoscopy Every 10 Years</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Recommend Annual Mammogram</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Perform Regular Breast Self Exam</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Smoking Cessation</td>
			  <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Home Safety</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td colspan="2" height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Recommend Gynecologic Visit with Pap Smear Every 1 to 2 Years</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
			  <td colspan="2" height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Discussed Cancer Treatment Summary and Care Plan</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
            </tr>
			<tr>
			  <td colspan="2" height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&nbsp;Limit Alcohol to 1-2 Drinks Per Night</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
            </tr>



            
		</table>      </td>
    </tr>
  <tr> 
	<td class="FormOuterTableRow">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="FormInsideTableRegCell">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr> 
						   <td height="18" width="50%"><img src="../../images/shim.gif" border="0" width="4" height="1" />Prescriptions:<img src="../../images/shim.gif" border="0" width="22" height="1"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> No<img src="../../images/shim.gif" border="0" width="22" height="8"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> Yes:<img src="../../images/shim.gif" border="0" width="32" height="1"><img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> Refill&nbsp;&nbsp;or &nbsp;&nbsp;<img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> New</td>
						</tr>
						<tr> 
						  <td height="18 width="50%""><img src="../../images/shim.gif" border="0" width="4" height="1" />Rx: ________________________________</td>
						</tr>
						<tr> 
						  <td height="18"><img src="../../images/shim.gif" border="0" width="4" height="1" />Rx: ________________________________</td>
						</tr>
					 </table>
				</td>
				<td class="FormInsideTableTopCell">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr> 
							<td rowspan="2">Copy to:<br/><img src="../../images/shim.gif" border="0" width="40" height="1"><input name="fellow222" type="checkbox" id="fellow223">
							  Local M.D.: _____________________<br/><br/><img src="../../images/shim.gif" border="0" width="36" height="1"> 
							  <input name="fellow2222" type="checkbox" id="fellow2222">
							  Other: _________________________</td>
						</tr>
				  </table>
				</td>
			  </tr>
		 </table>
		</td>
	</tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td colspan="2"><span class="blackBoldText">Signature</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr>
            <td style="text-align: right; padding: 20px 2px 5px 2px; vertical-align: bottom;"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Nurse Practitioner:</span></td>
            <td style="text-align: left; padding: 20px 2px 5px 2px; vertical-align: bottom;"><span class="blackBoldText">_________________________________________</span></td>
            <td style="padding: 20px 2px 5px 2px; vertical-align: bottom;"><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="padding: 20px 2px 5px 2px; vertical-align: bottom;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr> 
            <td colspan="4" style="text-align: center; padding-bottom: 10px;" ><span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span></td>
          </tr>
      </table></td>
      </tr>
   <%--  <tr> 
      <td class="FormOuterTableRow">
	  <table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td><span class="blackBoldText">Signature</span><br/></td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td><span class="blackBoldText"><img src="../../images/shim.gif" border="0" width="4" height="1" />Nurse Practitioner:</span></td>
            <td><span class="blackBoldText">____________________________________________________________________</span></td>
          </tr>
          <tr> 
            <td colspan="3" align="center" valign="top"><span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span></td>
          </tr>
        </table>
		</td>
    </tr>--%>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU34<img src="../../Images/shim.gif" border="0" width="45" height="1">U38<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/05<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:03/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">6</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>


</div>
