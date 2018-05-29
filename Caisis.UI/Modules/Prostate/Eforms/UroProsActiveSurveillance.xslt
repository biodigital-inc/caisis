<!-- <?xml version="1.0" encoding="UTF-8"?>-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  
  <!--Parameters-->
  <xsl:param name="CombinedBiopsies_ProstateAS" />
  <xsl:param name="CombinedFamilyMembers" />
  <xsl:param name="CombinedSocialHistories" />
  <xsl:param name="CombinedAllergies" />
  <xsl:param name="ActiveSurveillanceLabs" />
  <xsl:param name="CombinedComorbidities" />
  <xsl:param name="CombinedProcedures" />
  <xsl:param name="CombinedQOLTherapies" />
  <xsl:param name="ActiveSurveillanceRectalExamHistory" />
  <xsl:param name="ProstateBiopsyActiveSurveillanceRows" />
  <xsl:param name="CombinedProstateMRI" />



  <!--Variables-->
  <!--Barcode Variables-->
  <xsl:variable name="DocType">*U54*</xsl:variable>
  <xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>
  <xsl:variable name="ReportTitle">Urology Prostate Active Surveillance</xsl:variable>
  <!--Footer Variables-->
  <xsl:variable name="DocNumber">47</xsl:variable>
  <xsl:variable name="DocAssignment">54</xsl:variable>
  <xsl:variable name="ApprovalDate">6/17/2014</xsl:variable>
  <xsl:variable name="RevisedDate">02/03/15</xsl:variable>
  <!--Please Note: The footer cannot be implemented as a template until Jason's new page counting information is added
