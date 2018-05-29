<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Testis.PaperForms.UroTestFU" CodeFile="UroTestFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


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
		<div  class="VerticalBarCodeDocType">*U14*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Testis Follow-Up Patient<br/></span></td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" height="20" align="left" class="FormInnerRowNoBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1">Referring&nbsp;M.D.&nbsp;<%= institutionShortName%>:</td>
            <td width="50%" align="left" class="FormInnerRowNoBorder">Non-<%= institutionShortName%>:</td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="10"><span class="blackBoldText">Chief Complaint</span><img src="../../Images/shim.gif" border="0" width="400" height="1"><input name="DateLastGnRH4" type="checkbox" id="DateLastGnRH4" value="yes">Late Relapse<br /></td>
    </tr>
    <tr> 
      <td height="80" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">HPI</span><br/>
        <table cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="FormPopulatedSmallerText" valign="top"> <asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "patientHPI") %>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> </td>
          </tr>
        </table><!--Removed because Features Text deleted--><!--<img id="HpiSpacer" runat="server" src="../../Images/shim.gif" border="0" width="4" height="1">--></td>
    </tr>
    <tr> 
      <td align="center" class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr align="left"> 
            <td colspan="6" valign="middle"><span class="blackBoldText">Symptoms</span><span>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Asymptomatic</span></td>
          </tr>
          <tr> 
            <td width="70" align="center" valign="middle" class="FormInsideTableTopLeftCell">System</td>
            <td width="150" align="center" valign="middle" class="FormInsideTableTopCell">Symptom</td>
            <td width="70" align="center" valign="middle" class="FormInsideTableTopCell">Not Present</td>
            <td width="50" align="center" valign="middle" class="FormInsideTableTopCell">Present</td>
            <td width="80" align="center" valign="middle" class="FormInsideTableTopCell">Present Now</td>
            <td width="230" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <tr> 
            <td valign="top" class="FormInsideTableLeftCell">GU</td>
            <td height="15" class="FormInsideTableRegCell">Abdominal Pain</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableLeftCell">GI</td>
            <td height="15" class="FormInsideTableRegCell">Nausea / Vomiting</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableLeftCell" rowspan="2" valign="top">MS</td>
            <td height="15" class="FormInsideTableRegCell">Back Pain</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="15" class="FormInsideTableRegCell">Mass</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top" class="FormInsideTableLeftCell">C/V</td>
            <td height="15" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableLeftCell">Breast</td>
            <td height="15" class="FormInsideTableRegCell">Gynecomastia</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="6" class="FormInsideTableLeftCell">Other</td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td > 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">NKA&nbsp;&nbsp; 
                    <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes">Unchanged Since Last Visit</span></td>
                </tr>
                <tr align="center"> 
                  <td width="40%" height="20" class="FormInsideTableRegCell">Allergen</td>
                  <td class="FormInnerRowBottomBorder">Reaction</td>
                </tr>
                <asp:Repeater ID="allergies" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td class="FormInsideTableRegCell">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "Allergen") %>
                      </td>
                      <td class="FormInnerRowBottomBorder">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %>
                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="50" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Comorbidities</span><br/>
      
              <asp:Repeater ID="comorbidities" runat="server"> 
                <ItemTemplate>&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
                  - <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>
                  </strong> </ItemTemplate>
                <SeparatorTemplate>;&nbsp;&nbsp;&nbsp;&nbsp;</SeparatorTemplate>
        </asp:Repeater> 
      
      
      
      </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="left" valign="top" ><img src="../../Images/shim.gif" border="0" width="4" height="16"><span class="blackBoldText">Procedures</span><br/>
			  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr align="center"> 
                  <td width="15%" class="FormInsideTableTopCell">Date</td>
                  <td width="25%" class="FormInsideTableTopCell">Procedure</td>
                  <td width="60%" class="FormInsideTableTopCell">Findings</td>
                </tr>
                <tr> 
                  <td height="20" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="20" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr > 
                  <td height="20" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table>
			  </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td align="center" class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr> 
            <td colspan="5" align="left" valign="middle"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="3" height="15">Medical Therapies / Chemotherapy</span><span><img src="../../Images/shim.gif" border="0" width="50" height="1">Initial Risk Category:<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" hspace="0" vspace="0" align="absmiddle">Poor<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" hspace="0" vspace="0" align="absmiddle">Intermediate<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" hspace="0" vspace="0" align="absmiddle">Good</span></td>
          </tr>
		<!--<tr> 
            <td height="22" colspan="5" valign="middle" class="FormInsideTableTopLeftCell"><img src="../../Images/shim.gif" border="0" width="3" height="1">Initial Risk Category:<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" hspace="0" vspace="0" align="absmiddle">Poor<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" hspace="0" vspace="0" align="absmiddle">Intermediate<img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" hspace="0" vspace="0" align="absmiddle">Good</td>
          </tr>--> 
		  <tr> 
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Start Date</td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Stop Date</td>
            <td width="19%" align="center" valign="middle" class="FormInsideTableTopCell">Indication</td>
            <td width="39%" align="center" valign="middle" class="FormInsideTableTopCell">Regimen</td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">Cycles</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="15" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="15" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td height="15" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table>
        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="7" align="left" valign="top" class="smallGrayText"><strong>&nbsp;&nbsp;Indication Codes</strong></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="smallGrayText">&nbsp;</td>
            <td align="right" valign="top" class="smallGrayText"><strong>1&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Induction</span> 
            </td>
            <td align="right" valign="top" class="smallGrayText"><strong>6&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Relapse 
              after PostChemo RPLND</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>10&nbsp;&nbsp;</strong></td>
            <td valign="top" class="smallGrayText">Third Line </td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="smallGrayText">&nbsp;</td>
            <td align="right" valign="top" class="smallGrayText"><strong>2&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Relapse 
              after Surveillance</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>7&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Relapse after RPLND</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>11&nbsp;&nbsp;</strong></td>
            <td valign="top" class="smallGrayText">Relapse with Progression of 
              disease</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="smallGrayText">&nbsp;</td>
            <td align="right" valign="top" class="smallGrayText"><strong>3&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Salvage after incomplete RPLND</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>8&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Relapse after Chemo</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>12&nbsp;&nbsp;</strong></td>
            <td valign="top"><span class="smallGrayText">Other</span></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="smallGrayText">&nbsp;</td>
            <td align="right" valign="top" class="smallGrayText"><strong>4&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Adjuvant 
              after RPLND</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>9&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Second Line</span></td>
            <td align="right" valign="top" class="smallGrayText"><strong>13&nbsp;&nbsp;</strong></td>
            <td valign="top" class="smallGrayText">Unknown</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="smallGrayText">&nbsp;</td>
            <td align="right" valign="top" class="smallGrayText"><strong>5&nbsp;&nbsp;</strong></td>
            <td valign="top" class="FormInnerRowRightBorder"><span class="smallGrayText">Adjuvant 
              after postChemo RPLND</span></td>
            <td align="right" valign="top" class="smallGrayText">&nbsp;</td>
            <td valign="top" class="FormInnerRowRightBorder">&nbsp;</td>
            <td valign="top" class="smallGrayText">&nbsp;</td>
            <td valign="top" class="smallGrayText">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU10<img src="../../Images/shim.gif" border="0" width="45" height="1">U14<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ORPROC</td>
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
		<div  class="VerticalBarCodeDocType">*U14*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Testis Follow-Up Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">RPLND Postoperative Complications</span><br/>
      	<table width="100%" border="0" cellspacing="0" cellpadding="1">
		  <asp:Repeater ID="EarlyComplications" runat="server">
          <HeaderTemplate>
			  <tr>
				<td colspan="2" class="FormInnerRowBottomBorder">&nbsp;<strong>Date</strong></td>
				<td colspan="2" class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;<strong>Complication</strong></td>
				<td colspan="2" class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;<strong>Related To</strong></td>
				<td colspan="2" class="FormInnerRowBottomBorder">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Data Source</strong></td>
			</tr>
          </HeaderTemplate>
			<ItemTemplate>
				<tr>
					<td colspan="2">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "ToxDateText") %></strong></td>
					<td colspan="2">&nbsp;&nbsp;&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "ToxName") %></strong></td>
					<td colspan="2">&nbsp;&nbsp;&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "ToxRelatedTo") %></strong></td>
					<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "ToxDataSource") %></strong></td>
				</tr>
          	</ItemTemplate>
          	<FooterTemplate>
          	</FooterTemplate>
		</asp:Repeater>
          <tr> 
            <td valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableTopCell">Pancreatitis</td>
            <td valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableTopCell">SBO</td>
            <td valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableTopCell">Pulm Embolus</td>
            <td valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableTopCell">Pleural effusion </td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableRegCell">Atelectasis / Pneumonia</td>
            <td valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableRegCell">Ascites</td>
            <td valign="middle" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableRegCell">Chylous Ascites </td>
            <td valign="middle" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableRegCell">Renal Infarction</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableRegCell">Neurological</td>
            <td valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableRegCell">Thrombosis</td>
            <td valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableRegCell">Lymphocele</td>
            <td valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">ARDS / Pulm Fibrosis</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">UTI</td>
            <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">Ventral / Incisional Hernia </td>
            <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">Wound Infection</td>
            <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">C. Difficile</td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">Dehiscence</td>
            <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableRegCell">Prolonged Ileus</td>
            <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td colspan="3" class="FormInsideTableRegCell">Other:</td>
          </tr>
          <tr valign="top"> 
            <td height="35" colspan="8" class="FormInsideTableLeftCell"><strong>Management of Complications:<br/></strong></td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td height="20" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText"></span>Post Treatment Ejaculation</span>
	  <img src="../../Images/shim.gif" width="30" height="1" border="0" align="absmiddle">Date: ____/____/________
	  <img src="../../Images/shim.gif" border="0" width="25" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Absent
	  <img src="../../Images/shim.gif" border="0" width="25" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Partial
	  <img src="../../Images/shim.gif" border="0" width="25" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Normal</td>
    </tr>
	<tr>
		<td class="FormOuterTableRow">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
	  				<td colspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Fertility:</span></td>
				</tr>
				<tr>
					<td width="50%" height="15" class="FormInsideTableTopLeftCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Number of Children Pre-Surgery:: __________</td>
					<td width="50%" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Number of Children Post-Surgery: __________</td>
				</tr>
				<tr>
					<td height="15" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Post-Surgery if <strong>YES</strong>:&nbsp;Means:&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Normal&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Fertility Assistance</td>
					<td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Type (specify):</td>
				</tr>
				<tr>
					<td height="15" colspan="2" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Post-Surgery if <strong>NO</strong>:<img src="../../Images/shim.gif" border="0" width="4" height="1">Have you and your partner attempted?</td>
				</tr>
			</table>
		</td>
	</tr>
    <tr> 
      <td align="center" class="FormOuterTableRow">
	  <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="left" valign="top" class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Other Treatments</span> (Radiation Therapy, Surgery) 
              <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr> 
                  <td colspan="1" align="center" class="FormInsideTableTopLeftCell">Start Date</td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">TX<br/><img src="../../Images/shim.gif" border="0" width="32" height="1"></td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">Notes Protocol #)</td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>
                <tr> 
                  <td height="16" class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="16" class="FormInsideTableLeftCell">&nbsp;</td>
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
      <td class="FormOuterTableRow">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td class="FormInnerRowBottomBorder" ><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Serum Tumor Markers</span> </td>
          </tr>
          <tr  id="LabTestsTrendViewPopTableRow" runat="server"> 
            <td>
				<table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
                <tr> 
                  <td width="13%" align="center" class="FormInsideTableRegCell"><strong>Test</strong></td>
                  <asp:Repeater ID="LabTestsTrendViewDates" runat="server"> 
                    <ItemTemplate> 
                      <td width="11%" height="12" class="FormInsideTableRegCell" align="center"><strong> 
                        <%# DataBinder.Eval(Container.DataItem, "LabDates") %>
                        </strong></td>
                    </ItemTemplate>
                  </asp:Repeater>
                  <td width="13%" align="left" class="FormInsideTableRegCell"><strong>Date:</strong></td>
                </tr>
                <asp:Repeater ID="LabTestsTrendView" runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td align="center" class="FormInsideTableRegCell">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[0]") %>
                        </strong>&nbsp;</td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[1]") %>
                        </strong>&nbsp;</td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[2]") %>
                        </strong>&nbsp;</td>
                      <td class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[3]") %>
                        </strong>&nbsp;</td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;<strong> 
                        <%# DataBinder.Eval(Container.DataItem, "[4]") %>
                        </strong>&nbsp;</td>
                      <td  class="FormInsideTableRegCell" align="center">&nbsp;</td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
          </tr>
          <tr id="LabTestsTrendViewBlankTableRow" runat="server"> 
            <td> <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
                <tr> 
                  <td width="10%" align="center" class="FormInsideTableRegCell">Marker</td>
                  <td width="18%" class="FormInsideTableRegCell">Date:</td>
                  <td width="18%" class="FormInsideTableRegCell">Date:</td>
                  <td width="18%" class="FormInsideTableRegCell">Date:</td>
                  <td width="18%" class="FormInsideTableRegCell">Date:</td>
                  <td width="18%" class="FormInsideTableRegCell">Date:</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell"><span style="font-family: Symbol;">b</span>HCG</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">AFP</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">LDH</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
                  <td height="12" class="FormInsideTableRegCell">&nbsp;</td>
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
	<tr> 
      <td class="FormOuterTableRow" style="border-bottom: none;"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span>
	  <img src="../../Images/shim.gif" border="0" width="12" height="1"><input type="checkbox" name="Films Reviewed">Films Reviewed<br/>
        <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="19%" align="center" valign="middle" class="FormInsideTableTopCell">Target</td>
            <td width="44%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
			<td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><%= institutionShortName%></td>
          </tr>
		  </table>
	</td>
	</tr>
          <asp:Repeater ID="images" runat="server"> 
            <ItemTemplate> 
			<tr><td  class="FormOuterTableRow" style="border-bottom: none;">
			<table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">	
              <tr> 
                <td  width="12%" height="18"  align="center" class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxDateText") %></strong></td>
                <td width="15%" class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxType") %></strong></td>
                <td width="19%" class="FormInsideTableRegCell"><strong><%# DataBinder.Eval(Container.DataItem, "DxTarget") %>&nbsp;</strong></td>
                <td width="44%" class="FormInsideTableRegCell">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxResult") %></strong> <%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
				<td width="10%" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Yes&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">No</td>
              </tr>
			  </table>
			  </td></tr>
            </ItemTemplate>
          </asp:Repeater>

    <tr> 
      <td class="FormOuterTableRow" style="border-top: solid 1px #000000;"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="50%" valign="top">
			 <table width="100%" border="0" cellspacing="0" cellpadding="1">
                <tr> 
                  <td width="40%"><span class="blackBoldText">&nbsp;&nbsp;&nbsp;&nbsp;Relapse<br/></span></td>
                  <td width="18%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Yes</td>
                  <td width="42%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">No</td>
                </tr>
                <tr> 
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;Late Relapse</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Yes</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">No</td>
                </tr>
                <tr> 
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;Date:</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Elevated Markers</td>
                  <td colspan="2" align="left"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Failed Surveillance</td>
                </tr>
                <tr> 
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;Infield Recurrence</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Yes </td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">No</td>
                </tr>
              </table>
			</td>
            <td width="50%" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="1">
                <tr> 
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="8%"><strong>Site</strong></td>
                  <td width="42%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> Retroperitoneum</td>
                  <td width="42%"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> Liver</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> Retrocrural</td>
                  <td ><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> Mediastinum</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> Lung</td>
                  <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"> Brain</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table>
			  </td>
          </tr>
        </table>
		</td>
    </tr>
