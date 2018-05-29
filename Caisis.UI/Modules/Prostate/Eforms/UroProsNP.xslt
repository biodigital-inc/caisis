<!-- <?xml version="1.0" encoding="UTF-8"?>-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--Parameters-->
<xsl:param name="CombinedBiopsies_Prostate" />
<xsl:param name="CombinedFamilyMembers" />
<xsl:param name="CombinedSocialHistories" />
<xsl:param name="CombinedRadTx" />
<xsl:param name="CombinedAllergies" />
<xsl:param name="CombinedComorbidities" />
<xsl:param name="CombinedProcedures" />
    

    <!--Variables-->
<!--Barcode Variables-->
<xsl:variable name="DocType">*U05*</xsl:variable>
<xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>
<xsl:variable name="ReportTitle">Urology Prostate New Patient</xsl:variable>
<!--Footer Variables-->
<xsl:variable name="DocNumber">01</xsl:variable>
<xsl:variable name="DocAssignment">05</xsl:variable>
<xsl:variable name="ApprovalDate">6/03</xsl:variable>
<xsl:variable name="RevisedDate">9/24/13</xsl:variable>
<!--Please Note: The footer cannot be implemented as a template until Jason's new page counting information is added
<xsl:variable name="PageNumber">X of Y</xsl:variable>-->