<xsl:variable name="PageNumber">X of Y</xsl:variable>-->

  <!--Header Variables-->
  <!--ToDo: Use institution Short Name From Web Config-->
  <xsl:variable name="InstitutionShortName">MSKCC</xsl:variable>

  <xsl:include href="../../../Core/Eforms/EFormTemplateLibrary.xslt" />
  <xsl:template match="eform">

    <style type="text/css">
      .EFormTable {	padding:0px 0px 0px 0px;

      width:100%;
      }
      .EFormTableRow {	background-color: #ffffff;
      }

      table#ProstateBiopsyScores
      {
      width: 100%;
      }
      table#ProstateBiopsyScores td
      {
      padding: 13px 4px;
      text-align: left;
      width: 30%;
      }
      span.ActiveSurveillanceNotes
      {
      color: #666666;
      font-size: smaller;
      display: block;
      padding-left: 10px;
      }
      span.ActiveSurveillanceNotes span.noteTitle
      {
      font-weight: bold;
      }
      span.ActiveSurveillanceNotes table
      {
      border: solid 1px #666666;
      border-collapse: collapse;

      }
      span.ActiveSurveillanceNotes table td
      {
      color: #666666;
      font-size: smaller;
      text-align: left;
      font-weight: normal;
      padding: 2px 15px;
      }
      span.ActiveSurveillanceNotes table td.labelCol { border-left: solid 1px #666666; }

      table.PaperFormDataTable
      {
      border: solid 1px #666666;
      border-collapse: collapse;
      border-spacing: 0;
      width: 100%;
      }
      table.PaperFormDataTable td
      {
      border: solid 1px #666666;
      padding: 1px;
      text-align: center;
      }

      table.PageBreakable
      {
      table-layout: fixed;
      }
      table.PaperFormDataTable tr:last-child td
      {
      border-bottom: none;
      }

      table#IPSSTable
      {
      border-collapse: collapse;
      width: 100%;
      }
      table#IPSSTable th
      {
      border: solid 1px #666666;
      font-size: smaller;
      padding: 2px 3px;
      }
      table#IPSSTable td
      {
      border: solid 1px #666666;
      padding: 2px 3px;
      text-align: center;
      font-size: smaller;
      font-weight: bold;
      }
      table.ActiveSurveillancePSATable
      {

      }
      table.ActiveSurveillancePSATable td { border-bottom: none; }
      table.ActiveSurveillancePSATable td:nth-child(1) { width: 15%; padding: 5px 1px; }
      table.ActiveSurveillancePSATable td:nth-child(2) { width: 12%; }
      table.ActiveSurveillancePSATable td:nth-child(3) { width: 13%; }
      table.ActiveSurveillancePSATable td:nth-child(4) { width: 9%; }
      table.ActiveSurveillancePSATable td:nth-child(5) { width: 9%; }
      table.ActiveSurveillancePSATable td:nth-child(6) { width: 9%; }
      table.ActiveSurveillancePSATable td:nth-child(7) { width: 9%; }
      table.ActiveSurveillancePSATable td:nth-child(8) { width: 8%; }
      table.ActiveSurveillancePSATable td:nth-child(9) { width: 8%; }
      table.ActiveSurveillancePSATable td:nth-child(10) { width: 8%; }



      .clickable
      {
      cursor: pointer;
      }

      .clickable:hover
      {
      background-color: #e7d1c8;
      color: #000000;
      }
      span.ProstateQOLAnswer
      {
      border-bottom: solid 1px #000000;
      width: 20px;
      display: inline-block;
      }
    </style>




    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td style="text-align:center; font-size: smaller;">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY</td></tr>
        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <xsl:call-template name="EncounterDatePhysician"/>
        <!--Referring MD Row-->
        <xsl:call-template name="ReferringMD"/>
        <tr>
          <td class="FormOuterTableRow" onmouseover="this.className='FormOuterTableRow chronListHilighted';" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByField('EncChiefComplaint')">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
              <tr>
                <td height="50" align="left" valign="top" class="blackBoldText" style="padding: 2px 0px 0px 4px;">
                  Chief Complaint
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
            </table>
          </td>
        </tr>
          <tr>
            <td height="130" valign="top" class="FormOuterTableRow ">
              <img src="../../Images/shim.gif" border="0" width="4" height="12" />
              <span class="blackBoldText">HPI</span><br/>
              <xsl:value-of select="$Hpi" disable-output-escaping="yes"/>
            </td>
          </tr>
          <tr>
            <td class="FormOuterTableTopRow" valign="bottom"  style="padding: 2px;" >
              <table cellspacing="0" cellpadding="0" style="width: 100%;">
                <tr>
                  <td style="width: 250px; padding: 20px 4px 4px 4px;" class="clickable" onclick="LoadComponentByField('DiagnosisDateText', 'ProstateHPIActiveSurveillance')">
                    Dx Date:
<span id="ctl00_DxDateLabel"><xsl:choose>
                      <xsl:when test="(NoTable/DiagnosisDateText != '')">
                        <span style="text-decoration: underline;">
                          &#160;<xsl:value-of select="NoTable/DiagnosisDateText"/>&#160;
                        </span>
                      </xsl:when>
                      <xsl:otherwise>
                        ___________________
                      </xsl:otherwise>
                    </xsl:choose></span>
                  </td>
                  <td style="padding: 20px 4px 4px 4px;" class="clickable" onclick="LoadComponentByField('ActiveSurveillanceDateText', 'ProstateHPIActiveSurveillance')">
                    Active Surveillance Date: <span id="ctl00_ASDateLabel">
                      <xsl:choose>
                        <xsl:when test="(NoTable/ActiveSurveillanceDateText != '')">
                          <span style="text-decoration: underline;">
                            &#160;<xsl:value-of select="NoTable/ActiveSurveillanceDateText"/>&#160;
                          </span>
                        </xsl:when>
                        <xsl:otherwise>
                          ___________________
                        </xsl:otherwise>
                      </xsl:choose>
                    </span>
                  </td>
                </tr>
              </table>
            </td>
          </tr>



        <tr>
          <td class="FormOuterTableTopRow clickable" style="padding: 2px 4px; height: 40px; vertical-align: top;" onclick="LoadComponentByField('HPI_AddedText')">
            <span  class="blackBoldText" style="display: block; margin-bottom: 5px;">Interval History</span>

            <xsl:value-of select="NoTable/HPI_AddedText"/>
            
            
          </td>
        </tr>      
        
        
        
        
        
        <tr>
          <td class="FormOuterTableRow">

            <style type="text/css">

              img.first-msk
              {
              width: 6px;
              height: 9px;
              border: none;
              margin-right: 3px;
              display: none;
              }


              tr.local-institution img.first-msk
              {
              display: inline;
              }
              tr.local-institution td
              {
              font-weight: bold;
              }
              table.BiopsyCoresPopDataTable
              {
              width: 100%;
              border-collapse: collapse;
              table-layout: fixed;
              }
              table.BiopsyCoresPopDataTable td
              {
              text-align: center;
              border: solid 1px #666666;
              padding: 1px;
              }
              table.BiopsyCoresPopDataTable th
              {
              text-align: center;
              border: solid 1px #666666;
              padding: 1px;
              font-weight: bold;
              }
              .inputFieldFlat
              {
              border: solid 1px #666666;
              text-align: center;
              }
            </style>

            <span class="blackBoldText">
              <img src="../../Images/shim.gif" border="0" width="4" height="0"/>Biopsy History&#160;&#160;&#160;&#160;&#160;&#160;&#160;
            </span><br/>
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



        <xsl:value-of select="$ProstateBiopsyActiveSurveillanceRows" disable-output-escaping="yes"/>

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
        <tr>
          <td class="FormOuterTableRow clickable" onmouseover="this.className='FormOuterTableRow clickable chronListHilighted';" onmouseout="this.className='FormOuterTableRow clickable'" onclick="LoadComponentByTable('Pathology','')">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td style="width: 13%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableRegCell">&#160;</td>
                <td style="width: 15%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableRegCell">&#160;</td>
                <td style="width: 22%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableRegCell">&#160;</td>
                <td style="width: 10%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableRegCell">&#160; </td>
                <td style="width: 40%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableRegCell">&#160;</td>
              </tr>
            </table>
          </td>
        </tr>

        
        
        
        
        

        <tr>
            <td class="FormOuterTableRow">
                <span class="blackBoldText">
                <img src="../../Images/shim.gif" border="0" width="4" height="0" />Biochemical Markers/Lab Tests
              </span>
              <table width="100%" border="0" cellpadding="1" cellspacing="0" class="PaperFormDataTable PageBreakable ActiveSurveillancePSATable">
                <tr >
                  <td  >Date</td>
                  <td  >PSA</td>
                  <td  >PSA Density</td>
                  <td  >Prolaris Score</td>
                  <td  >Prolaris AUA</td>
                  <td  >Oncotype GPS</td>
                  <td  >Oncotype Path</td>
                  <td  >PCA3</td>
                  <td  >PHI</td>
                  <td  >4K</td>
                </tr>
              </table>
            </td>
          </tr>



        <xsl:for-each select="$ActiveSurveillanceLabs/ASLabTests">
          <xsl:choose>
            <xsl:when test="(@IsDB = 'true')">

              <tr>
                <td class="FormOuterTableRow" style="border-bottom: none;">
                  <table width="100%" border="0" cellpadding="1" cellspacing="0" class="PaperFormDataTable PageBreakable ActiveSurveillancePSATable">
                    <tr>
                      <td >
                        <xsl:value-of select="LabDateText"/>
                      </td>
                      <td class="clickable"  onclick="LoadDataEntryForm('LabTests', {./PSAId}, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality,LabNotes')">
                        <xsl:value-of select="PSA"/>&#160;</td>
                      <td class="clickable"  onclick="LoadDataEntryForm('LabTests', {./PSAId}, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality,LabNotes')">
                        <xsl:value-of select="PSADT"/>&#160;
                      </td>
                      <td class="clickable"  onclick="LoadDataEntryForm('LabTests', {./ProlarisScoreId}, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality,LabNotes')">
                        <xsl:value-of select="ProlarisScore"/>&#160;
                      </td>
                      <td class="clickable"  onclick="LoadDataEntryForm('LabTests', {./ProlarisScoreId}, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality,LabNotes')">
                        <xsl:value-of select="ProlarisAUA"/>&#160;
                      </td>
                      <td class="clickable"  onclick="LoadDataEntryForm('LabTests', {./OncotypeGPSId}, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality,LabNotes')">
                        <xsl:value-of select="OncotypeGPS"/>&#160;
                      </td>
                      <td class="clickable"  onclick="LoadDataEntryForm('LabTests', {./OncotypeGPSId}, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality,LabNotes')">
                        <xsl:value-of select="OncotypePath"/>&#160;
                      </td>
                      <td class="clickable"  onclick="LoadDataEntryForm('LabTests', {./UPCA3Id}, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality,LabNotes')">
                        <xsl:value-of select="UPCA3"/>&#160;
                      </td>
                      <td class="clickable"  onclick="LoadDataEntryForm('LabTests', {./PHIId}, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality,LabNotes')">
                        <xsl:value-of select="PHI"/>&#160;
                      </td>
                      <td class="clickable"  onclick="LoadDataEntryForm('LabTests', {./FourKId}, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality,LabNotes')">
                        <xsl:value-of select="FourK"/>&#160;
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </xsl:when>

          </xsl:choose>
        </xsl:for-each>
        
        
        
        
        
        
        
        

          <tr>
            <td class="FormOuterTableRow" style="border-bottom: none;">
              <table width="100%" border="0" cellpadding="1" cellspacing="0" class="PaperFormDataTable PageBreakable ActiveSurveillancePSATable">
                <tr>
                  <td >/&#160;&#160;&#160;&#160;&#160;&#160;&#160;/</td>
                  <td >&#160;</td>
                  <td ></td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td class="FormOuterTableRow" style="border-bottom: none;">
              <table width="100%" border="0" cellpadding="1" cellspacing="0" class="PaperFormDataTable PageBreakable ActiveSurveillancePSATable">
                <tr>
                  <td >/&#160;&#160;&#160;&#160;&#160;&#160;&#160;/</td>
                  <td >&#160;</td>
                  <td ></td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                  <td >&#160;</td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td class="FormOuterTableRow"><a name="MRIHistory"/>
              <span class="blackBoldText" style="margin-left: 4px;">MRI History</span>
              <table class="PaperFormDataTable" cellspacing="0" cellpadding="0" border="0">
                <tr >
                  <td style="width: 15%;">Date</td>
                  <td style="width: 15%;">Side</td>
                  <td style="width: 25%;">Site</td>
                  <td style="width: 45%;">Probability</td>
                </tr>

                <xsl:for-each select="$CombinedProstateMRI/Diagnostics/DxImageFindings">
                  <xsl:choose>
                    <xsl:when test="(../@IsDB = 'true')">
                      <tr class="clickable"  onclick="LoadDataEntryForm('Diagnostics', {../DiagnosticId}, 'DxDateText,DxDate,DxType,DxTarget,DxSite,DxNotes'), 'MRIHistory','DxImageFindings'">
                          <td style="height: 24px;" >
                            <xsl:value-of select="../DxDateText"  />&#160;
                          </td>
                          <td class="FormInsideTableRegCell"><xsl:value-of select="ImgFindSide"  />&#160;
                          </td>
                          <td class="FormInsideTableRegCell">
                            <xsl:value-of select="ImgFindSubsite"  />&#160;
                          </td>
                          <td class="FormInsideTableRegCell">
                            <xsl:value-of select="ImgFindResult"  />&#160;
                          </td>
                      </tr>
                    </xsl:when>
                    <xsl:when test="(../@IsDB = 'false') and (../DxType = 'MRI')">
                      <tr class="clickable"  onclick="LoadComponentByTable('Diagnostics',{../@RecordId})">
                          <td style="height: 24px;" >
                            <xsl:value-of select="../DxDateText"  />&#160;
                          </td>
                          <td class="FormInsideTableRegCell">
                            <xsl:value-of select="ImgFindSide"  />&#160;
                          </td>
                          <td class="FormInsideTableRegCell">
                            <xsl:value-of select="ImgFindSubsite"  />&#160;
                          </td>
                          <td class="FormInsideTableRegCell">
                            <xsl:value-of select="ImgFindResult"  />&#160;
                          </td>
                        </tr>                      
                        </xsl:when>
                  </xsl:choose>
                </xsl:for-each>

                <tr class="clickable"  onclick="LoadComponentByTable('Diagnostics','')">
                  <td style="height: 24px;" >&#160;</td>
                  <td class="FormInsideTableRegCell">&#160;</td>
                  <td class="FormInsideTableRegCell">&#160;</td>
                  <td class="FormInsideTableRegCell">&#160;</td>
                </tr>


              </table>

            </td>
          </tr>

          <tr>
            <td valign="top" class="FormOuterTableRow">
              <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td >
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td colspan="2" class="FormInnerRowBottomBorder">
                          <span class="blackBoldText" style="margin-left: 4px;">Allergies</span>&#160;&#160;&#160;&#160;&#160;&#160;&#160;<span>
                            <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes" />
                              NKA&#160;&#160;
                              <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes" />
                    Unchanged Since Last Visit</span>
                        </td>
                      </tr>
                      <tr align="center">
                        <td width="40%" class="FormInsideTableRegCell">Allergen</td>
                        <td class="FormInsideTableRegCell">Reaction</td>
                      </tr>


                      <xsl:for-each select="$CombinedAllergies/Allergies">
                        <xsl:choose>
                          <xsl:when test="(@IsDB = 'true')">

                            <tr class="clickable"  onclick="LoadDataEntryForm('Allergies', {./AllergyId}, 'Allergen,AllergyResponse')">
                              <td class="FormInsideTableRegCell" style="height:25px;">
                                <xsl:value-of select="Allergen"  />&#160;
                              </td>
                              <td class="FormInsideTableRegCell">
                                <xsl:value-of select="AllergyResponse"  />&#160;
                              </td>
                            </tr>
                          </xsl:when>
                          <xsl:when test="(@IsDB = 'false') and (Allergen != '')">
                            <tr class="clickable" onclick="LoadComponentByTable('Allergies',{./@RecordId})">
                              <td class="FormInsideTableRegCell" style="height:25px;">
                                <xsl:value-of select="Allergen"  />&#160;
                              </td>
                              <td class="FormInsideTableRegCell">
                                <xsl:value-of select="AllergyResponse"  />&#160;
                              </td>
                            </tr>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>

                      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Allergies','')">
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                      </tr>

                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

        <tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td style="height: 100px; vertical-align: top; padding: 4px;">
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
                  <span  class="EFormTableRow" title="Add Comorbidity" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('Comorbidities','')" >&#160;</span>
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
                  <span  class="EFormTableRow" title="Add Surgical Procedure" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('Procedures','')" >&#160;</span>
                </td>
              </tr>
            </table>
          </td>
        </tr>





        <tr >
            <td height="14" align="center" valign="bottom" class="blackBoldText">
              GU47<img src="../../Images/shim.gif" border="0" width="45" height="1" />
              U54<img src="../../Images/shim.gif" border="0" width="45" height="1" />
              CMIC
              Approval Date: 6/17/2014<img src="../../Images/shim.gif" border="0" width="45" height="8"/>rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="8" />
              Page <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
            </td>
          </tr>
        </table>
      </div>


    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td style="text-align:center; font-size: smaller;">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY</td></tr>


        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <xsl:call-template name="EncounterDatePhysician"/>


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
                            <td  valign="middle" >
                              <xsl:value-of select="SocHxOccupation"  />&#160;
                            </td>

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












        <!--Review of Systems-->
        <xsl:call-template name="ROS_Table"/>
        <!--
          <tr>
            <td class="FormOuterTableRow">
              <img src="../../Images/shim.gif" border="0" width="4" height="0" />
              <span class="blackBoldText">Review of Systems</span>&#160;&#160;&#160;<span class="smallGrayText">
                Clinician
                Performing Review:
                <input type="checkbox" name="PA22" value="Yes"/>
                  RN&#160;&#160;&#160;
                  <input type="checkbox" name="PA3" value="Yes"/>
                    PA/NP&#160;&#160;&#160;
                    <input type="checkbox" name="Fellow3" value="Yes"/>
                      Fellow&#160;&#160;&#160;
                      <input type="checkbox" name="Attending3" value="Yes"/>
        Attending</span>
              <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" >
                <tr>
                  <td align="center" class="FormInsideTableTopCell">
                    <strong>System</strong>
                  </td>
                  <td align="center" class="FormInsideTableTopCell">
                    <strong>Symptom</strong>
                  </td>
                  <td align="center" class="FormInsideTableTopCell">
                    <strong>
                      Not<br/>
                      Present
                    </strong>
                  </td>
                  <td align="center" class="FormInsideTableTopCell">
                    <strong>Present</strong>
                  </td>
                  <td align="center" class="FormInsideTableTopCell">
                    <strong>
                      Disease<br/>
                      Related
                    </strong>
                  </td>
                  <td width="50%" align="center" class="FormInsideTableTopCell">
                    <strong>Notes</strong>
                  </td>
                </tr>
                <tr>
                  <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />Gen&#160;
                  </td>
                  <td height="20" align="left" class="FormInsideTableRegCell">Fatigue</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                  <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&#160;</td>
                </tr>
                <tr>
                  <td height="20" align="left" class="FormInsideTableRegCell">Fever</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />Skin&#160;
                  </td>
                  <td height="20" align="left" class="FormInsideTableRegCell">Wounds</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                  <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&#160;</td>
                </tr>
                <tr>
                  <td height="20" align="left" class="FormInsideTableRegCell">
                    Breast
                    Pain
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />Resp&#160;
                  </td>
                  <td height="20" align="left" class="FormInsideTableRegCell">Cough</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                  <td rowspan="2" class="FormInnerRowBottomBorder">&#160;</td>
                </tr>
                <tr>
                  <td height="20" align="left" class="FormInsideTableRegCell">Dyspnea</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />CV&#160;
                  </td>
                  <td height="20" align="left" class="FormInsideTableRegCell"> Edema</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                  <td rowspan="2" class="FormInnerRowBottomBorder">&#160;</td>
                </tr>
                <tr>
                  <td height="20" align="left" class="FormInsideTableRegCell">
                    Chest
                    Pain
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />GI&#160;
                  </td>
                  <td height="20" align="left" class="FormInsideTableRegCell">Dyspepsia</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                  <td rowspan="2" class="FormInnerRowBottomBorder">&#160;</td>
                </tr>
                <tr>
                  <td height="20" align="left" class="FormInsideTableRegCell">Diarrhea</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />GU&#160;
                  </td>
                  <td height="20" align="left" class="FormInsideTableRegCell">Obstruction</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                  <td rowspan="5" class="FormInnerRowBottomBorder">&#160;</td>
                </tr>
                <tr>
                  <td height="20" align="left" class="FormInsideTableRegCell">Hematuria</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td height="20" align="left" class="FormInsideTableRegCell">Dysuria</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td height="20" align="left" class="FormInsideTableRegCell">Frequency</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td height="20" align="left" class="FormInsideTableRegCell">
                    Penile
                    Pain/Curvature/Length
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td rowspan="1" align="left" valign="top" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />Psych&#160;
                  </td>
                  <td height="20" align="left" class="FormInsideTableRegCell">Depression</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                  <td class="FormInnerRowBottomBorder">&#160;</td>
                </tr>
                <tr>
                  <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell">
                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />Neuro&#160;
                  </td>
                  <td height="20" align="left" class="FormInsideTableRegCell">Numbness/Tingling</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                  <td rowspan="2" class="FormInnerRowBottomBorder">&#160;</td>
                </tr>
                <tr>
                  <td height="20" align="left" class="FormInsideTableRegCell">Headaches</td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td align="left" valign="top" class="FormInnerRowRightBorder">
                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />
                    Other:<br/>
                    <img src="../../Images/shim.gif" border="0" width="0" height="6" />
                  </td>
                  <td height="20" align="left" valign="top" class="FormInnerRowRightBorder">&#160;</td>
                  <td align="center" class="FormInnerRowRightBorder">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="center" class="FormInnerRowRightBorder">
                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                  </td>
                  <td align="left" valign="top" class="FormInnerRowRightBorder">&#160;</td>
                  <td valign="top">&#160;</td>
                  <td align="left" valign="top">&#160;</td>
                </tr>
              </table>
            </td>
          </tr>
-->  
        
        
          <tr>
            <td class="FormOuterTableRow">
              <table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td colspan="4" class="FormInnerRowBottomBorder">
                    <strong>Prostate QOL Survey</strong>
                  </td>
                </tr>
                <tr>
                  <td class="FormInnerRowRightBorder blackBoldTextSmall">Sexual</td>
                  <td class="FormInnerRowRightBorder blackBoldTextSmall">Urinary</td>
                  <td class="FormInnerRowRightBorder blackBoldTextSmall">Bowel</td>
                  <td class="blackBoldTextSmall">General</td>
                </tr>
                <tr>
                  <td height="35" valign="top" class="FormInnerRowRightBorder" style="padding-top:11px;">
                    <span class="smallGrayText" style="color: #000000;">
                      Q1:<span class="ProstateQOLAnswer">&#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=1]/SurveyItemResult"/></span>&#160;Q2:<span class="ProstateQOLAnswer">&#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=2]/SurveyItemResult"/></span>&#160;&#160;Q3:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=3]/SurveyItemResult"/>
                    </span>&#160;&#160;Q4:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=4]/SurveyItemResult"/>
                    </span>&#160;Q5:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=5]/SurveyItemResult"/>
                    </span>&#160;&#160;Q6:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=6]/SurveyItemResult"/>
                    </span>&#160;&#160;Q7:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=7]/SurveyItemResult"/>
                    </span><br />
                      <!--<span id="ctl00_LastUrinaryQOLScores"></span>-->
        <span id="ctl00_UrinaryQOL" class="blackBoldTextSmall"></span>
                    </span>
                  </td>
                  <td valign="top" class="FormInnerRowRightBorder" style="padding-top:11px;">
                    <span class="smallGrayText" style="color: #000000;">Q1:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=8]/SurveyItemResult"/>
                    </span>&#160;Q2:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=9]/SurveyItemResult"/>
                    </span>&#160;&#160;Q3:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=10]/SurveyItemResult"/>
                    </span>&#160;&#160;Q4:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=11]/SurveyItemResult"/>
                    </span>&#160;Q5:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=12]/SurveyItemResult"/>
                    </span>
                  </span>
                    <br />
                    <!--<span id="ctl00_LastSexualQOLScores" class="blackBoldTextSmall"></span>-->
                    <span id="ctl00_SexualQOL" class="blackBoldTextSmall"></span>
                  </td>
                  <td valign="top" class="FormInnerRowRightBorder" style="padding-top:11px;">
                    <span class="smallGrayText" style="color: #000000;">Q1:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=13]/SurveyItemResult"/>
                    </span>&#160;Q2:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=14]/SurveyItemResult"/>
                    </span>
                  </span>
                  </td>
                  <td valign="top" style="padding-top:11px;">
                    <span class="smallGrayText" style="color: #000000;">Q1:<span class="ProstateQOLAnswer">
                      &#160; <xsl:value-of select="Surveys[@RecordId=1]/SurveyItems[@RecordId=15]/SurveyItemResult"/>
                    </span>
                  </span>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td class="FormOuterTableRow">
              <table style="table-layout: fixed; width: 100%;" cellspacing="0" cellpadding="0" >
                <tr>
                  <td style="width: 24%; border-right: solid 1px #000000; vertical-align: top; padding: 0 0 0 0;">
                    <span class="blackBoldText" style="display: block; padding: 7px 4px 4px 4px;">IPSS</span>
                    <table id="IPSSTable" cellspacing="0" >
                      <tr>
                        <th>Question</th>
                        <th>Score (1-5)</th>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>
                          <xsl:value-of select="Surveys[@RecordId=101]/SurveyItems[@RecordId=101]/SurveyItemResult"/>&#160;</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>
                          <xsl:value-of select="Surveys[@RecordId=101]/SurveyItems[@RecordId=102]/SurveyItemResult"/>&#160;</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>
                          <xsl:value-of select="Surveys[@RecordId=101]/SurveyItems[@RecordId=103]/SurveyItemResult"/>&#160;</td>
                      </tr>
                      <tr>
                        <td>4</td>
                        <td>
                          <xsl:value-of select="Surveys[@RecordId=101]/SurveyItems[@RecordId=104]/SurveyItemResult"/>&#160;</td>
                      </tr>
                      <tr>
                        <td>5</td>
                        <td>
                          <xsl:value-of select="Surveys[@RecordId=101]/SurveyItems[@RecordId=105]/SurveyItemResult"/>&#160;</td>
                      </tr>
                      <tr>
                        <td>6</td>
                        <td>
                          <xsl:value-of select="Surveys[@RecordId=101]/SurveyItems[@RecordId=106]/SurveyItemResult"/>&#160;</td>
                      </tr>
                      <tr>
                        <td>7</td>
                        <td>
                          <xsl:value-of select="Surveys[@RecordId=101]/SurveyItems[@RecordId=107]/SurveyItemResult"/>&#160;</td>
                      </tr>
                      <tr>
                        <td>Total</td>
                        <td>
                          <xsl:value-of select="Surveys[@RecordId=101]/SurveyResult"/>&#160;</td>
                      </tr>
                    </table>
                  </td>
                  <td style="vertical-align: top; width: 76%;">
                    <span class="blackBoldText" style="display: block; padding: 7px 4px 4px 4px;">TX for Erectile Dysfunction (that apply):</span>
                    <table style="width: 100%;" align="center" border="0" cellpadding="0" cellspacing="0" >
                      <tr>
                        <td class="FormInsideTableTopLeftCell">&#160;</td>
                        <td align="center" class="FormInsideTableTopCell">Start Date</td>
                        <td align="center" class="FormInsideTableTopCell">Stop Date</td>
                      </tr>





                      <xsl:for-each select="$CombinedQOLTherapies/QOL_Therapy">
                        <xsl:choose>
                          <xsl:when test="(@IsDB = 'true')">
                            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('QOL_Therapy', {./ProcedureId}, 'QOL_Therapy,QOL_TxDateText,QOL_TxDate,QOL_TxStopDateText,QOL_TxStopDate,QOL_TxIndication,QOL_TxNotes')">
                              <td height="26" class="FormInsideTableLeftCell">
                                &#160; <xsl:value-of select="QOL_Therapy"  />
                              </td>
                              <td class="FormInsideTableRegCell" style="text-align: center;">
                                <xsl:value-of select="QOL_TxDateText"  />&#160;
                              </td>
                              <td class="FormInsideTableRegCell" style="text-align: center;">
                                <xsl:value-of select="QOL_TxStopDateText"  />&#160;
                              </td>
                            </tr>                            
                            
                          </xsl:when>
                          <xsl:when test="(@IsDB = 'false') and ((QOL_TxDateText != '') or (QOL_TxStopDateText != '') or (QOL_Therapy != ''))">
                            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('QOL_Therapy',{./@RecordId})">
                              <td height="26" class="FormInsideTableLeftCell">
                                &#160; <xsl:value-of select="QOL_Therapy"  />
                              </td>
                              <td class="FormInsideTableRegCell" style="text-align: center;">
                                <xsl:value-of select="QOL_TxDateText"  />&#160;
                              </td>
                              <td class="FormInsideTableRegCell" style="text-align: center;">
                                <xsl:value-of select="QOL_TxStopDateText"  />&#160;
                              </td>
                            </tr>                          </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>
                      
                      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('QOL_Therapy','')">
                        <td height="26" class="FormInsideTableLeftCell">&#160;</td>
                        <td class="FormInsideTableRegCell" style="text-align: center;">&#160;</td>
                        <td class="FormInsideTableRegCell" style="text-align: center;">&#160;
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr >
            <td height="44" valign="bottom" class="FormOuterTableRow">
              &#160; <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes"/>
                <span class="blackBoldText">
                  PFSH and ROS performed by:  _____________________________<img src="../../Images/shim.gif" border="0" width="40" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;">
                    <img src="../../Images/shim.gif" border="0" width="15" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span>
                  </span>
                </span>
              </td>
          </tr>
          <tr >
            <td height="14" align="center" valign="bottom" class="blackBoldText">
              GU47<img src="../../Images/shim.gif" border="0" width="45" height="1" />
              U54<img src="../../Images/shim.gif" border="0" width="45" height="1" />
              CMIC
              Approval Date: 6/17/2014<img src="../../Images/shim.gif" border="0" width="45" height="8"/>rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="8" />
              Page <span id="PageNumber">2</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
            </td>
          </tr>
        </table>
      </div>


    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td style="text-align:center; font-size: smaller;">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY</td></tr>


        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <xsl:call-template name="EncounterDatePhysician"/>


        <tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0"  style="width: 100%;" cellpadding="4" cellspacing="0">
              <tr>
                <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder">
                  <span class="blackBoldText">
                    Vital
                    Signs
                  </span>
                </td>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />BP:&#160;&#160;<strong>
                    <xsl:value-of select="Encounters/EncSystolic"/>
                    <xsl:if test="((Encounters/EncSystolic != '') or (Encounters/EncDiastolic != ''))">&#160;/&#160;</xsl:if>
                    <xsl:value-of select="Encounters/EncDiastolic"/>
                  </strong>
                </td>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Pulse:&#160;&#160;<strong>
                    <xsl:value-of select="Encounters/EncPulse"/>
                  </strong>
                </td>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Temp:&#160;&#160;<strong>
                    <xsl:value-of select="Encounters/EncTemp"/>
                  </strong>
                </td>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Resp:&#160;&#160;<strong>
                    <xsl:value-of select="Encounters/EncRespiration"/>
                  </strong>
                </td>
              </tr>
              <tr>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />KPS:&#160;&#160;<strong>
                    <xsl:value-of select="Encounters/EncKPS"/>
                  </strong>
                </td>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Height:&#160;&#160;<strong>
                    <xsl:value-of select="Encounters/EncHeight"/>
                  </strong>
                </td>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Weight:&#160;&#160;<strong>
                    <xsl:value-of select="Encounters/EncWeight"/>
                  </strong>
                </td>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />BSA:&#160;&#160;<strong>
                    <xsl:value-of select="Encounters/EncBSA"/>
                  </strong>
                </td>
              </tr>
            </table>
          </td>
        </tr>


        <tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0" style="width: 100%; border-collapse: collapse;" cellpadding="0" cellspacing="0">
              <tr>
                <td width="11%" valign="top">
                  <span class="blackBoldText">Exam</span>
                </td>
                <td colspan="5">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="30%">
                        <span class="smallGrayText">
                          <strong>
                            Clinician Performing Initial Exam:
                          </strong>
                        </span>
                      </td>
                      <td width="12%">
                        <span class="smallGrayText">
                           <xsl:choose>
                            <xsl:when test="(NoTable/Exam_Clinician_PANP != '')">
                              <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" align="absmiddle" />
                            </xsl:when>
                            <xsl:otherwise>
                              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />
                            </xsl:otherwise>
                          </xsl:choose><strong>NP / PA</strong>
                        </span>
                      </td>
                      <td>
                        <span class="smallGrayText">
                          Attending must repeat and document
                          findings.&#160;
                        </span>
                      </td>
                    </tr>
                    <tr>
                      <td>&#160;</td>
                      <td>
                        <span class="smallGrayText">
                          <xsl:choose>
                            <xsl:when test="(NoTable/Exam_Clinician_Fellow != '')">
                              <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" align="absmiddle" />
                            </xsl:when>
                            <xsl:otherwise>
                              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />
                            </xsl:otherwise>
                          </xsl:choose><strong>Fellow</strong>
                        </span>
                      </td>
                      <td>
                        <span class="smallGrayText">
                          Attending must repeat and document
                          <span style="font-weight: bold; text-decoration: underline;">critical</span> findings.
                        </span>
                      </td>
                    </tr>
                    <tr>
                      <td>&#160;</td>
                      <td>
                        <span class="smallGrayText">
                          <xsl:choose>
                            <xsl:when test="(NoTable/Exam_Clinician_Attending != '')">
                              <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" align="absmiddle" />
                            </xsl:when>
                            <xsl:otherwise>
                              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />
                            </xsl:otherwise>
                          </xsl:choose><strong>Attending</strong>
                        </span>
                      </td>
                      <td>&#160;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td  align="center" class="FormInsideTableTopLeftCell">
                  <strong>System</strong>
                </td>
                <td colspan="2" align="center" class="FormInsideTableTopCell">
                  <strong>
                    Normal
                    Findings
                  </strong>
                </td>
                <td align="center" class="FormInsideTableTopCell">
                  <strong>Abnormal</strong>
                </td>
                <td  align="center" class="FormInsideTableTopCell">
                  <strong>
                    Attnd<br/>
                    Performed
                  </strong>
                </td>
                <td width="40%" align="center" class="FormInsideTableTopCell">
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
                      <td align="center" valign="middle" class="FormInsideTableRegCell" style="border-right: none;">
                        <xsl:value-of select="Exam"  />&#160;
                      </td>


                      <!--Choose Exam Result and modify format of display-->
                      <xsl:choose>
                        <xsl:when test="(ExamResult='Abnormal')">
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                          </td>
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" vspace="1" />
                          </td>
                        </xsl:when>
                        <xsl:when test="(ExamResult='Normal')">
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" vspace="1" />
                          </td>
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                          </td>
                        </xsl:when>
                        <xsl:when test="(ExamResult='Not Done')">
                          <td colspan="2" align="center" class="FormInsideTableRegCell">
                            <i>*Not Done*</i>&#160;
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td colspan="2" align="center" class="FormInsideTableRegCell">
                            <xsl:value-of select="ROS_Result"  />&#160;
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>


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
          <tr>
            <td class="FormOuterTableRow">
              <style type="text/css">
                table.DREHistoryTable
                {
                border-spacing: 0;
                table-layout: fixed;
                }
                table.DREHistoryTable td:first-child { width: 15%; }
                table.DREHistoryTable td:nth-child(2) { width: 25%; }
                table.DREHistoryTable td:nth-child(3) { width: 60%; }
              </style>

              <span class="blackBoldText">Rectal Exam</span>
              <table class="PaperFormDataTable DREHistoryTable" cellspacing="0" id="DREHistoryTable" >
                <tr>
                  <td style="width: 15%;" >Date</td>
                  <td style="width: 25%;" >2002 Clinical Stage</td>
                  <td style="width: 60%;">Findings</td>
                </tr>
              </table>
            </td>
          </tr>

        <xsl:for-each select="$ActiveSurveillanceRectalExamHistory/Encounters">
          <tr>
            <td class="FormOuterTableRow">
              <table class="PaperFormDataTable DREHistoryTable" cellspacing="0" >
                <tr >
                  <td style="width: 15%;" >
                    <xsl:value-of select="EncDateText"  />&#160;
                  </td>
                  <td style="width: 25%;" >
                    <xsl:value-of select="ClinStage"  />&#160;
                  </td>
                  <td style="width: 60%; padding: 0px;" >
                    <xsl:value-of select="FindingsHTML" disable-output-escaping="yes"  />&#160;
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </xsl:for-each>