<!--    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Imaging</span><span><img src="../../Images/shim.gif" border="0" width="15" height="1"> 
        <input type="checkbox" name="Films Reviewed">
        Films Reviewed<img src="../../Images/shim.gif" border="0" width="18" height="8"> 
        <input type="checkbox" name="Compared to Past">
        Compared to Past<img src="../../Images/shim.gif" border="0" width="18" height="1"> 
        <input type="checkbox" name="Reviewed with Radiologist">
        Reviewed with Radiologist<img src="../../Images/shim.gif" border="0" width="18" height="1"> 
        <input type="checkbox" name="Digitized">
        Digitized<br/>
        </span> <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="70" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
            <td width="70" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
            <td width="310" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
            <td width="200" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <tr> 
            <td height="25" class="FormInsideTableLeftCell">&nbsp;</td>
            <td align="center" valign="top" class="FormInsideTableRegCell"><br/>
              CXR</td>
            <td class="FormInsideTableRegCell"> <asp:Repeater ID="XRayChest" runat="server"> 
                <ItemTemplate> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxTarget") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxSide") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                  &nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                  </strong> <br/>
                </ItemTemplate>
              </asp:Repeater> <table width="100%" border="0" cellspacing="0" cellpadding="1" id="BlankCXRTable" runat="server">
                <tr> 
                  <td class="FormInsideTableTopLeftCell">Site</td>
                  <td class="FormInsideTableTopCell">Side</td>
                  <td class="FormInsideTableTopCell" width="70">Size</td>
                  <td class="FormInsideTableTopCell"  width="70">Nodes</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Normal</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Lung</td>
                  <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Left&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Right</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Mediastinal</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="25" class="FormInsideTableLeftCell">&nbsp;</td>
            <td align="center" valign="top" class="FormInsideTableRegCell">Scrotal 
              U/S</td>
            <td valign="top" class="FormInsideTableRegCell"> <asp:Repeater ID="ScrotalUS" runat="server"> 
                <ItemTemplate> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxType") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxTarget") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxSide") %>
                  </strong> &nbsp;<strong> 
                  <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
                  &nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
                  </strong> <br/>
                </ItemTemplate>
              </asp:Repeater> <table width="100%" border="0" cellspacing="0" cellpadding="1" id="BlankScrotalUSTable" runat="server">
                <tr> 
                  <td colspan="3"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Microlithiasis &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
                    Macrolithiasis &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Heterogeneity</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableTopLeftCell">Side</td>
                  <td class="FormInsideTableTopCell" width="70">Size</td>
                  <td class="FormInsideTableTopCell"  width="70">Nodes</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Left&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Right</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Left&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Right</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table width="650" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td> <asp:Repeater ID="CTChest" runat="server"> 
                <HeaderTemplate> <span class="blackBoldText">Chest CT</span><br/>
                  <br/>
                </HeaderTemplate>
                <ItemTemplate> <strong> 
                  <%--<%# DataBinder.Eval(Container.DataItem, "DxDateText") %>--%>
                  </strong> &nbsp;<strong> 
                  <%--<%# DataBinder.Eval(Container.DataItem, "DxType") %>--%>
                  </strong> &nbsp;<strong> 
                  <%--<%# DataBinder.Eval(Container.DataItem, "DxTarget") %>--%>
                  </strong> &nbsp;<strong> 
                  <%--<%# DataBinder.Eval(Container.DataItem, "DxSide") %>--%>
                  </strong> &nbsp;<strong> 
                  <%--<%# DataBinder.Eval(Container.DataItem, "DxResult") %>--%>
                  &nbsp; 
                  <%--<%# DataBinder.Eval(Container.DataItem, "DxNotes") %>--%>
                  </strong> <br/>
                </ItemTemplate>
              </asp:Repeater>
			  <table width="642" border="0" cellpadding="1" cellspacing="0" id="BlankChestCTTable" runat="server">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Chest 
                    CT</span><span><img src="../../Images/shim.gif" border="0" width="20" height="8"></span> 
                    <input type="checkbox" name="Films Reviewed24">
                    Normal</td>
                  <td colspan="2" class="FormInsideTableTopLeftCell">Date:</td>
                  <td colspan="2" class="FormInsideTableTopLeftCell">Date:</td>
                  <td colspan="2" class="FormInsideTableTopLeftCell">Date:</td>
                </tr>
                <tr> 
                  <td width="52" align="center" class="FormInsideTableLeftCell"><span>Site</span></td>
                  <td width="90" align="center" class="FormInnerRowBottomBorder">Side</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableLeftCell">Size</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableRegCell">Nodes</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableLeftCell">Size</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableRegCell">Nodes</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableLeftCell">Size</td>
                  <td width="83" align="center" valign="top" class="FormInsideTableRegCell">Nodes</td>
                </tr>
                <tr> 
                  <td rowspan="2" class="FormInsideTableLeftCell"><p>Lung</p></td>
                  <td align="center" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Left&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Right</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Left&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Right</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td rowspan="2" class="FormInsideTableLeftCell">Mediastinal</td>
                  <td align="center" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Left&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Right</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Left&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absbottom">Right</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
