<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.UroSurveyPostTxKidney" CodeFile="UroSurveyPostTxKidney.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>
<link href="../../../StyleSheets/IE7FormStyles.css" rel="stylesheet" type="text/css" media="all">

<style type="text/css">
#CompletedBySignatureTable
{
	
}
#CompletedBySignatureTable td
{
	font-size: 13px;
}
</style>


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
		<div  class="VerticalBarCodeDocType">*U51*</div>
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
              Post-Treatment Survey: Kidney </span><br/>
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
      <td valign="top" class="FormOuterTableRow"> 
		<table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top"> 
            <td width="3%">&nbsp;</td>
            <td width="94%" height="20">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td> <span class="SurveyTitle">POST-TREATMENT SURVEY: Kidney </span><br/>
            <br/>
            <br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr valign="top"> 
                  <td width="3%"><strong>1.</strong></td>
                  <td width="97%"><strong>Since your nephrectomy  or our last contact, has your kidney condition recurred?</strong><br/>
                    <br />
                    <br />
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top">
                        <td width="5%">&nbsp;</td>
                        <td width="8%" height="20">No</td>
                        <td width="12%">Yes</td>
                        <td width="25%">If Yes, please specify when.</td>
                        <td width="50%">Date: _____ /  _____ /  _____</td>
                      </tr>
                      <tr valign="top">
                        <td>&nbsp;</td>
                        <td height="20">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="padding-top: 15px;">If Yes, please specify where.</td>
                        <td style="padding-top: 15px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Abdomen</td>
                            <td><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Kidney</td>
                            <td><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Brain</td>
                          </tr>
                          <tr>
                            <td style="padding-top: 8px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Lung</td>
                            <td style="padding-top: 8px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Liver</td>
                            <td style="padding-top: 8px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Other: ________________ </td>
                          </tr>
                          
                        </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr valign="top"> 
                  <td height="50" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>2.</strong></td>
                  <td><strong>Could you please provide us with your latest lab values?</strong><br />
<br />
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        
                        <tr valign="top">
                          <td width="5%" height="20">&nbsp;</td>
                          <td>
						  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width: 50%;"><table width="95%" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td align="center" class="FormInsideTableTopLeftCell" style="width: 33%;">Lab Test </td>
        <td align="center" class="FormInsideTableTopCell" style="width: 33%;">Result</td>
        <td align="center" class="FormInsideTableTopCell"style="width: 33%;">Lab Test  Date</td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell" style="height:26px;">Creatinine</td>
        <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
        <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell" style="height:26px;">Hemoglobin</td>
        <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
        <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell" style="height:26px;">LDH</td>
        <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
        <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell" style="height:26px;">Calcium</td>
        <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
        <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
      </tr>
      
    </table></td>
    <td><table width="95%" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td align="center" class="FormInsideTableTopLeftCell" style="width: 33%;">Lab Test </td>
        <td align="center" class="FormInsideTableTopCell" style="width: 33%;">Result</td>
        <td align="center" class="FormInsideTableTopCell"style="width: 33%;">Lab Test  Date</td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell" style="height:26px;">TSH</td>
        <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
        <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell" style="height:26px;">PSA</td>
        <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
        <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell" style="height:26px;">Albumin</td>
        <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
        <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell" style="height:26px;">Other:______</td>
        <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
        <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
      </tr>
    </table></td>
  </tr>