<!--Header Variables-->
<!--ToDo: Use institution Short Name From Web Config-->
<xsl:variable name="InstitutionShortName">MSKCC</xsl:variable>
<!--ToDo: Move to Library once other variables pulled from web config-->
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


          <!--eForm Header: Demographics, Institution Symbol and Form name-->
				<xsl:call-template name="EformHeader"/>
				<!--Date and Physician Header-->
				<xsl:call-template name="EncounterDatePhysician"/>
				<!--Referring MD Row
				<xsl:call-template name="ReferringMD"/>-->


          <tr>
              <td class="FormOuterTableRow" onmouseover="this.className='FormOuterTableRow chronListHilighted';" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByField('CategoryOfService')">
                  <table width="100%" border="0" cellpadding="1" cellspacing="0">
                      <tr>
                          <td colspan="2" align="left" valign="middle" class="FormInnerRowBottomBorder">
                              <img src="../../Images/shim.gif" border="0" width="4" height="1"/>
                              <span class="blackBoldText">Category of Service</span>
                          </td>
                      </tr>
                      <tr>
                          <td width="23%" valign="top" align="center" class="FormInsideTableRegCell">
                              <xsl:choose>
                                  <xsl:when test="starts-with(NoTable/CategoryOfService, 'New Patient Encounter')">
                                      <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" vspace="1" align="texttop"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop"/>
                                  </xsl:otherwise>
                              </xsl:choose>
                              &#160;New Patient Encounter<br />(CPT 99201-99205)
                          </td>
                          <td width="77%" valign="middle" class="FormInnerRowBottomBorder" style="padding-left: 4px; background-color: transparent;">
                                  Use for patients who have not been seen by anyone in your billing group in the last 3 years <strong>AND</strong><br />
                                  <img src="../../Images/shim.gif" border="0" width="12" height="1"/>
                                      <strong>-</strong>Are self referred (includes those referred by friend or patient)<br />
                                      <img src="../../Images/shim.gif" border="0" width="12" height="1"/>
                                          <strong>-</strong>Do not have  physician asking for your advice/opinion (see PIF sheet or PAS info)<br />
                                          <img src="../../Images/shim.gif" border="0" width="12" height="1"/>
                                              <strong>-</strong>Are referred solely for management and/or treatment of aspect of care<br />
                                          </td>
                      </tr>
                      <tr>
                          <td valign="top" align="center" class="FormInsideTableRegCell">
                              <xsl:choose>
                                  <xsl:when test="starts-with(NoTable/CategoryOfService, 'Office Consultation')">
                                      <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" vspace="1" align="texttop"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop"/>
                                  </xsl:otherwise>
                              </xsl:choose>
                              &#160;Office Consultation&#160;&#160;&#160;&#160;&#160;&#160;&#160;<br />(CPT 99241- 99245)
                          </td>
                          <td class="FormInnerRowBottomBorder" style="padding-left: 4px; background-color: transparent;">
                              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                  <tr>
                                      <td class="FormInnerRowBottomBorder" colspan="2" style="background-color: transparent;">
                                          Office Consultation is requested for my advice &#37; opinion regarding this patient’s
                                          <xsl:choose>
                                              <xsl:when test="(NoTable/OfficeConsultationRequestedReason != '')">
                                                  <span style="text-decoration: underline;">
                                                      <xsl:value-of select="NoTable/OfficeConsultationRequestedReason"/>
                                                  </span>
                                              </xsl:when>
                                              <xsl:otherwise>
                                                  ______________________________________________________
                                              </xsl:otherwise>
                                          </xsl:choose>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td colspan="2">
                                          <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                                              <tr >
                                                  <td align="left" height="22">
                                                      <img src="../../Images/shim.gif" border="0" width="4" height="0" />Requesting&#160;M.D.:
                                                          &#160;(MSKCC)&#160;<xsl:choose>
                                                          <xsl:when test="(NoTable/RequestingMD_Inside != '')">
                                                              <span style="text-decoration: underline;">
                                                                  <xsl:value-of select="NoTable/RequestingMD_Inside"/>
                                                              </span>
                                                          </xsl:when>
                                                          <xsl:otherwise>
                                                              <img src="../../images/shim.gif" border="0" width="200" height="1"/>
                                                          </xsl:otherwise>
                                                      </xsl:choose>
                                                      &#160;&#160;&#160;&#160;&#160;Non-MSKCC: <xsl:choose>
                                                      <xsl:when test="(NoTable/RequestingMD_Outside != '')">
                                                          <span style="text-decoration: underline;">
                                                              <xsl:value-of select="NoTable/RequestingMD_Outside"/>
                                                          </span>
                                                      </xsl:when>
                                                  </xsl:choose>
                                                      
                                                  </td>
                                              </tr>
                                          </table>
                                      </td>
                                  </tr>
                              </table>
                          </td>
                      </tr>
                      <tr>
                          <td valign="top" align="center" class="FormInnerRowRightBorder" style="background-color: transparent;">
                              <xsl:choose>
                                  <xsl:when test="starts-with(NoTable/CategoryOfService, 'Established Patient Visit')">
                                      <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" vspace="1" align="texttop"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                      <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop"/>
                                  </xsl:otherwise>
                              </xsl:choose>
                              &#160;Established Patient Visit<br />(CPT 99212-99215)
                          </td>
                          <td style="padding-left: 4px;">
                              Use for patients who<br />
                              <img src="../../Images/shim.gif" border="0" width="8" height="1"/>
                                  <strong>-</strong>Are seeing you for the first time for management or treatment (Not a consult) and have been seen<br />
                                  <img src="../../Images/shim.gif" border="0" width="14" height="1"/>
                                      by someone else in your billing group in the last 3 years<br />
                                      <img src="../../Images/shim.gif" border="0" width="8" height="1"/>
                                          <strong>-</strong>Are seeing you for follow-up care/visits
                                      </td>
                      </tr>
                  </table>
              </td>
          </tr>


          <!--Chief Complaint-->
				<tr> 
                  <td class="FormOuterTableRow" onmouseover="this.className='FormOuterTableRow chronListHilighted';" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByField('EncChiefComplaint')"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
                      <tr> 
                        <td height="50" align="left" valign="top" class="blackBoldText" style="padding: 2px 0px 0px 4px;">Chief Complaint
			            <span style="margin-left: 30px; font-size: 12px; font-weight: normal;">
                          <br/>
                                    <xsl:value-of select="Encounters/EncChiefComplaint"/>
                          </span>
                        </td>
                      </tr>
                    </table></td>
                </tr>
				<!--HPI-->
          <tr>
              <td class="FormOuterTableRow" height="470" valign="top" style="vertical-align:top; height: 470px; padding-left: 4px;">
                      <span class="blackBoldText">HPI</span>
                      <br/>
                      <table cellpadding="4" cellspacing="0" border="0">
                          <tr>
                              <td class="FormPopulatedSmallerText">
                                  <xsl:value-of select="$Hpi" disable-output-escaping="yes"/>
                              </td>
                          </tr>
                          <tr>
                              <td class="FormPopulatedSmallerText" style="padding-top: 15px;">
                                  <xsl:value-of select="NoTable/HPI_AddedText"/>
                              </td>
                          </tr>
                      </table>
                  </td>
          </tr>



          <xsl:choose>
              <xsl:when test="($DxBiopsyId != '')">

                  <tr>
                      <td class="FormOuterTableTopRow" valign="bottom"  style="padding: 2px;"  onmouseover="this.className='FormOuterTableRow chronListHilighted';" onmouseout="this.className='FormOuterTableRow'" onclick="LoadDataEntryForm('Pathology', '{$Dx_BxPathID}', '', '','ProstateBiopsyPath,PathologyStageGrade');">
                          <table cellspacing="0" cellpadding="0" style="width: 100%;">
                              <tr>
                                  <td style="width: 170px; padding: 16px 0px 4px 2px; border-bottom: solid 1px #999999;">
                                      Dx Date: <span style="text-decoration: underline; width: 90px;">
                                          <xsl:value-of select="$Dx_BxDateText" disable-output-escaping="yes"/>&#160;
                                      </span>
                                  </td>
                                  <td style="padding: 16px 0px 4px 0px; border-bottom: solid 1px #999999;">
                                      2002 Path Stage: <span style="text-decoration: underline; width: 25px;">
                                          <xsl:value-of select="$Dx_BxPathStageT" disable-output-escaping="yes"/>
                                      </span><img src="../../Images/shim.gif" border="0" width="10" height="1" /><span style="text-decoration: underline; width: 25px;">
                                          <xsl:value-of select="$Dx_BxPathStageN" disable-output-escaping="yes"/>
                                      </span><img src="../../Images/shim.gif" border="0" width="10" height="1" /><span style="text-decoration: underline; width: 25px;">
                                          <xsl:value-of select="$Dx_BxPathStageM" disable-output-escaping="yes"/>
                                      </span><img src="../../Images/shim.gif" border="0" width="20" height="1" />Gleason:<xsl:value-of select="$Dx_BxGG1" disable-output-escaping="yes"/> + <xsl:value-of select="$Dx_BxGG2" disable-output-escaping="yes"/> = <xsl:value-of select="$Dx_BxGGS" disable-output-escaping="yes"/><img src="../../Images/shim.gif" border="0" width="50" height="1" />PreTx PSA: <xsl:value-of select="$PreBxTxPSA" disable-output-escaping="yes"/>
                                  </td>
                              </tr>
                              <tr>
                                  <td>&#160;</td>
                                  <td style="padding: 16px 0px 4px 0px;">
                                      Biopsy Cores:<span style="margin-left: 20px;">
                                          # Positive: <span style="text-decoration: underline; width: 90px;">
                                              <xsl:value-of select="$Dx_BxPosCores" disable-output-escaping="yes"/>&#160;
                                          </span>
                                      </span><span style="margin-left: 30px;">
                                          # Negative: <span style="text-decoration: underline; width: 90px;">
                                              <xsl:value-of select="$Dx_BxNegCores" disable-output-escaping="yes"/>&#160;
                                          </span>
                                      </span>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
              </xsl:when>
              <xsl:otherwise>
                  <tr>
                      <td class="FormOuterTableTopRow" valign="bottom"  style="padding: 2px;"  onmouseover="this.className='FormOuterTableRow chronListHilighted';" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByField('DiagnosisUICC2002TStage', 'ProstateHPIWithDiagnosis')">
                          <table cellspacing="0" cellpadding="0" style="width: 100%;">
                              <tr>
                                  <td style="width: 170px; padding: 16px 0px 4px 2px; border-bottom: solid 1px #999999;">
                                      Dx Date:
                                      <xsl:choose>
                                          <xsl:when test="(Procedures[@RecordId=30]/ProcDateText != '')">
                                              <span style="text-decoration: underline;">
                                                  &#160;<xsl:value-of select="Procedures[@RecordId=30]/ProcDateText"/>&#160;
                                              </span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                              ____________
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </td>
                                  <td style="padding: 16px 0px 4px 0px; border-bottom: solid 1px #999999;">
                                      2002 Clinical Stage: <xsl:choose>
                                          <xsl:when test="(NoTable/DiagnosisUICC2002TStage != '')">
                                              <span style="text-decoration: underline;">
                                                  &#160;<xsl:value-of select="NoTable/DiagnosisUICC2002TStage"/>&#160;
                                              </span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                              T_____
                                          </xsl:otherwise>
                                      </xsl:choose><img src="../../Images/shim.gif" border="0" width="10" height="1" /><xsl:choose>
                                          <xsl:when test="(NoTable/DiagnosisUICC2002NStage != '')">
                                              <span style="text-decoration: underline;">
                                                  &#160;<xsl:value-of select="NoTable/DiagnosisUICC2002NStage"/>&#160;
                                              </span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                              N_____
                                          </xsl:otherwise>
                                      </xsl:choose><img src="../../Images/shim.gif" border="0" width="10" height="1" /><xsl:choose>
                                          <xsl:when test="(NoTable/DiagnosisUICC2002MStage != '')">
                                              <span style="text-decoration: underline;">
                                                  &#160;<xsl:value-of select="NoTable/DiagnosisUICC2002MStage"/>&#160;
                                              </span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                              M_____
                                          </xsl:otherwise>
                                      </xsl:choose><img src="../../Images/shim.gif" border="0" width="40" height="1" />Gleason:<xsl:choose>
                                          <xsl:when test="(Procedures[@RecordId=30]/Pathology[@RecordId=1]/ProstateBiopsyPath[@RecordId=1]/PathGG1 != '')">
                                              <span style="text-decoration: underline;">
                                                  &#160;<xsl:value-of select="Procedures[@RecordId=30]/Pathology[@RecordId=1]/ProstateBiopsyPath[@RecordId=1]/PathGG1"/>&#160;
                                              </span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                              _____<img src="../../Images/shim.gif" border="0" width="15" height="1" />
                                          </xsl:otherwise>
                                      </xsl:choose> + <xsl:choose>
                                          <xsl:when test="(Procedures[@RecordId=30]/Pathology[@RecordId=1]/ProstateBiopsyPath[@RecordId=1]/PathGG2 != '')">
                                              <span style="text-decoration: underline;">
                                                  &#160;<xsl:value-of select="Procedures[@RecordId=30]/Pathology[@RecordId=1]/ProstateBiopsyPath[@RecordId=1]/PathGG2"/>&#160;
                                              </span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                              _____<img src="../../Images/shim.gif" border="0" width="15" height="1" />
                                          </xsl:otherwise>
                                      </xsl:choose> = <xsl:choose>
                                          <xsl:when test="(Procedures[@RecordId=30]/Pathology[@RecordId=1]/ProstateBiopsyPath[@RecordId=1]/PathGGS != '')">
                                              <span style="text-decoration: underline;">
                                                  &#160;<xsl:value-of select="Procedures[@RecordId=30]/Pathology[@RecordId=1]/ProstateBiopsyPath[@RecordId=1]/PathGGS"/>&#160;
                                              </span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                              _____<img src="../../Images/shim.gif" border="0" width="15" height="1" />
                                          </xsl:otherwise>
                                      </xsl:choose><img src="../../Images/shim.gif" border="0" width="50" height="1" />PreTx PSA: <xsl:choose>
                                          <xsl:when test="(LabTests[@RecordId=30]/LabResult != '')">
                                              <span style="text-decoration: underline;">
                                                  &#160;<xsl:value-of select="LabTests[@RecordId=30]/LabResult"/>&#160;
                                              </span>
                                          </xsl:when>
                                      </xsl:choose>

                                  </td>
                              </tr>
                              <tr>
                                  <td>&#160;</td>
                                  <td style="padding: 16px 0px 4px 0px;">
                                      Biopsy Cores:<span style="margin-left: 20px;">
                                          # Positive: <xsl:choose>
                                              <xsl:when test="(Procedures[@RecordId=30]/Pathology[@RecordId=1]/ProstateBiopsyPath[@RecordId=1]/PathPosCores != '')">
                                                  <span style="text-decoration: underline;">
                                                      &#160;<xsl:value-of select="Procedures[@RecordId=30]/Pathology[@RecordId=1]/ProstateBiopsyPath[@RecordId=1]/PathPosCores"/>&#160;
                                                  </span>
                                              </xsl:when>
                                              <xsl:otherwise>
                                                  __________
                                              </xsl:otherwise>
                                          </xsl:choose>
                                      </span><span style="margin-left: 30px;">
                                          # Negative: <xsl:choose>
                                              <xsl:when test="(NoTable/DiagnosisNegativeCores != '')">
                                                  <span style="text-decoration: underline;">
                                                      &#160;<xsl:value-of select="NoTable/DiagnosisNegativeCores"/>&#160;
                                                  </span>
                                              </xsl:when>
                                              <xsl:otherwise>
                                                  __________
                                              </xsl:otherwise>
                                          </xsl:choose>
                                      </span>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
              </xsl:otherwise>
          </xsl:choose>



          <!--Nomogram Predictions-->

          <tr style="display: none;">
              <td class="FormOuterTableRow">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                          <td width="26%" rowspan="3" valign="top" class="FormInsideTableTopLeftCell">
                              <span class="blackBoldText">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="12" />Nomogram
                                  Predictions
                              </span>
                          </td>
                          <td height="24" colspan="2" class="FormInsideTableTopCell" style="border-right: none;">PFP PreRP 10 Yr:</td>
                          <td class="FormInsideTableTopCell" style="font-weight: bold;">
                              <xsl:value-of select="$preRP10Nomo" />&#160;
                          </td>
                          <td class="FormInsideTableTopCell" style="border-right: none;">PreBrachy 10 Yr:</td>
                          <td class="FormInsideTableTopCell" style="font-weight: bold;">
                              <xsl:value-of select="$preBrachyNomo" />&#160;
                          </td>
                          <td colspan="2" class="FormInsideTableTopCell" style="border-right: none;">PFP PostRP 10 Yr:</td>
                          <td class="FormInsideTableTopCell" style="font-weight: bold;">
                              <xsl:value-of select="$postRP10yrNomo" />&#160;
                          </td>
                      </tr>
                      <tr>
                          <td height="24" colspan="2" class="FormInsideTableRegCell" style="border-right: none;">PCSS PreRP 15 Yr:</td>
                          <td class="FormInsideTableRegCell" style="font-weight: bold;">&#160;</td>
                          <td class="FormInsideTableRegCell" style="border-right: none;">PreXRT 10 Yr:</td>
                          <td class="FormInsideTableRegCell" style="font-weight: bold;">
                              <xsl:value-of select="$preXRTNomo" />&#160;
                          </td>
                          <td colspan="2" class="FormInsideTableRegCell" style="border-right: none;">PCSS PostRP 15 Yr:</td>
                          <td class="FormInsideTableRegCell" style="font-weight: bold;">&#160;</td>
                      </tr>
                      <tr>
                          <td colspan="2" height="24" class="FormInsideTableRegCell" style="font-weight: bold;"  onmouseover="this.className='FormInsideTableRegCell chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByField('NomogramOCD')">
                              OCD:&#160;<xsl:value-of select="NoTable/NomogramOCD"/>
                          </td>
                          <td colspan="2" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.className='FormInsideTableRegCell chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByField('NomogramECE')">
                              ECE:&#160;<xsl:value-of select="NoTable/NomogramECE"/>
                          </td>
                          <td colspan="2" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.className='FormInsideTableRegCell chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByField('NomogramSVI')">
                              SVI:&#160;<xsl:value-of select="NoTable/NomogramSVI"/>
                          </td>
                          <td colspan="2" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.className='FormInsideTableRegCell chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByField('NomogramLNI')">
                              LNI:&#160;<xsl:value-of select="NoTable/NomogramLNI"/>
                          </td>
                      </tr>
                  </table>
              </td>
          </tr>
          <tr class="FormOuterTableRow">
              <td height="14" align="center" valign="bottom" class="blackBoldText">
                  GU01<img src="../../Images/shim.gif" border="0" width="45" height="1" />U05<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: 6/03
                  <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">1</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
              </td>
          </tr>
      </table>
  </div>


  <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
          <xsl:value-of select="$PrivacyHeader"/>
          <!--eForm Header: Demographics, Institution Symbol and Form name-->
          <xsl:call-template name="EformHeader"/>
          <!--Date and Physician Header-->
          <xsl:call-template name="EncounterDatePhysician"/>



    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td rowspan="2" width="50%" valign="top" style="padding-top: 1px; border-right: solid 1px #000000;">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="5"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Radiation Therapy</span></td>
                </tr>
                <tr class="eFormInnerTableRow">
                  <td width="20%" align="center" class="FormInsideTableTopLeftCell">Start</td>
                  <td width="20%" align="center" class="FormInsideTableTopCell">Stop</td>
                  <td width="20%" align="center" class="FormInsideTableTopCell">Target</td>
                  <td width="20%" align="center" class="FormInsideTableTopCell">Total Dose</td>
                  <td width="20%" align="center" class="FormInsideTableTopCell">Notes</td>
                </tr>


				<!--Radiation Therpay-->                
                  <xsl:for-each select="$CombinedRadTx/RadiationTherapy">
                                <xsl:choose>
                                    <xsl:when test="(@IsDB = 'true')">
                                <tr  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('RadiationTherapy', {./RadiationTherapyId}, 'RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxStopDateText,RadTxStopDate,RadTxNotes')" >
                      <td height="20" class="FormInsideTableLeftCell">&#160;<strong><xsl:value-of select="RadTxDateText"  /></strong></td>
                      <td class="FormInsideTableRegCell">&#160;<strong><xsl:value-of select="RadTxStopDateText"  /></strong></td>
                      <td class="FormInsideTableRegCell">&#160;<strong><xsl:value-of select="RadTxType"  />&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="RadTxTarget"  /></strong></td>
                      <td class="FormInsideTableRegCell">&#160;<strong><xsl:value-of select="RadTxTotalDose"  /></strong></td>
                      <td class="FormInsideTableRegCell">&#160;<strong><xsl:value-of select="RadTxNotes"  /></strong></td>
                    </tr>
                                    </xsl:when>
                                    <xsl:when test="(@IsDB = 'false') and (RadTxType != '')">
                                <tr  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"   onclick="LoadComponentByTable('RadiationTherapy',{./@RecordId})" >
                                    <td height="20" class="FormInsideTableLeftCell">
                                        &#160;<strong>
                                            <xsl:value-of select="RadTxDateText"  />
                                        </strong>
                                    </td>
                                    <td class="FormInsideTableRegCell">
                                        &#160;<strong>
                                            <xsl:value-of select="RadTxStopDateText"  />
                                        </strong>
                                    </td>
                                    <td class="FormInsideTableRegCell">
                                        &#160;<strong>
                                            <xsl:value-of select="RadTxType"  />&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="RadTxTarget"  />
                                        </strong>
                                    </td>
                                    <td class="FormInsideTableRegCell">
                                        &#160;<strong>
                                            <xsl:value-of select="RadTxTotalDose"  />
                                        </strong>
                                    </td>
                                    <td class="FormInsideTableRegCell">
                                        &#160;<strong>
                                            <xsl:value-of select="RadTxNotes"  />
                                        </strong>
                                    </td>
                                </tr>
                            </xsl:when>
                                    <xsl:otherwise>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>

                
                
                
                
                
                
                
            </table>
			</td>
            <td valign="top" width="50%"></td>
          </tr>
          <tr>
            <td style="vertical-align: top;"><table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="4"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Hormone Therapy</span></td>
                </tr>
                <tr>
                  <td height="18" colspan="1" align="center" class="FormInsideTableTopLeftCell">Start Date</td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">TX<br/>
                      <img src="../../Images/shim.gif" border="0" width="90" height="1" /></td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">Notes (Protocol #)</td>
                  <td colspan="1" align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>

                <xsl:for-each select="MedicalTherapy">
                    <xsl:choose>
                        <xsl:when test="(MedTxType != '')">
                            <tr  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('MedicalTherapy',{./@RecordId})" >
                                    <td height="20" class="FormInsideTableRegCell"><strong><xsl:value-of select="MedTxDateText"  /></strong></td>
                                    <td class="FormInsideTableRegCell"><strong><xsl:value-of select="MedTxAgent"  />&#160;<xsl:value-of select="MedTxDose"  /><xsl:value-of select="MedTxUnits"  /></strong></td>
                                    <td class="FormInsideTableRegCell"><strong><xsl:value-of select="MedTxNotes"  /></strong>&#160;</td>
                                    <td class="FormInsideTableRegCell"><strong><xsl:value-of select="MedTxStopDateText"  /></strong>&#160;</td>
                                </tr>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                <tr  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('MedicalTherapy', '', 'MedTxDateText,MedTxDate,MedTxType,MedTxAgent,MedTxDose,MedTxUnits,MedTxStopDateText,MedTxStopDate,MedTxNotes')" >
                    <td height="20" class="FormInsideTableRegCell">&#160;</td>
                  <td class="FormInsideTableRegCell">&#160;</td>
                  <td class="FormInsideTableRegCell">&#160;</td>
                  <td class="FormInsideTableRegCell">&#160;</td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    </tr>


				<!-- Allergies -->
				<tr> 
		<td width="650" class="FormOuterTableRow" height="100" valign="top" style="padding-left: 4px;"><span class="blackBoldText">Allergies</span>&#160;&#160;&#160;&#160;&#160;
            <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes"/>NKA&#160;&#160;&#160;&#160;<br/>
          <xsl:for-each select="$CombinedAllergies/Allergies">
              <xsl:choose>
                  <xsl:when test="(@IsDB = 'true')">
                      <span class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('Allergies', {./AllergyId}, 'Allergen,AllergyResponse')" >
                          <xsl:value-of select="Allergen"  /> (<xsl:value-of select="AllergyResponse"  />), 
                      </span>
                  </xsl:when>
                  <xsl:when test="(@IsDB = 'false') and (Allergen != '')">
                      <span  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('Allergies',{./@RecordId})" >
                          <xsl:value-of select="Allergen"  /> (<xsl:value-of select="AllergyResponse"  />), 
                      </span>
                 </xsl:when>
              </xsl:choose>
          </xsl:for-each>
          </td>
	</tr>






        <tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" valign="top" height="90" style="padding:4px;">
                  <span  class="blackBoldText" style="display:block; margin-bottom: 10px;">Medical &amp; Surgical History / Comorbidities</span>
                  <xsl:for-each select="$CombinedComorbidities/Comorbidities">
                    <xsl:choose>
                      <xsl:when test="(@IsDB = 'true')">
                        <span class="EFormTableRow" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('Comorbidities', {./ComorbidityId}, 'Comorbidity,ComorbDateText,ComorbDate')" >
                          <xsl:value-of select="ComorbDateText"  />&#160;&#160;<xsl:value-of select="Comorbidity"  /><br/>
                        </span>
                      </xsl:when>
                      <xsl:when test="(@IsDB = 'false') and (Comorbidity != '')">
                        <span  class="EFormTableRow" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('Comorbidities',{./@RecordId})" >
                          <xsl:value-of select="ComorbDateText"  />&#160;&#160;<xsl:value-of select="Comorbidity"  /><br/>
                        </span>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>


                  <xsl:for-each select="$CombinedProcedures/Procedures">
                    <xsl:choose>
                      <xsl:when test="(@IsDB = 'true')">
                        <span class="EFormTableRow" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('Procedures', {./ProcedureId}, 'ProcName,ProcDateText,ProcDate,ProcSide,ProcNotes')" >
                          <xsl:value-of select="ProcDateText"  />&#160;&#160;<xsl:value-of select="ProcName"  />&#160;&#160;<xsl:value-of select="ProcSide"  /><br/>
                        </span>
                      </xsl:when>
                      <xsl:when test="(@IsDB = 'false') and (ProcName != '')">
                        <span  class="EFormTableRow" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('Procedures',{./@RecordId})" >
                          <xsl:value-of select="ProcDateText"  />&#160;&#160;<xsl:value-of select="ProcName"  />&#160;&#160;<xsl:value-of select="ProcSide"  /><br/>
                        </span>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>

                </td>
              </tr>
            </table>
          </td>
        </tr>





        <tr>
              <td valign="top" class="FormOuterTableRow">
                  <style type="text/css">
                      table.FamilySocialHistoryHTMLTable
                      {
                      border-collapse: collapse;
                      }
                      table.FamilySocialHistoryHTMLTable td
                      {
                      border: solid 1px #333333;
                      }
                  </style>
                  <table  style="width: 100%;" border="0" cellspacing="0" cellpadding="4">
                      <tr valign="top">
                          <td width="49%" class="FormInnerRowRightBorder" style="height: 300px; vertical-align: top;">
                              <span class="blackBoldText" style="margin-right: 50px;">
                                  Family
                                  History:
                              </span>
                              <xsl:choose>
                                  <xsl:when test="contains(NoTable/FamilyHistoryNotes, 'No known family history of ca')">
                                      <input type="checkbox" name="FamilyHistoryNotes" checked="checked"  />
                                  </xsl:when>
                                  <xsl:otherwise>
                                      <input type="checkbox" name="FamilyMembers_Notes" />
                                  </xsl:otherwise>
                              </xsl:choose>
                              No known family history of ca<br/>

                              <table cellspacing="0"  class="FamilySocialHistoryHTMLTable">
                                  <xsl:for-each select="$CombinedFamilyMembers/FamilyMembers">
                                      <xsl:choose>
                                          <xsl:when test="(@IsDB = 'true')">
                                              <tr  class="EFormTableRow"  onmouseover="this.className='chronListHilighted EFormTableRow';" onmouseout="this.className='EFormTableRow'" onclick="LoadDataEntryForm('FamilyMembers', {./FamilyMemberId}, 'FamMemSide,FamMemRelation,FamMemDeathAge')" >
                                                  <td  height="34"  align="center">
                                                      <xsl:value-of select="FamMemRelation"  />&#160;
                                                      <xsl:if test="(FamMemSide != '')">
                                                          (<xsl:value-of select="FamMemSide"  />)
                                                      </xsl:if>
                                                  </td>
                                                  <td  style="padding-left: 4px;">
                                                      <xsl:for-each select="./FamilyMemberDiagnosis">
                                                          <xsl:value-of select="FamMemDiagnosis"  />&#160;
                                                          <xsl:if test="(FamMemDiagnosisAge != '')">
                                                              (Age <xsl:value-of select="FamMemDiagnosisAge"  />)
                                                          </xsl:if>
                                                          <xsl:if test="(FamMemNotes != '')">
                                                              - <xsl:value-of select="FamMemNotes"  />
                                                          </xsl:if>
                                                          <br/>
                                                      </xsl:for-each>&#160;
                                                  </td>
                                              </tr>
                                          </xsl:when>
                                          <xsl:when test="(@IsDB = 'false') and ((FamMemSide != '') or (FamMemRelation != '') or (FamMemDeathAge != ''))">
                                              <tr  class="EFormTableRow" onmouseover="this.className='chronListHilighted EFormTableRow';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('FamilyMembers',{./@RecordId})" >
                                                  <td  height="34" class="FormInsideTableRegCell" align="center">
                                                      <xsl:value-of select="FamMemRelation"  />&#160;
                                                      <xsl:if test="(FamMemSide != '')">
                                                          (<xsl:value-of select="FamMemSide"  />)
                                                      </xsl:if>
                                                  </td>
                                                  <td  style="padding-left: 4px;">
                                                      <xsl:for-each select="./FamilyMemberDiagnosis">
                                                          <xsl:value-of select="FamMemDiagnosis"  />&#160;
                                                          <xsl:if test="(FamMemDiagnosisAge != '')">
                                                              (Age <xsl:value-of select="FamMemDiagnosisAge"  />)
                                                          </xsl:if>
                                                          <xsl:if test="(FamMemNotes != '')">
                                                              - <xsl:value-of select="FamMemNotes"  />
                                                          </xsl:if>
                                                          <br/>
                                                      </xsl:for-each>&#160;
                                                  </td>
                                              </tr>
                                          </xsl:when>
                                          <xsl:otherwise>
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>


                              </table>




                          </td>
                          <td width="51%">

                              <a name="PatientsSocialHistories_Anchor"/>


                              <span class="blackBoldText">Social History:</span>
                              <br/>
                              <br/>



                              <xsl:for-each select="$CombinedSocialHistories/SocialHistories">
                                  <xsl:choose>
                                      <xsl:when test="(@IsDB = 'true')">


                                          <table  class="FamilySocialHistoryHTMLTable">
                                              <tr onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxOccupation', 'PatientsSocialHistories')">
                                                  <td width="10%" align="center" valign="middle" >
                                                      <strong>Occupation</strong>
                                                  </td>
                                                  <td  valign="middle" ><xsl:value-of select="SocHxOccupation"  />&#160;</td>

                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxMaritalStatus', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle">
                                                      <strong>Marital Status</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxMaritalStatus"  />&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxChildren', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Children</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxChildren"  />&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoType', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Tobacco Type</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxTobaccoType"  />&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoPacksPerDay', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Tobacco Usage</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:if test="(SocHxTobaccoPacksPerDay != '' or SocHxTobaccoYears != '' )">
                                                          <xsl:value-of select="SocHxTobaccoPacksPerDay"  />&#160;packs/day for&#160;<xsl:value-of select="SocHxTobaccoYears"  />&#160;years&#160;
                                                      </xsl:if>&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoQuitYear', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Year Quit</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxTobaccoQuitYear"  />&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxAlcohol', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Alcohol Use</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxAlcohol"  />&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxCarcinogen', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Carcinogen Exposure</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxCarcinogen"  />&#160;
                                                  </td>
                                              </tr>

                                          </table>



                                      </xsl:when>
                                      <xsl:when test="((SocHxOccupation != '') or (SocHxMaritalStatus != '') or (SocHxChildren != '') or (SocHxTobaccoType != '') or (SocHxTobaccoPacksPerDay != '') or (SocHxTobaccoYears != '') or (SocHxTobaccoQuitYear != '') or (SocHxAlcohol != '') or (SocHxCarcinogen != ''))">


                                          <table  class="FamilySocialHistoryHTMLTable" onmouseover="this.className='FamilySocialHistoryHTMLTable chronListHilighted';" onmouseout="this.className='FamilySocialHistoryHTMLTable'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxOccupation', 'PatientsSocialHistories')">
                                                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                                                      <strong>Occupation</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxOccupation"  />&#160;
                                                  </td>

                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxMaritalStatus', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Marital Status</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxMaritalStatus"  />&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxChildren', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Children</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxChildren"  />&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoType', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Tobacco Type</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxTobaccoType"  />&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoPacksPerDay', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Tobacco Usage</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:if test="(SocHxTobaccoPacksPerDay != '' or SocHxTobaccoYears != '' )">
                                                          <xsl:value-of select="SocHxTobaccoPacksPerDay"  />&#160;packs/day for&#160;<xsl:value-of select="SocHxTobaccoYears"  />&#160;years&#160;
                                                      </xsl:if>&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoQuitYear', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Year Quit</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxTobaccoQuitYear"  />&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxAlcohol', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Alcohol Use</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxAlcohol"  />&#160;
                                                  </td>
                                              </tr>
                                              <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxCarcinogen', 'PatientsSocialHistories')">
                                                  <td  align="center" valign="middle" class="FormInsideTableTopCell">
                                                      <strong>Carcinogen Exposure</strong>
                                                  </td>
                                                  <td  valign="middle" class="FormInsideTableLeftCell">
                                                      <xsl:value-of select="SocHxCarcinogen"  />&#160;
                                                  </td>
                                              </tr>

                                          </table>



                                      </xsl:when>
                                      <xsl:otherwise>


                                          <p>
                                              Occupation:
                                              <!--<asp:Label ID="socHxOccupation" Runat="server" />--><br/>
                                              <br/>
                                              Marital Status:
                                              <!--<asp:Label ID="socHxMaritalStatus" Runat="server" />--><img src="../../Images/shim.gif" border="0" width="30" height="1"/>
                                              Children:
                                              <!--<asp:Label ID="socHxChildren" Runat="server" />--><br/>
                                              <img src="../../Images/shim.gif" border="0" width="1" height="8"/>
                                              <br/>
                                              <table cellspacing="0" cellpadding="0">
                                                  <tr>
                                                      <td style="padding-right: 8px;">Tobacco Use:</td>
                                                      <td>
                                                          <input type="checkbox" name="Digitized222222"/> None
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td>&#160;</td>
                                                      <td>
                                                          <!--<asp:Label ID="socHxTobaccoType" Runat="server">
                                                                <input type="checkbox" name="Digitized2222"/>
                                                                    Cigarettes <img src="../../Images/shim.gif" border="0" width="10" height="8"/>
                                                                        <input type="checkbox" name="Digitized22222"/>
                                                                            Cigar<img src="../../Images/shim.gif" border="0" width="10" height="1"/>
                                                                                <input type="checkbox" name="Digitized22223"/>
                  Pipe</asp:Label>-->
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td>&#160;</td>
                                                      <td style="padding-top: 20px;">
                                                          <input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" NAME="socHxTobaccoPacksPerDayCheckBox"/>
                                                          <!--<asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label>-->
                                                          packs / day for
                                                          <!--<asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label>-->
                                                          years
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td>&#160;</td>
                                                      <td>
                                                          <input type="checkbox" id="socHxTobaccoQuitYearCheckbox" runat="server" NAME="socHxTobaccoQuitYearCheckbox"/>
                                                          Year Quit:
                                                          <!--<asp:Label ID="socHxTobaccoQuitYear" Runat="server">______</asp:Label>-->
                                                      </td>
                                                  </tr>

                                              </table>

                                              <br/>
                                              <br/>
                                              Alcohol Use:
                                              <!--<asp:Label ID="socHxAlcohol" Runat="server" />--><br/>
                                              <br/>
                                              Carcinogen Exposure:
                                              <!--<asp:Label ID="socHxCarcinogen" Runat="server" />--><br/>
                                          </p>
                                      </xsl:otherwise>
                                  </xsl:choose>
                              </xsl:for-each>





                          </td>
                      </tr>
                  </table>
              </td>
          </tr>