-->    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU10<img src="../../Images/shim.gif" border="0" width="45" height="1">U14<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ORPROC</td>
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
		<div  class="VerticalBarCodeDocType">*U14*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Testis Follow-Up Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
<!--    <tr> 
      <td class="FormOuterTableRow"> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4" id="BlankCTAbdomenPelvisTable" runat="server">
          <tr> 
            <td width="50%"><span class="blackBoldText">CT Scan (Abdomen / Pelvis)</span><br/>
			<input type="checkbox" name="Films Reviewed2">Liver Mets<img src="../../Images/shim.gif" border="0" width="6" height="1">
			<input type="checkbox" name="Compared to Past2">Other Visc. Mets<input type="checkbox" name="Reviewed with Radiologist2">Lymphocele</td>
            <td width="50%" align="left">Primary Landing Zone:<br/>
			<input type="checkbox" name="Films Reviewed22">Left: Paraaortic<img src="../../Images/shim.gif" border="0" width="6" height="1">
			<input type="checkbox" name="Compared to Past222">Interaortic
			<input type="checkbox" name="Compared to Past222">Right: Interaortocaval</td>
          </tr>
          <tr> 
            <td colspan="2">
            
            <asp:Repeater ID="CTAbdomenPelvis" runat="server"> 
          <HeaderTemplate>
          </HeaderTemplate>
          <ItemTemplate> <strong>&nbsp; 
            <%# DataBinder.Eval(Container.DataItem, "DxDateText") %>
            </strong> &nbsp;<strong> 
            <%# DataBinder.Eval(Container.DataItem, "DxType") %>
            </strong> &nbsp;<strong> 
            <%# DataBinder.Eval(Container.DataItem, "DxTarget") %>
            </strong> &nbsp;<strong> 
            <%# DataBinder.Eval(Container.DataItem, "DxSide") %>
            </strong> &nbsp;<strong> 
            <%# DataBinder.Eval(Container.DataItem, "DxResult") %>
            &nbsp; 
            <%# DataBinder.Eval(Container.DataItem, "DxNotes") %>
            </strong> <br/>
          </ItemTemplate>
          <FooterTemplate><br/></FooterTemplate>
        </asp:Repeater>
            
				<table width="642" border="0" cellpadding="1" cellspacing="0">
                <tr> 
                  <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td colspan="10" align="center" class="FormInsideTableTopLeftCell">Size (cm)</td>
                </tr>
                <tr> 
                  <td width="112" align="center" class="FormInsideTableLeftCell"><span>Site</span></td>
                  <td width="30" align="center" class="FormInnerRowBottomBorder">No Mass</td>
                  <td width="64" align="center" valign="top" class="FormInsideTableLeftCell">Date:</td>
                  <td width="30" align="center" class="FormInsideTableRegCell">No Mass</td>
                  <td width="64" align="center" valign="top" class="FormInsideTableRegCell">Date:</td>
                  <td width="30" align="center" class="FormInsideTableRegCell">No Mass</td>
                  <td width="64" align="center" valign="top" class="FormInsideTableRegCell">Date:</td>
                  <td width="30" align="center" class="FormInsideTableRegCell">No Mass</td>
                  <td width="64" align="center" valign="top" class="FormInsideTableRegCell">Date:</td>
                  <td width="30" align="center" class="FormInsideTableRegCell">No Mass</td>
                  <td width="64" align="center" valign="top" class="FormInsideTableRegCell">Date:</td>
                  <td width="30" align="center" class="FormInsideTableRegCell">No Mass</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell"><p>Largest mass on CT<br/>(longest dimension)</p></td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Precaval</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Paracaval</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Para-aortic</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Preaortic</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Interaortocaval</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Interiliac / Presacral</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Right iliac</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Left iliac</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Right hilar</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Left hilar</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Right retrocrural</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Left retrocrural</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="10" class="FormInsideTableLeftCell">Inguinal</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                  <td class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="12" class="FormInsideTableLeftCell">Notes:</td>
                </tr>
              </table>
			 </td>
          </tr>
        </table>
		</td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
      	<table width="650" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="325" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="14">Brain Imaging</span><br/>
			<asp:Repeater ID="BrainScan" runat="server">
			<HeaderTemplate>
			<br/>
			</HeaderTemplate>
			<ItemTemplate>
			<strong>&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></strong>
			&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxType") %></strong>
            &nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxTarget") %></strong>
            &nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxSide") %></strong>
            &nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxResult") %>
            &nbsp;<%# DataBinder.Eval(Container.DataItem, "DxNotes") %></strong>
			<br/>
			</ItemTemplate>
			</asp:Repeater>
              <table width="100%" border="0" cellspacing="0" cellpadding="2" id="BlankBrainScanTable" runat="server">
                <tr align="center"> 
                  <td align="left" class="FormInsideTableTopCell">Date:</td>
                  <td align="left" class="FormInsideTableTopCell">Date:</td>
                  <td align="left" class="FormInsideTableTopCell">Date:</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableRegCell" align="center" valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Normal&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Mets</td>
                  <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Normal&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Mets</td>
                  <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Normal&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Mets</td>
                </tr>
              </table>
			 </td>
            <td width="325" valign="top" class="FormInnerRowRightBorder"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="14">PET Scan</span><br/>             
			<asp:Repeater ID="PETScan" runat="server">
			<HeaderTemplate>
			<br/>
			</HeaderTemplate>
			<ItemTemplate>
			<strong>&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></strong>
			&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxType") %></strong>
            &nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxTarget") %></strong>
            &nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxSide") %></strong>
            &nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxResult") %>
            &nbsp;<%# DataBinder.Eval(Container.DataItem, "DxNotes") %></strong>
			<br/>
			</ItemTemplate>
			</asp:Repeater>
              <table width="100%" border="0" cellspacing="0" cellpadding="2" id="BlankPETScanTable" runat="server">
                <tr align="center"> 
                  <td align="left" class="FormInsideTableTopCell">Date</td>
                  <td align="left" class="FormInsideTableTopCell">Date</td>
                  <td align="left" class="FormInsideTableTopCell">Date</td>
                </tr>
                <tr> 
                  <td class="FormInsideTableRegCell" align="center" valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Normal&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Mets</td>
                  <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Normal&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Mets</td>
                  <td class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Normal&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1">&nbsp;&nbsp;Mets</td>
                </tr>
              </table>
			 </td>
          </tr>
        </table>
		</td>
    </tr>