<!-- -->
                      <xsl:for-each select="Encounters">
                        <tr>
                          <td class="FormOuterTableRow">
                            <table class="PaperFormDataTable DREHistoryTable" cellspacing="0" >
                  <tr>
                    <td style="width: 15%;">
                      <xsl:value-of select="EncDateText"  />
                    </td>
                    <td style="width: 25%;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('ClinStageT', 'RectalExamHistory')">

                      <xsl:choose>
                        <xsl:when test="(../ClinicalStages/ClinStageT !='')">
                          <span style="font-weight: bold;">
                              <xsl:value-of select="../ClinicalStages/ClinStageT"  />
                          </span>
                        </xsl:when>
                        <xsl:otherwise>T____</xsl:otherwise>
                      </xsl:choose>
                      <xsl:choose>
                        <xsl:when test="(../ClinicalStages/ClinStageN !='')">
                          <span style="font-weight: bold; margin-left: 12px;">
                              <xsl:value-of select="../ClinicalStages/ClinStageN"  />
                          </span>
                        </xsl:when>
                        <xsl:otherwise>N____</xsl:otherwise>
                      </xsl:choose>
                      <xsl:choose>
                        <xsl:when test="(../ClinicalStages/ClinStageM !='')">
                          <span style="font-weight: bold; margin-left: 12px;">
                              <xsl:value-of select="../ClinicalStages/ClinStageM"  />
                          </span>
                        </xsl:when>
                        <xsl:otherwise>M____</xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td style="width: 60%;">



                      <table class="EFormTable" cellspacing="0">
                        <tr class="EFormTableRow">
                          <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                            <strong>Side</strong>
                          </td>
                          <!--<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Laterality</strong></td>-->
                          <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Level</strong>
                          </td>
                          <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Cancer (1-5)</strong>
                          </td>
                          <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>ECE (1-5)</strong>
                          </td>
                        </tr>
                        <xsl:for-each select="./EncRectalExams/EncRectalExamFindings">
                          <xsl:choose>
                            <xsl:when test="((DRE_FindSide != '') or (DRE_FindLaterality != '') or (DRE_FindLevel != '') or (DRE_FindResult != '') or (DRE_FindExtension != ''))">
                              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncRectalExamFindings',{./@RecordId})">
                                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                                  <xsl:value-of select="DRE_FindSide"  />&#160;
                                </td>
                                <!--<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DRE_FindLaterality"  />&#160;</td>-->
                                <td align="center" valign="middle" class="FormInsideTableRegCell">
                                  <xsl:value-of select="DRE_FindLevel"  />&#160;
                                </td>
                                <td align="center" valign="middle" class="FormInsideTableRegCell">
                                  <xsl:value-of select="DRE_FindResult"  />&#160;
                                </td>
                                <td align="center" valign="middle" class="FormInsideTableRegCell">
                                  <xsl:value-of select="DRE_FindExtension"  />&#160;
                                </td>
                              </tr>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </table>
                    </td>
                    
                  </tr>


                            </table>
                          </td>
                        </tr>
                </xsl:for-each>