<tr>
      <td class="FormOuterTableRow"><table width="100%" border="0" cellpadding="2" cellspacing="0">
          <tr align="left" valign="top">
            <td colspan="3" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Health Maintenance</span></td>
          </tr>
          <tr>
            <td width="15%" align="center" class="FormInsideTableTopLeftCell">Diagnostic Test</td>
            <td width="15%" align="center" class="FormInsideTableTopCell">Date</td>
            <td width="70%" align="center" class="FormInsideTableTopCell">Results</td>
          </tr>
          <tr>
            <td height="25" align="center" class="FormInsideTableLeftCell">Last Colonoscopy</td>
            <td align="center" class="FormInsideTableRegCell"><xsl:value-of select="Diagnostics[@RecordId=11]/DxDateText"/>&#160;</td>
            <td align="center" class="FormInsideTableRegCell"><xsl:value-of select="Diagnostics[@RecordId=11]/DxResult"/>&#160;</td>
          </tr>
          
          
          <tr>
            <td height="25" align="center" class="FormInsideTableLeftCell">Last Stress Test</td>
            <td align="center" class="FormInsideTableRegCell"><xsl:value-of select="Diagnostics[@RecordId=12]/DxDateText"/>&#160;</td>
            <td align="center" class="FormInsideTableRegCell"><xsl:value-of select="Diagnostics[@RecordId=12]/DxResult"/>&#160;</td>
          </tr>
      </table></td>
    </tr>






          <tr class="FormOuterTableRow">
              <td height="14" align="center" valign="bottom" class="blackBoldText">
                  GU01<img src="../../Images/shim.gif" border="0" width="45" height="1" />U05<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: 6/03
                  <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">2</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
              </td>
          </tr>
      </table>
  </div>


  <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
          <xsl:value-of select="$PrivacyHeader"/>
          <!--eForm Header: Demographics, Institution Symbol and Form name-->
          <xsl:call-template name="EformHeader"/>
          <!--Date and Physician Header-->
          <xsl:call-template name="EncounterDatePhysician"/>

          <!--Lab Tests-->
          <!-- <xsl:call-template name="LabTable"/> -->

          <tr>
              <td class="FormOuterTableRow">
                  <a name="LabTests_Anchor"/>
                  <table class="EFormTable" cellspacing="0">
                      <tr class="EFormTableRow">
                          <td colspan="4">
                              <img src="../../Images/shim.gif" width="4" height="1" />
                              <span class="blackBoldText">Biochemical Markers / Lab Tests</span>
                          </td>
                      </tr>
                      <tr class="EFormTableRow">
                          <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                              <strong>Date</strong>
                          </td>
                          <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Marker</strong>
                          </td>
                          <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Value</strong>
                          </td>
                          <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Data Source</strong>
                          </td>
                      </tr>
                      <xsl:value-of select="$LabTestRows" disable-output-escaping="yes"/>
                      <xsl:for-each select="LabTests">
                          <xsl:choose>
                              <xsl:when test="((LabDateText != '') or (LabTest != '') or (LabResult != '') or (LabUnits != '') or (LabQuality != ''))">
                                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests',{./@RecordId})">
                                      <td align="center" valign="middle" class="FormInsideTableLeftCell">
                                          <xsl:value-of select="LabDateText"/>&#160;
                                      </td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                                          <xsl:value-of select="LabTest" />&#160;
                                      </td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                                          <xsl:value-of select="LabResult"  />&#160;
                                      </td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                                          <xsl:value-of select="LabQuality"  />&#160;
                                      </td>
                                  </tr>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:for-each>
                      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests','')">
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                          <!--<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>-->
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                      </tr>
                  </table>
              </td>
          </tr>
          <!--Diagnostic Tests-->
          <!-- <xsl:call-template name="DiagnosticsTable"/> -->

          <tr>
              <td class="FormOuterTableRow">
                  <a name="Diagnostics_Anchor"/>
                  <table class="EFormTable" cellspacing="0">
                      <tr class="EFormTableRow">
                          <td colspan="4">
                              <img src="../../Images/shim.gif" width="4" height="1" />
                              <span class="blackBoldText">Imaging</span>
                          </td>
                      </tr>
                      <tr class="EFormTableRow" >
                          <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                              <strong>Date</strong>
                          </td>
                          <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Study</strong>
                          </td>
                          <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Results</strong>
                          </td>
                          <td width="55%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Notes</strong>
                          </td>
                      </tr>
                      <!--Imaging data from the database-->
                      <xsl:value-of select="$ImagingRows" disable-output-escaping="yes"/>
                      <xsl:for-each select="Diagnostics">
                          <xsl:choose>
                              <xsl:when test="((@RecordId &lt; 11) and ((DxDateText != '') or (DxType != '') or (DxResult != '') or (DxNotes != '')))">
                                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})">
                                      <td align="center" valign="middle" class="FormInsideTableLeftCell">
                                          <xsl:value-of select="DxDateText"  />&#160;
                                      </td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                                          <xsl:value-of select="DxType"  />&#160;
                                      </td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                                          <xsl:value-of select="DxResult"  />&#160;
                                      </td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                                          <xsl:value-of select="DxNotes"  />&#160;
                                          <xsl:if test="(@RecordId = 1)">
                                              <br/>
                                              MRI Ureth. Length:<xsl:choose>
                                              <xsl:when test="(../NoTable/Imaging_MRIUrethLength != '')">
                                                  <span style="text-decoration: underline">&#160;<xsl:value-of select="../NoTable/Imaging_MRIUrethLength"  />&#160;</span>
                                              </xsl:when>
                                              <xsl:otherwise>
                                                  ________________
                                              </xsl:otherwise>
                                          </xsl:choose><br/>
                                              MRI Veins (0-4+):<xsl:choose>
                                              <xsl:when test="(../NoTable/Imaging_MRIVeins != '')">
                                                  <span style="text-decoration: underline">
                                                      &#160;<xsl:value-of select="../NoTable/Imaging_MRIVeins"  />&#160;
                                                  </span>
                                              </xsl:when>
                                              <xsl:otherwise>
                                                  ________________
                                              </xsl:otherwise>
                                          </xsl:choose><br/>
                                              Prostate Volume (cc):<xsl:choose>
                                              <xsl:when test="(../NoTable/Imaging_ProstateVolumeCC != '')">
                                                  <span style="text-decoration: underline">
                                                      &#160;<xsl:value-of select="../NoTable/Imaging_ProstateVolumeCC"  />&#160;
                                                  </span>
                                              </xsl:when>
                                              <xsl:otherwise>________________</xsl:otherwise>
                                          </xsl:choose>
                                      </xsl:if>
                                      </td>
                                  </tr>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:for-each>
                      <!-- empty row for adding new ones -->
                      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','')">
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                      </tr>
                  </table>
                  <a name="Imaging_AdditionalComments" />
                  <span style="display: block; height: 40px; vertical-align: top; padding: 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Imaging_AdditionalComments', 'Imaging_AdditionalComments')">
                      <strong style="display: block;">Additional Comments:</strong>
                      <xsl:value-of select="NoTable/Imaging_AdditionalComments"  />
                  </span>
              </td>
          </tr>


          <!--Previous Biopsies-->

    <tr> 
      <td class="FormOuterTableRow"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0"/>Previous Biopsies&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
                          <xsl:choose>
                      <xsl:when test="(NoTable/PreviousBiopsiesNotes != '')">
                          <input type="checkbox" name="PreviousBiopsiesNotes" checked="checked"  />
                      </xsl:when>
                      <xsl:otherwise>
                          <input type="checkbox" name="PreviousBiopsiesNotes"   />
                      </xsl:otherwise>
                  </xsl:choose><strong>Check if None</strong><br/> 
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Result</td>
            <td width="60%" align="center" valign="middle" class="FormInsideTableTopCell">Comments</td>
          </tr>
            <xsl:for-each select="//Procedures">
                <xsl:choose>
                    <xsl:when test="(./@RecordId &gt; 20) and (./@RecordId &lt; 26) and (ProcName != '')">

                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('Procedures',{./@RecordId});" > 
            <td height="24" align="center" class="FormInsideTableRegCell"><xsl:value-of select="ProcDateText"  />&#160;</td>
            <td class="FormInsideTableRegCell"><xsl:value-of select="ProcName"  />:&#160;&#160;<xsl:value-of select="Pathology/PathResult"  /></td>
            <td class="FormInsideTableRegCell"><xsl:value-of select="Pathology/PathNotes"  />&#160;</td>
          </tr>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('Procedures',21);" > 
            <td height="24" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"/></span>/</td>
            <td class="FormInsideTableRegCell">&#160;</td>
            <td class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
		</td>
    </tr>





          <!--Biopsies of the prostate-->
          <!-- <xsl:call-template name="BiopsiesProstateTable"/> -->














          <tr>
              <td class="FormOuterTableRow">
                  <span class="blackBoldText">
                      <img src="../../Images/shim.gif" border="0" width="4" height="0"/>Diagnostic Biopsy&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                  </span>
                  <xsl:choose>
                      <xsl:when test="(NoTable/BiopsiesNone != '')">
                          <input type="checkbox" name="BiopsiesNone" checked="checked"  />
                      </xsl:when>
                      <xsl:otherwise>
                          <input type="checkbox" name="BiopsiesNone"   />
                      </xsl:otherwise>
                  </xsl:choose>
                  <strong>Check if None</strong>
                  <xsl:choose>
                      <xsl:when test="(NoTable/BiopsiesNoPrior != '')">
                          <input type="checkbox" name="BiopsiesNoPrior" checked="checked"  style="margin-left: 20px;" />
                      </xsl:when>
                      <xsl:otherwise>
                          <input type="checkbox" name="BiopsiesNoPrior"  style="margin-left: 20px;"  />
                      </xsl:otherwise>
                  </xsl:choose>
                  <strong>No Prior Biopsy</strong>

                  <br/>
                  <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                      <tr>
                          <td style="width: 13%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Date</td>
                          <td style="width: 15%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Type</td>
                          <td style="width: 22%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Result</td>
                          <td style="width: 10%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Data Source </td>
                          <td style="width: 40%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Comments</td>
                      </tr>
                  </table>
              </td>
          </tr>



          <xsl:value-of select="$ProstateBiopsyRows" disable-output-escaping="yes"/>

          <xsl:for-each select="//Pathology">
              <xsl:choose>
                  <xsl:when test="((PathDateText != '') or (PathSpecimenType != '') or (PathResult != '') or (PathNotes != '') or (ProstateBiopsyPath/PathGG1 != '') or (ProstateBiopsyPath/PathGG2 != '') or (ProstateBiopsyPath/PathASAP != '') or (ProstateBiopsyPath/PathHG_PIN != ''))">
                      <tr>
                          <td class="FormOuterTableRow">
                              <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">

                                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology',{./@RecordId})">
                                      <td height="30"  style="width: 13%; border-top: solid 1px #000000; text-align: center; border-bottom: none;" class="FormInsideTableRegCell">
                                          <xsl:value-of select="PathDateText"  />&#160;
                                      </td>
                                      <td  style="width: 15%; border-top: solid 1px #000000; text-align: center;" class="FormInsideTableRegCell">
                                          <xsl:value-of select="PathSpecimenType"  />&#160;
                                      </td>
                                      <td class="FormInsideTableRegCell"  style="width: 22%; border-top: solid 1px #000000;text-align:center;">
                                          <xsl:if test="(ProstateBiopsyPath/PathGG1 != '') or (ProstateBiopsyPath/PathGG2 != '')">
                                              <xsl:value-of select="ProstateBiopsyPath/PathGG1"  />&#160;+&#160;<xsl:value-of select="ProstateBiopsyPath/PathGG2"  />&#160;=<xsl:value-of select="ProstateBiopsyPath/PathGGS"  />
                                          </xsl:if>
                                          <xsl:if test="(PathResult != '')">
                                              &#160;(<xsl:value-of select="PathResult"  />)
                                          </xsl:if>
                                      </td>
                                      <td class="FormInsideTableRegCell" style="width: 10%; border-top: solid 1px #000000;text-align:center;">
                                          <xsl:value-of select="PathQuality"  />&#160;
                                      </td>
                                      <td class="FormInsideTableRegCell" style="width: 40%; border-top: solid 1px #000000;">
                                          <xsl:value-of select="PathNotes"  />&#160;
                                      </td>
                                  </tr>
                                  <xsl:if test="(/eform/NoTable/BiopsiesEnterCoreData != '') and (.//ProstateBiopsyCorePath/PathCoreSide != '')">





                                      <tr id="CoresContainer" >
                                          <td class="FormInsideTableRegCell" style="padding: 0px 0px 0px 0px; border-bottom: none;">&#160;</td>
                                          <td colspan="4" style="padding: 0px 0px 0px 0px; border: none; ">

                                              <style type="text/css">
                                                  table.BiopsyCoresPopDataTable
                                                  {
                                                  width: 100%;
                                                  border-collapse: collapse;
                                                  }
                                                  table.BiopsyCoresPopDataTable td
                                                  {
                                                  text-align: center;
                                                  border: solid 1px #666666;
                                                  padding: 1px;
                                                  }
                                                  .inputFieldFlat
                                                  {
                                                  border: solid 1px #666666;
                                                  text-align: center;
                                                  }
                                              </style>
                                              <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" style="">
                                                  <tr>
                                                      <td align="center" valign="middle" class="FormInsideTableRegCell" style="width: 43%; padding: 8px 0px 4px 0px;">
                                                          <strong>Gleason Grade</strong>
                                                          &#160;&#160;<xsl:value-of select="ProstateBiopsyPath/PathGG1"  />&#160;<strong>+</strong>&#160; <xsl:value-of select="ProstateBiopsyPath/PathGG2"  />
                                                          &#160; <strong>=</strong>&#160; <xsl:value-of select="ProstateBiopsyPath/PathGGS"  />
                                                      </td>
                                                      <td align="center" valign="middle" class="FormInsideTableRegCell" style="padding: 8px 0px 4px 0px;">
                                                          <strong>Cores</strong> &#160;&#160;Positive:
                                                          <xsl:value-of select="ProstateBiopsyPath/PathPosCores"  />&#160;&#160;
                                                          Total:<xsl:value-of select="ProstateBiopsyPath/PathNumCores"  />
                                                      </td>
                                                  </tr>
                                              </table>
                                              <table class="BiopsyCoresPopDataTable" cellspacing="0" style="width: 100%; border-collapse: collapse;" >
                                                  <tr>
                                                      <td align="center">Side</td>
                                                      <td align="center">Laterality</td>
                                                      <td align="center">Level</td>
                                                      <td width="7%" align="center">Pos Cores</td>
                                                      <td width="7%" align="center">Total Cores </td>
                                                      <td width="7%" align="center">GG1</td>
                                                      <td width="7%" align="center">GG2</td>
                                                      <td width="7%" align="center">GGS</td>
                                                      <td width="7%" align="center">%Ca</td>
                                                      <td width="7%" align="center">mmCa</td>
                                                      <td width="8%" align="center">mmCore</td>
                                                      <td width="6%" align="center">PNI</td>
                                                      <td width="7%" align="center">ASAP</td>
                                                      <td width="7%" align="center">HG PIN </td>
                                                  </tr>
                                                  <xsl:for-each select="ProstateBiopsyCorePath">
                                                      <xsl:choose>
                                                          <xsl:when test="(PathCoreSide != '')">
                                                              <tr>
                                                                  <td style="height: 18px; text-align: center;">
                                                                      <xsl:value-of select="PathCoreSide"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreLaterality"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreLevel"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreNumCores"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreNumTotalCores"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreGG1"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreGG2"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreGGS"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCorePercCancer"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreMaxCancerLength"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreLength"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCorePNI_Diam"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreASAP"  />&#160;
                                                                  </td>
                                                                  <td style="text-align: center;">
                                                                      <xsl:value-of select="PathCoreHG_PIN"  />&#160;
                                                                  </td>
                                                              </tr>
                                                          </xsl:when>
                                                      </xsl:choose>
                                                  </xsl:for-each>
                                              </table>
                                          </td>
                                      </tr>












                                  </xsl:if>
                              </table>
                          </td>
                      </tr>
                  </xsl:when>
              </xsl:choose>
          </xsl:for-each>





















          <tr class="FormOuterTableRow">
				<td height="14" align="center" valign="bottom" class="blackBoldText">GU01<img src="../../Images/shim.gif" border="0" width="45" height="1" />U05<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: 6/03
				<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">3</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS</td>
			</tr>
			</table>
		</div>


    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <xsl:value-of select="$PrivacyHeader"/>
        <!--eForm Header: Demographics, Institution Symbol and Form name-->
				<xsl:call-template name="EformHeader"/>
				<!--Date and Physician Header-->
				<xsl:call-template name="EncounterDatePhysician"/>
				<!--Review of Systems-->
				<xsl:call-template name="ROS_Table"/>
				<!--Nursing Sign-off-->
          <!--<xsl:call-template name="ROS_Signature"/>-->
          <tr>
              <td class="FormOuterTableRow">
                  &#160;<span class="AttendingSignature_Blank blackBoldText">
                      <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes"/> PFSH and ROS performed by: ________________________________&#160;&#160;&#160;Date: ____/____/____ </span>
                  <span class="AttendingSignature_Signed blackBoldText" style="display: none;"><input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes" checked="checked" /> PFSH and ROS performed by: <img class="signedForm_signatureImage" style="height: 75px;vertical-align:middle;"  />&#160;&#160;&#160;Date: <span class="signedForm_date">____/____/____</span><img src="../../Images/shim.gif" border="0" width="18" height="1" />Time: <span class="signedForm_time">___:____ <span style="font-size: 9px;">AM / PM </span></span></span>



              </td>
          </tr>

          <tr class="FormOuterTableRow">
						<td height="14" align="center" valign="bottom" class="blackBoldText">GU01<img src="../../Images/shim.gif" border="0" width="45" height="1" />U05<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: 6/03
						<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">4</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS</td>
					</tr>
			</table>
			</div>

    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <xsl:value-of select="$PrivacyHeader"/>
        <!--eForm Header: Demographics, Institution Symbol and Form name-->
				<xsl:call-template name="EformHeader"/>
				<!--Date and Physician Header-->
				<xsl:call-template name="EncounterDatePhysician"/>


          <!--Vital Signs-->
				<xsl:call-template name="VitalsTable"/>
				<!--Physical Exam-->
				<xsl:call-template name="ExamsTable"/>
				<!--Rectal Exam-->
				<xsl:call-template name="RectalExamTable"/>
					<tr class="FormOuterTableRow">
						<td height="14" align="center" valign="bottom" class="blackBoldText">GU01<img src="../../Images/shim.gif" border="0" width="45" height="1" />U05<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: 6/03
						<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">5</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS</td>
					</tr>
			</table>
			</div>

    <div align="left"  id="LastPageInForm" runat="server">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <xsl:value-of select="$PrivacyHeader"/>
        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <xsl:call-template name="EncounterDatePhysician"/>
        <!--Problem Plan-->
        <xsl:call-template name="ProblemPlanTable"/>
        
        
        <!-- referrals -->
        <tr>
		<td class="FormOuterTableRow" style="padding: 4px; vertical-align: top; height: 50px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('Referrals', 'Referrals')">
            <a name="Referrals" />
		<span class="blackBoldText" style="display: block;">Referrals</span>
            <xsl:value-of select="NoTable/Referrals"  />
		</td>
	</tr>
        <!-- procedures planned -->
        <tr>
		<td class="FormOuterTableRow" style="padding: 4px; vertical-align: top; height: 70px;">
            <a name="Referrals" />
		<span class="blackBoldText" style="display: block;">Procedures Planned</span>
            <xsl:for-each select="NoTable/ProceduresPlanned">
                <xsl:choose>
                    <xsl:when test="(ProcName != '') or (ProcNotes != '')">
                        <span style="display: block;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByTable('ProceduresPlanned',{./@RecordId})">
                            <xsl:value-of select="ProcName"/>&#160;&#160;&#160;<xsl:value-of select="ProcDateText"/>&#160;&#160;&#160;<xsl:value-of select="ProcNotes"/>
                        </span>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
