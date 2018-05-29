<!-- <?xml version="1.0" encoding="UTF-8"?>-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--Parameters-->
<xsl:param name="CombinedBiopsies_Prostate" />
<xsl:param name="CombinedDiagnostics" />
<xsl:param name="CombinedLabTests_Prostate" />
<xsl:param name="HadProstatectomy" />




  <!--Variables-->
<!--Barcode Variables-->
<xsl:variable name="DocType">*U06*</xsl:variable>
<xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>
<xsl:variable name="ReportTitle">Urology Prostate Follow-Up Patient</xsl:variable>
<!--Footer Variables-->
<xsl:variable name="DocNumber">02</xsl:variable>
<xsl:variable name="DocAssignment">06</xsl:variable>
<xsl:variable name="ApprovalDate">6/03</xsl:variable>
<xsl:variable name="RevisedDate">09/08/06</xsl:variable>
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
				<!--Referring MD Row-->
				<xsl:call-template name="ReferringMD"/>
				<!--Chief Complaint-->
				<tr> 
                  <td class="FormOuterTableRow" onmouseover="this.className='FormOuterTableRow chronListHilighted';" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByField('EncChiefComplaint')"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
                      <tr> 
                        <td height="50" align="left" valign="top" class="blackBoldText" style="padding: 2px 0px 0px 4px;">Chief Complaint
			            <span style="margin-left: 30px; font-size: 12px; font-weight: normal;">
                            <xsl:choose>
                                <xsl:when test="(NoTable/EncChiefComplaint_PresetOption = 'Active Surveillance')">
                                    <input type="checkbox" name="ActiveSurveillance_ChiefComplaint" style="vertical-align: middle;" checked="checked" />
		                        </xsl:when>
		                        <xsl:otherwise>
                                    <input type="checkbox" name="ActiveSurveillance_ChiefComplaint" style="vertical-align: middle;"  />
                                </xsl:otherwise>
                            </xsl:choose>
                            Active Surveillance
                          <br/>
                            <xsl:choose>
                                <xsl:when test="(Encounters/EncChiefComplaint != 'Active Surveillance')">
                                    <xsl:value-of select="Encounters/EncChiefComplaint"/>
                                </xsl:when>
                            </xsl:choose>
                          </span>
                        </td>
                      </tr>
                    </table></td>
                </tr>
				<!--HPI-->
                  <tr class="EFormTableRow">
                      <td  class="FormOuterTableRow">
                          <table class="EFormTable" cellspacing="0" >
                              <tr class="EFormTableRow">
                                  <td width="100%" align="left" valign="top">
                                      <img src="../../Images/shim.gif" width="4" height="1" />
                                      <span class="blackBoldText">HPI</span>
                                      <xsl:value-of select="$Hpi" disable-output-escaping="yes"/>
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
                                  <td style="width: 170px; padding: 16px 0px 4px 2px; border-bottom: solid 1px #999999;">Dx Date: <span style="text-decoration: underline; width: 90px;">
                                      <xsl:value-of select="$Dx_BxDateText" disable-output-escaping="yes"/>&#160;
                                  </span>
                              </td>
                                  <td style="padding: 16px 0px 4px 0px; border-bottom: solid 1px #999999;">
                                      2002 Path Stage: <span style="text-decoration: underline; width: 25px;"><xsl:value-of select="$Dx_BxPathStageT" disable-output-escaping="yes"/></span><img src="../../Images/shim.gif" border="0" width="10" height="1" /><span style="text-decoration: underline; width: 25px;"><xsl:value-of select="$Dx_BxPathStageN" disable-output-escaping="yes"/></span><img src="../../Images/shim.gif" border="0" width="10" height="1" /><span style="text-decoration: underline; width: 25px;"><xsl:value-of select="$Dx_BxPathStageM" disable-output-escaping="yes"/></span><img src="../../Images/shim.gif" border="0" width="20" height="1" />Gleason:<xsl:value-of select="$Dx_BxGG1" disable-output-escaping="yes"/> + <xsl:value-of select="$Dx_BxGG2" disable-output-escaping="yes"/> = <xsl:value-of select="$Dx_BxGGS" disable-output-escaping="yes"/><img src="../../Images/shim.gif" border="0" width="50" height="1" />PreTx PSA: <xsl:value-of select="$PreBxTxPSA" disable-output-escaping="yes"/>
                                  </td>
                              </tr>
                              <tr>
                                  <td>&#160;</td>
                                  <td style="padding: 16px 0px 4px 0px;">
                                      Biopsy Cores:<span style="margin-left: 20px;"># Positive: <span style="text-decoration: underline; width: 90px;"><xsl:value-of select="$Dx_BxPosCores" disable-output-escaping="yes"/>&#160;</span>
                                  </span><span style="margin-left: 30px;"># Negative: <span style="text-decoration: underline; width: 90px;"><xsl:value-of select="$Dx_BxNegCores" disable-output-escaping="yes"/>&#160;</span>
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
                                              <xsl:when test="(Procedures[@RecordId=30]/Pathology[@RecordId=1]/ProstateBiopsyPath[@RecordId=1]/PathNumCores != '')">
                                                  <span style="text-decoration: underline;">
                                                      &#160;<xsl:value-of select="Procedures[@RecordId=30]/Pathology[@RecordId=1]/ProstateBiopsyPath[@RecordId=1]/PathNumCores"/>&#160;
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
                          <td class="FormInsideTableTopCell" style="font-weight: bold;"><xsl:value-of select="$preRP10Nomo" />&#160;</td>
                          <td class="FormInsideTableTopCell" style="border-right: none;">PreBrachy 10 Yr:</td>
                          <td class="FormInsideTableTopCell" style="font-weight: bold;"><xsl:value-of select="$preBrachyNomo" />&#160;</td>
                          <td colspan="2" class="FormInsideTableTopCell" style="border-right: none;">PFP PostRP 10 Yr:</td>
                          <td class="FormInsideTableTopCell" style="font-weight: bold;"><xsl:value-of select="$postRP10yrNomo" />&#160;</td>
                      </tr>
                      <tr>
                          <td height="24" colspan="2" class="FormInsideTableRegCell" style="border-right: none;">PCSS PreRP 15 Yr:</td>
                          <td class="FormInsideTableRegCell" style="font-weight: bold;">&#160;</td>
                          <td class="FormInsideTableRegCell" style="border-right: none;">PreXRT 10 Yr:</td>
                          <td class="FormInsideTableRegCell" style="font-weight: bold;"><xsl:value-of select="$preXRTNomo" />&#160;</td>
                          <td colspan="2" class="FormInsideTableRegCell" style="border-right: none;">PCSS PostRP 15 Yr:</td>
                          <td class="FormInsideTableRegCell" style="font-weight: bold;">&#160;</td>
                      </tr>
                      <tr>
                          <td colspan="2" height="24" class="FormInsideTableRegCell" style="font-weight: bold;"  onmouseover="this.className='FormInsideTableRegCell chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByField('NomogramOCD')">OCD:&#160;<xsl:value-of select="NoTable/NomogramOCD"/></td>
                          <td colspan="2" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.className='FormInsideTableRegCell chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByField('NomogramECE')">ECE:&#160;<xsl:value-of select="NoTable/NomogramECE"/></td>
                          <td colspan="2" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.className='FormInsideTableRegCell chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByField('NomogramSVI')">SVI:&#160;<xsl:value-of select="NoTable/NomogramSVI"/></td>
                          <td colspan="2" class="FormInsideTableRegCell" style="font-weight: bold;" onmouseover="this.className='FormInsideTableRegCell chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByField('NomogramLNI')">LNI:&#160;<xsl:value-of select="NoTable/NomogramLNI"/></td>
                      </tr>
                  </table>
              </td>
          </tr>

          <!--Interval History-->
          <tr>
              <td valign="top" class="FormOuterTableRow" style="padding: 4px; height: 50px;"  onmouseover="this.className='FormOuterTableRow chronListHilighted';" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByField('HPI_AddedText')">
              <span class="blackBoldText">Interval History</span><br/>
                  <xsl:choose>
                      <xsl:when test="(NoTable/HPI_AddedText != '')">
                          <xsl:value-of select="NoTable/HPI_AddedText"/>
                      </xsl:when>
                  </xsl:choose>
               </td>
          </tr>


		<!--Late Complications-->
		<xsl:call-template name="ComplicationsTable"/>
				<!-- Allergies -->
                  <tr>
                      <td valign="top" class="FormOuterTableRow">
                          <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                  <td >
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                              <td colspan="2" class="FormInnerRowBottomBorder">
                                                  <span class="blackBoldText">Allergies</span>&#160;&#160;&#160;&#160;&#160;&#160;&#160;<span>
                                                      <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes"/>NKA&#160;&#160;
                                                          <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes"/>Unchanged Since Last Visit</span>
                                              </td>
                                          </tr>
                                          <tr align="center">
                                              <td width="40%" class="FormInsideTableRegCell">Allergen</td>
                                              <td class="FormInsideTableRegCell">Reaction</td>
                                          </tr>

                                          <xsl:value-of select="$AllergyRows" disable-output-escaping="yes"/>
                                          <xsl:for-each select="Allergies">
                                              <xsl:choose>
                                                  <xsl:when test="((Allergen != '') or (AllergyResponse != ''))">
                                                      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Allergies',{./@RecordId})">
                                                          <td class="FormInsideTableRegCell" style="height:28px;">
                                                              <xsl:value-of select="Allergen"  />&#160;
                                                          </td>
                                                          <td class="FormInnerRowBottomBorder">
                                                              <xsl:value-of select="AllergyResponse"  />&#160;
                                                          </td>
                                                      </tr>
                                                  </xsl:when>
                                              </xsl:choose>
                                          </xsl:for-each>
                                          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Allergies','')">
                                              <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                                              <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                                          </tr>

                                      </table>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>

				<!--Medical Therpaies-->
				<xsl:call-template name="MedicalTherapiesTable"/>
				<!--Radiation Therpay-->
				<xsl:call-template name="RadiationTherapiesTable"/>
				<!--Brachytherapy-->
				<xsl:call-template name="BrachyTherapiesTable"/>

          <!--Comorbidities and Procedures-->
          <xsl:call-template name="ComorbProceduresTable"/>

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
        <!--        <xsl:value-of select="$LabTestRows" disable-output-escaping="yes"/> -->
                      <xsl:for-each select="$CombinedLabTests_Prostate/LabTests">
                          <xsl:choose>
                              <xsl:when test="(@IsDB = 'true')">
                                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"   onclick="LoadDataEntryForm('LabTests', {./LabTestId}, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality,LabNotes')" >
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
                              <xsl:when test="((@IsDB = 'false') and ((LabDateText != '') or (LabTest != '') or (LabResult != '') or (LabUnits != '') or (LabQuality != '')))">
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
              <td class="FormOuterTableRow" style="border-bottom: none;">
                  <a name="Diagnostics_Anchor"/>
                  <table class="EFormTable" style="width: 100%;" cellspacing="0">
                      <tr class="EFormTableRow">
                          <td colspan="4">
                              <img src="../../Images/shim.gif" width="4" height="1" />
                              <span class="blackBoldText">Imaging</span>
                          </td>
                      </tr>
                      <tr class="EFormTableRow" >
                          <td width="15%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong></td>
                          <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Study</strong></td>
                          <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Results</strong></td>
                          <td width="45%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong></td>
                      </tr>
                  </table>
              </td>
          </tr>
                      <xsl:for-each select="$CombinedDiagnostics/Diagnostics">
                          <xsl:choose>
                              <xsl:when test="(@IsDB = 'true')">
                              
                          <tr>
                              <td class="FormOuterTableRow" style="border-bottom: none;">
                                  <table class="pageWidth" style="width: 100%;" align="center" border="0" cellpadding="1" cellspacing="0">
                                  <tr  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('Diagnostics', {./DiagnosticId}, 'DxDateText,DxDate,DxType,DxTarget,DxResult,DxTotalNumTumors,DxNotes')" >
                                      <td width="15%" align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="DxDateText"  />&#160;</td>
                                      <td width="15%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DxType"  />&#160;</td>
                                      <td width="25%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DxResult"  />&#160;</td>
                                      <td width="45%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DxNotes"  />&#160;</td>
                                  </tr>
                                  </table>
                              </td>
                          </tr>
                              </xsl:when>
                              <xsl:when test="((@IsDB = 'false') and ((DxDateText != '') or (DxType != '') or (DxResult != '') or (DxNotes != '')))">
                          <tr>
                              <td class="FormOuterTableRow" style="border-bottom: none;">
                                  <table class="pageWidth" style="width: 100%;" align="center" border="0" cellpadding="1" cellspacing="0">
                                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})">
                                      <td width="15%" align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="DxDateText"  />&#160;</td>
                                      <td width="15%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DxType"  />&#160;</td>
                                      <td width="25%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DxResult"  />&#160;</td>
                                      <td width="45%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DxNotes"  />&#160;</td>
                                  </tr>
                                  </table>
                              </td>
                          </tr>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:for-each>
                      <!-- empty row for adding new ones -->
          <tr>
              <td class="FormOuterTableRow" style="border-bottom: none;">
                  <table class="pageWidth" style="width: 100%;" align="center" border="0" cellpadding="1" cellspacing="0">
                      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','')">
                          <td width="15%" align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                          <td width="15%" align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                          <td width="25%" align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                          <td width="45%" align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                      </tr>
                  </table>
              </td>
          </tr>
			<tr class="FormOuterTableRow">
                <td style="height: 14px; text-align: center; vertical-align: bottom; border-top: solid 1px #000000;" class="blackBoldText">GU02<img src="../../Images/shim.gif" border="0" width="45" height="1" />U06<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: 6/03
				<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS</td>
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
				
				
				
				
				
				
				<!--Surveys-->
				<!-- <xsl:call-template name="SurveysTable"/>-->
                      <xsl:for-each select="Surveys">
          <tr>
              <td class="FormOuterTableRow">
                  <table class="EFormTable" cellspacing="0">
						<xsl:choose>
							<xsl:when test="((SurveyType != '') or (SurveyResult != ''))">
								<tr class="EFormTableRow">
									<td width="50%" align="left" valign="middle" class="FormInsideTableTopLeftCell" style="border-right: none; border-top: solid 1px #000000;">
										<!--Chooses the Survey Type-->
										<xsl:choose>
											<xsl:when test="(SurveyType != '')">
												<span class="blackBoldText"><img src="../../Images/shim.gif" width="4" height="1" /><xsl:value-of select="SurveyType"  />&#160;Survey</span>
											</xsl:when>
											<xsl:otherwise></xsl:otherwise>
										</xsl:choose>&#160;
										<!--Choose Survey Date Text-->
										<xsl:choose>
											<xsl:when test="(SurveyDateText != '')"> <span class="blackBoldText">
                        &#160;on&#160;<xsl:value-of select="SurveyDateText"  /></span></xsl:when>
											<xsl:otherwise></xsl:otherwise>  	
										</xsl:choose></td>
									<td width="50%" align="center" valign="middle" class="FormInsideTableTopCell"  style="border-right: none;  border-top: solid 1px #000000;">
									<!--Select overall Survey Result-->
										<xsl:choose>
											<xsl:when test="(SurveyResult != '')">
												<span><img src="../../Images/shim.gif" width="4" height="1" />Overall Result:&#160;<xsl:value-of select="SurveyResult"  />&#160;</span>
											</xsl:when>
											<xsl:otherwise></xsl:otherwise>
										</xsl:choose>&#160;</td>
								</tr>
                                <tr class="EFormTableRow">
                                    <td width="50%" align="center" valign="middle" class="FormInsideTableLeftCell">
                                        <strong>Question</strong>
                                    </td>
                                    <td width="50%" align="center" valign="middle" class="FormInsideTableRegCell">
                                        <strong>Response</strong>
                                    </td>
                                </tr>
							</xsl:when>
						</xsl:choose>
						<xsl:for-each select="SurveyItems">
							<xsl:choose>
								<xsl:when test="((SurveyItem != '') or (SurveyItemResult != ''))">
									<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Surveys',{./@RecordId})">
										<!--Survey Items-->
										<td align="left" valign="middle" class="FormInsideTableLeftCell"><img src="../../Images/shim.gif" width="4" height="1" /><xsl:value-of select="SurveyItem"  />&#160;</td>
										<!--Choose Survey Item results-->
										<td align="center" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" width="4" height="1" />
										   <xsl:choose>
												<xsl:when test="(SurveyItemResult = '')"><strong>No Data</strong></xsl:when>
												<xsl:otherwise><xsl:value-of select="SurveyItemResult"  />&#160;</xsl:otherwise>
											</xsl:choose>
									   </td>
									</tr>
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<!-- Choose Survey Notes-->
							<xsl:choose>
								<xsl:when test="(SurveyNotes !='')">
									<tr class="EFormTableRow">
										<td colspan="2" class="FormInsideTableLeftCell"><strong><img src="../../Images/shim.gif" width="4" height="1" />Notes:</strong>&#160;<xsl:value-of select="SurveyNotes"  /></td>
									</tr>
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>

                  </table>
              </td>
          </tr>
						</xsl:for-each>

          <tr>
              <td class="FormOuterTableRow">
                  <table class="EFormTable" cellspacing="0">
					<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Surveys','')">	
						<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
					</tr>
				</table>
			</td>
		</tr>
		
		
		
		
		
		
		
		
		
		
		
		
		
				
				<!--QOL Therapies-->
				<xsl:call-template name="QOL_TherapyTable"/>
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
						<td height="14" align="center" valign="bottom" class="blackBoldText">GU02<img src="../../Images/shim.gif" border="0" width="45" height="1" />U06<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: 6/03
						<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">2</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS</td>
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

          <!--Biopsies of the prostate-->
          <!-- <xsl:call-template name="BiopsiesProstateTable"/> -->


        
        <xsl:if test="($HadProstatectomy != 'true')" >

        <tr>
              <td class="FormOuterTableRow">
                  <span class="blackBoldText">
                      <img src="../../Images/shim.gif" border="0" width="4" height="0"/>Biopsies&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                  </span><xsl:choose>
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
                  </xsl:choose><strong>No Prior Biopsy</strong>

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
                                              <xsl:value-of select="ProstateBiopsyPath/PathGG1"  />&#160;+&#160;<xsl:value-of select="ProstateBiopsyPath/PathGG1"  />&#160;=<xsl:value-of select="ProstateBiopsyPath/PathGGS"  />
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
                              &#160; <strong>=</strong>&#160; <xsl:value-of select="ProstateBiopsyPath/PathGGS"  /></td>
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
                                                      </tr>                      </xsl:when>
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





    <tr> 
      <td class="FormOuterTableRow">
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology','')" >
                          <td height="30"  style="border-top: solid 1px #000000; text-align: center; border-bottom: none;" class="FormInsideTableRegCell">
                              /<span>
                                  <img src="../../Images/shim.gif" border="0" width="22" height="1"/>
                              </span>/
                          </td>
                          <td  style="border-top: solid 1px #000000; text-align: center;" class="FormInsideTableRegCell">&#160;</td>
                          <td class="FormInsideTableRegCell"  style="border-top: solid 1px #000000;">&#160;</td>
                          <td class="FormInsideTableRegCell" style="border-top: solid 1px #000000;">&#160;</td>
                          <td class="FormInsideTableRegCell" style="border-top: solid 1px #000000;">&#160;</td>
                      </tr>
               </table>
              </td>
          </tr>
</xsl:if>
















          <!--Vital Signs-->
				<xsl:call-template name="VitalsTable"/>
				<!--Physical Exam-->
				<xsl:call-template name="ExamsTable"/>
				<!--Rectal Exam-->
				<xsl:call-template name="RectalExamTable"/>
					<tr class="FormOuterTableRow">
						<td height="14" align="center" valign="bottom" class="blackBoldText">GU02<img src="../../Images/shim.gif" border="0" width="45" height="1" />U06<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: 6/03
						<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS</td>
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
        <!--Status-->
        <xsl:call-template name="StatusTable"/>
        <!--Problem Plan-->
        <xsl:call-template name="ProblemPlanTable"/>
        <!--Encounter Notes-->
        <xsl:call-template name="EncNotes"/>
        
        
        
        
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
                                      <td style="vertical-align: top;">
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
            GU02<img src="../../Images/shim.gif" border="0" width="45" height="1" />U06<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: 6/03
            <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:9/24/13<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">4</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
          </td>
        </tr>
      </table>
    </div>
    
    

</xsl:template>
</xsl:stylesheet>
