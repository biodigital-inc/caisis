<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.UroTRUSBiopsy"
    CodeFile="UroTRUSBiopsy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>
	
	
<style type="text/css">

.EFormTable
{
	padding:0px 0px 0px 0px;

	width:100%;
}
.EFormTableRow{
	background-color: #ffffff;
}

.TRUSFormSectionHeading
{
	font-size: 17px;
	font-weight: bold;
	padding: 12px 0px 2px 4px;
	border-top: solid 3px #000000;
}
table#ultrasoundCodesTable
{
	border-collapse: collapse;
	border-bottom: solid 1px #000000;
}
table#ultrasoundCodesTable th
{
	font-size: 11px;
	font-weight: bold;
	padding: 5px 2px 1px 2px;
	border-bottom: solid 1px #333333;
	border-right: solid 1px #333333;
}
table#ultrasoundCodesTable td
{
	font-size: 9px;
	font-weight: bold;
	padding: 0px 2px 0px 2px;
	border-right: solid 1px #333333;
}
</style>	
	
<div id="PaperFormStart">
    <div align="left" style="page-break-after: always;">
        <div>
            <div class="VerticalBarCodeDiv">
                <div class="VerticalBarCodeStatement">
                    <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage"><br />
                    <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage"
                        vspace="220"><br />
                    <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
                </div>
                <div class="VerticalBarCodeMRN">
                    <% =BarCodeMRN %></div>
                <div class="VerticalBarCodeDocType">
                    *PM4*</div>
                <div class="VerticalBarCodeAcctType">
                    <% =BarCodeAcctType %></div>
                <div class="VerticalBarCodeDate">
                    <% =BarCodeDate %></div>
            </div>
        </div>
        <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="text-align: center;">
                    <font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO
                        <%= institutionShortName%>
                        POLICY</font>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableTopRow">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder">
                                <span class="blackBoldText">
                                    <img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90"
                                        alt="" border="0" align="left"><%= institutionName%><br />
                                    Transrectal Ultrasound<br />
                                    Biopsy Of Prostate</span>                            </td>
                            <td width="50%" align="center" valign="bottom" class="blackBoldText">
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                    <tr>
                                        <td width="65">
                                            <img src="../../Images/shim.gif" border="0" width="65" height="1">                                        </td>
                                        <td align="left" width="274">
                                            <img src="../../Images/shim.gif" border="0" width="274" height="1">                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <% =patientMRNLabel  %>
&nbsp;&nbsp;&nbsp;                                        </td>
                                        <td align="left">
                                            <strong>
                                                <% =patientMRN  %>
                                            </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <% =patientDOB  %>                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" align="right">
                                            <% =patientNameLabel  %>
&nbsp;&nbsp;&nbsp;                                        </td>
                                        <td colspan="1" align="left">
                                            <strong>
                                                <% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %>
                                            </strong>                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" valign="top">
                                            <% =patientAddressLabel  %>
&nbsp;&nbsp;&nbsp;                                        </td>
                                        <td align="left" valign="top">
                                            <% =patientAddress1  %>
                                            <% =patientAddress2  %>
                                            <% =patientCity  %>
                                            <% =patientState  %>
                                            <% =patientPostalCode  %>                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <img src="../../Images/shim.gif" border="0" width="1" height="5">                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center" valign="bottom" class="blackBoldText">
                                            Patient Identification                                        </td>
                                    </tr>
                                </table>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="DatePhysician_Anchor" />
                    <table class="EFormTable" cellspacing="0">
                        <tr class="EFormTableRow">
                            <td width="50%" height="10" align="left" valign="bottom">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:
                                8/14/2012                            </td>
                            <td width="50%" align="left" valign="bottom">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Physician</span>:                            </td>
                        </tr>
                    </table>                </td>
            </tr>