<span style="display: block;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByTable('ProceduresPlanned','')">&#160;</span>
		</td>
	</tr>
        
        
        
        
        <!-- Patient Consent Statements -->

        <tr>
            <td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
                <xsl:choose>
                    <xsl:when test="(NoTable/TreatmentRisksDiscussed != '')">
                        <input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" checked="checked" />
                    </xsl:when>
                    <xsl:otherwise>
                        <input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;"  />
                    </xsl:otherwise>
                </xsl:choose>
                Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.
            </td>
        </tr>
        <tr>
            <td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
                <xsl:choose>
                    <xsl:when test="(NoTable/ProtocolRisksDiscussed != '')">
                        <input type="checkbox" name="ProtocolRisksDiscussed" style="vertical-align: middle;" checked="checked" />
                    </xsl:when>
                    <xsl:otherwise>
                        <input type="checkbox" name="ProtocolRisksDiscussed" style="vertical-align: middle;"  />
                    </xsl:otherwise>
                </xsl:choose> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.
            </td>
        </tr>
        
        <!--Disposition Prescrptions-->
        <xsl:call-template name="DispoPrescriptionsTable"/>
        <!--Disposition Protocol-->
        <xsl:call-template name="DispoProtocolTable"/>
        <!--Disposition Attending Time-->
        <xsl:call-template name="DispoAttendingTimeTable"/>
        <!--Approval Signature-->
        <!-- <xsl:call-template name="ApprovalSignature"/>-->

          <tr>
              <td class="FormOuterTableRow">
                  <table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
                      <tr>
                          <td colspan="2">
                              <span class="blackBoldText">Signatures</span>
                          </td>
                          <td>&#160;</td>
                          <td class="blackBoldText">&#160;</td>
                      </tr>
                      <tr>
                          <td align="right">
                              <span class="blackBoldText">
                                  <img src="../../Images/shim.gif" border="0" width="6" height="1" />Fellow:
                              </span>
                          </td>
                          <td align="left">
                              <span class="blackBoldText">_________________________________________</span>
                          </td>
                          <td>
                              <span class="blackBoldText">Date:____/____/____</span>
                          </td>
                          <td class="blackBoldText">
                              Time:___:____ <span style="font-size: 9px;">AM / PM </span>
                          </td>
                      </tr>
                      <tr>
                          <td align="right">
                              <span class="blackBoldText">
                                  <img src="../../Images/shim.gif" border="0" width="6" height="1" />NP/PA:
                              </span>
                          </td>
                          <td align="left">
                              <span class="blackBoldText">_________________________________________</span>
                          </td>
                          <td>
                              <span class="blackBoldText">Date:____/____/____</span>
                          </td>
                          <td class="blackBoldText" style="white-space:nowrap;">
                              Time:___:____ <span style="font-size: 9px;">AM / PM </span>
                          </td>
                      </tr>
                      <tr class="pageWidth">
                          <td height="40" align="right" valign="bottom" style="padding-bottom: 0px; padding-top: 13px;">
                              <span class="blackBoldText">
                                  Attending&#160;<br />
                                  Addendum:
                              </span>
                          </td>
                          <td colspan="3"  class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&#160;</td>
                      </tr>
                      <tr class="pageWidth">
                          <td>&#160;</td>
                          <td colspan="3"  class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&#160;</td>
                      </tr>
                      <tr align="center">
                          <td colspan="4">
                              <table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                                  <tr>
                                      <td style="vertical-align: top;padding-top: 3px;">
                                          <xsl:choose>
                                              <xsl:when test="(NoTable/SignatureStatement_Attending != '')">
                                                  <input type="checkbox" name="AgreeWithFellow" checked="checked" style="margin: 0px 0px 0px 0px;" />
                                              </xsl:when>
                                              <xsl:otherwise>
                                                  <input type="checkbox" name="AgreeWithFellow" style="margin: 0px 0px 0px 0px;" />
                                              </xsl:otherwise>
                                          </xsl:choose>
                                      </td>
                                      <td style="vertical-align: top;"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SignatureStatement_Attending', 'SignatureStatement_Attending')">
                                          I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.
                                      </td>
                                  </tr>
                                  <tr>
                                      <td colspan="2" style="padding-top: 20px; text-align: center;">
                                          <span class="AttendingSignature_Blank blackBoldText">
                                              <img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="35" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span>
                                          </span>
                                          <span class="AttendingSignature_Signed blackBoldText" style="display: none;">
                                              <img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: <img class="signedForm_signatureImage" style="height: 90px;vertical-align:middle;"  />
                                              <img src="../../Images/shim.gif" border="0" width="35" height="1" />Date: <span class="signedForm_date">____/____/____</span><img src="../../Images/shim.gif" border="0" width="32" height="1" />Time: <span class="signedForm_time">___:____ <span style="font-size: 9px;">AM / PM </span></span>
                                          </span>
                                      </td>
                                  </tr>
                              </table>
                          </td>
                      </tr>
                  </table>
              </td>
          </tr>
        <tr class="FormOuterTableRow">
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            GU01<img src="../../Images/shim.gif" border="0" width="45" height="1" />U05<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: 6/03
            <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">6</span> of <span id="TotalPages">6</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
          </td>
        </tr>
      </table>
    </div>
    
    

</xsl:template>
</xsl:stylesheet>
