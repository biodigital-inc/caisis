<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.PaperForms.UroSurveyHematuria" CodeFile="UroSurveyHematuria.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


<asp:PlaceHolder id="AuthFormHolder" runat="server"></asp:PlaceHolder>

<div id="PaperFormStart">


<style type="text/css">
.HematuriaQuestionnaireTable
{
	width: 100%;
	border: solid 1px #000000;
	border-collapse: collapse;
	margin-top: 10px;
}
.HematuriaQuestionnaireTable td
{
	border: solid 1px #000000;
}
.HematuriaQuestionnaireTable th
{
	border: solid 1px #000000;
	font-weight: bold;
}
</style>

<div align="left"  style="page-break-after:always;">

<div style="display: none;">
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U50*</div>
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
              Urothelial Baseline Questionnaire</span><br/>
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
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Date: <% =apptClinicDate %>
              <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>            </td>
          </tr>
        </table>       </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="14">
          <tr> 
            <td style="height: 1000px; vertical-align: top; font-size: 17px; padding: 60px 60px 0px 60px;"><p>This questionnaire, given to you at the time of your visit to medical oncology or urology clinic, is intended to collect baseline information on a variety of important topics relating to urothelial cancer (cancers of the bladder, renal pelvis, and ureter). 
              
              </p>
              <p>In addition to the baseline information that will be collected with this questionnaire, you will be asked to fill out a second questionnaire, requesting details about your family history.                </p>
              <p>Please note that all of the information you share with us is confidential.  We sincerely appreciate the time you take to answer these
questions. Thank you very much.
                <style type="text/css">
			  .InstructionsTable { width: 60%; margin: 70px auto 0px auto; }
			  .InstructionsTable td {font-weight: bold; font-size: 17px; padding: 5px 0px 5px 0px;}
			    </style>
                </p>
              <table align="center" border="0" cellpadding="0" cellspacing="0" class="FormInnerTableBlackTopRow InstructionsTable">
                <tr > 
                  <td height="30" colspan="6" align="center" class="blackBoldTextLarge">INSTRUCTIONS</td>
                </tr>
                <tr > 
                  <td width="2%" >&nbsp;</td>
                  <td width="6%">1.</td>
                  <td width="92%" >Please use a black ball point pen.</td>
                </tr>
				<tr > 
                  <td width="2%" >&nbsp;</td>
                  <td width="6%">2.</td>
                  <td width="92%" >Fill in the appropriate circles completely.</td>
                </tr>
				<tr > 
                  <td width="2%" >&nbsp;</td>
                  <td width="6%">3.</td>
                  <td width="92%" >If you make a mistake, you may use white-out.</td>
                </tr>
				<tr >
				  <td colspan="3" style="font-size: 1px; line-height: 1px; height: 8px;" >&nbsp;</td>
				  </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
	<%-- <tr >
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU45<img src="../../Images/shim.gif" border="0" width="55" height="1" />U50<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 11/4/2010<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">1</span> of <span id="TotalPages">10</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />ASMNTS</td>
    </tr> --%>
  </table>
</div>

