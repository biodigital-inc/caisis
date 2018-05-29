<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Testis.PaperForms.UroSurveyPostTxTestis" CodeFile="UroSurveyPostTxTestis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


<asp:PlaceHolder id="AuthFormHolder" runat="server"></asp:PlaceHolder>

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
		<div  class="VerticalBarCodeDocType">*U45*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Post-Treatment Survey: Testis<br/></span></td>
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
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Date: <% =apptClinicDate %>
              <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>            </td>
          </tr>
        </table>       </td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> 
		<table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td> <span class="SurveyTitle">POST-TREATMENT SURVEY: Testis </span><br>
            <br>
            <br>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top"> 
                  <td width="20"><strong>1.</strong></td>
                  <td><strong>Since your testis surgery or out last contact, has your cancer recurred?</strong><br>
                    <br />
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top">
                        <td width="5%">&nbsp;</td>
                        <td width="8%" height="20">No</td>
                        <td width="12%">Yes</td>
                        <td>If Yes, please specify when.&nbsp;&nbsp;&nbsp;&nbsp;Date: _____ /  _____ /  _____</td>
                      </tr>
                    </table></td>
                </tr>
                <tr valign="top"> 
                  <td height="60" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>2.</strong></td>
                  <td><strong>Since your surgery or our last contact, have you had any other treatment for your testicular cancer,
	such as radiation therapy, chemotherapy, or surgery? 
