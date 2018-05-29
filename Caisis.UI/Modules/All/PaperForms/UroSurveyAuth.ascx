<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.UroSurveyAuth" CodeFile="UroSurveyAuth.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %> 

<style type="text/css">
<!--
.blackBoldTextLarge {
font-family: Helvetica,  Verdana, Arial,  sans-serif; font-size: 14px; font-weight: bold;
}
-->
</style>
<div align="left"  style="page-break-after:always;">




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              HIPAA Patient Authorization<br>for Post-Treatment Follow-up</span><br/>
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
      <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="14">
          <tr> 
            <td>We understand that information about you and your health is personal, 
              and we are committed to protecting the privacy of that information. 
              Because of this committment, we must obtain your written authorization 
              before we may use or disclose your protected health information 
              for the purposes described below. This form provides that authorization 
              and helps us make sure that you are properly informed of how this 
              information will be used or disclosed. Please 
              read the information below carefully before signing the form.<br> 
              <br> 
              <table width="96%" border="0" cellpadding="0" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr > 
                  <td height="30" colspan="5" align="center" class="blackBoldTextLarge">USE 
                    AND DISCLOSURE COVERED BY THIS AUTHORIZATION</td>
                </tr>
                <tr > 
                  <td>&nbsp;</td>
                  <td colspan="4" class="blackBoldText">May we contact, or continue 
                    to contact, your physician(s) to obtain copies of your medical 
                    records to update our files?</td>
                </tr>
                <tr > 
                  <td>&nbsp;</td>
                  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
                    Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
                    No </td>
                  <td colspan="3"><em>If Yes, please provide all of the requested 
                    information below.<br>
                    If No, you may skip to Page 2 of this form.</em></td>
                </tr>
                <tr > 
                  <td height="40">&nbsp;</td>
                  <td height="40" class="blackBoldText">Who will disclose this 
                    information?</td>
                  <td height="40">&nbsp;</td>
                  <td height="40">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr > 
                  <td>&nbsp;</td>
                  <td colspan="4"><table width="82%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td class="blackBoldText"><img src="../../Images/shim.gif" width="10" height="8"></td>
                        <td height="23" class="blackBoldText">Physician Role</td>
                        <td>Following&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Treating&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Circle 
                          One) </td>
                      </tr>
                      <tr> 
                        <td class="blackBoldText">&nbsp;</td>
                        <td height="26" class="blackBoldText">Physician Name (Last, 
                          First)</td>
                        <td>______________________________________________</td>
                      </tr>
                      <tr> 
                        <td class="blackBoldText">&nbsp;</td>
                        <td height="26" class="blackBoldText">Address</td>
                        <td>______________________________________________</td>
                      </tr>
                      <tr> 
                        <td class="blackBoldText">&nbsp;</td>
                        <td height="26" class="blackBoldText">City / State / Zip</td>
                        <td>______________________________________________</td>
                      </tr>
                      <tr> 
                        <td class="blackBoldText">&nbsp;</td>
                        <td height="26" class="blackBoldText">Office Phone</td>
                        <td>______________________________________________</td>
                      </tr>
                    </table></td>
                </tr>
                <tr > 
                  <td colspan="5" valign="top">&nbsp;</td>
                </tr>
                <tr > 
                  <td valign="top"><img src="../../Images/shim.gif" width="10" height="8"></td>
                  <td height="23" valign="top" class="blackBoldText" style="white-space: nowrap;">Who will 
                    use and/or disclose this information? </td>
                  <td><img src="../../Images/shim.gif" width="10" height="8"></td>
                  <td colspan="2" valign="top">Memorial Sloan-Kettering Cancer 
                    Center Department of Urology</td>
                </tr>
                <tr > 
                  <td valign="top">&nbsp;</td>
                  <td height="23" valign="top" class="blackBoldText">What information 
                    will be used and disclosed?</td>
                  <td>&nbsp;</td>
                  <td colspan="2" valign="top">Consults, progress notes, lab and 
                    pathology reports, treatment records.</td>
                </tr>
                <tr > 
                  <td valign="top">&nbsp;</td>
                  <td height="23" valign="top" class="blackBoldText">What is the 
                    purpose of the use or disclosure?</td>
                  <td>&nbsp;</td>
                  <td colspan="2" valign="top">To update Urology Service
                    patient records.</td>
                </tr>
                <tr > 
                  <td width="2%" valign="top">&nbsp;</td>
                  <td width="42%" height="23" valign="top" class="blackBoldText">When 
                    will this authorization expire?</td>
                  <td width="2%">&nbsp;</td>
                  <td width="15%" valign="top">Choose Either:</td>
                  <td width="42%" valign="top"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
                    Expires on&nbsp;&nbsp; _____ / _____ / ________ <span style="font-size:11px;">(date)</span></td>
                </tr>
                <tr > 
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td> OR:</td>
                  <td> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
                    No expiration date</td>
                </tr>
              </table>
              <br> <table width="96%" border="0" cellspacing="0" cellpadding="4">
                <tr> 
                  <td height="30" align="center" class="blackBoldTextLarge">SPECIFIC 
                    UNDERSTANDINGS</td>
                </tr>
                <tr> 
                  <td>By signing this authorization form, you authorize the use 
                    or disclosure of your protected health information as described 
                    above. This information may be redisclosed if the recipient(s) 
                    described on this form is not required by law to protect the 
                    privacy of the information, and such information is no longer 
                    protected by federal health information privacy regulations.<br> 
                    <br>
                    You have the right to refuse to sign this authorization. Your 
                    health care, the payment for your health care, and your health 
                    care benefits will not be affected if you do not sign this 
                    form.<br> <br>
                    You have a right to see and copy the information described 
                    on this authorization form in accordance with hospital policies. 
                    You also have a right to receive a copy of this form once 
                    you have signed it.<br> <br>
                    If you sign this authorization, you will have the right to 
                    revoke it at any time, except to the extent that the hospital 
                    has already taken action based upon this authorization. To 
                    revoke this authorization, please write to Urology Post Treatment 
                    Survey or the Privacy Office at the hospital.</td>
                </tr>
              </table>
              <br> <table width="96%" border="0" cellpadding="0" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr > 
                  <td height="30" colspan="5" align="center" class="blackBoldTextLarge">SIGNATURE</td>
                </tr>
                <tr > 
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="98%" height="40" colspan="4"><em>I have read this 
                    form and all my questions about this form have been answered. 
                    By signing below, I acknowledge that I have read and accept 
                    all of the above.</em></td>
                </tr>
                <tr > 
                  <td>&nbsp;</td>
                  <td colspan="4"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="46%" height="24" class="FormInnerRowBottomBorder">&nbsp;</td>
                        <td width="8%">&nbsp;</td>
                        <td width="46%" class="FormInnerRowBottomBorder">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td>Signature of Patient or Personal Representative</td>
                        <td>&nbsp;</td>
                        <td>Date</td>
                      </tr>
                      <tr> 
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr> 
                        <td colspan="3" class="blackBoldTextSmall"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="46%" height="24" class="FormInnerRowBottomBorder">&nbsp;</td>
                              <td width="8%">&nbsp;</td>
                              <td width="13%" class="FormInnerRowBottomBorder">&nbsp;</td>
                              <td width="8%">&nbsp;</td>
                              <td width="25%" class="FormInnerRowBottomBorder">&nbsp;</td>
                            </tr>
                            <tr> 
                              <td valign="top">Print Name of Patient or Personal 
                                Representative</td>
                              <td>&nbsp;</td>
                              <td valign="top">Date of Birth</td>
                              <td>&nbsp;</td>
                              <td>Description of Personal Representative's Authority</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>