</div>

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
		<div  class="VerticalBarCodeDocType">*U50*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urothelial Baseline Questionnaire</span></td>
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
              <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <% =apptPhysicianName %>            </td>
          </tr>
        </table>       </td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> 
		<table class="pageWidth" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td><span class="SurveyTitle">General</span><br/>
              <br/><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top"> 
                  <td width="35"><strong>1.</strong></td>
                  <td><strong>How tall are you in feet and inches?</strong><br/>
                    <br />
                    <br />
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top">
                        <td width="5%">&nbsp;</td>
                        <td height="20">__________ feet&nbsp;&nbsp;&nbsp; __________ inches </td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>2.</strong></td>
                  <td><strong>What is your current weight in lbs?</strong><br/>
                      <br />
                      <br />
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="5%">&nbsp;</td>
                          <td height="20">__________ lbs </td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>3.</strong></td>
                  <td><strong>How much did you weigh (in lbs) 5 years before you were diagnosed with urothelial cancer?<br />
                    If you have not been diagnosed with urothelial cancer: How much do you weigh (in lbs)?</strong><br />
                    <br />
                      <br />
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="5%">&nbsp;</td>
                          <td height="20">__________ lbs </td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>4.</strong></td>
                  <td><strong>Which of the following best describes your ethnicity?</strong><br />
                    <br />
                    <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Hispanic/Latino<br />
                    <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Non- Hispanic/Non-Latino</td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>5.</strong></td>
                  <td><strong>Which of the following best describes your race?</strong><br />
                    <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />White/Caucasian<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Black/African-American<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Asian<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Native Hawaiian or Other Pacific Islander<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />American Indian or Alaskan Native</td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>6.</strong></td>
                  <td><strong>What is your religion?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Christian<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Jewish (please answer question 7)<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Muslim<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Other (please write): __________________________________________________</td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>7.</strong></td>
                  <td><strong>If you are Jewish, which of the following describes your ancestry?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Ashkenazi Jewish<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Sephardic Jewish<br />
                    <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Other</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU45<img src="../../Images/shim.gif" border="0" width="55" height="1" />U50<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 11/4/2010<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">1</span> of <span id="TotalPages">9</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U50*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urothelial Baseline Questionnaire</span></td>
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
		<table class="pageWidth" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td style="vertical-align: top; height: 1000px;"><span class="SurveyTitle">Occupation / Exposure </span><br/>
              <br/><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top"> 
                  <td width="35"><strong>8.</strong></td>
                  <td><strong>Have you ever been in contact with the following substances for at least 8 hours a week for 1 year? If you have been exposed less than 8 hours a week for 1 year, please skip to question 9.</strong></td>
                </tr>
                <tr valign="top">
				  <td>&nbsp;</td>
                  <td height="40"">
				  <table width="100%" cellspacing="0" class="HematuriaQuestionnaireTable">
                    <tr>
                      <th style="width: 34%;">Substance</th>
                      <th style="width: 8%;">Yes</th>
                      <th style="width: 8%; border-right: solid 3px #000000;">No</th>
                      <th style="width: 34%;">Substance</th>
                      <th style="width: 8%;">Yes</th>
                      <th style="width: 8%;">No</th>
                    </tr>
					
  <tr>
    <td>Aluminum </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Leather and Tanning Products </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Aromatic Amines </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>MineralOil </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Arsenic </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Motor Oils </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Asbestos </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Natural Gas </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Beryllium </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Nickel </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Bleach/Cleaners </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Other Metals </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Car or Truck Exhaust </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Paint Thinners </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Chromates </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Paints </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Chromium </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Pesticides </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Coal Dust </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Petroleum </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Diesel Fuels/Fumes </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Photographic Materials </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Dry Cleaning Fluids </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Pigments </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Dusts or Fumes </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Plastics </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Fertilizers </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Radioactive Materials </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Fiberglass </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Resins </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Gasoline </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Sawdust </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Glues </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Solvents </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Hair Dye Products </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Soot </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Herbicides </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Tar </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Hydrochloric Acid </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Tin </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Inksand Dyes </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Wood Dust </td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Insecticides </td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td>Zinc</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td>Lead</td>
    <td  >&nbsp;</td>
    <td style="border-right: solid 3px #000000;" >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU45<img src="../../Images/shim.gif" border="0" width="55" height="1" />U50<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 11/4/2010<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">2</span> of <span id="TotalPages">9</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U50*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urothelial Baseline Questionnaire</span></td>
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
		<table class="pageWidth" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td><span class="SurveyTitle">Smoking</span><br/>
              <br/><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top">
                  <td width="35"><strong>9.</strong></td>
                  <td><strong>Have you ever smoked more than 100 cigarettes (or 5 packets of cigarettes) in your lifetime?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Yes<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />No (please skip to question 13)</td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>10.</strong></td>
                  <td><strong>At what age did you start smoking?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Less than 20<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />20-29<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />30-39<br />
					  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />40-49<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />50-59<br />
					  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />60-69<br />
                  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />More than 70<br />                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>11.</strong></td>
                  <td><strong>How many years did you smoke?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Less than 5 <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />5-10<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />11-15<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />16-20<br />
					  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />21-25<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />26-30<br />
					  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />31-35<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />36-40<br />
					  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />41-45<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />46-50<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />More than 50                  </td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>12.</strong></td>
                  <td><strong>During periods when you smoke(d), how many packets of cigarettes do or did you usually smoke per day?</strong><br />
                    <br />
                    <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Less than 1/2<br />
					<img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />1/2 - 1<br />
					<img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />1-2<br />
					<img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />2-3<br />
					<img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />More than 3</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU45<img src="../../Images/shim.gif" border="0" width="55" height="1" />U50<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 11/4/2010<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">3</span> of <span id="TotalPages">9</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U50*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urothelial Baseline Questionnaire</span></td>
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
		<table class="pageWidth" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top">
                  <td width="35"><strong>13.</strong></td>
                  <td><strong>Do you or did you EVER smoke cigars?</strong><br />
                    <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Yes<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />No (please skip to question 15)</td>
                </tr>
                <tr valign="top">
                  <td height="35" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>14.</strong></td>
                  <td><strong>How many cigars have you smoked in your lifetime?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Less than 10<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />10-100<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />More than 100</td>
                </tr>
                <tr valign="top">
                  <td height="35" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>15.</strong></td>
                  <td><strong>Do you or have you EVER smoked a pipe?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Yes<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />No (please skip to question 17)</td>
                </tr>
                <tr valign="top">
                  <td height="35" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>16.</strong></td>
                  <td><strong>How many pipes have you smoked in your lifetime?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Less than 10<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />10-100<br/>
					  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />More than 100</td>
                </tr>
                <tr valign="top">
                  <td height="35" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>17.</strong></td>
                  <td><strong>Were you ever REGULARLY exposed to other people&rsquo;s tobacco smoke in enclosed rooms (e.g., spouse, coworkers, etc.)?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Yes<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />No (please skip to question 19)</td>
                </tr>
                <tr valign="top">
                  <td height="35" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>18.</strong></td>
                  <td><strong>For how many years were you exposed to other people’s tobacco smoke?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Less than 5 <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />5-10<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />11-15<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />16-20<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />21-25<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />26-30<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />31-35<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />36-40<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />41-45<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />46-50<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />More than 50 </td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU45<img src="../../Images/shim.gif" border="0" width="55" height="1" />U50<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 11/4/2010<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">4</span> of <span id="TotalPages">9</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U50*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urothelial Baseline Questionnaire</span></td>
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
		<table class="pageWidth" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
		  <tr valign="top"> 
            <td>&nbsp;</td>
            <td ><span class="SurveyTitle">Fluid Intake  </span><br/>
              <br/><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top"> 
                  <td width="35"><strong>19.</strong></td>
                  <td><strong>During the 10 years before your diagnosis with urothelial cancer, how often did you consume the following beverages on average?<br />
