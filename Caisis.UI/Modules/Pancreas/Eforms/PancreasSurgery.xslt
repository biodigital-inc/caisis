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
<xsl:variable name="ReportTitle">Pancreas Surgery Eform</xsl:variable>

  <xsl:param name="TodaysDate"/>
  
  <!--McGillEformHeader template-->
  <xsl:template name="EformHeaderPancreas">

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

  <xsl:template name="SocialHxHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Social History</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="FamilyHxHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Family History (recorded in chart)</span>
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
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Clinical Staging</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="TreatmentPlanHeader">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#3d556d;">
            <td align="center" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText" style="font-size: 12pt; color: white;">Treatment Plan</span>
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
  <xsl:template name="DemographicsTablePancreas">
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
  <xsl:template name="ChiefComplaintPancreas">

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
  <xsl:template name="StatusDatesPancreas">
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
  <xsl:template name="AdditionalNotesPancreas">

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

  <!--Template: Comorbidities: Matches Comorbidities-->
  <xsl:template name="ComorbiditiesTablePancreas">
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
              <td colspan="3">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">Comorbidities</span>
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Date</strong>
              </td>
              <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Comorbidity</strong>
              </td>
              <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Notes</strong>
              </td>
            </tr>
            <xsl:for-each select="Comorbidities">
              <xsl:choose>
                <xsl:when test="((ComorbDateText != '') or (Comorbidity != '') or (ComorbNotes != ''))">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Comorbidities',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="ComorbDateText"  />&#160;
                    </td>
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

  <!--Template: Matches Surgical History Data-->
  <xsl:template name="PancreasSurgerySurgicalHistory">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

          <xsl:for-each select="AbsentEvents[@RecordId=2]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td >
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Surgical History: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:if test="((AbsentEvents[@RecordId=2]/AbsentDateText  = '') and (AbsentEvents[@RecordId=2]/TableName  = '') and (AbsentEvents[@RecordId=2]/FieldName = '') and (AbsentEvents[@RecordId=2]/FieldValue   = '') and (AbsentEvents[@RecordId=2]/AbsentReason = '') )">
            <tr class="EFormTableRow" style="background-color:#dddddd;">
              <td width="100%" align="left" valign="top" colspan="3">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">Surgical History</span>
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Date</strong>
              </td>
              <td width="40%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Procedure Type</strong>
              </td>
              <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Notes</strong>
              </td>
            </tr>
            <xsl:for-each select="Procedures[@RecordId&gt;=1 and @RecordId&lt;=10]">
              <xsl:choose>
                <xsl:when test="(ProcDateText != '') or (ProcName != '') or (ProcNotes != '')">

                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="ProcDateText"/>&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="ProcName"/>&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="ProcNotes"/>&#160;
                    </td>
                  </tr>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','')">
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

  <!--PatientsSocialHistoriesPancreas parameters-->
  <!--<xsl:param name="PatientsSocialHistoriesRows2"/>-->
  <xsl:param name="PatientsSocialHistoriesRows3"/>

  <!--Social History Table-->
  <xsl:template name="PatientsSocialHistoriesPancreas">
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
                  <strong>Other Tobacco Usage</strong>
                </td>
                <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>&#160;</strong>
                </td>
                <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
                  <strong>&#160;</strong>
                </td>
              </tr>

              <xsl:for-each select="SocialHistories[@RecordId=1]">
                <xsl:choose>
                  <xsl:when test="((SocHxNotes != '') or (SocHxOther != ''))">
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">
                        <xsl:value-of select="SocHxOther"  />&#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                        &#160;
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                        &#160;
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td colspan="3" align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
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

              <xsl:for-each select="SocialHistories[@RecordId=1]">
                <xsl:choose>
                  <xsl:when test="((SocHxNotes != '') or (SocHxOther != ''))">
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td colspan="3" align="left" valign="middle" class="FormInsideTableRegCell">
                        <strong>&#160;&#160;Notes:&#160;&#160;</strong><xsl:value-of select="SocHxNotes"  />&#160;
                      </td>
                    </tr>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                      <td colspan="3" align="left" valign="middle" class="FormInsideTableRegCell">
                        <strong>&#160;&#160;Notes:&#160;&#160;</strong>&#160;</td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>

            </xsl:if>

            <xsl:if test="($HasSocialHistory = 'Yes')" >

              <!--SocialHistories from the Database (Database currently only supports one SocialHistories)-->
              <xsl:value-of select="$PatientsSocialHistoriesRows3" disable-output-escaping="yes"/>

            </xsl:if>

          </xsl:if>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Family History Table-->
  <xsl:template name="PatientsFamilyMembersPancreas">
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

  <!--CT/MRI Table-->
  <xsl:template name="CtMriPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="CtMriPancreas_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Cross-Sectional Imaging</span>
            </td>
          </tr>

        
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Study Performed</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Results</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <xsl:for-each select="Diagnostics[@RecordId=20]">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})" >
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >
                <xsl:value-of select="DxDateText"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="DxType"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="DxResult"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="DxNotes"  />&#160;
              </td>
            </tr>
          </xsl:for-each>

          <xsl:for-each select="Diagnostics[@RecordId=20]/DxImageFindings[@RecordId=1]">
            <xsl:choose>
              <xsl:when test=" (ImgFindStatus != '') ">
            <tr class="EFormTableRow" >
              <td class="FormInsideTableRegCell" rowspan="3">&#160;</td>
              <td align="left" valign="middle" colspan="3" style="background-color:#dddddd;">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">
                  <xsl:value-of select="ImgFindStatus"  />
                </span>
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Site</strong>
              </td>
              <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Result</strong>
              </td>
              <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Notes</strong>
              </td>
            </tr>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})" >
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="ImgFindSite" />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="ImgFindResult"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="ImgFindNotes"  />&#160;
              </td>
            </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Study Performed</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Results</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <xsl:for-each select="Diagnostics[@RecordId=21]">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})" >
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >
                <xsl:value-of select="DxDateText"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="DxType"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="DxResult"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >
                <xsl:value-of select="DxNotes"  />&#160;
              </td>
            </tr>
          </xsl:for-each>

          <xsl:for-each select="Diagnostics[@RecordId=21]/DxImageFindings[@RecordId=1]">
            <xsl:choose>
              <xsl:when test=" (ImgFindStatus != '') ">
                <tr class="EFormTableRow" >
                  <td class="FormInsideTableRegCell" rowspan="3">&#160;</td>
                  <td align="left" valign="middle" colspan="3" style="background-color:#dddddd;">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      <xsl:value-of select="ImgFindStatus"  />
                    </span>
                  </td>
                </tr>
                <tr class="EFormTableRow">                  
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                    <strong>Site</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Result</strong>
                  </td>
                  <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Notes</strong>
                  </td>
                </tr>
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})" >
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ImgFindSite" />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ImgFindResult"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ImgFindNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

        </table>
      </td>
    </tr>
  </xsl:template>

  <!--AdditionalStudiesPancreas Table-->
  <xsl:template name="AdditionalStudiesPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="AdditionalStudiesPancreas_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Additional Studies</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Study</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Results</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <xsl:for-each select="Diagnostics[@RecordId&gt;=1 and @RecordId&lt;=15]">
              <xsl:choose>
                <xsl:when test="(DxDateText != '') or (DxType != '') or (DxResult != '') or (DxNotes != '') ">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})" >
                    <td align="center" valign="middle" class="FormInsideTableLeftCell" >
                      <xsl:value-of select="DxDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="DxType"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="DxResult"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="DxNotes"  />&#160;
                    </td>
                  </tr>
                </xsl:when>
              </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>

          </tr>
        </table>

      </td>
    </tr>
  </xsl:template>

  <!--Clnical Staging Table-->
  <xsl:template name="ClinicalStagingPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="ClinicalStaging_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">TNM Staging</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date of Diagnosis</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Primary Tumor (T)</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Regional Lymph Nodes (N) </strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Distant Metastasis (M)</strong>
            </td>
            <!--<td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Disease</strong>
            </td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Staging System</strong>
            </td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Data Quality</strong>
            </td>-->
          </tr>

          <xsl:for-each select="ClinicalStages[@RecordId=1]">

                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('ClinicalStages',{./@RecordId})" >
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" >
                    <xsl:value-of select="ClinStageDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ClinStageT"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ClinStageN"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ClinStageM"  />&#160;
                  </td>
                  <!--<td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ClinStageDisease"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ClinStageSystem"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ClinStageQuality"  />&#160;
                  </td>-->
                </tr>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('ClinicalStages',{./@RecordId})" >
              <td colspan="4" align="center" valign="middle" class="FormInsideTableLeftCell" >
                Notes: <xsl:value-of select="ClinStageNotes"  />&#160;
              </td>

            </tr>

          </xsl:for-each>
        </table>

      </td>
    </tr>
  </xsl:template>

  <!-- Vital Signs : Match=Encounters-->
  <xsl:template name="VitalSignsPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="VitalSignsPancreas_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Pre-Op Vital Signs</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Height (cm)</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Weight (kg)</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>BSA</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>BMI</strong>
            </td>
          </tr>
          <xsl:for-each select="Encounters">
            <xsl:choose>
              <xsl:when test="((EncHeight != '') or (EncWeight != '') or (EncBSA != '') or (EncBMI != ''))">
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncHeight', 'Encounters')">
                    <xsl:value-of select="EncHeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncWeight', 'Encounters')">
                    <xsl:value-of select="EncWeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncBSA', 'Encounters')">
                    <xsl:value-of select="EncBSA"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncBMI', 'Encounters')">
                    <xsl:value-of select="EncBMI"  />&#160;
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncHeight', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncWeight', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBSA', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBMI', 'Encounters')">&#160;</td>

                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Pre-Op Performance : Match=Encounters-->
  <xsl:template match="Encounters" name="PerformancePancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PerformancePancreas_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="8">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Pre-Op Performance</span>
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

  <!--Template: Lab Tests Values Matches LabTests-->
  <xsl:template name="LabsPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="LabsPancreas_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="5">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Pre-Op Labs (Within 30 days prior to Surgery)</span>
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
              <strong>Quality</strong>
            </td>
          </tr>
          <!--<xsl:value-of select="$LabTestRows" disable-output-escaping="yes"/>-->
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
                    <xsl:value-of select="LabUnits"  />&#160;
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
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--TreatmentPlanPancreas-->
  <xsl:template name="TreatmentPlanPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="TreatmentPlanPancreas_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td colspan="2">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Treatment Plan</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="50%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Diagnosis / Problem List</strong>
            </td>
            <td width="50%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Plan and Referrals</strong>
            </td>
          </tr>
          <xsl:for-each select="PatientProblems">
            <xsl:choose>
              <xsl:when test="(ProblemName != '')">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProblemName"  />
                  </td>
                  <td align="left" valign="middle" class="FormInsideTableRegCell">
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
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>

        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Medical Therapy Table-->
  <xsl:template name="MedicalTherapiesPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="MedicalTherapy_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Pre-Op Medical Therapies</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="22%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Agent</strong>
            </td>
            <td width="21%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Type</strong>
            </td>
            <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Dose</strong>
            </td>
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Institution</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>
          
          <!--Medical Therapies from the Database--><!--
          <xsl:value-of select="$MedicalTherapyRows" disable-output-escaping="yes"/>-->
          
          <xsl:for-each select="MedicalTherapy[@RecordId&gt;=1 and @RecordId&lt;=10]">
            <xsl:choose>
              <xsl:when test="((MedTxDateText != '') or (MedTxType != '') or (MedTxAgent != '') or (MedTxDose != '') or (MedTxInstitution != '') or (MedTxNotes != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="MedTxDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxAgent"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxType"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="MedTxDose" />&#160;<xsl:value-of select="MedTxUnits"  />
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxInstitution"  />&#160;
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
  <xsl:template name="RadiationTherapiesPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="RadiationTherapy_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Pre-Op Radiation Therapies</span>
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
          
          <!--Radiation Therapies from the Database--><!--
          <xsl:value-of select="$RadiationTherapyRows" disable-output-escaping="yes"/>-->
          
          <xsl:for-each select="RadiationTherapy[@RecordId&gt;=1 and @RecordId&lt;=10]">
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

  <!--Template: Matches Pre-op Restaging Data-->
  <xsl:template name="PreOpRestagingPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Restaging</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Status</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Disease</strong>
            </td>
            <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <xsl:for-each select="Status[@RecordId&gt;=1 and @RecordId&lt;=10]">
            <xsl:choose>
              <xsl:when test="((Status != '') or (StatusDateText != '') or (StatusDisease != '') or (StatusNotes != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="StatusDateText"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="Status"/>&#160;
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
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status',1)">
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
          
        </table>
      </td>
    </tr>

  </xsl:template>

  <!--Operative Detail Table-->
  <xsl:template name="OperativeDetailPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="OperativeDetailPancreas_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Surgery Detail - Operative Detail</span>
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
              <strong>Operating Time(min) </strong>
            </td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Est Blood Loss(cc)</strong>
            </td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong> RBC Transfused(units) </strong>
            </td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Crystalloid</strong>
            </td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Colloid</strong>
            </td>
          </tr>


          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('OperatingRoomDetails',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="OpDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpCaseSurgeon"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpDuration"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpEstBloodLoss"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpRBC_Transfused"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpCrystalloid"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpColloid"  />&#160;
                  </td>
                </tr>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Primary Procedure Table-->
  <xsl:template name="PrimaryProcedurePancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PrimaryProcedurePancreas_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Surgery Detail - Primary Procedure</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Type</strong>
            </td>
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Feeding Tube</strong>
            </td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Technique</strong>
            </td>
            <td colspan="4" width="56%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <xsl:variable name="FeedingTubeValue" select="OperatingRoomDetails[@RecordId=11]/OpNotes" />
          
          
          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=11]">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableLeftCell">
                <xsl:value-of select="ProcName"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select='substring(translate($FeedingTubeValue, "||", ""),14)'/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcApproach"  />&#160;
              </td>
              <td colspan="4" align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcNotes"  />&#160;
              </td>
            </tr>
          </xsl:for-each>

          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=11]/PancreasProc">
            <xsl:choose>
              <xsl:when test=" (ProcStent != '') or (ProcMarginFrozen  != '') or (ProcReconstruction  != '') or (ProcPancreas  != '') or (ProcDrains  != '') or (ProcBiliaryBypass  != '') or (ProcBiliaryBypassOrigin  != '') or (ProcGastricBypass  != '') or (ProcPlexusBlock  != '') or (ProcSkinClosure  != '') or (ProcPancreaticAnastamosis != '') or (ProcPancreaticAnastamosis != '') or (ProcAddOrgansResected != '')">
            <tr class="EFormTableRow" style="background-color:#dddddd;">
              <td align="left" valign="middle" colspan="7">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <span class="blackBoldText">Surgery Detail - Primary Procedure Details</span>
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Pancreatic Stent</strong>
              </td>
              <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Margin Frozen Result</strong>
              </td>
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Reconstruction </strong>
              </td>
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Pancreas</strong>
              </td>
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Pancreatic Duct Size (mm)</strong>
              </td>
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Biliary Bypass</strong>
              </td>
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Biliary Bypass Origin </strong>
              </td>
            </tr>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','11')">
              <td align="center" valign="middle" class="FormInsideTableLeftCell">
                <xsl:value-of select="ProcStent"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcMarginFrozen"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcReconstruction"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcPancreas"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcPancreaticDuctSize"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcBiliaryBypass"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcBiliaryBypassOrigin"  />&#160;
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Gastric Bypass</strong>
              </td>
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Plexus Block</strong>
              </td>
              <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Drains </strong>
              </td>
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Skin Closure</strong>
              </td>
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Pancreatic Anastamosis</strong>
              </td>
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Additional Organs Resected</strong>
              </td>
              <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong></strong>
              </td>
            </tr>
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','11')">
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcGastricBypass"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcPlexusBlock"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcDrains"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcSkinClosure"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcPancreaticAnast"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcAddOrgansResected"  />&#160;
              </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  &#160;
                </td>           
              </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <tr class="EFormTableRow" style="background-color:#dddddd;" >
            <td colspan="7" >
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">
                Surgery Detail - Supplementary Procedures
              </span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td colspan="3" width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Type</strong>
            </td>
            <td colspan="4" width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>
          
          
          <xsl:for-each select="AbsentEvents[@RecordId=3]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow"  >
                  <td colspan="7" >
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Splenectomy: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=12]">
            <xsl:choose>
              <xsl:when test="(ProcName  != '') or (ProcNotes  != '') ">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                  <td colspan="3" align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProcName"  />&#160;
                  </td>
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          
          
          <xsl:for-each select="AbsentEvents[@RecordId=4]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow"  >
                  <td colspan="7" >
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      PV resection: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=13]">
            <xsl:choose>
              <xsl:when test="(ProcName  != '') or (ProcNotes  != '') ">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                  <td colspan="3" align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProcName"  />&#160;
                  </td>
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>


          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId&gt;=16 and @RecordId&lt;=19]">
            <xsl:choose>
              <xsl:when test="(ProcName  != '') or (ProcNotes  != '') ">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                  <td colspan="3" align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProcName"  />&#160;
                  </td>
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','')">
            <td colspan="3" align="center" valign="middle" class="FormInsideTableLeftCell">
              &#160;
            </td>
            <td colspan="4" align="center" valign="middle" class="FormInsideTableRegCell">
              &#160;
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Matches Surgery Finding Data-->
  <xsl:template name="SurgeryFindingPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="3">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Surgery Findings</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Metastasis</strong>
            </td>
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Site</strong>
            </td>
          </tr>

          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=11]/ProcedureFinding">
            <xsl:choose>
              <xsl:when test="((ProcFinding != '') or (ProcFindSite != '') or (ProcFindStatus != '') )">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('ProcedureFinding',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcFindStatus"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcFindSite"/>&#160;
                  </td>

                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('ProcedureFinding','')">
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

  <!--Template: Matches Anesthesia Data-->
  <xsl:template name="PancreasSurgeryAnesthesia">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="3">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Anesthesia</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>ASA Score</strong>
            </td>
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Anesthesia Type</strong>
            </td>
          </tr>

          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('OperatingRoomDetails',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpASA"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpAnesthesiaType"/>&#160;
                  </td>

                </tr>
          </xsl:for-each>

        </table>
      </td>
    </tr>

  </xsl:template>

  <!--Template: Intra-Operative Complications-->
  <xsl:template name="IntraOpCompPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

          <xsl:for-each select="AbsentEvents[@RecordId=5]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td >
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Intra-Operative Complications: <xsl:value-of select="AbsentReason"  /> as of <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow" style="background-color:#dddddd;">
                  <td colspan="3">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">Intra-Operative Complications</span>
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
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>

          <xsl:for-each select="Toxicities[@RecordId&gt;=1 and @RecordId&lt;=5]">
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

  <!--Additional Surgeries Table-->
  <xsl:template name="AdditionalSurgeriesPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="AdditionalSurgeriesPancreas_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="10">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Additional Surgeries</span>
            </td>
          </tr>
          
          


          <xsl:for-each select="OperatingRoomDetails[@RecordId=2]">
            <xsl:choose>
              <xsl:when test="(OpDateText  != '') or (OpCaseSurgeon  != '')  or (OpDuration  != '') or (OpEstBloodLoss  != '') or (OpRBC_Transfused  != '') or (OpCrystalloid  != '') or (Colloid  != '')">
                <tr class="EFormTableRow" >
                  <td align="left" valign="middle" colspan="10">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">Operative Detail</span>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                    <strong>Date of Operation</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Surgeon</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op Duration (min) </strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op In Time</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op Out Time</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Urine Output</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Est Blood Loss(cc)</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong> RBC Transfused(units) </strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Crystalloid</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Colloid</strong>
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
                    <xsl:value-of select="OpDuration"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpInTime"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpOutTime"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpUrineOutput"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpEstBloodLoss"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpRBC_Transfused"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpCrystalloid"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpColloid"  />&#160;
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Type</strong>
                  </td>
                  <td colspan="6" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Notes</strong>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          
          <xsl:for-each select="OperatingRoomDetails/Procedures[@RecordId&gt;=40 and @RecordId&lt;=44]">
            <xsl:choose>
              <xsl:when test="(ProcName  != '') or (ProcNotes  != '') ">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProcName"  />&#160;
                  </td>
                  <td colspan="6" align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          
          
          <xsl:for-each select="OperatingRoomDetails[@RecordId=3]">
            <xsl:choose>
              <xsl:when test="(OpDateText  != '') or (OpCaseSurgeon  != '')  or (OpDuration  != '') or (OpEstBloodLoss  != '') or (OpRBC_Transfused  != '') or (OpCrystalloid  != '') or (Colloid  != '')">
                <tr class="EFormTableRow" >
                  <td align="left" valign="middle" colspan="10">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">Operative Detail</span>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                    <strong>Date of Operation</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Surgeon</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op Duration (min) </strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op In Time</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op Out Time</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Urine Output</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Est Blood Loss(cc)</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong> RBC Transfused(units) </strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Crystalloid</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Colloid</strong>
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
                    <xsl:value-of select="OpDuration"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpInTime"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpOutTime"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpUrineOutput"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpEstBloodLoss"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpRBC_Transfused"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpCrystalloid"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpColloid"  />&#160;
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Type</strong>
                  </td>
                  <td colspan="6" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Notes</strong>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:for-each select="OperatingRoomDetails/Procedures[@RecordId&gt;=45 and @RecordId&lt;=49]">
            <xsl:choose>
              <xsl:when test="(ProcName  != '') or (ProcNotes  != '') ">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProcName"  />&#160;
                  </td>
                  <td colspan="6" align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:for-each select="OperatingRoomDetails[@RecordId=4]">
            <xsl:choose>
              <xsl:when test="(OpDateText  != '') or (OpCaseSurgeon  != '')  or (OpDuration  != '') or (OpEstBloodLoss  != '') or (OpRBC_Transfused  != '') or (OpCrystalloid  != '') or (Colloid  != '')">
                <tr class="EFormTableRow" >
                  <td align="left" valign="middle" colspan="10">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">Operative Detail</span>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                    <strong>Date of Operation</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Surgeon</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op Duration (min) </strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op In Time</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op Out Time</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Urine Output</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Est Blood Loss(cc)</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong> RBC Transfused(units) </strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Crystalloid</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Colloid</strong>
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
                    <xsl:value-of select="OpDuration"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpInTime"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpOutTime"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpUrineOutput"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpEstBloodLoss"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpRBC_Transfused"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpCrystalloid"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpColloid"  />&#160;
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Type</strong>
                  </td>
                  <td colspan="6" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Notes</strong>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:for-each select="OperatingRoomDetails/Procedures[@RecordId&gt;=50 and @RecordId&lt;=54]">
            <xsl:choose>
              <xsl:when test="(ProcName  != '') or (ProcNotes  != '') ">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProcName"  />&#160;
                  </td>
                  <td colspan="6" align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>


          <xsl:for-each select="OperatingRoomDetails[@RecordId=5]">
            <xsl:choose>
              <xsl:when test="(OpDateText  != '') or (OpCaseSurgeon  != '')  or (OpDuration  != '') or (OpEstBloodLoss  != '') or (OpRBC_Transfused  != '') or (OpCrystalloid  != '') or (Colloid  != '')">
                <tr class="EFormTableRow" >
                  <td align="left" valign="middle" colspan="10">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">Operative Detail</span>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                    <strong>Date of Operation</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Surgeon</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op Duration (min) </strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op In Time</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Op Out Time</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Urine Output</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Est Blood Loss(cc)</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong> RBC Transfused(units) </strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Crystalloid</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Colloid</strong>
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
                    <xsl:value-of select="OpDuration"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpInTime"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpOutTime"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpUrineOutput"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpEstBloodLoss"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpRBC_Transfused"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpCrystalloid"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="OpColloid"  />&#160;
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Type</strong>
                  </td>
                  <td colspan="6" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Notes</strong>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <xsl:for-each select="OperatingRoomDetails/Procedures[@RecordId&gt;=55 and @RecordId&lt;=59]">
            <xsl:choose>
              <xsl:when test="(ProcName  != '') or (ProcNotes  != '') ">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                  <td colspan="4" align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProcName"  />&#160;
                  </td>
                  <td colspan="6" align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>

          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','')">
            <td colspan="10" align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Matches Hospitalizations Data-->
  <xsl:template name="PancreasSurgeryHospitalization">
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
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Discharge Date</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Hospital</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Total ICU Stay (days)</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Post-op RBC Transfused (units)</strong>
            </td>
            <td width="50%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <!--<xsl:for-each select="Hospitalizations[@RecordId=1]">-->
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Hospitalizations','1')">
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="Hospitalizations[@RecordId=1]/HospDischargeDateText"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="Hospitalizations[@RecordId=1]/HospInstitution"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="Hospitalizations[@RecordId=1]/HospICUStay"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="OperatingRoomDetails[@RecordId=11]/OpRBC_PostOp"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="Hospitalizations[@RecordId=1]/HospNotes"/>&#160;
              </td>
            </tr>
          <!--</xsl:for-each>-->


        </table>
      </td>
    </tr>

  </xsl:template>

  <!--Template: Post-Op Complications-->
  <xsl:template name="PostOpCompPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

          <xsl:for-each select="AbsentEvents[@RecordId=6]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td colspan="4">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Post-Op Complications: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow" style="background-color:#dddddd;">
                  <td colspan="4">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">Post-Op Complications</span>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                    <strong>Date</strong>
                  </td>
                  <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Complication</strong>
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Morbidity Grade</strong>
                  </td>
                  <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Notes</strong>
                  </td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>

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
                    <xsl:value-of select="ToxGrade"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ToxNotes"  />&#160;
                  </td>
                </tr>

              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Toxicities','')">
            <td colspan="4" align="center" valign="middle" class="FormInsideTableLeftCell">
              &#160;
            </td>
          </tr>




        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Matches Pathology Report Data-->
  <xsl:template name="PathReportPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Pathology Report</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Path Report Date</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Path #</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Pathologist</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Primary Histology</strong>
            </td>
          </tr>

          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=11]/Pathology[@RecordId=11]">
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology',{./@RecordId})">
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              <xsl:value-of select="PathDateText"/>&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              <xsl:value-of select="PathNum"/>&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              <xsl:value-of select="Pathologist"/>&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              <xsl:value-of select="PathHistology"/>&#160;
            </td>
          </tr>
          </xsl:for-each>


        </table>
      </td>
    </tr>

  </xsl:template>

  <!--Template: Matches Pancreas Pathology Data-->
  <xsl:template name="PancreasPathPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
         

          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=11]/Pathology[@RecordId=11]/PancreasPath[@RecordId=1]">
            <!--<xsl:choose>
              <xsl:when test=" (PathPerineuralInv != '') or (PathVascularInv != '') or (PathPancreaticMargin != '') or (PathPosteriorMargin != '') or (PathAnteriorPeritonealInv != '') or (PathBileDuctMargin != '') or (PathDuodenalMargin != '') or (PathGastricMargin != '') or (PathPancreatitis != '') or (PathFibrosis != '') or (PathPanIn != '') or (PathIPMN != '') or (PathOtherOrganInv != '') or (PathLymphaticInv != '') ">-->
                <tr class="EFormTableRow" style="background-color:#dddddd;">
                  <td width="100%" align="left" valign="top" colspan="5">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">Pancreas Pathology</span>
                  </td>
                </tr>
                <tr class="EFormTableRow">
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Perineural Inv</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Vascular Inv</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Pancreatic Margin </strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Posterior Margin</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Anterior Peritoneal Surface</strong>
              </td>
            </tr>           
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PancreasPath',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathPerineuralInv"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathVascularInv"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathPancreaticMargin"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathPosteriorMargin"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathAnteriorPeritonealInv"/>&#160;
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Bile Duct Margin</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Duodenal Margin</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Gastric Margin</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Pancreatitis</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Fibrosis</strong>
              </td>
            </tr>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PancreasPath',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathBileDuctMargin"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathDuodenalMargin"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathGastricMargin"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathPancreatitis"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathFibrosis"/>&#160;
              </td>
            </tr>
            <tr class="EFormTableRow">
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>PanIN</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                <strong>Extra Parenchymal Invasion</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>IPMN</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Other Organ Invasion</strong>
              </td>
              <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Lymphatic Invasion</strong>
              </td>
            </tr>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PancreasPath',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathPanIn"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathExtraParenchymalInv"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathIPMN"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathOtherOrganInv"/>&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathLymphaticInv"/>&#160;
              </td>
            </tr>
              <!--</xsl:when>
            </xsl:choose>-->
          </xsl:for-each>
          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=11]/Pathology[@RecordId=11]">
            <!--<xsl:choose>
              <xsl:when test=" (PathPerineuralInv != '') or (PathVascularInv != '') or (PathPancreaticMargin != '') or (PathPosteriorMargin != '') or (PathAnteriorPeritonealInv != '') or (PathBileDuctMargin != '') or (PathDuodenalMargin != '') or (PathGastricMargin != '') or (PathPancreatitis != '') or (PathFibrosis != '') or (PathPanIn != '') or (PathIPMN != '') or (PathOtherOrganInv != '') or (PathLymphaticInv != '') ">-->
            <tr class="EFormTableRow">
              <td colspan="5" width="100%" align="center" valign="middle" class="FormInsideTableTopCell">
                <strong>Notes</strong>
              </td>

            </tr>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology',{./@RecordId})">
              <td colspan="5" align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathNotes"/>&#160;
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </td>
    </tr>

  </xsl:template>

  <!--Template: Matches Pathology Findings Data-->
  <xsl:template name="PathFindingsPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="3">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Pathology Findings</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Location</strong>
            </td>
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Width (cm)</strong>
            </td>
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Grade</strong>
            </td>

          </tr>

          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=11]/Pathology[@RecordId=11]/PathologyFinding">
            <xsl:choose>
              <xsl:when test=" (PathFindSite  != '') or (PathFindWidth  != '') or (PathFindGrade != '') ">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PathologyFinding',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathFindSite"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathFindWidth"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathFindGrade "/>&#160;
                  </td>

                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PathologyFinding','')">
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>

        </table>
      </td>
    </tr>

  </xsl:template>

  <!--Template: Matches Pathology Node Findings Data-->
  <xsl:template name="PathNodeFindingsPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="5">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Pathology Node Findings</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Site</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Max Dim (cm)</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong># Positive Nodes</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Total # Nodes</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Histology </strong>
            </td>         
          </tr>

          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=11]/Pathology[@RecordId=11]/NodePathFinding">
            <xsl:choose>
              <xsl:when test=" (PathFindSite  != '') or (PathFindMaxDim  != '') or (PathFindPosNodes != '')  or (PathFindNumNodes != '')  or (PathFindHistology != '') ">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('NodePathFinding',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathFindSite"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathFindMaxDim"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathFindPosNodes"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathFindNumNodes"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathFindHistology"/>&#160;
                  </td>

                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('NodePathFinding','')">
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

  <!--Template: Matches Pathology Node Findings Data-->
  <xsl:template name="PathologicStagingPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Pathologic Staging (UICC_02, Pancreas)</span>
            </td>
          </tr>
          <tr class="EFormTableRow">

            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Primary Tumor (T)</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Regional Lymph Nodes (N)</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Distant Metastasis (M)</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Residual Tumor (R)</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <xsl:for-each select="OperatingRoomDetails[@RecordId=11]/Procedures[@RecordId=11]/Pathology[@RecordId=11]/PathologyStageGrade">
            <xsl:choose>
              <xsl:when test=" (PathStageT  != '') or (PathStageN  != '') or (PathStageM != '')  or (PathStageR != '')  or (PathNotes != '') ">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PathologyStageGrade',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathStageT"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathStageN"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathStageM"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathStageR"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathNotes"/>&#160;
                  </td>

                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PathologyStageGrade','')">
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

  <!--Template: Adjuvant Therapies -->
  <xsl:template name="AdjuvantTherapiesPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="MedicalTherapy_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <xsl:for-each select="AbsentEvents[@RecordId=7]">
            <xsl:choose>
              <xsl:when test="((AbsentDateText  != '') or (TableName  != '') or (FieldName  != '') or (FieldValue   != '') or (AbsentReason != '') )">
                <tr class="EFormTableRow" style="background-color:#dddddd;" >
                  <td colspan="6">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">
                      Adjuvant Therapies: <xsl:value-of select="AbsentReason"  /> as of  <xsl:value-of select="AbsentDateText"  />
                    </span>
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow" style="background-color:#dddddd;">
                  <td colspan="6">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">Adjuvant Therapies</span>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td width="16%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                    <strong>Date</strong>
                  </td>
                  <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Agent</strong>
                  </td>
                  <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Type</strong>
                  </td>
                  <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Dose</strong>
                  </td>
                  <td width="16%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Institution</strong>
                  </td>
                  <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Notes</strong>
                  </td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
          
          <!--Medical Therapies from the Database-->
          <!--
          <xsl:value-of select="$MedicalTherapyRows" disable-output-escaping="yes"/>-->

          <xsl:for-each select="MedicalTherapy[@RecordId&gt;=11 and @RecordId&lt;=20]">
            <xsl:choose>
              <xsl:when test="((MedTxDateText != '') or (MedTxType != '') or (MedTxAgent != '') or (MedTxDose != '') or (MedTxInstitution != '') or (MedTxNotes != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="MedTxDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxAgent"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxType"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="MedTxDose" />&#160;<xsl:value-of select="MedTxUnits"  />
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxInstitution"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedTxNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy','')">
            <td colspan="6" align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
          </tr>
          
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Post op Radiation Therapy Table-->
  <xsl:template name="PostOpRadiationTxPancreas">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PostOpRadiationTxPancreas_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td align="left" valign="middle" colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Post-Op Radiation Therapies</span>
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
          <!--
          <xsl:value-of select="$RadiationTherapyRows" disable-output-escaping="yes"/>-->

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
  <xsl:template name="LastContactStatusPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Last Contact Status</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Status</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Disease</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Status Based On</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Ongoining Treatment</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <xsl:variable name="StatusBasedOn_11" select="NoTable/LastContact_StatusBasedOn_11"></xsl:variable>
          <xsl:variable name="StatusBasedOn_12" select="NoTable/LastContact_StatusBasedOn_12"></xsl:variable>
          <xsl:variable name="StatusBasedOn_13" select="NoTable/LastContact_StatusBasedOn_13"></xsl:variable>
          <xsl:variable name="StatusBasedOn_14" select="NoTable/LastContact_StatusBasedOn_14"></xsl:variable>
          <xsl:variable name="StatusBasedOn_15" select="NoTable/LastContact_StatusBasedOn_15"></xsl:variable>
          <xsl:variable name="StatusBasedOn_16" select="NoTable/LastContact_StatusBasedOn_16"></xsl:variable>
          <xsl:variable name="StatusBasedOn_17" select="NoTable/LastContact_StatusBasedOn_17"></xsl:variable>
          <xsl:variable name="StatusBasedOn_18" select="NoTable/LastContact_StatusBasedOn_18"></xsl:variable>
          <xsl:variable name="StatusBasedOn_19" select="NoTable/LastContact_StatusBasedOn_19"></xsl:variable>
          <xsl:variable name="StatusBasedOn_20" select="NoTable/LastContact_StatusBasedOn_20"></xsl:variable>

          <xsl:variable name="OngoingTreatment_11" select="NoTable/LastContact_OngoingTreatment_11"></xsl:variable>
          <xsl:variable name="OngoingTreatment_12" select="NoTable/LastContact_OngoingTreatment_12"></xsl:variable>
          <xsl:variable name="OngoingTreatment_13" select="NoTable/LastContact_OngoingTreatment_13"></xsl:variable>
          <xsl:variable name="OngoingTreatment_14" select="NoTable/LastContact_OngoingTreatment_14"></xsl:variable>
          <xsl:variable name="OngoingTreatment_15" select="NoTable/LastContact_OngoingTreatment_15"></xsl:variable>
          <xsl:variable name="OngoingTreatment_16" select="NoTable/LastContact_OngoingTreatment_16"></xsl:variable>
          <xsl:variable name="OngoingTreatment_17" select="NoTable/LastContact_OngoingTreatment_17"></xsl:variable>
          <xsl:variable name="OngoingTreatment_18" select="NoTable/LastContact_OngoingTreatment_18"></xsl:variable>
          <xsl:variable name="OngoingTreatment_19" select="NoTable/LastContact_OngoingTreatment_19"></xsl:variable>
          <xsl:variable name="OngoingTreatment_20" select="NoTable/LastContact_OngoingTreatment_20"></xsl:variable>

          <xsl:variable name="UserNotes_11" select="NoTable/LastContact_UserNotes_11"></xsl:variable>
          <xsl:variable name="UserNotes_12" select="NoTable/LastContact_UserNotes_12"></xsl:variable>
          <xsl:variable name="UserNotes_13" select="NoTable/LastContact_UserNotes_13"></xsl:variable>
          <xsl:variable name="UserNotes_14" select="NoTable/LastContact_UserNotes_14"></xsl:variable>
          <xsl:variable name="UserNotes_15" select="NoTable/LastContact_UserNotes_15"></xsl:variable>
          <xsl:variable name="UserNotes_16" select="NoTable/LastContact_UserNotes_16"></xsl:variable>
          <xsl:variable name="UserNotes_17" select="NoTable/LastContact_UserNotes_17"></xsl:variable>
          <xsl:variable name="UserNotes_18" select="NoTable/LastContact_UserNotes_18"></xsl:variable>
          <xsl:variable name="UserNotes_19" select="NoTable/LastContact_UserNotes_19"></xsl:variable>
          <xsl:variable name="UserNotes_20" select="NoTable/LastContact_UserNotes_20"></xsl:variable>

          <xsl:for-each select="Status[@RecordId&gt;=11 and @RecordId&lt;=20]">
            <xsl:choose>
              <xsl:when test=" (Status != '') or (StatusDateText != '')  or (StatusDisease != '') or (StatusNotes != '')">
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
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:if test="@RecordId = 11">
                      <xsl:value-of select="$StatusBasedOn_11"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 12">
                      <xsl:value-of select="$StatusBasedOn_12"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 13">
                      <xsl:value-of select="$StatusBasedOn_13"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 14">
                      <xsl:value-of select="$StatusBasedOn_14"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 15">
                      <xsl:value-of select="$StatusBasedOn_15"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 16">
                      <xsl:value-of select="$StatusBasedOn_16"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 17">
                      <xsl:value-of select="$StatusBasedOn_17"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 18">
                      <xsl:value-of select="$StatusBasedOn_18"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 19">
                      <xsl:value-of select="$StatusBasedOn_19"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 20">
                      <xsl:value-of select="$StatusBasedOn_20"/>&#160;
                    </xsl:if>
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:if test="@RecordId = 11">
                      <xsl:value-of select="$OngoingTreatment_11"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 12">
                      <xsl:value-of select="$OngoingTreatment_12"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 13">
                      <xsl:value-of select="$OngoingTreatment_13"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 14">
                      <xsl:value-of select="$OngoingTreatment_14"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 15">
                      <xsl:value-of select="$OngoingTreatment_15"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 16">
                      <xsl:value-of select="$OngoingTreatment_16"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 17">
                      <xsl:value-of select="$OngoingTreatment_17"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 18">
                      <xsl:value-of select="$OngoingTreatment_18"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 19">
                      <xsl:value-of select="$OngoingTreatment_19"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 20">
                      <xsl:value-of select="$OngoingTreatment_20"/>&#160;
                    </xsl:if>
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:if test="@RecordId = 11">
                      <xsl:value-of select="$UserNotes_11"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 12">
                      <xsl:value-of select="$UserNotes_12"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 13">
                      <xsl:value-of select="$UserNotes_13"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 14">
                      <xsl:value-of select="$UserNotes_14"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 15">
                      <xsl:value-of select="$UserNotes_15"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 16">
                      <xsl:value-of select="$UserNotes_16"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 17">
                      <xsl:value-of select="$UserNotes_17"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 18">
                      <xsl:value-of select="$UserNotes_18"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 19">
                      <xsl:value-of select="$UserNotes_19"/>&#160;
                    </xsl:if>
                    <xsl:if test="@RecordId = 20">
                      <xsl:value-of select="$UserNotes_20"/>&#160;
                    </xsl:if>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status',11)">
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
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

  <!--Template: Recurrence Status Data-->
  <xsl:template name="RecurrencePancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="3">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Recurrence</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Sites of initial recurrence</strong>
            </td>
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Disease</strong>
            </td>
          </tr>

          <xsl:for-each select="Status[@RecordId&gt;=24]">
            <xsl:choose>
              <xsl:when test=" (Status != '') or (StatusDateText != '')  or (StatusDisease != '')">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="StatusDateText"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="StatusNotes"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="StatusDisease"/>&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status',24)">
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

        </table>
      </td>
    </tr>

  </xsl:template>

  <!--Template: Subsequent metastases Data-->
  <xsl:template name="SubsequentMetastasesPancreas">
    <tr>
      <td  class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" >

          <tr class="EFormTableRow" style="background-color:#dddddd;">
            <td width="100%" align="left" valign="top" colspan="3">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Subsequent metastases</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="34%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Sites of metastases</strong>
            </td>
            <td width="33%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Disease</strong>
            </td>
          </tr>
          <xsl:for-each select="Status[@RecordId&gt;=23]">
            <xsl:choose>
              <xsl:when test=" (Status != '') or (StatusDateText != '')  or (StatusDisease != '')">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="StatusDateText"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="StatusNotes"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="StatusDisease"/>&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status',23)">
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

        </table>
      </td>
    </tr>

  </xsl:template>

  <!--DeathDateLiver parameters-->
  <xsl:param name="PtDeathCause"/>
  <xsl:param name="PtDeathType"/>
  <xsl:param name="PtDeathAgePDSHistory"/>

  <!--Template: Subsequent metastases Data-->
  <xsl:template name="DeathDatePancreas">
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
                <i>n/a</i>&#160;
              </xsl:if>
              <xsl:if test="$PtDeathAgePDSHistory != 'No'">
                <xsl:value-of select="$PtDeathType"/>&#160;
              </xsl:if>
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">
              <xsl:if test="$PtDeathAgePDSHistory = 'No'">
                <i>n/a</i>&#160;
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
        <xsl:call-template name="EformHeaderPancreas"/>
        
        <!--Sub-Header-->
        <xsl:call-template name="HPIHeader"/>        
        <!--Demographics-->
        <xsl:call-template name="DemographicsTablePancreas"/>
        <!--Chief Complaint-->
        <xsl:call-template name="ChiefComplaintPancreas"/>
        <!--Status Dates-->
        <xsl:call-template name="StatusDatesPancreas"/>
        <!--Additional Notes-->
        <xsl:call-template name="AdditionalNotesPancreas"/>
        
        <!--Sub-Header-->
        <xsl:call-template name="PastMedHistoryHeader"/>
        <!--Comorbidities-->
        <xsl:call-template name="ComorbiditiesTablePancreas"/>
        <!--Surgical History-->
        <xsl:call-template name="PancreasSurgerySurgicalHistory"/>

        <!--Sub-Header-->
        <xsl:call-template name="SocialHxHeader"/>
        <!--Social History-->
        <xsl:call-template name="PatientsSocialHistoriesPancreas"/>

        <!--Sub-Header-->
        <xsl:call-template name="FamilyHxHeader"/>
        <!--Family History-->
        <xsl:call-template name="PatientsFamilyMembersPancreas"/>

        <!--Sub-Header-->
        <xsl:call-template name="PreOpStagingHeader"/>
        <!--CT/MRI-->
        <xsl:call-template name="CtMriPancreas"/>
        <!--Pre-Op Workup-->
        <xsl:call-template name="AdditionalStudiesPancreas"/>
        <!--Clinical Staging-->
        <xsl:call-template name="ClinicalStagingPancreas"/>
        <!--Pre-Op Performance-->
        <xsl:call-template name="PerformancePancreas"/>

        <!--Sub-Header-->
        <xsl:call-template name="TreatmentPlanHeader"/>
        <!--Problems & Plans-->
        <xsl:call-template name="TreatmentPlanPancreas"/>
        <!--Pre-Op Medical Therapies-->
        <xsl:call-template name="MedicalTherapiesPancreas"/>
        <!--Pre-Op Radiation Therapies-->
        <xsl:call-template name="RadiationTherapiesPancreas"/>
        <!--Pre-Op Restaging Therapies-->
        <xsl:call-template name="PreOpRestagingPancreas"/>

        <!--Sub-Header-->
        <xsl:call-template name="OperativeDetailsHeader"/>
        <!--Vital Signs-->
        <xsl:call-template name="VitalSignsPancreas"/>
        <!--Pre-Op Labs-->
        <xsl:call-template name="LabsPancreas"/>
        <!--Surgery Detail - Operative Detail-->
        <xsl:call-template name="OperativeDetailPancreas"/>
        <!--Surgery Detail - Primary Procedure & Primay Procedure Details & Supplimentary Procedures-->
        <xsl:call-template name="PrimaryProcedurePancreas"/>
        <!--Surgery Findings-->
        <xsl:call-template name="SurgeryFindingPancreas"/>
        <!--Anesthesia-->
        <xsl:call-template name="PancreasSurgeryAnesthesia"/>
        <!--Intra-Operative Complications-->
        <xsl:call-template name="IntraOpCompPancreas"/>
        <!--Additional Surgeries-->
        <xsl:call-template name="AdditionalSurgeriesPancreas"/>

        <!--Sub-Header-->
        <xsl:call-template name="PostOpCourseHeader"/>
        <!--Hospitalizations-->
        <xsl:call-template name="PancreasSurgeryHospitalization"/>
        <!--Post-Operative Complications-->
        <xsl:call-template name="PostOpCompPancreas"/>

        <!--Sub-Header-->
        <xsl:call-template name="PathStagingHeader"/>
        <!--Pathology/Final Staging-->
        <xsl:call-template name="PathReportPancreas"/>
        <!--Pancreas Pathology-->
        <xsl:call-template name="PancreasPathPancreas"/>
        <!--Pathology Findings-->
        <xsl:call-template name="PathFindingsPancreas"/>
        <!--Pathology Node Findings-->
        <xsl:call-template name="PathNodeFindingsPancreas"/>
        <!--Pathologic Staging (UICC_02, Pancreas)-->
        <xsl:call-template name="PathologicStagingPancreas"/>
        
        <!--Sub-Header-->
        <xsl:call-template name="PostOpTreatmentHeader"/>
        <!--Adjuvant Therapies-->
        <xsl:call-template name="AdjuvantTherapiesPancreas"/>
        <!--Post-Op Radiation Therapies-->
        <xsl:call-template name="PostOpRadiationTxPancreas"/>
        
        <!--Sub-Header-->
        <xsl:call-template name="OutcomesHeader"/>
        <!--Last Contact Status-->
        <xsl:call-template name="LastContactStatusPancreas"/>
        <!--Recurrence-->
        <xsl:call-template name="RecurrencePancreas"/>
        <!--Subsequent Metastases-->
        <xsl:call-template name="SubsequentMetastasesPancreas"/>
        <!--Patient Death-->
        <xsl:call-template name="DeathDatePancreas"/>
        
        <tr class="FormOuterTableRow">
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            <img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">1</span> of <span id="TotalPages">1</span>
          </td>
        </tr>
      </table>
    </div>





  </xsl:template>
</xsl:stylesheet>
