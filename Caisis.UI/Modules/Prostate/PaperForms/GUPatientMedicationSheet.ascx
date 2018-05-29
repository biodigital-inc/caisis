<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.GUPatientMedicationSheet" CodeFile="GUPatientMedicationSheet.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


<div id="PaperFormStart">


<div   align="left" id="LastPageInForm" runat="server">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*F69*</div>
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
			Home Medication List – GU/Urology<br/></span></td>
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
      <td  height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow" valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="30%" height="22" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">Medications</span></td>
            <td width="35%" align="right">&nbsp;<%--Last GnRH: ____\____\____--%></td>
            <td width="35%" align="right">&nbsp;<%--Last Bisphosphonate: ____\____\____&nbsp;&nbsp;--%></td>
          </tr>
          <tr>
            <td colspan="3" valign="top"><table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                  <td   align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; width: 23%;">Agent</td>
                  <td align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; width: 10%;">Dose</td>
                  <td   align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; width: 11%;">Schedule</td>
                  <td  align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; width: 23%;">Indication</td>
                  <td   align="center" valign="middle" class="FormInsideTableTopLeftCell" style="font-weight: bold; width: 11%;">Route</td>
                  <td   align="center" valign="middle" class="FormInsideTableTopLeftCell" style="font-weight: bold; width: 11%;">Start Date</td>
                  <td   align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; width: 11%;">End Date</td>
                </tr>
				</table>
			</td>
          </tr>
      </table>
	  </td>
    </tr>
	
<asp:Repeater ID="AdditionalGUMedicationSection" runat="server">
                  <ItemTemplate>	
<tr>
      <td class="FormOuterTableRow" style="border-bottom: none;" valign="top" >
	  				<table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                    <tr>
                      <td class="FormInsideTableRegCell" valign="top"  style="width: 23%; height: 28px;">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "Medication") %></strong></td>
                      <td class="FormInsideTableRegCell" valign="top"  style="width: 10%;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDose") %> <%# DataBinder.Eval(Container.DataItem, "MedUnits") %></td>
                      <td class="FormInsideTableRegCell" valign="top"  style="width: 11%;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedSchedule") %></td>
                      <td class="FormInsideTableRegCell" valign="top" style="width: 23%;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedIndication") %></td>
                      <td class="FormInsideTableRegCell" valign="top"  style="width: 11%;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedRoute") %></td>
                      <td class="FormInsideTableRegCell" valign="top" style="width: 11%; text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDateText") %></td>
                      <td class="FormInsideTableRegCell" valign="top" style="width: 11%; text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedStopDateText") %></td>
                    </tr>
                  
            </table>
		</td>
    </tr>
</ItemTemplate>
                </asp:Repeater>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td><span class="blackBoldText">Signatures</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="3"><table width="100%" cellpadding="0" cellspacing="0"  class="FormInnerTableBlackTopRow">
                <tr>
                  <td style="padding:8px;">I have reviewed  and verified the accuracy of the information above regarding my medications.<br/>
                    <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="30" /> Patient: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
		  <tr align="center">
            <td colspan="3"><table width="100%" cellpadding="0" cellspacing="0"  class="FormInnerTableBlackTopRow">
                <tr>
                  <td style="padding:8px;"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="30" /> Clinician: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU44<img src="../../Images/shim.gif" border="0" width="45" height="1">F69<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 12/09<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:11/18/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">1</span><img src="../../Images/shim.gif" border="0" width="45" height="1">HMEDSL</td>
    </tr>

    </table>

</div>

</div>