<div id="LastPageInForm" runat="server" align="left"  style="page-break-after:always;" >
  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              HIPAA Patient Authorization<br>for Post-Treatment Follow-up</span><br/>
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
      <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="14">
          <tr> 
            <td><br> 
              <table width="96%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td class="blackBoldText">May we contact you regarding your post-treatment progress
                    using the internet? We would send you email notifications and ask you to report your progress online via secure web forms.</td>
                </tr>
                <tr> 
                  <td height="30" align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
                    Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
                    No </td>
                </tr>
                <tr> 
                  <td height="30">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="blackBoldText">May we contact you regarding your post-treatment progress by telephone?</td>
                </tr>
                <tr> 
                  <td height="30" align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
                    Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
                    No </td>
                </tr>
                <tr> 
                  <td height="30">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="blackBoldText">Check the box below if you prefer that we <strong>DO NOT</strong> contact you.</td>
                </tr>
                <tr> 
                  <td height="30" align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="texttop"> 
                    Please do not contact me for post-treatment follow-up.</td>
                </tr>
              </table>
              <br> <br> <br> <table width="96%" border="0" cellpadding="0" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr> 
                  <td height="30" align="center" class="blackBoldTextLarge">CONTACT 
                    INFORMATION </td>
                </tr>
                <tr> 
                  <td height="24"><em>&nbsp;&nbsp;&nbsp;The contact information 
                    of the patient or personal representative completing this 
                    form should be filled in below.</em></td>
                </tr>
                <tr> 
                  <td height="30"><table width="96%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="7%" height="23" align="right" valign="bottom">Address&nbsp;</td>
                        <td width="36%" height="30" class="FormInnerRowBottomBorder">&nbsp;</td>
                        <td width="6%">&nbsp;</td>
                        <td width="7%" align="right" valign="bottom">Telephone&nbsp;</td>
                        <td width="31%" class="FormInnerRowBottomBorder">&nbsp;</td>
                        <td width="7%" valign="bottom">&nbsp;Daytime</td>
                      </tr>
                      <tr> 
                        <td height="23">&nbsp;</td>
                        <td height="30" class="FormInnerRowBottomBorder">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="FormInnerRowBottomBorder">&nbsp;</td>
                        <td valign="bottom">&nbsp;Evening</td>
                      </tr>
                      <tr> 
                        <td height="23">&nbsp;</td>
                        <td height="30" class="FormInnerRowBottomBorder">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="3" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="20%" align="right">&nbsp;</td>
                              <td width="34%" style="white-space:nowrap;">Best Time to Call&nbsp;</td>
                              <td width="46%" class="FormInnerRowBottomBorder">&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="23">&nbsp;</td>
                        <td height="30">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td height="23" align="right" valign="bottom">Email&nbsp;</td>
                        <td class="FormInnerRowBottomBorder">&nbsp;</td>
                        <td valign="bottom">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td colspan="6">&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
              </table>
              <br>
              <br>
              <table width="96%" border="0" cellspacing="0" cellpadding="4">
                <tr> 
                  <td>ANY INFORMATION YOU PROVIDE VIA THE INTERNET OR EMAIL MAY 
                    NOT BE SEEN BY YOUR DOCTOR OR YOUR DOCTOR'S STAFF. IF YOU 
                    FEEL ILL OR THINK YOU NEED TO SPEAK WITH YOUR DOCTOR OR A 
                    MEMBER OF YOUR DOCTOR'S STAFF BEFORE YOUR NEXT APPOINTMENT 
                    YOU CANNOT USE THIS SYSTEM TO CONTACT YOUR DOCTOR. YOU MUST 
                    USE THE TELEPHONE OR ANOTHER METHOD TO CONTACT YOUR DOCTOR. 
                    IF YOU CANNOT REACH YOUR DOCTOR OR A MEMBER OF HIS OR HER 
                    STAFF, YOU SHOULD CONTACT THE NEAREST EMERGENCY ROOM FOR ASSISTANCE. 
                  </td>
                </tr>
              </table>
              <br>
              <br>
              <table width="96%" border="0" cellpadding="0" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr >
                  <td height="30" colspan="5" align="center" class="blackBoldTextLarge">SIGNATURE</td>
                </tr>
                <tr >
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="98%" height="40" colspan="4"><em>I have read this 
                    form and all my questions about this form have been answered. 
                    By signing below, I acknowledge that I have read and accept 
                    all of the above.</em></td>
                </tr>
                <tr >
                  <td>&nbsp;</td>
                  <td colspan="4"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="46%" height="24" class="FormInnerRowBottomBorder">&nbsp;</td>
                        <td width="8%">&nbsp;</td>
                        <td width="46%" class="FormInnerRowBottomBorder">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>Signature of Patient or Personal Representative</td>
                        <td>&nbsp;</td>
                        <td>Date</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="3" class="blackBoldTextSmall"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="46%" height="24" class="FormInnerRowBottomBorder">&nbsp;</td>
                              <td width="8%">&nbsp;</td>
                              <td width="13%" class="FormInnerRowBottomBorder">&nbsp;</td>
                              <td width="8%">&nbsp;</td>
                              <td width="25%" class="FormInnerRowBottomBorder">&nbsp;</td>
                            </tr>
                            <tr>
                              <td valign="top">Print Name of Patient or Personal 
                                Representative</td>
                              <td>&nbsp;</td>
                              <td valign="top">Date of Birth</td>
                              <td>&nbsp;</td>
                              <td>Description of Personal Representative's Authority</td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                  </table></td>
                </tr>
              </table>
              <br>
              <br>
              <br> <table width="96%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td align="center"> <p>Thank you very much for your cooperation.</p></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>