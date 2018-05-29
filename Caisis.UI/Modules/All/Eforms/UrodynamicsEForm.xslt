<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="InstitutionShortName">MSKCC</xsl:variable>

<!--Barcode Variables-->
<xsl:variable name="DocType">*U40*</xsl:variable>
<xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>
<xsl:variable name="ReportTitle">Urology Urodynamic Study</xsl:variable>
<!--Footer Variables-->
<xsl:variable name="DocNumber">35</xsl:variable>
<xsl:variable name="DocAssignment">40</xsl:variable>
<xsl:variable name="ApprovalDate">6/06</xsl:variable>
<xsl:variable name="RevisedDate">09/08/06</xsl:variable>

<xsl:variable name="PrivacyHeader">
  <tr>
    <td style="text-align:center;">
      <font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY</font>
    </td>
  </tr>
</xsl:variable>

  <xsl:include href="../../../Core/Eforms/EFormTemplateLibrary.xslt" />
  <xsl:template match="eform">

<div align="left"  style="page-break-after:always;">

<!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <xsl:value-of select="$PrivacyHeader"/>
    <xsl:call-template name="EformHeader"/>
    <xsl:call-template name="EncounterDatePhysician"/>
    <tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">


      <xsl:for-each select="Encounters">
          <tr>
            <td width="100" align="left" valign="top" class="FormInnerRowRightBorder">
              <span class="blackBoldText">
                <img src="../../Images/shim.gif" border="0" width="4" height="1" />Vital Signs
              </span>
            </td>
            <td width="137" height="22" align="left" valign="top" class="FormInnerRowRightBorder"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncSystolic', 'VitalSigns')" >
              <img src="../../Images/shim.gif" border="0" width="4" height="0" />BP: <xsl:value-of select="EncSystolic"  /> / <xsl:value-of select="EncDiastolic"  />
            </td>
            <td width="137" height="22" align="left" valign="top" class="FormInnerRowRightBorder" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncPulse', 'VitalSigns')" >
              <img src="../../Images/shim.gif" border="0" width="4" height="0" />Pulse: <xsl:value-of select="EncPulse"  />
            </td>
            <td width="137" height="22" align="left" valign="top" class="FormInnerRowRightBorder" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncTemp', 'VitalSigns')" >
              <img src="../../Images/shim.gif" border="0" width="4" height="0" />Temp: <xsl:value-of select="EncTemp"  />
            </td>
            <td width="137" height="22" align="left" valign="top" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncRespiration', 'VitalSigns')" >
              <img src="../../Images/shim.gif" border="0" width="4" height="0" />Resp: <xsl:value-of select="EncRespiration"  />
            </td>
          </tr>
      </xsl:for-each>



      
        </table>
		</td>
    </tr>
    <tr> 
      <td height="32" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td width="3%" valign="middle">

              <xsl:for-each select="NoTable">
                <xsl:choose>
                  <xsl:when test="((Instructions != ''))">
                    <input type="checkbox" name="Instructions" checked="checked"  />
                  </xsl:when>
                  <xsl:otherwise>
                    <input type="checkbox" name="Instructions" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
              
              
              
            </td>
            <td width="97%" valign="middle">Post instructions reviewed. Fact Cards &quot;Instructions Following Your Urodynamics Study&quot; provided to patient.</td>
          </tr>
          <tr> 
            <td colspan="2" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td width="11%"><span class="blackBoldText">Signature:</span></td>
                  <td width="43%">_________________________________________</td>
                  <td width="20%"><span class="blackBoldText">Date:</span> ____/____/____                 </td>
                  <td width="26%"><span class="blackBoldText">Time:</span>_____:______ <span style="font-size: 9px;">AM / PM </span></td>
                </tr>
              </table>
			  </td>
          </tr>
        </table>
		</td>
    </tr>
    <tr> 
      <td height="32" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15" />Verification:</span>&#160;Patient Identity has been confirmed and agreement of planned procedure with patient and consent ensured.<br />
	  <img src="../../Images/shim.gif" border="0" width="315" height="10" />

        <xsl:for-each select="NoTable">
          <xsl:choose>
            <xsl:when test="((ProcedureVerification != ''))">
              <input type="checkbox" name="ProcedureVerification" checked="checked"  />
            </xsl:when>
            <xsl:otherwise>
              <input type="checkbox" name="ProcedureVerification" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
        
        Yes </td>
    </tr>
	<tr>
		<td class="FormOuterTableRow" height="85" align="left">
			<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="55%" valign="top" align="left" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1" />HPI</span></td>
					<td width="45%" align="left" valign="top" style="padding-left: 4px;"><span class="blackBoldText">Medications</span><br/>

            
            <xsl:value-of select="$MedicationRowsInline" disable-output-escaping="yes"/>
            <xsl:for-each select="Medications">
              <xsl:choose>
                <xsl:when test="((Medication != '') or (MedDose != '') or (MedUnits != '') or (MedSchedule != ''))">
                  <span style="display: block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications',{./@RecordId})">
                    <xsl:value-of select="Medication"  />&#160;&#160;
                    <xsl:value-of select="MedDose"  />&#160;
                    <xsl:value-of select="MedUnits"  />&#160;&#160;
                    <xsl:value-of select="MedSchedule"  />
                  </span>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
            <span style="display: block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
            &#160;
            </span>
            
            
            
            
            
            
            
					
				  </td>
				</tr>
			</table>
		</td>
	</tr>
    <tr>
		<td class="FormOuterTableRow" style="height: 100px; padding-left: 4px; padding-right: 4px; vertical-align: top;"><span class="blackBoldText">Previous History / Indication</span>
      <br/>
      <xsl:for-each select="Surveys[@RecordId=1]">
          <xsl:for-each select="SurveyItems[@RecordId=1]">
            <xsl:choose>
              <xsl:when test="(SurveyItemResult != '')">
                <span style="display: block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"><xsl:value-of select="SurveyItemResult"  /></span>
              </xsl:when>
              <xsl:otherwise>
                <table width="100%" border="0" cellspacing="0" cellpadding="0"  onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})">
                  <tr>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableTopLeftCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableTopCell">Post Prostatectomy</td>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableTopCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableTopCell">Radical Prostatectomy</td>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableTopCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableTopCell">Laprascopic Prostatectomy</td>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableTopCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableTopCell">Robot Assisted Prostatectomy</td>
                  </tr>
                  <tr>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Post Cystectomy</td>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Neobladder</td>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Ileal-conduit</td>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Cont. Cutaneous Reservoir</td>
                  </tr>
                  <tr>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Post Radical GI Surgery</td>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Post Radical GYN Surgery</td>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Post Radiation</td>
                    <td valign="middle" align="center" width="3%" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Post TURBT</td>
                  </tr>
                  <tr>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Post BCG Therapy</td>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Urgency</td>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Retention</td>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">
                      Incontinence&#160;&#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="absmiddle" />
                        PCa&#160;&#160;&#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="absmiddle" />Other Cause
                    </td>
                  </tr>
                  <tr>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Frequency</td>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Pelvic Prolapse</td>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Neurogenic Bladder</td>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">BPH</td>
                  </tr>
                  <tr>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Augmentation</td>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td colspan="3" valign="middle" align="left" class="FormInsideTableRegCell">
                      Catheter Use:<img src="../../Images/shim.gif" border="0" width="20" height="1" />
                        <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />
                          &#160;&#160;Intermittent<img src="../../Images/shim.gif" border="0" width="20" height="1" />
                            <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />&#160;&#160;In Dwelling 
                    </td>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" class="FormInsideTableRegCell">Preop for:</td>
                  </tr>
                  <tr>
                    <td valign="middle" align="center" class="FormInsideTableRegCell">
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                    </td>
                    <td valign="middle" align="left" colspan="7">Other:</td>
                  </tr>
                </table>
                
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
      </xsl:for-each>
		</td>
	</tr>
	<tr> 
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr> 
					<td valign="middle" colspan="2"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Procedure</span></td>
				</tr>
				<tr>
					<td colspan="2" align="left" valign="middle" class="FormInsideTableTopCell" width="90%" style="padding-left: 4px;">
            Multichannel Urodynamic Study Position:
            <xsl:for-each select="Surveys[@RecordId=1]">
              <xsl:for-each select="SurveyItems[@RecordId=2]">
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})">
                      <strong>
                        <xsl:value-of select="SurveyItemResult"  />
                      </strong>
                    </span>
                  </xsl:when>
                  <xsl:otherwise>
                    <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})">
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" style="vertical-align:text-bottom;" />Upright<img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" style="vertical-align:text-bottom;" />Supine
                  </span>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </xsl:for-each>
					
            <span style="padding-left: 65px;">
              Noninvasive uroflow was performed initially?
              <xsl:for-each select="Surveys[@RecordId=1]">
                <xsl:for-each select="SurveyItems[@RecordId=3]">
                  <xsl:choose>
                    <xsl:when test="(SurveyItemResult != '')">
                      <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </span>
                    </xsl:when>
                    <xsl:otherwise>
                      <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})">
                      <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" style="vertical-align:text-bottom;" />Yes <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" style="vertical-align:text-bottom;" />No
                    </span>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
              </xsl:for-each>
              
              </span></td>
				</tr>
				
				<tr><xsl:for-each select="NoTable">
				  <td colspan="2" align="left" valign="middle" class="FormInsideTableRegCell" style="padding-left: 4px; padding-bottom: 10px; border-bottom-color: #666666;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ComplexUroflometryPerformed', 'Disposition_Urodynamics')">Complex Uroflometry was performed today?
            
              <xsl:choose>
                <xsl:when test="(ComplexUroflometryPerformed != '')">
                  <strong><xsl:value-of select="ComplexUroflometryPerformed"  /></strong>
                </xsl:when>
                <xsl:otherwise>
                  <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" style="vertical-align:text-bottom;" />Yes <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" style="vertical-align:text-bottom;" />No
                </xsl:otherwise>
              </xsl:choose>
          </td></xsl:for-each>
			  </tr>
				<tr>
					<td colspan="2">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="15%" class="FormInsideTableRegCell" valign="middle" align="center">Qmax (ml/sec)</td>
								<td width="20%" class="FormInsideTableRegCell" valign="middle" align="center">Voided Volume (ml)</td>
								<td width="30%" class="FormInsideTableRegCell" valign="middle" align="center">Pattern</td>
								<td width="35%" class="FormInsideTableRegCell" valign="middle" align="center">Dual Lumen Catheter Size (French)</td>
							</tr>
							<tr><xsl:for-each select="Surveys[@RecordId=1]">
                    <xsl:for-each select="SurveyItems[@RecordId=4]">
                <td align="center" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                  
                      <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          &#160;
                        </xsl:otherwise>
                      </xsl:choose>
                   
                </td> </xsl:for-each>
                  </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                    <xsl:for-each select="SurveyItems[@RecordId=5]">
                      <td align="center" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >

                        <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          &#160;
                        </xsl:otherwise>
                      </xsl:choose>
                    
                </td></xsl:for-each>
                  </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                    <xsl:for-each select="SurveyItems[@RecordId=6]">
                      <td align="center" class="FormInsideTableRegCell"  valign="middle" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >

                        <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Normal
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Plateau
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Interrupted
                        </xsl:otherwise>
                      </xsl:choose>
                    

                  </td></xsl:for-each>
                  </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                    <xsl:for-each select="SurveyItems[@RecordId=7]">
                <td align="center" class="FormInsideTableRegCell"  valign="middle" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >

                  
                      <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />&#160;#7<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />&#160;#9
                        </xsl:otherwise>
                      </xsl:choose>
                    

                  </td></xsl:for-each>
                  </xsl:for-each>
							</tr>
						</table>					</td>
				</tr>
				<tr>
				  <td colspan="2" align="left" valign="middle" class="FormInsideTableRegCell"><table class="pageWidth" border="0" cellspacing="0" cellpadding="3">
                    <tr>
                      <td width="3%" valign="middle">
                        <xsl:for-each select="Surveys[@RecordId=1]">
                          <xsl:for-each select="SurveyItems[@RecordId=8]">
                            <xsl:choose>
                              <xsl:when test="(SurveyItemResult != '')">
                                <input type="checkbox" name="PVRByUltrasound" checked="checked"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"   />
                              </xsl:when>
                              <xsl:otherwise>
                                <input type="checkbox" name="PVRByUltrasound"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"  />
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                        </xsl:for-each>
                      </td>
                      <td valign="middle">Measurement of post void residual was performed by Ultrasound.&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<strong>
                        <xsl:for-each select="Surveys[@RecordId=1]">
                          <xsl:for-each select="SurveyItems[@RecordId=9]"><span  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                            <xsl:choose>
                              <xsl:when test="(SurveyItemResult != '')">
                                <xsl:value-of select="SurveyItemResult"  /> milliliters  
                              </xsl:when>
                              <xsl:otherwise>
                                _________ milliliters
                              </xsl:otherwise>
                            </xsl:choose></span>
                          </xsl:for-each>
                        </xsl:for-each>
                        </strong></td>
                    </tr>
                    <tr>
                      <td colspan="2" valign="middle"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="3">
                          <tr>
                            <td height="36"><span class="blackBoldText">Signature:</span> ____________________________________<img src="../../Images/shim.gif" border="0" width="30" height="1" /><span class="blackBoldText">Date:</span> ____/____/____<img src="../../Images/shim.gif" border="0" width="30" height="1" /><span class="blackBoldText">Time:</span>_____:______ <span style="font-size: 9px;">AM / PM </span></td>
                          </tr>
                      </table></td>
                    </tr>
                  </table></td>
			  </tr>
				<tr><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=10]">
           			<td align="left" valign="middle" class="FormInsideTableRegCell" width="50%" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"  ><img src="../../Images/shim.gif" border="0" width="4" height="1" />Catheter filling Rate: 
                  
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </xsl:when>
                      <xsl:otherwise>
                        <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Slow <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Medium <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Fast
                      </xsl:otherwise>
                    </xsl:choose>
              </td></xsl:for-each>
                </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                    <xsl:for-each select="SurveyItems[@RecordId=11]">
           			<td align="left" valign="middle" class="FormInsideTableRegCell" width="90%" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"  >
                  
                      <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <input type="checkbox" name="AbdominalPressureCatheter" checked="checked"  />
                        </xsl:when>
                        <xsl:otherwise>
                          <input type="checkbox" name="AbdominalPressureCatheter"  />
                        </xsl:otherwise>
                      </xsl:choose>
                    
                  Abdominal Pressure Catheter </td></xsl:for-each>
                  </xsl:for-each> 
				</tr>
			</table>
		</td>
	</tr>
	<tr> 
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Pressure Flow Study</span>
                        <span class="urodynamicsSectionComment">(Complex Uroflometry CPT:51741)</span>
                    </td>
				</tr>
				<tr><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=12]">
            		<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"  ><img src="../../Images/shim.gif" border="0" width="4" height="1" />Voiding at Capacity:
                
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </xsl:when>
                      <xsl:otherwise>
                        <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Allowed
                        <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Involuntary Detrusor
                      </xsl:otherwise>
                    </xsl:choose>
                  
                
					</td></xsl:for-each>
                </xsl:for-each>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Voiding Cystometrogram Peak Flow Rate (Qmax): 
                <xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=13]">
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" ><strong>
                          <xsl:value-of select="SurveyItemResult"  /> ml/sec
                        </strong></span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >______ ml/sec</span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>
                </xsl:for-each>
                
                <img src="../../Images/shim.gif" border="0" width="40" height="1" />Detrusor Pressure at Qmax:
                <xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=14]">
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" ><strong>
                          <xsl:value-of select="SurveyItemResult"  />  cmH<sub>2</sub>O
                        </strong>
                        </span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          _______  cmH<sub>2</sub>O
                        </span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>
                </xsl:for-each></td>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Bladder Outlet Obstruction Index
					<span class="smallGrayText">(<i>PdetQmax-2*Qmax</i>):</span>
                  <xsl:for-each select="Surveys[@RecordId=1]">
                    <xsl:for-each select="SurveyItems[@RecordId=15]">
                      <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                            <strong>
                              <xsl:value-of select="SurveyItemResult"  />
                            </strong>
                          </span>
                        </xsl:when>
                        <xsl:otherwise>
                          <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >__________</span>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                  </xsl:for-each>
                  <img src="../../Images/shim.gif" border="0" width="30" height="1" />Pattern: 
                  <xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=16]">
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <img src="../../Images/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Normal
                          <img src="../../Images/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Plateau
                          <img src="../../Images/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Interrupted
                        </span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>
                </xsl:for-each>

              </td>
				</tr>
				<tr><xsl:for-each select="Surveys[@RecordId=1]">
              <xsl:for-each select="SurveyItems[@RecordId=17]">
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" ><img src="../../Images/shim.gif" border="0" width="4" height="1" />Bladder Outlet Obstruction Index consistent with Obstruction?&#160;&#160;<span class="smallGrayText">(<i>BOOI&gt;40 means obstruction</i>): </span>
            
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                      <strong>
                        <xsl:value-of select="SurveyItemResult"  />
                      </strong>
                  </xsl:when>
                  <xsl:otherwise>
                      <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Yes
                      <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />No
                  </xsl:otherwise>
                </xsl:choose>
              
            
            
					</td></xsl:for-each>
            </xsl:for-each>
				</tr>
				<tr><xsl:for-each select="Surveys[@RecordId=1]">
              <xsl:for-each select="SurveyItems[@RecordId=18]">
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"  ><img src="../../Images/shim.gif" border="0" width="4" height="1" />Abdominal straining during voiding?
           
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </xsl:when>
                  <xsl:otherwise>
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Yes
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />No
                  </xsl:otherwise>
                </xsl:choose>
              
					</td></xsl:for-each>
            </xsl:for-each>
				</tr>
			</table>
		</td>
	</tr>
	<tr> 
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr> 
					<td valign="middle" colspan="5"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Filling Phase</span>
                        <span class="urodynamicsSectionComment">(Complex Cystometrogram CPT: 51728)</span>
                    </td>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="bottom" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=19]">
                    <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                      First Sensation:

                      <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          _______
                        </xsl:otherwise>
                      </xsl:choose> ml
                    </span>
                  </xsl:for-each>
                </xsl:for-each>
                
                <img src="../../Images/shim.gif" border="0" width="30" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=20]">
                    <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                      First Urge:
                      <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          _______
                        </xsl:otherwise>
                      </xsl:choose> ml
                    </span>
                  </xsl:for-each>
                </xsl:for-each>
					<img src="../../Images/shim.gif" border="0" width="30" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=21]">
                    <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                      Severe Urge:
                      <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          _______
                        </xsl:otherwise>
                      </xsl:choose> ml
                    </span>
                  </xsl:for-each>
                </xsl:for-each>
					<img src="../../Images/shim.gif" border="0" width="30" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=22]">
                    <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                      Bladder Capacity:
                      <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          _______
                        </xsl:otherwise>
                      </xsl:choose> ml
                    </span>
                  </xsl:for-each>
                </xsl:for-each></td>
				</tr>
				<tr>
       			  <td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell">
					<table width="98%" border="0" cellspacing="0" cellpadding="1">
                      <tr>
                        <td rowspan="5" valign="top" style="width: 18%"><strong>Detrusor Pressure:</strong> <br />
                            <span class="urodynamicsSectionComment">(CPT: 51797)</span>
                        <br />
                        <br /><span style="font-size:11px;">(Please Note: Poor<br/>Compliance equivalent<br/>to &lt;12.5 mL/cmH2O)</span></td>
                        <xsl:for-each select="Surveys[@RecordId=1]">
                          <xsl:for-each select="SurveyItems[@RecordId=23]"><td height="28" colspan="3" valign="middle" class="FormInsideTableTopLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >Resting Pressure (cmH<sub>2</sub>O):
                        
                            <xsl:choose>
                              <xsl:when test="(SurveyItemResult != '')">
                                <strong>
                                  <xsl:value-of select="SurveyItemResult"  />
                                </strong>
                              </xsl:when>
                              <xsl:otherwise>
                                _______
                              </xsl:otherwise>
                            </xsl:choose>
                      </td></xsl:for-each>
                        </xsl:for-each>
                      </tr>
                      <tr>
                        <td align="center" class="FormInsideTableLeftCell">Volume (ml)</td>
                        <td align="center" class="FormInsideTableRegCell">Pressure (cmH<sub>2</sub>O)</td>
                        <td align="center" class="FormInsideTableRegCell">Compliance (ml/cmH<sub>2</sub>O)</td>
                      </tr>
                      <tr><xsl:for-each select="Surveys[@RecordId=1]">
                            <xsl:for-each select="SurveyItems[@RecordId=24]">
                        <td class="FormInsideTableLeftCell" style="font-size: 10px; text-align: center;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          
                              <xsl:choose>
                                <xsl:when test="(SurveyItemResult != '')">
                                  <strong>
                                    <xsl:value-of select="SurveyItemResult"  />
                                  </strong>
                                </xsl:when>
                                <xsl:otherwise>
                                  &#160;
                                </xsl:otherwise>
                              </xsl:choose>
                            
                        </td></xsl:for-each>
                          </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                            <xsl:for-each select="SurveyItems[@RecordId=25]">
                        <td class="FormInsideTableRegCell" style="font-size: 10px; text-align: center;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          
                              <xsl:choose>
                                <xsl:when test="(SurveyItemResult != '')">
                                  <strong>
                                    <xsl:value-of select="SurveyItemResult"  />
                                  </strong>
                                </xsl:when>
                                <xsl:otherwise>
                                  &#160;
                                </xsl:otherwise>
                              </xsl:choose>
                            
                        </td></xsl:for-each>
                          </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                            <xsl:for-each select="SurveyItems[@RecordId=26]">
                        <td class="FormInsideTableRegCell" style="font-size: 10px; text-align: center;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          
                              <xsl:choose>
                                <xsl:when test="(SurveyItemResult != '')">
                                  <strong>
                                    <xsl:value-of select="SurveyItemResult"  />
                                  </strong>
                                </xsl:when>
                                <xsl:otherwise>
                                  &#160;
                                </xsl:otherwise>
                              </xsl:choose>
                            
                        </td></xsl:for-each>
                          </xsl:for-each>
                      </tr>
            <tr><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=27]">
              <td class="FormInsideTableLeftCell" style="font-size: 10px; text-align: center;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </xsl:when>
                      <xsl:otherwise>
                        &#160;
                      </xsl:otherwise>
                    </xsl:choose>
                  
              </td></xsl:for-each>
                </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=28]">
              <td class="FormInsideTableRegCell" style="font-size: 10px; text-align: center;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </xsl:when>
                      <xsl:otherwise>
                        &#160;
                      </xsl:otherwise>
                    </xsl:choose>
                  
              </td></xsl:for-each>
                </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=29]">
              <td class="FormInsideTableRegCell" style="font-size: 10px; text-align: center;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </xsl:when>
                      <xsl:otherwise>
                        &#160;
                      </xsl:otherwise>
                    </xsl:choose>
                  
              </td></xsl:for-each>
                </xsl:for-each>
            </tr>
            <tr><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=30]">
              <td class="FormInsideTableLeftCell" style="font-size: 10px; text-align: center;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </xsl:when>
                      <xsl:otherwise>
                        &#160;
                      </xsl:otherwise>
                    </xsl:choose>
                  
              </td></xsl:for-each>
                </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=31]">
              <td class="FormInsideTableRegCell" style="font-size: 10px; text-align: center;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </xsl:when>
                      <xsl:otherwise>
                        &#160;
                      </xsl:otherwise>
                    </xsl:choose>
                  
              </td></xsl:for-each>
                </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=32]">
              <td class="FormInsideTableRegCell" style="font-size: 10px; text-align: center;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </xsl:when>
                      <xsl:otherwise>
                        &#160;
                      </xsl:otherwise>
                    </xsl:choose>
                  
              </td></xsl:for-each>
                </xsl:for-each>
            </tr>
                    </table>
				  </td>
				</tr>
				  <tr> 
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" />
            <xsl:for-each select="Surveys[@RecordId=1]">
              <xsl:for-each select="SurveyItems[@RecordId=33]">
                <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                  Detrusor Overactivity:
                  <xsl:choose>
                    <xsl:when test="(SurveyItemResult != '')">
                      <strong>
                        <xsl:value-of select="SurveyItemResult"  />
                      </strong>
                    </xsl:when>
                    <xsl:otherwise>
                      <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />Yes
                      <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />No
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </xsl:for-each>
            </xsl:for-each>
            <img src="../../Images/FormImages/shim.gif" border="0" width="80" height="1" />
            <xsl:for-each select="Surveys[@RecordId=1]">
              <xsl:for-each select="SurveyItems[@RecordId=34]">
                <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                  Patient Leaked with Overactivity:
                  <xsl:choose>
                    <xsl:when test="(SurveyItemResult != '')">
                      <strong>
                        <xsl:value-of select="SurveyItemResult"  />
                      </strong>
                    </xsl:when>
                    <xsl:otherwise>
                      <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />Yes
                      <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />No
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </xsl:for-each>
            </xsl:for-each>
          </td>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Involuntary detrusor contraction with a detrusor pressure of <xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=35]">
                    <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                      <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          ________
                        </xsl:otherwise>
                      </xsl:choose> cmH<sub>2</sub>O
                    </span>
                  </xsl:for-each>
                </xsl:for-each> occurred at <xsl:for-each select="Surveys[@RecordId=1]"><xsl:for-each select="SurveyItems[@RecordId=36]">
                  <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </xsl:when>
                      <xsl:otherwise>
                        ________
                      </xsl:otherwise>
                    </xsl:choose> ml
                  </span>
                </xsl:for-each>
                </xsl:for-each></td>
				</tr>
				<tr> 
					<td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr><xsl:for-each select="Surveys[@RecordId=1]">
                            <xsl:for-each select="SurveyItems[@RecordId=37]">
                          <td width="33%" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >Approximate DLPP: 
                              <xsl:choose>
                                <xsl:when test="(SurveyItemResult != '')">
                                  <strong>
                                    <xsl:value-of select="SurveyItemResult"  />
                                  </strong>
                                </xsl:when>
                                <xsl:otherwise>
                                  ________
                                </xsl:otherwise>
                              </xsl:choose>
                             cmH<sub>2</sub>O </td></xsl:for-each>
                          </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                            <xsl:for-each select="SurveyItems[@RecordId=38]">
                          <td width="33%" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >Other IDC: 
                            
                              <xsl:choose>
                                <xsl:when test="(SurveyItemResult != '')">
                                  <strong>
                                    <xsl:value-of select="SurveyItemResult"  />
                                  </strong>
                                </xsl:when>
                                <xsl:otherwise>
                                  ________
                                </xsl:otherwise>
                              </xsl:choose>
                             cm/mL</td></xsl:for-each>
                          </xsl:for-each>
                          <xsl:for-each select="Surveys[@RecordId=1]">
                              <xsl:for-each select="SurveyItems[@RecordId=39]"><td width="23%" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                            
                                <xsl:choose>
                                  <xsl:when test="(SurveyItemResult != '')">
                                    <strong>
                                      <xsl:value-of select="SurveyItemResult"  />
                                    </strong>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    ________
                                  </xsl:otherwise>
                                </xsl:choose>
                               cm/mL</td></xsl:for-each>
                            </xsl:for-each>
                        </tr>
                      </table></td>
				</tr>
				<tr>
				  <td colspan="5" align="left" valign="bottom" class="FormInsideTableRegCell"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr><xsl:for-each select="Surveys[@RecordId=1]">
                          <xsl:for-each select="SurveyItems[@RecordId=40]">
                      <td onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                        Patient unable to void:

                        
                            <xsl:choose>
                              <xsl:when test="(SurveyItemResult != '')">
                                <strong>
                                  <xsl:value-of select="SurveyItemResult"  />
                                </strong>
                              </xsl:when>
                              <xsl:otherwise>
                                <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />Yes <img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" />No
                              </xsl:otherwise>
                            </xsl:choose>
                          
                        
                        
                        </td></xsl:for-each>
                        </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                          <xsl:for-each select="SurveyItems[@RecordId=42]">
                      <td width="33%"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                        QMax without catheter:

                        
                            <xsl:choose>
                              <xsl:when test="(SurveyItemResult != '')">
                                <strong>
                                  <xsl:value-of select="SurveyItemResult"  />
                                </strong>
                              </xsl:when>
                              <xsl:otherwise>
                                ___________
                              </xsl:otherwise>
                            </xsl:choose>
                          
                      </td></xsl:for-each>
                        </xsl:for-each>
                    </tr>
                    <tr><xsl:for-each select="Surveys[@RecordId=1]">
                          <xsl:for-each select="SurveyItems[@RecordId=41]">
                      <td  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                        If unable, Maximum pDet Obtained:

                        
                            <xsl:choose>
                              <xsl:when test="(SurveyItemResult != '')">
                                <strong>
                                  <xsl:value-of select="SurveyItemResult"  />
                                </strong>
                              </xsl:when>
                              <xsl:otherwise>
                                ___________
                              </xsl:otherwise>
                            </xsl:choose>
                          <br /></td></xsl:for-each>
                        </xsl:for-each>
                      <td>&#160;</td>
                    </tr>
                  </table></td>
			  </tr>
		  </table>
		</td>
	</tr><tr> 
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Video Findings</span><span class="urodynamicsSectionComment">(Injection of Contrast CPT: 51600)</span></td>
				</tr><xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=43]">
                    <tr onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
           			<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Video cystourethrogram revealed: 
                
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <strong>
                          <xsl:value-of select="SurveyItemResult"  />
                        </strong>
                      </xsl:when>
                      <xsl:otherwise>
                        <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Normal Bladder
                        <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Prostatic Impression
                        <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Other (specify):
                      </xsl:otherwise>
                    </xsl:choose>
                  
                
					</td>
				</tr></xsl:for-each>
                </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
                    <xsl:for-each select="SurveyItems[@RecordId=44]">
        <tr onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
           			<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Other findings:
                  
                      <xsl:choose>
                        <xsl:when test="(SurveyItemResult != '')">
                          <strong>
                            <xsl:value-of select="SurveyItemResult"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />None
                          <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Cystocele
                          <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Enterocele
                          <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Rectocele
                        </xsl:otherwise>
                      </xsl:choose>
                    
					</td>
				</tr></xsl:for-each>
                  </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=45]">
              <tr onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Bladder Neck at Rest: 
          
              <xsl:choose>
                <xsl:when test="(SurveyItemResult != '')">
                  <strong>
                    <xsl:value-of select="SurveyItemResult"  />
                  </strong>
                </xsl:when>
                <xsl:otherwise>
                  <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Open
                  <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Closed
                </xsl:otherwise>
              </xsl:choose>
           
          
					</td>
				</tr> </xsl:for-each>
          </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=46]">
              <tr onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
           			<td width="10%" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Bladder:</td>
          
              <xsl:choose>
                <xsl:when test="(SurveyItemResult != '')">
                  <td  colspan="3" class="FormInsideTableRegCell">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </td>
                  
                </xsl:when>
                <xsl:otherwise>
                  <td width="10%" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Smooth
                  </td>
                  <td width="45%" colspan="2" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Trabeculated:
                    <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Mild
                    <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Moderate
                    <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Severe
                  </td>
                  <td width="35%" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Diverticula:
                    <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Multiple
                    <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Large
                  </td>
                </xsl:otherwise>
              </xsl:choose>
            



        </tr></xsl:for-each>
          </xsl:for-each><xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=47]">
        <tr onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Bladder Neck During Voiding: 
          
              <xsl:choose>
                <xsl:when test="(SurveyItemResult != '')">
                  <strong>
                    <xsl:value-of select="SurveyItemResult"  />
                  </strong>
                </xsl:when>
                <xsl:otherwise>
                  <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Open
                  <img src="../../Images/shim.gif" border="0" width="10" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Closed
                </xsl:otherwise>
              </xsl:choose>
            
          
					</td>
				</tr></xsl:for-each>
          </xsl:for-each>
          
				<tr>
					<td  colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
              <xsl:for-each select="SurveyItems[@RecordId=48]">
                <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                  Reflux present:&#160;

                  <xsl:choose>
                    <xsl:when test="(SurveyItemResult != '')">
                      <strong>
                        <xsl:value-of select="SurveyItemResult"  />
                      </strong>
                    </xsl:when>
                    <xsl:otherwise>
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Yes&#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;No<img src="../../Images/shim.gif" border="0" width="30" height="1" />
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </xsl:for-each>
            </xsl:for-each>

            &#160;&#160;&#160;<span class="smallGrayText">If Yes:</span><img src="../../Images/shim.gif" border="0" width="15" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=49]">&#160;<span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
              Grade: Right
              <xsl:choose>
                <xsl:when test="(SurveyItemResult != '')">
                  <strong>
                    <xsl:value-of select="SurveyItemResult"  />
                  </strong>
                </xsl:when>
                <xsl:otherwise>
                  ______
                </xsl:otherwise>
              </xsl:choose>
            </span>
            </xsl:for-each>
          </xsl:for-each><img src="../../Images/shim.gif" border="0" width="4" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=50]">
              <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                Left
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </xsl:when>
                  <xsl:otherwise>
                    ______
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </xsl:for-each>
          </xsl:for-each>
            
            <img src="../../Images/shim.gif" border="0" width="30" height="1" />
            <xsl:for-each select="Surveys[@RecordId=1]">
              <xsl:for-each select="SurveyItems[@RecordId=51]">
                <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                  When:&#160;
                  <xsl:choose>
                    <xsl:when test="(SurveyItemResult != '')">
                      <strong>
                        <xsl:value-of select="SurveyItemResult"  />
                      </strong>
                    </xsl:when>
                    <xsl:otherwise>
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Filling&#160;&#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Voiding
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </xsl:for-each>
            </xsl:for-each>
            </td>
				</tr>
				<tr>
					<td  colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
              <xsl:for-each select="SurveyItems[@RecordId=52]">
                <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                  Urethrogram:&#160;

                  <xsl:choose>
                    <xsl:when test="(SurveyItemResult != '')">
                      <strong>
                        <xsl:value-of select="SurveyItemResult"  />
                      </strong>
                    </xsl:when>
                    <xsl:otherwise>
                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Normal&#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Stricture&#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Other:
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </xsl:for-each>
            </xsl:for-each>


            <img src="../../Images/shim.gif" border="0" width="140" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=53]">
              <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                Fluoroscopic Post Void Residual:
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </xsl:when>
                  <xsl:otherwise>
                    ______
                  </xsl:otherwise>
                </xsl:choose>  vol <span class="urodynamicsSectionComment">(CPT: 51798)</span>
              </span>
            </xsl:for-each>
          </xsl:for-each>
         </td>
				</tr>
			</table>
		</td>
	</tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU35<img src="../../Images/shim.gif" border="0" width="45" height="1" />U40<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC 
        Approval Date: 6/06<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:09/08/06<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">35</span></td>
    </tr>
  </table>
