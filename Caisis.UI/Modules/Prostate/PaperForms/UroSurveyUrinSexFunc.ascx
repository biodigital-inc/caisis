<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.UroSurveyUrinSexFunc" CodeFile="UroSurveyUrinSexFunc.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>




<div id="NonBreakingPage">

<div id="LastPageInForm" runat="server" align="left">


<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U24*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>    <tr> 
      <td class="FormOuterTableTopRow"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
        <tr>
          <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left" /><span class="blackBoldText"><%= institutionName%><br />
            Urinary and Sexual Function<br/>
              Questionnaire</span><br />
          </td>
          <td width="50%" align="center" valign="bottom"><table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
                <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                  Identification</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Date: <% =apptClinicDate %>
              <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>
            </td>
          </tr>
        </table>
       </td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> 
		<table class="pageWidth"border="0" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="3%">&nbsp;</td>
            <td width="94%" height="20">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td> <span class="SurveyTitle">URINARY AND SEXUAL FUNCTION QUESTIONNAIRE</span><br/>
              Please answer the following questions about your urinary and sexual 
              functions over the past four (4) weeks.<br/> <br/> <strong>Circle 
              ONE number for each question.<br/>
              </strong> <br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top"> 
                  <td width="3%"><strong>1.</strong></td>
                  <td width="41%"><strong>Over the past four (4) weeks, how often 
                    have you leaked urine?</strong><br/> 
                    <br/> <table width="270" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top"> 
                        <td width="30" height="20">1</td>
                        <td width="240">Not at all</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">2</td>
                        <td>Rarely</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">3</td>
                        <td>More than once a week</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">4</td>
                        <td>About once a day</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">5</td>
                        <td>More than once a day</td>
                      </tr>
                    </table></td>
                  <td>&nbsp;</td>
                  <td width="3%"><strong>4.</strong></td>
                  <td width="41%"><strong>During the last four (4) weeks when you attempted to have erections, how often did you use a pill like viagra?</strong><br/> 
                    <br/> <table width="270" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top"> 
                        <td width="30" height="20">1</td>
                        <td width="240">No attempt at erections</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">2</td>
                        <td>Almost never / never</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">3</td>
                        <td>A few times (much less than half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">4</td>
                        <td>Sometimes (about half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">5</td>
                        <td>Most times (much more than half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">6</td>
                        <td>Almost always / always</td>
                      </tr>
                    </table></td>
                </tr>
                <tr valign="top"> 
                  <td height="20" colspan="5">&nbsp;</td>
                </tr>
                <tr valign="top"> 
                  <td><strong>2.</strong></td>
                  <td width="270"><strong>Over the past four (4) weeks, how much 
                    urine did you leak?</strong><br/> <br/> <table width="270" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top"> 
                        <td width="30" height="20">1</td>
                        <td width="240">Did not leak urine</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">2</td>
                        <td>When I leaked, it was only a few drops</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">3</td>
                        <td>When I leaked, it was less than a tablespoon</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">4</td>
                        <td>When I leaked, it was more than a tablespoon</td>
                      </tr>
                    </table></td>
                  <td>&nbsp;</td>
                  <td width="20"><strong>5.</strong></td>
                  <td width="270"><strong>During the last four (4) weeks, how 
                    often were you able to get an erection during sexual activity?</strong><br/> 
                    <br/> <table width="270" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top"> 
                        <td width="30" height="20">1</td>
                        <td width="240">No sexual activity</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">2</td>
                        <td>Almost never / never</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">3</td>
                        <td>A few times (much less than half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">4</td>
                        <td>Sometimes (about half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">5</td>
                        <td>Most times (much more than half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">6</td>
                        <td>Almost always / always</td>
                      </tr>
                    </table></td>
                </tr>
                <tr valign="top"> 
                  <td height="20" colspan="5">&nbsp;</td>
                </tr>
                <tr valign="top"> 
                  <td><strong>3.</strong></td>
                  <td width="270"><strong>How many pads or adult diapers per 24-hour 
                    period did you use to control urine leakage during the last 
                    four (4) weeks?</strong><br/> <br/> <table width="270" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top"> 
                        <td width="30" height="20">1</td>
                        <td width="240">None (or no leakage)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">2</td>
                        <td>An occasional pad or protective material</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">3</td>
                        <td>One pad per 24-hour period</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">4</td>
                        <td>Two pads per 24-hour period</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">5</td>
                        <td>Three or more pads per 24-hour period</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">6</td>
                        <td>Adult diapers</td>
                      </tr>
                    </table></td>
                  <td>&nbsp;</td>
                  <td><strong>6.</strong></td>
                  <td width="270"><strong>During the last four (4) weeks, when 
                    you had erections with sexual stimulation, how often were 
                    your erections hard enough for penetration (entering your 
                    partner)?</strong><br/> <br/> <table width="270" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top"> 
                        <td width="30" height="20">1</td>
                        <td width="240">No sexual activity</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">2</td>
                        <td>Almost never / never</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">3</td>
                        <td>A few times (much less than half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">4</td>
                        <td>Sometimes (about half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">5</td>
                        <td>Most times (much more than half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">6</td>
                        <td>Almost always / always</td>
                      </tr>
                    </table></td>
                </tr>
                <tr valign="top"> 
                  <td height="20" colspan="5">&nbsp;</td>
                </tr>
                <tr align="center" valign="top"> 
                  <td height="30" colspan="5"> 
                    <table width="94%" border="0" cellpadding="0" cellspacing="0" class="FormInnerTableBlackTopRow">
                      <tr> 
                        <td class="FormInnerRowBottomBorder"> <table width="100%" border="0" cellpadding="8" cellspacing="0">
                            <tr> 
                              <td><span class="blackBoldText">Person completing 
                                this form:&nbsp;&nbsp;&nbsp;&nbsp;</span> <input name="fellow2225" type="checkbox" id="fellow2225">
                                Patient&nbsp;&nbsp; <input name="fellow22222" type="checkbox" id="fellow22222">
                                Family Member&nbsp;&nbsp; <input name="fellow22232" type="checkbox" id="fellow22232">
                                Friend&nbsp;&nbsp; <input name="fellow22242" type="checkbox" id="fellow22242">
                                Other</td>
                            </tr>
                            <tr> 
                              <td height="25" valign="bottom" class="blackBoldText"><span class="blackBoldText">Signature: 
                                _______________________________________________________________</span><br/><br/></td>
                            </tr>
                          </table>
                         </td>
                      </tr>
                      <tr> 
                        <td> 
							<table width="100%" border="0" cellpadding="8" cellspacing="0">
                            <tr> 
                              <td><span class="blackBoldText"><br/>
                                Reviewer:&nbsp;&nbsp;&nbsp;&nbsp;</span> <input name="fellow222" type="checkbox" id="fellow222">
                                Attending&nbsp;&nbsp; <input name="fellow2222" type="checkbox" id="fellow2222">
                                Fellow&nbsp;&nbsp; <input name="fellow2223" type="checkbox" id="fellow2223">
                                PA / NP&nbsp;&nbsp; <input name="fellow2224" type="checkbox" id="fellow2224">
                                RN </td>
                            </tr>
                            <tr> 
                              <td height="25" valign="bottom" class="blackBoldText"><span class="blackBoldText">Signature: 
                                _______________________________________________________________</span> 
                              </td>
                            </tr>
                          </table>
                         </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
             </td>
            <td>&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td colspan="3">&nbsp;</td>
          </tr>
        </table>
       </td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU20<img src="../../Images/shim.gif" border="0" width="45" height="1">U24<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:01/03/05<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        1 of 1<img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">20</span></td>
    </tr>
  </table>
</div>


</div>