<%-- 
            <tr>
                <td class="FormOuterTableRow">
                    <a name="VitalSigns_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td colspan="4" >
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Nursing
                                    Assessment</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td colspan="4" class="FormInsideTableTopCell">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Vital
                                    Signs</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                                <strong>Blood Pressure</strong>                            </td>
                            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Pulse</strong>                            </td>
                            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Temperature</strong>                            </td>
                            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Respirations</strong>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td colspan="2"><img src="../../Images/shim.gif" width="4" height="1" /></td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td width="50%">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Signature:</span>______________________________________                            </td>
                            <td width="50%">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Title:</span>______________________________________                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <table class="EFormTable" cellspacing="0">
                        <tr class="EFormTableRow">
                            <td width="58%" valign="top">
                                <a name="Medications_Anchor" />
                                <table class="EFormTable" cellspacing="0" border="0">
                                    <tr class="EFormTableRow">
                                        <td colspan="6" align="left" valign="middle" class="FormInsideTableRegCell">
                                            <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Medications:
                                            </span>
                                            <input name="CheckBox_MedUnchanged" type="checkbox" id="CheckBox_MedUnchanged" />
                                            <span class="blackBoldText">Unchanged since last visit</span>
											</td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td width="22%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                                            <strong>Medication</strong>                                        </td>
                                        <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                                            <strong>Dose</strong>                                        </td>
                                        <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                                            <strong>Units</strong>                                        </td>
                                        <td width="18%" align="center" valign="middle" class="FormInsideTableTopCell">
                                            <strong>Schedule</strong>                                        </td>
                                        <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                                            <strong>Start Date</strong>                                        </td>
                                        <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                                            <strong>Stop Date</strong>                                        </td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                                      </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                                      </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                                      </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                                      </td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td align="center" valign="middle" class="FormInsideTableLeftCell">                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">                                        </td>
                                    </tr>
                                </table>                            </td>
                            <td width="42%" valign="top">
                                <a name="Allergies_Anchor" />
                                <table class="EFormTable" cellspacing="0">
                                    <tr class="EFormTableRow">
                                        <td colspan="2" align="left" valign="middle" class="FormInsideTableRegCell">
                                            <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Allergies:
                                            </span>
                                            <input name="CheckBox_NKA" type="checkbox" id="CheckBox_NKA" />
                                            <span class="blackBoldText">NKA</span>
                                            <input name="CheckBox_AllergenUnchanged" type="checkbox" id="CheckBox_AllergenUnchanged" />
                                            <span class="blackBoldText">Unchanged since last visit</span>                                        </td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td width="50%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                                            <strong>Allergy</strong>                                        </td>
                                        <td width="50%" align="center" valign="middle" class="FormInsideTableTopCell">
                                            <strong>Response</strong>                                        </td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                                        </td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td align="center" valign="middle" class="FormInsideTableLeftCell">                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">                                        </td>
                                    </tr>
                                </table>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="StopDates_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" class="FormInsideTableLeftCell">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">If
                                    taking ASA, Plavix or Coumadin date drug stopped:</span>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <table class="EFormTable" cellspacing="0">
                        <tr class="EFormTableRow">
                            <td valign="top">
                                <table class="EFormTable" cellspacing="0">
                                    <tr class="EFormTableRow">
                                        <td colspan="4" align="left" valign="middle" class="FormInsideTableRegCell">
                                            <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Antibiotics
                                                Taken Prior to Biopsy:</span>
                                            <input name="CheckBox_Ciprofloxin" type="checkbox" id="CheckBox_Ciprofloxin"  />
                                            <strong>Ciprofloxin 500mg po</strong>
                                            <input name="CheckBox_Levaquin" type="checkbox" id="CheckBox_Levaquin" style="margin-left: 20px;"  />
                                            <strong>Levaquin 500mg po</strong>
                                            <!-- <input name="CheckBox_IV" type="checkbox" id="CheckBox_IV" style="margin-left: 20px;"  />
                                            <strong>IV</strong>-->											</td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td width="30%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                                            <strong>Agent</strong>                                        </td>
                                        <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
                                            <strong>Dose</strong>                                        </td>
                                        <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
                                            <strong>Units</strong>                                        </td>
                                        <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
                                            <strong>Route</strong>                                        </td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td align="center" valign="middle" class="FormInsideTableLeftCell">                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">                                        </td>
                                    </tr>
                                </table>                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <table class="EFormTable" cellspacing="0">
                                    <tr class="EFormTableRow">
                                        <a name="Encardities_Anchor" />
                                        <td align="left" valign="middle" class="FormInsideTableRegCell">
                                            <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Comorbidities: </span>
                                            <input name="CheckBox_MVP" type="checkbox" id="CheckBox_MVP" />
                                            <strong>MVP</strong>
                                            <input name="CheckBox_Cardiac" type="checkbox" id="CheckBox_Cardiac" />
                                            <strong>Cardiac Stent/Valve</strong>
                                            <input name="CheckBox_Joint" type="checkbox" id="CheckBox_Joint" />
                                            <strong>Joint Prothesis</strong>                                        </td>
                                    </tr>
                                </table>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td valign="middle" class="FormInsideTableLeftCell">
                                <input name="CheckBox" type="CheckBox" id="CheckBoxTest" value="No" />
                                <span class="blackBoldText">Pre and Post instructions reviewed. Fact Cards "Prior to
                                    Your Prostate Biopsy" and "After Your Prostate Biopsy"</span><br />
                                <span class="blackBoldText">provided to patient</span>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td colspan="2">
                                <img src="../../Images/shim.gif" width="4" height="1" />                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td width="50%">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Signature:</span>______________________________________                            </td>
                            <td width="50%">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Title:</span>______________________________________                            </td>
                        </tr>
                    </table>                </td>
            </tr>
			--%>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="MedicalAssessment_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td colspan="2" class="TRUSFormSectionHeading" >Medical Assessment</td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td class="FormInsideTableRegCell">
                                <a name="DRE_Anchor" />
                                <table class="EFormTable" cellspacing="0">
                                    <tr class="EFormTableRow">
                                        <td align="left" valign="middle" class="FormInsideTableTopCell">
                                            <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Digital
                                                Rectal Examination</span>&nbsp;&nbsp;&nbsp;
                                            <input name="RadioYes_DRE" type="radio" id="RadioYes_DRE" />
                                            <span class="blackBoldText">Normal</span>
                                            <input name="RadioNo_DRE" type="radio" id="RadioNo_DRE" />
                                            <span class="blackBoldText">Abnormal</span>
                                            <input name="RadioMalignant_DRE" type="radio" id="RadioMalignant_DRE" />
                                            <span class="blackBoldText">Abnormal Malignant</span>                                        </td>
                                    </tr>
                                </table>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td class="FormInsideTableRegCell">
                                <a name="ClinStage_Anchor" />
                                <table class="EFormTable" cellspacing="0">
                                    <tr class="EFormTableRow">
                                        <td>
                                            <img src="../../Images/shim.gif" width="4" height="1" />                                        </td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                        <td align="left" valign="middle" class="FormInsideTableRegCell">
                                            <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Clinical
                                                Stage by DRE</span>
                                            <input name="RadioClin_T1c" type="radio" id="RadioClin_T1c" />
                                            <span class="blackBoldText">T1c</span>
                                            <input name="RadioClin_T2a" type="radio" id="RadioClin_T2a" />
                                            <span class="blackBoldText">T2a</span>
                                            <input name="RadioClin_T2b" type="radio" id="RadioClin_T2b" />
                                            <span class="blackBoldText">T2b</span>
                                            <input name="RadioClin_T2c" type="radio" id="RadioClin_T2c"  />
                                            <span class="blackBoldText">T2c</span>
                                            <input name="RadioClin_T3a" type="radio" id="RadioClin_T3a" />
                                            <span class="blackBoldText">T3a</span>
                                            <input name="RadioClin_T3b" type="radio" id="RadioClin_T3b" />
                                            <span class="blackBoldText">T3b</span>
                                            <input name="RadioClin_T3c" type="radio" id="RadioClin_T3c" />
                                            <span class="blackBoldText">T3c</span>                                        </td>
                                    </tr>
                                </table>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="LabTests_Anchor" />
                    <table class="EFormTable" cellspacing="0">
                        <tr class="EFormTableRow">
                            <td colspan="4">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Serum
                                    PSA Lab Tests</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                                <strong>Date</strong>                            </td>
                            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Lab Test</strong>                            </td>
                            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Value</strong>                            </td>
                            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Quality</strong>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                        </tr>
                        <tr class="EFormTableRow">
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                        </tr>
                        <tr class="EFormTableRow">
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                        </tr>
                    </table>					</td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="IndicationConsentAntibioticsBx_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td colspan="2" class="FormInsideTableRegCell">
                                <a name="ProcIndication_Anchor" />
                                <table class="EFormTable" cellspacing="0">
                                    <tr class="EFormTableRow">
                                        <td align="left" valign="middle" class="blackBoldText" style="padding: 2px 0px 0px 4px;">Indication for Biopsy:</td>
										<td align="left" valign="middle" ><input name="RadioWatch" type="radio" id="RadioActiveSurveillance" /><strong>Active Surveillance</strong></td>
                                        <td align="left" valign="middle" ><input name="RadioRestage" type="radio" id="RadioRestage" /><strong>Restaging</strong></td>
                                        <td align="left" valign="middle" ><input name="RadioPSA" type="radio" id="RadioPSA" /><strong>Elevated PSA</strong></td>
                                    </tr>
                                    <tr class="EFormTableRow">
                                      <td align="left" valign="middle" style="padding: 2px 0px 0px 4px;">&nbsp;</td>
                                      <td align="left" valign="middle" ><input name="RadioProstate" type="radio" id="RadioProstate" /><strong>Prostate nodule/abnormality</strong></td>
                                      <td align="left" valign="middle" ><input name="RadioProstate" type="radio" id="RadioPostRadiation" /><strong>Post Radiation</strong></td>
                                      <td align="left" valign="middle" ><input name="RadioOther" type="radio" id="RadioOther" /><strong>Other</strong></td>
                                    </tr>
                                </table>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td colspan="2" class="FormInsideTableRegCell blackBoldText" style="padding: 7px 0px 7px 4px;">
                            <table class="EFormTable" cellspacing="0">
                                    <tr class="EFormTableRow">
                                        <td class="blackBoldText" >Fiducial Markers</td>
										<td ><strong>Subsite:</strong><input name="FiducialMarkersSubsite" type="checkbox" id="FiducialMarkersSubsite" style="vertical-align: text-top; margin-left: 1em;" /> Right Apex, Right Base, Left Base</td>
                                        <td ><strong>Type:</strong><input name="FiducialMarkersType" type="radio" id="FiducialMarkersTypeCalypso" style="vertical-align: text-top; margin-left: 1.5em;" /> Calypso<input name="FiducialMarkersType" type="radio" id="FiducialMarkersTypeGold" style="vertical-align: text-top; margin-left: 1em;" /> Gold</td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td width="50%" class="FormInsideTableRegCell">
                                <a name="ConsentForm_Anchor" />
                                <table class="EFormTable" cellspacing="0">
                                    <tr class="EFormTableRow">
                                        <td align="left" valign="middle" class="FormInsideTableRegCell">
                                            <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Consent
                                                Form:</span>
                                            <input name="RadioConsentYes" type="radio" id="RadioConsentYes" />
                                            <strong>Yes</strong>
                                            <input name="RadioConsentNo" type="radio" id="RadioConsentNo" />
                                            <strong>No</strong>                                        </td>
                                    </tr>
                                </table>                            </td>
                            <td width="50%" class="FormInsideTableRegCell">
                                <a name="AntibioticsPriorBx_Anchor" />
                                <table class="EFormTable" cellspacing="0">
                                    <tr class="EFormTableRow">
                                        <td align="left" valign="middle" class="FormInsideTableRegCell">
                                            <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Antibiotics
                                                Prior to Biopsy:</span>
                                            <input name="RadioPriorBxYes" type="radio" id="RadioPriorBxYes" />
                                            <strong>Yes</strong>
                                            <input name="RadioPriorBxNo" type="radio" id="RadioPriorBxNo" />
                                            <strong>No</strong>                                        </td>
                                    </tr>
                                </table>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td class="TRUSFormSectionHeading">Prior Treatment</td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
              <td class="FormOuterTableRow"><a name="RadiationTherapy_Anchor" id="RadiationTherapy_Anchor" /></a>
                  <table class="EFormTable" cellspacing="0">
                    <tr class="EFormTableRow">
                      <td align="left" valign="middle" colspan="6"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Radiation
                        Therapy</span> </td>
                    </tr>
                    <tr class="EFormTableRow">
                      <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong> </td>
                      <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Type</strong> </td>
                      <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Target</strong> </td>
                      <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Dose</strong> </td>
                      <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Institution</strong> </td>
                      <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong> </td>
                    </tr>
                    <tr class="EFormTableRow">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                    </tr>
                    <tr class="EFormTableRow">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                    </tr>
                </table></td>
            </tr>
            <tr>
              <td class="FormOuterTableRow"><table class="EFormTable" cellspacing="0">
                  <tr class="EFormTableRow">
                    <td align="left" valign="middle" colspan="5"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Brachy
                      Therapy</span> </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong> </td>
                    <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Prescribed Dose</strong> </td>
                    <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Isotope</strong> </td>
                    <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Institution</strong> </td>
                    <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong> </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td class="FormOuterTableRow"><a name="MedicalTherapy_Anchor" id="MedicalTherapy_Anchor" /></a>
                  <table class="EFormTable" cellspacing="0">
                    <tr class="EFormTableRow">
                      <td align="left" valign="middle" colspan="5"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Focal
                        Therapy</span></td>
                    </tr>
                    <tr class="EFormTableRow">
                      <td style="width: 10%; text-align: center; vertical-align: middle;" class="FormInsideTableTopLeftCell"><strong>Date</strong> </td>
                      <td style="width: 20%; text-align: center; vertical-align: middle;"  class="FormInsideTableTopCell"><strong>Type</strong> </td>
                      <td style="width: 15%; text-align: center; vertical-align: middle;"  class="FormInsideTableTopCell"><strong>Target</strong> </td>
                      <td style="width: 25%; text-align: center; vertical-align: middle;"  class="FormInsideTableTopCell"><strong>Institution</strong> </td>
                      <td style="width: 30%; text-align: center; vertical-align: middle;"  class="FormInsideTableTopCell"><strong>Notes</strong> </td>
                    </tr>
                    <tr class="EFormTableRow">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                    </tr>
                    <tr class="EFormTableRow">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                    </tr>
                </table></td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="MedicalTherapy_Anchor" />
                    <table class="EFormTable" cellspacing="0">
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" colspan="7">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Medical
                                    Therapy</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                                <strong>Date</strong>                            </td>
                            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Agent</strong> </td>
                            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Therapy</strong>                            </td>
                            <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Dose</strong>                            </td>
                            <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Units</strong>                            </td>
                            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Institution</strong>                            </td>
                            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Notes</strong>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                        </tr>
                    </table>					</td>
            </tr>
            <tr>
              <td class="FormOuterTableRow"><table width="100%" border="0" cellpadding="8" cellspacing="0">
                <tr>
                  <td height="45" style="vertical-align: bottom;" ><span class="blackBoldText">Signature:</span>_______________________________________&nbsp;&nbsp;<span class="blackBoldText">RN / MD</span></td>
                  <td style="vertical-align: bottom;" align="right" ><span class="blackBoldText">Date:</span>____/____/____ </td>
                  <td style="white-space: nowrap;vertical-align: bottom;"><span class="blackBoldText">Time:</span>____:_____ <span style="font-size: 9px;">AM / PM </span></td>
                </tr>
              </table></td>
            </tr>
			<tr>
                <td class="FormOuterTableRow">
                    <a name="UltrasoundReport_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td colspan="2" class="TRUSFormSectionHeading">Ultrasound Report</td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" class="FormInsideTableTopCell">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Overall
                                    Assessment:</span>
                                <input name="RadioYes_Assessment" type="radio" id="RadioYes_Assessment"  />
                                <span class="blackBoldText">Normal</span>
                                <input name="RadioNo_Assessment" type="radio" id="RadioNo_Assessment" />
                                <span class="blackBoldText">Abnormal</span>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="ProstateSize_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td colspan="7" class="FormInsideTableTopCell">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Prostate
                                    Size</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">&nbsp;</td>
                            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Height(cm)</strong></td>
                            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Width(cm)</strong></td>
                            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Length(cm)</strong></td>
                            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">&nbsp;</td>
                            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Volume(cc)</strong></td>
                            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>PSA density</strong></td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" class="FormInsideTableRegCell">
                                <img src="../../Images/shim.gif" width="4" height="2" /><strong>Prostate</strong>                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                <strong>x 0.52 =</strong>                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp; </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp; </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" class="FormInsideTableRegCell">
                                <img src="../../Images/shim.gif" width="4" height="2" /><strong>Transition zone</strong>                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                <strong>x 0.52 =</strong>                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp; </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp; </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="UltrasoundClinStage_Anchor" />
                    <table class="EFormTable" cellspacing="0">
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" class="FormInsideTableRegCell">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Ultrasound
                                    Clinical Stage:</span>
                                <input name="Radio_T1c" type="radio" id="Radio_T1c" />
                                <span class="blackBoldText">T1c</span>
                                <input name="Radio_T2a" type="radio" id="Radio_T2a" />
                                <span class="blackBoldText">T2a</span>
                                <input name="Radio_T2b" type="radio" id="Radio_T2b" />
                                <span class="blackBoldText">T2b</span>
                                <input name="Radio_T2c" type="radio" id="Radio_T2c"  />
                                <span class="blackBoldText">T2c</span>
                                <input name="Radio_T3a" type="radio" id="Radio_T3a" />
                                <span class="blackBoldText">T3a</span>
                                <input name="Radio_T3b" type="radio" id="Radio_T3b" />
                                <span class="blackBoldText">T3b</span>
                                <input name="Radio_T3c" type="radio" id="Radio_T3c" />
                                <span class="blackBoldText">T3c</span>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="HypoechoicLesion_Anchor" />
                    <table id="ultrasoundCodesTable" class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <th width="24.7%" align="left" valign="middle" >
                                <span class="blackBoldText">Side:</span>                            </th>
                            <th width="25%" align="left" valign="middle" >
                                <span class="blackBoldText">Area:</span>                            </th>
                            <th width="25%" align="left" valign="middle" >
                                <span class="blackBoldText">Zone:</span>                            </th>
                            <th width="25%" align="left" valign="middle" >
                                <span class="blackBoldText">Cancer/ECE Codes:</span>                            </th>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">L - left lateral</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">A - apex</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">P - peripheral</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">1 - definitely no</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">LM - left medial</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">M - mid</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">T - transition</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">2 - probably no</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">M - midline</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">B - base</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText"></span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">3 - possibly present</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">RM - right medial</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">SV - seminal vesicle</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText"></span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">4 - probably present</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">R - right lateral</span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText"></span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText"></span>                            </td>
                            <td align="left" valign="middle" >
                                <span class="blackBoldText">5 - definitely present</span>                            </td>
                        </tr>
                  </table>
                    <table class="EFormTable" cellspacing="0">
                        <tr class="EFormTableRow">
                            <td colspan="7">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Suspicious Nodules</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Side</strong>                            </td>
                            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Area</strong>                            </td>
                            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Laterality</strong>                            </td>
                            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>AP</strong>                            </td>
                            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Zone</strong>                            </td>
                            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>ECE</strong>                            </td>
                            <td width="24%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Directed or Systematic Bx.</strong>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                        </tr>
                        <tr class="EFormTableRow">
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                        </tr>
                        <tr class="EFormTableRow">
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;</td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="center" valign="middle" class="FormInsideTableLeftCell">&nbsp;                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                            </td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell">&nbsp;                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr class="FormOuterTableRow">
                <td height="14" align="center" valign="bottom" class="blackBoldText">
                    99-99671<img src="../../Images/shim.gif" border="0" width="45" height="1" />PM4<img
                        src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval
                    Date: 10/00<img src="../../Images/shim.gif" border="0" width="45" height="8" />Rev:
                    11/06/14<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page
                    <span id="PageNumber">1</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif"
                        border="0" width="45" height="1" />ASMNTS                </td>
            </tr>
        </table>
    </div>
    <div align="left" id="LastPageInForm" runat="server">
        <div>
            <div class="VerticalBarCodeDiv">
                <div class="VerticalBarCodeStatement">
                    <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage"><br />
                    <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage"
                        vspace="220"><br />
                    <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
                </div>
                <div class="VerticalBarCodeMRN">
                    <% =BarCodeMRN %></div>
                <div class="VerticalBarCodeDocType">
                    *PM4*</div>
                <div class="VerticalBarCodeAcctType">
                    <% =BarCodeAcctType %></div>
                <div class="VerticalBarCodeDate">
                    <% =BarCodeDate %></div>
            </div>
        </div>
        <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="text-align: center;">
                    <font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO
                        <%= institutionShortName%>
                        POLICY</font>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableTopRow">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder">
                                <span class="blackBoldText">
                                    <img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90"
                                        alt="" border="0" align="left"><%= institutionName%><br />
                                    Transrectal Ultrasound<br />
                                    Biopsy Of Prostate</span>                            </td>
                            <td width="50%" align="center" valign="bottom" class="blackBoldText">
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                    <tr>
                                        <td width="65">
                                            <img src="../../Images/shim.gif" border="0" width="65" height="1">                                        </td>
                                        <td align="left" width="274">
                                            <img src="../../Images/shim.gif" border="0" width="274" height="1">                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <% =patientMRNLabel  %>