</div>




<div align="left"  id="LastPageInForm" runat="server"   >

<!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <xsl:value-of select="$PrivacyHeader"/>
    <xsl:call-template name="EformHeader"/>
    <xsl:call-template name="EncounterDatePhysician"/>
	<tr>
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
            		<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Leak Point Pressure</span><span class="urodynamicsSectionComment">(Intra-abdominal Pressure Study CPT: 51797)</span></td>
				</tr>
				<tr>
					<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />
          <xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=54]">
              <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                Did the patient leak?
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </xsl:when>
                  <xsl:otherwise>
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Yes
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />No
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </xsl:for-each>
          </xsl:for-each>


          
					<img src="../../Images/shim.gif" border="0" width="6" height="1" /><span class="blackBoldTextSmall">(If Yes, answer the questions below)</span><img src="../../Images/shim.gif" border="0" width="34" height="1" />
            <xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=55]">
              <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                With Catheter?
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </xsl:when>
                  <xsl:otherwise>
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Yes <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />No
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </xsl:for-each>
          </xsl:for-each>
        </td>
				</tr>
				<tr>
					<td colspan="5" align="left" valign="baseline" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=56]">
              <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                Valsalva Leak Point Pressure:
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </xsl:when>
                  <xsl:otherwise>
                    ______
                  </xsl:otherwise>
                </xsl:choose> cmH<sub>2</sub>O
              </span>
            </xsl:for-each>
          </xsl:for-each><img src="../../Images/shim.gif" border="0" width="30" height="1" />
            <xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=57]">
              <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                Bladder volume Refilled:&#160;

                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </xsl:when>
                  <xsl:otherwise>
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;150 ml&#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;200 ml&#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;300 ml
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </xsl:for-each>
            </xsl:for-each>
          </td>
				</tr>
				<tr>
					<td colspan="5" align="left" valign="baseline" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Valsalva Leak Point Pressure:
            <img src="../../Images/shim.gif" border="0" width="10" height="1" />
            <xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=58]">
              <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                With Catheter
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </xsl:when>
                  <xsl:otherwise>
                    ______
                  </xsl:otherwise>
                </xsl:choose> cmH<sub>2</sub>O
              </span>
            </xsl:for-each>
          </xsl:for-each><img src="../../Images/shim.gif" border="0" width="30" height="1" /><xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:for-each select="SurveyItems[@RecordId=59]">
              <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                Without Catheter
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </xsl:when>
                  <xsl:otherwise>
                    ______
                  </xsl:otherwise>
                </xsl:choose> cmH<sub>2</sub>O
              </span>
            </xsl:for-each>
          </xsl:for-each></td>
				</tr>
			</table>		</td>
	</tr>
	<tr> 
		<td class="FormOuterTableRow">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
            		<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">EMG</span></td>
				</tr>
				<tr><xsl:for-each select="Surveys[@RecordId=1]">
              <xsl:for-each select="SurveyItems[@RecordId=60]">
					<td align="left" valign="middle" class="FormInsideTableRegCell" width="90%" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" ><img src="../../Images/shim.gif" border="0" width="4" height="1" />EMG performed with patch electrodes placed in the midline at the perineum?
            
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult != '')">
                    <strong>
                      <xsl:value-of select="SurveyItemResult"  />
                    </strong>
                  </xsl:when>
                  <xsl:otherwise>
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />Yes
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />No
                  </xsl:otherwise>
                </xsl:choose>
              
					</td></xsl:for-each>
            </xsl:for-each>
				</tr>
				<tr>
           			<td colspan="5" align="left" valign="middle" class="FormInsideTableRegCell">
						<table width="100%" border="0" cellpadding="2" cellspacing="0">
							<tr>
								<td colspan="10" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />EMG Activity</td>
							</tr>
							<tr>
								
								<td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell">Progressive Filling</td>
								<td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell">Valsalva</td>
								<td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell">Cough</td>
								<td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell">Voiding</td>
								<td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell">Involuntary Detrusor</td>
							</tr>
							<tr>
                <xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=61]">
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <xsl:value-of select="SurveyItemResult"  />
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="middle" align="center" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Increase
                        </td>
                        <td valign="middle" align="center" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Decrease
                        </td>                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>
                </xsl:for-each>


                <xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=62]">
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <xsl:value-of select="SurveyItemResult"  />
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="middle" align="center" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Increase
                        </td>
                        <td valign="middle" align="center" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Decrease
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>
                </xsl:for-each>
                <xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=63]">
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <xsl:value-of select="SurveyItemResult"  />
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="middle" align="center" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Increase
                        </td>
                        <td valign="middle" align="center" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />&#160;Decrease
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>
                </xsl:for-each>
                <xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=64]">
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <xsl:value-of select="SurveyItemResult"  />
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="middle" align="center" class="FormInsideTableRegCell">
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"  />&#160;Increase
                        </td>
                        <td valign="middle" align="center" class="FormInsideTableRegCell">
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"  />&#160;Decrease
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>
                </xsl:for-each>
                <xsl:for-each select="Surveys[@RecordId=1]">
                  <xsl:for-each select="SurveyItems[@RecordId=65]">
                    <xsl:choose>
                      <xsl:when test="(SurveyItemResult != '')">
                        <td colspan="2" valign="middle" align="center" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" >
                          <xsl:value-of select="SurveyItemResult"  />
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td valign="middle" align="center" class="FormInsideTableRegCell">
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"  />&#160;Increase
                        </td>
                        <td valign="middle" align="center" class="FormInsideTableRegCell">
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})"  />&#160;Decrease
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>
                </xsl:for-each>
							</tr>
						</table>					</td>
				</tr>
			</table>		</td>
	</tr>
    <tr> <xsl:for-each select="Surveys[@RecordId=1]">
        <xsl:for-each select="SurveyItems[@RecordId=66]">
		<td class="FormOuterTableRow" style="padding-left: 4px; height: 70px; vertical-align: top;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})" ><span class="blackBoldText">Video Urodynamics Study Diagnosis</span>
     
          <xsl:choose>
            <xsl:when test="(SurveyItemResult != '')">
              <br/><xsl:value-of select="SurveyItemResult"  />
            </xsl:when>
            <xsl:otherwise>
              <table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td valign="middle" align="center" width="3%" class="FormInsideTableTopLeftCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableTopCell">Bladder Outlet Obstructions</td>
                  <td valign="middle" align="center" width="3%" class="FormInsideTableTopCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableTopCell">Poor Compliance</td>
                  <td valign="middle" align="center" width="3%" class="FormInsideTableTopCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableTopCell">Sphincter Incontinence</td>
                  <td valign="middle" align="center" width="3%" class="FormInsideTableTopCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableTopCell">Impaired Sensation</td>
                </tr>
                <tr>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Detrusor Sphincter Dyssynergia</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Urethral Stricture</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Diverticula</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Abdominal Voiding</td>
                </tr>
                <tr>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Detrusor Overactivity Incontinence</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Stomal Stenosis</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Detrusor Overactivity</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Peristalsis</td>
                </tr>
                <tr>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Detrusor Underactivity</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Small Capacity Bladder</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Large Capacity Bladder</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Filling Defect</td>
                </tr>
                <tr>
                  <td valign="middle" align="center" width="3%" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td  colspan="3" valign="middle" align="left" class="FormInsideTableRegCell">
                    Vesicoureteral Reflex<img src="../../Images/shim.gif" border="0" width="20" height="1" />Grade ____Left&#160;____Right
                  </td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Trabeculations</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Bladder stones</td>
                </tr>
                <tr>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left">Other:</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td colspan="3" align="left" valign="middle" class="FormInsideTableRegCell">Other:</td>
                  <td valign="middle" align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                  </td>
                  <td valign="middle" align="left" class="FormInsideTableRegCell">Prolaps</td>
                </tr>
              </table>
            </xsl:otherwise>
          </xsl:choose>
        
      
      
					</td></xsl:for-each>
      </xsl:for-each>
	</tr>
    <!--Problem Plan-->
    <xsl:call-template name="ProblemPlanTable"/>
    <!-- 
    <tr> 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="3" class="blackBoldText">Impression &amp; Plan</td>
          </tr>
          <tr> 
            <td width="43%" align="center" class="FormInsideTableTopCell"><strong>Diagnoses / Problem List</strong></td>
            <td width="4%" align="center" class="FormInsideTableTopCell"><strong>New</strong></td>
            <td width="43%" align="center" class="FormInsideTableTopCell"><strong>Plan 
              &amp; Referrals</strong></td>
          </tr>
          <tr> 
            <td height="30" valign="top" class="FormInsideTableRegCell">1.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"> 
              <input name="diagnosisNew1" type="checkbox" id="diagnosisNew1" /></td>
            <td class="FormInnerRowBottomBorder">&#160;</td>
          </tr>
          <tr> 
            <td height="30" valign="top" class="FormInsideTableRegCell">2.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew2" type="checkbox" id="diagnosisNew2" /></td>
            <td class="FormInnerRowBottomBorder">&#160;</td>
          </tr>
          <tr> 
            <td height="30" valign="top" class="FormInsideTableRegCell">3.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"> 
              <input name="diagnosisNew3" type="checkbox" id="diagnosisNew3" /></td>
            <td class="FormInnerRowBottomBorder">&#160;</td>
          </tr>
          <tr> 
            <td height="30" valign="top" class="FormInnerRowRightBorder">4.</td>
            <td align="center" valign="middle" class="FormInnerRowRightBorder"> 
              <input name="diagnosisNew3" type="checkbox" id="diagnosisNew3" /></td>
            <td>&#160;</td>
          </tr>
        </table>       </td>
    </tr>-->
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Disposition</span><br />

                <xsl:for-each select="NoTable">
                  <xsl:choose>
                    <xsl:when test="(Disposition != '')">
                      <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Disposition', 'Disposition_Urodynamics')"><xsl:value-of select="Disposition"  /></span>
                    </xsl:when>
                    <xsl:otherwise>
                      <input name="diagnosisNew34" type="checkbox" id="diagnosisNew34" />
                      Discharge Home&#160;&#160;&#160;&#160;&#160; <input name="diagnosisNew33" type="checkbox" id="diagnosisNew33" />
                      Transfer to UCC&#160;&#160;&#160;&#160;&#160; <input name="diagnosisNew32" type="checkbox" id="diagnosisNew32" />
                      Other (Specify): ____________________________
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>



              </td>
          </tr>
          <tr> 
            <td width="69%" class="FormInnerRowRightBorder">
				<table border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td colspan="2" height="18"><strong>Prescriptions:</strong></td>
                </tr>
                <xsl:for-each select="NoTable">
                  <xsl:for-each select="Prescriptions">
                    <tr  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('Prescriptions',{./@RecordId})">
                    <xsl:choose>
                      <xsl:when test="(PrescriptionType != '')">
                          <td height="18" >Rx: <span style="text-decoration: underline;"><xsl:value-of select="PrescriptionType"  /></span></td>
                      </xsl:when>
                      <xsl:otherwise>
                          <td height="18" >Rx: __________________________________________________________</td>
                      </xsl:otherwise>
                    </xsl:choose>
                      <xsl:choose>
                        <xsl:when test="(PrescriptionNewRefill != '')">
                           <td height="18" >&#160;&#160;&#160;(<span style="text-decoration: underline;"><xsl:value-of select="PrescriptionNewRefill"  /></span>)</td>
                          </xsl:when>
                        <xsl:otherwise>
                          <td height="18" >&#160;&#160;&#160;New:&#160;&#160;Yes&#160;&#160;&#160;&#160;&#160;No</td>
                        </xsl:otherwise>
                      </xsl:choose>
                    </tr>
                  </xsl:for-each>
                </xsl:for-each>
 <!--                <tr> 
                  <td height="18">Chemo Orders:</td>
                  <td align="center">No<img src="../../Images/shim.gif" border="0" width="22" height="1" />Yes:</td>
                  <td>____________________________________</td>
                </tr>-->
              </table></td>
            <td width="31%" align="center"><xsl:for-each select="NoTable">
              <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolNumber', 'Disposition_Urodynamics')" >Protocol #: 
              <xsl:choose>
                <xsl:when test="(ProtocolNumber != '')">
                  <xsl:value-of select="ProtocolNumber"  />
                </xsl:when>
                <xsl:otherwise>
                  ________
                </xsl:otherwise>
              </xsl:choose>
            </span></xsl:for-each><br />
				<table align="left" width="100%" border="0" cellpadding="0" cellspacing="1">
                <xsl:for-each select="NoTable"><tr onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsidered', 'Disposition_Urodynamics')" > 
                  <td>Considered:</td>
                  <td align="center">
                    
                      <xsl:choose>
                        <xsl:when test="(ProtocolConsidered != '')">
                          <span style="text-decoration: underline;">
                            <xsl:value-of select="ProtocolConsidered"  />
                          </span>
                        </xsl:when>
                        <xsl:otherwise>
                          Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No
                        </xsl:otherwise>
                      </xsl:choose>
                    
                    </td>
                </tr></xsl:for-each>
                <xsl:for-each select="NoTable"><tr onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsentObtained', 'Disposition_Urodynamics')" > 
                  <td>Consent Obtained:</td>
                  <td align="center">
                    
                      <xsl:choose>
                        <xsl:when test="(ProtocolConsentObtained != '')">
                          <span style="text-decoration: underline;">
                            <xsl:value-of select="ProtocolConsentObtained"  />
                          </span>
                        </xsl:when>
                        <xsl:otherwise>
                          Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No
                        </xsl:otherwise>
                      </xsl:choose>
                    
                  </td>
                </tr></xsl:for-each>
                <xsl:for-each select="NoTable"><tr onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolRegistered', 'Disposition_Urodynamics')" > 
                  <td>Registered:</td>
                  <td align="center">
                    
                      <xsl:choose>
                        <xsl:when test="(ProtocolRegistered != '')">
                          <span style="text-decoration: underline;">
                            <xsl:value-of select="ProtocolRegistered"  />
                          </span>
                        </xsl:when>
                        <xsl:otherwise>
                          Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No
                        </xsl:otherwise>
                      </xsl:choose>
                    
                  </td>
                </tr></xsl:for-each>
              </table>
              <br /> <br /></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td align="center" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" class="FormInnerRowRightBorder">
              <xsl:for-each select="NoTable">
                <span  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('GreaterThan50PercentTimeInCounseling', 'Disposition_Urodynamics')">
                <xsl:choose>
                  <xsl:when test="((GreaterThan50PercentTimeInCounseling != ''))">
                    <input type="checkbox" name="GreaterThan50PercentTimeInCounseling" checked="checked"  />
                  </xsl:when>
                  <xsl:otherwise>
                    <input type="checkbox" name="GreaterThan50PercentTimeInCounseling" />
                  </xsl:otherwise>
                </xsl:choose>
               &#8805; 50% of attending time was spent in counseling</span>
              </xsl:for-each><br />
			<img src="../../Images/shim.gif" border="0" width="1" height="20" />If so, mark total attending time in minutes &amp; describe on right:<br /> 
            <img src="../../Images/shim.gif" border="0" width="30" height="12" />
              <xsl:for-each select="NoTable">
                <span  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('TotalAttendingTime', 'Disposition_Urodynamics')">

                  <xsl:choose>
                    <xsl:when test="(TotalAttendingTime = '3')">
                      <span style="text-decoration: underline; font-weight: bold;">
                        15-24 (3)
                      </span>
                    </xsl:when>
                    <xsl:when test="(TotalAttendingTime = '4')">
                      <span style="text-decoration: underline; font-weight: bold;">
                        25-39 (4)
                      </span>
                    </xsl:when>
                    <xsl:when test="(TotalAttendingTime = '5')">
                      <span style="text-decoration: underline; font-weight: bold;">
                        40+ (5)
                      </span>
                    </xsl:when>
                    <xsl:when test="(TotalAttendingTime = '')">
                      <input type="checkbox" name="15-24 (3)2" />15-24 (3) &#160;&#160;&#160;&#160;
                      <input type="checkbox" name="25-39 (4)2" />25-39 (4) &#160;&#160;&#160;&#160;
                      <input type="checkbox" name="40+ (5)2" />40+ (5)
                    </xsl:when>
                  </xsl:choose>
                </span>
              </xsl:for-each>
			</td><xsl:for-each select="NoTable">
            <td width="50%" valign="top"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('CounselingDescription', 'Disposition_Urodynamics')" ><img src="../../Images/shim.gif" border="0" width="1" height="11" />Describe Counseling or Dictate Note:
            
              <xsl:choose>
                <xsl:when test="(CounselingDescription != '')">
                  <br/><xsl:value-of select="CounselingDescription"  />
                </xsl:when>
              </xsl:choose>
            
              
            </td></xsl:for-each>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td align="center" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <xsl:for-each select="NoTable"><td width="50%" class="FormInsideTableTopCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Dictated', 'Disposition_Urodynamics')" ><img src="../../Images/shim.gif" border="0" width="4" height="1" />
              
                <xsl:choose>
                  <xsl:when test="(Dictated != '')">
                    <strong>Dictated by:</strong>&#160;&#160;<xsl:value-of select="Dictated"  />
                  </xsl:when>
                  <xsl:otherwise>
                    Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1" />Fellow/ Resident<img src="../../Images/shim.gif" border="0" width="30" height="1" />Attending
                  </xsl:otherwise>
                </xsl:choose>
              
            </td></xsl:for-each>
			<td width="50%" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Copy to:&#160;&#160;&#160;
			<input name="fellow222" type="checkbox" id="fellow223" />referring M.D.: ________________________<br />
			<img src="../../Images/shim.gif" border="0" width="56" height="1" /><input name="fellow2222" type="checkbox" id="fellow2222" />other: _______________________________</td>
          </tr>
        </table>		</td>
    </tr>
    <tr >
      <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td><span class="blackBoldText">Signatures</span><br /></td>
            <td>&#160;</td>
          </tr>
          <tr class="FormOuterTableRow">
            <td width="15%"><span class="blackBoldText"><img src="../../images/shim.gif" border="0" width="6" height="1" />Fellow:</span></td>
            <td>________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></td>
          </tr>
          <!--<tr> 
            <td class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />NP / PA: </span></td>
            <td class="FormInnerRowBottomBorder"><span class="blackBoldText">_____________________________________________________________</span></td>
          </tr>-->
          <tr>
            <td colspan="2" valign="bottom"><span class="blackBoldText">
              <input name="fellow" type="checkbox" id="fellow" />
            </span>I personally performed or was physically present during the <strong>key portions</strong> of the procedure today.</td>
          </tr>
          <tr>
            <td><span class="blackBoldText">MD / Attending:</span></td>
            <td>________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM</span></td>
          </tr>
          
      </table></td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU35<img src="../../Images/shim.gif" border="0" width="45" height="1" />U40<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC 
        Approval Date: 6/06<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:09/08/06<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">35</span></td>
    </tr>
  </table>
</div>


  </xsl:template>
</xsl:stylesheet>