<br />
<em>If you have not been diagnosed with urothelial cancer:</em> In the past 10 years, how often did you consume the following beverages on average?
</strong></td>
                </tr>
                <tr valign="top">
				  <td>&nbsp;</td>
                  <td height="40"">
				  <table width="100%" cellspacing="0" class="HematuriaQuestionnaireTable">
                    <tr>
                      <th rowspan="2" style="width: 11%;">Beverage</th>
                      <th colspan="8" >Number of glasses / cups</th>
                      </tr>
                    <tr>
                      <th style="width: 11%; font-size: smaller;">Never</th>
                      <th style="width: 11%; font-size: smaller;">1-3 times per month</th>
                      <th style="width: 11%; font-size: smaller;">Once per week</th>
                      <th style="width: 11%; font-size: smaller;">2-6 times per week</th>
                      <th style="width: 11%; font-size: smaller;">Once per day</th>
                      <th style="width: 11%; font-size: smaller;">2-3 times per day</th>
                      <th style="width: 11%; font-size: smaller;">4-6 times per day</th>
                      <th style="width: 11%; font-size: smaller;">7 or more times per day</th>
                    </tr>
					
  <tr>
    <td >Water, juice, soda</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td >Tea/coffee (cup)</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td >Alcohol (glass)</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
                  </table></td>
                </tr>
                <tr valign="top">
                  <td height="100" colspan="2">&nbsp;</td>
                </tr>
              </table>             </td>
            <td>&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td ><span class="SurveyTitle">Medications Used to Treat Pain</span><br/>
              <br/><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top"> 
                  <td width="35"><strong>20.</strong></td>
                  <td><strong>During the 10 years before your diagnosis with urothelial cancer, how often did you take the following medications?<br />
                    <br />
                    <em>If you have not been diagnosed with urothelial cancer:</em> In the past 10 years, how often did you take the following medications?

