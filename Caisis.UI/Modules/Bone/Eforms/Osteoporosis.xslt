<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--Variables-->
<!--Barcode Variables-->
<xsl:variable name="DocType">*U06*</xsl:variable>
<xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>

  <!--Header Variables-->
<xsl:variable name="ReportTitle">Osteoporosis and Post-Fracture Follow-Up Clinic</xsl:variable>
<!--Footer Variables-->
<xsl:variable name="DocNumber">99-99671</xsl:variable>
<xsl:variable name="DocAssignment">PM4</xsl:variable>
<xsl:variable name="ApprovalDate">05/10</xsl:variable>
<xsl:variable name="RevisedDate">05/06/10</xsl:variable>
<!--Please Note: The footer cannot be implemented as a template until Jason's new page counting information is added
<xsl:variable name="PageNumber">X of Y</xsl:variable>-->


<!--ToDo: Use institution Short Name and Long Name From Web Config-->
<xsl:variable name="ReportInstitution">McGill University Health Centre</xsl:variable>
<xsl:variable name="InstitutionShortName">MUHC</xsl:variable>
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

  <xsl:template name="MUHCFormBarcodeOsteo">
    <img src="../../Images/FormImages/MUHC_FormBarCode_6110.gif" border="0" width="210" />
  </xsl:template>
  
  <xsl:template name="McGillEformHeader">
    
    <tr class="EFormTableRow">
      <td class="FormOuterTableTopRow">
        <table class="EFormTable" cellspacing="0" cellpadding="10">
          <tr class="EFormTableRow">
            <td width="50%" align="center" valign="middle"  class="FormInsideTableRegCell">
              <xsl:value-of select="$InstitutionLogoImgUrl" disable-output-escaping="yes" />
              <span class="blackBoldText">
                <xsl:value-of select="$InstitutionName"/>
                <br />
                <xsl:value-of select="$ReportTitle"/>                
              </span>
              <br /><br />
              <xsl:call-template name="MUHCFormBarcodeOsteo"/>
            </td>
            <td width="50%" align="center" valign="middle" class="FormInsideTableRegCell">
              <table cellspacing="0">
                <tr class="EFormTableRow">
                  <td width="20%">
                    <img src="../../Images/shim.gif" border="0" width="65" height="1" />
                  </td>
                  <td align="left" width="80%">
                    <img src="../../Images/shim.gif" border="0" width="274" height="1" />
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td align="left">
                    <xsl:value-of select="$PtMRNTitle"/>:
                  </td>
                  <td align="left" style="white-space: nowrap;">
                    <strong>
                      <xsl:value-of select="$PtMRN"/>
                    </strong><img src="../../Images/shim.gif" width="20" height="1" />
                    DOB:&#160;<strong>
                      <xsl:value-of select="$PtBirthDate"/>
                    </strong><img src="../../Images/shim.gif" width="20" height="1" />
                    Gender:&#160;<strong>
                      <xsl:value-of select="$PtGender"/>
                    </strong>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td colspan="1" align="left">Name:</td>
                  <td colspan="1" align="left">
                    <strong>
                      <xsl:value-of select="$PtLastName"/>, <xsl:value-of select="$PtFirstName"/>&#160;<xsl:value-of select="$PtMiddleName"/>
                    </strong>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td align="left" valign="top">Address:</td>
                  <td align="left" valign="top">
                    <strong>
                      <xsl:value-of select="$PtAddress" disable-output-escaping="yes" />
                    </strong>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td colspan="2">
                    <img src="../../Images/shim.gif" border="0" width="1" height="5" />
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
                </tr>
              </table>
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
        
        <xsl:value-of select="$PrivacyHeader"/>
        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="McGillEformHeader"/>
        <!--Date and Physician Header-->
        <xsl:call-template name="EncounterDatePhysician"/>
        <!--Chief Complaint-->
        <xsl:call-template name="EncChiefComplaint"/>
        <!--Patient Physicians-->
        <xsl:call-template name="PatitentPhysiciansAndKeyTable"/>
        <!--Living Arrangements-->
        <xsl:call-template name="HospitalizationBoneTable"/>
        <!--Comorbidities-->
        <xsl:call-template name="ComorbiditiesTableOnly"/>
        <!--Surgery-->
        <xsl:call-template name="ProceduresOsteoTable"/>
        <!--Medications-->
        <xsl:call-template name="MedTableOnly"/>
        <!--Interval History-->
        <xsl:call-template name="IntervalHistory"/>
        <!--Encounter Assessment-->
        <xsl:call-template name="EncountersVitalSignsTable4"/>
        <!--Mobility Assessment-->
        <xsl:call-template name="EncountersAssessmentMobilityTable"/>
        <!-- Bone Scan-->
        <xsl:call-template name="DiagnosticsBMDHtmlTable"/>
        <!--Lab Tests-->
        <xsl:call-template name="LabTable3"/>
        <!--Problems and Plans-->
        <xsl:call-template name="ProblemPlanTable2"/>
        <!--Approval Signature-->
        <xsl:call-template name="ApprovalSignature2"/>
                
        <tr class="FormOuterTableRow">
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            rev:05/06/10<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">1</span> of <span id="TotalPages">1</span>
          </td>
        </tr>
      </table>
    </div>





  </xsl:template>
</xsl:stylesheet>
