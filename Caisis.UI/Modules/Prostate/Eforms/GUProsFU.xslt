<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--Variables-->
<!--Barcode Variables-->
<xsl:variable name="DocType">*U19*</xsl:variable>
<xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>
<!--Header Variables-->
<xsl:variable name="ReportTitle">GU Prostate Follow-Up Patient</xsl:variable>
<!--Footer Variables-->
<xsl:variable name="DocNumber">15</xsl:variable>
<xsl:variable name="DocAssignment">19</xsl:variable>
<xsl:variable name="ApprovalDate">8/03</xsl:variable>
<xsl:variable name="RevisedDate">10/05/10</xsl:variable>
<!--Please Note: The footer cannot be implemented as a template until Jason's new page counting information is added
<xsl:variable name="PageNumber">X of Y</xsl:variable>-->


  <!--Header Variables-->
  <!--ToDo: Use institution Short Name From Web Config-->
  <xsl:variable name="InstitutionShortName">MSKCC</xsl:variable>
  <!--ToDo: Move to Library once other variables pulled from web config-->
  <xsl:variable name="PrivacyHeader">
    <tr>
      <td style="text-align:center;">
        <font size="-1">
          CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY
        </font>
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
        <!--Chief Complaint
        <xsl:call-template name="EncChiefComplaint"/>-->
        <!--HPI and Disease States-->
        <tr>
          <td class="FormOuterTableRow">
            <table class="EFormTable" cellspacing="0">
              <tr class="EFormTableRow">
                <td width="70%" valign="top">
                  <xsl:call-template name="GU_ProstateHpi"/>