</strong></td>
                </tr>
                <tr valign="top">
				  <td>&nbsp;</td>
                  <td height="40"">
				  <table width="100%" cellspacing="0" class="HematuriaQuestionnaireTable">
                    
                    <tr>
                      <th style="width: 28%;">Medications</th>
                      <th style="width: 9%; font-size: smaller;">Never</th>
                      <th style="width: 9%; font-size: smaller;">Less than 1 per week</th>
                      <th style="width: 9%; font-size: smaller;">1-2 per week</th>
                      <th style="width: 9%; font-size: smaller;">3-4 per week</th>
                      <th style="width: 9%; font-size: smaller;">5-6 per week</th>
                      <th style="width: 9%; font-size: smaller;">1 per day</th>
                      <th style="width: 9%; font-size: smaller;">2-3 per day</th>
                      <th style="width: 9%; font-size: smaller;">4 or more per day</th>
                    </tr>
                    <tr>
                      <td >Aspirin</td>
                      <td >&nbsp;</td>
                      <td >&nbsp;</td>
                      <td >&nbsp;</td>
                      <td >&nbsp;</td>
                      <td >&nbsp;</td>
                      <td  >&nbsp;</td>
                      <td  >&nbsp;</td>
                      <td  >&nbsp;</td>
                    </tr>
					
  <tr>
    <td >NSAIDs (e.g., Ibuprofen, Advil)</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td >Prescription NSAIDS (e.g., Celebrex, Naproxen)</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td >Acetaminophen (e.g., Tylenol)</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>
                  </table></td>
                </tr>
                <tr valign="top">
                  <td height="250" colspan="2">&nbsp;</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU45<img src="../../Images/shim.gif" border="0" width="55" height="1" />U50<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 11/4/2010<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">5</span> of <span id="TotalPages">9</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U50*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urothelial Baseline Questionnaire</span></td>
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
		<table class="pageWidth" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
		  <tr valign="top"> 
            <td>&nbsp;</td>
            <td ><span class="SurveyTitle">Past Genitourinary History </span><br/>
              <br/><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			    <tr valign="top">
                  <td><strong>21.</strong></td>
			      <td><strong>How often have you experienced the following medical conditions during your lifetime? (If you have never experienced any of these, please skip to question 25.)</strong></td>
			      </tr>
			    <tr valign="top">
                  <td>&nbsp;</td>
			      <td height="40""><table width="100%" cellspacing="0" class="HematuriaQuestionnaireTable">
                      <tr>
                        <th style="width: 30%;">Medical Condition</th>
                        <th style="width: 14%; font-size: smaller;">Never</th>
                        <th style="width: 14%; font-size: smaller;">1-2 times</th>
                        <th style="width: 14%; font-size: smaller;">3-4 times</th>
                        <th style="width: 14%; font-size: smaller;">6-10 times</th>
                        <th style="width: 14%; font-size: smaller;">More than 10 times</th>
                      </tr>
                      <tr>
                        <td >Bladder infection with frequent urination, or pain and burning with urination</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Kidney infection diagnosed by a medical doctor</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Prostate infection diagnosed by a medical doctor</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Gonorrhea</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Kidney stone</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Bladder stone</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                  </table></td>
			      </tr>
			    <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
			      </tr>
                <tr valign="top"> 
                  <td width="35"><strong>22.</strong></td>
                  <td><strong>When was the last time you experienced the following medical conditions?</strong></td>
                </tr>
                <tr valign="top">
				  <td>&nbsp;</td>
                  <td height="40"">
				  <table width="100%" cellspacing="0" class="HematuriaQuestionnaireTable">
                    
                    <tr>
                      <th style="width: 30%;">Medical Condition</th>
                      <th style="width: 14%; font-size: smaller;">Never</th>
                      <th style="width: 14%; font-size: smaller;">Less than 1 year ago</th>
                      <th style="width: 14%; font-size: smaller;">1-2 years ago</th>
                      <th style="width: 14%; font-size: smaller;">2-5 years ago</th>
                      <th style="width: 14%; font-size: smaller;">More than 5 years ago</th>
                      </tr>
					
  <tr>
    <td >Bladder infection with frequent urination, or pain and burning with urination</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    </tr>
  <tr>
    <td >Kidney infection diagnosed by a medical doctor</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr>
    <td >Prostate infection diagnosed by a medical doctor</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr>
    <td >Kidney stone</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr>
    <td >Bladder stone</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    </tr>
                  </table></td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
				
				<tr valign="top">
                  <td width="35"><strong>23.</strong></td>
                  <td><strong>During the year before you were diagnosed with urothelial cancer, did you ever have any of the following symptoms when urinating: difficult starting, difficulty stopping, or increased frequency during the night?<br />
                    <br />
                    <em> If you have not been diagnosed with urothelial cancer:</em> In the past year did you ever have any of these symptoms?