</table>						  </td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="50" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>3.</strong></td>
                  <td><strong>When was your last CT scan, MRI scan, Abdominal Ultrasound, X-Ray, or Bone scan? </strong><br />
        <br />
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
            <td width="5%" height="20">&nbsp;</td>
            <td><table width="50%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td style="width: 50%;"><table width="100%" border="0" cellspacing="0" cellpadding="0" >
                      <tr>
                        <td align="center" class="FormInsideTableTopLeftCell" style="width: 33%;">Type of Scan </td>
                        <td align="center" class="FormInsideTableTopCell"style="width: 33%;"> Date</td>
                      </tr>
                      <tr>
                        <td align="center" class="FormInsideTableLeftCell" style="height:26px;">&nbsp;</td>
                        <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
                      </tr>
                      <tr>
                        <td align="center" class="FormInsideTableLeftCell" style="height:26px;">&nbsp;</td>
                        <td align="center" class="FormInsideTableRegCell">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
                      </tr>
                  </table></td>
                  </tr>
            </table></td>
          </tr>
        </table></td>
                </tr>
                <tr valign="top">
                  <td height="50" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>4.</strong></td>
                  <td><strong>Have you had any complications related to your kidney surgery?</strong>
                      <br />
                      <br />
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="40%" height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="50%" style="padding-top: 4px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Hernia</td>
                              <td style="padding-top: 4px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Irritative Urination</td>
                              </tr>
                            <tr>
                              <td style="padding-top: 4px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Bulge at Incision</td>
                              <td style="padding-top: 4px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Irritative Bowels</td>
                            </tr>
                            <tr>
                              <td style="padding-top: 4px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Incisional Leakage</td>
                              <td style="padding-top: 4px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Abcess</td>
                            </tr>
                            <tr>
                              <td style="padding-top: 4px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Incisional Pain</td>
                              <td style="padding-top: 4px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Other:______________</td>
                              </tr>
                            
                          </table></td>
                          <td><table width="90%" border="0" cellspacing="0" cellpadding="0" style="float: right;">
                            <tr>
                              <td>If yes, please specify when. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date: _____ /  _____ /  _____</td>
                            </tr>
                            <tr>
                              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="70%" style="padding-top: 15px;">If yes, please specify details of complication:</td>
                                  <td class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td height="26" colspan="2" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td height="26" colspan="2" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                                  </tr>
                              </table></td>
                            </tr>
                          </table></td>
                        </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="50" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>5.</strong></td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="35%"><strong>Please list your current medications.</strong></td>
                        <td class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="34" colspan="2" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="34" colspan="2" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                      </tr>
                  </table></td>
                </tr>
                <tr valign="top">
                  <td height="50" colspan="2">&nbsp;</td>
                </tr>
				<tr valign="top">
				<td><strong>6.</strong></td>
                  <td><strong>Since your surgery have you developed any of the following?&nbsp;&nbsp;&nbsp;(Please check  all that apply)</strong><br />
                      <br />
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                          <td width="5%" height="20">&nbsp;</td>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Diabetes</td>
                              <td><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Heart Disease</td>
                              <td><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Hypertension</td>
                              <td><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Anxiety</td>
                            </tr>
                            <tr>
                              <td style="padding-top: 8px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Stroke</td>
                              <td style="padding-top: 8px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Renal Failure</td>
                              <td style="padding-top: 8px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Depression</td>
                              <td style="padding-top: 8px;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Other Malignancy: ________________________ </td>
                            </tr>
                          </table></td>
                        </tr>
                    </table></td>
				</tr>
                <tr valign="top">
                  <td height="30" colspan="2">&nbsp;</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU46<img src="../../Images/shim.gif" border="0" width="45" height="1" />U51<img src="../../Images/shim.gif" border="0" width="45" height="1" />CIMC 
        Approval Date: 2/11/11<img src="../../Images/shim.gif" border="0" width="45" height="1">rev:05/18/12<img src="../../Images/shim.gif" border="0" width="45" height="8" />Page <span id="PageNumber">1</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS</td>
    </tr>
  </table>
</div>


