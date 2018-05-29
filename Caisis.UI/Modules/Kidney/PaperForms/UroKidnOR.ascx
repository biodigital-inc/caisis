<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.PaperForms.UroKidnOR" CodeFile="UroKidnOR.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>



<asp:PlaceHolder id="PreOpFormHolder" runat="server"></asp:PlaceHolder>


<div id="PaperFormStart"  style="page-break-before: always;">

<div align="left" >

  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>

    <tr> 
      <td class="FormOuterTableTopRow">
                <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left" /><%= institutionName%><br/>
                      Urology Nephrectomy Details</span></td>
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
                            <% =patientDOB  %>
                          </td>
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
                              <% =patientPostalCode  %>
                          </td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date:<% =apptClinicDate %></span><img src="../../Images/shim.gif" border="0" width="290" height="1"><span class="blackBoldText">Case 
        Surgeon :</span></td>
    </tr>
    <tr> 
      <td valign="top"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td style="background-color: #ffffff;"><img src="../../Images/FormImages/KidneyOR_Pg1_20080502_NH.gif"  class="pageWidth" border="0"></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>




</div>

<%-- <div id="BatchPageBreak" runat="server" style="page-break-after: always; font-size: 1px; line-height: 1px;">&nbsp;</div>--%>
<div id="AdditionalLastPageInForm" runat="server" style="page-break-after: always; font-size: 1px; line-height: 1px;">&nbsp;</div>