</strong><br />
                    <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Yes<br/>
                    <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />No (please skip to question 25)</td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>24.</strong></td>
                  <td><strong>For how many years have you had these symptoms?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Less than 1<br/>
					  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />1-5<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />5-10<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />More than 10</td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
				
				
              </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td colspan="3">&nbsp;</td>
          </tr>
        </table>       </td>
    </tr>
    <tr >
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU45<img src="../../Images/shim.gif" border="0" width="55" height="1" />U50<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 11/4/2010<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">6</span> of <span id="TotalPages">9</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U50*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urothelial Baseline Questionnaire</span></td>
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
		<table class="pageWidth" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top">
                  <td width="35"><strong>25.</strong></td>
                  <td><strong>Did you ever have surgery for an enlarged prostate?</strong><br />
                    <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Not applicable (i.e., female participant)<br/>
					  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Yes<br/>
                    <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />No</td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>26.</strong></td>
                  <td><strong>Prior to your diagnosis of urothelial cancer, did you ever have a urinary catheter inserted?<br />
<br />
<em>If you have not been diagnosed with urothelial cancer:</em> Have you ever had a urinary catheter inserted?
</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Yes<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />No (please skip to question 28)</td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>27.</strong></td>
                  <td><strong>How long was the catheter in place for?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Less than or equal to 1 month<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />1 - 6 months<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />More than 6 months</td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>28.</strong></td>
                  <td><strong>Prior to your diagnosis of urothelial cancer, did you ever have radiation therapy to the pelvis or abdomen?<br />
                        <br />
                        <em>If you have not been diagnosed with urothelial cancer:</em> Have you ever had radiation therapy to the pelvis or abdomen? </strong><br />
                        <br />
                        <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Yes<br/>
                        <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />No</td>
                </tr>
                <tr valign="top">
                  <td height="80" colspan="2">&nbsp;</td>
                </tr>
              </table>             </td>
            <td>&nbsp;</td>
          </tr>
		  <tr valign="top"> 
            <td>&nbsp;</td>
            <td ><span class="SurveyTitle">Questionnaire Details</span><br/>
              <br/><br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top">
                  <td width="35"><strong>29.</strong></td>
                  <td><strong>Who completed this questionnaire?</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Self<br/>
					  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Self with assistance from research study assistant, spouse, family member, friend, nurse, doctor<br/>
					  <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Spouse or family member<br/>
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Friend</td>
                </tr>
                <tr valign="top">
                  <td width="35" height="50" colspan="2">&nbsp;</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU45<img src="../../Images/shim.gif" border="0" width="55" height="1" />U50<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 11/4/2010<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">7</span> of <span id="TotalPages">9</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U50*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urothelial Baseline Questionnaire</span></td>
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
		<table class="pageWidth" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td><span class="SurveyTitle">Family History Questionnaire</span><br/><br/>
			
			Please complete this form to the best of your ability. If you are not sure of the ages of your relatives, or the ages at which they developed cancer, write “about years.” If there is not enough space to tell us everything that you think is important, feel free to include additional pages.
              <br/>
              <br />
              <br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top">
                  <td width="35"><strong>1.</strong></td>
                  <td><strong>Have you been diagnosed with cancer of the bladder, renal pelvis, ureter or urethra? (If the answer is no, please skip to question 4)</strong><br />
                      <br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />Yes<br />
                      <img src="../../Images/FormImages/Radiobutton.gif" class="paperFormRadioButton" />No</td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>2.</strong></td>
                  <td><strong>If you have been diagnosed with urothelial cancer, when were you diagnosed?</strong><br/>
                      <br />
                      <br />
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="5%">&nbsp;</td>
                          <td height="20">__________________________________________________________________________________</td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>3.</strong></td>
                  <td><strong>Please tell us about the following relatives. If you need to, please use an additional sheet of paper.</strong></td>
                </tr>
                <tr valign="top">
                  <td>&nbsp;</td>
                  <td height="40""><table width="100%" cellspacing="0" class="HematuriaQuestionnaireTable">
                      <tr>
                        <th style="width: 14%;">Relationship</th>
                        <th style="width: 14%;">Is this person alive?</th>
                        <th style="width: 14%; font-size: smaller;">Current age (if alive)<br />
                          Age at death (if deceased)</th>
                        <th style="width: 14%; font-size: smaller;">Does or did this person have Urothelial Cancer?</th>
                        <th style="width: 14%;">Age at<br />
                          diagnosis<br /></th>
                        <th style="width: 14%;">Does or did this person smoke?</th>
                      </tr>
                      <tr>
                        <td >Mother</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Father</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Sister 1</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Sister 2 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Sister 3 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Sister 4 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Brother 1</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Brother 2 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Brother 3 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Brother 4 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                  </table></td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>4.</strong></td>
                  <td><strong>Please tell us about your children. If you have more than 5 daughters or sons, please attach an additional sheet of paper.</strong></td>
                </tr>
                <tr valign="top">
                  <td>&nbsp;</td>
                  <td height="40""><table width="100%" cellspacing="0" class="HematuriaQuestionnaireTable">
                      <tr>
                        <th style="width: 14%;">Relationship</th>
                        <th style="width: 14%;">Is this person alive?</th>
                        <th style="width: 14%; font-size: smaller;">Current age (if alive)<br />
                          Age at death (if deceased)</th>
                        <th style="width: 14%; font-size: smaller;">Does or did this person have Urothelial Cancer?</th>
                        <th style="width: 14%;">Age at<br />
                          diagnosis<br /></th>
                        <th style="width: 14%;">Does or did this person smoke?</th>
                      </tr>
                      <tr>
                        <td >Son 1</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Son 2 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Son 3 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Son 4 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Son 5 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Daughter 1</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Daughter 2 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Daughter 3 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Daughter 4 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Daughter 5 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU45<img src="../../Images/shim.gif" border="0" width="55" height="1" />U50<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 11/4/2010<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">8</span> of <span id="TotalPages">9</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />ASMNTS</td>
    </tr>
  </table>
