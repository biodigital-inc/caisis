<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--
      Template for string replace in XSLT.
      text      : main string
      replace   : the string fragment to be replaced
      by        :  the replacement string
  -->
  <xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text"
          select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--Header Variables-->
<xsl:variable name="ReportTitle">Liver Surgery Eform</xsl:variable>

  <xsl:param name="TodaysDate"/>
  
  <!--McGillEformHeader template-->
  <xsl:template name="EformHeaderLiver">

    <tr class="EFormTableRow">
      <td class="FormOuterTableTopRow" >
        <table class="EFormTable" cellspacing="0" cellpadding="30" >
          <tr class="EFormTableRow">
            <!--<td width="15%" align="center" valign="middle"  class="FormInsideTableRegCell">
              <xsl:value-of select="$InstitutionLogoImgUrl" disable-output-escaping="yes" />
            </td>-->
            <td width="100%" align="center" valign="middle"  class="FormInsideTableRegCell" >
              <span class="blackBoldText" style="font-size: 12pt; ">
                <xsl:value-of select="$InstitutionName"/> - <xsl:value-of select="$ReportTitle"/>
              </span>
                <br/>
                <br/>
              <span class="blackBoldText" style="font-size: 10pt; ">
                Approval Date: <xsl:value-of select="$TodaysDate"/>
              </span>
            </td>
          </tr>
        </table>
      </td>
    </tr>

    <tr class="EFormTableRow">
      <td class="FormOuterTableTopRow" ></td>
    </tr>
  </xsl:template>

  <xsl:template name="HPIHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">History of Present Illness</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="PastMedHistoryHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Past Medical History</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="AssessmentECOGHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Assessment/ECOG</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="ImagingHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Imaging</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="LabsHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Labs</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="InterventionalRadiologyHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Interventional Radiology</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="OperativeDetailsHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Operative Details</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="PostOpCourseHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Post-Operative Course</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="PathStagingHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Pathology</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="PostOpTreatmentHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Post Op Treatment</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="OutcomesHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Outcomes</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--DiagnosisDate parameters-->
  <xsl:param name="DiagnosisDateHxLS"/>
  
  <!--Template: Matches Status Dates Data-->
  <xsl:template name="DiagnosisDate">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="2">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Date of Diagnosis</span>
            </td>
          </tr>
          
          <tr class="EFormTableRow">
            <td width="50%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Date</strong>
            </td>
            <td width="50%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Disease Type</strong>
            </td>
          </tr>

          <!--existing diagnosis dates from database -->
          <xsl:value-of select="$DiagnosisDateHxLS" disable-output-escaping="yes"/>

          <xsl:for-each select="Status[@RecordId=21]">
            <tr class="EFormTableRow" >
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="StatusDateText"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="StatusDisease"/>&#160;
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </td>
    </tr>

  </xsl:template>

  <!--DemographicsTableLiver parameters-->
  <xsl:param name="HasSSN"/>
  <xsl:param name="SSNIdentifier"/>

  <!--Demographics template-->
  <xsl:template name="DemographicsTableLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="DemographicsTable_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Demographics</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Patient Name</strong>
            </td>
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>
                <xsl:value-of select="$PtMRNTitle" disable-output-escaping="yes"/>
              </strong>
            </td>
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Gender</strong>
            </td>
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Birth Date (Age)</strong>
            </td>
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Country of Birth</strong>
            </td>
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Race</strong>
            </td>
          </tr>

            <tr class="EFormTableRow" >
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <strong>
                  <xsl:value-of select="$PtLastName"/>, <xsl:value-of select="$PtFirstName"/>&#160;<xsl:value-of select="$PtMiddleName"/>
                </strong>
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="$PtMRN" disable-output-escaping="yes"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="$PtGender" disable-output-escaping="yes"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="$PtBirthDate" disable-output-escaping="yes"/>&#160;(<xsl:value-of select="$PtAge" disable-output-escaping="yes"/>)
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="$PtBirthPlace" disable-output-escaping="yes"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="$PtRace" disable-output-escaping="yes"/>&#160;
              </td>
            </tr>
          <tr class="EFormTableRow">
            <td colspan="2" width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>SS #</strong>
            </td>
            <td colspan="2" width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Legal Resident of US</strong>
            </td>
            <td colspan="2" width="33%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>
                Year Immigrated to US
              </strong>
            </td>
          </tr>

          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Surveys',2)">
            <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
              <strong>
                <xsl:if test="($HasSSN = 'No')" >
                  <xsl:if test=" (NoTable/EnterSsnRBL != 'Yes') ">
                    <xsl:value-of select="NoTable/EnterSsnRBL" />&#160;
                  </xsl:if>
                  <xsl:if test=" (NoTable/EnterSsnRBL = 'Yes') ">
                    <xsl:value-of select="Identifiers[@RecordId=3]/Identifier" />&#160;
                  </xsl:if>
                </xsl:if>
                <xsl:if test="($HasSSN = 'Yes')" >
                  <xsl:value-of select="$SSNIdentifier"/>
                </xsl:if>                
              </strong>
            </td>
            <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell" >
              <xsl:value-of select="Surveys[@RecordId=2]/SurveyItems[@RecordId=2]/SurveyItemResult" />&#160;
            </td>
            <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell" >
              <xsl:value-of select="Surveys[@RecordId=2]/SurveyItems[@RecordId=3]/SurveyItemResult" />&#160;
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Matches Chief Complaint Data-->
  <xsl:template name="ChiefComplaintLiver">

        <tr>
          <td  class="FormOuterTableRow">
            <table class="EFormTable" cellspacing="0" >
              <tr class="EFormTableRow" style="background-color:#dddddd;">
                <td width="100%" align="left" valign="top" colspan="2">
                  <img src="../../Images/shim.gif" width="4" height="1" />
                  <span class="blackBoldText">Chief Complaint / Presentation</span>
                </td>
              </tr>
              <!--<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncChiefComplaint', 'Encounters')">
                <td width="50%" align="left" valign="middle" class="FormInsideTableRegCell">
                  <strong>Date:</strong>&#160;<xsl:value-of select="Encounters/EncDateText"/>&#160;
                </td>
                <td width="50%" align="left" valign="middle" class="FormInsideTableRegCell" >
                  <strong>Attending:</strong>&#160;<xsl:value-of select="Encounters/EncPhysician"/>&#160;
                </td>
              </tr>-->
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncChiefComplaint', 'Encounters')">
                <td colspan="2" width="100%" align="left" valign="top" style="padding: 5px;">
                  <xsl:value-of select="Encounters/EncChiefComplaint"/>&#160;
                </td>
              </tr>
            </table>
          </td>
        </tr>
  </xsl:template>

  <!--ComorbiditiesTableLiver parameters-->
  <xsl:param name="ComorbidityHxLS"/>
  
  <!--Template: Comorbidities -->
  <xsl:template name="ComorbiditiesTableLiver">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

          <xsl:for-each select="AbsentEvents[@RecordId=1]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td colspan="3">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Underlying Liver Disease: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>            
          </xsl:for-each>

          <xsl:if test="((AbsentEvents[@RecordId=1]/AbsentDateText  = '') and (AbsentEvents[@RecordId=1]/TableName  = '') and (AbsentEvents[@RecordId=1]/FieldName = '') and (AbsentEvents[@RecordId=1]/FieldValue   = '') and (AbsentEvents[@RecordId=1]/AbsentReason = '') )">



            <tr class="EFormTableRow" style="background-color:#dddddd;">
              <td colspan="2">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">Underlying Liver Disease</span>
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="50%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Comorbidity</strong>
              </td>
              <td width="50%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Notes</strong>
              </td>
            </tr>
            
            <!--existing comorbidities from database -->
            <xsl:value-of select="$ComorbidityHxLS" disable-output-escaping="yes"/>
            
            <xsl:for-each select="Comorbidities[@RecordId&gt;=1 and @RecordId&lt;=15]">
              <xsl:choose>
                <xsl:when test="((ComorbDateText != '') or (Comorbidity != '') or (ComorbNotes != ''))">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Comorbidities',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="Comorbidity"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="ComorbNotes"  />&#160;
                    </td>
                  </tr>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Comorbidities','')">
              <td align="center" valign="middle" class="FormInsideTableLeftCell">
                &#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                &#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                &#160;
              </td>
            </tr>
          </xsl:if>

        </table>
      </td>
    </tr>
  </xsl:template>

  <!--AntiViralTherapyTableLiver parameters-->
  <xsl:param name="AntiViralHxLS"/>
  
  <!--Template: Anti-viral Therapy-->
  <xsl:template name="AntiViralTherapyTableLiver">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

          <xsl:for-each select="AbsentEvents[@RecordId=2]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td colspan="3">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      History of Anti-viral Therapy: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:if test="((AbsentEvents[@RecordId=2]/AbsentDateText  = '') and (AbsentEvents[@RecordId=2]/TableName  = '') and (AbsentEvents[@RecordId=2]/FieldName = '') and (AbsentEvents[@RecordId=2]/FieldValue   = '') and (AbsentEvents[@RecordId=2]/AbsentReason = '') )">



            <tr class="EFormTableRow" style="background-color:#dddddd;">
              <td colspan="4">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">History of Anti-viral Therapy</span>
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Start Date</strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Type</strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Anti-viral Agent</strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Stop Date</strong>
              </td>
            </tr>
            
            <!--existing anti viral med tx from database -->
            <xsl:value-of select="$AntiViralHxLS" disable-output-escaping="yes"/>
            
            <xsl:for-each select="MedicalTherapy[@RecordId=21]">
              <xsl:choose>
                <xsl:when test="((MedTxDateText != '') or (MedTxType != '') or (MedTxStopDateText != '') or (MedTxAgent != ''))">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="MedTxDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="MedTxType"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="MedTxAgent"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="MedTxStopDateText"  />&#160;
                    </td>
                  </tr>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy','21')">
              <td align="center" valign="middle" class="FormInsideTableLeftCell">
                &#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                &#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                &#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                &#160;
              </td>
            </tr>
          </xsl:if>

        </table>
      </td>
    </tr>
  </xsl:template>

  <!--PatientsSocialHistoriesLiver parameters-->
  <xsl:param name="PatientsSocialHistoriesRows2"/>
  
  <!--Social History Table-->
  <xsl:template name="PatientsSocialHistoriesLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsSocialHistories_Anchor"/>
        <table class="EFormTable" cellspacing="0">

          <xsl:for-each select="AbsentEvents[@RecordId=10]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td colspan="3">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Social History: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:if test="((AbsentEvents[@RecordId=10]/AbsentDateText  = '') and (AbsentEvents[@RecordId=10]/TableName  = '') and (AbsentEvents[@RecordId=10]/FieldName = '') and (AbsentEvents[@RecordId=10]/FieldValue   = '') and (AbsentEvents[@RecordId=10]/AbsentReason = '') )">


            <tr class="EFormTableRow" style="background-color:#dddddd;">
              <td align="left" valign="middle" colspan="8">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">Social History</span>
              </td>
            </tr>

            <xsl:if test="($HasSocialHistory = 'No')" >

              <tr class="EFormTableRow">
                <td width="33%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                  <strong>Occupation</strong>
                </td>
                <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Marital Status</strong>
                </td>
                <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Children</strong>
                </td>
              </tr>

              <xsl:for-each select="SocialHistories[@RecordId=1]">
                <xsl:choose>
                  <xsl:when test="((SocHxOccupation != '') or (SocHxMaritalStatus != '') or (SocHxChildren != ''))">
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">
                        <xsl:value-of select="SocHxOccupation"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="SocHxMaritalStatus"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="SocHxChildren"  />&#160;
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>


              <tr>
                <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Tobacco Type</strong>
                </td>
                <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Tobacco Usage</strong>
                </td>
                <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Tobacco Year Quit</strong>
                </td>
              </tr>

              <xsl:for-each select="SocialHistories[@RecordId=1]">
                <xsl:choose>
                  <xsl:when test="((SocHxTobaccoType != '') or (SocHxTobaccoPacksPerDay != '') or (SocHxTobaccoYears != '') or (SocHxTobaccoQuitYear != '') or (SocHxTobaccoPacksPerYear != ''))">
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="SocHxTobaccoType"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">
                        <xsl:value-of select="SocHxTobaccoPacksPerDay"  />&#160;packs(s)/day for&#160;<xsl:value-of select="SocHxTobaccoYears"  />&#160;years<br/>
                        <xsl:value-of select="SocHxTobaccoPacksPerYear"  />&#160;pack(s)/year
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="SocHxTobaccoQuitYear"  />&#160;
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>

              <tr>
                <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Alcohol Status</strong>
                </td>
                <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Alcohol Usage</strong>
                </td>
                <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Alcohol Year Quit</strong>
                </td>
              </tr>

              <xsl:for-each select="SocialHistories[@RecordId=1]">
                <xsl:choose>
                  <xsl:when test="((SocHxAlcohol != '') or (SocHxAlcoholDrinksPerDay != '') or (SocHxAlcoholYears != '') or (SocHxAlcoholQuitYear != ''))">
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="SocHxAlcohol"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">
                        <xsl:value-of select="SocHxAlcoholDrinksPerDay"  />&#160;drinks(s)/day for&#160;<xsl:value-of select="SocHxAlcoholYears"  />&#160;years
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="SocHxAlcoholQuitYear"  />&#160;
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>

              <tr>
                <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Carcinogen Exposure</strong>
                </td>
                <td width="67%" colspan="2" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>Notes</strong>
                </td>
              </tr>

              <xsl:for-each select="SocialHistories[@RecordId=1]">
                <xsl:choose>
                  <xsl:when test="((SocHxNotes != '') or (SocHxCarcinogen != ''))">
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">
                        <xsl:value-of select="SocHxCarcinogen"  />&#160;
                      </td>
                      <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="SocHxNotes"  />&#160;
                      </td>

                    </tr>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                      <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>

            </xsl:if>

            <xsl:if test="($HasSocialHistory = 'Yes')" >

              <!--SocialHistories from the Database (Database currently only supports one SocialHistories)-->
              <xsl:value-of select="$PatientsSocialHistoriesRows2" disable-output-escaping="yes"/>

            </xsl:if>

          </xsl:if>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Family History Table-->
  <xsl:template name="PatientsFamilyMembersLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          
                <xsl:for-each select="AbsentEvents[@RecordId=11]">
                  <xsl:choose>
                    <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                      <tr class="EFormTableRow" style="background-color:#dddddd;" >
                        <td colspan="3">
                          <img src="../../Images/shim.gif" width="4" height="1" />
                          <span class="blackBoldText">
                            Family History: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                          </span>
                        </td>
                      </tr>
                    </xsl:when>
                  </xsl:choose>
                </xsl:for-each>

                <xsl:if test="((AbsentEvents[@RecordId=11]/AbsentDateText  = '') and (AbsentEvents[@RecordId=11]/TableName  = '') and (AbsentEvents[@RecordId=11]/FieldName = '') and (AbsentEvents[@RecordId=11]/FieldValue   = '') and (AbsentEvents[@RecordId=11]/AbsentReason = '') )">

                  <tr class="EFormTableRow" style="background-color:#dddddd;">
                    <td align="left" valign="middle" colspan="7">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">Family History</span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Side of Family</strong>
                    </td>
                    <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Relation</strong>
                    </td>
                    <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Death Age</strong>
                    </td>
                    <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Diagnosis</strong>
                    </td>
                    <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Age</strong>
                    </td>
                    <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Notes</strong>
                    </td>
                  </tr>

                  <!--Family History from the Database-->
                  <!--<xsl:value-of select="$PatientsFamilyMembersRows" disable-output-escaping="yes"/>-->

                  <xsl:for-each select="FamilyMembers">
                    <xsl:choose>
                      <xsl:when test="((FamMemSide != '') or (FamMemRelation != '') or (FamMemDeathAge != ''))">
                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('FamilyMembers','')" >
                          <td align="center" valign="middle" class="FormInsideTableLeftCell" >
                            <xsl:value-of select="FamMemSide"  />&#160;
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell" >
                            <xsl:value-of select="FamMemRelation"  />&#160;
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell" >
                            <xsl:value-of select="FamMemDeathAge"  />&#160;
                          </td>

                          <xsl:for-each select="FamilyMemberDiagnosis">
                            <xsl:choose>
                              <xsl:when test="((FamMemDiagnosis != '') or (FamMemDiagnosisAge != '') or (FamMemNotes != ''))">
                                <td align="center" valign="middle" class="FormInsideTableRegCell" >
                                  <xsl:value-of select="FamMemDiagnosis" />&#160;
                                </td>
                                <td align="center" valign="middle" class="FormInsideTableRegCell" >
                                  <xsl:value-of select="FamMemDiagnosisAge"  />&#160;
                                </td>
                                <td align="center" valign="middle" class="FormInsideTableRegCell" >
                                  <xsl:value-of select="FamMemNotes"  />&#160;
                                </td>
                                <tr></tr>
                                <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                                <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                                <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        </tr>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('FamilyMembers','')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                  </tr>
                </xsl:if>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--VitalSignsLiver parameters-->
  <xsl:param name="VitalSignsHxLS"/>
  
  <!-- Vital Signs : Match=Encounters-->
  <xsl:template name="VitalSignsLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="VitalSignsLiver_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Encounter</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Date</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Height (cm)</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Weight (kg)</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>BMI</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Hospital</strong>
            </td>
            <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>
          
          <!--existing encounters from database -->
          <xsl:value-of select="$VitalSignsHxLS" disable-output-escaping="yes"/>
          
          <xsl:for-each select="Encounters">
            <xsl:choose>
              <xsl:when test="((EncHeight != '') or (EncWeight != '') or (EncDateText != '') or (EncBMI != '') or (EncNotes != '') or (EncInstitution != ''))">
                <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''">
                  <td align="center" valign="middle" class="FormInsideTableRegCell"   onclick="LoadComponentByField('EncDateText', 'Encounters')">
                    <xsl:value-of select="EncDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onclick="LoadComponentByField('EncHeight', 'Encounters')">
                    <xsl:value-of select="EncHeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onclick="LoadComponentByField('EncWeight', 'Encounters')">
                    <xsl:value-of select="EncWeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" nclick="LoadComponentByField('EncBMI', 'Encounters')">
                    <xsl:value-of select="EncBMI"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onclick="LoadComponentByField('EncInstitution', 'Encounters')">
                    <xsl:value-of select="EncInstitution"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onclick="LoadComponentByField('EncNotes', 'Encounters')">
                    <xsl:value-of select="EncNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  >
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onclick="LoadComponentByField('EncDateText', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onclick="LoadComponentByField('EncHeight', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onclick="LoadComponentByField('EncWeight', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onclick="LoadComponentByField('EncBMI', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onclick="LoadComponentByField('EncInstitution', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onclick="LoadComponentByField('EncNotes', 'Encounters')">&#160;</td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--PerformanceLiver parameters-->
  <xsl:param name="PerformanceLiverHxLS"/>
  
  <!--Pre-Op Performance : Match=Encounters-->
  <xsl:template match="Encounters" name="PerformanceLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PerformanceLiver_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="8">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Assessment</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>ECOG</strong>
            </td>
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>KPS</strong>
            </td>
          </tr>
          
          <!--existing diagnosis dates from database -->
          <xsl:value-of select="$PerformanceLiverHxLS" disable-output-escaping="yes"/>
          
          <xsl:for-each select="Encounters">
            <xsl:choose>
              <xsl:when test="((EncKPS != '') or (EncECOG_Score != ''))">
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncECOG_Score', 'Encounters')">
                    <xsl:value-of select="EncECOG_Score"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncKPS', 'Encounters')">
                    <xsl:value-of select="EncKPS"  />&#160;
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncECOG_Score', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncKPS', 'Encounters')">&#160;</td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--ImagingLiver parameters-->
  <xsl:param name="ImagingLiverHxLS"/>
  
  <!--Imaging Table-->
  <xsl:template name="ImagingLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="ImagingLiver_Anchor"/>
        <table class="EFormTable" cellspacing="0">

          <xsl:for-each select="AbsentEvents[@RecordId=6]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td colspan="3">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Imaging: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:if test="((AbsentEvents[@RecordId=6]/AbsentDateText  = '') and (AbsentEvents[@RecordId=6]/TableName  = '') and (AbsentEvents[@RecordId=6]/FieldName = '') and (AbsentEvents[@RecordId=6]/FieldValue   = '') and (AbsentEvents[@RecordId=6]/AbsentReason = '') )">

            <tr class="EFormTableRow" style="background-color:#dddddd;">
              <td align="left" valign="middle" colspan="6">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">Imaging</span>
              </td>
            </tr>

            <!--existing liver imaging from database -->
            <xsl:value-of select="$ImagingLiverHxLS" disable-output-escaping="yes"/>
            
            <xsl:for-each select="Diagnostics[@RecordId&gt;=1 and @RecordId&lt;=12]">
              <xsl:choose>
                <xsl:when test="(DxDateText != '') or (DxType != '') or (DxResult != '') or (DxNotes != '') or (DxTotalNumTumors != '') or (DxTarget != '') or (DxInstitution != '') ">
                  <tr class="EFormTableRow">
                    <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Date</strong>
                    </td>
                    <td width="20%" colspan="2" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Result </strong>
                    </td>
                    <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Scan Type</strong>
                    </td>
                    <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong># of tumors</strong>
                    </td>
                    <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Institution </strong>
                    </td>
                  </tr>

                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})" >
                    <td align="center" valign="middle" class="FormInsideTableLeftCell" >
                      <xsl:value-of select="DxDateText"  />&#160;
                    </td>
                    <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="DxResult"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="DxType"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="DxTotalNumTumors"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="DxInstitution"  />&#160;
                    </td>
                  </tr>
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})" >
                    <td colspan="6" align="left" valign="middle" class="FormInsideTableLeftCell" >
                      <strong>Notes: </strong><xsl:value-of select="DxNotes"  />&#160;
                    </td>
                  </tr>


                  <tr class="EFormTableRow" >
                    <td class="FormInsideTableTopLeftCell" ></td>
                    <td colspan="2" align="center" valign="middle" class="FormInsideTableTopLeftCell" >
                      <strong>Finding</strong>
                    </td>
                    <td colspan="2" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Location (if applicable)</strong>
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Size (if applicable)</strong>
                    </td>
                  </tr>
                      <xsl:for-each select="DxImageFindings">
                        <xsl:choose>
                          <xsl:when test="(ImgFindSite != '') or (ImgFindSubsite != '') or (ImgFindResult != '') or (ImgFindWidth != '')  ">
                            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('DxImageFindings',{./@RecordId})" >
                              <td align="center" valign="middle" class="FormInsideTableLeftCell"></td>
                              <td colspan="2" align="center" valign="middle" class="FormInsideTableLeftCell" >
                                <xsl:value-of select="ImgFindResult"  />&#160;
                              </td>
                              <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell" >
                                <xsl:if test=" (ImgFindResult != 'Vascular invasion') and  (ImgFindResult != 'Ascites') and (ImgFindResult != 'Lymphadenopathy') ">
                                  <xsl:value-of select="ImgFindSubsite"  />&#160;
                                </xsl:if>
                                <xsl:if test=" (ImgFindResult = 'Vascular invasion') or  (ImgFindResult = 'Ascites') or (ImgFindResult = 'Lymphadenopathy') ">
                                  &#160;
                                </xsl:if>

                              </td>
                              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                                <xsl:if test=" (ImgFindResult != 'Vascular invasion') and  (ImgFindResult != 'Ascites') and (ImgFindResult != 'Distant metastases') ">
                                  <xsl:value-of select="ImgFindWidth"  />&#160;
                                </xsl:if>
                                <xsl:if test=" (ImgFindResult = 'Vascular invasion') or  (ImgFindResult = 'Ascites') or (ImgFindResult = 'Distant metastases') ">
                                  &#160;
                                </xsl:if>
                              </td>
                            </tr>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>

                  <tr class="EFormTableRow">
                    <td colspan="6" align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                  </tr>
                  
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','')">
              <td colspan="6" align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>

            </tr>

          </xsl:if>
        </table>

      </td>
    </tr>
  </xsl:template>

  <!--BiopsyPerformedLiver parameters-->
  <xsl:param name="BiopsyPerformedHxLS"/>
  
  <!--Biopsy Performed : Match=Procedures-->
  <xsl:template match="Procedures" name="BiopsyPerformedLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PerformanceLiver_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="3">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Biopsy Performed</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Date</strong>
            </td>
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Procedure</strong>
            </td>
            <td width="34%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Type</strong>
            </td>
          </tr>
          
          <!--existing biopsies from database -->
          <xsl:value-of select="$BiopsyPerformedHxLS" disable-output-escaping="yes"/>
          
          <xsl:for-each select="Procedures[@RecordId=16]">
            <xsl:choose>
              <xsl:when test="((ProcDateText != '') or (ProcName != '') or (ProcApproach != '') or (ProcNotes != ''))">
                <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByTable('Procedures',{./@RecordId})" >
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ProcDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ProcName"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ProcApproach"  />&#160;
                  </td>
                </tr>
                <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByTable('Procedures',{./@RecordId})" >
                  <td colspan="3" width="100%" align="left" valign="top" style="padding: 5px;">
                    <strong>Pathology Report:  </strong>
                    <xsl:value-of select="ProcNotes"/>&#160;
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByTable('Procedures',{./@RecordId})" >
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--LabsLiver parameters-->
  <xsl:param name="LabsLiverHxLS"/>
  
  <!--Template: Lab Tests -->
  <xsl:template name="LabsLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="LabsLiver_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="5">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Lab Tests</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Test</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Result</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Units</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <!--existing labs from database -->
          <xsl:value-of select="$LabsLiverHxLS" disable-output-escaping="yes"/>
          
          <xsl:for-each select="LabTests[@RecordId&lt;=5 or (@RecordId&gt;=20 and @RecordId&lt;=22) or  (@RecordId&gt;=35 and @RecordId&lt;=41) ]">
            <xsl:choose>
              <xsl:when test="((LabDateText != '') or (LabTest != '') or (LabResult != '') or (LabUnits != '') or (LabNotes != '') )">
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
                    <xsl:value-of select="LabUnits"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="LabNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: ChildPughScoreLiver -->
  <xsl:template name="ChildPughScoreLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="ChildPughScoreLiver_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Child-Pugh Score</span>
            </td>
          </tr>


          <tr class="EFormTableRow">
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Date</strong>
            </td>
            <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Child-Pugh Score</strong>
            </td>
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Total Points</strong>
            </td>
          </tr>
          <xsl:for-each select="Surveys[@RecordId=1]">
            <xsl:choose>
              <xsl:when test="((SurveyDateText != '') or (SurveyTotal != '') or (SurveyResult != '') or (SurveyNotes != '') )">

                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Surveys',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="SurveyDateText"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="SurveyTotal" />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="SurveyResult"  />&#160;
                  </td>

                </tr>

                <tr class="EFormTableRow">
                  <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Assessment Type</strong>
                  </td>
                  <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Result</strong>
                  </td>
                  <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Points</strong>
                  </td>
                </tr>

                <xsl:for-each select="SurveyItems">
                  <xsl:choose>
                    <xsl:when test="((SurveyItem != '') or (SurveyItemResult != '') or (SurveyItemTotal != ''))">

                      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Surveys',{./@RecordId})">
                        <td align="center" valign="middle" class="FormInsideTableLeftCell">
                          <xsl:value-of select="SurveyItem"/>&#160;
                        </td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">
                          <xsl:value-of select="SurveyItemResult" />&#160;
                        </td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">
                          <xsl:value-of select="SurveyItemTotal"  />&#160;
                        </td>
                      </tr>

                    </xsl:when>
                  </xsl:choose>
                </xsl:for-each>


              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Surveys','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--InterventionalRadLiver parameters-->
  <xsl:param name="InterventionalRadHxLS"/>
  
  <!--Template: InterventionalRadLiver -->
  <xsl:template name="InterventionalRadLiver">
    <tr>
      <td class="FormOuterTableRow">

        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Interventional Radiology</span>
            </td>
          </tr>


          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Procedure</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Location</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Surgeon<br/>(if applicable)</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Approach<br/>(if applicable)</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <!--existing interventional radiology (TACE, PVE, and RFA procedures) from database -->
          <xsl:value-of select="$InterventionalRadHxLS" disable-output-escaping="yes"/>
          
          <xsl:for-each select="Procedures[@RecordId&gt;=21 and @RecordId&lt;=35]">
            <xsl:choose>
              <xsl:when test="((ProcDateText != '') or (ProcName != '') or (ProcSite != '') or (ProcSubsite != '') or (ProcSurgeon != '') or (ProcApproach  != '') or (ProcNotes != '') )">

                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProcDateText"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcName" />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcSubsite"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:if test=" (ProcName != 'RFA' ) ">
                      &#160;
                    </xsl:if>
                    <xsl:if test=" (ProcName = 'RFA' ) ">
                      <xsl:value-of select="ProcSurgeon"  />&#160;
                    </xsl:if>
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:if test=" (ProcName != 'RFA' ) ">
                      &#160;
                    </xsl:if>
                    <xsl:if test=" (ProcName = 'RFA' ) ">
                      <xsl:value-of select="ProcApproach"  />&#160;
                    </xsl:if>                                       
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcNotes"  />&#160;
                  </td>

                </tr>

              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>          
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Operative OperativeDetailLiver -->
  <xsl:template name="OperativeDetailLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="OperativeDetailLiver_Anchor"/>
        <table class="EFormTable" cellspacing="0">

          <xsl:for-each select="AbsentEvents[@RecordId=4]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td colspan="3">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Surgery Detail: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:if test="((AbsentEvents[@RecordId=4]/AbsentDateText  = '') and (AbsentEvents[@RecordId=4]/TableName  = '') and (AbsentEvents[@RecordId=4]/FieldName = '') and (AbsentEvents[@RecordId=4]/FieldValue   = '') and (AbsentEvents[@RecordId=4]/AbsentReason = '') )">

            <xsl:variable name="GlobalApproach_40" select="NoTable/ProcApproachGlobal_40"></xsl:variable>
            <xsl:variable name="PringleDuration_40" select="NoTable/Duration_of_Pringle_min_40"></xsl:variable>
            
            <xsl:for-each select="OperatingRoomDetails[@RecordId=40]">
              <xsl:choose>
                <xsl:when test="((OpDateText != '') or (OpCaseSurgeon != '') or ($GlobalApproach_40 != '') or (OpDuration != '') or (OpRBC_Transfused != '') or ($PringleDuration_40  != '') )">
                  <tr class="EFormTableRow" style="background-color:#dddddd;">
                    <td align="left" valign="middle" colspan="6" >
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">
                        Surgery Detail - Operative Detail 
                      </span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow" >
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Date of Operation</strong>
                    </td>
                    <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgeon</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgical Approach</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Operating Time(min)</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong> RBC Transfused(units) </strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Duration of Pringle (minutes)</strong>
                    </td>
                  </tr>
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('OperatingRoomDetails',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="OpDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpCaseSurgeon"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$GlobalApproach_40"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpDuration"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpRBC_Transfused"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$PringleDuration_40"  />&#160;
                    </td>
                  </tr>

                  <tr class="EFormTableRow" >
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                    <td align="left" valign="middle" colspan="5" style="background-color:#dddddd;">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">Procedures </span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Primary</strong>
                    </td>
                    <td colspan="2" width="36%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgery Type</strong>
                    </td>
                    <td colspan="2" width="54%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Notes</strong>
                    </td>
                  </tr>

                  <xsl:for-each select="Procedures">
                    <xsl:choose>
                      <xsl:when test="((ProcDateText != '') or (ProcSurgeon != '') or (ProcPrimary != '') or (ProcName != '') or (ProcApproach != '') or (ProcNotes!= '') )">
                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                          <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">
                            <xsl:if test="ProcPrimary = 1">
                                Yes&#160;
                            </xsl:if>
                            <xsl:if test="ProcPrimary != 1">
                              No&#160;
                            </xsl:if>
                          </td>
                          <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                            <xsl:value-of select="ProcName"  />&#160;
                          </td>
                          <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                            <xsl:value-of select="ProcNotes"  />&#160;
                          </td>
                        </tr>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>

                </xsl:when>
              </xsl:choose>
            </xsl:for-each>

            <xsl:variable name="GlobalApproach_2" select="NoTable/ProcApproachGlobal_2"></xsl:variable>
            <xsl:variable name="PringleDuration_2" select="NoTable/Duration_of_Pringle_min_2"></xsl:variable>

            <xsl:for-each select="OperatingRoomDetails[@RecordId=2]">
              <xsl:choose>
                <xsl:when test="((OpDateText != '') or (OpCaseSurgeon != '') or ($GlobalApproach_2 != '') or (OpDuration != '') or (OpRBC_Transfused != '') or ($PringleDuration_2  != '') )">
                  <tr class="EFormTableRow" style="background-color:#dddddd;">
                    <td align="left" valign="middle" colspan="6">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">
                        Surgery Detail - Operative Detail 
                      </span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Date of Operation</strong>
                    </td>
                    <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgeon</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgical Approach</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Operating Time(min)</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong> RBC Transfused(units) </strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Duration of Pringle (minutes)</strong>
                    </td>
                  </tr>
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('OperatingRoomDetails',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="OpDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpCaseSurgeon"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$GlobalApproach_2"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpDuration"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpRBC_Transfused"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$PringleDuration_2"  />&#160;
                    </td>
                  </tr>

                  <tr class="EFormTableRow" >
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                    <td align="left" valign="middle" colspan="5" style="background-color:#dddddd;">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">
                        Procedures
                      </span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Primary</strong>
                    </td>
                    <td colspan="2" width="36%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgery Type</strong>
                    </td>
                    <td colspan="2" width="54%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Notes</strong>
                    </td>
                  </tr>

                  <xsl:for-each select="Procedures">
                    <xsl:choose>
                      <xsl:when test="((ProcDateText != '') or (ProcSurgeon != '') or (ProcPrimary != '') or (ProcName != '') or (ProcApproach != '') or (ProcNotes!= '') )">
                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                          <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">
                            <xsl:if test="ProcPrimary = 1">
                              Yes&#160;
                            </xsl:if>
                            <xsl:if test="ProcPrimary != 1">
                              No&#160;
                            </xsl:if>
                          </td>
                          <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                            <xsl:value-of select="ProcName"  />&#160;
                          </td>
                          <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                            <xsl:value-of select="ProcNotes"  />&#160;
                          </td>
                        </tr>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>

                </xsl:when>
              </xsl:choose>
            </xsl:for-each>

            <xsl:variable name="GlobalApproach_3" select="NoTable/ProcApproachGlobal_3"></xsl:variable>
            <xsl:variable name="PringleDuration_3" select="NoTable/Duration_of_Pringle_min_3"></xsl:variable>

            <xsl:for-each select="OperatingRoomDetails[@RecordId=3]">
              <xsl:choose>
                <xsl:when test="((OpDateText != '') or (OpCaseSurgeon != '') or ($GlobalApproach_3 != '') or (OpDuration != '') or (OpRBC_Transfused != '') or ($PringleDuration_3  != '') )">
                  <tr class="EFormTableRow" style="background-color:#dddddd;">
                    <td align="left" valign="middle" colspan="6">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">
                        Surgery Detail - Operative Detail
                      </span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Date of Operation</strong>
                    </td>
                    <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgeon</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgical Approach</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Operating Time(min)</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong> RBC Transfused(units) </strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Duration of Pringle (minutes)</strong>
                    </td>
                  </tr>
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('OperatingRoomDetails',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="OpDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpCaseSurgeon"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$GlobalApproach_3"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpDuration"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpRBC_Transfused"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$PringleDuration_3"  />&#160;
                    </td>
                  </tr>

                  <tr class="EFormTableRow" >
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                    <td align="left" valign="middle" colspan="5" style="background-color:#dddddd;">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">
                        Procedures 
                      </span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Primary</strong>
                    </td>
                    <td colspan="2" width="36%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgery Type</strong>
                    </td>
                    <td colspan="2" width="54%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Notes</strong>
                    </td>
                  </tr>

                  <xsl:for-each select="Procedures">
                    <xsl:choose>
                      <xsl:when test="((ProcDateText != '') or (ProcSurgeon != '') or (ProcPrimary != '') or (ProcName != '') or (ProcApproach != '') or (ProcNotes!= '') )">
                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                          <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">
                            <xsl:if test="ProcPrimary = 1">
                              Yes&#160;
                            </xsl:if>
                            <xsl:if test="ProcPrimary != 1">
                              No&#160;
                            </xsl:if>
                          </td>
                          <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                            <xsl:value-of select="ProcName"  />&#160;
                          </td>
                          <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                            <xsl:value-of select="ProcNotes"  />&#160;
                          </td>
                        </tr>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>

                </xsl:when>
              </xsl:choose>
            </xsl:for-each>

            <xsl:variable name="GlobalApproach_4" select="NoTable/ProcApproachGlobal_4"></xsl:variable>
            <xsl:variable name="PringleDuration_4" select="NoTable/Duration_of_Pringle_min_4"></xsl:variable>

            <xsl:for-each select="OperatingRoomDetails[@RecordId=4]">
              <xsl:choose>
                <xsl:when test="((OpDateText != '') or (OpCaseSurgeon != '') or ($GlobalApproach_4 != '') or (OpDuration != '') or (OpRBC_Transfused != '') or ($PringleDuration_4  != '') )">
                  <tr class="EFormTableRow" style="background-color:#dddddd;">
                    <td align="left" valign="middle" colspan="6">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">
                        Surgery Detail - Operative Detail 
                      </span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Date of Operation</strong>
                    </td>
                    <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgeon</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgical Approach</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Operating Time(min)</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong> RBC Transfused(units) </strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Duration of Pringle (minutes)</strong>
                    </td>
                  </tr>
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('OperatingRoomDetails',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="OpDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpCaseSurgeon"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$GlobalApproach_4"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpDuration"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpRBC_Transfused"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$PringleDuration_4"  />&#160;
                    </td>
                  </tr>

                  <tr class="EFormTableRow" >
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                    <td align="left" valign="middle" colspan="5" style="background-color:#dddddd;">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">
                        Procedures 
                      </span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Primary</strong>
                    </td>
                    <td colspan="2" width="36%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgery Type</strong>
                    </td>
                    <td colspan="2" width="54%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Notes</strong>
                    </td>
                  </tr>

                  <xsl:for-each select="Procedures">
                    <xsl:choose>
                      <xsl:when test="((ProcDateText != '') or (ProcSurgeon != '') or (ProcPrimary != '') or (ProcName != '') or (ProcApproach != '') or (ProcNotes!= '') )">
                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                          <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">
                            <xsl:if test="ProcPrimary = 1">
                              Yes&#160;
                            </xsl:if>
                            <xsl:if test="ProcPrimary != 1">
                              No&#160;
                            </xsl:if>
                          </td>
                          <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                            <xsl:value-of select="ProcName"  />&#160;
                          </td>
                          <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                            <xsl:value-of select="ProcNotes"  />&#160;
                          </td>
                        </tr>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>

                </xsl:when>
              </xsl:choose>
            </xsl:for-each>

            <xsl:variable name="GlobalApproach_5" select="NoTable/ProcApproachGlobal_5"></xsl:variable>
            <xsl:variable name="PringleDuration_5" select="NoTable/Duration_of_Pringle_min_5"></xsl:variable>

            <xsl:for-each select="OperatingRoomDetails[@RecordId=5]">
              <xsl:choose>
                <xsl:when test="((OpDateText != '') or (OpCaseSurgeon != '') or ($GlobalApproach_5 != '') or (OpDuration != '') or (OpRBC_Transfused != '') or ($PringleDuration_5  != '') )">
                  <tr class="EFormTableRow" style="background-color:#dddddd;">
                    <td align="left" valign="middle" colspan="6">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">
                        Surgery Detail - Operative Detail
                      </span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Date of Operation</strong>
                    </td>
                    <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgeon</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgical Approach</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Operating Time(min)</strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong> RBC Transfused(units) </strong>
                    </td>
                    <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Duration of Pringle (minutes)</strong>
                    </td>
                  </tr>
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('OperatingRoomDetails',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="OpDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpCaseSurgeon"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$GlobalApproach_5"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpDuration"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="OpRBC_Transfused"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$PringleDuration_5"  />&#160;
                    </td>
                  </tr>

                  <tr class="EFormTableRow" >
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                    <td align="left" valign="middle" colspan="5" style="background-color:#dddddd;">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">
                        Procedures 
                      </span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                    <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Primary</strong>
                    </td>
                    <td colspan="2" width="36%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Surgery Type</strong>
                    </td>
                    <td colspan="2" width="54%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Notes</strong>
                    </td>
                  </tr>

                  <xsl:for-each select="Procedures">
                    <xsl:choose>
                      <xsl:when test="((ProcDateText != '') or (ProcSurgeon != '') or (ProcPrimary != '') or (ProcName != '') or (ProcApproach != '') or (ProcNotes!= '') )">
                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                          <td colspan="1" width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"></td>
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">
                            <xsl:if test="ProcPrimary = 1">
                              Yes&#160;
                            </xsl:if>
                            <xsl:if test="ProcPrimary != 1">
                              No&#160;
                            </xsl:if>
                          </td>
                          <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                            <xsl:value-of select="ProcName"  />&#160;
                          </td>
                          <td colspan="2" align="center" valign="middle" class="FormInsideTableRegCell">
                            <xsl:value-of select="ProcNotes"  />&#160;
                          </td>
                        </tr>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>

                </xsl:when>
              </xsl:choose>
            </xsl:for-each>

            <tr class="EFormTableRow" >
              <td colspan="6" align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            </tr>
          </xsl:if>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Matches Hospitalizations Data-->
  <xsl:template name="LiverSurgeryHospitalization">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="5">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Hospitalization</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Discharge Date</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Total ICU Stady (days)</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Length Of Stay (days)</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Hospital</strong>
            </td>
            <!--<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Post-op RBC Transfused (units)</strong>
            </td>-->
          </tr>

          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Hospitalizations','1')">
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              <xsl:value-of select="Hospitalizations[@RecordId=1]/HospDischargeDateText"/>&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              <xsl:value-of select="Hospitalizations[@RecordId=1]/HospICUStay"/>&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              <xsl:value-of select="NoTable/LengthOfStay"/>&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              <xsl:value-of select="Hospitalizations[@RecordId=1]/HospInstitution"/>&#160;
            </td>
            <!--<td align="center" valign="middle" class="FormInsideTableRegCell">
              <xsl:value-of select="OperatingRoomDetails[@RecordId=40]/OpRBC_PostOp"/>&#160;
            </td>-->
          </tr>

        </table>
      </td>
    </tr>

  </xsl:template>

  <!--Template: PostOpLabsLiver -->
  <xsl:template name="PostOpLabsLiver">
    <tr>
      <td class="FormOuterTableRow">

        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="5">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Post-op Labs</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Test</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Result</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Units</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <!--existing labs from database -->
          <xsl:value-of select="$LabsLiverHxLS" disable-output-escaping="yes"/>

          <xsl:for-each select="LabTests[@RecordId&gt;=23 and @RecordId&lt;=34]">
            <xsl:choose>
              <xsl:when test="((LabDateText != '') or (LabTest != '') or (LabResult != '') or (LabUnits != '') or (LabNotes != ''))">
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
                    <xsl:value-of select="LabUnits"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="LabNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--PostOpCompLiver parameters-->
  <xsl:param name="ToxicityLiverHxLS"/>
  
  <!--Template: PostOpCompLiver -->
  <xsl:template name="PostOpCompLiver">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >


          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="3">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Post-op Complications</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Complication</strong>
            </td>
            <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>


          <!--existing complications from database -->
          <xsl:value-of select="$ToxicityLiverHxLS" disable-output-escaping="yes"/>
          
          <xsl:for-each select="Toxicities[@RecordId&gt;=6 and @RecordId&lt;=10]">
            <xsl:choose>
              <xsl:when test="((ToxDateText != '') or (ToxName != '') or (ToxNotes  != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Toxicities',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ToxDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ToxName"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ToxNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Toxicities','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">
              &#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              &#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              &#160;
            </td>
          </tr>


        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: PathReportLiver-->
  <xsl:template name="PathReportLiver">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

          <xsl:for-each select="AbsentEvents[@RecordId=5]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td colspan="3">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Pathology Report: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:if test="((AbsentEvents[@RecordId=5]/AbsentDateText  = '') and (AbsentEvents[@RecordId=5]/TableName  = '') and (AbsentEvents[@RecordId=5]/FieldName = '') and (AbsentEvents[@RecordId=5]/FieldValue   = '') and (AbsentEvents[@RecordId=5]/AbsentReason = '') )">

            <tr class="EFormTableRow" style="background-color:#dddddd;">
              <td width="100%" align="left" valign="top" colspan="4">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">Pathology Report</span>
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Path Report Date </strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Path #</strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong> Tumor Histology</strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Vascular Inv</strong>
              </td>
            </tr>
            
            <xsl:for-each select="OperatingRoomDetails[@RecordId=40]/Procedures[@RecordId=40]/Pathology[@RecordId=40]">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology',{./@RecordId})">
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="PathDateText"/>&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="PathNum"/>&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="PathHistology"/>&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="LiverPath[@RecordId=1]/PathVascularInv"/>&#160;
                </td>
              </tr>
            </xsl:for-each>

            <tr class="EFormTableRow">
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Margin </strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong> Closest Margin(mm)</strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Size of Largest Tumor (cm)</strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong># of Tumors</strong>
              </td>
            </tr>
            
            <xsl:for-each select="OperatingRoomDetails[@RecordId=40]/Procedures[@RecordId=40]/Pathology[@RecordId=40]">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology',{./@RecordId})">
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="LiverPath[@RecordId=1]/PathMargin"/>&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="LiverPath[@RecordId=1]/PathClosestMarginDistance"/>&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="LiverPath[@RecordId=1]/PathTumorMaxDim"/>&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="LiverPath[@RecordId=1]/PathNumTotalTumors"/>&#160;
                </td>
              </tr>
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology',{./@RecordId})">
                <td colspan="4" align="left" valign="middle" class="FormInsideTableRegCell">
                  <strong>Notes:  </strong><xsl:value-of select="PathNotes"/>&#160;
                </td>
              </tr>
            </xsl:for-each>

          </xsl:if>
        </table>
      </td>
    </tr>

  </xsl:template>

  <!--MedicalTherapiesLiver parameters-->
  <xsl:param name="MedicalTherapiesLiverHxLS"/>
  
  <!--Medical Therapy Table-->
  <xsl:template name="MedicalTherapiesLiver">
    <tr>
      <td class="FormOuterTableRow">
        <a name="MedicalTherapy_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Medical Therapies</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Type</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Dose</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Unit</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Stop Date</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <!--existing radiation tx from database -->
          <xsl:value-of select="$MedicalTherapiesLiverHxLS" disable-output-escaping="yes"/>
          
          <xsl:for-each select="MedicalTherapy[@RecordId&gt;=11 and @RecordId&lt;=20]">
            <xsl:choose>
              <xsl:when test="((MedTxDateText != '') or (MedTxType != '') or (MedTxStopDateText != '') or (MedTxDose != '') or (MedTxUnits != '') or (MedTxNotes != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="MedTxDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxType"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxDose"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="MedTxUnits" />&#160;<xsl:value-of select="MedTxUnits"  />
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxStopDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Radiation Therapy Table-->
  <xsl:template name="RadiationTherapiesLiver">
    <tr>
      <td class="FormOuterTableRow">

        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Radiation Therapies</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Type</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Target</strong>
            </td>
            <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Total Dose</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Institution</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>
          
          <!--Radiation Therapies from the Database-->
          <xsl:value-of select="$RadiationTherapyRows" disable-output-escaping="yes"/>
          
          <xsl:for-each select="RadiationTherapy[@RecordId&gt;=11 and @RecordId&lt;=20]">
            <xsl:choose>
              <xsl:when test="((RadTxDateText != '') or (RadTxType != '') or (RadTxTarget != '') or (RadTxTotalDose != '') or (RadTxInstitution != '') or (RadTxNotes != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('RadiationTherapy',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="RadTxDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="RadTxType"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="RadTxTarget"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="RadTxTotalDose"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="RadTxInstitution"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="RadTxNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('RadiationTherapy','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Matches Last Contact Status Data-->
  <xsl:template name="LastContactStatusLiver">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Last Contact Status</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Status</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Disease</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <xsl:for-each select="Status[@RecordId&gt;=11 and @RecordId&lt;=20]">
            <xsl:choose>
              <xsl:when test=" (Status != '') or (StatusDateText != '')  or (StatusDisease != '') or (StatusNotes != '')">
            <tr class="EFormTableRow" >
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="Status"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="StatusDateText"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="StatusDisease"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="StatusNotes"/>&#160;
              </td>
            </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" >
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>

        </table>
      </td>
    </tr>

  </xsl:template>

  <!--Template: Recurrence Status Data-->
  <xsl:template name="RecurrenceLiver">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

          <xsl:variable name="RecurrenceDetectedValue" select="NoTable/Recurrence_Detection"></xsl:variable>
          <xsl:variable name="RecurrenceLocationValue" select="NoTable/Recurrence_Location"></xsl:variable>

          <xsl:if test="NoTable/RecurrenceRecorded = 'No'">

            <tr class="EFormTableRow" style="background-color:#dddddd;" >
              <td colspan="4">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">
                  Recurrence: <xsl:value-of select="Status[@RecordId&gt;=22]/Status"  /> as of  <xsl:value-of select="Status[@RecordId&gt;=22]/StatusDateText"  />
                </span>
              </td>
            </tr>

          </xsl:if>

          <xsl:if test="NoTable/RecurrenceRecorded = 'Yes'">

            <xsl:for-each select="Status[@RecordId&gt;=22]">
              <xsl:choose>
                <xsl:when test=" (Status != '') or (StatusDateText != '')  or (StatusDisease != '')">
                  <tr class="EFormTableRow" style="background-color:#dddddd;">
                    <td width="100%" align="left" valign="top" colspan="4">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">Recurrence</span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                      <strong>Date</strong>
                    </td>
                    <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Recurrence detected by</strong>
                    </td>
                    <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Location of first recurrence</strong>
                    </td>
                    <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                      <strong>Disease</strong>
                    </td>
                  </tr>
                  <tr class="EFormTableRow" >
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="StatusDateText"/>&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$RecurrenceDetectedValue"/>&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="$RecurrenceLocationValue"/>&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="StatusDisease"/>&#160;
                    </td>
                  </tr>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>         
          </xsl:if>


        </table>
      </td>
    </tr>

  </xsl:template>

  <!--DeathDateLiver parameters-->
  <xsl:param name="PtDeathCause"/>
  <xsl:param name="PtDeathType"/>
  <xsl:param name="PtDeathAgePDSHistory"/>
  
  <!--Template: DeathDateLiver Data-->
  <xsl:template name="DeathDateLiver">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

                <tr class="EFormTableRow" style="background-color:#dddddd;">
                  <td width="100%" align="left" valign="top" colspan="3">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">Patient Death</span>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td width="33%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                    <strong>Death</strong>
                  </td>
                  <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Type</strong>
                  </td>
                  <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Cause</strong>
                  </td>
                </tr>
                <tr class="EFormTableRow" >
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="$PtDeathAgePDSHistory"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:if test="$PtDeathAgePDSHistory = 'No'">
                      &#160;
                    </xsl:if>
                    <xsl:if test="$PtDeathAgePDSHistory != 'No'">
                      <xsl:value-of select="$PtDeathType"/>&#160;
                    </xsl:if>
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:if test="$PtDeathAgePDSHistory = 'No'">
                      &#160;
                    </xsl:if>
                    <xsl:if test="$PtDeathAgePDSHistory != 'No'">
                      <xsl:value-of select="$PtDeathCause"/>&#160;
                    </xsl:if>                    
                  </td>
                </tr>

        </table>
      </td>
    </tr>

  </xsl:template>
  
  <xsl:include href="../../../Core/Eforms/EFormTemplateLibrary.xslt" />
  <xsl:template match="eform">
    <script type="text/javascript">pageMaxHeight = 1050;</script>
  <xsl:call-template name="McGillEFormStyles"/>
  

    <div align="left"  style="page-break-after:always;" >
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        
        <!--Header-->
        <xsl:call-template name="EformHeaderLiver"/>
        
        <!--Sub-Header-->
        <xsl:call-template name="HPIHeader"/>
        <!--Date of Diagnosis-->
        <xsl:call-template name="DiagnosisDate"/>
        <!--Demographics-->
        <xsl:call-template name="DemographicsTableLiver"/>
        
        
        <!--Chief Complaint-->
        <xsl:call-template name="ChiefComplaintLiver"/>
        
        <!--Sub-Header-->
        <xsl:call-template name="PastMedHistoryHeader"/>
        <!--Comorbidities-->
        <xsl:call-template name="ComorbiditiesTableLiver"/>
        <!--History of Anti-viral Therapy-->
        <xsl:call-template name="AntiViralTherapyTableLiver"/>
        <!--Social History-->
        <xsl:call-template name="PatientsSocialHistoriesLiver"/>
        <!--Family History-->
        <xsl:call-template name="PatientsFamilyMembersLiver"/>

        <!--Surgical History-->
        <!--<xsl:call-template name="LiverSurgerySurgicalHistory"/>-->

        <!--Sub-Header-->
        <xsl:call-template name="AssessmentECOGHeader"/>
        <!--Encounter-->
        <xsl:call-template name="VitalSignsLiver"/>
        <!--Assessment-->
        <xsl:call-template name="PerformanceLiver"/>
        
        <!--Sub-Header-->
        <xsl:call-template name="ImagingHeader"/>
        <!--Imaging-->
        <xsl:call-template name="ImagingLiver"/>
        <!--Biopsy Performed-->
        <xsl:call-template name="BiopsyPerformedLiver"/>


        <!--Sub-Header-->
        <xsl:call-template name="LabsHeader"/>
        <!--Labs-->
        <xsl:call-template name="LabsLiver"/>
        <!--Child-Pugh Score-->
        <xsl:call-template name="ChildPughScoreLiver"/>

        <!--Sub-Header-->
        <xsl:call-template name="InterventionalRadiologyHeader"/>
        <!--Interventional Radiology-->
        <xsl:call-template name="InterventionalRadLiver"/>

        <!--Sub-Header-->
        <xsl:call-template name="OperativeDetailsHeader"/>
        <!--Surgery Detail - Operative Detail-->
        <xsl:call-template name="OperativeDetailLiver"/>

        <!--Sub-Header-->
        <xsl:call-template name="PostOpCourseHeader"/>
        <!--Hospitalizations-->
        <xsl:call-template name="LiverSurgeryHospitalization"/>
        <!--Post Op Labs-->
        <xsl:call-template name="PostOpLabsLiver"/>
        <!--Post-Operative Complications-->
        <xsl:call-template name="PostOpCompLiver"/>

        <!--Sub-Header-->
        <xsl:call-template name="PathStagingHeader"/>
        <!--Pathology/Final Staging-->
        <xsl:call-template name="PathReportLiver"/>

        <!--Sub-Header-->
        <xsl:call-template name="PostOpTreatmentHeader"/>
        <!--Medical Therapies-->
        <xsl:call-template name="MedicalTherapiesLiver"/>
        <!--Radiation Therapies-->
        <xsl:call-template name="RadiationTherapiesLiver"/>
        <!--Sub-Header-->
        <xsl:call-template name="OutcomesHeader"/>
        <!--Last Contact Status-->
        <xsl:call-template name="LastContactStatusLiver"/>
        <!--Recurrence-->
        <xsl:call-template name="RecurrenceLiver"/>
        <!--Patient Death-->
        <xsl:call-template name="DeathDateLiver"/>





      


        <tr class="FormOuterTableRow">
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            <img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">1</span> of <span id="TotalPages">1</span>
          </td>
        </tr>
      </table>
    </div>





  </xsl:template>
</xsl:stylesheet>