&nbsp;&nbsp;&nbsp;                                        </td>
                                        <td align="left">
                                            <strong>
                                                <% =patientMRN  %>
                                            </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <% =patientDOB  %>                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" align="right">
                                            <% =patientNameLabel  %>
&nbsp;&nbsp;&nbsp;                                        </td>
                                        <td colspan="1" align="left">
                                            <strong>
                                                <% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %>
                                                <% =patientMiddleName  %>
                                            </strong>                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" valign="top">
                                            <% =patientAddressLabel  %>
&nbsp;&nbsp;&nbsp;                                        </td>
                                        <td align="left" valign="top">
                                            <% =patientAddress1  %>
                                            <% =patientAddress2  %>
                                            <% =patientCity  %>
                                            <% =patientState  %>
                                            <% =patientPostalCode  %>                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <img src="../../Images/shim.gif" border="0" width="1" height="5">                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center" valign="bottom" class="blackBoldText">
                                            Patient Identification                                        </td>
                                    </tr>
                                </table>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="DatePhysician_Anchor" />
                    <table class="EFormTable" cellspacing="0">
                        <tr class="EFormTableRow">
                            <td width="50%" height="10" align="left" valign="bottom">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:
                                8/14/2012                            </td>
                            <td width="50%" align="left" valign="bottom">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Physician</span>:                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            
            <tr>
                <td class="FormOuterTableRow">
                    <a name="Biopsy_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td colspan="3" class="FormInsideTableTopCell">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Biopsy</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td width="46%" align="left" valign="middle" class="FormInsideTableRegCell">
                                <img src="../../Images/shim.gif" width="2" height="1" /><input name="CheckBoxUS"
                                    type="CheckBox" id="CheckBoxUS"  /><strong>US guided (Systematic)</strong><img
                                        src="../../Images/shim.gif" width="2" height="1" />
                                <strong># </strong>12                            </td>
                            <td width="30%" align="left" valign="middle" class="FormInsideTableRegCell">
                                <img src="../../Images/shim.gif" width="2" height="1" /><input name="CheckBoxTZ"
                                    type="CheckBox" id="CheckBoxTZ"  /><strong>2 TZ biopsy</strong>                            </td>
                            <td width="24%" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" width="2" height="1" />
                              <input name="CheckBoxTZ2"
                                    type="checkbox" id="CheckBoxTZ2">
                            <strong>2 SV biopsy</strong></td>
                        </tr>
                        <tr class="EFormTableRow">
                          <td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" width="2" height="1" /><input name="CheckBoxDirected"
                                    type="checkbox" id="CheckBoxDirected">
                            <strong>Directed biopsy</strong>&nbsp;&nbsp;&nbsp;<strong>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong><strong>Location: </strong> </td>
                          <td colspan="2" align="left" valign="middle" class="FormInsideTableRegCell"   "><img src="../../Images/shim.gif" width="2" height="1" />
                              <input name="CheckBoxFinger"
                                    type="checkbox" id="CheckBoxFinger">
                            <strong>Finger guided biopsy</strong>&nbsp;&nbsp;&nbsp;<strong>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong><strong>Location: </strong> </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="Contour_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" class="FormInsideTableRegCell">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Prostate
                                    Contour</span>
                                <input name="RadioSmooth" type="radio" id="RadioSmooth" />
                                <strong>Smooth</strong><img src="../../Images/shim.gif" width="2" height="1" />
                                <input name="RadioIrregular" type="radio" id="RadioIrregular" />
                                <strong>Irregular</strong><img src="../../Images/shim.gif" width="2" height="1" />
                                <input name="RadioRight" type="radio" id="RadioRight"  />
                                <strong>Right</strong><img src="../../Images/shim.gif" width="2" height="1" />
                                <input name="RadioLeft" type="radio" id="RadioLeft" />
                                <strong>Left</strong><img src="../../Images/shim.gif" width="2" height="1" />
                                <strong>Comment__________</strong>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="PostProcInsturctions_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" class="FormInsideTableLeftCell">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Post
                                    procedure instructions were reviewed with patient</span>
                                <input name="RadioYes_PostProcInstructions" type="radio" id="RadioYes_PostProcInstructions"
                                     />
                                <span class="blackBoldText">Yes</span>
                                <input name="RadioNo_PostProcInstructions" type="radio" id="RadioNo_PostProcInstructions" />
                                <span class="blackBoldText">No</span>                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" class="FormInsideTableLeftCell">
                                <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Comments</span>                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="AttendingPresence_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td class="TRUSFormSectionHeading" >Verification of Attending Presence</td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" class="FormInsideTableTopCell">
                                <img src="../../Images/shim.gif" width="2" height="1" /><input name="RadioYes_AttendingPresence"
                                    type="radio" id="RadioYes_AttendingPresence"  />
                                <span class="blackBoldText">I was present for the entire procedure</span><br />
                                <img src="../../Images/shim.gif" width="2" height="1" /><input name="RadioNo_AttendingPresence"
                                    type="radio" id="RadioNo_AttendingPresence" />
                                <span class="blackBoldText">I was present for all key portions of the procedure, including
                                    but not limited to radiologic interpretation on </span>
                                <br />
                                <span class="blackBoldText">ultra-sonographic findings and needle guided biopsy</span><br />                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
              <td class="FormOuterTableRow"><table width="100%" border="0" cellpadding="8" cellspacing="0">
                <tr>
                  <td height="45" style="vertical-align: bottom;" ><span class="blackBoldText">Signature:</span>_______________________________________&nbsp;&nbsp;<span class="blackBoldText">RN / MD</span></td>
                  <td style="vertical-align: bottom;" align="right" ><span class="blackBoldText">Date:</span>____/____/____ </td>
                  <td style="white-space: nowrap;vertical-align: bottom;"><span class="blackBoldText">Time:</span>____:_____ <span style="font-size: 9px;">AM / PM </span></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td class="FormOuterTableRow">
                    <a name="Disposition_Anchor" />
                    <table class="EFormTable" cellspacing="0" border="0">
                        <tr class="EFormTableRow">
                            <td class="TRUSFormSectionHeading" >Disposition</td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td align="left" valign="middle" class="FormInsideTableTopCell">
                                <img src="../../Images/shim.gif" width="2" height="1" /><input name="RadioYes_Disposition"
                                    type="radio" id="RadioYes_Disposition"  />
                                <span class="blackBoldText">Discharge Home</span><br />
                                <img src="../../Images/shim.gif" width="2" height="1" /><input name="RadioNo_Disposition"
                                    type="radio" id="RadioNo_Disposition" />
                                <span class="blackBoldText">Transfer to UCC</span><br />
                                <img src="../../Images/shim.gif" width="2" height="1" /><input name="RadioOther"
                                    type="radio" id="RadioOther" />
                                <span class="blackBoldText">Other Specify: </span>
                                <br />                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
              <td class="FormOuterTableRow"><table width="100%" border="0" cellpadding="8" cellspacing="0">
                <tr>
                  <td height="45" style="vertical-align: bottom;" ><span class="blackBoldText">Signature:</span>_______________________________________&nbsp;&nbsp;<span class="blackBoldText">RN / MD</span></td>
                  <td style="vertical-align: bottom;" align="right" ><span class="blackBoldText">Date:</span>____/____/____ </td>
                  <td style="white-space: nowrap;vertical-align: bottom;"><span class="blackBoldText">Time:</span>____:_____ <span style="font-size: 9px;">AM / PM </span></td>
                </tr>
              </table></td>
            </tr>
            <tr class="FormOuterTableRow">
                <td height="14" align="center" valign="bottom" class="blackBoldText">
                    99-99671<img src="../../Images/shim.gif" border="0" width="45" height="1" />PM4<img
                        src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval
                    Date: 10/00<img src="../../Images/shim.gif" border="0" width="45" height="8" />Rev:
                    11/06/14<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page
                    <span id="PageNumber">2</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif"
                        border="0" width="45" height="1" />ASMNTS                </td>
            </tr>
        </table>
    </div>
</div>