-->    
	<tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Review of Systems</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">
	  Clinician Performing Review: 
        <input type="checkbox" name="PA22" value="Yes">NP / PA&nbsp;&nbsp;&nbsp; 
		<input type="checkbox" name="Fellow2" value="Yes">Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending2" value="Yes">Attending</span><br/>
		 <table border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="80" align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td width="120" align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Not Present</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
            <td width="60" align="center" class="FormInsideTableTopCell"><strong>Disease Related </strong></td>
            <td width="310" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">General</td>
            <td align="left" class="FormInsideTableRegCell">Fever</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Eyes</td>
            <td align="left" class="FormInsideTableRegCell">Visual Problems</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Respiratory</td>
            <td align="left" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Shortness of Breath</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hemoptysis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">GI</td>
            <td align="left" class="FormInsideTableRegCell">Nausea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="4" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Abdominal Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Rectal Bleeding</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">GU</td>
            <td align="left" class="FormInsideTableRegCell">Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Erectile Dysfunction</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Psych</td>
            <td align="left" class="FormInsideTableRegCell">Anxiety / Depression</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Heme</td>
            <td align="left" class="FormInsideTableRegCell">Anemia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Neuro</td>
            <td align="left" class="FormInsideTableRegCell">Headaches</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Focal Weakness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Endo</td>
            <td align="left" class="FormInsideTableRegCell">Hot Flashes</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="7" align="left" valign="top" class="FormInsideTableLeftCell">Other:</td>
          </tr>
        </table>
		</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="20" class="FormOuterTableRow">&nbsp; <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes"> 
        <span class="blackBoldText">PFSH and ROS performed by: _____________________________________ </span></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU10<img src="../../Images/shim.gif" border="0" width="45" height="1">U14<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ORPROC</td>
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
		<div  class="VerticalBarCodeDocType">*U14*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Testis Follow-Up Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Initial Exam: 
        <input type="checkbox" name="NP2" value="Yes">
        NP / PA&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow2" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending2" value="Yes">
        Attending</span> <br/> 
        <table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr> 
            <td width="80" align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal Findings</strong></td>
            <td width="46" align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td width="10%" align="center" class="FormInsideTableTopCell"><strong>Attnd<br/>Performed</strong></td>
            <td width="58%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Gen</td>
            <td width="32%" align="left" class="FormInnerRowBottomBorder">Well Developed / Well Nourished </td>
            <td width="46" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td width="300" rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Acute Distress</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Alert &amp; Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Nodes</td>
            <td align="left" class="FormInnerRowBottomBorder"> Cervical</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> Supraclavicular</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Groin </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Resp.</td>
            <td align="left" class="FormInnerRowBottomBorder">Clear to Percussion<br/>
              and Auscultation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">C/V</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Regular Rate &amp; 
              Rhythm</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Murmurs</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Abdomen</td>
            <td align="left" class="FormInnerRowBottomBorder">Soft Non-tender 
            </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Ascites</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableLeftCell">Testes</td>
            <td align="left" class="FormInnerRowBottomBorder">No Tenderness or 
              Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Size</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Hydrocele</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Varicocele</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Scrotal Wall</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">M/S</td>
            <td align="left" class="FormInnerRowBottomBorder">  No Cord</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> No Leg Swelling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Pedal Pulses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Neuro</td>
            <td align="left" class="FormInnerRowBottomBorder"> Normal Motor Function</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Sensation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Breast&nbsp;</td>
            <td align="left" class="FormInnerRowBottomBorder">No Gynecomastia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInnerRowBottomBorder">No Nipple Tenderness 
              / Discharge</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" class="FormInsideTableLeftCell">Others<br/></td>
            <td align="left" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU10<img src="../../Images/shim.gif" border="0" width="45" height="8">U14<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ORPROC</td>
    </tr>
  </table>