</div>

<div align="left" id="LastPageInForm" runat="server" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U50*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urothelial Baseline Questionnaire</span></td>
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
		<table class="pageWidth" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="6%">&nbsp;</td>
            <td width="87%" height="20">&nbsp;</td>
            <td width="7%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top">
                  <td width="35"><strong>5.</strong></td>
                  <td><strong>Now please tell us about your MOTHER’S family. We are asking about your MOTHER’S parents and your aunts and uncles on your MOTHER’S side.</strong></td>
                </tr>
                <tr valign="top">
                  <td>&nbsp;</td>
                  <td height="40""><table width="100%" cellspacing="0" class="HematuriaQuestionnaireTable">
                      <tr>
                        <th style="width: 18%;">Relationship</th>
                        <th style="width: 14%;">Is this person alive?</th>
                        <th style="width: 14%; font-size: smaller;">Current age (if alive)<br />
                          Age at death (if deceased)</th>
                        <th style="width: 14%; font-size: smaller;">Does or did this person have Urothelial Cancer?</th>
                        <th style="width: 14%;">Age at<br />
                          diagnosis<br /></th>
                        <th style="width: 14%;">Does or did this person smoke?</th>
                      </tr>
                      <tr>
                        <td >Mother&rsquo;s mother</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Mother&rsquo;s father</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Mother&rsquo;s sister 1</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Mother&rsquo;s sister 2 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Mother&rsquo;s sister 3 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Mother&rsquo;s sister 4 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Mother&rsquo;s brother  1</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Mother&rsquo;s brother 2 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Mother&rsquo;s brother 3 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Mother&rsquo;s brother 4 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                  </table></td>
                </tr>
                <tr valign="top">
                  <td height="40" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>6.</strong></td>
                  <td><strong>Now please tell us about your FATHER’S family. We are asking about your FATHER’S parents and your aunts and uncles on your FATHER’S side.</strong></td>
                </tr>
                <tr valign="top">
                  <td>&nbsp;</td>
                  <td height="40""><table width="100%" cellspacing="0" class="HematuriaQuestionnaireTable">
                      <tr>
                        <th style="width: 18%;">Relationship</th>
                        <th style="width: 14%;">Is this person alive?</th>
                        <th style="width: 14%; font-size: smaller;">Current age (if alive)<br />
                          Age at death (if deceased)</th>
                        <th style="width: 14%; font-size: smaller;">Does or did this person have Urothelial Cancer?</th>
                        <th style="width: 14%;">Age at<br />
                          diagnosis<br /></th>
                        <th style="width: 14%;">Does or did this person smoke?</th>
                      </tr>
                      <tr>
                        <td >Father&rsquo;s mother</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Father&rsquo;s father</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Father&rsquo;s sister 1</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Father&rsquo;s sister 2 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Father&rsquo;s sister 3 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Father&rsquo;s sister 4 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Father&rsquo;s brother  1</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Father&rsquo;s brother 2 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Father&rsquo;s brother 3 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                      <tr>
                        <td >Father&rsquo;s brother 4 </td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td style="text-align: center;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" /> Yes<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop" style="margin-left: 14px;" /> No </td>
                        <td >&nbsp;</td>
                        <td >&nbsp;</td>
                      </tr>
                  </table></td>
                </tr>
                
                
                <tr valign="top">
                  <td height="70" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td colspan="2"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr valign="top">
                      <td width="30" height="20" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                    </tr>
                  </table></td>
                </tr>
                <tr valign="top">
                  <td height="20" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td colspan="2"><table width="67%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr valign="top">
                        <td height="20" align="center" style="font-style: italic;">Thank you very much for your cooperation. </td>
                      </tr>
                  </table></td>
                </tr>
                <tr valign="top">
                  <td height="100" colspan="2">&nbsp;</td>
                </tr>
                <tr align="center" valign="top">
                  <td height="30" colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="border: solid 1px #000000;">
                    <tr valign="top">
                      <td height="34" colspan="5" class="blackBoldText" style="padding-left: 7px; padding-top: 4px;">Signatures</td>
                      </tr>
                    <tr valign="top">
                      <td align="right" valign="bottom">Patient&nbsp;/ Agent /&nbsp;<br />
                        Relative / Guardian&nbsp;</td>
                      <td height="40" valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                      <td valign="bottom">&nbsp;</td>
                      <td align="right" valign="bottom">Date: ____ /  ____ /  ____</td>
                      <td align="right" valign="bottom">Time:___:____ <span style="font-size: 9px;">AM / PM&nbsp;</span></td>
                    </tr>
                      <tr valign="top">
                        <td align="right" valign="bottom">Reviewed By&nbsp;</td>
                        <td width="30%" height="40" valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td valign="bottom">&nbsp;RN / MD </td>
                        <td align="right" valign="bottom">Date: ____ /  ____ /  ____</td>
                        <td align="right" valign="bottom">Time:___:____ <span style="font-size: 9px;">AM / PM&nbsp;</span></td>
                      </tr>
                      <tr valign="top">
                        <td colspan="5" align="right" valign="bottom">&nbsp;</td>
                        </tr>
                  </table></td>
                </tr>
                <tr valign="top">
                  <td colspan="2">&nbsp;</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU45<img src="../../Images/shim.gif" border="0" width="55" height="1" />U50<img src="../../Images/shim.gif" border="0" width="55" height="1" />CMIC 
        Approval Date: 11/4/2010<img src="../../Images/shim.gif" border="0" width="55" height="8" />Page <span id="PageNumber">9</span> of <span id="TotalPages">9</span><img src="../../Images/shim.gif" border="0" width="55" height="1" />ASMNTS</td>
    </tr>
  </table>
</div>


</div>
