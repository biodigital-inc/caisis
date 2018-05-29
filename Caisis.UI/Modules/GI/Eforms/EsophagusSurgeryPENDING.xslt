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
<xsl:variable name="ReportTitle">Esophagus Surgery Eform</xsl:variable>

  <xsl:param name="TodaysDate"/>
  
  <!--McGillEformHeader template-->
  <xsl:template name="EformHeaderEsophagus">

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


  <xsl:template name="PMHHeader">
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


  <xsl:template name="PreOpStagingHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Pre-Op Staging</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>


  <xsl:template name="PreOpAssessmentHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Pre-Op Assessment</span>
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


  <xsl:template name="PostOperativeCourseHeader">
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


  <xsl:template name="PathologyFinalStagingHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Pathology/Final Staging</span>
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


  <!--DemographicsTableEsophagus parameters-->
  <xsl:param name="HasSSN"/>
  <xsl:param name="SSNIdentifier"/>

  <!--Demographics template-->
  <xsl:template name="DemographicsTableEsophagus">
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
              <strong>Race</strong>
            </td>
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>SS #</strong>
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
              <xsl:value-of select="$PtRace" disable-output-escaping="yes"/>&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" >
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
          </tr>

        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Matches Chief Complaint Data-->
  <xsl:template name="ChiefComplaintEsophagus">

    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="2">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Chief Complaint</span>
            </td>
          </tr>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncChiefComplaint', 'Encounters')">
            <td width="50%" align="left" valign="middle" class="FormInsideTableRegCell">
              <strong>Date:</strong>&#160;<xsl:value-of select="Encounters/EncDateText"/>&#160;
            </td>
            <td width="50%" align="left" valign="middle" class="FormInsideTableRegCell" >
              <strong>Attending:</strong>&#160;<xsl:value-of select="Encounters/EncPhysician"/>&#160;
            </td>
          </tr>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncChiefComplaint', 'Encounters')">
            <td colspan="2" width="100%" align="left" valign="top" style="padding: 5px;">
              <xsl:value-of select="Encounters/EncChiefComplaint"/>&#160;
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Matches Status Dates Data-->
  <xsl:template name="StatusDatesEsophagus">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="3">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Status Dates</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Status</strong>
            </td>
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Disease   </strong>
            </td>
          </tr>

          <xsl:for-each select="Status[@RecordId=21]">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="Status"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="StatusDateText"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="StatusDisease"/>&#160;
              </td>
            </tr>
          </xsl:for-each>
          <xsl:for-each select="Status[@RecordId=22]">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="Status"/>&#160;
              </td>
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

  <!--Template: Matches Additional Notes Data-->
  <xsl:template name="AdditionalNotesEsophagus">

    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" >
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Additional Notes</span>
            </td>
          </tr>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncNotes', 'Encounters')">
            <td width="100%" align="left" valign="top" style="padding: 5px;">
              <xsl:value-of select="Encounters/EncNotes"/>&#160;
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>


  <!--Template: Matches Personal History of Cancer Data-->
  <xsl:template name="PersonalHistoryOfCancerEsophagus">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

          <xsl:for-each select="AbsentEvents[@RecordId=20]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td >
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Personal history of cancer: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:if test="((AbsentEvents[@RecordId=20]/AbsentDateText  = '') and (AbsentEvents[@RecordId=20]/TableName  = '') and (AbsentEvents[@RecordId=20]/FieldName = '') and (AbsentEvents[@RecordId=20]/FieldValue   = '') and (AbsentEvents[@RecordId=20]/AbsentReason = '') )">
            <tr class="EFormTableRow" style="background-color:#dddddd;">
              <td width="100%" align="left" valign="top" colspan="3">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">Personal history of cancer</span>
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Cancer</strong>
              </td>
              <td width="75%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Notes</strong>
              </td>
            </tr>
            <xsl:for-each select="Comorbidities[@RecordId&gt;=81 and @RecordId&lt;=100]">
              <xsl:choose>
                <xsl:when test="(Comorbidity != '') or (ComorbNotes != '') ">

                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Comorbidities',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="Comorbidity"/>&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="ComorbNotes"/>&#160;
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
            </tr>

          </xsl:if>

        </table>
      </td>
    </tr>

  </xsl:template>


  <!--Template: Comorbidities: Matches Comorbidities-->
  <xsl:template name="ComorbiditiesEsophagus">
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
                      Comorbidities: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:if test="((AbsentEvents[@RecordId=1]/AbsentDateText  = '') and (AbsentEvents[@RecordId=1]/TableName  = '') and (AbsentEvents[@RecordId=1]/FieldName = '') and (AbsentEvents[@RecordId=1]/FieldValue   = '') and (AbsentEvents[@RecordId=1]/AbsentReason = '') )">



            <tr class="EFormTableRow" style="background-color:#dddddd;">
              <td colspan="4">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">Comorbidities</span>
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Date</strong>
              </td>
              <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Comorbidity</strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>System</strong>
              </td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Notes</strong>
              </td>
            </tr>
            <xsl:for-each select="Comorbidities[@RecordId&gt;=1 and @RecordId&lt;=80]">
              <xsl:choose>
                <xsl:when test="((ComorbDateText != '') or (Comorbidity != '') or (ComorbSystem != '') or (ComorbNotes != ''))">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Comorbidities',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="ComorbDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="Comorbidity"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="ComorbSystem"  />&#160;
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
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                &#160;
              </td>
            </tr>
          </xsl:if>

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
        <xsl:call-template name="EformHeaderEsophagus"/>
        
        <!--Sub-Header-->
        <xsl:call-template name="HPIHeader"/>
        <!--Demographics-->
        <xsl:call-template name="DemographicsTableEsophagus"/>
        <!--Chief Complaint-->
        <xsl:call-template name="ChiefComplaintEsophagus"/>
        <!--Status Dates-->
        <xsl:call-template name="StatusDatesEsophagus"/>
        <!--Additional Notes-->
        <xsl:call-template name="AdditionalNotesEsophagus"/>


        <!--Sub-Header-->
        <xsl:call-template name="PMHHeader"/>
        <!--Personal History of cancer -->
        <xsl:call-template name="PersonalHistoryOfCancerEsophagus"/>
        <!--Comorbidities -->
        <xsl:call-template name="ComorbiditiesEsophagus"/>
        <!--Sub-Header-->
        <xsl:call-template name="PreOpStagingHeader"/>

        <!--Sub-Header-->
        <xsl:call-template name="PreOpAssessmentHeader"/>

        <!--Sub-Header-->
        <xsl:call-template name="OperativeDetailsHeader"/>

        <!--Sub-Header-->
        <xsl:call-template name="PostOperativeCourseHeader"/>

        <!--Sub-Header-->
        <xsl:call-template name="PathologyFinalStagingHeader"/>

        <!--Sub-Header-->
        <xsl:call-template name="PostOpTreatmentHeader"/>

        <!--Sub-Header-->
        <xsl:call-template name="OutcomesHeader"/>



        <tr class="FormOuterTableRow">
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            <img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">1</span> of <span id="TotalPages">1</span>
          </td>
        </tr>
      </table>
    </div>





  </xsl:template>
</xsl:stylesheet>