<!-- 
                  <xsl:for-each select="MedicalTherapy">
                    <xsl:choose>
                      <xsl:when test="((MedTxDateText != '') or (MedTxType != '') or (MedTxAgent != '') or (MedTxDose != '') or (MedTxInstitution != '') or (MedTxNotes != ''))">
                        <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy',{./@RecordId})">
                          <xsl:value-of select="MedTxDateText"  />&#160;
                          <xsl:value-of select="MedTxAgent"  />&#160;
                          <xsl:value-of select="MedTxDose" />&#160;
                          <xsl:value-of select="MedTxUnits"  />&#160;
                        </span>
                        <br/>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                  <xsl:for-each select="RadiationTherapy">
                    <xsl:choose>
                      <xsl:when test="((RadTxDateText != '') or (RadTxType != '') or (RadTxTarget != '') or (RadTxTotalDose != '') or (RadTxInstitution != '') or (RadTxNotes != ''))">
                        <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('RadiationTherapy',{./@RecordId})">
                          <xsl:value-of select="RadTxDateText"  />&#160;
                          <xsl:value-of select="RadTxType"  />&#160;
                          <xsl:value-of select="RadTxTarget"  />&#160;
                          <xsl:value-of select="RadTxTotalDose"  />&#160;
                          <xsl:value-of select="RadTxUnits"  />&#160;
                          <xsl:value-of select="RadTxNumFractions"  />&#160;
                        </span><br/>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                  <xsl:for-each select="BrachyTherapy">
                    <xsl:choose>
                      <xsl:when test="((BrachyDateText != '') or (BrachyPrescribedDose != '') or (BrachyIsotope != '') or (BrachyInstitution != '') or (BrachyNotes != ''))">
                        <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('BrachyTherapy',{./@RecordId})">
                          <xsl:value-of select="BrachyDateText"  />&#160;
                          <xsl:value-of select="BrachyPrescribedDose"  />&#160;
                          <xsl:value-of select="BrachyIsotope"  />&#160;
                        </span>
                        <br/>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>-->
                </td>
                <td width="30%" valign="top" class="FormInsideTableLeftCell">
                  <xsl:call-template name="StatusTableGU"/>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <!--Nomogram Predictions
				<xsl:call-template name="UrologyProstateNomogram"/>-->
        <!--Current treatment: ToDo: Display tretment and date, fix onclick event for last GnRH-->
        <xsl:call-template name="CurrentTreatment"/>
        <!--Interval History & progression criteria-->
        <xsl:call-template name="IntervalHistoryProgressionCriteria"/>
        
        <!--Comorbidities-->





          <tr>
              <td valign="top" class="FormOuterTableRow" style="height:40px; padding-left: 4px;">

                  <span class="blackBoldText">Comorbidities</span>
                  <br/>
                  <xsl:value-of select="$ComorbidityGUProstateFURows" disable-output-escaping="yes"/>
                  <xsl:for-each select="Comorbidities">
                      <xsl:choose>
                          <xsl:when test="((ComorbDateText != '') or (Comorbidity != '') )">
                              <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Comorbidities',{./@RecordId})" ><xsl:value-of select="ComorbDateText"  /> - <xsl:value-of select="Comorbidity"  />, </span>
                          </xsl:when>
                      </xsl:choose>
                  </xsl:for-each>

                  <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Comorbidities','')" style="width: 50px;" title="Click to Add New" >&#160;</span>
              </td>
          </tr>
        <!--Allergies-->
          <tr>
              <td class="FormOuterTableRow" valign="top" style="height:40px; padding-left: 4px;">
                  <span class="blackBoldText">Allergies</span>&#160;&#160;&#160;&#160;
                  <input type="checkbox" name="NKA" value="NKA" />NKA&#160;&#160;&#160;&#160;<br />
                      <xsl:value-of select="$AllergyGUString" disable-output-escaping="yes"/>
                      <xsl:for-each select="Allergies">
                          <xsl:choose>
                              <xsl:when test="((Allergen != '') or (AllergyResponse != ''))">
                                  <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Allergies',{./@RecordId})" >
                                      <xsl:value-of select="Allergen"  /> - <xsl:value-of select="AllergyResponse"  />,
                                  </span>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:for-each>

                  </td>
          </tr>
        
        
        
        <!--Footer will be changed to a template once the Page Numbers are generated automatically-->
        <!--<xsl:call-template name="Footer"/>-->
        <tr class="FormOuterTableRow">
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
            <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">
              <xsl:value-of select="$DocNumber"/>
            </span>
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
      <!--Review of Systems: Toxicity Table as Source-->
      <xsl:call-template name="ROS_ToxicityTable"/>
      <!--Nursing Sign-off-->
      <xsl:call-template name="ROS_Signature"/>      
      <tr class="FormOuterTableRow">
        <td height="14" align="center" valign="bottom" class="blackBoldText">
          GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
          <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">2</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">
            <xsl:value-of select="$DocNumber"/>
          </span>
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
        <!--Vital Signs-->
        <tr>
          <td class="FormOuterTableRow">
            <a name="VitalSigns_Anchor"/>
            <table class="EFormTable" cellspacing="0">
              <tr class="EFormTableRow">
                <td colspan="8">
                  <img src="../../Images/shim.gif" width="4" height="1" />
                  <span class="blackBoldText" style="margin-right: 100px;">Vital Signs</span>


                  <xsl:for-each select="NoTable">
                    <xsl:choose>
                      <xsl:when test="(PhlebotomistNote != '')"><input type="checkbox" name="PhlebotomistNote" checked="checked" /></xsl:when>
                      <xsl:otherwise><input type="checkbox" name="PhlebotomistNote" /></xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>Vital signs were verified by checking phlebotomist note.



                </td>
              </tr>
              <tr class="EFormTableRow">
                <td width="16%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                  <strong>Blood Pressure</strong>
                </td>
                <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Pulse</strong>
                </td>
                <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Temperature</strong>
                </td>
                <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Respirations</strong>
                </td>
                <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Height (cm)</strong>
                </td>
                <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Weight (kg)</strong>
                </td>
                <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>BSA</strong>
                </td>
                <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>KPS</strong>
                </td>
              </tr>
              <xsl:for-each select="Encounters">
                <xsl:choose>
                  <xsl:when test="((EncSystolic != '') or (EncDiastolic != '') or (EncPulse != '') or (EncTemp != '') or (EncRespiration != '') or (EncHeight != '') or (EncHeight != '') or (EncWeight != '') or (EncBSA != '') or (EncKPS != ''))">
                    <tr class="EFormTableRow">
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncSystolic', 'VitalSigns')">
                        <xsl:value-of select="EncSystolic"  /> / <xsl:value-of select="EncDiastolic"  />
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncPulse', 'VitalSigns')">
                        <xsl:value-of select="EncPulse"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncTemp', 'VitalSigns')">
                        <xsl:value-of select="EncTemp"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncRespiration', 'VitalSigns')">
                        <xsl:value-of select="EncRespiration"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncHeight', 'VitalSigns')">
                        <xsl:value-of select="EncHeight"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncWeight', 'VitalSigns')">
                        <xsl:value-of select="EncWeight"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBSA', 'VitalSigns')">
                        <xsl:value-of select="EncBSA"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncKPS', 'VitalSigns')">
                        <xsl:value-of select="EncKPS"  />&#160;
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr class="EFormTableRow">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncSystolic', 'VitalSigns')">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncPulse', 'VitalSigns')">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncTemp', 'VitalSigns')">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncRespiration', 'VitalSigns')">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncHeight', 'VitalSigns')">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncWeight', 'VitalSigns')">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBSA', 'VitalSigns')">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncKPS', 'VitalSigns')">&#160;</td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </table>
          </td>
        </tr>
        <!--Physical Exam-->
          <tr>
              <td class="FormOuterTableRow">
                  <a name="EncExams_Anchor"/>
                  <table class="EFormTable" cellspacing="0" cellpadding="0">
                      <tr class="EFormTableRow">
                          <td colspan="5">
                              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Physical Exam</span><img src="../../Images/shim.gif" border="0" width="65" height="1" />Clinician(s) Performing Exam:&#160;<xsl:call-template name="Exam_Clinician" />
                          </td>
                      </tr>
                      <tr class="EFormTableRow">
                          <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                              <strong>System</strong>
                          </td>
                          <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Exam</strong>
                          </td>
                          <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Result</strong>
                          </td>
                          <td width="18%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Attending Performed</strong>
                          </td>
                          <td width="37%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Notes</strong>
                          </td>
                      </tr>
                      <xsl:for-each select="Encounters/EncExams">
                          <xsl:choose>
                              <xsl:when test="((ExamSystem != '') or (Exam != '') or (ExamResult != '') or (ExamAttendingPerformed != '') or (ExamNotes != ''))">
                                  <xsl:variable name="lastExamSystem" select="ExamSystem"/>

                                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncExams',{./@RecordId})">
                                      <xsl:if test="(not(preceding-sibling::EncExams[ExamSystem=$lastExamSystem]))">
                                          <td align="center" valign="middle" class="FormInsideTableLeftCell" style="border-top: solid 1px; border-bottom: none;">
                                              <xsl:value-of select="ExamSystem"  />&#160;
                                          </td>
                                      </xsl:if>
                                      <xsl:if test="(preceding-sibling::EncExams[ExamSystem=$lastExamSystem])">
                                          <td align="center" valign="middle" class="FormInsideTableLeftCell" style="border-top: none; border-bottom: none;">&#160;</td>
                                      </xsl:if>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                                          <xsl:value-of select="Exam"  />&#160;
                                      </td>
                                      <!--Choose Exam Result and modify format of display-->
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                                          <xsl:choose>
                                              <xsl:when test="(ExamResult='Abnormal')">
                                                  <strong>Abnormal</strong>
                                              </xsl:when>
                                              <xsl:when test="(ExamResult='Not Done')">
                                                  <i>*Not Done*</i>
                                              </xsl:when>
                                              <xsl:otherwise>
                                                  <xsl:value-of select="ExamResult"  />
                                              </xsl:otherwise>
                                          </xsl:choose>&#160;
                                      </td>
                                      <!--Choose Yes for Attending performed and No for Attending did not Perform Exam-->
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                                          <xsl:choose>
                                              <xsl:when test="(ExamAttendingPerformed = '1')">
                                                  <strong>Yes</strong>
                                              </xsl:when>
                                              <xsl:otherwise>No</xsl:otherwise>
                                          </xsl:choose>&#160;
                                      </td>
                                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                                          <xsl:value-of select="ExamNotes"  />&#160;
                                      </td>
                                  </tr>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:for-each>

                  </table>
              </td>
          </tr>
        <!--Lab Tests-->
          <tr>
              <td  class="FormOuterTableRow">
                  <span class="blackBoldText">
                      <img src="../../Images/shim.gif" border="0" width="4" height="0" />Lab Tests
                  </span>
                  <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                      <tr>
                          <td width="50%">
                              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                  <tr>
                                      <td class="FormInsideTableTopCell" align="left" valign="top" width="25%" height="18" style="padding-left: 4px;">
                                          WBC: <xsl:value-of select="$LabTestOnEFormDate_WBC" disable-output-escaping="yes"/>
                                      </td>
                                      <td class="FormInsideTableTopCell" align="left" valign="top" width="25%" style="padding-left: 4px;">
                                          ANC: <xsl:value-of select="$LabTestOnEFormDate_ANEUT" disable-output-escaping="yes"/>
                                      </td>
                                      <td class="FormInsideTableTopCell" align="left" valign="top" width="25%" style="padding-left: 4px;">HGB: <xsl:value-of select="$LabTestOnEFormDate_HGB" disable-output-escaping="yes"/>
                                  </td>
                                      <td class="FormInsideTableTopCell" align="left" valign="top" width="25%" style="padding-left: 4px;">PLT: <xsl:value-of select="$LabTestOnEFormDate_UNVPLT" disable-output-escaping="yes"/>
                                  </td>
                                  </tr>
                              </table>
                          </td>
                          <td width="50%" class="FormInsideTableTopCell" style="padding-left: 4px;">Comments:</td>
                      </tr>
                      <tr>
                          <td class="FormInsideTableRegCell"  valign="top" align="left" height="40" style="padding-left: 4px;">Chemistry:<img src="../../Images/shim.gif" border="0" width="270" height="1" />Creat: <xsl:value-of select="$LabTestOnEFormDate_CREAT" disable-output-escaping="yes"/></td>
                      </tr>
                      <tr>
                          <td class="FormInsideTableRegCell"  valign="top" align="left" height="50" style="padding-left: 4px;"><span>Markers (PSA/ACP/LDH):</span>
                                  <table width="700" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td >

                                              <xsl:value-of select="$LabTestGURows" disable-output-escaping="yes"/>
                                              
                                              <xsl:for-each select="LabTests">
                                                  <xsl:choose>
                                                      <xsl:when test="((LabDateText != '') or (LabTest != '') or (LabResult != '') or (LabQuality != ''))">
                                                          <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests',{./@RecordId})"><xsl:value-of select="LabDateText"/>&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="LabTest" />&#160;&#160;&#160;&#160;<xsl:value-of select="LabResult"  />&#160;&#160;&#160;&#160;<xsl:value-of select="LabQuality"  /></span><br/>
                                                      </xsl:when>
                                                  </xsl:choose>
                                              </xsl:for-each>
                                          </td>
                                      </tr>
                                  </table>
                              </td>
                      </tr>
                  </table>
              </td>
          </tr>
        <!--PSA Doubling Time-->
        <xsl:call-template name="PSADoublingTime" />
        <!--Diagnostic Tests-->
        <xsl:call-template name="GUProsFUDiagnosticsTable"/>
        <!--ToDo: Remove Rectal Exam from the eForm Interface-->
        <!--Rectal Exam
				<xsl:call-template name="RectalExamTable"/>-->
        <tr class="FormOuterTableRow">
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
            <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">
              <xsl:value-of select="$DocNumber"/>
            </span>
          </td>
        </tr>
      </table>
    </div>


    <div align="left"   id="LastPageInForm" runat="server" >
      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <xsl:value-of select="$PrivacyHeader"/>

        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <xsl:call-template name="EncounterDatePhysician"/>
        <!--Problem Plan-->
          <tr>
              <td class="FormOuterTableRow">
                  <a name="PatientProblems_Anchor"/>
                  <table class="EFormTable" cellspacing="0">
                      <tr class="EFormTableRow">
                          <td colspan="2">
                              <img src="../../Images/shim.gif" width="4" height="1" />
                              <span class="blackBoldText">Impression and Plan</span>
                          </td>
                      </tr>
                      <tr class="EFormTableRow">
                          <td width="40%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                              <strong>Diagnosis / Problem List</strong>
                          </td>
                          <td width="60%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Plan and Referrals</strong>
                          </td>
                      </tr>
                      <xsl:for-each select="PatientProblems">
                          <xsl:choose>
                              <xsl:when test="(ProblemName != '')">
                                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems',{./@RecordId})">
                                      <td class="FormInsideTableLeftCell" style="font-weight: bold; vertical-align: top; padding: 6px;">
                                          <xsl:value-of select="ProblemName"  />
                                      </td>
                                      <td class="FormInsideTableRegCell" style="vertical-align: top; padding: 6px;">
                                          <xsl:for-each select="ProblemPlans">
                                              <xsl:choose>
                                                  <xsl:when test="PlanName != ''">
                                                      &#8226;&#160;<xsl:value-of select="PlanName"  /><br/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      &#160;
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </xsl:for-each>
                                      </td>
                                  </tr>
                              </xsl:when>
                              <!--<xsl:otherwise>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems','')">	
								<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
							</tr>
						</xsl:otherwise>-->
                          </xsl:choose>
                      </xsl:for-each>
                  </table>
              </td>
          </tr>


        <tr>
          <td align="left" valign="top" class="FormOuterTableRow" style="padding: 2px 2px 2px 2px; font-weight: bold; font-size: 13px;"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('TreatmentRisksDiscussed', 'Disposition_GUFU')">

            <xsl:for-each select="NoTable">
                <xsl:choose>
                  <xsl:when test="(TreatmentRisksDiscussed != '')">
                    <input type="checkbox" name="TreatmentRisksDiscussed" checked="checked" />
                  </xsl:when>
                  <xsl:otherwise>
                    <input type="checkbox" name="TreatmentRisksDiscussed" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each> 

            Risks, benefits and rationale of treatment plan discussed in detail. All questions answered.
            
          </td>
        </tr>

          <tr>
              <td align="left" valign="top" class="FormOuterTableRow" style="padding: 2px 2px 2px 2px; font-weight: bold; font-size: 13px;"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolRisksDiscussed', 'Disposition_GUFU')">

                  <xsl:for-each select="NoTable">
                      <xsl:choose>
                          <xsl:when test="(ProtocolRisksDiscussed != '')">
                              <input type="checkbox" name="ProtocolRisksDiscussed" checked="checked" />
                          </xsl:when>
                          <xsl:otherwise>
                              <input type="checkbox" name="ProtocolRisksDiscussed" />
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:for-each>

                  The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.

              </td>
          </tr>
        <tr>
          <td align="left" valign="top" class="FormOuterTableRow" height="40" style="padding: 2px 2px 2px 8px;"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('AdditionalRecordsToRequest', 'AdditionalRecordsFilmsToRequest')">
              <span class="blackBoldText">
                Additional Records/Films to Request:
            </span>
            <br/>

                <xsl:for-each select="NoTable">
                      <span>
                        <xsl:value-of select="AdditionalRecordsToRequest"  />&#160;
                      </span>
                </xsl:for-each>
                
                
              
          </td>
        </tr>
        <!--<tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2" class="FormInsideTableTopLeftCell">
                  <span class="blackBoldText">
                    <img src="../../Images/shim.gif" border="0" width="8" height="8" />Disposition
                  </span>
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell" width="50%" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Dictated', 'Disposition_GUFU')">
                  <table align="left" width="100%">
                    <tr>
                      <td style="width: 50%;">Dictation for today's visit?</td>
                      <td>

                        <xsl:for-each select="NoTable">
                          <xsl:choose>
                            <xsl:when test="(Dictated != '')">
                                <xsl:value-of select="Dictated"  />
                            </xsl:when>
                            <xsl:otherwise>
                              Yes<img src="../../Images/shim.gif" border="0" width="22" height="0" />No
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        
                      </td>
                    </tr>
                  </table>
                </td>
                <td class="FormInsideTableRegCell" width="50%" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('SeeDispoForOrders', 'Disposition_GUFU')" >
                   <table align="left" width="100%">
                    <tr>
                      <td style="width: 50%;">See dispo for orders?</td>
                      <td >

                        <xsl:for-each select="NoTable">
                          <xsl:choose>
                            <xsl:when test="(SeeDispoForOrders != '')">
                              <xsl:value-of select="SeeDispoForOrders"  />
                            </xsl:when>
                            <xsl:otherwise>
                              Yes<img src="../../Images/shim.gif" border="0" width="22" height="0" />No
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
</td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr>
                <td height="40" colspan="2" valign="top" class="FormInsideTableRegCell">
                  <table align="left" width="100%">
                    <tr>
                      <td colspan="2">
                        Return:<img src="../../Images/shim.gif" border="0" width="16" height="1" />
                        <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ReturnWeeks', 'Disposition_GUFU')">
                          <xsl:for-each select="NoTable">
                            <xsl:choose>
                              <xsl:when test="(ReturnWeeks != '')">
                                <xsl:value-of select="ReturnWeeks"  />
                              </xsl:when>
                              <xsl:otherwise>
                                _____________
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                          Weeks
                        </span> <img src="../../Images/shim.gif" border="0" width="12" height="0" /><span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ReturnMonths', 'Disposition_GUFU')">
                          <xsl:for-each select="NoTable">
                            <xsl:choose>
                              <xsl:when test="(ReturnMonths != '')">
                                <xsl:value-of select="ReturnMonths"  />
                              </xsl:when>
                              <xsl:otherwise>
                                _____________
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                          Months
                        </span>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

            </table>
          </td>
        </tr>-->
        <tr>
          <td align="left" valign="top" class="FormOuterTableRow" height="30" style="padding: 2px 2px 2px 8px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncNotes', 'Disposition_GUFU')">
              <span class="blackBoldText">Comments / Notes:</span>
            <br/>
            <xsl:value-of select="Encounters/EncNotes"/>
          </td>
        </tr>
        <!--Disposition Protocol-->
        <tr>
	<td class="FormOuterTableRow">
	<a name="Protocols_Anchor"/>
		<table class="EFormTable" cellspacing="0">
			<tr class="EFormTableRow">
				<td colspan="2"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Protocol</span></td>
			</tr>
			<tr class="EFormTableRow">
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Protocol Number</strong></td>
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Protocol Considered</strong></td>
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Protocol Consented</strong></td>
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Protocol Registered</strong></td>
			</tr>
			<xsl:for-each select="NoTable/ProtocolTemp">
					<xsl:choose>
						<xsl:when test="((ProtocolNumber != '') or (ProtocolConsidered != '') or (ProtocolConsentObtained != '') or (ProtocolRegistered != ''))">
							<tr class="EFormTableRow">
								<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolNumber', 'Protocols')"><xsl:value-of select="ProtocolNumber"  /></td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsidered', 'Protocols')"><xsl:value-of select="ProtocolConsidered"  /></td>
								<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsentObtained', 'Protocols')"><xsl:value-of select="ProtocolConsentObtained"  /></td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolRegistered', 'Protocols')"><xsl:value-of select="ProtocolRegistered"  /></td>
						</tr>
						</xsl:when>
						<xsl:otherwise>
						<tr class="EFormTableRow">
							<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolNumber', 'Protocols')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsidered', 'Protocols')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsentObtained', 'Protocols')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolRegistered', 'Protocols')">&#160;</td>
						</tr>
					</xsl:otherwise>
					</xsl:choose>
			</xsl:for-each>
		</table>
	  </td>
	</tr>
        <!--Disposition Attending Time-->
        <tr>
          <td valign="top" class="FormOuterTableRow">
            <table width="100%" border="0" cellspacing="0" cellpadding="4">

              <tr>
                <td class="FormInnerRowRightBorder">
                  <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('GreaterThan50PercentTimeInCounseling', 'Disposition_GUFU')">
                      <xsl:for-each select="NoTable">
                            <xsl:choose>
                              <xsl:when test="(GreaterThan50PercentTimeInCounseling != '')">
                                <input type="checkbox" name="50% of Time22" checked="checked" />
                              </xsl:when>
                              <xsl:otherwise>
                                <input type="checkbox" name="50% of Time22" />
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each> 
                      </span>
                  
                    &gt; 50% of attending time was spent in counseling<img src="../../Images/shim.gif" border="0" width="4" height="1" />
                      <span style="font-size: smaller;">(If so, mark total attending time in minutes)</span>

                      <span style="font-weight: bold;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('TotalAttendingTime', 'Disposition_GUFU')">
                      <xsl:for-each select="NoTable">
                            <xsl:choose>
                              <xsl:when test="(TotalAttendingTime != '')">
                                &#160;&#160;&#160;&#160;<xsl:value-of select="TotalAttendingTime"  />
                              </xsl:when>
                              <xsl:otherwise>
                                <input type="checkbox" name="15-24 (3)22" />
                        15-24 (3)&#160;&#160;<input type="checkbox" name="25-39 (4)22" />
                          25-39 (4)&#160;&#160;<input type="checkbox" name="40+ (5)22" />40+ (5)
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each> 
                      </span>
                        
                        
                      
                </td>
              </tr>
            </table>
          </td>
        </tr>        
        <!--Approval Signature-->
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
                <td>
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
                <td>
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
              <tr align="center">
                <td colspan="4">
                  <table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                    <tr>
                      <td>
                        I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I have reviewed this entire document and I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                        <span class="blackBoldText">
                          <img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="45" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span>
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
            GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
            <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">4</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">
              <xsl:value-of select="$DocNumber"/>
            </span>
          </td>
        </tr>
      </table>
    </div>
	
	
	
	
</xsl:template>
</xsl:stylesheet> 