</div>





<div  align="left"  style="page-break-after:always;"  id="LastPageInForm" runat="server" ><%--align="left"--%>

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U14*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Testis Follow-Up Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="1">
          <tr> 
            <td width="23%" height="21"><span class="blackBoldText">2002 Clinical TNM Stage</span></td>
            <td width="4%"><strong>I</strong></td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">A</td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">B</td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">S</td>
          </tr>
          <tr> 
            <td rowspan="2">&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Pending Data</td>
            <td><strong>II</strong></td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">A (&lt;2cm)</td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">B (2-5 cm)</td>
            <td height="21"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">C (&gt; 5cm)</td>
          </tr>
          <tr> 
            <td><strong>III</strong></td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Bone / Liver</td>
            <td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Lung</td>
            <td height="21"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Mediastinum 
              <img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Supraclavicular 
              <img src="../../Images/shim.gif" border="0" width="20" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">Combination</td>
          </tr>
		  <tr>
		  	<td>&nbsp;</td>
			<td colspan="4"><strong>&nbsp;&nbsp;Circle:&nbsp;&nbsp;&nbsp;S1<span><img src="../../Images/shim.gif" border="0" width="30" height="8">S2<img src="../../Images/shim.gif" border="0" width="30" height="8">S3</span></strong></td>
		  </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td height="45" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="8" height="15"><span class="blackBoldText">Disease 
        State</span><img src="../../Images/shim.gif" border="0" width="26" height="8"> 
        <input type="checkbox" name="NED"/>
        NED<img src="../../Images/shim.gif" border="0" width="26" height="8"> <input type="checkbox" name="AWD"/>
        AWD<img src="../../Images/shim.gif" border="0" width="26" height="8"> <input type="checkbox" name="AS"/>
        Active Surveillance<img src="../../Images/shim.gif" border="0" width="60" height="8">Date:</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
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
            <td height="35" valign="top" class="FormInsideTableRegCell">1.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"> 
              <input name="diagnosisNew1" type="checkbox" id="diagnosisNew1"></td>
            <td valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"><strong>Review 
              Pathology</strong></td>
          </tr>
          <tr> 
            <td height="35" valign="top" class="FormInsideTableRegCell">2.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew12" type="checkbox" id="diagnosisNew12"></td>
            <td valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"><strong>CXR:</strong><br/> 
              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">STM<img src="../../Images/shim.gif" border="0" width="22" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">AFP<img src="../../Images/shim.gif" border="0" width="22" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">HCG<img src="../../Images/shim.gif" border="0" width="22" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">LDH</td>
          </tr>
          <tr> 
            <td height="35" valign="top" class="FormInsideTableRegCell">3.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew2" type="checkbox" id="diagnosisNew2"></td>
            <td valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle"><strong>CT:</strong><br/> 
              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">C<img src="../../Images/shim.gif" border="0" width="22" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">A<img src="../../Images/shim.gif" border="0" width="22" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="2" align="absmiddle">P</td>
          </tr>
          <tr> 
            <td height="35" valign="top" class="FormInnerRowRightBorder">4.</td>
            <td align="center" valign="middle" class="FormInnerRowRightBorder"> 
              <input name="diagnosisNew3" type="checkbox" id="diagnosisNew3"></td>
            <td>&nbsp;</td>
          </tr>
          <!--<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">4.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">5.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">6.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
 					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">7.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">8.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">9.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">10.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr> -->
        </table></td>
    </tr>
    <tr> 
      <td height="40" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Comments</span></td>
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
      <td class="FormOuterTableRow"><table class="pageWidth" align="center" border="0" cellpadding="4" cellspacing="0">
          <tr>
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Disposition</span></td>
          </tr>
          <tr>
            <td width="69%" align="center" class="FormInnerRowRightBorder"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="100" height="18">Prescriptions:</td>
                  <td width="80" align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1" />Yes:</td>
                  <td>Refill &nbsp;&nbsp;or &nbsp;&nbsp;New</td>
                </tr>
                <tr>
                  <td height="18" colspan="3">Rx: __________________________________________________________</td>
                </tr>
                <tr>
                  <td height="18" colspan="3">Rx: __________________________________________________________</td>
                </tr>
                <tr>
                  <td height="17">Chemo Orders:</td>
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
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22"> 
              &#8805; 50% of attending time was spent in counseling <br/> <img src="../../Images/shim.gif" border="0" width="1" height="15"> 
              If so, mark total attending time in minutes &amp; describe on right:<br/> 
              <img src="../../Images/shim.gif" border="0" width="30" height="12"> 
              <input type="checkbox" name="15-24 (3)2">
              15-24 (3) &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="25-39 (4)2">
              25-39 (4) &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="40+ (5)2">
              40+ (5)</td>
            <td width="50%" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="1" height="11">Describe 
              Counseling or Dictate Note:</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="22" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5            </td>
            <td width="50%" rowspan="2">Copy to:&nbsp;&nbsp;&nbsp; <input name="fellow222" type="checkbox" id="fellow223">
              referring M.D.: ________________________<br/> <img src="../../Images/shim.gif" border="0" width="50" height="1"> 
              <input name="fellow2222" type="checkbox" id="fellow2222">
              other: _______________________________</td>
          </tr>
          <tr> 
            <td height="22" class="FormInnerRowRightBorder">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ 
              Resident<img src="../../Images/shim.gif" border="0" width="30" height="1">Attending</td>
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
            <td colspan="4"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Attending 
              Addendum:&nbsp;&nbsp;&nbsp;____________________________________________________________________<br />
            </span></td>
          </tr>
          <tr>
            <td colspan="4"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="136" height="1" />____________________________________________________________________</span></td>
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
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU10<img src="../../Images/shim.gif" border="0" width="45" height="1">U14<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">5</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ORPROC</td>
    </tr>
  </table>
</div>


</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>