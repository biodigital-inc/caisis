<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.UroSurveyProstateQOL_Regional" CodeFile="UroSurveyProstateQOL_Regional.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>




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
            Urology Prostate QOL Survey</span><br />
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
      <td valign="top" class="FormOuterTableRow" style="border-bottom: none;"> 
		<table class="pageWidth"border="0" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="3%">&nbsp;</td>
            <td width="94%" height="20">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td> <span class="SurveyTitle">PROSTATE QUALITY OF LIFE SURVEY: SEXUAL DOMAIN</span><br/>
              These questions are about your sexual function. This includes foreplay, masturbation, intercourse with partner,<br/>
			  and other forms of sexual activity during the last four weeks.
<br/><br/><br/> <strong>Circle 
              ONE number for each question.<br/>
              </strong> <br/><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top"> 
                  <td width="3%"><strong>1.</strong></td>
                  <td width="41%"><strong>During the last four (4) weeks, how often did you take a pill like Viagra?</strong><br/> 
                    <br/> <table width="90%" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top"> 
                        <td width="30" height="20">1</td>
                        <td>Never</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">2</td>
                        <td>Sometimes (less than once a week)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">3</td>
                        <td>Regularly (once or twice a week)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">4</td>
                        <td>Routinely (every day or nearly every day)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">5</td>
                        <td>More than once a day</td>
                      </tr>
                    </table></td>
                  <td>&nbsp;</td>
                  <td width="3%"><strong>5.</strong></td>
                  <td width="41%"><strong>When you attempted sexual intercourse, how often were you able to penetrate (enter) your partner?</strong><br/> 
                    <br/>
                    <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top">
                        <td width="30" height="20">1</td>
                        <td>No sexual activity</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">2</td>
                        <td>Almost never / never</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">3</td>
                        <td>A few times (less than half of the time)</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">4</td>
                        <td>Sometimes (about half of the time)</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">5</td>
                        <td>Most times (more than half of the time)</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">6</td>
                        <td>Almost always / always</td>
                      </tr>
                    </table></td>
                </tr>
                <tr valign="top"> 
                  <td height="40" colspan="5">&nbsp;</td>
                </tr>
                <tr valign="top"> 
                  <td><strong>2.</strong></td>
                  <td width="41%"><strong>Rate your confidence that you could get and keep an erection:</strong><br/> <br/> <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top"> 
                        <td width="30" height="20">1</td>
                        <td>Very Poor</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">2</td>
                        <td>Poor</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">3</td>
                        <td>Fair</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">4</td>
                        <td>Good</td>
                      </tr>
					  <tr valign="top"> 
                        <td height="20">5</td>
                        <td>Very Good</td>
                      </tr>
                    </table></td>
                  <td>&nbsp;</td>
                  <td width="3%"><strong>6.</strong></td>
                  <td width="41%"><strong>During sexual intercourse, how often were you able to maintain your erection after you had penetrated your partner?</strong><br/> 
                    <br/> <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top"> 
                        <td width="30" height="20">1</td>
                        <td>Did not attempt intercourse</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">2</td>
                        <td>Almost never / never</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">3</td>
                        <td>A few times (less than half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">4</td>
                        <td>Sometimes (about half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">5</td>
                        <td>Most times (more than half of the time)</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="20">6</td>
                        <td>Almost always / always</td>
                      </tr>
                    </table></td>
                </tr>
              </table>
             </td>
            <td>&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td height="20" colspan="3">&nbsp;</td>
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
            <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                
                <tr valign="top"> 
                  <td width="3%"><strong>3.</strong></td>
                  <td width="41%"><strong>How often were you able to get an erection during sexual activity?</strong><br/> <br/>
                    <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top">
                        <td width="30" height="20">1</td>
                        <td>No sexual activity</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">2</td>
                        <td>Almost never / never</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">3</td>
                        <td>A few times (less than half of the time)</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">4</td>
                        <td>Sometimes (about half of the time)</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">5</td>
                        <td>Most times (more than half of the time)</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">6</td>
                        <td>Almost always / always</td>
                      </tr>
                    </table></td>
                  <td>&nbsp;</td>
                  <td width="3%"><strong>7.</strong></td>
                  <td width="41%"><strong>During sexual intercourse, how difficult was it to maintain your erection to complete intercourse?</strong><br/> <br/>
                    <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top">
                        <td width="30" height="20">1</td>
                        <td>Did not attempt intercourse</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">2</td>
                        <td>Extremely difficult</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">3</td>
                        <td>Very difficult</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">4</td>
                        <td>Difficult</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">5</td>
                        <td>Slightly difficult</td>
                      </tr>
                      <tr valign="top">
                        <td height="20">6</td>
                        <td>Not difficult</td>
                      </tr>
                    </table></td>
                </tr>
                <tr valign="top"> 
                  <td height="40" colspan="5">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>4.</strong></td>
                  <td><strong>When you had erections with sexual stimulation, how often were your erections hard enough for penetration (entering your partner)?</strong><br/>
                      <br/>
                      <table  width="83%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="30" height="20">1</td>
                          <td>No sexual activity</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">2</td>
                          <td>Almost never / never</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">3</td>
                          <td>A few times (less than half of the time)</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">4</td>
                          <td>Sometimes (about half of the time)</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">5</td>
                          <td>Most times (more than half of the time)</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">6</td>
                          <td>Almost always / always</td>
                        </tr>
                    </table></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table>
             </td>
            <td>&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td height="30" colspan="3">&nbsp;</td>
          </tr>
        </table>
       </td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU20<img src="../../Images/shim.gif" border="0" width="45" height="1">U24<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/26/09<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">20</span></td>
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
            Urology Prostate QOL Survey</span><br />
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
            <td> <span class="SurveyTitle">PROSTATE QUALITY OF LIFE SURVEY: URINARY DOMAIN</span><br/>
              These questions are about your urinary function.<br/> 
              <br/><br/> <strong>Circle 
              ONE number for each question.<br/>
              </strong> <br/><br/>
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top">
                  <td width="3%"><strong>1.</strong></td>
                  <td width="41%"><strong>How many pads or adult diapers per 24-hour period did you use to control urine leakage during the last week?</strong><br/>
                      <br/>
                      <table width="83%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="30" height="20">1</td>
                          <td>None (or no leakage)</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">2</td>
                          <td>An occasional pad or protective material</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">3</td>
                          <td>1 pad per 24-hour period</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">4</td>
                          <td>2 pads per 24-hour period</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">5</td>
                          <td>3 or more pads per 24-hour period</td>
                        </tr>
						<tr valign="top">
                          <td height="20">6</td>
                          <td>Adult diaper(s)</td>
                        </tr>
                    </table></td>
                  <td>&nbsp;</td>
                  <td width="3%"><strong>4.</strong></td>
                  <td width="41%"><strong>In the past week, how often have you had to urinate again less than two hours after you finished urinating?</strong><br/>
                      <br/>
                      <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="30" height="20">1</td>
                          <td>None of the time or rarely</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">2</td>
                          <td>Less than half the time</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">3</td>
                          <td>About half the time</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">4</td>
                          <td>More than half the time</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">5</td>
                          <td>Almost always</td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="5">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>2.</strong></td>
                  <td width="41%"><strong>In the past week, have you dripped or leaked urine when you had the urge to urinate, before you could get to the bathroom?</strong><br/>
                      <br/>
                      <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="30" height="20">1</td>
                          <td>Rarely or not at all</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">2</td>
                          <td>About once a week</td>
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
                  <td width="3%"><strong>5.</strong></td>
                  <td width="41%"><strong>Overall, how big a problem has your urinary function been for you during the last week?</strong><br/>
                      <br/>
                      <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="30" height="20">1</td>
                          <td>No problem</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">2</td>
                          <td>Very small problem</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">3</td>
                          <td>Small problem</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">4</td>
                          <td>Moderate problem</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">5</td>
                          <td>Big problem</td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="5">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>3.</strong></td>
                  <td width="41%"><strong>In the past week, when you have had the feeling you need to urinate, how often have you found it difficult to postpone urination?</strong><br/>
                      <br/>
                      <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="30" height="20">1</td>
                          <td>None of the time or rarely</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">2</td>
                          <td>Less than half the time</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">3</td>
                          <td>About half the time</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">4</td>
                          <td>More than half the time</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">5</td>
                          <td>Almost always</td>
                        </tr>
                    </table></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td width="41%">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td height="50" colspan="5">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
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
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/26/09<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">20</span></td>
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
            Urology Prostate QOL Survey</span><br />
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
      <td valign="top" class="FormOuterTableRow" style="border-bottom: none;"> 
		<table class="pageWidth"border="0" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="3%">&nbsp;</td>
            <td width="94%" height="20">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td> <span class="SurveyTitle">PROSTATE QUALITY OF LIFE SURVEY: BOWEL DOMAIN</span><br/>
              These questions are about your bowel function.<br/> 
              <br/><br/> <strong>Circle 
              ONE number for each question.<br/>
              </strong> <br/><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top">
                  <td width="3%"><strong>1.</strong></td>
                  <td width="41%"><strong>Overall, how big a problem have your bowel habits been for you during the last four (4) weeks?</strong><br/>
                      <br/>
                      <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="30" height="20">1</td>
                          <td>No problem</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">2</td>
                          <td>Very small problem</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">3</td>
                          <td>Small problem</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">4</td>
                          <td>Moderate problem</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">5</td>
                          <td>Big problem</td>
                        </tr>
                      </table></td>
                  <td>&nbsp;</td>
                  <td width="3%"><strong>2.</strong></td>
                  <td width="41%"><strong>Over the past four (4) weeks, how often have bowel problems or bowel pain made it difficult to enjoy your life?</strong><br/>
                      <br/>
                      <table width="83%"  border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="30" height="20">1</td>
                          <td>Never</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">2</td>
                          <td>Rarely</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">3</td>
                          <td>Some of  the time</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">4</td>
                          <td>Frequently</td>
                        </tr>
                        <tr valign="top">
                          <td height="20">5</td>
                          <td>Most of  the time</td>
                        </tr>
                    </table></td>
                </tr>

                <tr valign="top">
                  <td height="40" colspan="5">&nbsp;</td>
                </tr>
              </table>			  </td>
            <td>&nbsp;</td>
          </tr>
        </table>
       </td>
    </tr>
	<tr> 
      <td valign="top" class="FormOuterTableRow"> 
		<table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="3%">&nbsp;</td>
            <td width="94%" height="20">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td><span class="SurveyTitle">GENERAL HEALTH-RELATED QUALITY OF LIFE</span><br/>
			  <br/> 
			  <strong>Circle 
              ONE number for this question.<br/>
              </strong> <br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top"> 
                  <td width="3%"><strong>1.</strong></td>
                  <td><strong>Using the scale below, circle the number that best indicates how you feel about your current state of health:</strong><br/> 
                    <br />
                    <br/> <table width="50%" border="0" cellpadding="0" cellspacing="0" style="margin-left: 260px;">
                      <tr valign="top">
                        <td width="9%" height="25" valign="middle">0</td>
                        <td colspan="2" valign="middle">Very Poor Health </td>
                        </tr>
                      <tr valign="top"> 
                        <td height="25" valign="middle">1</td>
                        <td width="7%" valign="middle" style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
                        <td rowspan="4" valign="middle"><img src="../../Images/FormImages/ProstateQOLGradient1.jpg" border="0" width="40" height="95"></td>
                        </tr>
                      <tr valign="top"> 
                        <td height="25" valign="middle">2</td>
                        <td valign="middle" style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="25" valign="middle">3</td>
                        <td valign="middle" style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="25" valign="middle">4</td>
                        <td valign="middle" >&nbsp;</td>
                      </tr>
                      <tr valign="top">
                        <td height="25" valign="middle">5</td>
                        <td colspan="2" valign="middle">Average Health </td>
                        </tr>
                      <tr valign="top">
                        <td height="25" valign="middle">6</td>
                        <td valign="middle" style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
                        <td rowspan="4" valign="middle"><img src="../../Images/FormImages/ProstateQOLGradient2.jpg" border="0" width="40" height="95"></td>
                        </tr>
                      <tr valign="top">
                        <td height="25" valign="middle">7</td>
                        <td valign="middle" style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
                      </tr>
                      <tr valign="top">
                        <td height="25" valign="middle">8</td>
                        <td valign="middle" style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
                      </tr>
                      <tr valign="top">
                        <td height="25" valign="middle">9</td>
                        <td valign="middle" >&nbsp;</td>
                      </tr>
                      <tr valign="top"> 
                        <td height="25" valign="middle">10</td>
                        <td colspan="2" valign="middle">Excellent Health </td>
                        </tr>
                    </table></td>
                  </tr>
                <tr valign="top"> 
                  <td height="75" colspan="2">&nbsp;</td>
                </tr>
                <tr align="center" valign="top"> 
                  <td height="30" colspan="2"> 
                    <table width="94%" border="0" cellpadding="0" cellspacing="0" class="FormInnerTableBlackTopRow">
                      <tr> 
                        <td class="FormInnerRowBottomBorder"> <table width="100%" border="0" cellpadding="8" cellspacing="0">
                            <tr> 
                              <td colspan="3"><span class="blackBoldText">Person completing 
                                this form:&nbsp;&nbsp;&nbsp;&nbsp;</span> <input name="fellow2225" type="checkbox" id="fellow2225">
                                Patient&nbsp;&nbsp; <input name="fellow22222" type="checkbox" id="fellow22222">
                                Family Member&nbsp;&nbsp; <input name="fellow22232" type="checkbox" id="fellow22232">
                                Friend&nbsp;&nbsp; <input name="fellow22242" type="checkbox" id="fellow22242">
                                Other</td>
                              </tr>
                            <tr> 
                              <td height="45" ><span class="blackBoldText">Signature:</span>________________________________________</td>
                              <td align="right" ><span class="blackBoldText">Date:</span>____/____/____ </td>
                              <td style="white-space: nowrap;"><span class="blackBoldText">Time:</span>____:_____ <span style="font-size: 9px;">AM / PM </span></td>
                            </tr>
                            <tr>
                              <td colspan="3" style="border-top: solid 1px #000000;"><span class="blackBoldText">Reviewer:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <input name="fellow2226" type="checkbox" id="fellow2226" />
Attending&nbsp;&nbsp;
<input name="fellow22223" type="checkbox" id="fellow22223" />
Fellow&nbsp;&nbsp;
<input name="fellow22233" type="checkbox" id="fellow22233" />
PA / NP&nbsp;&nbsp;
<input name="fellow22243" type="checkbox" id="fellow22243" />
RN </td>
                            </tr>
                            <tr>
                              <td height="45" ><span class="blackBoldText">Signature:</span>________________________________________</td>
                              <td align="right" ><span class="blackBoldText">Date:</span>____/____/____ </td>
                              <td style="white-space: nowrap;"><span class="blackBoldText">Time:</span>____:_____ <span style="font-size: 9px;">AM / PM </span></td>
                            </tr>
                            
                          </table>                         </td>
                      </tr>
                    </table>                  </td>
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
        Approval Date: 6/04<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:06/26/09<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">20</span></td>
    </tr>
  </table>
</div>
</div>