<!-- -->

          <tr>
            <td class="FormOuterTableRow" style="padding: 20px 4px 20px 4px;"  onmouseover="this.className='FormOuterTableRow chronListHilighted';" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByTable('Status','')">
              <span class="blackBoldText" style="display: inline-block; width: 120px;">Disease State</span>

              <xsl:choose>
                <xsl:when test="((Status[@RecordId=1]/StatusDateText != '') or (Status[@RecordId=1]/Status != ''))">
                  <span style="display: inline-block; width: 150px;">Status:&#160;<xsl:value-of select="Status[@RecordId=1]/Status"  /></span>
                  <span >Date:&#160;<xsl:value-of select="Status[@RecordId=1]/StatusDateText"  /></span>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="NED2"/>
                  Stable<img src="../../Images/shim.gif" border="0" width="20" height="1"/>
                  <input type="checkbox" name="DiseaseProgression"/>
                  Disease Progression<img src="../../Images/shim.gif" border="0" width="20" height="1"/>
                  <input type="checkbox" name="Mets"/>
                  Mets<img src="../../Images/shim.gif" border="0" width="20" height="1"/>Date: __________________
                </xsl:otherwise>
              </xsl:choose>              
        </td>
          </tr>
          <tr >
            <td height="14" align="center" valign="bottom" class="blackBoldText">
              GU47<img src="../../Images/shim.gif" border="0" width="45" height="1" />
              U54<img src="../../Images/shim.gif" border="0" width="45" height="1" />
              CMIC
              Approval Date: 6/17/2014<img src="../../Images/shim.gif" border="0" width="45" height="8"/>rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="8" />
              Page <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
            </td>
          </tr>
        </table>
      </div>


    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td style="text-align:center; font-size: smaller;">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY</td></tr>


        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <xsl:call-template name="EncounterDatePhysician"/>
        <!-- 
        <tr>
            <td class="FormOuterTableRow">
              <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
                <tr>
                  <td colspan="3" class="blackBoldText">Impression &amp; Plan </td>
                </tr>
                <tr>
                  <td align="center" class="FormInsideTableTopCell">
                    <strong>Diagnoses/Problem List</strong>
                  </td>
                  <td colspan="2" align="center" class="FormInsideTableTopCell">
                    <strong>
                      Plan
                      &amp; Referrals
                    </strong>
                  </td>
                </tr>
                <tr>
                  <td width="50%" height="84" valign="top" class="FormInsideTableRegCell">1.</td>
                  <td width="28%" class="FormInsideTableRegCell">&#160;</td>
                  <td valign="top" class="FormInnerRowBottomBorder">
                    <input type="checkbox" name="GNRH22" value="Yes" />
                    Sexual Med Consult<br />
                    <input type="checkbox" name="GNRH23" value="Yes" />
                    Rad Tx Consult<br />
                    <input type="checkbox" name="GNRH24" value="Yes" />
                    Med Oncology Consult<br />
                    <input type="checkbox" name="surgicalConsult" value="Yes" />
                    Surgical Consult
                  </td>
                </tr>
                <tr>
                  <td height="84" valign="top" class="FormInsideTableRegCell">2.</td>
                  <td colspan="2" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td height="84" valign="top" class="FormInsideTableRegCell">3.</td>
                  <td colspan="2" class="FormInsideTableRegCell">&#160;</td>
                </tr>
                <tr>
                  <td height="84" valign="top" class="FormInsideTableRegCell">4.</td>
                  <td colspan="2" class="FormInsideTableRegCell">&#160;</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
              <input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" /> Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.
            </td>
          </tr>
          <tr>
            <td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
              <input type="checkbox" name="informedConsent" style="vertical-align: middle;" /> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.
            </td>
          </tr>
          <tr>
            <td class="FormOuterTableRow">
              <table class="pageWidth" align="center" border="0" cellpadding="4" cellspacing="0">
                <tr>
                  <td colspan="2" class="FormInnerRowBottomBorder">
                    <span class="blackBoldText">Disposition</span>
                  </td>
                </tr>
                <tr>
                  <td width="69%" align="center" class="FormInnerRowRightBorder">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="20%" height="26">Prescriptions:</td>
                        <td width="20%" align="left">
                          No<img src="../../Images/shim.gif" border="0" width="22" height="1" />Yes:
                        </td>
                        <td>Refill &#160;&#160;or &#160;&#160;New</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="3">Rx: __________________________________________________________</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="3">Rx: __________________________________________________________</td>
                      </tr>
                    </table>
                  </td>
                  <td width="31%" align="center">
                    <span>Protocol #: ________</span>
                    <br />
                    <table align="left" width="100%">
                      <tr>
                        <td>Considered:</td>
                        <td align="center">
                          Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No
                        </td>
                      </tr>
                      <tr>
                        <td>Consent Obtained:</td>
                        <td align="center">
                          Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No
                        </td>
                      </tr>
                      <tr>
                        <td>Registered:</td>
                        <td align="center">
                          Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No
                        </td>
                      </tr>
                    </table>
                    <br />
                    <br />
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td valign="top" class="FormOuterTableRow">
              <table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
                <tr>
                  <td width="50%" valign="top" class="FormInnerRowRightBorder">
                    <input type="checkbox" name="50% of Time22"/>
                      &#8805; 50% of attending time was spent in counseling <br/> <img src="../../Images/shim.gif" border="0" width="1" height="15"/>
                        If so, mark total attending time in minutes &amp; describe on right:<br/>
                        <img src="../../Images/shim.gif" border="0" width="30" height="12"/>
                          <input type="checkbox" name="15-24 (3)22"/>
                            15-24 (3)&#160;&#160;&#160;
                            <input type="checkbox" name="25-39 (4)22"/>
                              25-39 (4)&#160;&#160;&#160;
                              <input type="checkbox" name="40+ (5)22"/>
              40+ (5)</td>
                  <td width="50%" height="100" valign="top">
                    <img src="../../Images/shim.gif" border="0" width="1" height="11"/>
                      Describe
                      Counseling or Dictate Note:<br/> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&#160;</td>
                        </tr>
                        <tr>
                          <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&#160;</td>
                        </tr>
                        <tr>
                          <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&#160;</td>
                        </tr>
                        <tr>
                          <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&#160;</td>
                        </tr>
                        <tr>
                          <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&#160;</td>
                        </tr>
                      </table>
                    </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td valign="top" class="FormOuterTableRow">
              <table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
                <tr>
                  <td width="50%" height="32" class="FormInnerRowRightBorder">
                    Circle
                    Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1"/>
                      1<img src="../../Images/shim.gif" border="0" width="22" height="1" />
                      2<img src="../../Images/shim.gif" border="0" width="22" height="1" />
                      3<img src="../../Images/shim.gif" border="0" width="22" height="1" />
                      4<img src="../../Images/shim.gif" border="0" width="22" height="1" />5
                    </td>
                  <td rowspan="2" align="right" valign="top">Copy to:</td>
                  <td width="43%" rowspan="2" valign="top">
                    <input name="fellow222" type="checkbox" id="fellow223" />
                    referring M.D.: ________________________<br />
                    <input name="fellow2222" type="checkbox" id="fellow2222" />
                    other: _______________________________
                  </td>
                </tr>
                <tr>
                  <td height="32" class="FormInnerRowRightBorder">
                    Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1" />
                    Fellow/
                    Resident<img src="../../Images/shim.gif" border="0" width="30" height="1" />Attending
                  </td>
                </tr>
              </table>
            </td>
          </tr>
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
                        <td style="vertical-align: top;padding-top: 6px;">
                          <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                        </td>
                        <td style="vertical-align: top;">
                          I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.
                        </td>
                      </tr>
                      <tr>
                        <td colspan="2" style="padding-top: 20px; text-align: center;">
                          <span class="blackBoldText">
                            Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span>
                          </span>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
-->


        <!--Problem Plan-->
        <xsl:call-template name="ProblemPlanTable"/>
        



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
                          <img src="../../Images/shim.gif" border="0" width="35" height="1" />Date: <span class="signedForm_date">____/____/____</span><img src="../../Images/shim.gif" border="0" width="32" height="1" />Time: <span class="signedForm_time">
                            ___:____ <span style="font-size: 9px;">AM / PM </span>
                          </span>
                        </span>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        
        
          <tr >
            <td height="14" align="center" valign="bottom" class="blackBoldText">
              GU47<img src="../../Images/shim.gif" border="0" width="45" height="1" />
              U54<img src="../../Images/shim.gif" border="0" width="45" height="1" />
              CMIC
              Approval Date: 6/17/2014<img src="../../Images/shim.gif" border="0" width="45" height="8"/>rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="8" />
              Page <span id="PageNumber">4</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
            </td>
          </tr>
        </table>
      </div>



  </xsl:template>
</xsl:stylesheet>
