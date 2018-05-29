<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  
  <!--Parameters-->
  <xsl:param name="ActiveSurveillanceRectalExamHistory" />
  <xsl:param name="CombinedProstateMRI" />
  <xsl:param name="CombinedProstateUlrasound" />
  <!--Variables-->
<!--Barcode Variables-->
<xsl:variable name="DocType">*PM4*</xsl:variable>
<xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>
<!--Header Variables-->
<xsl:variable name="ReportTitle">Prostate Biopsy/Fiducial Marker</xsl:variable>
<!--Footer Variables-->
<xsl:variable name="DocNumber">99-99671</xsl:variable>
<xsl:variable name="DocAssignment">PM4</xsl:variable>
<xsl:variable name="ApprovalDate">10/00</xsl:variable>
<xsl:variable name="RevisedDate">03/09/15</xsl:variable>
<!--Please Note: The footer cannot be implemented as a template until Jason's new page counting information is added
<xsl:variable name="PageNumber">X of Y</xsl:variable>-->


<!--ToDo: Use institution Short Name and Long Name From Web Config-->
<xsl:variable name="ReportInstitution">MEMORIAL HOSPITAL FOR CANCER AND ALLIED DISEASES</xsl:variable>
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
    table#TRUSMRIHtmlTable
    {
    border-spacing: none;
    border-collapse: collapse;
    }
    table#TRUSMRIHtmlTable td
    {
    border: solid 1px #333333;
    padding: 5px 2px 5px 2px;
    text-align: center;
    }
    table#TRUSMRIHtmlTable td:first-child { border-left: none; }

    table#TRUSMRIHtmlTable td.DateCol { width: 15%; }
    table#TRUSMRIHtmlTable td.StudyCol { width: 12%; }
    table#TRUSMRIHtmlTable td.VolumeCol { width: 8%; }
    table#TRUSMRIHtmlTable td.FindingsCol { width: 65%; padding: 0 0 0 0; }
    table#TRUSMRIHtmlTable td.FindingsCol table { width: 100%; border-spacing: none; border-collapse: collapse;  }
    table#TRUSMRIHtmlTable td.FindingsCol td.SideCol { width: 12%; }
    table#TRUSMRIHtmlTable td.FindingsCol td.AreaCol { width: 14%; }
    table#TRUSMRIHtmlTable td.FindingsCol td.LatCol { width: 12%; }
    table#TRUSMRIHtmlTable td.FindingsCol td.APCol { width: 12%; }
    table#TRUSMRIHtmlTable td.FindingsCol td.ZoneCol { width: 12%; }
    table#TRUSMRIHtmlTable td.FindingsCol td.ResultCol { width: 26%; }
    table#TRUSMRIHtmlTable td.FindingsCol td.ECECol { width: 12%; }

    table#TRUSMRIHtmlTable td:last-child { border-right: none; }





    table#TRUSUlrasoundHistoryHtmlTable
    {
    border-spacing: none;
    border-collapse: collapse;
    }
    table#TRUSUlrasoundHistoryHtmlTable td
    {
    border: solid 1px #333333;
    padding: 5px 2px 5px 2px;
    text-align: center;
    }
    table#TRUSUlrasoundHistoryHtmlTable td:first-child { border-left: none; }
    table#TRUSUlrasoundHistoryHtmlTable td.DateCol { width: 15%; }
    table#TRUSUlrasoundHistoryHtmlTable td.StudyCol { width: 12%; }
    table#TRUSUlrasoundHistoryHtmlTable td.VolumeCol { width: 8%; }
    table#TRUSUlrasoundHistoryHtmlTable td.ImpressionCol { width: 65%; }
    table#TRUSUlrasoundHistoryHtmlTable td:last-child { border-right: none; }


    table#BiopsyTypesHTMLTable
    {
    border-spacing: none;
    border-collapse: collapse;
    width: 100%;
    }
    table#BiopsyTypesHTMLTable td
    {
    border: solid 1px #333333;
    padding: 5px 2px 5px 2px;
    }
    table#BiopsyTypesHTMLTable th
    {
    border: solid 1px #333333;
    padding: 2px 2px 2px 2px;
    text-align: center;
    }




    table.TRUSRectalExamHistoryHtmlTable
    {
    border-spacing: none;
    border-collapse: collapse;
    }
    table.TRUSRectalExamHistoryHtmlTable td
    {
    border: solid 1px #333333;
    padding: 5px 2px 5px 2px;
    text-align: center;
    }
    table.TRUSRectalExamHistoryHtmlTable>tbody>tr>td
    {
    }
    table.TRUSRectalExamHistoryHtmlTable td.DateCol { width: 15%; }
    table.TRUSRectalExamHistoryHtmlTable td.ClinicalStageCol { width: 20%; }
    table.TRUSRectalExamHistoryHtmlTable td.FindingsCol { width: 65%; padding: 0 0 0 0; border-right: none; }
    table.TRUSRectalExamHistoryHtmlTable td.FindingsCol table
    {
    border-spacing: none;
    border-collapse: collapse;
    }

  </style>

  <div align="left"  style="page-break-after:always;">
  <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
  <div>
    <div class="VerticalBarCodeDiv">
      <div class="VerticalBarCodeStatement">
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" />
        <br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"/>
        <br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage"/>
      </div>
      <div  class="VerticalBarCodeMRN">
        *MRN<xsl:value-of select="$PtMRN"/>*
      </div>
      <div  class="VerticalBarCodeDocType">
        <xsl:value-of select="$DocType"/>
      </div>
      <div  class="VerticalBarCodeAcctType">
        <xsl:value-of select="$AcctType"/>
      </div>
      <div  class="VerticalBarCodeDate">
        *<xsl:value-of select="Procedures[@RecordId=1]/ProcDateText"/>*
      </div>

    </div>
  </div>

  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
    <xsl:value-of select="$PrivacyHeader"/>
    
    <!--eForm Header: Demographics, Institution Symbol and Form name-->
    <xsl:call-template name="EformHeader"/>
    <!--Date and Physician Header
    <xsl:call-template name="EncounterDatePhysician"/>-->
    <tr>
      <td  class="FormOuterTableRow">
        <a name="DatePhysician_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td width="50%" height="10" align="left" valign="bottom" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcDateText','BiopsyOfProstateIndication')">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:&#160;<xsl:value-of select="Procedures[@RecordId=1]/ProcDateText"/>
            </td>
            <td width="50%" align="left" valign="bottom" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcSurgeon','BiopsyOfProstateIndication')">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Physician</span>:&#160;<xsl:value-of select="Procedures[@RecordId=1]/ProcSurgeon"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>

    <tr>
      <td class="FormOuterTableRow">
        <a name="MedicalAssessment_Anchor" />
        <table class="EFormTable" cellspacing="0" border="0">
          <tr class="EFormTableRow">
            <td colspan="2" class="TRUSFormSectionHeading" >Medical Assessment</td>
          </tr>
          <tr class="EFormTableRow">
            <td colspan="2" style="padding: 0 0 0 0; border-top: solid 1px #000000;">
              <a name="RectalExamHistory_Anchor" />
              <span class="TRUSFormSectionHeading">Rectal Exam History</span>
              <table class="EFormTable TRUSRectalExamHistoryHtmlTable" cellspacing="0" border="0" >
                <tr>
                  <td class="DateCol">&#160;Date</td>
                  <td class="ClinicalStageCol">2002 Clinical Stage</td>
                  <td class="FindingsCol">Findings</td>
                </tr>
              </table>
            </td>
          </tr>
          <xsl:for-each select="$ActiveSurveillanceRectalExamHistory/Encounters">
            <tr>
              <td class="FormOuterTableRow">
                <table class="EFormTable TRUSRectalExamHistoryHtmlTable" cellspacing="0" border="0" >
                  <tr >
                    <td class="DateCol">
                      <xsl:value-of select="EncDateText"  />&#160;
                    </td>
                    <td class="ClinicalStageCol">
                      <xsl:value-of select="ClinStage"  />&#160;
                    </td>
                    <td class="FindingsCol">
                      <xsl:value-of select="FindingsHTML" disable-output-escaping="yes"  />&#160;
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </xsl:for-each>
          <tr class="EFormTableRow">
            <td class="FormInsideTableRegCell" style="padding: 1em 0;"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('DRE_Result', 'DRE')" >
              <a name="DRE_Anchor" />
              <table class="EFormTable" cellspacing="0">
                <tr >
                  <td align="left" valign="middle" >
                    <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">
                      Digital Rectal Examination
                    </span>&#160;&#160;&#160;
                    <xsl:for-each select="Encounters/EncRectalExams">
                      <xsl:choose>
                        <xsl:when test="((DRE_Result = 'Normal'))">
                          &#160;<input name="RadioYes_DRE" type="Radio" id="RadioYes_DRE" checked="Yes" />
                          &#160;<span class="blackBoldText">Normal</span>
                          &#160;<input name="RadioNo_DRE" type="Radio" id="RadioNo_DRE" />
                          &#160;<span class="blackBoldText">Abnormal</span>
                          &#160;<input name="RadioMalignant_DRE" type="Radio" id="RadioMalignant_DRE" />
                          &#160;<span class="blackBoldText">Abnormal Malignant</span>
                        </xsl:when>
                        <xsl:when test="((DRE_Result = 'Abnormal'))">
                          &#160;<input name="RadioYes_DRE" type="Radio" id="RadioYes_DRE" />
                          &#160;<span class="blackBoldText">Normal</span>
                          &#160;<input name="RadioNo_DRE" type="Radio" id="RadioNo_DRE" checked="Yes" />
                          &#160;<span class="blackBoldText">Abnormal</span>
                          &#160;<input name="RadioMalignant_DRE" type="Radio" id="RadioMalignant_DRE" />
                          &#160;<span class="blackBoldText">Abnormal Malignant</span>
                        </xsl:when>
                        <xsl:when test="((DRE_Result = 'Abnormal Malignant'))">
                          &#160;<input name="RadioYes_DRE" type="Radio" id="RadioYes_DRE" />
                          &#160;<span class="blackBoldText">Normal</span>
                          &#160;<input name="RadioNo_DRE" type="Radio" id="RadioNo_DRE" />
                          &#160;<span class="blackBoldText">Abnormal</span>
                          &#160;<input name="RadioMalignant_DRE" type="Radio" id="RadioMalignant_DRE" checked="Yes" />
                          &#160;<span class="blackBoldText">Abnormal Malignant</span>
                        </xsl:when>
                        <xsl:otherwise>
                          &#160;<input name="RadioYes_DRE" type="Radio" id="RadioYes_DRE" />
                          &#160;<span class="blackBoldText">Normal</span>
                          &#160;<input name="RadioNo_DRE" type="Radio" id="RadioNo_DRE" />
                          &#160;<span class="blackBoldText">Abnormal</span>
                          &#160;<input name="RadioMalignant_DRE" type="Radio" id="RadioMalignant_DRE" />
                          &#160;<span class="blackBoldText">Abnormal Malignant</span>
                        </xsl:otherwise>
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
    <!--Vital Signs -->
      <!--<xsl:call-template name="VitalSigns"/>-->
    <!--Nurse Signature and Title -->
      <!--<xsl:call-template name="NurseSignature"/>  -->
    <!--Medication Unchanged since last visit and Allergies Unchanged since last visit in one row-->
      <!--<xsl:call-template name="MedAllergiesSinceLastVisitTable"/>-->
    <!--Medication StopDates for ASA, Plavix or Coumadin-->
      <!--<xsl:call-template name="StopDates"/>-->
    <!--Antibiotics taken prior to biopsy and Encarditis-->
      <!--<xsl:call-template name="AntibioticsEncarditis"/>-->
    <!--Instruction Fact Cards-->
      <!--<xsl:call-template name="InstructionFactCards"/>-->
    <!--Signature/Title and Date/Time-->
      <!--<xsl:call-template name="SignatureDate"/>-->
      
      
    <!--Medical Assessment
    <xsl:call-template name="MedicalAssessment"/>-->
    <!--Serum PSA Level-->
    <xsl:call-template name="SerumLabTable"/>
    <tr>
      <td class="FormOuterTableRow">
        <a name="IndicationConsentAntibioticsBx_Anchor" />
        <table class="EFormTable" cellspacing="0" border="0">
          <tr class="EFormTableRow">
            <td colspan="2" class="FormInsideTableRegCell" style="padding: 1.5em 0;"   onclick="LoadComponentByField('ProcName')" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  >
              <a name="ProcIndication_Anchor" />
              <table class="EFormTable" cellspacing="0">
                <tr >
                  <td align="left" valign="middle" class="blackBoldText" style="padding: 2px 0px 0px 4px;">Procedure:</td>
                  <td align="left" valign="middle"  >

                    <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                        <xsl:when test="(contains(ProcName, 'TRUS Biopsy'))">
                          <input name="RadioProcedure" type="radio" id="RadioTRUSBiopsy" checked="checked" />
                          <strong>TRUS Biopsy</strong>
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="RadioProcedure" type="radio" id="RadioTRUSBiopsy" />
                          <strong>TRUS Biopsy</strong>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                    
                    
                  </td>
                  <td align="left" valign="middle" >

                    <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                        <xsl:when test="(contains(ProcName, 'TRUS Fiducial Marker Placement Only'))">
                          <input name="RadioProcedure" type="radio" id="RadioTRUSFiducialMarkerPlacementOnly" checked="checked" />
                          <strong>TRUS Fiducial Marker Placement Only</strong>
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="RadioProcedure" type="radio" id="RadioTRUSFiducialMarkerPlacementOnly" />
                          <strong>TRUS Fiducial Marker Placement Only</strong>
                        </xsl:otherwise>
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
                  <td align="left" valign="middle" >
                    <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                        <xsl:when test="(contains(ProcIndication, 'Active Surveillance'))">
                          <input type="checkbox" id="RadioActiveSurveillance" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input type="checkbox" id="RadioActiveSurveillance" />
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                    <strong>Active Surveillance</strong>
                  </td>
                  <td align="left" valign="middle" >
                    <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                        <xsl:when test="(contains(ProcIndication, 'Restaging'))">
                          <input type="checkbox" id="RadioRestage" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input type="checkbox" id="RadioRestage" />
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                    <strong>Restaging</strong>
                  </td>
                  <td align="left" valign="middle" >
                    <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                        <xsl:when test="(contains(ProcIndication, 'Elevated PSA'))">
                          <input type="checkbox" id="RadioPSA" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input type="checkbox" id="RadioPSA" />
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                    <strong>Elevated PSA</strong>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td align="left" valign="middle" style="padding: 2px 0px 0px 4px;">&#160;</td>
                  <td align="left" valign="middle" >
                    <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                        <xsl:when test="(contains(ProcIndication, 'Prostate Nodule/Abnormality'))">
                          <input type="checkbox" id="RadioProstate" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input type="checkbox" id="RadioProstate" />
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                    <strong>Prostate nodule/abnormality</strong>
                  </td>
                  <td align="left" valign="middle" >
                    <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                        <xsl:when test="(contains(ProcIndication, 'Post Radiation'))">
                          <input type="checkbox" id="RadioPostRadiation" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input type="checkbox" id="RadioPostRadiation" />
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                    <strong>Post Radiation</strong>
                  </td>
                  <td align="left" valign="middle" >
                    <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                        <xsl:when test="(contains(ProcIndication, 'Abnormal MRI'))">
                          <input type="checkbox" id="RadioAbnormalMRI" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input type="checkbox" id="RadioAbnormalMRI" />
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                    <strong>Abnormal MRI</strong>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td align="left" valign="middle" style="padding: 2px 0px 0px 4px;">&#160;</td>
                  <td colspan="3" align="left" valign="middle" >

                    <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                        <xsl:when test="((ProcIndication != 'Active Surveillance') and (ProcIndication != 'Restaging') and (ProcIndication != 'Elevated PSA') and (ProcIndication != 'Prostate Nodule/Abnormality') and (ProcIndication != 'Post Radiation') and (ProcIndication != 'Abnormal MRI'))">

                          <xsl:variable name="OtherBiopsyIndicationA">
                            <xsl:call-template name="string-replace-all">
                              <xsl:with-param name="text" select="ProcIndication" />
                              <xsl:with-param name="replace" select="'Active Surveillance'" />
                              <xsl:with-param name="by" select="''" />
                            </xsl:call-template>
                          </xsl:variable>
                          <xsl:variable name="OtherBiopsyIndicationB">
                            <xsl:call-template name="string-replace-all">
                              <xsl:with-param name="text" select="$OtherBiopsyIndicationA" />
                              <xsl:with-param name="replace" select="'Restaging'" />
                              <xsl:with-param name="by" select="''" />
                            </xsl:call-template>
                          </xsl:variable>
                          <xsl:variable name="OtherBiopsyIndicationC">
                            <xsl:call-template name="string-replace-all">
                              <xsl:with-param name="text" select="$OtherBiopsyIndicationB" />
                              <xsl:with-param name="replace" select="'Elevated PSA'" />
                              <xsl:with-param name="by" select="''" />
                            </xsl:call-template>
                          </xsl:variable>
                          <xsl:variable name="OtherBiopsyIndicationD">
                            <xsl:call-template name="string-replace-all">
                              <xsl:with-param name="text" select="$OtherBiopsyIndicationC" />
                              <xsl:with-param name="replace" select="'Prostate Nodule/Abnormality'" />
                              <xsl:with-param name="by" select="''" />
                            </xsl:call-template>
                          </xsl:variable>
                          <xsl:variable name="OtherBiopsyIndicationE">
                            <xsl:call-template name="string-replace-all">
                              <xsl:with-param name="text" select="$OtherBiopsyIndicationD" />
                              <xsl:with-param name="replace" select="'Post Radiation'" />
                              <xsl:with-param name="by" select="''" />
                            </xsl:call-template>
                          </xsl:variable>
                          <xsl:variable name="OtherBiopsyIndication">
                            <xsl:call-template name="string-replace-all">
                              <xsl:with-param name="text" select="$OtherBiopsyIndicationE" />
                              <xsl:with-param name="replace" select="','" />
                              <xsl:with-param name="by" select="' '" />
                            </xsl:call-template>
                          </xsl:variable>


                          <input type="checkbox" id="RadioProstate" checked="checked" />
                          <strong>
                            Other: <xsl:value-of select="$OtherBiopsyIndication"  />
                          </strong>
                        </xsl:when>
                        <xsl:otherwise>
                          <input type="checkbox" id="RadioProstate" />
                          <strong>Other</strong>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td colspan="2" class="FormInsideTableRegCell blackBoldText" style="padding: 7px 0px 7px 4px;">
              <table class="EFormTable" cellspacing="0">
                <tr class="EFormTableRow">
                  <td class="blackBoldText" >Fiducial Markers</td>
                  <td  onclick="LoadComponentByField('ProcFindSubsite')" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  >
                    <strong>Subsite:</strong>
                    <xsl:choose>
                      <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=1]/ProcFindSubsite != '')">
                        <input name="FiducialMarkersSubsite" type="checkbox" id="FiducialMarkersSubsite" style="vertical-align: text-top; margin-left: 1em;" checked="checked"  />
                      </xsl:when>
                      <xsl:otherwise>
                        <input name="FiducialMarkersSubsite" type="checkbox" id="FiducialMarkersSubsite" style="vertical-align: text-top; margin-left: 1em;" />
                      </xsl:otherwise>
                    </xsl:choose>
                    Right Apex, Right Base, Left Base
                  </td>
                  <td  onclick="LoadComponentByField('ProcFindNotes')" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  >
                    <strong>Type:</strong><xsl:choose>
                      <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=1]/ProcFindNotes = 'Calypso')">
                        <input name="FiducialMarkersType" type="radio" id="FiducialMarkersTypeCalypso" style="vertical-align: text-top; margin-left: 1.5em;" checked="checked"  />
                      </xsl:when>
                      <xsl:otherwise>
                        <input name="FiducialMarkersType" type="radio" id="FiducialMarkersTypeCalypso" style="vertical-align: text-top; margin-left: 1.5em;" />
                      </xsl:otherwise>
                    </xsl:choose> Calypso<xsl:choose>
                      <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=1]/ProcFindNotes = 'Gold')">
                        <input name="FiducialMarkersType" type="radio" id="FiducialMarkersTypeCalypso" style="vertical-align: text-top; margin-left: 1.5em;" checked="checked"  />
                      </xsl:when>
                      <xsl:otherwise>
                        <input name="FiducialMarkersType" type="radio" id="FiducialMarkersTypeCalypso" style="vertical-align: text-top; margin-left: 1.5em;" />
                      </xsl:otherwise>
                    </xsl:choose> Gold
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td class="FormInnerRowRightBorder">
              <a name="ConsentForm_Anchor" />
              <table class="EFormTable" cellspacing="0">
                <tr class="EFormTableRow">
                  <td class="FormInnerRowRightBorder" style="width: 35%;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ConsentForm', 'ConsentFormYesNo')">

                    <a name="ConsentForm_Anchor"/>
                          <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Consent Form:</span>&#160;
                          <xsl:for-each select="NoTable">
                            <xsl:choose>
                              <xsl:when test="((ConsentForm = 'Yes'))">
                                <input name="RadioConsentYes" type="Radio" id="RadioConsentYes" checked="Yes" />
                                &#160;<strong>Yes</strong>&#160;
                                <input name="RadioConsentNo" type="Radio" id="RadioConsentNo" />
                                &#160;<strong>No</strong>
                              </xsl:when>
                              <xsl:when test="((ConsentForm = 'No'))">
                                <input name="RadioConsentYes" type="Radio" id="RadioConsentYes" />
                                &#160;<strong>Yes</strong>
                                <input name="RadioConsentNo" type="Radio" id="RadioConsentNo" checked="Yes" />
                                &#160;<strong>No</strong>
                              </xsl:when>
                              <xsl:otherwise>
                                <input name="RadioConsentYes" type="Radio" id="RadioConsentYes" />
                                &#160;<strong>Yes</strong>&#160;
                                <input name="RadioConsentNo" type="Radio" id="RadioConsentNo" />
                                &#160;<strong>No</strong>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                  </td>
                  <td align="left" valign="middle">

                    <table class="EFormTable" cellspacing="0">
                      <tr class="EFormTableRow">
                        <td align="left" valign="middle"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('AntibioticPriorToBx', 'AntibioticPriorToBx')" ><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Antibiotics Prior to Biopsy:
                          </span>
                          <xsl:for-each select="NoTable">
                            <xsl:choose>
                              <xsl:when test="((AntibioticPriorToBx = 'Yes'))">
                                <input name="RadioPriorBxYes" type="Radio" id="RadioPriorBxYes" checked="Yes" />
                                &#160;<strong>Yes</strong>&#160;
                                <input name="RadioPriorBxNo" type="Radio" id="RadioPriorBxNo" />
                                &#160;<strong>No</strong>
                              </xsl:when>
                              <xsl:when test="((AntibioticPriorToBx = 'No'))">
                                <input name="RadioPriorBxYes" type="Radio" id="RadioPriorBxYes" />
                                &#160;<strong>Yes</strong>&#160;
                                <input name="RadioPriorBxNo" type="Radio" id="RadioPriorBxNo" checked="Yes" />
                                &#160;<strong>No</strong>
                              </xsl:when>
                              <xsl:otherwise>
                                <input name="RadioPriorBxYes" type="Radio" id="RadioPriorBxYes" />
                                &#160;<strong>Yes</strong>&#160;
                                <input name="RadioPriorBxNo" type="Radio" id="RadioPriorBxNo" />
                                &#160;<strong>No</strong>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                        </td>
                      </tr>
                      <tr>
                        <td onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Medication', 'Medication')">
                          <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Antibiotic Type:</span>
                          <xsl:for-each select="Medications[position()=1]">
                            <xsl:choose>
                              <xsl:when test="(contains(Medication, 'Cipro'))">
                                <input name="RadioAntibioticType" type="radio" id="RadioCipro" checked="checked" /> Cipro
                            </xsl:when>
                              <xsl:otherwise>
                                <input name="RadioAntibioticType" type="radio" id="RadioCipro" /> Cipro
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                          
                          <xsl:for-each select="Medications[position()=1]">
                            <xsl:choose>
                              <xsl:when test="(contains(Medication, 'Ceftriaxone'))">
                                <input name="RadioAntibioticType" type="radio" id="RadioCeftriaxone" checked="checked" /> Ceftriaxone
                              </xsl:when>
                              <xsl:otherwise>
                                <input name="RadioAntibioticType" type="radio" id="RadioCeftriaxone" /> Ceftriaxone
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>

                          <xsl:for-each select="Medications[position()=1]">
                            <xsl:choose>
                              <xsl:when test="(contains(Medication, 'Gentamyacin'))">
                                <input name="RadioAntibioticType" type="radio" id="RadioGentamyacin" checked="checked" /> Gentamyacin
                              </xsl:when>
                              <xsl:otherwise>
                                <input name="RadioAntibioticType" type="radio" id="RadioGentamyacin" /> Gentamyacin
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>

                          <xsl:for-each select="Medications[position()=1]">
                            <xsl:choose>
                              <xsl:when test="(contains(Medication, 'Impenem'))">
                                <input name="RadioAntibioticType" type="radio" id="RadioImpenem" checked="checked" /> Impenem
                              </xsl:when>
                              <xsl:otherwise>
                                <input name="RadioAntibioticType" type="radio" id="RadioImpenem" /> Impenem
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                        </td>
                        <td>

                        </td>
                      </tr>
                    </table>

                  </td>
                </tr>
              </table>
            </td>

          </tr>
        </table>
      </td>
    </tr>
    <!--Indication for Bx, Consent Form and Antibiotics Prior to Bx in one row-->
    <!--<xsl:call-template name="IndicationConsentAntibioticsBx"/>-->
    <!--Signature/Title and Date/Time
    <xsl:call-template name="SignatureDate"/>-->
      <tr>
          <td class="FormOuterTableRow">

                  <table width="100%" border="0" cellpadding="8" cellspacing="0">
                      <tr>
                          <td height="45" style="vertical-align: bottom;" >
                              <span class="blackBoldText">Signature:</span>_______________________________________&#160;&#160;<span class="blackBoldText">RN / MD</span>
                          </td>
                          <td style="vertical-align: bottom;" align="right" >
                              <span class="blackBoldText">Date:</span>____/____/____
                          </td>
                          <td style="white-space: nowrap;vertical-align: bottom;">
                              <span class="blackBoldText">Time:</span>____:_____ <span style="font-size: 9px;">AM / PM </span>
                          </td>
                      </tr>
                  </table>

          </td>
      </tr>
    <tr>
      <td class="FormOuterTableRow">
        <a name="MRIReport_Anchor" />
        <span class="TRUSFormSectionHeading" style="display: block;">MRI History</span>
        <table class="EFormTable" id="TRUSMRIHtmlTable" cellspacing="0" border="0" >
          <tr>
            <td class="DateCol">&#160;Date</td>
            <td class="StudyCol">Study</td>
            <td class="VolumeCol">Vol</td>
            <td class="FindingsCol">
              <table cellpadding="0" cellspacing="0">
                <tr>
                <td class="SideCol">Side</td>
                <td class="AreaCol">Area</td>
                <td class="LatCol">Lat</td>
                <td class="APCol">AP</td>
                <td class="ZoneCol">Zone</td>
                <td class="ResultCol">Result</td>
                <td class="ECECol">ECE</td>
                </tr>
              </table>
            </td>
          </tr>


          <xsl:for-each select="$CombinedProstateMRI/Diagnostics">
            <xsl:choose>
              <xsl:when test="(./@IsDB = 'true')">
                <tr class="clickable"  onclick="LoadDataEntryForm('Diagnostics', {DiagnosticId}, 'DxDateText,DxDate,DxType,DxTarget,DxSite,DxNotes'), 'BiopsyOfProstateMRI','DxImageProstate,DxImageFindingsProstate,DxImageFindings'">
                    <td class="DateCol"><xsl:value-of select="DxDateText"  />&#160;</td>
                    <td class="StudyCol"><xsl:value-of select="DxType"  />&#160;</td>
                    <td class="VolumeCol"><xsl:value-of select="DxImageProstate/ImgProstateVolume"  />&#160;</td>
                    <td class="FindingsCol">
                      <table cellpadding="0" cellspacing="0">

                        <xsl:for-each select="DxImageFindingsProstate">
                          <xsl:choose>
                            <xsl:when test="(ImgFindSide != '') or (ImgFindLevel != '') or (ImgFindLaterality != '') or (ImgFindAP != '') or (ImgFindZone != '') or (ImgFindResult != '') or (ImgFindExtension != '')">
                        <tr>
                        <td class="SideCol"><xsl:value-of select="ImgFindSide"  />&#160;</td>
                        <td class="AreaCol"><xsl:value-of select="ImgFindLevel"  />&#160;</td>
                        <td class="LatCol"><xsl:value-of select="ImgFindLaterality"  />&#160;</td>
                        <td class="APCol"><xsl:value-of select="ImgFindAP"  />&#160;</td>
                        <td class="ZoneCol"><xsl:value-of select="ImgFindZone"  />&#160;</td>
                        <td class="ResultCol"><xsl:value-of select="ImgFindResult"  />&#160;</td>
                        <td class="ECECol"><xsl:value-of select="ImgFindExtension"  />&#160;</td>
                        </tr>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </table>
                    </td>
                  </tr>
              </xsl:when>
              <xsl:when test="(./@IsDB = 'false') and (contains(DxType, 'MRI'))">
                <tr class="clickable"  onclick="LoadComponentByTable('Diagnostics',{./@RecordId})">
                    <td class="DateCol"><xsl:value-of select="DxDateText"  />&#160;</td>
                    <td class="StudyCol"><xsl:value-of select="DxType"  />&#160;</td>
                    <td class="VolumeCol"><xsl:value-of select="DxImageProstate/ImgProstateVolume"  />&#160;</td>
                    <td class="FindingsCol">
                      <table cellpadding="0" cellspacing="0">

                        <xsl:for-each select="DxImageFindingsProstate">
                          <xsl:choose>
                            <xsl:when test="(ImgFindSide != '') or (ImgFindLevel != '') or (ImgFindLaterality != '') or (ImgFindAP != '') or (ImgFindZone != '') or (ImgFindResult != '') or (ImgFindExtension != '')">
                        <tr>
                        <td class="SideCol"><xsl:value-of select="ImgFindSide"  />&#160;</td>
                        <td class="AreaCol"><xsl:value-of select="ImgFindLevel"  />&#160;</td>
                        <td class="LatCol"><xsl:value-of select="ImgFindLaterality"  />&#160;</td>
                        <td class="APCol"><xsl:value-of select="ImgFindAP"  />&#160;</td>
                        <td class="ZoneCol"><xsl:value-of select="ImgFindZone"  />&#160;</td>
                        <td class="ResultCol"><xsl:value-of select="ImgFindResult"  />&#160;</td>
                        <td class="ECECol"><xsl:value-of select="ImgFindExtension"  />&#160;</td>
                        </tr>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </table>
                    </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>


          <tr class="clickable"  onclick="LoadComponentByTable('Diagnostics','')">
            <td class="DateCol">&#160;</td>
            <td class="StudyCol">&#160;</td>
            <td class="VolumeCol">&#160;</td>
            <td class="FindingsCol">
              <table cellpadding="0" cellspacing="0">
                <tr>
                  <td class="SideCol">&#160;</td>
                  <td class="AreaCol">&#160;</td>
                  <td class="LatCol">&#160;</td>
                  <td class="APCol">&#160;</td>
                  <td class="ZoneCol">&#160;</td>
                  <td class="ResultCol">&#160;</td>
                  <td class="ECECol">&#160;</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>



    <tr>
      <td class="FormOuterTableRow">
        <a name="MRIReport_Anchor" />
        <span  class="TRUSFormSectionHeading" style="display: block;">Ultrasound History</span>
        <table class="EFormTable" id="TRUSUlrasoundHistoryHtmlTable" cellspacing="0" border="0" >
          <tr>
            <td class="DateCol">&#160;Date</td>
            <td class="StudyCol">Study</td>
            <td class="VolumeCol">Volume</td>
            <td class="SideCol">Impression</td>
          </tr>


          <xsl:for-each select="$CombinedProstateUlrasound/Diagnostics">
            <xsl:choose>
              <xsl:when test="(./@IsDB = 'true')">
                <tr class="clickable"  onclick="LoadDataEntryForm('Diagnostics', {DiagnosticId}, 'DxDateText,DxDate,DxType,DxTarget,DxSite,DxNotes'), 'BiopsyOfProstateUltrasound','DxImageProstate,DxImageFindingsProstate,DxImageFindings'">
                    <td class="DateCol"><xsl:value-of select="DxDateText"  />&#160;</td>
                    <td class="StudyCol"><xsl:value-of select="DxType"  />&#160;</td>
                    <td class="VolumeCol"><xsl:value-of select="DxImageProstate/ImgProstateVolume"  />&#160;</td>
                    <td class="SideCol"><xsl:value-of select="DxNotes"  />&#160;</td>
                  </tr>
              </xsl:when>
              <xsl:when test="(./@IsDB = 'false') and (@RecordId) and (contains(DxType, 'US'))">
                <tr class="clickable"  onclick="LoadComponentByTable('Diagnostics',{./@RecordId})">
                    <td class="DateCol"><xsl:value-of select="DxDateText"  />&#160;</td>
                    <td class="StudyCol"><xsl:value-of select="DxType"  />&#160;</td>
                    <td class="VolumeCol"><xsl:value-of select="DxImageProstate/ImgProstateVolume"  />&#160;</td>
                    <td class="SideCol"><xsl:value-of select="DxNotes"  />&#160;</td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>          
          <tr>
            <td class="DateCol">&#160;</td>
            <td class="StudyCol">&#160;</td>
            <td class="VolumeCol">&#160;</td>
            <td class="SideCol">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
    <!--Footer-->    
    <tr class="FormOuterTableRow">
      <td height="14" align="center" valign="bottom" class="blackBoldText">
        <xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" /><xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
        <img src="../../Images/shim.gif" border="0" width="45" height="8" />Rev: <xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">1</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
      </td>
    </tr>
  </table>