<div id="LastPageInForm" runat="server" align="left" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U51*</div>
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
              Post-Treatment Survey: Kidney </span><br/>            </td>
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
            <td width="3%">&nbsp;</td>
            <td width="94%" height="20">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr valign="top"> 
            <td>&nbsp;</td>
            <td> <span class="SurveyTitle">POST-TREATMENT SURVEY: Kidney </span><br/>
            <br/>
            <br/>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			    <tr valign="top">
                  <td><strong>7.</strong></td>
			      <td><strong>May we contact, or continue to contact, your physician(s) to obtain copies of your medical records 
			        to update our files?</strong><br />
        <br />
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
            <td width="5%">&nbsp;</td>
            <td width="8%" height="20">No</td>
            <td width="12%">Yes</td>
            <td>If yes, please sign and return the attached HIPAA Patient Authorization for Post-Treatment Survey.</td>
          </tr>
      </table></td>
			      </tr>
			    <tr valign="top">
                  <td height="32" colspan="2">&nbsp;</td>
			      </tr>
                <tr valign="top">
                  <td width="3%"><strong>8.</strong></td>
                  <td width="97%"><strong>Please update your current physician information in the area provided.</strong><br />
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="50%"><table width="93%" border="0" cellspacing="0" cellpadding="0">
              <tr valign="top">
                <td width="4%" valign="bottom" style="font-size: 12px;"><strong>1</strong></td>
                <td width="20%" height="40" valign="bottom" style="font-size: 12px;">Physician Name </td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
              <tr valign="top">
                <td valign="bottom" style="font-size: 12px;">&nbsp;</td>
                <td height="40" valign="bottom" style="font-size: 12px;">Address</td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
              <tr valign="top">
                <td valign="bottom" style="white-space:nowrap; font-size: 12px;">&nbsp;</td>
                <td height="40" valign="bottom" style="white-space:nowrap; font-size: 12px;">City/State/Postal Code </td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
              <tr valign="top">
                <td valign="bottom" style="font-size: 12px;">&nbsp;</td>
                <td height="40" valign="bottom" style="font-size: 12px;">Phone</td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
              <tr valign="top">
                <td valign="bottom" style="font-size: 12px;">&nbsp;</td>
                <td height="40" valign="bottom" style="font-size: 12px;">Fax</td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
              <tr valign="top">
                <td valign="bottom" style="font-size: 12px;">&nbsp;</td>
                <td height="40" valign="bottom" style="font-size: 12px;">Specialty</td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
            </table></td>
            <td align="right"><table width="93%" border="0" cellspacing="0" cellpadding="0">
              <tr valign="top">
                <td width="4%" valign="bottom" style="font-size: 12px;"><strong>2</strong></td>
                <td width="20%" height="40" valign="bottom" style="font-size: 12px;">Physician Name </td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
              <tr valign="top">
                <td valign="bottom" style="font-size: 12px;">&nbsp;</td>
                <td height="40" valign="bottom" style="font-size: 12px;">Address</td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
              <tr valign="top">
                <td valign="bottom" style="white-space:nowrap; font-size: 12px;">&nbsp;</td>
                <td height="40" valign="bottom" style="white-space:nowrap; font-size: 12px;">City/State/Postal Code </td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
              <tr valign="top">
                <td valign="bottom" style="font-size: 12px;">&nbsp;</td>
                <td height="40" valign="bottom" style="font-size: 12px;">Phone</td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
              <tr valign="top">
                <td valign="bottom" style="font-size: 12px;">&nbsp;</td>
                <td height="40" valign="bottom" style="font-size: 12px;">Fax</td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
              <tr valign="top">
                <td valign="bottom" style="font-size: 12px;">&nbsp;</td>
                <td height="40" valign="bottom" style="font-size: 12px;">Specialty</td>
                <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table>        </td>
                </tr>
                <tr valign="top">
                  <td height="35" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>9.</strong></td>
                  <td><strong>May we contact you by telephone if we have further questions about your responses? <br />
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr valign="top">
                        <td width="5%">&nbsp;</td>
                        <td width="5%" height="20" valign="bottom">No</td>
                        <td width="15%" valign="bottom">Yes</td>
                        <td width="16%" height="42" valign="bottom" style="border-bottom-color: #000000;">Phone Number </td>
                        <td width="22%" valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td valign="bottom" style="padding-left: 20px;">Work / Home / Cell </td>
                      </tr>
                      <tr valign="top">
                        <td>&nbsp;</td>
                        <td height="20" valign="bottom">&nbsp;</td>
                        <td valign="bottom">&nbsp;</td>
                        <td height="42" valign="bottom" style="white-space: nowrap;">Best Time to Call </td>
                        <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td valign="bottom">&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
                <tr valign="top">
                  <td height="35" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top">
                  <td><strong>10.</strong></td>
                  <td><strong>If you would prefer to receive these follow-up notices via E-MAIL and to complete the forms 
	on the Internet, kindly write your e-mail address here:<br />
                      <br />
                      <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                          <td height="20" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        </tr>
                    </table></td>
                </tr>

                <tr  valign="top">
                  <td height="30" colspan="2" style="padding-top: 14px;">
				  <span style="vertical-align: bottom; font-weight: bold; font-size: 14px;">Completed By</span>
				  <table cellpadding="8" cellspacing="0" style="border: solid 1px #000000; width: 100%;"><tr><td>
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="CompletedBySignatureTable">

                      <tr valign="top">
                        <td valign="bottom" style="padding-right: 15px; font-size: 14px; font-weight: bold;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Self&nbsp;</td>
                        <td height="30" align="right" valign="bottom" style="border-bottom-color: #000000;">Print Name</td>
                        <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td valign="bottom" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td align="right" valign="bottom" style="border-bottom-color: #000000;">Signature</td>
                        <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td align="right" class="FormInnerRowBottomBorder" valign="bottom" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td valign="bottom" style="border-bottom-color: #000000;">&nbsp;</td>
                      </tr>
                      <tr valign="top" >
                        <td align="right" valign="bottom">&nbsp;</td>
                        <td height="40" align="right" valign="bottom" style="border-bottom-color: #000000;">Date</td>
                        <td valign="bottom"> _____ /  _____ /  _______</td>
                        <td align="right" valign="bottom">&nbsp;</td>
                        <td align="right" valign="bottom">Time&nbsp;</td>
                        <td height="40" valign="bottom" style="border-bottom-color: #000000;">____:_____ <span style="font-size: 9px;">AM / PM</span></td>
                        <td valign="bottom">&nbsp;</td>
                        <td align="right" valign="bottom">&nbsp;</td>
                        <td align="right" valign="bottom">&nbsp;</td>
                      </tr>
                      <tr valign="top" >
                        <td colspan="9" style="border-bottom: solid 1px #000000;">&nbsp;</td>
                        </tr>
                      <tr valign="top" >
                        <td valign="bottom" style="padding-right: 15px; font-size: 14px; font-weight: bold;"><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; vertical-align: middle;" />Other&nbsp;</td>
                        <td height="40" align="right" valign="bottom" style="border-bottom-color: #000000;">Print Name</td>
                        <td width="20%" height="40" valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td valign="bottom" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td height="40" align="right" valign="bottom" style="border-bottom-color: #000000;">Signature</td>
                        <td width="20%" height="40" valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td height="40" valign="bottom" style="border-bottom-color: #000000;">&nbsp;</td>
                        <td height="40" align="right" valign="bottom" style="border-bottom-color: #000000;">Relationship to Patient </td>
                        <td width="12%" height="40" valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                      </tr>
                      <tr valign="top" >
                        <td align="right" valign="bottom">&nbsp;</td>
                        <td height="40" align="right" valign="bottom" style="border-bottom-color: #000000;">Date</td>
                        <td valign="bottom"> _____ /  _____ /  _______</td>
                        <td align="right" valign="bottom">&nbsp;</td>
                        <td align="right" valign="bottom">Time&nbsp;</td>
                        <td height="40" valign="bottom" style="border-bottom-color: #000000;">____:_____ <span style="font-size: 9px;">AM / PM</span></td>
                        <td valign="bottom">&nbsp;</td>
                        <td align="right" valign="bottom">&nbsp;</td>
                        <td align="right" valign="bottom">&nbsp;</td>
                      </tr>
                  </table></td></tr></table></td>
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
                  <td height="20" colspan="2">&nbsp;</td>
                </tr>
                <tr valign="top"> 
                  <td  colspan="2"  style="border-top: solid 3px #000000; text-align: center; font-size: 11px; font-weight: bold;">&darr; For Office Use Only &darr;</td>
                </tr>
                <tr align="center" valign="top"> 
                  <td height="30" colspan="2"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                      <td colspan="5"  style="vertical-align: bottom; font-weight: bold;">Reviewed By</td>
                      </tr>
                    <tr valign="top">
                      <td align="right" valign="bottom">RN&nbsp;</td>
                      <td width="32%" height="32" valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                      <td valign="bottom">&nbsp;</td>
                      <td align="right" valign="bottom">Date: _____ /  _____ /  _____</td>
                      <td align="right" valign="bottom">Time:___:____ <span style="font-size: 9px;">AM / PM</span></td>
                    </tr>
                    <tr valign="top">
                      <td align="right" valign="bottom">MD&nbsp;</td>
                      <td height="32" valign="bottom" class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
                      <td valign="bottom">&nbsp;</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU46<img src="../../Images/shim.gif" border="0" width="45" height="1" />U51<img src="../../Images/shim.gif" border="0" width="45" height="1" />CIMC 
        Approval Date: 2/11/11<img src="../../Images/shim.gif" border="0" width="45" height="1" />rev:05/18/12<img src="../../Images/shim.gif" border="0" width="45" height="8" />Page <span id="PageNumber">2</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS</td>
      </tr>
  </table>
</div>

</div>

<asp:PlaceHolder id="SurveyFormHolder" runat="server"></asp:PlaceHolder>