</strong><br />
<br />
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="5%">&nbsp;</td>
                          <td width="8%" height="20">No</td>
                          <td width="12%">Yes</td>
                          <td>If Yes, please specify the type(s) of treatment and date(s) involved.</td>
                        </tr>
                        <tr valign="top">
                          <td>&nbsp;</td>
                          <td height="20">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
                            <tr>
                              <td width="33%" align="center" class="FormInsideTableTopLeftCell">Treatment</td>
                              <td width="33%" align="center" class="FormInsideTableTopCell">Start Date</td>
                              <td width="33%" align="center" class="FormInsideTableTopCell">End Date </td>
                            </tr>
                            <tr>
                              <td height="38" class="FormInsideTableLeftCell">&nbsp;</td>
                              <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
                              <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
                            </tr>
                            <tr>
                              <td height="38" class="FormInsideTableLeftCell">&nbsp;</td>
                              <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
                              <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
                            </tr>
                          </table></td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="60" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>3.</strong></td>
                  <td><strong>Since your surgery, have you had recovery of ejaculation?</strong><br />
                    <br />
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
            <td width="5%">&nbsp;</td>
            <td width="8%" height="20">No</td>
            <td width="12%">Yes</td>
            <td>If Yes, what is the approximate date:  _____ /  _____ /  _____</td>
          </tr>
          <tr valign="top">
            <td>&nbsp;</td>
            <td height="20">&nbsp;</td>
            <td>&nbsp;</td>
            <td height="30" valign="bottom">Compared to before surgery, is the amount:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Normal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Decreased</td>
          </tr>
      </table></td>
                </tr>
                <tr valign="top">
                  <td height="60" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>4.</strong></td>
                  <td><strong>A) Did you have any children before your surgery?</strong><br />
                    <br />
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="5%">&nbsp;</td>
                          <td width="8%" height="20">No</td>
                          <td width="12%">Yes</td>
                          <td>If Yes, how many __________</td>
                        </tr>
                      </table>                    </td>
                </tr>
                <tr valign="top">
                  <td height="20" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td>&nbsp;</td>
                  <td><strong>B) Did you have any children after your surgery?</strong><br />
                    <br />
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top">
                        <td width="5%">&nbsp;</td>
                        <td width="8%" height="20">No</td>
                        <td width="12%">Yes</td>
                        <td>If Yes, how many: __________</td>
                      </tr>
                      <tr valign="top">
                        <td>&nbsp;</td>
                        <td height="20">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>If Yes, it was by:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Normal Means &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fertility Assistance </td>
                      </tr>
                      <tr valign="top">
                        <td height="20" colspan="4">&nbsp;</td>
                      </tr>
                      <tr valign="top">
                        <td>&nbsp;</td>
                        <td height="20">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>If No, have you and your partner attempted:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yes</td>
                      </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="60" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>5.</strong></td>
                  <td><strong>May we contact, or continue to contact, your physician(s) to obtain copies of your medical records 
	to update our files?</strong><br />
                      <br />
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="5%">&nbsp;</td>
                          <td width="8%" height="20">No</td>
                          <td width="12%">Yes</td>
                          <td>If Yes, please sign and return the attached HIPAA Patient Authorization for Post-Treatment Survey.</td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
              </table>             </td>
            <td>&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td colspan="3">&nbsp;</td>
          </tr>
        </table>       </td>
    </tr>
    <tr >
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU40<img src="../../Images/shim.gif" border="0" width="55" height="1" />U45<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 6/11/08<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">1</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />B/02.070.<span class="blackBoldTextSmall">40</span></td>
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
		<div  class="VerticalBarCodeDocType">*U45*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Post-Treatment Survey: Testis<br/></span></td>
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
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Date: <% =apptClinicDate %>
              <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>            </td>
          </tr>
        </table>       </td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> 
		<table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td> <span class="SurveyTitle">POST-TREATMENT SURVEY: Testis </span><br>
            <br>
            <br>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top">
                  <td width="20"><strong>6.</strong></td>
                  <td><strong>Please update your current physician information in the area provided.</strong><br />
        <br />
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
            <td width="5%" valign="bottom">&nbsp;</td>
            <td width="20%" height="50" valign="bottom">Physician Name </td>
            <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr valign="top">
            <td valign="bottom">&nbsp;</td>
            <td height="50" valign="bottom">Address</td>
            <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr valign="top">
            <td valign="bottom">&nbsp;</td>
            <td height="50" valign="bottom" style="white-space:nowrap;">City/State/Postal Code </td>
            <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr valign="top">
            <td valign="bottom">&nbsp;</td>
            <td height="50" valign="bottom">Phone</td>
            <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
        </table></td>
                </tr>
                <tr valign="top">
                  <td height="60" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>7.</strong></td>
                  <td><strong>May we contact you by telephone if we have further questions about your responses? <br />
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top">
                        <td width="5%">&nbsp;</td>
                        <td width="5%" height="20" valign="bottom">No</td>
                        <td width="15%" valign="bottom">Yes</td>
                        <td width="16%" height="50" valign="bottom" style="border-bottom-color: #000000;">Phone Number </td>
                        <td width="22%" valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td valign="bottom" style="padding-left: 20px;">Work / Home </td>
                      </tr>
                      <tr valign="top">
                        <td>&nbsp;</td>
                        <td height="20" valign="bottom">&nbsp;</td>
                        <td valign="bottom">&nbsp;</td>
                        <td height="50" valign="bottom" style="white-space: nowrap;">Best Time to Call </td>
                        <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td valign="bottom">&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="60" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>8.</strong></td>
                  <td><strong>If you would prefer to receive these follow-up notices via E-MAIL and to complete the forms 
	on the Internet, kindly write your e-mail address here:<br />
                      <br />
                      <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                          <td height="20" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="20" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td colspan="2"><table width="67%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr valign="top">
                      <td height="20" align="center" style="font-style: italic;">Thank you very much for your cooperation. <br />
Please return in the enclosed, postage-paid envelope.</td>
                    </tr>
                  </table></td>
                  </tr>
                <tr valign="top"> 
                  <td height="80" colspan="2">&nbsp;</td>
                </tr>
                <tr align="center" valign="top"> 
                  <td height="30" colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                      <td align="right" valign="bottom">Reviewed By&nbsp;</td>
                      <td width="32%" height="20" valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                      <td valign="bottom">&nbsp;RN / MD </td>
                      <td align="right" valign="bottom">Date: _____ /  _____ /  _____</td>
                      <td align="right" valign="bottom">Time:___:____ <span style="font-size: 9px;">AM / PM</span></td>
                    </tr>
                  </table></td>
                </tr>
              </table>             </td>
            <td>&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td colspan="3">&nbsp;</td>
          </tr>
        </table>       </td>
    </tr>
    <tr >
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU40<img src="../../Images/shim.gif" border="0" width="55" height="1" />U45<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 6/11/08<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">2</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />B/02.070.<span class="blackBoldTextSmall">40</span></td>
    </tr>
  </table>
</div>



</div>