</div>

<div align="left"  style="page-break-after:always;">
  <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
  <div>
    <div class="VerticalBarCodeDiv">
      <div class="VerticalBarCodeStatement">
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" />
        <br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"/>
        <br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage"/>
      </div>
      <div  class="VerticalBarCodeMRN">
        *MRN<xsl:value-of select="$PtMRN"/>*
      </div>
      <div  class="VerticalBarCodeDocType">
        <xsl:value-of select="$DocType"/>
      </div>
      <div  class="VerticalBarCodeAcctType">
        <xsl:value-of select="$AcctType"/>
      </div>
      <div  class="VerticalBarCodeDate">
        *<xsl:value-of select="Procedures[@RecordId=1]/ProcDateText"/>*
      </div>

    </div>
  </div>
  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
    <xsl:value-of select="$PrivacyHeader"/>
    <!--eForm Header: Demographics, Institution Symbol and Form name-->
    <xsl:call-template name="EformHeader"/>
    <!--Date and Physician Header
    <xsl:call-template name="EncounterDatePhysician"/>-->
    <tr>
      <td  class="FormOuterTableRow">
        <a name="DatePhysician_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td width="50%" height="10" align="left" valign="bottom" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcDateText','BiopsyOfProstateIndication')">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:&#160;<xsl:value-of select="Procedures[@RecordId=1]/ProcDateText"/>
            </td>
            <td width="50%" align="left" valign="bottom" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcSurgeon','BiopsyOfProstateIndication')">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Physician</span>:&#160;<xsl:value-of select="Procedures[@RecordId=1]/ProcSurgeon"/>
            </td>
          </tr>
        </table>
      </td>
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
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">
                Overall Assessment:
              </span>

              <xsl:for-each select="Diagnostics[not(@RecordId)]" >
                
                <xsl:choose>
                  <xsl:when test="((DxResult = 'Normal'))">
                    &#160;<input name="RadioYes_Assessment" type="Radio" id="RadioYes_Assessment" checked="Yes" />
                    &#160;<span class="blackBoldText">Normal</span>
                  </xsl:when>
                  <xsl:otherwise>
                    &#160;<input name="RadioYes_Assessment" type="Radio" id="RadioYes_Assessment" />
                    &#160;<span class="blackBoldText">Normal</span>
                  </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                  <xsl:when test="((DxResult = 'Abnormal'))">
                    &#160;<input name="RadioNo_Assessment" type="Radio" id="RadioNo_Assessment" checked="Yes" />
                    &#160;<span class="blackBoldText">Abnormal</span>
                  </xsl:when>
                  <xsl:otherwise>
                    &#160;<input name="RadioNo_Assessment" type="Radio" id="RadioNo_Assessment" />
                    &#160;<span class="blackBoldText">Abnormal</span>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
              
              
              
              
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <!--Ultrasound Report: Overall Assessment
    <xsl:call-template name="UltrasoundReport"/>-->
    <!--Prostate Size-->
    <xsl:call-template name="ProstateSize"/>
    <!--Ultrasound Clinical Stage-->
    <xsl:call-template name="UltrasoundClinStage"/>
    <!--Biopsy-->
    <!-- <xsl:call-template name="Biopsy"/> -->
    <tr>
      <td class="FormOuterTableRow">
        <a name="Biopsy_Anchor" />
        <table class="EFormTable" cellspacing="0" border="0">
          <tr class="EFormTableRow">
            <td colspan="3" class="FormInsideTableTopCell TRUSFormSectionHeading" >
              <img src="../../Images/shim.gif" width="4" height="1" />Biopsy
            </td>
          </tr>
          <tr>
            <xsl:value-of select="Procedures[@RecordId=1]/ProcDateText"/>
            
          </tr>
            <tr class="EFormTableRow">
              <td  colspan="3" class="FormInsideTableRegCell" style="padding: 0 0 0 0;">
                <table cellspacing="0" id="BiopsyTypesHTMLTable">
                  <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding','2')">
                    <td colspan="4">
                      <xsl:choose>
                        <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=2]/ProcFindDissection != '')">
                          <input name="CheckBoxUS" type="checkbox" id="CheckBoxUS" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBoxUS" type="checkbox" id="CheckBoxUS" />
                        </xsl:otherwise>
                      </xsl:choose>US guided (Systematic)&#160;&#160;#<xsl:choose>
                        <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=2]/ProcFinding != '')">
                          <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=2]/ProcFinding"  />
                        </xsl:when>
                        <xsl:otherwise>________</xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                  <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding','3')">
                    <td colspan="4">
                      <xsl:choose>
                        <xsl:when test="((Procedures[@RecordId=1]/ProcedureFinding[@RecordId=3]/ProcFindDissection != ''))">
                          <input name="CheckBox2TZ" type="checkbox" id="CheckBox2TZ" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBox2TZ" type="checkbox" id="CheckBox2TZ" />
                        </xsl:otherwise>
                      </xsl:choose>2 TZ biopsy
                    </td>
                  </tr>
                  <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding','4')">
                    <td colspan="4">
                      <xsl:choose>
                        <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=4]/ProcFindDissection != '')">
                          <input name="CheckBox2SV" type="checkbox" id="CheckBox2SV" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBox2SV" type="checkbox" id="CheckBox2SV" />
                        </xsl:otherwise>
                      </xsl:choose>2 SV biopsy
                    </td>
                  </tr>
                  <tr>
                    <th style="width: 25%">&#160;</th>
                    <th style="width: 25%">Location</th>
                    <th style="width: 25%"># Cores</th>
                    <th style="width: 25%">MRI Score</th>
                  </tr>
                  <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding','5')">
                    <td rowspan="2" style="border-bottom:none;">
                      <xsl:choose>
                        <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=5]/ProcFindDissection != '')">
                          <input name="CheckBoxMRIFusionGuidedBiopsy" type="checkbox" id="CheckBoxMRIFusionGuidedBiopsy" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBoxMRIFusionGuidedBiopsy" type="checkbox" id="CheckBoxMRIFusionGuidedBiopsy" />
                        </xsl:otherwise>
                      </xsl:choose>MRI-Fusion guided biopsy
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=5]/ProcFindSide"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=5]/ProcFindLaterality"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=5]/ProcFindSubsite"  />
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=5]/ProcFinding"  />&#160;
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=5]/ProcFindScore"  />&#160;
                    </td>
                  </tr>
                  <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding','6')">
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=6]/ProcFindSide"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=6]/ProcFindLaterality"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=6]/ProcFindSubsite"  />
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=6]/ProcFinding"  />&#160;
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=6]/ProcFindScore"  />&#160;
                    </td>
                  </tr>

                  <xsl:for-each select="Procedures[@RecordId=1]/ProcedureFinding">
                    <xsl:if test="(@RecordId = '7') or (@RecordId = '8') or (@RecordId = '9')">
                      <xsl:if test="(ProcFindDissection != '') or (ProcFinding != '') or (ProcFindScore != '')">
                        <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding',{@RecordId})">
                        <td style="border-top: none; border-bottom:none;">&#160;</td>
                        <td style="text-align: center;">
                          <xsl:value-of select="ProcFindSide"  />&#160;
                          <xsl:value-of select="ProcFindLaterality"  />&#160;
                          <xsl:value-of select="ProcFindSubsite"  />
                        </td>
                        <td style="text-align: center;">
                          <xsl:value-of select="ProcFinding"  />&#160;
                        </td>
                        <td style="text-align: center;">
                          <xsl:value-of select="ProcFindScore"  />&#160;
                        </td>
                      </tr>
                      </xsl:if>
                    </xsl:if>
                    
                  </xsl:for-each>

                  <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding','10')">
                    <td rowspan="2" style="border-bottom:none;">
                      <xsl:choose>
                        <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=10]/ProcFindDissection != '')">
                          <input name="CheckBoxVisuallyTargeted" type="checkbox" id="CheckBoxVisuallyTargeted" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBoxVisuallyTargeted" type="checkbox" id="CheckBoxVisuallyTargeted" />
                        </xsl:otherwise>
                      </xsl:choose>Visually Targeted biopsy
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=10]/ProcFindSide"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=10]/ProcFindLaterality"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=10]/ProcFindSubsite"  />
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=10]/ProcFinding"  />&#160;
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=10]/ProcFindScore"  />&#160;
                    </td>
                  </tr>
                  <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding','11')">
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=11]/ProcFindSide"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=11]/ProcFindLaterality"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=11]/ProcFindSubsite"  />
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=11]/ProcFinding"  />&#160;
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=11]/ProcFindScore"  />&#160;
                    </td>
                  </tr>

                  <xsl:for-each select="Procedures[@RecordId=1]/ProcedureFinding">
                    <xsl:if test="(@RecordId = '12') or (@RecordId = '13') or (@RecordId = '14')">
                      <xsl:if test="(ProcFindDissection != '') or (ProcFinding != '') or (ProcFindScore != '')">
                        <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding',{@RecordId})">
                          <td style="border-top: none; border-bottom:none;">&#160;</td>
                          <td style="text-align: center;">
                            <xsl:value-of select="ProcFindSide"  />&#160;
                            <xsl:value-of select="ProcFindLaterality"  />&#160;
                            <xsl:value-of select="ProcFindSubsite"  />
                          </td>
                          <td style="text-align: center;">
                            <xsl:value-of select="ProcFinding"  />&#160;
                          </td>
                          <td style="text-align: center;">
                            <xsl:value-of select="ProcFindScore"  />&#160;
                          </td>
                        </tr>
                      </xsl:if>
                    </xsl:if>
                  </xsl:for-each>

                  <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding','15')">
                    <td rowspan="2">
                      <xsl:choose>
                        <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=15]/ProcFindDissection != '')">
                          <input name="CheckBoxFingerGuided" type="checkbox" id="CheckBoxFingerGuided" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBoxFingerGuided" type="checkbox" id="CheckBoxFingerGuided" />
                        </xsl:otherwise>
                      </xsl:choose>Finger guided biopsy
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=15]/ProcFindSide"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=15]/ProcFindLaterality"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=15]/ProcFindSubsite"  />
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=15]/ProcFinding"  />&#160;
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=15]/ProcFindScore"  />&#160;
                    </td>
                  </tr>
                  <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding','16')">
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=16]/ProcFindSide"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=16]/ProcFindLaterality"  />&#160;
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=16]/ProcFindSubsite"  />
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=16]/ProcFinding"  />&#160;
                    </td>
                    <td style="text-align: center;">
                      <xsl:value-of select="Procedures[@RecordId=1]/ProcedureFinding[@RecordId=16]/ProcFindScore"  />&#160;
                    </td>
                  </tr>




                  <xsl:for-each select="Procedures[@RecordId=1]/ProcedureFinding">
                    <xsl:if test="(@RecordId = '17') or (@RecordId = '18') or (@RecordId = '19')">
                      <xsl:if test="(ProcFindDissection != '') or (ProcFinding != '') or (ProcFindScore != '')">
                        <tr class="clickable"  onclick="LoadComponentByTable('ProcedureFinding',{@RecordId})">
                          <td style="border-top: none; border-bottom:none;">&#160;</td>
                          <td style="text-align: center;">
                            <xsl:value-of select="ProcFindSide"  />&#160;
                            <xsl:value-of select="ProcFindLaterality"  />&#160;
                            <xsl:value-of select="ProcFindSubsite"  />
                          </td>
                          <td style="text-align: center;">
                            <xsl:value-of select="ProcFinding"  />&#160;
                          </td>
                          <td style="text-align: center;">
                            <xsl:value-of select="ProcFindScore"  />&#160;
                          </td>
                        </tr>
                      </xsl:if>
                    </xsl:if>
                  </xsl:for-each>
                  
                  
                  
                </table>
              </td>
            </tr>
          <!--
          <xsl:for-each select="NoTable">
            <tr class="EFormTableRow">
              <td  colspan="3" class="FormInsideTableRegCell" style="padding: 0 0 0 0;">
                <table cellspacing="0" id="BiopsyTypesHTMLTable">
                  <tr>
                    <td colspan="4">
                      <xsl:choose>
                        <xsl:when test="(US_GuidedSystematic != '')">
                          <input name="CheckBoxUS" type="checkbox" id="CheckBoxUS" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBoxUS" type="checkbox" id="CheckBoxUS" />
                        </xsl:otherwise>
                      </xsl:choose>US guided (Systematic)&#160;&#160;#<xsl:choose>
                        <xsl:when test="(US_GuidedSystematicNum != '')">
                          <xsl:value-of select="US_GuidedSystematicNum"  />
                        </xsl:when>
                        <xsl:otherwise>________</xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="4">
                      <xsl:choose>
                        <xsl:when test="(TZ_Biopsy != '')">
                          <input name="CheckBox2TZ" type="checkbox" id="CheckBox2TZ" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBox2TZ" type="checkbox" id="CheckBox2TZ" />
                        </xsl:otherwise>
                      </xsl:choose>2 TZ biopsy
                    </td>
                  </tr>
                  <tr>
                    <td colspan="4">
                      <xsl:choose>
                        <xsl:when test="(SV_Biopsy != '')">
                          <input name="CheckBox2SV" type="checkbox" id="CheckBox2SV" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBox2SV" type="checkbox" id="CheckBox2SV" />
                        </xsl:otherwise>
                      </xsl:choose>2 SV biopsy
                    </td>
                  </tr>
                  <tr>
                    <th style="width: 25%">&#160;</th>
                    <th style="width: 25%">Location</th>
                    <th style="width: 25%"># Cores</th>
                    <th style="width: 25%">MRI Score</th>
                  </tr>
                  <tr>
                    <td rowspan="2">
                      <xsl:choose>
                        <xsl:when test="(MRIFusionGuidedBiopsy != '')">
                          <input name="CheckBoxMRIFusionGuidedBiopsy" type="checkbox" id="CheckBoxMRIFusionGuidedBiopsy" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBoxMRIFusionGuidedBiopsy" type="checkbox" id="CheckBoxMRIFusionGuidedBiopsy" />
                        </xsl:otherwise>
                      </xsl:choose>MRI-Fusion guided biopsy
                    </td>
                    <td>
                      <xsl:value-of select="MRIFusionGuidedBiopsyLocation"  />&#160;
                    </td>
                    <td><xsl:value-of select="MRIFusionGuidedBiopsyNum"  />&#160;</td>
                    <td>
                      <xsl:value-of select="MRIFusionGuidedBiopsyMRIScore"  />&#160;
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <xsl:value-of select="MRIFusionGuidedBiopsyLocation2"  />&#160;
                    </td>
                    <td>
                      <xsl:value-of select="MRIFusionGuidedBiopsyNum2"  />&#160;
                    </td>
                    <td>
                      <xsl:value-of select="MRIFusionGuidedBiopsyMRIScore2"  />&#160;
                    </td>
                  </tr>
                  <tr>
                    <td rowspan="2">
                      <xsl:choose>
                        <xsl:when test="(VisuallyTargetedBiopsy != '')">
                          <input name="CheckBoxVisuallyTargeted" type="checkbox" id="CheckBoxVisuallyTargeted" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBoxVisuallyTargeted" type="checkbox" id="CheckBoxVisuallyTargeted" />
                        </xsl:otherwise>
                      </xsl:choose>Visually Targeted biopsy
                    </td>
                    <td><xsl:value-of select="VisuallyTargetedBiopsyLocation"  />&#160;</td>
                    <td>
                      <xsl:value-of select="VisuallyTargetedBiopsyBiopsyNum"  />&#160;
                    </td>
                    <td>
                      <xsl:value-of select="VisuallyTargetedBiopsyMRIScore"  />&#160;
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <xsl:value-of select="VisuallyTargetedBiopsyLocation2"  />&#160;
                    </td>
                    <td>
                      <xsl:value-of select="VisuallyTargetedBiopsyNum2"  />&#160;
                    </td>
                    <td>
                      <xsl:value-of select="VisuallyTargetedBiopsyMRIScore2"  />&#160;
                    </td>
                  </tr>
                  <tr>
                    <td rowspan="2">
                      <xsl:choose>
                        <xsl:when test="(FingerGuidedBiopsy != '')">
                          <input name="CheckBoxFingerGuided" type="checkbox" id="CheckBoxFingerGuided" checked="checked" />
                        </xsl:when>
                        <xsl:otherwise>
                          <input name="CheckBoxFingerGuided" type="checkbox" id="CheckBoxFingerGuided" />
                        </xsl:otherwise>
                      </xsl:choose>Finger guided biopsy
                    </td>
                    <td>
                      <xsl:value-of select="FingerGuidedBiopsyLocation"  />&#160;
                    </td>
                    <td>
                      <xsl:value-of select="FingerGuidedBiopsyNum"  />&#160;
                    </td>
                    <td>&#160;</td>
                  </tr>
                  <tr>
                    <td>
                      <xsl:value-of select="FingerGuidedBiopsyLocation"  />&#160;
                    </td>
                    <td>
                      <xsl:value-of select="FingerGuidedBiopsyNum"  />&#160;
                    </td>
                    <td>&#160;</td>
                  </tr>
                </table>
              </td>
            </tr>
          </xsl:for-each> -->
        </table>
      </td>
    </tr>
    <!--Prostate Contour-->
    <xsl:call-template name="Contour"/>
    <!--Post Procedure Instructions-->
    <xsl:call-template name="PostProcInstructions"/>
    <!--Attendin Presence Verification-->
    <xsl:call-template name="AttendingPresence"/>
    <!--Signature/Title and Date/Time-->
    <xsl:call-template name="SignatureDate"/>
    <!--Disposition-->
    <xsl:call-template name="Disposition"/>
    <!--Signature/Title and Date/Time-->
    <xsl:call-template name="SignatureDate"/>
    <!--Footer-->
    <tr class="FormOuterTableRow">
      <td height="14" align="center" valign="bottom" class="blackBoldText">
        <xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" /><xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
        <img src="../../Images/shim.gif" border="0" width="45" height="8" />Rev: <xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">2</span> of <span id="TotalPages">2</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
      </td>
    </tr>
  </table>
</div>
</xsl:template>

</xsl:stylesheet> 

